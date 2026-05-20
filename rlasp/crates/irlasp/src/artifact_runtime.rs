use std::collections::HashSet;
use std::ffi::CString;
use std::os::raw::c_char;
use std::path::Path;
use std::sync::{Arc, Mutex, OnceLock};

#[derive(Clone)]
struct ActiveArtifactJit {
    lljit: usize,
    argslist_functions: Arc<std::collections::HashSet<String>>,
}

static ACTIVE_ARTIFACT_JITS: OnceLock<Mutex<Vec<ActiveArtifactJit>>> = OnceLock::new();

fn active_artifact_jits() -> &'static Mutex<Vec<ActiveArtifactJit>> {
    ACTIVE_ARTIFACT_JITS.get_or_init(|| Mutex::new(Vec::new()))
}

fn artifact_expects_args_list(
    argslist_functions: &std::collections::HashSet<String>,
    func_name: &str,
) -> bool {
    let fn_pref = format!("%FN%{}", func_name);
    let lower = func_name.to_ascii_lowercase();
    let upper = func_name.to_ascii_uppercase();
    let fn_pref_lower = format!("%FN%{}", lower);
    let fn_pref_upper = format!("%FN%{}", upper);
    argslist_functions.contains(func_name)
        || argslist_functions.contains(&fn_pref)
        || argslist_functions.contains(&lower)
        || argslist_functions.contains(&upper)
        || argslist_functions.contains(&fn_pref_lower)
        || argslist_functions.contains(&fn_pref_upper)
}

pub(crate) fn lambda_list_marker_name(name: &str) -> Option<&str> {
    let base = name.rsplit(':').next().unwrap_or(name);
    if base.starts_with('&') {
        Some(base)
    } else {
        None
    }
}

fn lljit_lookup_symbol_optional(lljit: usize, name: &str) -> Option<u64> {
    use llvm_sys::error::{LLVMDisposeErrorMessage, LLVMGetErrorMessage};
    use llvm_sys::orc2::lljit::{LLVMOrcLLJITLookup, LLVMOrcLLJITRef};
    use llvm_sys::orc2::LLVMOrcExecutorAddress;

    let c_name = CString::new(name).ok()?;
    let mut addr: LLVMOrcExecutorAddress = 0;
    unsafe {
        let err = LLVMOrcLLJITLookup(lljit as LLVMOrcLLJITRef, &mut addr, c_name.as_ptr());
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            LLVMDisposeErrorMessage(err_msg);
            return None;
        }
    }
    Some(addr)
}

extern "C" fn artifact_lazy_function_lookup(
    name_ptr: *const c_char,
    out_address: *mut usize,
    out_expects_args_list: *mut i32,
) -> bool {
    if name_ptr.is_null() || out_address.is_null() || out_expects_args_list.is_null() {
        return false;
    }
    let name = unsafe { std::ffi::CStr::from_ptr(name_ptr) }
        .to_string_lossy()
        .into_owned();
    let resolvers = {
        let guard = active_artifact_jits().lock().unwrap();
        guard.clone()
    };
    for resolver in resolvers.iter().rev() {
        if let Some(addr) = lljit_lookup_symbol_optional(resolver.lljit, &name) {
            unsafe {
                *out_address = addr as usize;
                *out_expects_args_list =
                    if artifact_expects_args_list(&resolver.argslist_functions, &name) {
                        1
                    } else {
                        0
                    };
            }
            return true;
        }
    }
    let interpreter_trampoline = rlasp_jit::intrinsics::interpreter_function_trampoline_address();
    if interpreter_trampoline != 0 {
        let base_name = name.rsplit(':').next().unwrap_or(name.as_str());
        match rlasp::repl::lookup_global_function_binding(&name) {
            Some(rlasp::repl::EvalResult::Lambda { .. })
            | Some(rlasp::repl::EvalResult::GenericFunction(_))
            | Some(rlasp::repl::EvalResult::ForeignFunction(_)) => {
                unsafe {
                    *out_address = interpreter_trampoline;
                    *out_expects_args_list = 0;
                }
                return true;
            }
            _ => {}
        }
        if rlasp::repl::is_allowed_extension_builtin(&name, base_name) {
            unsafe {
                *out_address = interpreter_trampoline;
                *out_expects_args_list = 0;
            }
            return true;
        }
        if rlasp_jit::intrinsics::should_force_interpreter_dispatch(&name) {
            unsafe {
                *out_address = interpreter_trampoline;
                *out_expects_args_list = 0;
            }
            return true;
        }
    }
    false
}

fn register_active_artifact_jit(
    lljit: usize,
    argslist_functions: std::collections::HashSet<String>,
) {
    {
        let mut guard = active_artifact_jits().lock().unwrap();
        if !guard.iter().any(|resolver| resolver.lljit == lljit) {
            guard.push(ActiveArtifactJit {
                lljit,
                argslist_functions: Arc::new(argslist_functions),
            });
        }
    }
    rlasp_jit::intrinsics::cc_set_lazy_function_lookup(artifact_lazy_function_lookup as usize);
}

fn artifact_argslist_sidecar_path(artifact_path: &str) -> String {
    format!("{}.argslist", artifact_path)
}

fn artifact_exports_sidecar_path(artifact_path: &str) -> String {
    format!("{}.exports", artifact_path)
}

