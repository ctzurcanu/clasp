use std::collections::HashMap;

use crate::artifact_runtime::{
    extract_argslist_functions_from_mlir, write_artifact_argslist_sidecar,
};

pub(crate) fn mlir_artifact_path_for_source(file_path: &str, source: &str) -> String {
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let mut stem = std::path::Path::new(file_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("module")
        .to_string();
    if stem.is_empty() {
        stem = "module".to_string();
    }
    let mut hasher = DefaultHasher::new();
    file_path.hash(&mut hasher);
    source.hash(&mut hasher);
    format!("/tmp/{}-{:016x}.mlirbc", stem, hasher.finish())
}

fn semantic_artifact_sidecar_path(artifact_path: &str) -> String {
    format!("{}.semantic", artifact_path)
}

pub(crate) fn write_semantic_artifact_sidecar(
    artifact_path: &str,
) -> std::result::Result<(), String> {
    let sidecar_path = semantic_artifact_sidecar_path(artifact_path);
    std::fs::write(&sidecar_path, "semantic-unit-v1\n").map_err(|e| {
        format!(
            "Failed to write semantic artifact sidecar {}: {}",
            sidecar_path, e
        )
    })
}

pub(crate) fn has_semantic_artifact_sidecar(artifact_path: &str) -> bool {
    std::fs::metadata(semantic_artifact_sidecar_path(artifact_path)).is_ok()
}

fn expand_source_forms_for_semantic_unit(
    source: &str,
) -> std::result::Result<Vec<(rlasp_runtime::LispObject, rlasp_runtime::LispObject)>, String> {
    let trace = super::env_var_truthy("RLASP_TRACE_SEMANTIC_ARTIFACT");
    let mut reader =
        rlasp_reader::Reader::from_string(source).map_err(|e| format!("Read error: {}", e))?;
    let package_aware_symbols = true;
    let mut interp_env: HashMap<String, rlasp::EvalResult> =
        super::MLIR_INTERP_ENV.with(|cell| cell.borrow().clone());
    if let Ok(target) = std::env::var("RLASP_DEBUG_SEED_BINDING_TARGET") {
        let target_lc = target.trim().to_ascii_lowercase();
        if !target_lc.is_empty() {
            let mut env_matches: Vec<String> = interp_env
                .keys()
                .filter(|k| k.to_ascii_lowercase().contains(&target_lc))
                .cloned()
                .collect();
            env_matches.sort();
            let mut global_matches: Vec<String> = rlasp::repl::debug_global_function_binding_keys()
                .into_iter()
                .filter(|k| k.to_ascii_lowercase().contains(&target_lc))
                .collect();
            global_matches.sort();
            eprintln!(
                "[semantic-seed-entry] target={} env_matches={:?} global_matches={:?}",
                target, env_matches, global_matches
            );
        }
    }
    let mut expanded_forms = Vec::new();

    loop {
        let original_form = match reader.read() {
            Ok(obj) => obj,
            Err(rlasp_reader::ReaderError::UnexpectedEof) => break,
            Err(e) => return Err(format!("Read error: {}", e)),
        };
        if rlasp_reader::is_skip_marker(&original_form) {
            continue;
        }
        if trace {
            eprintln!(
                "[semantic-artifact] read-form count={}",
                expanded_forms.len() + 1
            );
        }

        let ast =
            rlasp::lisp_to_ast::with_package_aware_symbol_identities(package_aware_symbols, || {
                rlasp::lisp_to_ast::with_read_time_env(&mut interp_env, || {
                    rlasp::lisp_to_ast::lisp_to_ast(original_form)
                })
            })
            .map_err(|e| format!("AST conversion failed: {}", e))?;

        let expanded_ast = rlasp::repl::macroexpand_all_to_ast(&ast, &mut interp_env)
            .map_err(|e| format!("semantic macroexpand failed: {}", e))?;
        if trace {
            eprintln!(
                "[semantic-artifact] macroexpanded count={}",
                expanded_forms.len() + 1
            );
            eprintln!("[semantic-artifact] original-ast={:?}", ast);
            eprintln!("[semantic-artifact] expanded-ast={:?}", expanded_ast);
        }

        if super::should_eval_for_semantic_compile_env(&expanded_ast) {
            let _ = rlasp::eval_with_persistent_env(&expanded_ast, &mut interp_env);
            if trace {
                eprintln!(
                    "[semantic-artifact] compile-env-eval count={}",
                    expanded_forms.len() + 1
                );
            }
        }

        let expanded_result = rlasp::repl::ast_to_result(&expanded_ast)
            .map_err(|e| format!("expanded form conversion failed: {}", e))?;
        let expanded_form = unsafe {
            rlasp_runtime::LispObject::from_raw(super::eval_result_to_lisp_object(
                &expanded_result,
                &mut interp_env,
            ))
        };
        if trace {
            eprintln!("[semantic-artifact] expanded-result={:?}", expanded_result);
        }
        expanded_forms.push((original_form, expanded_form));
    }

    rlasp::repl::sync_global_function_bindings_from_env(&interp_env);
    super::MLIR_INTERP_ENV.with(|cell| *cell.borrow_mut() = interp_env);
    Ok(expanded_forms)
}

pub(crate) fn compile_semantic_unit_mlir_artifact(
    source: &str,
    artifact_path: &str,
) -> std::result::Result<(), String> {
    let _gc_pause = rlasp_runtime::gc::GcPauseGuard::new();
    let trace = super::env_var_truthy("RLASP_TRACE_SEMANTIC_ARTIFACT");
    if !super::mlir_seed_runner_active() {
        if let Ok(seed_runner) = std::env::var("RLASP_MLIR_BRIDGE_SEED_RUNNER") {
            if !seed_runner.trim().is_empty() {
                super::seed_bridge_env_from_runner_file(seed_runner.trim()).map_err(|e| {
                    format!(
                        "semantic compile seed failed for {}: {}",
                        seed_runner.trim(),
                        e
                    )
                })?;
            }
        }
    }
    if trace {
        eprintln!("[semantic-artifact] begin");
    }
    let expanded_forms = expand_source_forms_for_semantic_unit(source)?;
    if trace {
        eprintln!(
            "[semantic-artifact] expanded-forms={}",
            expanded_forms.len()
        );
    }
    let unit = rlasp_compiler::compile_expanded_unit_with_originals(
        expanded_forms,
        rlasp_compiler::CompilationMode::MlirJit,
    )
    .map_err(|e| format!("semantic compilation failed: {}", e))?;
    if trace {
        eprintln!(
            "[semantic-artifact] semantic-unit forms={} functions={}",
            unit.forms.len(),
            unit.functions.len()
        );
    }
    let module = irlasp::ObjectEmitter::lower(&unit)?;
    if trace {
        eprintln!("[semantic-artifact] lowered");
    }
    let argslist_functions = extract_argslist_functions_from_mlir(module.as_str());
    irlasp::ObjectEmitter::emit_module(
        &module,
        artifact_path,
        irlasp::NativeArtifactKind::MlirBytecode,
    )?;
    if trace {
        eprintln!("[semantic-artifact] emitted");
    }
    if !argslist_functions.is_empty() {
        write_artifact_argslist_sidecar(artifact_path, &argslist_functions)?;
    }
    write_semantic_artifact_sidecar(artifact_path)
}
