/// Auto-generated wrapper for Vector class using generated shims
use super::{CCall, CCallArg, CFuncRef, CType};

pub struct VectorWrapper {
    ptr: *mut (),
}

impl VectorWrapper {
    pub fn new(x: f64, y: f64) -> Result<Self, String> {
        let ctor_func = CFuncRef::new(
            "vector_new",
            vector_new as *const (),
            CType::Pointer(Box::new(CType::Void)),
            vec![CType::Double, CType::Double],
            false,
        );

        let call = CCall::new(ctor_func, vec![CCallArg::Double(x), CCallArg::Double(y)]);

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Pointer(ptr)) => {
                if ptr.is_null() {
                    Err("Failed to create Vector".to_string())
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

    pub fn get_x(&self) -> Result<f64, String> {
        let func = CFuncRef::new(
            "vector_getX",
            vector_getX as *const (),
            CType::Double,
            vec![CType::Pointer(Box::new(CType::Void))],
            false,
        );

        let call = CCall::new(func, vec![CCallArg::Pointer(self.ptr as *const ())]);

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Double(v)) => Ok(v),
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }

    pub fn get_y(&self) -> Result<f64, String> {
        let func = CFuncRef::new(
            "vector_getY",
            vector_getY as *const (),
            CType::Double,
            vec![CType::Pointer(Box::new(CType::Void))],
            false,
        );

        let call = CCall::new(func, vec![CCallArg::Pointer(self.ptr as *const ())]);

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Double(v)) => Ok(v),
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }

    pub fn length(&self) -> Result<f64, String> {
        let func = CFuncRef::new(
            "vector_length",
            vector_length as *const (),
            CType::Double,
            vec![CType::Pointer(Box::new(CType::Void))],
            false,
        );

        let call = CCall::new(func, vec![CCallArg::Pointer(self.ptr as *const ())]);

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Double(v)) => Ok(v),
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }

    pub fn add(&self, other: &VectorWrapper) -> Result<VectorWrapper, String> {
        let func = CFuncRef::new(
            "vector_add",
            vector_add as *const (),
            CType::Pointer(Box::new(CType::Void)),
            vec![
                CType::Pointer(Box::new(CType::Void)),
                CType::Pointer(Box::new(CType::Void)),
            ],
            false,
        );

        let call = CCall::new(
            func,
            vec![
                CCallArg::Pointer(self.ptr as *const ()),
                CCallArg::Pointer(other.ptr as *const ()),
            ],
        );

        match super::lower_ccall(&call) {
            Ok(super::CCallResult::Pointer(ptr)) => {
                if ptr.is_null() {
                    Err("Failed to create result Vector".to_string())
                } else {
                    Ok(VectorWrapper {
                        ptr: ptr as *mut (),
                    })
                }
            }
            Ok(_) => Err("Unexpected return type".to_string()),
            Err(e) => Err(e),
        }
    }
}

impl Drop for VectorWrapper {
    fn drop(&mut self) {
        let func = CFuncRef::new(
            "vector_delete",
            vector_delete as *const (),
            CType::Void,
            vec![CType::Pointer(Box::new(CType::Void))],
            false,
        );

        let call = CCall::new(func, vec![CCallArg::Pointer(self.ptr as *const ())]);
        let _ = super::lower_ccall(&call);
    }
}

extern "C" {
    fn vector_new(x: f64, y: f64) -> *mut ();
    fn vector_delete(ptr: *mut ());
    fn vector_getX(ptr: *const ()) -> f64;
    fn vector_getY(ptr: *const ()) -> f64;
    fn vector_length(ptr: *const ()) -> f64;
    fn vector_add(ptr: *const (), other: *const ()) -> *mut ();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vector_wrapper() {
        let v1 = VectorWrapper::new(3.0, 4.0).expect("Failed to create v1");
        assert_eq!(v1.get_x().unwrap(), 3.0);
        assert_eq!(v1.get_y().unwrap(), 4.0);
        assert_eq!(v1.length().unwrap(), 5.0);

        let v2 = VectorWrapper::new(1.0, 2.0).expect("Failed to create v2");
        let v3 = v1.add(&v2).expect("Failed to add");

        assert_eq!(v3.get_x().unwrap(), 4.0);
        assert_eq!(v3.get_y().unwrap(), 6.0);
    }
}
