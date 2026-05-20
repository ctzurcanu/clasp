use crate::lib_stack::StackMLIRCodegen;
use anyhow::{anyhow, Result};
use rlasp_compiler::SemanticUnit;
use std::collections::HashMap;
use std::fs;

#[derive(Debug, Clone)]
pub struct MlirModule {
    pub text: String,
}

impl MlirModule {
    pub fn as_str(&self) -> &str {
        &self.text
    }

    pub fn write_to_path(&self, path: &str) -> Result<()> {
        fs::write(path, &self.text).map_err(|e| anyhow!("failed to write {}: {}", path, e))
    }
}

pub struct MlirLowerer;

#[derive(Debug, Clone)]
struct ExtractedSemanticTopLevelFunction {
    binding_name: String,
    raw_name: String,
    params: Vec<String>,
    defaults: HashMap<String, rlasp::ir::ASTNode>,
    supplied_p_vars: HashMap<String, String>,
    key_params: HashMap<String, String>,
    body: rlasp::ir::ASTNode,
    alias_names: Vec<String>,
}

fn canonical_function_binding_name(name: &str) -> String {
    if name.starts_with("%FN%") {
        return name.to_string();
    }
    let base = name.rsplit(':').next().unwrap_or(name);
    if base.to_ascii_uppercase().starts_with("%FN%") {
        base.to_string()
    } else {
        name.to_string()
    }
}

fn extract_semantic_top_level_function(
    ast: &rlasp::ir::ASTNode,
) -> Option<ExtractedSemanticTopLevelFunction> {
    use rlasp::ir::{ASTNode, ConstantValue};

    let ASTNode::Progn { exprs } = ast else {
        return None;
    };
    let ASTNode::Setq { var, value } = exprs.first()? else {
        return None;
    };
    let binding_name = canonical_function_binding_name(var);
    if !binding_name.to_ascii_uppercase().starts_with("%FN%") {
        return None;
    }
    let ASTNode::Call { function, args } = value.as_ref() else {
        return None;
    };
    let fn_head = match function.as_ref() {
        ASTNode::Variable(name) => name.as_str(),
        ASTNode::Constant(ConstantValue::Symbol(name)) => name.as_str(),
        _ => return None,
    };
    let fn_base = fn_head.rsplit(':').next().unwrap_or(fn_head);
    if !fn_base.eq_ignore_ascii_case("top-level-function") || args.len() != 1 {
        return None;
    }
    let ASTNode::Lambda {
        params,
        defaults,
        supplied_p_vars,
        key_params,
        body,
    } = &args[0]
    else {
        return None;
    };

    let mut alias_names = Vec::new();
    for expr in exprs.iter().skip(1) {
        let ASTNode::Setq { var, value } = expr else {
            continue;
        };
        let ASTNode::Variable(value_name) = value.as_ref() else {
            continue;
        };
        if canonical_function_binding_name(value_name).eq_ignore_ascii_case(&binding_name) {
            let alias_name = canonical_function_binding_name(var);
            if !alias_name.eq_ignore_ascii_case(&binding_name) {
                alias_names.push(alias_name);
            }
        }
    }
    alias_names.sort_by_key(|name| name.to_ascii_lowercase());
    alias_names.dedup_by(|a, b| a.eq_ignore_ascii_case(b));

    let raw_name = binding_name.trim_start_matches("%FN%").to_string();
    let body = if body.len() == 1 {
        body[0].clone()
    } else {
        ASTNode::Progn {
            exprs: body.clone(),
        }
    };

    Some(ExtractedSemanticTopLevelFunction {
        binding_name,
        raw_name,
        params: params.clone(),
        defaults: defaults.clone(),
        supplied_p_vars: supplied_p_vars.clone(),
        key_params: key_params.clone(),
        body,
        alias_names,
    })
}