pub(crate) fn write_artifact_argslist_sidecar(
    artifact_path: &str,
    argslist_functions: &HashSet<String>,
) -> std::result::Result<(), String> {
    let sidecar_path = artifact_argslist_sidecar_path(artifact_path);
    let mut names: Vec<&str> = argslist_functions.iter().map(|s| s.as_str()).collect();
    names.sort_unstable();
    let body = names.join("\n");
    std::fs::write(&sidecar_path, body).map_err(|e| {
        format!(
            "Failed to write artifact argslist sidecar {}: {}",
            sidecar_path, e
        )
    })
}

pub(crate) fn extract_argslist_functions_from_mlir(mlir_text: &str) -> HashSet<String> {
    let marker = "@__argslist_functions(\"";
    let Some(start_idx) = mlir_text.find(marker) else {
        return HashSet::new();
    };
    let payload_start = start_idx + marker.len();
    let Some(rest) = mlir_text.get(payload_start..) else {
        return HashSet::new();
    };
    let Some(payload_end_rel) = rest.find("\")") else {
        return HashSet::new();
    };
    let payload = &rest[..payload_end_rel];
    payload
        .split("\\00")
        .filter_map(|name| {
            let trimmed = name.trim();
            if trimmed.is_empty() {
                None
            } else {
                Some(trimmed.to_string())
            }
        })
        .collect()
}

pub(crate) fn read_artifact_argslist_sidecar(artifact_path: &str) -> Option<HashSet<String>> {
    let sidecar_path = artifact_argslist_sidecar_path(artifact_path);
    let text = std::fs::read_to_string(&sidecar_path).ok()?;
    let mut names = HashSet::new();
    for line in text.lines() {
        let trimmed = line.trim();
        if !trimmed.is_empty() {
            names.insert(trimmed.to_string());
        }
    }
    Some(names)
}

pub(crate) fn write_artifact_exports_sidecar(
    artifact_path: &str,
    exported_functions: &[String],
) -> std::result::Result<(), String> {
    let sidecar_path = artifact_exports_sidecar_path(artifact_path);
    let mut names: Vec<&str> = exported_functions.iter().map(|s| s.as_str()).collect();
    names.sort_unstable();
    names.dedup();
    let body = names.join("\n");
    std::fs::write(&sidecar_path, body).map_err(|e| {
        format!(
            "Failed to write artifact exports sidecar {}: {}",
            sidecar_path, e
        )
    })
}

fn read_artifact_exports_sidecar(artifact_path: &str) -> Option<Vec<String>> {
    let sidecar_path = artifact_exports_sidecar_path(artifact_path);
    let text = std::fs::read_to_string(&sidecar_path).ok()?;
    let mut names = Vec::new();
    for line in text.lines() {
        let trimmed = line.trim();
        if !trimmed.is_empty() {
            names.push(trimmed.to_string());
        }
    }
    Some(names)
}

pub(crate) fn is_native_object_artifact_path(path: &str) -> bool {
    path.ends_with(".o") || path.ends_with(".obj")
}

pub(crate) fn execute_mlir_artifact_path(
    path: &str,
    source_label: &str,
    init_runtime: bool,
) -> std::result::Result<(), String> {
    use std::time::{SystemTime, UNIX_EPOCH};

    let resolved_path = super::resolve_path_for_mlir_io(path);
    if !Path::new(&resolved_path).exists() {
        return Err(format!(
            "{}: file not found: {}",
            source_label, resolved_path
        ));
    }

    let is_native_object = is_native_object_artifact_path(&resolved_path);
    let is_bytecode = resolved_path.ends_with(".mlirbc");
    let is_text_mlir = resolved_path.ends_with(".mlir");
    let semantic_artifact = if is_bytecode || is_native_object {
        crate::semantic_artifact::has_semantic_artifact_sidecar(&resolved_path)
    } else {
        false
    };
    if !is_native_object && !is_bytecode && !is_text_mlir {
        return Err(format!(
            "{}: expected .mlir, .mlirbc, .o, or .obj file, got: {}",
            source_label, resolved_path
        ));
    }

    let mut prepared_module_path: Option<std::path::PathBuf> = None;
    let exec_input_path = if is_native_object {
        resolved_path.clone()
    } else {
        let nonce = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .map(|d| d.as_nanos())
            .unwrap_or(0);
        let llvm_module_path = std::env::temp_dir().join(format!(
            "irlasp-artifact-{}-{}.{}",
            std::process::id(),
            nonce,
            if is_bytecode { "o" } else { "ll" }
        ));
        let llvm_module_path_str = llvm_module_path.to_string_lossy().into_owned();

        let lowering_result: std::result::Result<(), String> = if is_bytecode {
            rlasp_mlir::lowering::lower_mlir_file_to_native_object_path(
                &resolved_path,
                &llvm_module_path_str,
            )
            .map_err(|e| format!("{}: lowering failed: {}", source_label, e))
        } else {
            let mlir_text = std::fs::read_to_string(&resolved_path).map_err(|e| {
                format!("{}: failed to read {}: {}", source_label, resolved_path, e)
            })?;
            let llvm_ir_text = rlasp_mlir::lowering::lower_mlir_to_llvm(&mlir_text)
                .map_err(|e| format!("{}: lowering failed: {}", source_label, e))?;
            std::fs::write(&llvm_module_path, llvm_ir_text).map_err(|e| {
                format!(
                    "{}: failed to write {}: {}",
                    source_label, llvm_module_path_str, e
                )
            })
        };
        if let Err(e) = lowering_result {
            let _ = std::fs::remove_file(&llvm_module_path);
            return Err(e);
        }
        prepared_module_path = Some(llvm_module_path);
        llvm_module_path_str
    };
    super::trace_mlir_memory("artifact-after-prepare");

    let artifact_argslist_functions = if is_bytecode || is_native_object {
        read_artifact_argslist_sidecar(&resolved_path)
    } else {
        None
    };

    let exec_result = {
        let _artifact_exec_guard = super::MlirArtifactExecGuard::enter();
        jit_execute_llvm_ir_file(
            &exec_input_path,
            &resolved_path,
            artifact_argslist_functions,
            init_runtime,
            semantic_artifact,
        )
        .map_err(|e| format!("{}: JIT execution failed: {}", source_label, e))
    };
    if let Some(path) = prepared_module_path {
        let _ = std::fs::remove_file(path);
    }
    exec_result
}

