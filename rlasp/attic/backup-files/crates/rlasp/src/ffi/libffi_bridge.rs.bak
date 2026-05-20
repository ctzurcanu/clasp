use super::{CCall, CCallArg, CFuncRef, CType};
use libffi::middle::*;

/// Lower a CCall to an actual libffi function call
pub fn lower_ccall(call: &CCall) -> Result<CCallResult, String> {
    call.validate()?;

    let return_type = call.function.return_type.to_ffi_type();
    let arg_types: Vec<Type> = call.function.param_types
        .iter()
        .map(|t| t.to_ffi_type())
        .collect();

    let cif = Cif::new(arg_types, return_type);

    // Prepare arguments
    let mut arg_values: Vec<Arg> = Vec::new();
    for call_arg in &call.args {
        let ffi_arg = match call_arg {
            CCallArg::Int64(v) => arg(v),
            CCallArg::UInt64(v) => arg(v),
            CCallArg::Double(v) => arg(v),
            CCallArg::Float(v) => arg(v),
            CCallArg::Pointer(p) => arg(p),
            CCallArg::Raw(_) => {
                return Err("Raw argument types not yet supported".to_string());
            }
        };
        arg_values.push(ffi_arg);
    }

    // Call the function
    let result = unsafe {
        let code_ptr = CodePtr::from_ptr(call.function.address as *const _);

        match &call.function.return_type {
            CType::Void => {
                cif.call::<()>(code_ptr, &arg_values);
                CCallResult::Void
            }
            CType::Int32 => {
                let val: i32 = cif.call(code_ptr, &arg_values);
                CCallResult::Int64(val as i64)
            }
            CType::Int64 => {
                let val: i64 = cif.call(code_ptr, &arg_values);
                CCallResult::Int64(val)
            }
            CType::UInt64 => {
                let val: u64 = cif.call(code_ptr, &arg_values);
                CCallResult::UInt64(val)
            }
            CType::Double => {
                let val: f64 = cif.call(code_ptr, &arg_values);
                CCallResult::Double(val)
            }
            CType::Float => {
                let val: f32 = cif.call(code_ptr, &arg_values);
                CCallResult::Float(val)
            }
            CType::Pointer(_) => {
                let val: *const () = cif.call(code_ptr, &arg_values);
                CCallResult::Pointer(val)
            }
            _ => {
                return Err(format!(
                    "Return type {:?} not yet supported",
                    call.function.return_type
                ));
            }
        }
    };

    Ok(result)
}

/// Result of a C function call
#[derive(Debug)]
pub enum CCallResult {
    Void,
    Int64(i64),
    UInt64(u64),
    Double(f64),
    Float(f32),
    Pointer(*const ()),
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_strlen_call() {
        use std::ffi::CString;

        let strlen_func = CFuncRef::new(
            "strlen",
            libc::strlen as *const (),
            CType::UInt64,
            vec![CType::Pointer(Box::new(CType::Int8))],
            false,
        );

        let test_str = CString::new("hello").unwrap();
        let call = CCall::new(
            strlen_func,
            vec![CCallArg::Pointer(test_str.as_ptr() as *const ())],
        );

        let result = lower_ccall(&call).expect("Call failed");
        match result {
            CCallResult::UInt64(len) => assert_eq!(len, 5),
            _ => panic!("Expected UInt64 result"),
        }
    }
}
