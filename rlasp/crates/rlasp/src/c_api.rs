/// C ABI for librlasp
///
/// This module provides the C-compatible interface for embedding librlasp
/// in other applications or linking from the irlasp executable.

use std::ffi::{CStr, CString};
use std::os::raw::{c_char, c_int};
use std::ptr;
use crate::repl::Repl;

use inkwell::context::Context;
use inkwell::memory_buffer::MemoryBuffer;

/// Opaque handle to the rlasp runtime
#[repr(C)]
pub struct RlaspRuntime {
    repl: Box<Repl>,
    context: Context,
}

/// Initialize the rlasp runtime
/// Returns a handle to the runtime, or NULL on failure
#[no_mangle]
pub extern "C" fn rlasp_init() -> *mut RlaspRuntime {
    let repl = Box::new(Repl::new());
    let context = Context::create();
    Box::into_raw(Box::new(RlaspRuntime { repl, context }))
}

/// Evaluate a Lisp expression
/// Returns 0 on success, non-zero on error
#[no_mangle]
pub extern "C" fn rlasp_eval(
    runtime: *mut RlaspRuntime,
    expr: *const c_char,
    result_out: *mut *mut c_char,
) -> c_int {
    if runtime.is_null() || expr.is_null() {
        return -1;
    }

    let runtime = unsafe { &mut *runtime };
    let expr_str = match unsafe { CStr::from_ptr(expr) }.to_str() {
        Ok(s) => s,
        Err(_) => return -1,
    };

    // Evaluate the expression
    match runtime.repl.eval(expr_str) {
        Ok(result) => {
            // Convert result to C string if result_out is not null
            if !result_out.is_null() {
                if let Ok(c_str) = CString::new(format!("{:?}", result)) {
                    unsafe {
                        *result_out = c_str.into_raw();
                    }
                }
            }
            0
        }
                Err(e) => {
            if !result_out.is_null() {
                if let Ok(c_str) = CString::new(format!("{}", e)) {
                    unsafe {
                        *result_out = c_str.into_raw();
                    }
                }
            }
            -1
        }
    }
}

/// Evaluate all forms in a file
/// Returns 0 on success, non-zero on error
#[no_mangle]
pub extern "C" fn rlasp_eval_file(
    runtime: *mut RlaspRuntime,
    source: *const c_char,
    result_out: *mut *mut c_char,
) -> c_int {
    if runtime.is_null() || source.is_null() {
        return -1;
    }

    let runtime = unsafe { &mut *runtime };
    let source_str = match unsafe { CStr::from_ptr(source) }.to_str() {
        Ok(s) => s,
        Err(_) => return -1,
    };

    // Evaluate all forms
    match runtime.repl.eval_file(source_str) {
        Ok(result) => {
            // Convert result to C string if result_out is not null
            if !result_out.is_null() {
                if let Ok(c_str) = CString::new(format!("{:?}", result)) {
                    unsafe {
                        *result_out = c_str.into_raw();
                    }
                }
            }
            0
        }
        Err(e) => {
            if !result_out.is_null() {
                if let Ok(c_str) = CString::new(format!("{}", e)) {
                    unsafe {
                        *result_out = c_str.into_raw();
                    }
                }
            }
            -1
        }
    }
}

/// Compile a Lisp file to LLVM IR
/// Returns 0 on success, non-zero on error
#[no_mangle]
pub extern "C" fn rlasp_compile(
    runtime: *mut RlaspRuntime,
    input_path: *const c_char,
    output_path: *const c_char,
) -> c_int {
    if runtime.is_null() || input_path.is_null() || output_path.is_null() {
        return -1;
    }

    let _runtime = unsafe { &mut *runtime };
    let _input = match unsafe { CStr::from_ptr(input_path) }.to_str() {
        Ok(s) => s,
        Err(_) => return -1,
    };
    let _output = match unsafe { CStr::from_ptr(output_path) }.to_str() {
        Ok(s) => s,
        Err(_) => return -1,
    };

    // TODO: Implement compilation to .ll
    // This will use the rlasp-compiler crate
    -1  // Not implemented yet
}

/// Load a compiled LLVM IR image (.ll file) into ORC JIT
/// Returns 0 on success, non-zero on error
#[no_mangle]
pub extern "C" fn rlasp_load_image(
    runtime: *mut RlaspRuntime,
    image_path: *const c_char,
) -> c_int {
    if runtime.is_null() || image_path.is_null() {
        return -1;
    }

    let runtime = unsafe { &mut *runtime };
    let path = match unsafe { CStr::from_ptr(image_path) }.to_str() {
        Ok(s) => s,
        Err(_) => return -1,
    };

    // Load .ll file into memory buffer
    let buffer = match MemoryBuffer::create_from_file(std::path::Path::new(path)) {
        Ok(buf) => buf,
        Err(e) => {
            eprintln!("Failed to load {}: {}", path, e);
            return -1;
        }
    };

    // Parse LLVM IR to module
    let module = match runtime.context.create_module_from_ir(buffer) {
        Ok(m) => m,
        Err(e) => {
            eprintln!("Failed to parse IR from {}: {}", path, e);
            return -1;
        }
    };

    // Create JIT execution engine from module
    // Note: For now we create a new engine per module
    // TODO: Support linking multiple modules in one engine
    match module.create_jit_execution_engine(inkwell::OptimizationLevel::Default) {
        Ok(_engine) => {
            // TODO: Store the engine in runtime so we can call functions from it
            // For now, just verify it was created successfully
            0
        }
        Err(e) => {
            eprintln!("Failed to create JIT engine for {}: {}", path, e);
            -1
        }
    }
}

/// Free a C string allocated by librlasp
#[no_mangle]
pub extern "C" fn rlasp_free_string(s: *mut c_char) {
    if !s.is_null() {
        unsafe {
            let _ = CString::from_raw(s);
        }
    }
}

/// Shutdown and free the runtime
#[no_mangle]
pub extern "C" fn rlasp_shutdown(runtime: *mut RlaspRuntime) {
    if !runtime.is_null() {
        unsafe {
            let _ = Box::from_raw(runtime);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_c_api_init_shutdown() {
        let runtime = rlasp_init();
        assert!(!runtime.is_null());
        rlasp_shutdown(runtime);
    }
}