fn top_level_function_registration_ast(
    extracted: &ExtractedSemanticTopLevelFunction,
) -> rlasp::ir::ASTNode {
    use rlasp::ir::{ASTNode, ConstantValue};

    let mut exprs = Vec::with_capacity(extracted.alias_names.len() + 2);
    exprs.push(ASTNode::Setq {
        var: extracted.binding_name.clone(),
        value: Box::new(ASTNode::Variable(extracted.binding_name.clone())),
    });
    for alias_name in &extracted.alias_names {
        exprs.push(ASTNode::Setq {
            var: alias_name.clone(),
            value: Box::new(ASTNode::Variable(extracted.binding_name.clone())),
        });
    }
    exprs.push(ASTNode::Constant(ConstantValue::Symbol(
        extracted.raw_name.clone(),
    )));
    ASTNode::Progn { exprs }
}

impl MlirLowerer {
    pub fn lower(unit: &SemanticUnit) -> Result<MlirModule> {
        fn find_malformed_pushnew(ast: &rlasp::ir::ASTNode) -> Option<rlasp::ir::ASTNode> {
            match ast {
                rlasp::ir::ASTNode::Call { function, args } => {
                    let head_name = match function.as_ref() {
                        rlasp::ir::ASTNode::Variable(name) => Some(name.as_str()),
                        rlasp::ir::ASTNode::Constant(rlasp::ir::ConstantValue::Symbol(name)) => {
                            Some(name.as_str())
                        }
                        _ => None,
                    };
                    if let Some(name) = head_name {
                        let base = name.rsplit(':').next().unwrap_or(name);
                        if base.eq_ignore_ascii_case("pushnew") && args.len() < 2 {
                            return Some(ast.clone());
                        }
                    }
                    find_malformed_pushnew(function)
                        .or_else(|| args.iter().find_map(find_malformed_pushnew))
                }
                rlasp::ir::ASTNode::If {
                    test,
                    then_branch,
                    else_branch,
                } => find_malformed_pushnew(test)
                    .or_else(|| find_malformed_pushnew(then_branch))
                    .or_else(|| find_malformed_pushnew(else_branch)),
                rlasp::ir::ASTNode::Progn { exprs }
                | rlasp::ir::ASTNode::Block { body: exprs, .. }
                | rlasp::ir::ASTNode::Vector(exprs)
                | rlasp::ir::ASTNode::Macro { body: exprs, .. }
                | rlasp::ir::ASTNode::Defmethod { body: exprs, .. } => {
                    exprs.iter().find_map(find_malformed_pushnew)
                }
                rlasp::ir::ASTNode::Let { bindings, body }
                | rlasp::ir::ASTNode::LetStar { bindings, body } => bindings
                    .iter()
                    .map(|(_, value)| value)
                    .chain(body.iter())
                    .find_map(find_malformed_pushnew),
                rlasp::ir::ASTNode::Lambda { defaults, body, .. } => defaults
                    .values()
                    .chain(body.iter())
                    .find_map(find_malformed_pushnew),
                rlasp::ir::ASTNode::Setq { value, .. }
                | rlasp::ir::ASTNode::Quote(value)
                | rlasp::ir::ASTNode::Backquote(value)
                | rlasp::ir::ASTNode::Unquote(value)
                | rlasp::ir::ASTNode::UnquoteSplicing(value) => find_malformed_pushnew(value),
                rlasp::ir::ASTNode::ReturnFrom { value, .. } => value
                    .as_ref()
                    .and_then(|inner| find_malformed_pushnew(inner)),
                rlasp::ir::ASTNode::DottedPair { car, cdr } => {
                    find_malformed_pushnew(car).or_else(|| find_malformed_pushnew(cdr))
                }
                rlasp::ir::ASTNode::Cond { clauses } => {
                    clauses.iter().find_map(|(test, result)| {
                        find_malformed_pushnew(test).or_else(|| find_malformed_pushnew(result))
                    })
                }
                rlasp::ir::ASTNode::Loop {
                    start,
                    when_condition,
                    collect,
                    sum,
                    else_collect,
                    else_sum,
                    limit,
                    ..
                } => start
                    .iter()
                    .map(|expr| expr.as_ref())
                    .chain(std::iter::once(limit.as_ref()))
                    .chain(when_condition.iter().map(|expr| expr.as_ref()))
                    .chain(collect.iter().map(|expr| expr.as_ref()))
                    .chain(sum.iter().map(|expr| expr.as_ref()))
                    .chain(else_collect.iter().map(|expr| expr.as_ref()))
                    .chain(else_sum.iter().map(|expr| expr.as_ref()))
                    .find_map(find_malformed_pushnew),
                rlasp::ir::ASTNode::CCall { args, .. }
                | rlasp::ir::ASTNode::CppMethodCall { args, .. } => {
                    args.iter().find_map(find_malformed_pushnew)
                }
                rlasp::ir::ASTNode::ArrayLiteral { elements, .. } => {
                    elements.iter().find_map(find_malformed_pushnew)
                }
                rlasp::ir::ASTNode::HashTable { entries } => entries.iter().find_map(|(k, v)| {
                    find_malformed_pushnew(k).or_else(|| find_malformed_pushnew(v))
                }),
                _ => None,
            }
        }
        let mut codegen = StackMLIRCodegen::new_semantic("semantic_unit");
        let mut batch_names = Vec::with_capacity(unit.forms.len());
        let defaults = HashMap::new();
        let supplied_p_vars = HashMap::new();
        let key_params = HashMap::new();

        for (idx, form) in unit.forms.iter().enumerate() {
            let ast = rlasp::lisp_to_ast::with_package_aware_symbol_identities(true, || {
                rlasp::lisp_to_ast::lisp_to_ast(form.expanded_form)
            })
            .map_err(|e| anyhow!("semantic form {} lowering failed: {}", idx, e))?;
            if let Ok(target_raw) = std::env::var("RLASP_TRACE_SEMANTIC_LOWER_AST_INDEX") {
                if let Ok(target_idx) = target_raw.parse::<usize>() {
                    if idx == target_idx {
                        eprintln!("[semantic-lower-ast] form={} ast={:?}", idx, ast);
                    }
                }
            }
            if std::env::var_os("RLASP_DEBUG_PUSHNEW").is_some() {
                if let Some(bad) = find_malformed_pushnew(&ast) {
                    eprintln!(
                        "[semantic-lower-pushnew] form={} ast={:?} bad={:?}",
                        idx, ast, bad
                    );
                }
            }
            let fn_name = format!("__semantic_form_{}", idx);
            if let Some(extracted) = extract_semantic_top_level_function(&ast) {
                codegen.compile_function(
                    &extracted.binding_name,
                    &extracted.params,
                    &extracted.defaults,
                    &extracted.supplied_p_vars,
                    &extracted.key_params,
                    &extracted.body,
                )?;
                let registration = top_level_function_registration_ast(&extracted);
                codegen.compile_function(
                    &fn_name,
                    &[],
                    &defaults,
                    &supplied_p_vars,
                    &key_params,
                    &registration,
                )?;
            } else {
                codegen.compile_function(
                    &fn_name,
                    &[],
                    &defaults,
                    &supplied_p_vars,
                    &key_params,
                    &ast,
                )?;
            }
            batch_names.push(fn_name);
        }

        codegen.compile_main_with_batches(&batch_names)?;
        Ok(MlirModule {
            text: codegen.finalize(),
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rlasp_compiler::{compile_source_unit, CompilationMode};

    #[test]
    fn lower_semantic_unit_to_mlir_module() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit("(+ 1 2)", CompilationMode::MlirJit).unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("__semantic_form_0"));
        assert!(module.text.contains("__main"));
    }

    #[test]
    fn lower_not_without_bridge_dispatch() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit("(not nil)", CompilationMode::MlirJit).unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_eq"));
        assert!(!module.text.contains("\"not\""));
    }

