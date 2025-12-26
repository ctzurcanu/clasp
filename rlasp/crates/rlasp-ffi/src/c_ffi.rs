//! Foreign function calling via libffi
//!
//! Allows dynamic calls to C functions at runtime

use crate::types::{FromLisp, ToLisp, TypeError};
use rlasp_runtime::LispObject;
use std::ffi::c_void;
use libffi::middle::*;

/// Foreign function signature
#[derive(Debug, Clone)]
pub struct ForeignSignature {
    pub return_type: ForeignType,
    pub param_types: Vec<ForeignType>,
}

/// Foreign type descriptors
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ForeignType {
    Void,
    Int8,
    UInt8,
    Int16,
    UInt16,
    Int32,
    UInt32,
    Int64,
    UInt64,
    Float,
    Double,
    Pointer,
}

impl ForeignType {
    /// Convert to libffi Type
    fn to_ffi_type(self) -> Type {
        match self {
            ForeignType::Void => Type::void(),
            ForeignType::Int8 => Type::i8(),
            ForeignType::UInt8 => Type::u8(),
            ForeignType::Int16 => Type::i16(),
            ForeignType::UInt16 => Type::u16(),
            ForeignType::Int32 => Type::i32(),
            ForeignType::UInt32 => Type::u32(),
            ForeignType::Int64 => Type::i64(),
            ForeignType::UInt64 => Type::u64(),
            ForeignType::Float => Type::f32(),
            ForeignType::Double => Type::f64(),
            ForeignType::Pointer => Type::pointer(),
        }
    }
}

/// Foreign function wrapper
pub struct ForeignFunction {
    ptr: *const c_void,
    signature: ForeignSignature,
    cif: Cif,
}

unsafe impl Send for ForeignFunction {}
unsafe impl Sync for ForeignFunction {}

impl ForeignFunction {
    /// Create a new foreign function
    pub fn new(ptr: *const c_void, signature: ForeignSignature) -> Result<Self, String> {
        // Build parameter types for libffi
        let param_types: Vec<Type> = signature
            .param_types
            .iter()
            .map(|t| t.to_ffi_type())
            .collect();

        // Create CIF (Call Interface)
        let cif = Cif::new(
            param_types.into_iter(),
            signature.return_type.to_ffi_type(),
        );

        Ok(Self {
            ptr,
            signature,
            cif,
        })
    }

    /// Call the foreign function
    pub fn call(&self, args: &[LispObject]) -> Result<LispObject, TypeError> {
        if args.len() != self.signature.param_types.len() {
            return Err(TypeError::TypeMismatch {
                expected: "correct number of arguments",
                actual: "wrong arity",
            });
        }

        unsafe {
            match self.signature.return_type {
                ForeignType::Void => {
                    self.call_void(args)?;
                    Ok(LispObject::nil())
                }
                ForeignType::Int32 => {
                    let result = self.call_i32(args)?;
                    Ok(result.to_lisp())
                }
                ForeignType::Int64 => {
                    let result = self.call_i64(args)?;
                    Ok(result.to_lisp())
                }
                ForeignType::Double => {
                    let result = self.call_f64(args)?;
                    Ok(result.to_lisp())
                }
                ForeignType::Pointer => {
                    let result = self.call_ptr(args)?;
                    Ok(result.to_lisp())
                }
                _ => Err(TypeError::TypeMismatch {
                    expected: "supported return type",
                    actual: "unsupported",
                }),
            }
        }
    }

    /// Convert and store arguments for an i32-returning function
    unsafe fn prepare_args_i32(&self, args: &[LispObject]) -> Result<Vec<i32>, TypeError> {
        args.iter()
            .map(|arg| i32::from_lisp(*arg))
            .collect()
    }

    /// Convert and store arguments for an i64-returning function
    unsafe fn prepare_args_i64(&self, args: &[LispObject]) -> Result<Vec<i64>, TypeError> {
        args.iter()
            .map(|arg| i64::from_lisp(*arg))
            .collect()
    }

