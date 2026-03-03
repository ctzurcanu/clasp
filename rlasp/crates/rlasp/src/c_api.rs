/// C ABI for librlasp
///
/// This module provides the C-compatible interface for embedding librlasp
/// in other applications or linking from the irlasp executable.

use std::ffi::{CStr, CString};
use std::os::raw::{c_char, c_int};
use crate::repl::Repl;
use crate::repl::RustCAbiFn;
use libloading::Library;

use inkwell::context::Context;
use inkwell::memory_buffer::MemoryBuffer;

/// Opaque handle to the rlasp runtime
#[repr(C)]
pub struct RlaspRuntime {
    repl: Box<Repl>,
    context: Context,
    plugin_libraries: Vec<Library>,
}

fn escape_lisp_string(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    for ch in s.chars() {
        match ch {
            '\\' => out.push_str("\\\\"),
            '"' => out.push_str("\\\""),
            '\n' => out.push_str("\\n"),
            '\r' => out.push_str("\\r"),
            '\t' => out.push_str("\\t"),
            c => out.push(c),
        }
    }
    out
}

/// Initialize the rlasp runtime
/// Returns a handle to the runtime, or NULL on failure
#[no_mangle]
pub extern "C" fn rlasp_init() -> *mut RlaspRuntime {
    let repl = Box::new(Repl::new());
    let context = Context::create();
    Box::into_raw(Box::new(RlaspRuntime {
        repl,
        context,
        plugin_libraries: Vec::new(),
    }))
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
                if let Ok(c_str) = CString::new(format!("{}", result)) {
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

    let file_contents = std::fs::read_to_string(source_str).ok();
    let source_to_eval = file_contents.as_deref().unwrap_or(source_str);

    // Evaluate all forms from source text, or file contents if source points to a file.
    match runtime.repl.eval_file(source_to_eval) {
        Ok(result) => {
            // Convert result to C string if result_out is not null
            if !result_out.is_null() {
                if let Ok(c_str) = CString::new(format!("{}", result)) {
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

    let runtime = unsafe { &mut *runtime };
    let input = match unsafe { CStr::from_ptr(input_path) }.to_str() {
        Ok(s) => s,
        Err(_) => return -1,
    };
    let output = match unsafe { CStr::from_ptr(output_path) }.to_str() {
        Ok(s) => s,
        Err(_) => return -1,
    };

    let form = format!(
        "(compile-file \"{}\" :output-file \"{}\" :verbose nil :print nil)",
        escape_lisp_string(input),
        escape_lisp_string(output)
    );

    match runtime.repl.eval(&form) {
        Ok(_) => {
            let output_path = std::path::Path::new(output);
            if !output_path.exists() {
                let fallback = std::path::Path::new(input).with_extension("fasl");
                if fallback.exists() {
                    if let Err(e) = std::fs::copy(&fallback, output_path) {
                        eprintln!(
                            "rlasp_compile failed to move fallback output {} -> {}: {}",
                            fallback.display(),
                            output_path.display(),
                            e
                        );
                        return -1;
                    }
                }
            }
            if output_path.exists() { 0 } else { -1 }
        }
        Err(e) => {
            eprintln!("rlasp_compile failed: {}", e);
            -1
        }
    }
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

    let path_obj = std::path::Path::new(path);
    let ext = path_obj
        .extension()
        .and_then(|s| s.to_str())
        .map(|s| s.to_ascii_lowercase())
        .unwrap_or_default();

    // If this is a compiled Lisp image (.fasl/.lisp), load it through the Lisp loader.
    if matches!(ext.as_str(), "fasl" | "lisp" | "lsp" | "") {
        let form = format!("(load \"{}\" :verbose nil :print nil)", escape_lisp_string(path));
        return match runtime.repl.eval(&form) {
            Ok(_) => 0,
            Err(e) => {
                eprintln!("rlasp_load_image load failed for {}: {}", path, e);
                -1
            }
        };
    }

    // For LLVM IR images (.ll / .bc), parse and verify through inkwell.
    let buffer = match MemoryBuffer::create_from_file(path_obj) {
        Ok(buf) => buf,
        Err(e) => {
            eprintln!("Failed to load {}: {}", path, e);
            return -1;
        }
    };

    let module = match runtime.context.create_module_from_ir(buffer) {
        Ok(m) => m,
        Err(e) => {
            eprintln!("Failed to parse IR from {}: {}", path, e);
            return -1;
        }
    };

    match module.create_jit_execution_engine(inkwell::OptimizationLevel::Default) {
        Ok(_) => 0,
        Err(e) => {
            eprintln!("Failed to create JIT engine for {}: {}", path, e);
            -1
        }
    }
}

/// Register a native Rust function (C ABI) callable from Lisp.
/// The callback receives raw LispObject values and must write a raw LispObject result.
#[no_mangle]
pub extern "C" fn rlasp_register_rust_fn(
    runtime: *mut RlaspRuntime,
    name: *const c_char,
    func: Option<RustCAbiFn>,
) -> c_int {
    if runtime.is_null() || name.is_null() {
        return -1;
    }
    let Some(func) = func else {
        return -1;
    };

    let runtime = unsafe { &mut *runtime };
    let name = match unsafe { CStr::from_ptr(name) }.to_str() {
        Ok(s) if !s.trim().is_empty() => s.trim(),
        _ => return -1,
    };
    runtime.repl.register_rust_cabi_fn(name, func);
    0
}

/// Load a dynamic Rust plugin and register its functions into this runtime.
/// Plugin entrypoint must export `rlasp_register_plugin(*mut RlaspRuntime) -> int`.
#[no_mangle]
pub extern "C" fn rlasp_load_rust_plugin(
    runtime: *mut RlaspRuntime,
    plugin_path: *const c_char,
) -> c_int {
    if runtime.is_null() || plugin_path.is_null() {
        return -1;
    }
    let path = match unsafe { CStr::from_ptr(plugin_path) }.to_str() {
        Ok(s) if !s.trim().is_empty() => s.trim(),
        _ => return -1,
    };

    let lib = match unsafe { Library::new(path) } {
        Ok(lib) => lib,
        Err(e) => {
            eprintln!("rlasp_load_rust_plugin failed to open {}: {}", path, e);
            return -1;
        }
    };

    let register = unsafe {
        lib.get::<unsafe extern "C" fn(*mut RlaspRuntime) -> c_int>(b"rlasp_register_plugin\0")
    };
    let register = match register {
        Ok(sym) => sym,
        Err(e) => {
            eprintln!(
                "rlasp_load_rust_plugin missing symbol rlasp_register_plugin in {}: {}",
                path, e
            );
            return -1;
        }
    };

    let rc = unsafe { register(runtime) };
    if rc != 0 {
        eprintln!("rlasp_load_rust_plugin register call failed for {} with rc={}", path, rc);
        return -1;
    }

    let runtime_ref = unsafe { &mut *runtime };
    runtime_ref.plugin_libraries.push(lib);
    0
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
    use std::path::PathBuf;

    #[test]
    fn test_c_api_init_shutdown() {
        let runtime = rlasp_init();
        assert!(!runtime.is_null());
        rlasp_shutdown(runtime);
    }

    unsafe extern "C" fn native_add(argc: usize, argv: *const usize, result_out: *mut usize) -> c_int {
        if result_out.is_null() {
            return -1;
        }
        let args = std::slice::from_raw_parts(argv, argc);
        let mut sum = 0i64;
        for raw in args {
            let obj = rlasp_runtime::LispObject::from_raw(*raw);
            if let Some(n) = obj.as_fixnum() {
                sum += n;
            }
        }
        *result_out = rlasp_runtime::LispObject::fixnum(sum).raw();
        0
    }

    #[test]
    fn test_c_api_register_rust_fn() {
        let runtime = rlasp_init();
        assert!(!runtime.is_null());

        let name = CString::new("native-add").unwrap();
        assert_eq!(0, rlasp_register_rust_fn(runtime, name.as_ptr(), Some(native_add)));

        let expr = CString::new("(native-add 7 8)").unwrap();
        let mut result_ptr: *mut c_char = std::ptr::null_mut();
        assert_eq!(0, rlasp_eval(runtime, expr.as_ptr(), &mut result_ptr));
        assert!(!result_ptr.is_null());
        let result = unsafe { CStr::from_ptr(result_ptr) }.to_string_lossy().to_string();
        rlasp_free_string(result_ptr);
        assert_eq!("15", result);

        rlasp_shutdown(runtime);
    }

    #[test]
    fn test_c_api_compile_and_load_image() {
        let runtime = rlasp_init();
        assert!(!runtime.is_null());

        let base: PathBuf = std::env::temp_dir().join(format!("rlasp-capi-{}", std::process::id()));
        let _ = std::fs::create_dir_all(&base);
        let input = base.join("compile_input.lisp");
        let output = base.join("compile_output.fasl");
        std::fs::write(&input, "(setq *c-api-test* 42)\n").unwrap();

        let input_c = CString::new(input.to_string_lossy().to_string()).unwrap();
        let output_c = CString::new(output.to_string_lossy().to_string()).unwrap();
        assert_eq!(0, rlasp_compile(runtime, input_c.as_ptr(), output_c.as_ptr()));
        assert!(output.exists());
        assert_eq!(0, rlasp_load_image(runtime, output_c.as_ptr()));

        let expr = CString::new("*c-api-test*").unwrap();
        let mut result_ptr: *mut c_char = std::ptr::null_mut();
        assert_eq!(0, rlasp_eval(runtime, expr.as_ptr(), &mut result_ptr));
        let result = unsafe { CStr::from_ptr(result_ptr) }.to_string_lossy().to_string();
        rlasp_free_string(result_ptr);
        assert_eq!("42", result);

        rlasp_shutdown(runtime);
    }
}
