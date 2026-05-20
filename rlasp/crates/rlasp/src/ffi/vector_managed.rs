/// Vector wrapper using handle-based memory management
///
/// This version demonstrates proper GC integration with:
/// - Handle table for foreign object tracking
/// - Automatic finalization via Drop
/// - Safe access to C++ objects
use crate::runtime::{deref_handle, register_foreign_object, Handle};

pub struct VectorManaged {
    handle: Handle,
}

impl VectorManaged {
    pub fn new(x: f64, y: f64) -> Self {
        let ptr = unsafe { vector_new(x, y) };

        // Register with finalizer
        let handle = register_foreign_object(
            ptr,
            Some(Box::new(|ptr| {
                unsafe { vector_delete(ptr) };
            })),
        );

        Self { handle }
    }

    pub fn get_x(&self) -> f64 {
        let ptr = deref_handle(self.handle).expect("Invalid handle");
        unsafe { vector_getX(ptr) }
    }

    pub fn get_y(&self) -> f64 {
        let ptr = deref_handle(self.handle).expect("Invalid handle");
        unsafe { vector_getY(ptr) }
    }

    pub fn set_x(&mut self, x: f64) {
        let ptr = deref_handle(self.handle).expect("Invalid handle");
        unsafe { vector_setX(ptr, x) };
    }

    pub fn set_y(&mut self, y: f64) {
        let ptr = deref_handle(self.handle).expect("Invalid handle");
        unsafe { vector_setY(ptr, y) };
    }

    pub fn length(&self) -> f64 {
        let ptr = deref_handle(self.handle).expect("Invalid handle");
        unsafe { vector_length(ptr) }
    }

    pub fn add(&self, other: &VectorManaged) -> VectorManaged {
        let ptr1 = deref_handle(self.handle).expect("Invalid handle");
        let ptr2 = deref_handle(other.handle).expect("Invalid handle");
        let result_ptr = unsafe { vector_add(ptr1, ptr2) };

        let handle = register_foreign_object(
            result_ptr,
            Some(Box::new(|ptr| {
                unsafe { vector_delete(ptr) };
            })),
        );

        VectorManaged { handle }
    }
}

// Note: Drop is handled automatically by the handle table finalizer
// No need for explicit Drop impl

extern "C" {
    fn vector_new(x: f64, y: f64) -> *mut ();
    fn vector_delete(ptr: *mut ());
    fn vector_getX(ptr: *const ()) -> f64;
    fn vector_getY(ptr: *const ()) -> f64;
    fn vector_setX(ptr: *mut (), x: f64);
    fn vector_setY(ptr: *mut (), y: f64);
    fn vector_length(ptr: *const ()) -> f64;
    fn vector_add(ptr: *const (), other: *const ()) -> *mut ();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_managed_vector_basic() {
        let v = VectorManaged::new(3.0, 4.0);
        assert_eq!(v.get_x(), 3.0);
        assert_eq!(v.get_y(), 4.0);
        assert_eq!(v.length(), 5.0);
    }

    #[test]
    fn test_managed_vector_mutate() {
        let mut v = VectorManaged::new(1.0, 2.0);
        v.set_x(5.0);
        v.set_y(12.0);
        assert_eq!(v.get_x(), 5.0);
        assert_eq!(v.get_y(), 12.0);
        assert_eq!(v.length(), 13.0);
    }

    #[test]
    fn test_managed_vector_add() {
        let v1 = VectorManaged::new(1.0, 2.0);
        let v2 = VectorManaged::new(3.0, 4.0);
        let v3 = v1.add(&v2);
        assert_eq!(v3.get_x(), 4.0);
        assert_eq!(v3.get_y(), 6.0);
    }

    #[test]
    fn test_managed_vector_cleanup() {
        // Create many vectors - handles should clean them up
        for i in 0..100 {
            let v = VectorManaged::new(i as f64, i as f64);
            let _ = v.length();
        }
        // All vectors should be cleaned up when they go out of scope
    }
}