pub(crate) fn jit_execute_llvm_ir(
    llvm_ir_text: &str,
    source_path: &str,
    init_runtime: bool,
) -> std::result::Result<(), String> {
    use inkwell::context::Context;
    use inkwell::memory_buffer::MemoryBuffer;
    use llvm_sys::error::*;
    use llvm_sys::orc2::lljit::*;
    use llvm_sys::orc2::*;
    use std::ptr;

    use inkwell::targets::{InitializationConfig, Target};
    Target::initialize_native(&InitializationConfig::default())
        .map_err(|e| format!("Failed to initialize native target: {}", e))?;

    let module_name = Path::new(source_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("loaded_module");

    let context = Context::create();
    let memory_buffer =
        MemoryBuffer::create_from_memory_range_copy(llvm_ir_text.as_bytes(), module_name);
    let module = context
        .create_module_from_ir(memory_buffer)
        .map_err(|e| format!("Failed to parse LLVM IR: {:?}", e))?;

    let (mut lambda_names, mut fn_names, mut method_names, mut local_function_names) =
        super::collect_llvm_defined_function_names(std::io::Cursor::new(llvm_ir_text.as_bytes()));
    let mut record_function_name = |func_name: &str| {
        if func_name.is_empty() {
            return;
        }
        if func_name.starts_with("__lambda_") {
            lambda_names.push(func_name.to_string());
        }
        if func_name.starts_with("%FN%") {
            fn_names.push(func_name.to_string());
        }
        if func_name.starts_with("local_") {
            local_function_names.push(func_name.to_string());
        }
        let is_method = func_name.ends_with("_primary")
            || func_name.ends_with("_before")
            || func_name.ends_with("_after")
            || func_name.ends_with("_around");
        if is_method {
            method_names.push(func_name.to_string());
        }
    };
    for func_val in module.get_functions() {
        let func_name = func_val.get_name().to_str().unwrap_or("");
        record_function_name(func_name);
    }
    lambda_names.sort();
    lambda_names.dedup();
    fn_names.sort();
    fn_names.dedup();
    method_names.sort();
    method_names.dedup();
    local_function_names.sort();
    local_function_names.dedup();

    let lljit: LLVMOrcLLJITRef = unsafe {
        let builder = LLVMOrcCreateLLJITBuilder();
        let mut lljit: LLVMOrcLLJITRef = std::ptr::null_mut();
        let err = LLVMOrcCreateLLJIT(&mut lljit, builder);
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg)
                .to_string_lossy()
                .into_owned();
            LLVMDisposeErrorMessage(err_msg);
            return Err(format!("Failed to create LLJIT: {}", msg));
        }
        lljit
    };

    let main_jd = unsafe { LLVMOrcLLJITGetMainJITDylib(lljit) };

    unsafe {
        let mut gen: LLVMOrcDefinitionGeneratorRef = std::ptr::null_mut();
        let global_prefix = LLVMOrcLLJITGetGlobalPrefix(lljit);
        let err = LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(
            &mut gen,
            global_prefix,
            None,
            std::ptr::null_mut(),
        );
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg)
                .to_string_lossy()
                .into_owned();
            LLVMDisposeErrorMessage(err_msg);
            LLVMOrcDisposeLLJIT(lljit);
            return Err(format!("Failed to create symbol resolver: {}", msg));
        }
        LLVMOrcJITDylibAddGenerator(main_jd, gen);
    }

    let ts_ctx = unsafe { LLVMOrcCreateNewThreadSafeContext() };
    let llvm_module_ref = module.as_mut_ptr();
    let ts_module = unsafe { LLVMOrcCreateNewThreadSafeModule(llvm_module_ref, ts_ctx) };
    std::mem::forget(module);

    unsafe {
        let err = LLVMOrcLLJITAddLLVMIRModule(lljit, main_jd, ts_module);
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg)
                .to_string_lossy()
                .into_owned();
            LLVMDisposeErrorMessage(err_msg);
            LLVMOrcDisposeLLJIT(lljit);
            return Err(format!("Failed to add module: {}", msg));
        }
    }

    let lookup_symbol = |name: &str| -> std::result::Result<u64, String> {
        let c_name = std::ffi::CString::new(name).unwrap();
        let mut addr: LLVMOrcExecutorAddress = 0;
        unsafe {
            let err = LLVMOrcLLJITLookup(lljit, &mut addr, c_name.as_ptr());
            if !err.is_null() {
                let err_msg = LLVMGetErrorMessage(err);
                let msg = std::ffi::CStr::from_ptr(err_msg)
                    .to_string_lossy()
                    .into_owned();
                LLVMDisposeErrorMessage(err_msg);
                return Err(msg);
            }
        }
        Ok(addr)
    };

    let argslist_functions: std::collections::HashSet<String> = {
        let mut set = std::collections::HashSet::new();
        if let Ok(addr) = lookup_symbol("__argslist_functions") {
            if addr != 0 {
                let ptr = addr as *const u8;
                let mut offset = 0;
                loop {
                    let start = unsafe { ptr.add(offset) };
                    if unsafe { *start } == 0 {
                        break;
                    }
                    let c_str = unsafe { std::ffi::CStr::from_ptr(start as *const i8) };
                    if let Ok(name) = c_str.to_str() {
                        if !name.is_empty() {
                            set.insert(name.to_string());
                        }
                        offset += name.len() + 1;
                    } else {
                        break;
                    }
                }
            }
        }
        set
    };
    let expects_args_list = |func_name: &str| -> bool {
        let fn_pref = format!("%FN%{}", func_name);
        let lower = func_name.to_ascii_lowercase();
        let upper = func_name.to_ascii_uppercase();
        let fn_pref_lower = format!("%FN%{}", lower);
        let fn_pref_upper = format!("%FN%{}", upper);
        argslist_functions.contains(func_name)
            || argslist_functions.contains(&fn_pref)
            || argslist_functions.contains(&lower)
            || argslist_functions.contains(&upper)
            || argslist_functions.contains(&fn_pref_lower)
            || argslist_functions.contains(&fn_pref_upper)
    };

    {
        use rlasp_jit::intrinsics::{
            cc_register_function_ptr, cc_register_function_with_args_list,
        };
        use std::ffi::CString;
        let trace_register = std::env::var("RLASP_TRACE_REGISTER_FN").is_ok();

        for func_name in &fn_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                if expects_args_list(func_name) {
                    unsafe {
                        cc_register_function_with_args_list(
                            name_cstr.as_ptr(),
                            func_ptr as usize,
                            usize::MAX,
                        );
                    }
                } else {
                    unsafe {
                        cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                    }
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
        for func_name in &lambda_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                if expects_args_list(func_name) {
                    unsafe {
                        cc_register_function_with_args_list(
                            name_cstr.as_ptr(),
                            func_ptr as usize,
                            usize::MAX,
                        );
                    }
                } else {
                    unsafe {
                        cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                    }
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
        for func_name in &method_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                unsafe {
                    cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
        for func_name in &local_function_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                let is_entry = func_name == "__main" || func_name.starts_with("__rlasp_");
                let arity = if is_entry { 0 } else { usize::MAX };
                let has_special_params = func_name
                    .split('\n')
                    .any(|p| lambda_list_marker_name(p).is_some())
                    || expects_args_list(func_name);
                unsafe {
                    if has_special_params && !is_entry {
                        cc_register_function_with_args_list(
                            name_cstr.as_ptr(),
                            func_ptr as usize,
                            arity,
                        );
                    } else {
                        cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, arity);
                    }
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
    }

    super::trace_mlir_memory("artifact-before-register-builtin-intrinsics");
    rlasp_jit::intrinsics::register_builtin_intrinsics();
    super::trace_mlir_memory("artifact-after-register-builtin-intrinsics");
    rlasp_jit::intrinsics::cc_set_eval_bridge(super::cc_eval_bridge as usize);
    rlasp_jit::intrinsics::cc_set_interpreter_eval_trampoline(
        super::cc_interpreter_eval_trampoline as usize,
    );
    rlasp_jit::intrinsics::cc_set_interpreter_function_trampoline(
        super::cc_global_function_binding_trampoline as usize,
    );
    super::trace_mlir_memory("artifact-after-set-eval-bridge");

    if !super::mlir_seed_runner_active() {
        if let Ok(seed_runner) = std::env::var("RLASP_MLIR_BRIDGE_SEED_RUNNER") {
            if !seed_runner.trim().is_empty() {
                if let Err(e) = super::seed_bridge_env_from_runner_file(seed_runner.trim()) {
                    eprintln!("[Warning: MLIR bridge seed failed: {}]", e);
                }
            }
        }
    }
    super::trace_mlir_memory("artifact-after-seed-runner");

    if init_runtime {
        rlasp_jit::intrinsics::init_standard_cl_variables();
        super::trace_mlir_memory("artifact-after-init-standard-cl-variables");
    }
    let _runtime_load_specials_guard = super::install_mlir_load_specials(source_path);
    super::trace_mlir_memory("artifact-after-install-mlir-load-specials");

    let trace_batch_index = std::env::var("RLASP_TRACE_BATCH_INDEX")
        .ok()
        .and_then(|s| s.parse::<usize>().ok());
    let trace_load_mlir = std::env::var("RLASP_TRACE_LOAD_MLIR").is_ok();

    if let Ok(__main_addr) = lookup_symbol("__main") {
        unsafe {
            use rlasp_runtime::eval_stack::{stack_clear, stack_depth, stack_pop_pointer};

            let mut batch_count = 0;
            for i in 0..super::MAIN_BATCH_SCAN_LIMIT {
                let batch_name = format!("__main_batch_{}", i);
                match lookup_symbol(&batch_name) {
                    Ok(_) => batch_count += 1,
                    Err(_) => break,
                }
            }

            if trace_load_mlir {
                println!(
                    "[load-mlir: {} batches, {} functions, {} lambdas, {} methods, {} local]",
                    batch_count,
                    fn_names.len(),
                    lambda_names.len(),
                    method_names.len(),
                    local_function_names.len()
                );
            }

            let run_batches_directly = trace_batch_index.is_some();
            if run_batches_directly && batch_count > 0 {
                super::emit_mlir_exec_banner("[MLIR_EXEC_BEGIN] __main_batches");
                for i in 0..batch_count {
                    if let Some(target_idx) = trace_batch_index {
                        if i != target_idx {
                            continue;
                        }
                    }
                    let batch_name = format!("__main_batch_{}", i);
                    if let Ok(batch_addr) = lookup_symbol(&batch_name) {
                        if trace_load_mlir {
                            println!("[load-mlir: batch {}/{}]", i, batch_count);
                        }
                        stack_clear();
                        let jit_fn: extern "C" fn() = std::mem::transmute(batch_addr);
                        jit_fn();
                        if stack_depth() > 0 {
                            let result = stack_pop_pointer();
                            let result_obj = rlasp_runtime::LispObject::from_raw(result);
                            if result_obj.is_error() {
                                let mut detail = super::format_jit_result(result as i64);
                                if let Some(kind) = result_obj.as_error_kind() {
                                    detail = format!("{} ({:?})", detail, kind);
                                }
                                if let Some(ptr) =
                                    result_obj.as_general_ptr::<rlasp_runtime::LispError>()
                                {
                                    if let Some(msg) = &(*ptr).message {
                                        detail = format!("{}: {}", detail, msg);
                                    }
                                }
                                return Err(format!(
                                    "MLIR artifact batch {} error: {}",
                                    batch_name, detail
                                ));
                            }
                        }
                    }
                }
                if trace_load_mlir {
                    println!("[load-mlir: {} batches executed]", batch_count);
                }
            } else {
                stack_clear();
                let jit_fn: extern "C" fn() = std::mem::transmute(__main_addr);
                super::emit_mlir_exec_banner("[MLIR_EXEC_BEGIN] __main");
                jit_fn();
                let depth = stack_depth();
                if depth > 0 {
                    let result = stack_pop_pointer();
                    if trace_load_mlir {
                        println!(
                            "[load-mlir: __main result {}]",
                            super::format_jit_result(result as i64)
                        );
                    }
                    let result_obj = rlasp_runtime::LispObject::from_raw(result);
                    if result_obj.is_error() {
                        let mut detail = super::format_jit_result(result as i64);
                        if let Some(kind) = result_obj.as_error_kind() {
                            detail = format!("{} ({:?})", detail, kind);
                        }
                        if let Some(ptr) = result_obj.as_general_ptr::<rlasp_runtime::LispError>() {
                            if let Some(msg) = &(*ptr).message {
                                detail = format!("{}: {}", detail, msg);
                            }
                        }
                        return Err(format!("MLIR artifact __main error: {}", detail));
                    }
                }
            }
        }
    } else {
        return Err("No __main function found in module".to_string());
    }

    Ok(())
}

pub(crate) fn jit_execute_llvm_ir_file(
    llvm_ir_path: &str,
    source_path: &str,
    artifact_argslist_functions: Option<HashSet<String>>,
    init_runtime: bool,
    semantic_artifact: bool,
) -> std::result::Result<(), String> {
    use inkwell::context::Context;
    use inkwell::memory_buffer::MemoryBuffer;
    use inkwell::module::Module;
    use llvm_sys::core::{
        LLVMCreateMemoryBufferWithContentsOfFile, LLVMDisposeMemoryBuffer, LLVMDisposeMessage,
    };
    use llvm_sys::error::*;
    use llvm_sys::orc2::lljit::*;
    use llvm_sys::orc2::*;
    use std::ptr;

    use inkwell::targets::{InitializationConfig, Target};
    Target::initialize_native(&InitializationConfig::default())
        .map_err(|e| format!("Failed to initialize native target: {}", e))?;

    let module_name = Path::new(source_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("loaded_module");
    let is_object_file = llvm_ir_path.ends_with(".o") || llvm_ir_path.ends_with(".obj");
    let trace_load_mlir = std::env::var("RLASP_TRACE_LOAD_MLIR").is_ok();
    let eager_register_artifact_functions =
        std::env::var("RLASP_EAGER_REGISTER_ARTIFACT_FNS").is_ok() || is_object_file;

    let mut lambda_names = Vec::new();
    let mut fn_names = Vec::new();
    let mut method_names = Vec::new();
    let mut local_function_names = Vec::new();
    let exported_sidecar_names = if is_object_file {
        read_artifact_exports_sidecar(source_path)
    } else {
        None
    };

    let lljit: LLVMOrcLLJITRef = unsafe {
        let builder = LLVMOrcCreateLLJITBuilder();
        let mut lljit: LLVMOrcLLJITRef = ptr::null_mut();
        let err = LLVMOrcCreateLLJIT(&mut lljit, builder);
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg)
                .to_string_lossy()
                .into_owned();
            LLVMDisposeErrorMessage(err_msg);
            return Err(format!("Failed to create LLJIT: {}", msg));
        }
        lljit
    };

    let main_jd = unsafe { LLVMOrcLLJITGetMainJITDylib(lljit) };

    unsafe {
        let mut gen: LLVMOrcDefinitionGeneratorRef = ptr::null_mut();
        let global_prefix = LLVMOrcLLJITGetGlobalPrefix(lljit);
        let err = LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(
            &mut gen,
            global_prefix,
            None,
            ptr::null_mut(),
        );
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg)
                .to_string_lossy()
                .into_owned();
            LLVMDisposeErrorMessage(err_msg);
            LLVMOrcDisposeLLJIT(lljit);
            return Err(format!("Failed to create symbol resolver: {}", msg));
        }
        LLVMOrcJITDylibAddGenerator(main_jd, gen);
    }

    if is_object_file {
        let path_cstr = std::ffi::CString::new(llvm_ir_path)
            .map_err(|e| format!("Invalid object artifact path {}: {}", llvm_ir_path, e))?;
        let mut obj_buf = ptr::null_mut();
        let mut err_msg = ptr::null_mut();
        let mem_rc = unsafe {
            LLVMCreateMemoryBufferWithContentsOfFile(path_cstr.as_ptr(), &mut obj_buf, &mut err_msg)
        };
        if mem_rc != 0 {
            let msg = if err_msg.is_null() {
                format!("Failed to load object artifact {}", llvm_ir_path)
            } else {
                let msg = unsafe { std::ffi::CStr::from_ptr(err_msg) }
                    .to_string_lossy()
                    .into_owned();
                unsafe { LLVMDisposeMessage(err_msg) };
                msg
            };
            unsafe { LLVMOrcDisposeLLJIT(lljit) };
            return Err(msg);
        }
        super::trace_mlir_memory("artifact-after-object-buffer");
        unsafe {
            let err = LLVMOrcLLJITAddObjectFile(lljit, main_jd, obj_buf);
            if !err.is_null() {
                let err_msg = LLVMGetErrorMessage(err);
                let msg = std::ffi::CStr::from_ptr(err_msg)
                    .to_string_lossy()
                    .into_owned();
                LLVMDisposeErrorMessage(err_msg);
                LLVMDisposeMemoryBuffer(obj_buf);
                LLVMOrcDisposeLLJIT(lljit);
                return Err(format!("Failed to add object file: {}", msg));
            }
        }
    } else {
        let ts_module = if trace_load_mlir || eager_register_artifact_functions {
            let context = Context::create();
            let module = if llvm_ir_path.ends_with(".bc") {
                Module::parse_bitcode_from_path(Path::new(llvm_ir_path), &context)
                    .map_err(|e| format!("Failed to parse LLVM bitcode {}: {}", llvm_ir_path, e))?
            } else {
                let memory_buffer = MemoryBuffer::create_from_file(Path::new(llvm_ir_path))
                    .map_err(|e| format!("Failed to load LLVM IR file {}: {}", llvm_ir_path, e))?;
                context
                    .create_module_from_ir(memory_buffer)
                    .map_err(|e| format!("Failed to parse LLVM IR: {:?}", e))?
            };
            super::trace_mlir_memory("artifact-after-llvm-parse");

            for func_val in module.get_functions() {
                let func_name = func_val.get_name().to_str().unwrap_or("");
                if func_name.is_empty() {
                    continue;
                }
                if func_name.starts_with("__lambda_") {
                    lambda_names.push(func_name.to_string());
                }
                if func_name.starts_with("%FN%") {
                    fn_names.push(func_name.to_string());
                }
                if func_name.starts_with("local_") {
                    local_function_names.push(func_name.to_string());
                }
                let is_method = func_name.ends_with("_primary")
                    || func_name.ends_with("_before")
                    || func_name.ends_with("_after")
                    || func_name.ends_with("_around");
                if is_method {
                    method_names.push(func_name.to_string());
                }
            }
            lambda_names.sort();
            lambda_names.dedup();
            fn_names.sort();
            fn_names.dedup();
            method_names.sort();
            method_names.dedup();
            local_function_names.sort();
            local_function_names.dedup();

            let ts_ctx = unsafe { LLVMOrcCreateNewThreadSafeContext() };
            let llvm_module_ref = module.as_mut_ptr();
            let ts_module = unsafe { LLVMOrcCreateNewThreadSafeModule(llvm_module_ref, ts_ctx) };
            std::mem::forget(module);
            std::mem::forget(context);
            ts_module
        } else {
            use llvm_sys::bit_reader::LLVMParseBitcodeInContext2;
            use llvm_sys::ir_reader::LLVMParseIRInContext;

            let ts_ctx = unsafe { LLVMOrcCreateNewThreadSafeContext() };
            let llvm_context_ref = unsafe { LLVMOrcThreadSafeContextGetContext(ts_ctx) };
            let path_cstr = std::ffi::CString::new(llvm_ir_path)
                .map_err(|e| format!("Invalid LLVM artifact path {}: {}", llvm_ir_path, e))?;
            let mut mem_buf = ptr::null_mut();
            let mut err_msg = ptr::null_mut();
            let mem_rc = unsafe {
                LLVMCreateMemoryBufferWithContentsOfFile(
                    path_cstr.as_ptr(),
                    &mut mem_buf,
                    &mut err_msg,
                )
            };
            if mem_rc != 0 {
                let msg = if err_msg.is_null() {
                    format!("Failed to load LLVM artifact {}", llvm_ir_path)
                } else {
                    let msg = unsafe { std::ffi::CStr::from_ptr(err_msg) }
                        .to_string_lossy()
                        .into_owned();
                    unsafe { LLVMDisposeMessage(err_msg) };
                    msg
                };
                unsafe {
                    LLVMOrcDisposeThreadSafeContext(ts_ctx);
                    LLVMOrcDisposeLLJIT(lljit);
                }
                return Err(msg);
            }

            let mut llvm_module_ref = ptr::null_mut();
            let parse_failed = unsafe {
                if llvm_ir_path.ends_with(".bc") {
                    LLVMParseBitcodeInContext2(llvm_context_ref, mem_buf, &mut llvm_module_ref) != 0
                } else {
                    LLVMParseIRInContext(
                        llvm_context_ref,
                        mem_buf,
                        &mut llvm_module_ref,
                        &mut err_msg,
                    ) != 0
                }
            };
            unsafe { LLVMDisposeMemoryBuffer(mem_buf) };
            if parse_failed {
                let msg = if err_msg.is_null() {
                    format!("Failed to parse LLVM artifact {}", llvm_ir_path)
                } else {
                    let msg = unsafe { std::ffi::CStr::from_ptr(err_msg) }
                        .to_string_lossy()
                        .into_owned();
                    unsafe { LLVMDisposeMessage(err_msg) };
                    msg
                };
                unsafe {
                    LLVMOrcDisposeThreadSafeContext(ts_ctx);
                    LLVMOrcDisposeLLJIT(lljit);
                }
                return Err(msg);
            }
            super::trace_mlir_memory("artifact-after-llvm-parse");
            unsafe { LLVMOrcCreateNewThreadSafeModule(llvm_module_ref, ts_ctx) }
        };

        unsafe {
            let err = LLVMOrcLLJITAddLLVMIRModule(lljit, main_jd, ts_module);
            if !err.is_null() {
                let err_msg = LLVMGetErrorMessage(err);
                let msg = std::ffi::CStr::from_ptr(err_msg)
                    .to_string_lossy()
                    .into_owned();
                LLVMDisposeErrorMessage(err_msg);
                LLVMOrcDisposeLLJIT(lljit);
                return Err(format!("Failed to add module: {}", msg));
            }
        }
    }
    super::trace_mlir_memory("artifact-after-add-module");

    let lookup_symbol = |name: &str| -> std::result::Result<u64, String> {
        let c_name = std::ffi::CString::new(name).unwrap();
        let mut addr: LLVMOrcExecutorAddress = 0;
        unsafe {
            let err = LLVMOrcLLJITLookup(lljit, &mut addr, c_name.as_ptr());
            if !err.is_null() {
                let err_msg = LLVMGetErrorMessage(err);
                let msg = std::ffi::CStr::from_ptr(err_msg)
                    .to_string_lossy()
                    .into_owned();
                LLVMDisposeErrorMessage(err_msg);
                return Err(msg);
            }
        }
        Ok(addr)
    };

    let argslist_functions: HashSet<String> = if let Some(set) = artifact_argslist_functions {
        set
    } else {
        let mut set = HashSet::new();
        if let Ok(addr) = lookup_symbol("__argslist_functions") {
            if addr != 0 {
                let ptr = addr as *const u8;
                let mut offset = 0;
                loop {
                    let start = unsafe { ptr.add(offset) };
                    if unsafe { *start } == 0 {
                        break;
                    }
                    let c_str = unsafe { std::ffi::CStr::from_ptr(start as *const i8) };
                    if let Ok(name) = c_str.to_str() {
                        if !name.is_empty() {
                            set.insert(name.to_string());
                        }
                        offset += name.len() + 1;
                    } else {
                        break;
                    }
                }
            }
        }
        set
    };
    if let Some(sidecar_names) = exported_sidecar_names {
        for name in sidecar_names {
            if !fn_names.iter().any(|existing| existing == &name) {
                fn_names.push(name);
            }
        }
        fn_names.sort();
        fn_names.dedup();
    }
    register_active_artifact_jit(lljit as usize, argslist_functions.clone());

    if eager_register_artifact_functions {
        use rlasp_jit::intrinsics::{
            cc_register_function_ptr, cc_register_function_with_args_list,
        };
        use std::ffi::CString;
        let trace_register = std::env::var("RLASP_TRACE_REGISTER_FN").is_ok();

        for func_name in &fn_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                if artifact_expects_args_list(&argslist_functions, func_name) {
                    unsafe {
                        cc_register_function_with_args_list(
                            name_cstr.as_ptr(),
                            func_ptr as usize,
                            usize::MAX,
                        );
                    }
                } else {
                    unsafe {
                        cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                    }
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
        for func_name in &lambda_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                if artifact_expects_args_list(&argslist_functions, func_name) {
                    unsafe {
                        cc_register_function_with_args_list(
                            name_cstr.as_ptr(),
                            func_ptr as usize,
                            usize::MAX,
                        );
                    }
                } else {
                    unsafe {
                        cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                    }
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
        for func_name in &method_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                unsafe {
                    cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
        for func_name in &local_function_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                if trace_register {
                    eprintln!("[register-fn] {} ok=1", func_name);
                }
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                if artifact_expects_args_list(&argslist_functions, func_name) {
                    unsafe {
                        cc_register_function_with_args_list(
                            name_cstr.as_ptr(),
                            func_ptr as usize,
                            usize::MAX,
                        );
                    }
                } else {
                    unsafe {
                        cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                    }
                }
            } else if trace_register {
                eprintln!("[register-fn] {} ok=0", func_name);
            }
        }
    }
    super::trace_mlir_memory("artifact-after-register");

    rlasp_jit::intrinsics::register_builtin_intrinsics();
    rlasp_jit::intrinsics::cc_set_eval_bridge(super::cc_eval_bridge as usize);
    rlasp_jit::intrinsics::cc_set_interpreter_eval_trampoline(
        super::cc_interpreter_eval_trampoline as usize,
    );
    rlasp_jit::intrinsics::cc_set_interpreter_function_trampoline(
        super::cc_global_function_binding_trampoline as usize,
    );
    if !semantic_artifact {
        if !super::mlir_seed_runner_active() {
            if let Ok(seed_runner) = std::env::var("RLASP_MLIR_BRIDGE_SEED_RUNNER") {
                if !seed_runner.trim().is_empty() {
                    if let Err(e) = super::seed_bridge_env_from_runner_file(seed_runner.trim()) {
                        eprintln!("[Warning: MLIR bridge seed failed: {}]", e);
                    }
                }
            }
        }
    }

    if init_runtime {
        rlasp_jit::intrinsics::init_standard_cl_variables();
    }
    let _runtime_load_specials_guard = super::install_mlir_load_specials(source_path);
    super::trace_mlir_memory("artifact-after-runtime-init");

    let trace_batch_index = std::env::var("RLASP_TRACE_BATCH_INDEX")
        .ok()
        .and_then(|s| s.parse::<usize>().ok());

    super::trace_mlir_memory("artifact-before-batch-scan");
    let mut batch_entries: Vec<(String, u64)> = Vec::new();
    for i in 0..super::MAIN_BATCH_SCAN_LIMIT {
        let batch_name = format!("__main_batch_{}", i);
        match lookup_symbol(&batch_name) {
            Ok(batch_addr) => {
                batch_entries.push((batch_name, batch_addr));
                if i == 0 || (i + 1) % 10 == 0 {
                    super::trace_mlir_memory(&format!("artifact-after-batch-lookup-{}", i));
                }
            }
            Err(_) => break,
        }
    }
    super::trace_mlir_memory("artifact-after-batch-scan");

    if trace_load_mlir {
        println!(
            "[load-mlir: {} batches, {} functions, {} lambdas, {} methods, {} local]",
            batch_entries.len(),
            fn_names.len(),
            lambda_names.len(),
            method_names.len(),
            local_function_names.len()
        );
    }

    let run_batches_directly = trace_batch_index.is_some();
    if run_batches_directly && !batch_entries.is_empty() {
        super::trace_mlir_memory("artifact-before-exec");
        unsafe {
            use rlasp_runtime::eval_stack::{stack_clear, stack_depth, stack_pop_pointer};

            super::emit_mlir_exec_banner("[MLIR_EXEC_BEGIN] __main_batches");
            for (i, (batch_name, batch_addr)) in batch_entries.iter().enumerate() {
                if let Some(target_idx) = trace_batch_index {
                    if i != target_idx {
                        continue;
                    }
                }
                if trace_load_mlir {
                    println!("[load-mlir: batch {}/{}]", i, batch_entries.len());
                }
                stack_clear();
                let jit_fn: extern "C" fn() = std::mem::transmute(*batch_addr);
                jit_fn();
                if stack_depth() > 0 {
                    let result = stack_pop_pointer();
                    let result_obj = rlasp_runtime::LispObject::from_raw(result);
                    if result_obj.is_error() {
                        let mut detail = super::format_jit_result(result as i64);
                        if let Some(kind) = result_obj.as_error_kind() {
                            detail = format!("{} ({:?})", detail, kind);
                        }
                        if let Some(ptr) = result_obj.as_general_ptr::<rlasp_runtime::LispError>() {
                            if let Some(msg) = &(*ptr).message {
                                detail = format!("{}: {}", detail, msg);
                            }
                        }
                        return Err(format!(
                            "MLIR artifact batch {} error: {}",
                            batch_name, detail
                        ));
                    }
                }
            }
            if trace_load_mlir {
                println!("[load-mlir: {} batches executed]", batch_entries.len());
            }
        }
    } else {
        super::trace_mlir_memory("artifact-before-main-lookup");
        let __main_addr = lookup_symbol("__main")
            .map_err(|_| "No __main function found in module".to_string())?;
        super::trace_mlir_memory("artifact-after-main-lookup");
        super::trace_mlir_memory("artifact-before-exec");
        unsafe {
            use rlasp_runtime::eval_stack::{stack_clear, stack_depth, stack_pop_pointer};

            stack_clear();
            let jit_fn: extern "C" fn() = std::mem::transmute(__main_addr);
            super::emit_mlir_exec_banner("[MLIR_EXEC_BEGIN] __main");
            jit_fn();
            let depth = stack_depth();
            if depth > 0 {
                let result = stack_pop_pointer();
                if trace_load_mlir {
                    println!(
                        "[load-mlir: __main result {}]",
                        super::format_jit_result(result as i64)
                    );
                }
                let result_obj = rlasp_runtime::LispObject::from_raw(result);
                if result_obj.is_error() {
                    let mut detail = super::format_jit_result(result as i64);
                    if let Some(kind) = result_obj.as_error_kind() {
                        detail = format!("{} ({:?})", detail, kind);
                    }
                    if let Some(ptr) = result_obj.as_general_ptr::<rlasp_runtime::LispError>() {
                        if let Some(msg) = &(*ptr).message {
                            detail = format!("{}: {}", detail, msg);
                        }
                    }
                    return Err(format!("MLIR artifact __main error: {}", detail));
                }
            }
        }
    }

    Ok(())
}
