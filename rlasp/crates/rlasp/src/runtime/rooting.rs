/// GC rooting mechanism
///
/// Protects Lisp objects from garbage collection while they're being used
/// from Rust code or FFI boundaries.
///
/// Pattern similar to Clasp's gctools::smart_ptr and rooting system.
use super::object::LispObject;
use std::collections::HashMap;
use std::sync::{Arc, Mutex};

/// A GC root that prevents an object from being collected
pub struct Root {
    object: LispObject,
    _marker: std::marker::PhantomData<*const ()>, // !Send + !Sync
}

impl Root {
    /// Create a new root for the given object
    pub fn new(object: LispObject) -> Self {
        register_root(object);
        Self {
            object,
            _marker: std::marker::PhantomData,
        }
    }

    /// Get the underlying object
    pub fn get(&self) -> LispObject {
        self.object
    }
}

impl Drop for Root {
    fn drop(&mut self) {
        unregister_root(self.object);
    }
}

impl Clone for Root {
    fn clone(&self) -> Self {
        Self::new(self.object)
    }
}

/// Thread-local root set with reference counting
///
/// In a real implementation, this would be per-thread. For now, we use
/// a global mutex-protected map for simplicity.
lazy_static::lazy_static! {
    static ref ROOT_SET: Arc<Mutex<HashMap<LispObject, usize>>> = Arc::new(Mutex::new(HashMap::new()));
}

/// Register an object as a GC root
fn register_root(object: LispObject) {
    let mut roots = ROOT_SET.lock().unwrap();
    *roots.entry(object).or_insert(0) += 1;
}

/// Unregister an object as a GC root
fn unregister_root(object: LispObject) {
    let mut roots = ROOT_SET.lock().unwrap();
    if let Some(count) = roots.get_mut(&object) {
        *count -= 1;
        if *count == 0 {
            roots.remove(&object);
        }
    }
}

/// Get all currently rooted objects (for GC tracing)
pub fn get_roots() -> Vec<LispObject> {
    ROOT_SET.lock().unwrap().keys().copied().collect()
}

/// Clear all roots (for testing only)
#[cfg(test)]
pub fn clear_roots() {
    ROOT_SET.lock().unwrap().clear();
}

/// Scoped root that automatically unregisters on drop
///
/// Use this for temporary protection during FFI calls:
/// ```ignore
/// let _root = ScopedRoot::new(obj);
/// call_c_function_that_might_trigger_gc();
/// // obj is protected until _root goes out of scope
/// ```
pub type ScopedRoot = Root;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_root_lifecycle() {
        clear_roots();

        let obj = LispObject::nil();
        assert_eq!(get_roots().len(), 0);

        {
            let _root = Root::new(obj);
            assert_eq!(get_roots().len(), 1);
            assert!(get_roots().contains(&obj));
        }

        assert_eq!(get_roots().len(), 0);
    }

    #[test]
    fn test_multiple_roots() {
        clear_roots();

        let obj1 = LispObject::from_fixnum(1);
        let obj2 = LispObject::from_fixnum(2);
        let obj3 = LispObject::from_fixnum(3);

        let _r1 = Root::new(obj1);
        let _r2 = Root::new(obj2);
        let _r3 = Root::new(obj3);

        let roots = get_roots();
        assert_eq!(roots.len(), 3);
        assert!(roots.contains(&obj1));
        assert!(roots.contains(&obj2));
        assert!(roots.contains(&obj3));
    }

    #[test]
    fn test_root_clone() {
        clear_roots();

        let obj = LispObject::from_fixnum(42);
        let r1 = Root::new(obj);
        let r2 = r1.clone();

        // Both roots of same object = 1 entry with ref count 2
        let roots = get_roots();
        assert_eq!(roots.len(), 1);

        drop(r1);
        // Still rooted because r2 exists (ref count = 1)
        assert_eq!(get_roots().len(), 1);

        drop(r2);
        // Now unrooted (ref count = 0)
        assert_eq!(get_roots().len(), 0);
    }

    #[test]
    fn test_scoped_root() {
        clear_roots();

        let obj = LispObject::from_fixnum(100);

        {
            let _root = ScopedRoot::new(obj);
            assert_eq!(get_roots().len(), 1);
            // Simulating FFI call that might trigger GC
            // Object is protected here
        }

        // After scope, root is automatically released
        assert_eq!(get_roots().len(), 0);
    }
}