    /// Convert and store arguments for an f64-returning function
    unsafe fn prepare_args_f64(&self, args: &[LispObject]) -> Result<Vec<f64>, TypeError> {
        args.iter()
            .map(|arg| f64::from_lisp(*arg))
            .collect()
    }

    /// Convert and store arguments for a ptr-returning function
    unsafe fn prepare_args_ptr(&self, args: &[LispObject]) -> Result<Vec<*mut c_void>, TypeError> {
        args.iter()
            .map(|arg| <*mut c_void>::from_lisp(*arg))
            .collect()
    }

    unsafe fn call_void(&self, _args: &[LispObject]) -> Result<(), TypeError> {
        // TODO: Implement void calls with mixed arg types
        self.cif.call::<()>(CodePtr::from_ptr(self.ptr as *const _), &[]);
        Ok(())
    }

    unsafe fn call_i32(&self, args: &[LispObject]) -> Result<i32, TypeError> {
        // For now, assume all args are i32
        let arg_values = self.prepare_args_i32(args)?;
        let ffi_args: Vec<_> = arg_values.iter().map(|v| arg(v)).collect();
        Ok(self.cif.call::<i32>(CodePtr::from_ptr(self.ptr as *const _), &ffi_args))
    }

    unsafe fn call_i64(&self, args: &[LispObject]) -> Result<i64, TypeError> {
        // For now, assume all args are i64
        let arg_values = self.prepare_args_i64(args)?;
        let ffi_args: Vec<_> = arg_values.iter().map(|v| arg(v)).collect();
        Ok(self.cif.call::<i64>(CodePtr::from_ptr(self.ptr as *const _), &ffi_args))
    }

    unsafe fn call_f64(&self, args: &[LispObject]) -> Result<f64, TypeError> {
        // For now, assume all args are f64
        let arg_values = self.prepare_args_f64(args)?;
        let ffi_args: Vec<_> = arg_values.iter().map(|v| arg(v)).collect();
        Ok(self.cif.call::<f64>(CodePtr::from_ptr(self.ptr as *const _), &ffi_args))
    }

    unsafe fn call_ptr(&self, args: &[LispObject]) -> Result<*mut c_void, TypeError> {
        // For now, assume all args are pointers
        let arg_values = self.prepare_args_ptr(args)?;
        let ffi_args: Vec<_> = arg_values.iter().map(|v| arg(v)).collect();
        Ok(self.cif.call::<*mut c_void>(CodePtr::from_ptr(self.ptr as *const _), &ffi_args))
    }

}

/// High-level API for calling foreign functions
pub fn call_foreign(
    function: &ForeignFunction,
    args: &[LispObject],
) -> Result<LispObject, TypeError> {
    function.call(args)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::os::raw::c_int;

    // Simple C function for testing: int add(int a, int b) { return a + b; }
    extern "C" fn test_add(a: c_int, b: c_int) -> c_int {
        a + b
    }

    #[test]
    fn test_foreign_function_call() {
        let sig = ForeignSignature {
            return_type: ForeignType::Int32,
            param_types: vec![ForeignType::Int32, ForeignType::Int32],
        };

        let func = ForeignFunction::new(test_add as *const c_void, sig).unwrap();

        let args = vec![
            5i32.to_lisp(),
            7i32.to_lisp(),
        ];

        let result = func.call(&args).unwrap();
        assert_eq!(i32::from_lisp(result).unwrap(), 12);
    }

    // Test with double
    extern "C" fn test_multiply(a: f64, b: f64) -> f64 {
        a * b
    }

    #[test]
    fn test_double_function() {
        let sig = ForeignSignature {
            return_type: ForeignType::Double,
            param_types: vec![ForeignType::Double, ForeignType::Double],
        };

        let func = ForeignFunction::new(test_multiply as *const c_void, sig).unwrap();

        let args = vec![
            3.5f64.to_lisp(),
            2.0f64.to_lisp(),
        ];

        let result = func.call(&args).unwrap();
        let value = f64::from_lisp(result).unwrap();
        assert!((value - 7.0).abs() < 0.0001);
    }
}