    #[test]
    fn semantic_lowering_rejects_eval_fallback_forms() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit("(handler-case 1 (error (e) e))", CompilationMode::MlirJit)
            .unwrap();
        let err = MlirLowerer::lower(&unit).unwrap_err().to_string();
        assert!(err.contains("semantic MLIR lowering cannot use eval fallback"));
        assert!(err.contains("handler-case"));
    }

    #[test]
    fn lower_find_with_test_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit =
            compile_source_unit("(find 2 '(1 2 3) :test #'eql)", CompilationMode::MlirJit).unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_find_full"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_position_with_key_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(position 2 '((1) (2) (3)) :key #'car :test #'eql)",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_position_full"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_prog1_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit("(prog1 1 2 3)", CompilationMode::MlirJit).unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_multiple_value_list"));
        assert!(module.text.contains("@cc_values_pack"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_prog2_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit("(prog2 1 2 3)", CompilationMode::MlirJit).unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_multiple_value_list"));
        assert!(module.text.contains("@cc_values_pack"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_defpackage_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(defpackage :semantic-pkg (:use :cl) (:export :answer))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("SEMANTIC-PKG"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_define_package_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(define-package :semantic-uiop-pkg (:use :cl) (:export :answer))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("SEMANTIC-UIOP-PKG"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_find_class_optional_args_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit =
            compile_source_unit("(find-class 'cons nil nil)", CompilationMode::MlirJit).unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("find-class"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_debug_stack_probe_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(defun function-to-show-up-in-backtrace ()
               (clasp-debug:with-stack (stack)
                 (clasp-debug:map-stack
                   (lambda (frame)
                     (when (eq (clasp-debug:frame-function-name frame)
                               'function-to-show-up-in-backtrace)
                       (return-from function-to-show-up-in-backtrace
                         (clasp-debug:frame-function-lambda-list frame))))
                   stack)
                 nil))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_debug_current_stack"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_debug_stack_wrappers_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(values
               (clasp-debug:with-truncated-stack ()
                 (let ((seen nil))
                   (clasp-debug:with-stack (stack)
                     (clasp-debug:map-stack
                       (lambda (frame)
                         (when (eq (clasp-debug:frame-function-name frame)
                                   'call-with-truncated-stack)
                           (setf seen t)))
                       stack))
                   seen))
               (clasp-debug:with-capped-stack ()
                 (let ((seen nil))
                   (clasp-debug:with-stack (stack)
                     (clasp-debug:map-stack
                       (lambda (frame)
                         (when (eq (clasp-debug:frame-function-name frame)
                                   'call-with-capped-stack)
                           (setf seen t)))
                       stack))
                   seen)))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("call-with-truncated-stack"));
        assert!(module.text.contains("call-with-capped-stack"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_print_backtrace_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(let ((s (make-string-output-stream)))
               (clasp-debug:print-backtrace :stream s)
               (get-output-stream-string s))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_with_simple_restart_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(with-simple-restart (continue \"continue\") (invoke-restart 'continue))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_push_single_restart"));
        assert!(module.text.contains("@cc_restart_invocation_matches"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_rest_lambda_records_args_list_metadata() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(funcall #'(lambda (common-lisp:&rest args) args) 1 2 3)",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@__argslist_functions"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_restart_case_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(restart-case (invoke-restart 'bar 1 2 3)
               (bar (&rest args) (values-list args)))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_push_restart_frame"));
        assert!(module.text.contains("@cc_restart_invocation_args"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_handler_bind_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(handler-bind ((error (lambda (c) c)))
               (error \"boom\"))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_push_handler_frame"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_define_compiler_macro_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(define-compiler-macro bar (&whole form x) form)",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_deftype_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(deftype mlir-bridge-off-integer () 'integer)",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_define_symbol_macro_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(define-symbol-macro mlir-bridge-off-symbol 42)",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_define_condition_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(define-condition mlir-bridge-off-error (error) ())",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_defclass"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_defclass_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(defclass mlir-bridge-off-class () ())",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_defclass"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_defclass_with_metaclass_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(defclass mlir-bridge-meta-class () ())
             (defclass mlir-bridge-meta-target () () (:metaclass mlir-bridge-meta-class))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(module.text.contains("@cc_defclass_with_metaclass"));
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_block_with_nested_control_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(block done
               (if t
                   (return-from done 1)
                   2))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_ecase_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(ecase :b
               (:a 1)
               (:b 2))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_etypecase_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(etypecase 3
               (string 1)
               (integer 2))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_ccase_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(let ((x :b))
               (ccase x
                 (:a 1)
                 (:b 2)))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }

    #[test]
    fn lower_ctypecase_without_eval_fallback() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(let ((x 3))
               (ctypecase x
                 (string 1)
                 (integer 2)))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        let module = MlirLowerer::lower(&unit).unwrap();
        assert!(!module.text.contains("func.call @cc_eval("));
    }
}
