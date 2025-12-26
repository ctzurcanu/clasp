/// Handle table for managing foreign (C/C++) objects
///
/// Provides:
/// - Reference counting for foreign objects
/// - Safe access to foreign pointers
/// - Finalizers for cleanup
/// - Protection from double-free and use-after-free

use std::collections::HashMap;
use std::sync::{Arc, Mutex};

/// Unique identifier for a foreign object handle
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Handle(usize);

/// Finalizer function called when object is dropped
type Finalizer = Box<dyn FnOnce(*mut ()) + Send>;

/// Entry in the handle table
struct HandleEntry {
    ptr: *mut (),
    finalizer: Option<Finalizer>,
    ref_count: usize,
}

// Safety: We ensure proper synchronization via Mutex
unsafe impl Send for HandleEntry {}

/// Global handle table
pub struct HandleTable {
    entries: HashMap<Handle, HandleEntry>,
    next_id: usize,
}

impl HandleTable {
    fn new() -> Self {
        Self {
            entries: HashMap::new(),
            next_id: 1,
        }
    }

    /// Register a foreign object pointer
    pub fn register(&mut self, ptr: *mut (), finalizer: Option<Finalizer>) -> Handle {
        assert!(!ptr.is_null(), "Cannot register null pointer");

        let handle = Handle(self.next_id);
        self.next_id += 1;

        self.entries.insert(handle, HandleEntry {
            ptr,
            finalizer,
            ref_count: 1,
        });

        handle
    }

    /// Increment reference count
    pub fn retain(&mut self, handle: Handle) {
        if let Some(entry) = self.entries.get_mut(&handle) {
            entry.ref_count += 1;
        }
    }

    /// Decrement reference count and run finalizer if ref_count reaches 0
    pub fn release(&mut self, handle: Handle) {
        if let Some(entry) = self.entries.get_mut(&handle) {
            entry.ref_count -= 1;
            if entry.ref_count == 0 {
                // Remove entry and run finalizer
                let entry = self.entries.remove(&handle).unwrap();
                if let Some(finalizer) = entry.finalizer {
                    finalizer(entry.ptr);
                }
            }
        }
    }

    /// Get pointer for a handle (if valid)
    pub fn get(&self, handle: Handle) -> Option<*mut ()> {
        self.entries.get(&handle).map(|e| e.ptr)
    }

    /// Check if handle is valid
    pub fn is_valid(&self, handle: Handle) -> bool {
        self.entries.contains_key(&handle)
    }
}

/// Thread-safe global handle table
lazy_static::lazy_static! {
    static ref GLOBAL_HANDLES: Arc<Mutex<HandleTable>> = Arc::new(Mutex::new(HandleTable::new()));
}

/// Register a foreign object and get a handle
pub fn register_foreign_object(ptr: *mut (), finalizer: Option<Finalizer>) -> Handle {
    GLOBAL_HANDLES.lock().unwrap().register(ptr, finalizer)
}

/// Increment handle reference count
pub fn retain_handle(handle: Handle) {
    GLOBAL_HANDLES.lock().unwrap().retain(handle);
}

/// Decrement handle reference count (runs finalizer if ref_count reaches 0)
pub fn release_handle(handle: Handle) {
    GLOBAL_HANDLES.lock().unwrap().release(handle);
}

/// Get pointer from handle
pub fn deref_handle(handle: Handle) -> Option<*mut ()> {
    GLOBAL_HANDLES.lock().unwrap().get(handle)
}

/// Check if handle is valid
pub fn is_valid_handle(handle: Handle) -> bool {
    GLOBAL_HANDLES.lock().unwrap().is_valid(handle)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_handle_lifecycle() {
        let mut table = HandleTable::new();

        let test_val = Box::into_raw(Box::new(42i32)) as *mut ();
        let handle = table.register(test_val, None);

        assert!(table.is_valid(handle));
        assert_eq!(table.get(handle), Some(test_val));

        table.release(handle);
        assert!(!table.is_valid(handle));
    }

    #[test]
    fn test_ref_counting() {
        let mut table = HandleTable::new();

        let test_val = Box::into_raw(Box::new(42i32)) as *mut ();
        let handle = table.register(test_val, None);

        table.retain(handle);
        table.retain(handle);

        table.release(handle);
        assert!(table.is_valid(handle)); // Still 2 refs

        table.release(handle);
        assert!(table.is_valid(handle)); // Still 1 ref

        table.release(handle);
        assert!(!table.is_valid(handle)); // Now freed
    }

    #[test]
    fn test_finalizer() {
        use std::sync::atomic::{AtomicBool, Ordering};

        let finalized = Arc::new(AtomicBool::new(false));
        let finalized_clone = finalized.clone();

        let mut table = HandleTable::new();
        let test_val = Box::into_raw(Box::new(42i32)) as *mut ();

        let finalizer = Box::new(move |ptr: *mut ()| {
            // Free the memory
            unsafe { drop(Box::from_raw(ptr as *mut i32)) };
            finalized_clone.store(true, Ordering::SeqCst);
        });

        let handle = table.register(test_val, Some(finalizer));
        assert!(!finalized.load(Ordering::SeqCst));

        table.release(handle);
        assert!(finalized.load(Ordering::SeqCst));
    }

    #[test]
    fn test_global_table() {
        let test_val = Box::into_raw(Box::new(100i32)) as *mut ();

        let handle = register_foreign_object(test_val, Some(Box::new(|ptr| {
            unsafe { drop(Box::from_raw(ptr as *mut i32)) };
        })));

        assert!(is_valid_handle(handle));
        assert_eq!(deref_handle(handle), Some(test_val));

        retain_handle(handle);
        release_handle(handle);
        assert!(is_valid_handle(handle));

        release_handle(handle);
        assert!(!is_valid_handle(handle));
    }
}
