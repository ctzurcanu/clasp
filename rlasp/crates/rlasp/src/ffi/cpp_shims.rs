/// Bindings to manually-written C++ shims
use super::{CCall, CCallArg, CFuncRef, CType};
use std::ffi::CString;

/// TestClass wrapper - exposes C++ class through CFFI machinery
pub struct TestClassWrapper {
    ptr: *mut (),
}

impl TestClassWrapper {
    /// Create a new TestClass instance
    pub fn new(value: i32, name: &str) -> Result<Self, String> {
        let name_cstr = CString::new(name).map_err(|e| e.to_string())?;

        let ctor_func = CFuncRef::new(
            "test_class_new",
            test_class_new as *const (),
            CType::Pointer(Box::new(CType::Void)),
            vec![CType::Int32, CType::Pointer(Box::new(CType::Int8))],
            false,
        );

        let call = CCall::new(
            ctor_func,
            vec![
                CCallArg::Int64(value as i64),
                CCallArg::Pointer(name_cstr.as_ptr() as *const ()),
            ],
        );

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Pointer(ptr)) => {
                if ptr.is_null() {
                    Err("Failed to create TestClass".to_string())
                } else {
                    Ok(Self {
                        ptr: ptr as *mut (),
                    })
                }
            }
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }

    /// Get the value
    pub fn get_value(&self) -> Result<i32, String> {
        let func = CFuncRef::new(
            "test_class_get_value",
            test_class_get_value as *const (),
            CType::Int32,
            vec![CType::Pointer(Box::new(CType::Void))],
            false,
        );

        let call = CCall::new(func, vec![CCallArg::Pointer(self.ptr as *const ())]);

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Int64(v)) => Ok(v as i32),
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }

    /// Set the value
    pub fn set_value(&mut self, value: i32) -> Result<(), String> {
        let func = CFuncRef::new(
            "test_class_set_value",
            test_class_set_value as *const (),
            CType::Void,
            vec![CType::Pointer(Box::new(CType::Void)), CType::Int32],
            false,
        );

        let call = CCall::new(
            func,
            vec![
                CCallArg::Pointer(self.ptr as *const ()),
                CCallArg::Int64(value as i64),
            ],
        );

        match super::lower_ccall(&call) {
            Ok(_) => Ok(()),
            Err(e) => Err(e),
        }
    }

    /// Add to the value
    pub fn add(&self, x: i32) -> Result<i32, String> {
        let func = CFuncRef::new(
            "test_class_add",
            test_class_add as *const (),
            CType::Int32,
            vec![CType::Pointer(Box::new(CType::Void)), CType::Int32],
            false,
        );

        let call = CCall::new(
            func,
            vec![
                CCallArg::Pointer(self.ptr as *const ()),
                CCallArg::Int64(x as i64),
            ],
        );

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Int64(v)) => Ok(v as i32),
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }

    /// Static method: multiply two numbers
    pub fn multiply(a: i32, b: i32) -> Result<i32, String> {
        let func = CFuncRef::new(
            "test_class_multiply",
            test_class_multiply as *const (),
            CType::Int32,
            vec![CType::Int32, CType::Int32],
            false,
        );

        let call = CCall::new(
            func,
            vec![CCallArg::Int64(a as i64), CCallArg::Int64(b as i64)],
        );

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Int64(v)) => Ok(v as i32),
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }
}

impl Drop for TestClassWrapper {
    fn drop(&mut self) {
        let func = CFuncRef::new(
            "test_class_delete",
            test_class_delete as *const (),
            CType::Void,
            vec![CType::Pointer(Box::new(CType::Void))],
            false,
        );

        let call = CCall::new(func, vec![CCallArg::Pointer(self.ptr as *const ())]);

        let _ = super::lower_ccall(&call);
    }
}

// Declare external C functions (linked from compiled shims)
extern "C" {
    fn test_class_new(value: i32, name: *const libc::c_char) -> *mut ();
    fn test_class_delete(ptr: *mut ());
    fn test_class_get_value(ptr: *const ()) -> i32;
    fn test_class_set_value(ptr: *mut (), value: i32);
    fn test_class_add(ptr: *const (), x: i32) -> i32;
    fn test_class_multiply(a: i32, b: i32) -> i32;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cpp_class_wrapper() {
        let mut obj = TestClassWrapper::new(42, "test").expect("Failed to create");

        assert_eq!(obj.get_value().unwrap(), 42);

        obj.set_value(100).unwrap();
        assert_eq!(obj.get_value().unwrap(), 100);

        assert_eq!(obj.add(10).unwrap(), 110);

        assert_eq!(TestClassWrapper::multiply(6, 7).unwrap(), 42);
    }
}
