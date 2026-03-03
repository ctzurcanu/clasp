/// Convert LispObject from rlasp-reader to ASTNode for evaluation

use crate::ir::{ASTNode, ConstantValue, SlotSpec};
use super::eval::{eval_with_persistent_env, result_to_ast, result_to_data_ast, EvalResult};
use rlasp_runtime::{FloatFormat, LispObject, RVector, header::{TypeHeader, ObjectType}};
use std::cell::RefCell;
use std::collections::HashMap;
use std::sync::atomic::{AtomicUsize, Ordering};

thread_local! {
    static READ_TIME_ENV_PTR: RefCell<Option<*mut HashMap<String, EvalResult>>> = RefCell::new(None);
}

static PSETQ_TMP_COUNTER: AtomicUsize = AtomicUsize::new(0);

pub fn with_read_time_env<F, R>(env: &mut HashMap<String, EvalResult>, f: F) -> R
where
    F: FnOnce() -> R,
{
    struct ResetGuard(Option<*mut HashMap<String, EvalResult>>);

    impl Drop for ResetGuard {
        fn drop(&mut self) {
            READ_TIME_ENV_PTR.with(|ptr| {
                *ptr.borrow_mut() = self.0;
            });
        }
    }

    let prev = READ_TIME_ENV_PTR.with(|ptr| ptr.replace(Some(env as *mut _)));
    let _guard = ResetGuard(prev);
    f()
}

fn eval_read_time_form(form: LispObject, as_data: bool) -> Result<ASTNode, String> {
    let ast = lisp_to_ast(form)?;
    let env_ptr = READ_TIME_ENV_PTR.with(|ptr| *ptr.borrow());
    let result = if let Some(env_ptr) = env_ptr {
        // Safety: pointer is only set within with_read_time_env and lives for the duration.
        let env = unsafe { &mut *env_ptr };
        eval_with_persistent_env(&ast, env)?
    } else {
        let mut env = HashMap::new();
        eval_with_persistent_env(&ast, &mut env)?
    };

    if as_data {
        result_to_data_ast(&result)
    } else {
        result_to_ast(&result)
    }
}

pub fn lisp_to_ast(obj: LispObject) -> Result<ASTNode, String> {
    // Special case: raw value 0 is ambiguous - it could be fixnum(0) or nil()
    // The runtime uses the same representation for both.
    // We treat raw 0 as NIL (empty list) rather than the number 0.
    // To use the number 0, it must come from a different code path (e.g., arithmetic).
    if obj.is_nil() {
        return Ok(ASTNode::nil());
    }

    // Fixnum - but note that fixnum(0) is handled above as NIL
    if let Some(n) = obj.as_fixnum() {
        return Ok(ASTNode::fixnum(n));
    }

    // T (represented as fixnum 1 - already checked above)

    // General object - could be Symbol, Number, Vector, etc.
    if obj.is_general() {
        // Get pointer for type header checking
        if let Some(ptr) = obj.as_general_ptr::<u8>() {
            if !ptr.is_null() {
                // Check type header to determine actual type
                if let Some(obj_type) = unsafe { TypeHeader::from_ptr(ptr) } {
                    match obj_type {
                        ObjectType::Vector => {
                            let vector = unsafe { &*(ptr as *const RVector) };
                            let mut elements = Vec::new();
                            for elem in vector.as_slice() {
                                // Reader vectors/arrays are self-evaluating literals.
                                // Convert their elements as data so symbols remain symbols,
                                // not variable references.
                                elements.push(lisp_to_ast_as_data(*elem)?);
                            }
                            return Ok(ASTNode::Vector(elements));
                        }
                        ObjectType::Symbol => {
                            let symbol = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                            let name = symbol.name().to_string();

                            // Check if it's a string disguised as a symbol (starts and ends with ")
                            if name.starts_with('"') && name.ends_with('"') {
                                let string_content = &name[1..name.len()-1];
                                return Ok(ASTNode::Constant(ConstantValue::String(string_content.to_string())));
                            }

                            // Keywords are self-evaluating constants
                            if name.starts_with(':') {
                                return Ok(ASTNode::Constant(ConstantValue::Symbol(name.to_string())));
                            }

                            // Special case: the symbol 'nil' should be treated as NIL constant
                            if name.eq_ignore_ascii_case("nil") {
                                return Ok(ASTNode::nil());
                            }

                            // Special case: the symbol 't' should be treated as T (true)
                            if name.eq_ignore_ascii_case("t") {
                                return Ok(ASTNode::Constant(ConstantValue::T));
                            }

                            return Ok(ASTNode::variable(name));
                        }
                        ObjectType::String => {
                            // Strings are self-evaluating in code position.
                            let str_ptr = ptr as *const rlasp_runtime::RString;
                            let s = unsafe { (*str_ptr).as_str() };
                            return Ok(ASTNode::Constant(ConstantValue::String(s.to_string())));
                        }
                        ObjectType::Number => {
                            let num = unsafe { &*(ptr as *const rlasp_runtime::Number) };
                            match &num.value {
                                rlasp_runtime::NumberValue::Float(f) => {
                                    let format = num.float_format().unwrap_or(FloatFormat::Double);
                                    return Ok(ASTNode::Constant(ConstantValue::Float(*f, format)));
                                }
                                rlasp_runtime::NumberValue::Bignum(b) => {
                                    return Ok(ASTNode::Constant(ConstantValue::Bignum(b.to_string())));
                                }
                                rlasp_runtime::NumberValue::Ratio(r) => {
                                    let mut num_s = r.numerator_ref().to_string();
                                    if *r < malachite::Rational::from(0) {
                                        num_s = format!("-{}", num_s);
                                    }
                                    let den_s = r.denominator_ref().to_string();
                                    return Ok(ASTNode::Constant(ConstantValue::Ratio(num_s, den_s)));
                                }
                                rlasp_runtime::NumberValue::Complex(c) => {
                                    return Ok(ASTNode::Constant(ConstantValue::Complex(c.re, c.im)));
                                }
                            }
                        }
                        _ => {
                            // Other types - fall through to error
                        }
                    }
                }
            }
        }
    }

    // Cons (list)
    if obj.is_cons() {
        return cons_to_ast(obj);
    }

    // Character
    if obj.is_character() {
        if let Some(ch) = obj.as_character() {
            return Ok(ASTNode::Constant(ConstantValue::Character(ch)));
        }
    }

    // HashTable - convert to AST HashTable node
    let debug_str = format!("{:?}", obj);
    if debug_str.starts_with("HashTable") || debug_str.contains("HASH-TABLE") {
        // For now, return an empty hash table
        // TODO: extract actual entries if the runtime provides access
        return Ok(ASTNode::HashTable {
            entries: vec![],
        });
    }

    let mut details = String::new();
    if obj.is_general() {
        if let Some(ptr) = obj.as_general_ptr::<u8>() {
            if ptr.is_null() {
                details.push_str(" [general-ptr=null]");
            } else if let Some(obj_type) = unsafe { TypeHeader::from_ptr(ptr) } {
                details.push_str(&format!(" [general-type={:?} ptr={:p}]", obj_type, ptr));
            } else {
                details.push_str(&format!(" [general-type=<invalid-header> ptr={:p}]", ptr));
            }
        } else {
            details.push_str(" [general-ptr=<none>]");
        }
    }

    Err(format!("Cannot convert LispObject to AST: {:?}{}", obj, details))
}

fn cons_to_ast(obj: LispObject) -> Result<ASTNode, String> {
    if !obj.is_cons() {
        return Err("Not a cons".to_string());
    }

    let cons_ptr = obj.as_cons_ptr().ok_or("Invalid cons pointer")?;
    if cons_ptr.is_null() {
        return Ok(ASTNode::nil());
    }
    let cons = unsafe { &*cons_ptr };
    let car = cons.car();
    let cdr = cons.cdr();

    // Check for quote - MUST verify type header before casting to Symbol
    let car_is_symbol = if car.is_general() && !car.is_number() {
        if let Some(ptr) = car.as_general_ptr::<u8>() {
            if !ptr.is_null() {
                matches!(unsafe { TypeHeader::from_ptr(ptr) }, Some(ObjectType::Symbol))
            } else { false }
        } else { false }
    } else { false };

    if car_is_symbol {
        if let Some(symbol_ptr) = car.as_general_ptr::<rlasp_runtime::Symbol>() {
            if !symbol_ptr.is_null() {
                let symbol = unsafe { &*symbol_ptr };
                let name = symbol.name().to_string();

                if name == "quote" {
                    // (quote x) -> Quote(x)
                    // IMPORTANT: Convert quoted content as DATA, not as CODE
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let quoted_obj = cdr_cons.car();
                                let quoted = lisp_to_ast_as_data(quoted_obj)?;
                                return Ok(ASTNode::Quote(Box::new(quoted)));
                            }
                        }
                    }
                }

                if name == "backquote" || name == "quasiquote" {
                    // (backquote x) -> Backquote(x)
                    // The inner form is DATA, not executable code. Parsing it as code
                    // breaks macro templates by trying to validate forms like dolist/funcall
                    // while they are only being constructed.
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let form_obj = cdr_cons.car();
                                let form = lisp_to_ast_as_data(form_obj)?;
                                return Ok(ASTNode::Backquote(Box::new(form)));
                            }
                        }
                    }
                }

                if name == "unquote" {
                    // (unquote x) -> Unquote(x)
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let form_obj = cdr_cons.car();
                                let form = lisp_to_ast(form_obj)?;
                                return Ok(ASTNode::Unquote(Box::new(form)));
                            }
                        }
                    }
                }

                if name == "unquote-splicing" {
                    // (unquote-splicing x) -> UnquoteSplicing(x)
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let form_obj = cdr_cons.car();
                                let form = lisp_to_ast(form_obj)?;
                                return Ok(ASTNode::UnquoteSplicing(Box::new(form)));
                            }
                        }
                    }
                }
            }
        }
    }

    // Check for special forms - reuse car_is_symbol check from above
    if car_is_symbol {
        if let Some(symbol_ptr) = car.as_general_ptr::<rlasp_runtime::Symbol>() {
            if !symbol_ptr.is_null() {
                let symbol = unsafe { &*symbol_ptr };
                let raw_name = symbol.name().to_string();

                // Normalize name by stripping common package prefixes (case-insensitive)
                let name_lower = raw_name.to_lowercase();
                let name = if name_lower.starts_with("cl:") || name_lower.starts_with("cl::") {
                    raw_name.splitn(2, ':').last().unwrap_or(raw_name.as_str()).trim_start_matches(':')
                } else if name_lower.starts_with("common-lisp:") || name_lower.starts_with("common-lisp::") {
                    raw_name.splitn(2, ':').last().unwrap_or(raw_name.as_str()).trim_start_matches(':')
                } else {
                    raw_name.as_str()
                };

                let base = name.rsplit(':').next().unwrap_or(name);
                if base.eq_ignore_ascii_case("read-time-eval") {
                    if !cdr.is_cons() {
                        return Err("read-time-eval requires one argument".to_string());
                    }
                    let cdr_ptr = cdr.as_cons_ptr().ok_or("Invalid cons pointer")?;
                    if cdr_ptr.is_null() {
                        return Err("read-time-eval requires one argument".to_string());
                    }
                let cdr_cons = unsafe { &*cdr_ptr };
                    let eval_arg = cdr_cons.car();
                    let rest = cdr_cons.cdr();
                    if !rest.is_nil() {
                        return Err("read-time-eval requires one argument".to_string());
                    }
                    return eval_read_time_form(eval_arg, false);
                }

                if base.eq_ignore_ascii_case("psetq") {
                    let args = cdr_to_vec(cdr)?;
                    if args.len() % 2 != 0 {
                        return Err("Odd number of args to PSETQ.".to_string());
                    }
                    if args.is_empty() {
                        return Ok(ASTNode::nil());
                    }

                    // Parallel assignment expansion:
                    // (psetq a v1 b v2) => (let ((tmp1 v1) (tmp2 v2)) (setq a tmp1) (setq b tmp2) nil)
                    let stamp = PSETQ_TMP_COUNTER.fetch_add(1, Ordering::SeqCst);
                    let mut bindings: Vec<(String, ASTNode)> = Vec::new();
                    let mut body: Vec<ASTNode> = Vec::new();

                    for i in (0..args.len()).step_by(2) {
                        let var = match &args[i] {
                            ASTNode::Variable(v) => v.clone(),
                            _ => return Err("psetq requires symbol variables".to_string()),
                        };
                        let tmp_name = format!("%%PSETQ_TMP_{}_{}%%", stamp, i / 2);
                        bindings.push((tmp_name.clone(), args[i + 1].clone()));
                        body.push(ASTNode::setq(var, ASTNode::variable(tmp_name)));
                    }
                    body.push(ASTNode::nil());
                    return Ok(ASTNode::let_bindings(bindings, body));
                }

                if std::env::var("RLASP_DEBUG_DEFUN").is_ok()
                    && name.eq_ignore_ascii_case("defun")
                {
                    let args = cdr_to_vec(cdr.clone())?;
                    eprintln!("[defun-raw] args={:?}", args);
                }
                match name {
                    "if" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("if requires at least 2 arguments".to_string());
                        }
                        return Ok(ASTNode::if_then_else(
                            args[0].clone(),
                            args[1].clone(),
                            args.get(2).cloned().unwrap_or(ASTNode::nil())
                        ));
                    }
                    "when" => {
                        // (when test body...) => (if test (progn body...) nil)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("when requires at least 1 argument (test)".to_string());
                        }
                        if std::env::var("RLASP_DEBUG_WHEN").is_ok() {
                            if let ASTNode::Call { function, args: test_args } = &args[0] {
                                if let ASTNode::Variable(fn_name) = function.as_ref() {
                                    if fn_name.eq_ignore_ascii_case("null")
                                        && test_args.len() == 1
                                        && matches!(&test_args[0], ASTNode::Variable(v) if v.eq_ignore_ascii_case("specified") || v.eq_ignore_ascii_case("defaults"))
                                    {
                                        eprintln!("[when-null] args={:?}", args);
                                    }
                                }
                            }
                        }
                        let test = args[0].clone();
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        return Ok(ASTNode::if_then_else(test, body, ASTNode::nil()));
                    }
                    "unless" => {
                        // (unless test body...) => (if (not test) (progn body...) nil)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("unless requires at least 1 argument (test)".to_string());
                        }
                        let test = args[0].clone();
                        let negated_test = ASTNode::call(
                            ASTNode::variable("not"),
                            vec![test]
                        );
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        return Ok(ASTNode::if_then_else(negated_test, body, ASTNode::nil()));
                    }
                    "case" | "ecase" => {
                        // (case expr (key1 result1...) (key2 result2...) ...)
                        // => (let ((tmp expr)) (cond ((eql tmp key1) result1...) ...))
                        // Handle case clauses at raw LispObject level to avoid
                        // interpreting key lists as function calls
                        let raw_clauses = raw_cdr_to_vec(cdr.clone())?;
                        if raw_clauses.is_empty() {
                            // (case) with no arguments - return nil
                            return Ok(ASTNode::nil());
                        }

                        let keyform = lisp_to_ast(raw_clauses[0].clone())?;
                        if std::env::var("RLASP_DEBUG_CASE").is_ok() {
                            if let ASTNode::Call { function, args } = &keyform {
                                if let ASTNode::Variable(fn_name) = function.as_ref() {
                                    if fn_name.eq_ignore_ascii_case("first")
                                        && args.len() == 1
                                        && matches!(&args[0], ASTNode::Variable(v) if v.eq_ignore_ascii_case("directory"))
                                    {
                                        let mut clause_keys = Vec::new();
                                        for raw_clause in raw_clauses.iter().skip(1) {
                                            if let Some(cons_ptr) = raw_clause.as_cons_ptr() {
                                                if cons_ptr.is_null() {
                                                    clause_keys.push("null-cons".to_string());
                                                    continue;
                                                }
                                                let cons = unsafe { &*cons_ptr };
                                                clause_keys.push(debug_key_list(&cons.car()));
                                            } else {
                                                clause_keys.push(format!("non-cons: {:?}", raw_clause));
                                            }
                                        }
                                        eprintln!(
                                            "[case-dir] raw_len={} clause_keys={:?}",
                                            raw_clauses.len(),
                                            clause_keys
                                        );
                                    }
                                }
                            }
                        }
                        let tmp_var = "__case_tmp".to_string();

                        // Build cond clauses from raw LispObjects
                        let mut cond_clauses = Vec::new();
                        for raw_clause in &raw_clauses[1..] {
                            if let Some(clause_cons) = raw_clause.as_cons_ptr() {
                                if clause_cons.is_null() {
                                    continue;
                                }
                                let clause_cons = unsafe { &*clause_cons };
                                let key_obj = clause_cons.car();
                                let body_cdr = clause_cons.cdr();

                                // Convert key to test expression
                                let test = case_key_to_test(&key_obj, &tmp_var)?;

                                // Convert body forms
                                let body_forms = raw_cdr_to_vec(body_cdr)?;
                                let body_asts: Result<Vec<_>, _> = body_forms.iter()
                                    .map(|o| lisp_to_ast(o.clone()))
                                    .collect();
                                let body_asts = body_asts?;

                                let result = if body_asts.len() == 1 {
                                    body_asts[0].clone()
                                } else if body_asts.is_empty() {
                                    ASTNode::nil()
                                } else {
                                    ASTNode::progn(body_asts)
                                };

                                cond_clauses.push((test, result));
                            }
                        }

                        if std::env::var("RLASP_DEBUG_CASE").is_ok() && cond_clauses.is_empty() {
                            eprintln!(
                                "[case-empty] keyform={:?} raw_len={} raw_clauses={:?}",
                                keyform,
                                raw_clauses.len(),
                                raw_clauses
                            );
                        }

                        // Build (let ((tmp keyform)) (cond ...))
                        let cond_node = ASTNode::Cond { clauses: cond_clauses };
                        if std::env::var("RLASP_DEBUG_CASE").is_ok() {
                            if let ASTNode::Call { function, args } = &keyform {
                                if let ASTNode::Variable(fn_name) = function.as_ref() {
                                    if fn_name.eq_ignore_ascii_case("first")
                                        && args.len() == 1
                                        && matches!(&args[0], ASTNode::Variable(v) if v.eq_ignore_ascii_case("directory"))
                                    {
                                        eprintln!("[case-dir-ast] node={:?}", cond_node);
                                    }
                                }
                            }
                        }
                        return Ok(ASTNode::let_bindings(
                            vec![(tmp_var, keyform)],
                            vec![cond_node]
                        ));
                    }
                    "progn" => {
                        let exprs = cdr_to_vec(cdr)?;
                        return Ok(ASTNode::progn(exprs));
                    }
                    "block" => {
                        // (block name body...)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("block requires at least 1 argument (name)".to_string());
                        }
                        // If name contains unquote (from backquote), keep as Call for later evaluation
                        if contains_unquote(&args[0]) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("block".to_string())),
                                args,
                            });
                        }
                        // If name is a Backquote, keep as Call for macro expansion
                        if matches!(&args[0], ASTNode::Backquote(_)) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("block".to_string())),
                                args,
                            });
                        }
                        let name = match &args[0] {
                            ASTNode::Variable(n) => Some(n.clone()),
                            ASTNode::Constant(ConstantValue::Nil) => None,
                            ASTNode::Constant(ConstantValue::Symbol(s)) => Some(s.clone()),
                            // Handle quoted symbols: (quote foo) or 'foo
                            ASTNode::Quote(inner) => {
                                if let ASTNode::Variable(n) = inner.as_ref() {
                                    Some(n.clone())
                                } else if let ASTNode::Constant(ConstantValue::Symbol(s)) = inner.as_ref() {
                                    Some(s.clone())
                                } else {
                                    return Err("block name must be a symbol or nil".to_string());
                                }
                            }
                            // Handle (setf name) form for setf functions
                            ASTNode::Call { function, args: call_args } if call_args.len() == 1 => {
                                if let ASTNode::Variable(fn_name) = function.as_ref() {
                                    if fn_name.eq_ignore_ascii_case("setf") {
                                        if let ASTNode::Variable(setf_name) = &call_args[0] {
                                            Some(format!("(setf {})", setf_name))
                                        } else {
                                            return Err("block name must be a symbol or nil".to_string());
                                        }
                                    } else {
                                        return Err("block name must be a symbol or nil".to_string());
                                    }
                                } else {
                                    return Err("block name must be a symbol or nil".to_string());
                                }
                            }
                            _ => return Err(format!("block name must be a symbol or nil, got {:?}", &args[0])),
                        };
                        let body = if args.len() > 1 {
                            args[1..].to_vec()
                        } else {
                            vec![]
                        };
                        if std::env::var("RLASP_DEBUG_BLOCK").is_ok() {
                            if let Some(n) = &name {
                                if n.to_lowercase().contains("merge-pathnames*") {
                                    eprintln!("[block-merge] body={:?}", body);
                                }
                            }
                        }
                        return Ok(ASTNode::Block { name, body });
                    }
                    "return-from" => {
                        // (return-from name value)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("return-from requires at least 1 argument (block name)".to_string());
                        }
                        // If name contains unquote (from backquote), keep as Call for later evaluation
                        if contains_unquote(&args[0]) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("return-from".to_string())),
                                args,
                            });
                        }
                        let block_name = match &args[0] {
                            ASTNode::Variable(n) => Some(n.clone()),
                            ASTNode::Constant(ConstantValue::Nil) => None,
                            ASTNode::Constant(ConstantValue::Symbol(s)) => Some(s.clone()),
                            // Handle quoted symbols: (quote foo) or 'foo
                            ASTNode::Quote(inner) => {
                                if let ASTNode::Variable(n) = inner.as_ref() {
                                    Some(n.clone())
                                } else if let ASTNode::Constant(ConstantValue::Symbol(s)) = inner.as_ref() {
                                    Some(s.clone())
                                } else {
                                    return Err("return-from block name must be a symbol or nil".to_string());
                                }
                            }
                            // Handle (setf name) form for setf functions
                            ASTNode::Call { function, args: call_args } if call_args.len() == 1 => {
                                if let ASTNode::Variable(fn_name) = function.as_ref() {
                                    if fn_name.eq_ignore_ascii_case("setf") {
                                        if let ASTNode::Variable(setf_name) = &call_args[0] {
                                            Some(format!("(setf {})", setf_name))
                                        } else {
                                            return Err("return-from block name must be a symbol or nil".to_string());
                                        }
                                    } else {
                                        return Err("return-from block name must be a symbol or nil".to_string());
                                    }
                                } else {
                                    return Err("return-from block name must be a symbol or nil".to_string());
                                }
                            }
                            _ => return Err("return-from block name must be a symbol or nil".to_string()),
                        };
                        let value = args.get(1).cloned().map(Box::new);
                        return Ok(ASTNode::ReturnFrom { block_name, value });
                    }
                    "return" => {
                        // (return value) => (return-from nil value)
                        let args = cdr_to_vec(cdr)?;
                        let value = args.get(0).cloned().map(Box::new);
                        return Ok(ASTNode::ReturnFrom { block_name: None, value });
                    }
                    "cond" => {
                        // Parse: (cond (test1 result1) (test2 result2) ...)
                        // Handle clauses at raw LispObject level so the test expression
                        // isn't misinterpreted as a function position.
                        let raw_clauses = raw_cdr_to_vec(cdr.clone())?;
                        let mut clauses = Vec::new();

                        for raw_clause in raw_clauses {
                            if raw_clause.is_nil() {
                                continue;
                            }

                            if raw_clause.is_cons() {
                                let elems = raw_cdr_to_vec_with_first(raw_clause)?;
                                if elems.is_empty() {
                                    continue;
                                }

                                let test = lisp_to_ast(elems[0].clone())?;
                                let result = if elems.len() == 1 {
                                    // (test) - result is test value itself
                                    test.clone()
                                } else {
                                    let body_asts: Result<Vec<_>, _> = elems[1..]
                                        .iter()
                                        .map(|o| lisp_to_ast(o.clone()))
                                        .collect();
                                    let body_asts = body_asts?;
                                    if body_asts.len() == 1 {
                                        body_asts[0].clone()
                                    } else {
                                        ASTNode::progn(body_asts)
                                    }
                                };

                                if std::env::var("RLASP_DEBUG_COND").is_ok() {
                                    eprintln!("[cond] raw_clause={:?}", raw_clause);
                                    eprintln!("[cond] test={:?} result={:?}", test, result);
                                }

                                clauses.push((test, result));
                            } else {
                                // Non-list clause - treat as (test)
                                let test = lisp_to_ast(raw_clause)?;
                                clauses.push((test.clone(), test));
                            }
                        }

                        return Ok(ASTNode::Cond { clauses });
                    }
                    "setq" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() || args.len() % 2 != 0 {
                            return Err("setq requires an even number of arguments (var value pairs)".to_string());
                        }
                        if args.len() == 2 {
                            // Simple case: (setq var val)
                            match &args[0] {
                                ASTNode::Variable(var) => {
                                    return Ok(ASTNode::setq(var.clone(), args[1].clone()));
                                }
                                ASTNode::Unquote(_) => {
                                    // Inside backquote - don't validate yet, just create a Call
                                    return Ok(ASTNode::Call {
                                        function: Box::new(ASTNode::variable("setq".to_string())),
                                        args: args,
                                    });
                                }
                                _ => return Err("setq variable must be a symbol".to_string()),
                            }
                        }
                        // Multiple pairs: (setq x 1 y 2 z 3) => (progn (setq x 1) (setq y 2) (setq z 3))
                        let mut setqs = Vec::new();
                        for i in (0..args.len()).step_by(2) {
                            match &args[i] {
                                ASTNode::Variable(var) => {
                                    setqs.push(ASTNode::setq(var.clone(), args[i + 1].clone()));
                                }
                                ASTNode::Unquote(_) => {
                                    // Inside backquote - create individual setq calls
                                    setqs.push(ASTNode::Call {
                                        function: Box::new(ASTNode::variable("setq".to_string())),
                                        args: vec![args[i].clone(), args[i + 1].clone()],
                                    });
                                }
                                _ => return Err("setq variable must be a symbol".to_string()),
                            }
                        }
                        return Ok(ASTNode::progn(setqs));
                    }
                    "lambda" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("lambda requires at least 1 argument".to_string());
                        }
                        let (params, defaults, supplied_p_vars, key_params) = extract_params_with_defaults(&args[0]);
                        let body = args[1..].to_vec();
                        return Ok(ASTNode::lambda_with_supplied_p(params, defaults, supplied_p_vars, key_params, body));
                    }
                    "dotimes" => {
                        // Parse: (dotimes (var count [result]) body...)
                        // First get the control list and body from raw cdr
                        let cdr_list = cdr_to_vec(cdr)?;
                        if cdr_list.is_empty() {
                            return Err("dotimes requires a control list".to_string());
                        }

                        // Extract control list as (var count [result])
                        // The control has been parsed by lisp_to_ast, need to extract elements
                        let (var, count_ast, result_ast) = match &cdr_list[0] {
                            // If it's already a Call, we can extract var from first arg
                            ASTNode::Call { function, args: control_args } if control_args.len() >= 1 => {
                                let var = if let ASTNode::Variable(v) = &**function {
                                    v.clone()
                                } else {
                                    return Err("dotimes var must be a symbol".to_string());
                                };
                                let count = control_args.get(0)
                                    .ok_or("dotimes missing count")?
                                    .clone();
                                let result = control_args.get(1).cloned();
                                (var, count, result)
                            }
                            _ => return Err("dotimes control must be a list (var count [result])".to_string()),
                        };

                        let body = if cdr_list.len() > 1 {
                            cdr_list[1..].to_vec()
                        } else {
                            Vec::new()
                        };
                        return Ok(ASTNode::Dotimes {
                            var,
                            count: Box::new(count_ast),
                            result: result_ast.map(Box::new),
                            body,
                        });
                    }
                    "dolist" => {
                        // Parse: (dolist (var list [result]) body...)
                        let cdr_list = cdr_to_vec(cdr)?;
                        if cdr_list.is_empty() {
                            return Err("dolist requires a control list".to_string());
                        }

                        // Extract control list as (var list [result])
                        let (var, list_ast, result_ast) = match &cdr_list[0] {
                            ASTNode::Call { function, args: control_args } if control_args.len() >= 1 => {
                                let var = if let ASTNode::Variable(v) = &**function {
                                    v.clone()
                                } else {
                                    return Err("dolist var must be a symbol".to_string());
                                };
                                let list = control_args.get(0)
                                    .ok_or("dolist missing list")?
                                    .clone();
                                let result = control_args.get(1).cloned();
                                (var, list, result)
                            }
                            _ => return Err("dolist control must be a list (var list [result])".to_string()),
                        };

                        let body = if cdr_list.len() > 1 {
                            cdr_list[1..].to_vec()
                        } else {
                            Vec::new()
                        };
                        return Ok(ASTNode::Dolist {
                            var,
                            list: Box::new(list_ast),
                            result: result_ast.map(Box::new),
                            body,
                        });
                    }
                    "loop" => {
                        // Parse loop forms with full Common Lisp syntax:
                        // (loop for var from start below limit [when/unless/if condition] collect/sum expr [else collect/sum expr])
                        let cdr_list = cdr_to_vec(cdr)?;

                        // Try to parse as simple for loop, fall back to Call if parsing fails
                        if let Some(loop_ast) = try_parse_simple_loop(&cdr_list) {
                            return Ok(loop_ast);
                        }
                        // Fall back to Call for complex/unsupported loop forms
                        return Ok(ASTNode::Call {
                            function: Box::new(ASTNode::Variable("loop".to_string())),
                            args: cdr_list,
                        });
                    }
                    "let" => {
                        // Get raw args to handle bindings specially
                        let raw_args = raw_cdr_to_vec(cdr.clone())?;
                        if raw_args.is_empty() {
                            return Err("let requires at least 1 argument (bindings)".to_string());
                        }
                        // Check for unquote in the bindings to defer evaluation in backquote contexts
                        // Use raw LispObject check to avoid triggering special form interpretation
                        if contains_unquote_raw(&raw_args[0]) {
                            let args = cdr_to_vec(cdr)?;
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("let".to_string())),
                                args: args,
                            });
                        }
                        // Extract bindings from raw to avoid special form interpretation for var names
                        let bindings = extract_bindings_raw(raw_args[0].clone())?;
                        let body: Result<Vec<ASTNode>, String> = raw_args[1..].iter().map(|obj| lisp_to_ast(obj.clone())).collect();
                        return Ok(ASTNode::Let { bindings, body: body? });
                    }
                    "let*" => {
                        // Get raw args to handle bindings specially
                        let raw_args = raw_cdr_to_vec(cdr.clone())?;
                        if raw_args.is_empty() {
                            return Err("let* requires at least 1 argument (bindings)".to_string());
                        }
                        // Check for unquote in the bindings to defer evaluation in backquote contexts
                        // Use raw LispObject check to avoid triggering special form interpretation
                        if contains_unquote_raw(&raw_args[0]) {
                            let args = cdr_to_vec(cdr)?;
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("let*".to_string())),
                                args: args,
                            });
                        }
                        // Extract bindings from raw to avoid special form interpretation for var names
                        let bindings = extract_bindings_raw(raw_args[0].clone())?;
                        let body: Result<Vec<ASTNode>, String> = raw_args[1..].iter().map(|obj| lisp_to_ast(obj.clone())).collect();
                        return Ok(ASTNode::LetStar { bindings, body: body? });
                    }
                    "symbol-macrolet" => {
                        // Get raw args to handle bindings specially
                        let raw_args = raw_cdr_to_vec(cdr.clone())?;
                        if raw_args.is_empty() {
                            return Err("symbol-macrolet requires at least 1 argument (bindings)".to_string());
                        }
                        // Check for unquote in the bindings to defer evaluation in backquote contexts
                        if contains_unquote_raw(&raw_args[0]) {
                            let args = cdr_to_vec(cdr)?;
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("symbol-macrolet".to_string())),
                                args: args,
                            });
                        }
                        // Extract bindings from raw to avoid special form interpretation for var names
                        let bindings = extract_bindings_raw(raw_args[0].clone())?;
                        let body: Result<Vec<ASTNode>, String> = raw_args[1..].iter().map(|obj| lisp_to_ast(obj.clone())).collect();
                        let body = body?;

                        // Expand symbol macros in the body
                        let expanded_body: Result<Vec<ASTNode>, String> = body.iter()
                            .map(|expr| expand_symbol_macros(expr, &bindings))
                            .collect();

                        // Return the expanded body as a progn
                        return Ok(ASTNode::Progn { exprs: expanded_body? });
                    }
                    // "macrolet" is handled in eval_core.rs to properly evaluate macro bodies
                    // (the compile-time approach here couldn't handle (list ...) or other evaluated forms)
                    // "defun", "defmacro", "defvar", "defparameter" - handled in eval_core.rs
                    // to preserve forms for macros. Fall through to generic Call handling.
                    "defstruct" => {
                        // Keep DEFSTRUCT as a regular form so runtime DEFSTRUCT handling
                        // in eval_core.rs can process :conc-name/:include and related options.
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("defstruct requires at least a name".to_string());
                        }
                        return Ok(ASTNode::Call {
                            function: Box::new(ASTNode::variable("defstruct".to_string())),
                            args,
                        });
                    }
                    "defclass" => {
                        // (defclass name (superclasses...) ((slot options...) ...) class-options...)
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("defclass requires at least name and superclasses".to_string());
                        }

                        // If name contains unquote (from backquote), keep as Call for later evaluation
                        if contains_unquote(&args[0]) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("defclass".to_string())),
                                args,
                            });
                        }

                        // Parse class name
                        let class_name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            _ => return Err("defclass name must be a symbol".to_string()),
                        };

                        // Parse superclasses
                        let superclasses = match &args[1] {
                            ASTNode::Constant(ConstantValue::Nil) => vec![],
                            ASTNode::Call { function, args: supers } => {
                                let mut all_supers = vec![*function.clone()];
                                all_supers.extend(supers.clone());
                                all_supers.iter().filter_map(|s| {
                                    if let ASTNode::Variable(name) = s {
                                        Some(name.clone())
                                    } else {
                                        None
                                    }
                                }).collect()
                            }
                            _ => vec![],
                        };

                        // Parse slots (args[2] if it exists, otherwise empty)
                        let slots_def = if args.len() > 2 { &args[2] } else { &ASTNode::Constant(ConstantValue::Nil) };

                        let mut slot_specs = Vec::new();

                        match slots_def {
                            ASTNode::Constant(ConstantValue::Nil) => {
                                // No slots
                            }
                            ASTNode::Call { function, args: slot_list } => {
                                // Process all slots
                                let mut all_slots = vec![*function.clone()];
                                all_slots.extend(slot_list.clone());

                                for slot_def in all_slots {
                                    // Each slot is either a symbol or (slot-name options...)
                                    match slot_def {
                                        ASTNode::Variable(slot_name) => {
                                            // Simple slot
                                            slot_specs.push(SlotSpec {
                                                name: slot_name.clone(),
                                                initarg: None,
                                                initform: None,
                                                accessor: None,
                                                reader: None,
                                                writer: None,
                                            });
                                        }
                                        ASTNode::Call { function: slot_func, args: slot_options } => {
                                            let slot_name = match &*slot_func {
                                                ASTNode::Variable(name) => name.clone(),
                                                _ => continue,
                                            };

                                            // Parse slot options
                                            let mut initarg: Option<String> = None;
                                            let mut initform: Option<Box<ASTNode>> = None;
                                            let mut accessor: Option<String> = None;
                                            let mut reader: Option<String> = None;
                                            let mut writer: Option<String> = None;

                                            fn slot_opt_key(node: &ASTNode) -> Option<String> {
                                                let raw = match node {
                                                    ASTNode::Variable(s) => s.as_str(),
                                                    ASTNode::Constant(ConstantValue::Symbol(s)) => s.as_str(),
                                                    _ => return None,
                                                };
                                                let base = raw.rsplit(':').next().unwrap_or(raw);
                                                Some(base.to_ascii_lowercase())
                                            }

                                            fn slot_opt_symbol(node: &ASTNode) -> Option<String> {
                                                match node {
                                                    ASTNode::Variable(s) => Some(s.clone()),
                                                    ASTNode::Constant(ConstantValue::Symbol(s)) => Some(s.clone()),
                                                    _ => None,
                                                }
                                            }

                                            let mut i = 0;
                                            while i < slot_options.len() {
                                                if let Some(option_key) = slot_opt_key(&slot_options[i]) {
                                                    if i + 1 < slot_options.len() {
                                                        match option_key.as_str() {
                                                            "initarg" => {
                                                                if let Some(val) = slot_opt_symbol(&slot_options[i + 1]) {
                                                                    initarg = Some(val);
                                                                }
                                                            }
                                                            "initform" => {
                                                                initform = Some(Box::new(slot_options[i + 1].clone()));
                                                            }
                                                            "accessor" => {
                                                                if let Some(val) = slot_opt_symbol(&slot_options[i + 1]) {
                                                                    accessor = Some(val);
                                                                }
                                                            }
                                                            "reader" => {
                                                                if let Some(val) = slot_opt_symbol(&slot_options[i + 1]) {
                                                                    reader = Some(val);
                                                                }
                                                            }
                                                            "writer" => {
                                                                if let Some(val) = slot_opt_symbol(&slot_options[i + 1]) {
                                                                    writer = Some(val);
                                                                }
                                                            }
                                                            _ => {}
                                                        }
                                                        i += 2;
                                                    } else {
                                                        i += 1;
                                                    }
                                                } else {
                                                    i += 1;
                                                }
                                            }

                                            slot_specs.push(SlotSpec {
                                                name: slot_name,
                                                initarg,
                                                initform,
                                                accessor,
                                                reader,
                                                writer,
                                            });
                                        }
                                        _ => {}
                                    }
                                }
                            }
                            _ => {}
                        }

                        return Ok(ASTNode::Defclass {
                            name: class_name,
                            superclasses,
                            slots: slot_specs,
                        });
                    }
                    "define-condition" => {
                        // (define-condition name (parent-types...) ((slot options...) ...) options...)
                        // Conditions are like classes but inherit from CONDITION by default
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("define-condition requires at least name and parent-types".to_string());
                        }

                        // If name contains unquote, keep as Call for later evaluation
                        if contains_unquote(&args[0]) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("define-condition".to_string())),
                                args,
                            });
                        }

                        // Parse condition name
                        let condition_name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            _ => return Err("define-condition name must be a symbol".to_string()),
                        };

                        // Parse parent types - default to (condition) if empty
                        let parent_types = match &args[1] {
                            ASTNode::Constant(ConstantValue::Nil) => vec!["condition".to_string()],
                            ASTNode::Call { function, args: parents } => {
                                let mut all_parents = vec![*function.clone()];
                                all_parents.extend(parents.clone());
                                let parsed: Vec<String> = all_parents.iter().filter_map(|s| {
                                    if let ASTNode::Variable(name) = s {
                                        Some(name.clone())
                                    } else {
                                        None
                                    }
                                }).collect();
                                if parsed.is_empty() {
                                    vec!["condition".to_string()]
                                } else {
                                    parsed
                                }
                            }
                            _ => vec!["condition".to_string()],
                        };

                        // Parse slots (args[2] if it exists, otherwise empty)
                        // Similar to defclass slot parsing
                        let slots_def = if args.len() > 2 { &args[2] } else { &ASTNode::Constant(ConstantValue::Nil) };

                        let mut slot_specs = Vec::new();

                        match slots_def {
                            ASTNode::Constant(ConstantValue::Nil) => {
                                // No slots
                            }
                            ASTNode::Call { function, args: slot_list } => {
                                // Process all slots
                                let mut all_slots = vec![function.as_ref().clone()];
                                all_slots.extend(slot_list.clone());

                                for slot_def in &all_slots {
                                    match slot_def {
                                        // Simple slot name
                                        ASTNode::Variable(slot_name) => {
                                            slot_specs.push(SlotSpec {
                                                name: slot_name.clone(),
                                                initarg: None,
                                                initform: None,
                                                accessor: None,
                                                reader: Some(slot_name.clone()), // Default reader for conditions
                                                writer: None,
                                            });
                                        }
                                        // Slot with options: (name :initarg :name :reader name ...)
                                        ASTNode::Call { function: slot_fn, args: slot_options } => {
                                            let slot_name = match slot_fn.as_ref() {
                                                ASTNode::Variable(n) => n.clone(),
                                                _ => continue,
                                            };

                                            let mut initarg: Option<String> = None;
                                            let mut initform: Option<Box<ASTNode>> = None;
                                            let mut accessor: Option<String> = None;
                                            let mut reader: Option<String> = None;
                                            let mut writer: Option<String> = None;

                                            // Parse slot options
                                            let mut i = 0;
                                            while i < slot_options.len() {
                                                if let ASTNode::Variable(opt) = &slot_options[i] {
                                                    let opt_lower = opt.to_lowercase();
                                                    if i + 1 < slot_options.len() {
                                                        match opt_lower.as_str() {
                                                            ":initarg" => {
                                                                if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                    initarg = Some(val.clone());
                                                                }
                                                            }
                                                            ":initform" => {
                                                                initform = Some(Box::new(slot_options[i + 1].clone()));
                                                            }
                                                            ":accessor" => {
                                                                if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                    accessor = Some(val.clone());
                                                                }
                                                            }
                                                            ":reader" => {
                                                                if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                    reader = Some(val.clone());
                                                                }
                                                            }
                                                            ":writer" => {
                                                                if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                    writer = Some(val.clone());
                                                                }
                                                            }
                                                            _ => {}
                                                        }
                                                        i += 2;
                                                    } else {
                                                        i += 1;
                                                    }
                                                } else {
                                                    i += 1;
                                                }
                                            }

                                            slot_specs.push(SlotSpec {
                                                name: slot_name,
                                                initarg,
                                                initform,
                                                accessor,
                                                reader,
                                                writer,
                                            });
                                        }
                                        _ => {}
                                    }
                                }
                            }
                            _ => {}
                        }

                        // Treat define-condition as defclass with condition as parent
                        return Ok(ASTNode::Defclass {
                            name: condition_name,
                            superclasses: parent_types,
                            slots: slot_specs,
                        });
                    }
                    "defgeneric" => {
                        // (defgeneric name lambda-list [:argument-precedence-order ...] [:documentation ...])
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("defgeneric requires at least name and lambda-list".to_string());
                        }

                        // If any args contain unquote (from backquote), keep as Call
                        // This allows macro expansion to substitute values first
                        if args.iter().any(|a| contains_unquote(a)) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("defgeneric".to_string())),
                                args,
                            });
                        }

                        // Parse generic function name (can be symbol or (setf name))
                        let name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
                            ASTNode::Call { function, args: setf_args } => {
                                // Handle (setf name) form
                                if let ASTNode::Variable(fn_name) = &**function {
                                    if fn_name.eq_ignore_ascii_case("setf") && !setf_args.is_empty() {
                                        if let ASTNode::Variable(setf_name) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else if let ASTNode::Constant(ConstantValue::Symbol(setf_name)) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else {
                                            return Err("defgeneric (setf name) requires a symbol name".to_string());
                                        }
                                    } else {
                                        return Err("defgeneric name must be a symbol or (setf name)".to_string());
                                    }
                                } else {
                                    return Err("defgeneric name must be a symbol or (setf name)".to_string());
                                }
                            }
                            _ => return Err(format!("defgeneric name must be a symbol, got {:?}", &args[0])),
                        };

                        // Parse lambda list
                        let lambda_list = match &args[1] {
                            ASTNode::Constant(ConstantValue::Nil) => vec![],
                            ASTNode::Call { function, args: params } => {
                                let mut all_params = vec![*function.clone()];
                                all_params.extend(params.clone());
                                all_params.iter().filter_map(|p| {
                                    if let ASTNode::Variable(name) = p {
                                        Some(name.clone())
                                    } else {
                                        None
                                    }
                                }).collect()
                            }
                            _ => vec![],
                        };

                        return Ok(ASTNode::Defgeneric {
                            name,
                            lambda_list,
                        });
                    }
                    "defmethod" => {
                        // (defmethod name [:qualifier] (specialized-lambda-list) body...)
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("defmethod requires at least name and specialized-lambda-list".to_string());
                        }

                        // If any args contain unquote (from backquote), keep as Call
                        // This allows macro expansion to substitute values first
                        if args.iter().any(|a| contains_unquote(a)) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("defmethod".to_string())),
                                args,
                            });
                        }

                        // Parse method name (can be symbol or (setf name))
                        let generic_name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
                            ASTNode::Call { function, args: setf_args } => {
                                // Handle (setf name) form
                                if let ASTNode::Variable(fn_name) = &**function {
                                    if fn_name.eq_ignore_ascii_case("setf") && !setf_args.is_empty() {
                                        if let ASTNode::Variable(setf_name) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else if let ASTNode::Constant(ConstantValue::Symbol(setf_name)) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else {
                                            return Err("defmethod (setf name) requires a symbol name".to_string());
                                        }
                                    } else {
                                        return Err("defmethod name must be a symbol or (setf name)".to_string());
                                    }
                                } else {
                                    return Err("defmethod name must be a symbol or (setf name)".to_string());
                                }
                            }
                            _ => return Err(format!("defmethod name must be a symbol, got {:?}", &args[0])),
                        };

                        // Check for optional qualifier (:before, :after, :around)
                        let qualifier_key = match &args[1] {
                            ASTNode::Variable(kw) => Some(kw.clone()),
                            ASTNode::Constant(ConstantValue::Symbol(kw)) => Some(kw.clone()),
                            _ => None,
                        };
                        let (qualifier, lambda_list_idx) = if let Some(raw_kw) = qualifier_key {
                            let normalized = if raw_kw.starts_with(':') {
                                raw_kw.to_uppercase()
                            } else {
                                format!(":{}", raw_kw.to_uppercase())
                            };
                            if normalized == ":BEFORE" || normalized == ":AFTER" || normalized == ":AROUND" {
                                (Some(normalized), 2)
                            } else {
                                (None, 1)
                            }
                        } else {
                            (None, 1)
                        };

                        if args.len() <= lambda_list_idx {
                            return Err("defmethod requires specialized-lambda-list".to_string());
                        }

                        // Parse specialized lambda list
                        let (specializers, params) = match &args[lambda_list_idx] {
                            ASTNode::Constant(ConstantValue::Nil) => (vec![], vec![]),
                            ASTNode::Call { function, args: param_specs } => {
                                let mut all_param_specs = vec![*function.clone()];
                                all_param_specs.extend(param_specs.clone());

                                let mut spec_vec = Vec::new();
                                let mut param_vec = Vec::new();

                                for param_spec in all_param_specs {
                                    match param_spec {
                                        ASTNode::Variable(param_name) => {
                                            // Unspecialized parameter
                                            spec_vec.push("T".to_string());
                                            param_vec.push(param_name);
                                        }
                                        ASTNode::Call { function, args } => {
                                            // Specialized parameter: (param class-name)
                                            if let ASTNode::Variable(param_name) = &*function {
                                                param_vec.push(param_name.clone());
                                                if let Some(class_node) = args.first() {
                                                    match class_node {
                                                        ASTNode::Variable(class_name) => spec_vec.push(class_name.clone()),
                                                        ASTNode::Constant(ConstantValue::Symbol(class_name)) => {
                                                            spec_vec.push(class_name.clone())
                                                        }
                                                        _ => spec_vec.push("T".to_string()),
                                                    }
                                                } else {
                                                    spec_vec.push("T".to_string());
                                                }
                                            }
                                        }
                                        _ => {}
                                    }
                                }

                                (spec_vec, param_vec)
                            }
                            _ => (vec![], vec![]),
                        };

                        // Parse body
                        let body: Vec<ASTNode> = args[(lambda_list_idx + 1)..].to_vec();

                        return Ok(ASTNode::Defmethod {
                            generic_name,
                            qualifier,
                            specializers,
                            params,
                            body,
                        });
                    }
                    "define-condition" => {
                        // Pass through to eval_conditions::eval_define_condition
                        let args = cdr_to_vec(cdr)?;
                        return Ok(ASTNode::Call {
                            function: Box::new(ASTNode::Variable("define-condition".to_string())),
                            args,
                        });
                    }
                    // "declaim" - handled in eval_core.rs to preserve form for macros
                    "when" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("when requires at least 1 argument (test)".to_string());
                        }
                        let test = args[0].clone();
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        // Desugar to (if test (progn body...) nil)
                        return Ok(ASTNode::if_then_else(test, body, ASTNode::nil()));
                    }
                    "unless" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("unless requires at least 1 argument (test)".to_string());
                        }
                        let test = args[0].clone();
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        // Desugar to (if test nil (progn body...))
                        return Ok(ASTNode::if_then_else(test, ASTNode::nil(), body));
                    }
                    // cond is handled as a macro in expand_macros, not here
                    // This allows backquote/unquote-splicing to be expanded first
                    "cond" => {
                        // Just convert to a function call that will be handled later
                        let args = cdr_to_vec(cdr)?;
                        return Ok(ASTNode::Call {
                            function: Box::new(ASTNode::variable("cond".to_string())),
                            args,
                        });
                    }
                    _ => {}
                }
            }
        }
    }

    // Check if this is a dotted pair (car . cdr) where cdr is not a list
    if !cdr.is_nil() && !cdr.is_cons() {
        // This is a dotted pair: (car . cdr)
        let car_ast = lisp_to_ast(car)?;
        let cdr_ast = lisp_to_ast(cdr)?;
        return Ok(ASTNode::DottedPair {
            car: Box::new(car_ast),
            cdr: Box::new(cdr_ast),
        });
    }

    // Regular list - convert to Call
    let car_ast = lisp_to_ast(car)?;
    let args = cdr_to_vec(cdr)?;

    if std::env::var("RLASP_DEBUG_DEFUN_ACTUAL").is_ok() {
        if let ASTNode::Variable(name) = &car_ast {
            if name.eq_ignore_ascii_case("defun") {
                eprintln!("[defun-actual] args={:?}", args);
            }
        }
    }
    Ok(ASTNode::Call {
        function: Box::new(car_ast),
        args,
    })
}

fn extract_params(ast: &ASTNode) -> Vec<String> {
    let (params, _, _, _) = extract_params_with_defaults(ast);
    params
}

fn extract_params_with_defaults(ast: &ASTNode) -> (Vec<String>, std::collections::HashMap<String, ASTNode>, std::collections::HashMap<String, String>, std::collections::HashMap<String, String>) {
    super::eval::extract_params_with_defaults(ast)
}

fn contains_unquote(ast: &ASTNode) -> bool {
    // Check for unquote/unquote-splicing OUTSIDE of backquotes.
    // Unquotes inside backquotes are expected and handled by expand_backquote,
    // so we don't recurse into Backquote nodes.
    match ast {
        ASTNode::Unquote(_) | ASTNode::UnquoteSplicing(_) => true,
        ASTNode::Call { function, args } => {
            contains_unquote(function) || args.iter().any(|arg| contains_unquote(arg))
        }
        ASTNode::Quote(inner) => contains_unquote(inner),
        ASTNode::Backquote(_) => false, // Don't recurse into backquotes - unquotes inside are expected
        ASTNode::If { test, then_branch, else_branch } => {
            contains_unquote(test) || contains_unquote(then_branch) || contains_unquote(else_branch)
        }
        ASTNode::Progn { exprs } => exprs.iter().any(|e| contains_unquote(e)),
        _ => false,
    }
}

fn extract_bindings(ast: &ASTNode) -> Result<Vec<(String, ASTNode)>, String> {
    match ast {
        // Empty bindings: ()
        ASTNode::Constant(ConstantValue::Nil) => Ok(vec![]),
        // Single binding or list of bindings
        ASTNode::Call { function, args } => {
            let mut bindings = vec![];

            // First binding from function position
            if let ASTNode::Call { function: var, args: val_args } = &**function {
                if let ASTNode::Variable(var_name) = &**var {
                    if val_args.len() == 1 {
                        bindings.push((var_name.clone(), val_args[0].clone()));
                    } else if val_args.is_empty() {
                        // (var) with no value defaults to nil
                        bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
                    } else {
                        // Multiple values - take first value, ignore rest (lenient parsing)
                        bindings.push((var_name.clone(), val_args[0].clone()));
                    }
                } else {
                    return Err("Binding variable must be a symbol".to_string());
                }
            } else if let ASTNode::Variable(var_name) = &**function {
                // Plain variable (no value), defaults to nil
                bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
            } else {
                // Unknown binding format - use generic name and bind to nil (lenient)
                bindings.push(("_genbind_".to_string(), ASTNode::Constant(ConstantValue::Nil)));
            }

            // Remaining bindings from args
            for arg in args {
                if let ASTNode::Call { function: var, args: val_args } = arg {
                    if let ASTNode::Variable(var_name) = &**var {
                        if val_args.len() == 1 {
                            bindings.push((var_name.clone(), val_args[0].clone()));
                        } else if val_args.is_empty() {
                            // (var) with no value defaults to nil
                            bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
                        } else {
                            // Multiple values - take first value, ignore rest (lenient parsing)
                            bindings.push((var_name.clone(), val_args[0].clone()));
                        }
                    } else {
                        return Err("Binding variable must be a symbol".to_string());
                    }
                } else if let ASTNode::Variable(var_name) = arg {
                    // Plain variable (no value), defaults to nil
                    bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
                } else {
                    // Unknown binding format - use generic name and bind to nil (lenient)
                    bindings.push(("_genbind_".to_string(), ASTNode::Constant(ConstantValue::Nil)));
                }
            }

            Ok(bindings)
        }
        _ => Err(format!("Invalid bindings format: {:?}", ast)),
    }
}

/// Check for unquote/unquote-splicing in a raw LispObject
/// Used to defer evaluation when unquote is found in backquote contexts
fn contains_unquote_raw(obj: &LispObject) -> bool {
    // Check if it's a symbol that is "unquote" or "unquote-splicing"
    if obj.is_general() {
        if let Some(ptr) = obj.as_general_ptr::<u8>() {
            if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
                let sym = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                let name = sym.name().to_string();
                return name == "unquote" || name == "unquote-splicing";
            }
        }
    }

    // Check if it's a cons cell
    if obj.is_cons() {
        if let Some(cons_ptr) = obj.as_cons_ptr() {
            if cons_ptr.is_null() {
                return false;
            }
            let cons = unsafe { &*cons_ptr };
            let car = cons.car();
            let cdr = cons.cdr();

            // Check if car is unquote or unquote-splicing symbol
            if car.is_general() {
                if let Some(ptr) = car.as_general_ptr::<u8>() {
                    if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
                        let sym = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                        let name = sym.name().to_string();
                        if name == "unquote" || name == "unquote-splicing" {
                            return true;
                        }
                    }
                }
            }

            // Recursively check car and cdr
            if contains_unquote_raw(&car) {
                return true;
            }
            if contains_unquote_raw(&cdr) {
                return true;
            }
        }
    }

    false
}

/// Expand symbol macros in an AST node
fn expand_symbol_macros(ast: &ASTNode, bindings: &[(String, ASTNode)]) -> Result<ASTNode, String> {
    match ast {
        // If it's a variable, check if it's a symbol macro
        ASTNode::Variable(name) => {
            for (sym, expansion) in bindings {
                if sym == name {
                    // Return a clone of the expansion
                    return Ok(expansion.clone());
                }
            }
            // Not a symbol macro, return as-is
            Ok(ast.clone())
        }
        // For calls, recursively expand in function and args
        ASTNode::Call { function, args } => {
            let expanded_func = expand_symbol_macros(function, bindings)?;
            let expanded_args: Result<Vec<ASTNode>, String> = args.iter()
                .map(|arg| expand_symbol_macros(arg, bindings))
                .collect();
            Ok(ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args?,
            })
        }
        // For other node types, recursively expand as needed
        ASTNode::If { test, then_branch, else_branch } => {
            Ok(ASTNode::If {
                test: Box::new(expand_symbol_macros(test, bindings)?),
                then_branch: Box::new(expand_symbol_macros(then_branch, bindings)?),
                else_branch: Box::new(expand_symbol_macros(else_branch, bindings)?),
            })
        }
        ASTNode::Let { bindings: let_bindings, body } => {
            // Don't expand symbols that are bound in this let
            let mut new_bindings = Vec::new();
            for (name, value) in let_bindings {
                new_bindings.push((name.clone(), expand_symbol_macros(value, bindings)?));
            }
            let expanded_body: Result<Vec<ASTNode>, String> = body.iter()
                .map(|expr| expand_symbol_macros(expr, bindings))
                .collect();
            Ok(ASTNode::Let {
                bindings: new_bindings,
                body: expanded_body?,
            })
        }
        ASTNode::Progn { exprs } => {
            let expanded: Result<Vec<ASTNode>, String> = exprs.iter()
                .map(|expr| expand_symbol_macros(expr, bindings))
                .collect();
            Ok(ASTNode::Progn { exprs: expanded? })
        }
        // For constants and other nodes, return as-is
        _ => Ok(ast.clone()),
    }
}

/// Try to parse a simple loop form (for var [from start] below/to/upto/downto/above limit collect/sum expr)
/// Returns None if the loop form doesn't match our supported patterns
fn try_parse_simple_loop(cdr_list: &[ASTNode]) -> Option<ASTNode> {
    // Must have at least 4 elements: for var below limit collect/sum expr
    if cdr_list.len() < 4 {
        return None;
    }

    // Must start with "for"
    let first = match &cdr_list[0] {
        ASTNode::Variable(s) if s == "for" => s,
        _ => return None,
    };

    // Get var
    let var = match &cdr_list[1] {
        ASTNode::Variable(v) => v.clone(),
        _ => return None,
    };

    // Parse "from start below/to/upto/downto/above limit" or "below/to/... limit"
    let mut idx = 2;
    let start = if let ASTNode::Variable(s) = &cdr_list[idx] {
        if s == "from" {
            idx += 1;
            if idx >= cdr_list.len() {
                return None;
            }
            let start_val = cdr_list[idx].clone();
            idx += 1;
            Some(Box::new(start_val))
        } else {
            None
        }
    } else {
        None
    };

    // Check for limit keyword - only handle "below" in the specialized path
    // Other keywords like "to", "upto", "downto", "above" have different semantics
    // and should go through the general expand_loop path
    if idx >= cdr_list.len() {
        return None;
    }
    let limit_keyword = match &cdr_list[idx] {
        ASTNode::Variable(s) if s == "below" => s.clone(),
        _ => return None,  // Let "to", "upto", etc. fall through to expand_loop
    };
    idx += 1;

    // Get limit
    if idx >= cdr_list.len() {
        return None;
    }
    let limit = Box::new(cdr_list[idx].clone());
    idx += 1;

    // Check for optional "when", "unless", or "if" condition
    let when_condition = if idx < cdr_list.len() {
        if let ASTNode::Variable(s) = &cdr_list[idx] {
            if s == "when" || s == "if" || s == "unless" {
                idx += 1;
                if idx >= cdr_list.len() {
                    return None;
                }
                let cond = cdr_list[idx].clone();
                idx += 1;
                // Wrap unless in a not
                if s == "unless" {
                    Some(Box::new(ASTNode::Call {
                        function: Box::new(ASTNode::Variable("not".to_string())),
                        args: vec![cond],
                    }))
                } else {
                    Some(Box::new(cond))
                }
            } else {
                None
            }
        } else {
            None
        }
    } else {
        None
    };

    // Check for "collect" or "sum"
    if idx >= cdr_list.len() {
        return None;
    }
    let (collect, sum) = if let ASTNode::Variable(s) = &cdr_list[idx] {
        idx += 1;
        if s == "collect" {
            if idx >= cdr_list.len() {
                return None;
            }
            (Some(Box::new(cdr_list[idx].clone())), None)
        } else if s == "sum" {
            if idx >= cdr_list.len() {
                return None;
            }
            (None, Some(Box::new(cdr_list[idx].clone())))
        } else {
            return None;
        }
    } else {
        return None;
    };
    idx += 1;

    // Check for optional "else" clause
    let (else_collect, else_sum) = if idx < cdr_list.len() {
        if let ASTNode::Variable(s) = &cdr_list[idx] {
            if s == "else" {
                idx += 1;
                if idx >= cdr_list.len() {
                    return None;
                }
                if let ASTNode::Variable(action) = &cdr_list[idx] {
                    idx += 1;
                    if action == "collect" {
                        if idx >= cdr_list.len() {
                            return None;
                        }
                        (Some(Box::new(cdr_list[idx].clone())), None)
                    } else if action == "sum" {
                        if idx >= cdr_list.len() {
                            return None;
                        }
                        (None, Some(Box::new(cdr_list[idx].clone())))
                    } else {
                        return None;
                    }
                } else {
                    return None;
                }
            } else {
                (None, None)
            }
        } else {
            (None, None)
        }
    } else {
        (None, None)
    };

    Some(ASTNode::Loop {
        var,
        start,
        limit,
        when_condition,
        collect,
        sum,
        else_collect,
        else_sum,
    })
}

/// Convert LispObject to AST treating it as DATA (not code)
/// This is used for quoted forms where special forms should NOT be interpreted
/// e.g., '(defun foo) should become a list, not a function definition
fn build_data_list_ast(elements: Vec<ASTNode>, tail: Option<ASTNode>) -> ASTNode {
    if elements.is_empty() {
        return tail.unwrap_or_else(ASTNode::nil);
    }

    if let Some(tail_ast) = tail {
        // Preserve improper-list structure: (a b . c) => (a . (b . c))
        let mut result = tail_ast;
        for elem in elements.into_iter().rev() {
            result = ASTNode::DottedPair {
                car: Box::new(elem),
                cdr: Box::new(result),
            };
        }
        return result;
    }

    let mut iter = elements.into_iter();
    let function = iter.next().unwrap_or_else(ASTNode::nil);
    ASTNode::Call {
        function: Box::new(function),
        args: iter.collect(),
    }
}

fn lisp_to_ast_as_data(obj: LispObject) -> Result<ASTNode, String> {
    if obj.is_nil() {
        return Ok(ASTNode::nil());
    }

    if let Some(n) = obj.as_fixnum() {
        return Ok(ASTNode::fixnum(n));
    }

    if obj.is_character() {
        if let Some(ch) = obj.as_character() {
            return Ok(ASTNode::Constant(ConstantValue::Character(ch)));
        }
    }

    if obj.is_general() {
        // Use TypeHeader to determine exact type before casting
        if let Some(ptr) = obj.as_general_ptr::<u8>() {
            if !ptr.is_null() {
                if let Some(obj_type) = unsafe { rlasp_runtime::header::TypeHeader::from_ptr(ptr) } {
                    match obj_type {
                        rlasp_runtime::header::ObjectType::Vector => {
                            let vector = unsafe { &*(ptr as *const rlasp_runtime::RVector) };
                            let mut elements = Vec::new();
                            for elem in vector.as_slice() {
                                elements.push(lisp_to_ast_as_data(*elem)?);
                            }
                            return Ok(ASTNode::Vector(elements));
                        }
                        rlasp_runtime::header::ObjectType::Symbol => {
                            let symbol = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                            let name = symbol.name().to_string();
                            // Strings are currently encoded by the reader as symbols with quotes.
                            // Preserve them as string constants even in quoted/data context.
                            if name.starts_with('"') && name.ends_with('"') && name.len() >= 2 {
                                let string_content = &name[1..name.len() - 1];
                                return Ok(ASTNode::Constant(ConstantValue::String(string_content.to_string())));
                            }
                            // Don't check for T here - T in quoted context is just a symbol
                            return Ok(ASTNode::Variable(name.to_string()));
                        }
                        rlasp_runtime::header::ObjectType::Number => {
                            let num = unsafe { &*(ptr as *const rlasp_runtime::Number) };
                            match &num.value {
                                rlasp_runtime::NumberValue::Float(f) => {
                                    let format = num.float_format().unwrap_or(FloatFormat::Double);
                                    return Ok(ASTNode::Constant(ConstantValue::Float(*f, format)));
                                }
                                rlasp_runtime::NumberValue::Bignum(b) => {
                                    return Ok(ASTNode::Constant(ConstantValue::Bignum(b.to_string())));
                                }
                                rlasp_runtime::NumberValue::Ratio(r) => {
                                    let mut num_s = r.numerator_ref().to_string();
                                    if *r < malachite::Rational::from(0) {
                                        num_s = format!("-{}", num_s);
                                    }
                                    let den_s = r.denominator_ref().to_string();
                                    return Ok(ASTNode::Constant(ConstantValue::Ratio(num_s, den_s)));
                                }
                                rlasp_runtime::NumberValue::Complex(c) => {
                                    return Ok(ASTNode::Constant(ConstantValue::Complex(c.re, c.im)));
                                }
                            }
                        }
                        rlasp_runtime::header::ObjectType::String => {
                            // Handle string
                            let str_ptr = ptr as *const rlasp_runtime::RString;
                            let s = unsafe { (*str_ptr).as_str() };
                            return Ok(ASTNode::Constant(crate::ir::ConstantValue::String(s.to_string())));
                        }
                        _ => {} // Fall through to other checks
                    }
                }
            }
        }
    }

    if obj.is_cons() {
        // Convert list as data - recursively convert elements
        let cons_ptr = obj.as_cons_ptr().ok_or("Invalid cons")?;
        if cons_ptr.is_null() {
            return Ok(ASTNode::nil());
        }
        let cons = unsafe { &*cons_ptr };
        let car_obj = cons.car();
        let cdr = cons.cdr();

        // Handle read-time eval in quoted context: evaluate and insert as data
        if let Some(name) = symbol_name_if_symbol(car_obj) {
            let base = name.rsplit(':').next().unwrap_or(name.as_str());
            if base.eq_ignore_ascii_case("read-time-eval") {
                if !cdr.is_cons() {
                    return Err("read-time-eval requires one argument".to_string());
                }
                let cdr_ptr = cdr.as_cons_ptr().ok_or("Invalid cons pointer")?;
                if cdr_ptr.is_null() {
                    return Err("read-time-eval requires one argument".to_string());
                }
                let cdr_cons = unsafe { &*cdr_ptr };
                let eval_arg = cdr_cons.car();
                let rest = cdr_cons.cdr();
                if !rest.is_nil() {
                    return Err("read-time-eval requires one argument".to_string());
                }
                return eval_read_time_form(eval_arg, true);
            }
        }

        // Check for unquote/unquote-splicing - these must be preserved even in quoted context
        // because they may be inside a backquote
        if let Some(name) = symbol_name_if_symbol(car_obj) {
            if name == "unquote" {
                // (unquote x) -> Unquote(x)
                // IMPORTANT: Use lisp_to_ast (not lisp_to_ast_as_data) because
                // the unquoted form is CODE that will be evaluated
                if cdr.is_cons() {
                    if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                        if !cdr_ptr.is_null() {
                            let cdr_cons = unsafe { &*cdr_ptr };
                            let form_obj = cdr_cons.car();
                            let form = lisp_to_ast(form_obj)?;
                            return Ok(ASTNode::Unquote(Box::new(form)));
                        }
                    }
                }
            }

            if name == "unquote-splicing" {
                // (unquote-splicing x) -> UnquoteSplicing(x)
                // IMPORTANT: Use lisp_to_ast (not lisp_to_ast_as_data) because
                // the unquoted form is CODE that will be evaluated
                if cdr.is_cons() {
                    if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                        if !cdr_ptr.is_null() {
                            let cdr_cons = unsafe { &*cdr_ptr };
                            let form_obj = cdr_cons.car();
                            let form = lisp_to_ast(form_obj)?;
                            return Ok(ASTNode::UnquoteSplicing(Box::new(form)));
                        }
                    }
                }
            }
        }

        let mut elements = vec![lisp_to_ast_as_data(car_obj)?];
        let mut current = cdr;
        while current.is_cons() {
            let cdr_ptr = current.as_cons_ptr().ok_or("Invalid cons")?;
            if cdr_ptr.is_null() {
                break;
            }
            let cdr_cons = unsafe { &*cdr_ptr };
            // Copy car/cdr out before recursing so we do not keep a raw cons pointer
            // alive across allocations triggered by recursive conversion.
            let next_car = cdr_cons.car();
            current = cdr_cons.cdr();
            elements.push(lisp_to_ast_as_data(next_car)?);
        }
        let tail = if current.is_nil() {
            None
        } else {
            Some(lisp_to_ast_as_data(current)?)
        };
        return Ok(build_data_list_ast(elements, tail));
    }

    // Fallback - treat as nil
    Ok(ASTNode::nil())
}

fn cdr_to_vec(mut cdr: LispObject) -> Result<Vec<ASTNode>, String> {
    let mut result = Vec::new();

    while cdr.is_cons() {
        let cons_ptr = cdr.as_cons_ptr().ok_or("Invalid cons pointer")?;
        if cons_ptr.is_null() {
            break;
        }
        let cons = unsafe { &*cons_ptr };
        // Copy car/cdr out before recursing so the raw pointer is not reused after
        // a recursive conversion may allocate.
        let car_obj = cons.car();
        cdr = cons.cdr();
        result.push(lisp_to_ast(car_obj)?);
    }

    // Handle dotted pair
    if !cdr.is_nil() {
        // For now, just append the dotted tail as the last element
        // This flattens (a b . c) to [a, b, c]
        result.push(lisp_to_ast(cdr)?);
    }

    Ok(result)
}

/// Get raw LispObjects from a cons list without converting to AST
/// Used for handling forms like case where keys should be treated as data
fn raw_cdr_to_vec(mut cdr: LispObject) -> Result<Vec<LispObject>, String> {
    let mut result = Vec::new();

    while cdr.is_cons() {
        let cons_ptr = cdr.as_cons_ptr().ok_or("Invalid cons pointer")?;
        if cons_ptr.is_null() {
            break;
        }
        let cons = unsafe { &*cons_ptr };
        result.push(cons.car());
        cdr = cons.cdr();
    }

    Ok(result)
}

fn symbol_name_if_symbol(obj: LispObject) -> Option<String> {
    if !obj.is_general() || obj.is_number() {
        return None;
    }
    let ptr = obj.as_general_ptr::<u8>()?;
    if ptr.is_null() {
        return None;
    }
    if unsafe { TypeHeader::from_ptr(ptr) } != Some(ObjectType::Symbol) {
        return None;
    }
    let sym = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
    Some(sym.name().to_string())
}

/// Extract bindings from raw LispObject without interpreting special forms for variable names
/// This handles cases like (let* ((block (gensym))) ...) where "block" is a variable, not a special form
fn extract_bindings_raw(bindings_obj: LispObject) -> Result<Vec<(String, ASTNode)>, String> {
    let mut bindings = vec![];

    if bindings_obj.is_nil() {
        return Ok(bindings);
    }

    if !bindings_obj.is_cons() {
        return Err("Bindings must be a list".to_string());
    }

    // Get the list of bindings as raw LispObjects
    let binding_list = raw_cdr_to_vec_with_first(bindings_obj)?;

    for binding_obj in binding_list {
        if binding_obj.is_nil() {
            continue;
        }

        if !binding_obj.is_cons() {
            // Plain symbol with no value - treat as (var nil)
            if let Some(sym_name) = symbol_name_if_symbol(binding_obj) {
                bindings.push((sym_name, ASTNode::Constant(ConstantValue::Nil)));
                continue;
            }
            return Err(format!("Invalid binding format: {:?}", binding_obj));
        }

        // Binding is a cons cell like (var value) or (var)
        let binding_ptr = binding_obj
            .as_cons_ptr()
            .ok_or_else(|| "Invalid binding cons pointer".to_string())?;
        if binding_ptr.is_null() {
            return Err("Invalid binding cons pointer".to_string());
        }
        let binding_cons = unsafe { &*binding_ptr };
        let var_obj = binding_cons.car();
        let rest = binding_cons.cdr();

        // Get variable name
        let Some(var_name) = symbol_name_if_symbol(var_obj) else {
            return Err("Binding variable must be a symbol".to_string());
        };

        // Get value (if present)
        let value = if rest.is_nil() {
            ASTNode::Constant(ConstantValue::Nil)
        } else if rest.is_cons() {
            let val_ptr = rest
                .as_cons_ptr()
                .ok_or_else(|| "Invalid binding value pointer".to_string())?;
            if val_ptr.is_null() {
                return Err("Invalid binding value pointer".to_string());
            }
            let val_cons = unsafe { &*val_ptr };
            let val_obj = val_cons.car();
            lisp_to_ast(val_obj)?
        } else {
            ASTNode::Constant(ConstantValue::Nil)
        };

        bindings.push((var_name, value));
    }

    Ok(bindings)
}

/// Get all elements from a cons list including the first
fn raw_cdr_to_vec_with_first(obj: LispObject) -> Result<Vec<LispObject>, String> {
    let mut result = Vec::new();
    let mut current = obj;

    while current.is_cons() {
        let cons_ptr = current.as_cons_ptr().ok_or("Invalid cons pointer")?;
        if cons_ptr.is_null() {
            break;
        }
        let cons = unsafe { &*cons_ptr };
        result.push(cons.car());
        current = cons.cdr();
    }

    Ok(result)
}

fn debug_key_obj(obj: &LispObject) -> String {
    if obj.is_nil() {
        return "NIL".to_string();
    }
    if let Some(sym_name) = symbol_name_if_symbol(*obj) {
        return sym_name;
    }
    if let Some(n) = obj.as_fixnum() {
        return n.to_string();
    }
    if let Some(f) = obj.as_float() {
        return f.to_string();
    }
    if let Some(ch) = obj.as_character() {
        return format!("#\\{}", ch);
    }
    format!("{:?}", obj)
}

fn debug_key_list(obj: &LispObject) -> String {
    if !obj.is_cons() {
        return debug_key_obj(obj);
    }
    let mut parts = Vec::new();
    let mut current = *obj;
    while current.is_cons() {
        let Some(cons_ptr) = current.as_cons_ptr() else {
            break;
        };
        if cons_ptr.is_null() {
            break;
        }
        let cons = unsafe { &*cons_ptr };
        parts.push(debug_key_obj(&cons.car()));
        current = cons.cdr();
    }
    if !current.is_nil() {
        parts.push(format!(". {}", debug_key_obj(&current)));
    }
    format!("({})", parts.join(" "))
}

fn case_key_to_atom_test(key_obj: &LispObject, tmp_var: &str) -> Option<ASTNode> {
    if key_obj.is_nil() {
        return Some(ASTNode::call(
            ASTNode::variable("eql"),
            vec![
                ASTNode::variable(tmp_var),
                ASTNode::Constant(ConstantValue::Nil),
            ],
        ));
    }

    if let Some(sym_name) = symbol_name_if_symbol(*key_obj) {
        let name = sym_name.to_uppercase();
        if name == "T" || name == "OTHERWISE" {
            return Some(ASTNode::t());
        }
        return Some(ASTNode::call(
            ASTNode::variable("eql"),
            vec![
                ASTNode::variable(tmp_var),
                ASTNode::Quote(Box::new(ASTNode::variable(&name))),
            ],
        ));
    }

    if let Some(n) = key_obj.as_fixnum() {
        return Some(ASTNode::call(
            ASTNode::variable("eql"),
            vec![
                ASTNode::variable(tmp_var),
                ASTNode::Constant(ConstantValue::Fixnum(n)),
            ],
        ));
    }
    if let Some(f) = key_obj.as_float() {
        return Some(ASTNode::call(
            ASTNode::variable("eql"),
            vec![
                ASTNode::variable(tmp_var),
                ASTNode::Constant(ConstantValue::Float(f, FloatFormat::Double)),
            ],
        ));
    }
    if let Some(ch) = key_obj.as_character() {
        return Some(ASTNode::call(
            ASTNode::variable("eql"),
            vec![
                ASTNode::variable(tmp_var),
                ASTNode::Constant(ConstantValue::Character(ch)),
            ],
        ));
    }

    None
}

/// Convert a case key (which can be a symbol, list of symbols, T, or OTHERWISE) to a test expression
fn case_key_to_test(key_obj: &LispObject, tmp_var: &str) -> Result<ASTNode, String> {
    // Check if it's a single atom key
    if let Some(test) = case_key_to_atom_test(key_obj, tmp_var) {
        return Ok(test);
    }

    // Check if it's a list of keys
    if key_obj.is_cons() {
        let cons_ptr = key_obj.as_cons_ptr().ok_or("Invalid cons")?;
        if cons_ptr.is_null() {
            return Ok(ASTNode::nil());
        }
        let cons = unsafe { &*cons_ptr };
        let first_key = cons.car();
        // Get the rest of the keys from the cdr
        let keys = raw_cdr_to_vec(cons.cdr())?;

        // Build (or (eql tmp 'key1) (eql tmp 'key2) ...)
        let mut tests = Vec::new();

        // First key
        if let Some(test) = case_key_to_atom_test(&first_key, tmp_var) {
            tests.push(test);
        }

        // Rest of keys
        for key in &keys {
            if let Some(test) = case_key_to_atom_test(key, tmp_var) {
                tests.push(test);
            }
        }

        if tests.is_empty() {
            return Ok(ASTNode::nil());
        } else if tests.len() == 1 {
            return Ok(tests.into_iter().next().unwrap());
        } else {
            // (or test1 test2 ...)
            return Ok(ASTNode::Call {
                function: Box::new(ASTNode::variable("or")),
                args: tests,
            });
        }
    }

    // Unknown key type - just return nil (won't match)
    Ok(ASTNode::nil())
}

/// Extract macrolet bindings: ((name (params...) body...) ...)
fn extract_macrolet_bindings(ast: &ASTNode) -> Result<Vec<(String, Vec<String>, ASTNode)>, String> {
    match ast {
        ASTNode::Constant(ConstantValue::Nil) => Ok(vec![]),
        ASTNode::Call { function, args } => {
            let mut bindings = vec![];

            // Process first binding
            if let ASTNode::Call { function: name_node, args: def_parts } = &**function {
                if let ASTNode::Variable(name) = &**name_node {
                    if def_parts.len() >= 2 {
                        let params = extract_params(&def_parts[0]);
                        let body = if def_parts.len() > 2 {
                            ASTNode::Progn { exprs: def_parts[1..].to_vec() }
                        } else {
                            def_parts[1].clone()
                        };
                        bindings.push((name.clone(), params, body));
                    }
                }
            }

            // Process remaining bindings
            for arg in args {
                if let ASTNode::Call { function: name_node, args: def_parts } = arg {
                    if let ASTNode::Variable(name) = &**name_node {
                        if def_parts.len() >= 2 {
                            let params = extract_params(&def_parts[0]);
                            let body = if def_parts.len() > 2 {
                                ASTNode::Progn { exprs: def_parts[1..].to_vec() }
                            } else {
                                def_parts[1].clone()
                            };
                            bindings.push((name.clone(), params, body));
                        }
                    }
                }
            }

            Ok(bindings)
        }
        _ => Err("Invalid macrolet bindings".to_string()),
    }
}

/// Substitute parameters in a backquoted form
fn substitute_in_ast(ast: &ASTNode, substitutions: &std::collections::HashMap<String, ASTNode>) -> ASTNode {
    match ast {
        ASTNode::Variable(name) => {
            substitutions.get(name).cloned().unwrap_or_else(|| ast.clone())
        }
        ASTNode::Unquote(inner) => {
            // In unquote, we evaluate the substitution
            ASTNode::Unquote(Box::new(substitute_in_ast(inner, substitutions)))
        }
        ASTNode::UnquoteSplicing(inner) => {
            ASTNode::UnquoteSplicing(Box::new(substitute_in_ast(inner, substitutions)))
        }
        ASTNode::Backquote(inner) => {
            ASTNode::Backquote(Box::new(substitute_in_ast(inner, substitutions)))
        }
        ASTNode::Call { function, args } => {
            ASTNode::Call {
                function: Box::new(substitute_in_ast(function, substitutions)),
                args: args.iter().map(|a| substitute_in_ast(a, substitutions)).collect(),
            }
        }
        ASTNode::If { test, then_branch, else_branch } => {
            ASTNode::If {
                test: Box::new(substitute_in_ast(test, substitutions)),
                then_branch: Box::new(substitute_in_ast(then_branch, substitutions)),
                else_branch: Box::new(substitute_in_ast(else_branch, substitutions)),
            }
        }
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(|e| substitute_in_ast(e, substitutions)).collect(),
            }
        }
        ASTNode::Quote(inner) => {
            // Don't substitute inside quotes
            ASTNode::Quote(inner.clone())
        }
        _ => ast.clone(),
    }
}

/// Expand a macrolet call by substituting parameters and expanding backquote
fn expand_macrolet_call(
    macro_params: &[String],
    macro_body: &ASTNode,
    call_args: &[ASTNode],
) -> Result<ASTNode, String> {
    let substitutions = bind_macro_params(macro_params, call_args)?;

    // Substitute parameters in the macro body
    let substituted = substitute_in_ast(macro_body, &substitutions);

    // Expand backquote if present
    Ok(expand_backquote_ast(&substituted))
}

/// Parse macro lambda list and bind arguments to parameters
/// Handles &optional, &rest, &body, &key, &allow-other-keys, &whole, &environment
fn bind_macro_params(
    macro_params: &[String],
    call_args: &[ASTNode],
) -> Result<std::collections::HashMap<String, ASTNode>, String> {
    let mut substitutions = std::collections::HashMap::new();
    let mut arg_idx = 0;
    let mut param_idx = 0;

    // Possible states: Required, Optional, Rest, Key
    #[derive(PartialEq, Clone, Copy)]
    enum ParamState {
        Required,
        Optional,
        Rest,
        Key,
    }
    let mut state = ParamState::Required;
    #[allow(unused_variables)]
    let mut seen_whole = false;
    #[allow(unused_variables)]
    let mut allow_other_keys = false;

    while param_idx < macro_params.len() {
        let param = &macro_params[param_idx];

        match param.as_str() {
            "&whole" => {
                // &whole var binds the entire macro call form as a list
                param_idx += 1;
                if param_idx >= macro_params.len() {
                    return Err("&whole requires a parameter name".to_string());
                }
                let whole_name = &macro_params[param_idx];
                // Create a list from all the call args
                let whole_list = args_to_list_ast(call_args);
                substitutions.insert(whole_name.clone(), whole_list);
                seen_whole = true;
                param_idx += 1;
            }
            "&environment" => {
                // &environment var binds the macro expansion environment
                param_idx += 1;
                if param_idx >= macro_params.len() {
                    return Err("&environment requires a parameter name".to_string());
                }
                let env_name = &macro_params[param_idx];
                // For now, bind to nil (we don't have a real environment object)
                substitutions.insert(env_name.clone(), ASTNode::nil());
                param_idx += 1;
            }
            "&optional" => {
                state = ParamState::Optional;
                param_idx += 1;
            }
            "&rest" | "&body" => {
                state = ParamState::Rest;
                param_idx += 1;
                if param_idx >= macro_params.len() {
                    return Err(format!("{} requires a parameter name", param));
                }
                let rest_name = &macro_params[param_idx];
                // Bind remaining args as a list
                let rest_args = if arg_idx < call_args.len() {
                    args_to_list_ast(&call_args[arg_idx..])
                } else {
                    ASTNode::nil()
                };
                substitutions.insert(rest_name.clone(), rest_args);
                arg_idx = call_args.len(); // Consume all remaining args
                param_idx += 1;
            }
            "&key" => {
                state = ParamState::Key;
                param_idx += 1;
            }
            "&allow-other-keys" => {
                allow_other_keys = true;
                param_idx += 1;
            }
            "&aux" => {
                // &aux introduces auxiliary variables, not bound from args
                // Skip all remaining params (they're aux bindings)
                break;
            }
            _ => {
                match state {
                    ParamState::Required => {
                        if arg_idx < call_args.len() {
                            substitutions.insert(param.clone(), call_args[arg_idx].clone());
                            arg_idx += 1;
                        } else {
                            // Missing required arg - bind to nil to be lenient
                            substitutions.insert(param.clone(), ASTNode::nil());
                        }
                        param_idx += 1;
                    }
                    ParamState::Optional => {
                        if arg_idx < call_args.len() {
                            substitutions.insert(param.clone(), call_args[arg_idx].clone());
                            arg_idx += 1;
                        } else {
                            substitutions.insert(param.clone(), ASTNode::nil());
                        }
                        param_idx += 1;
                    }
                    ParamState::Rest => {
                        // Should not reach here - rest param consumed all args above
                        param_idx += 1;
                    }
                    ParamState::Key => {
                        // Look for :param-name in remaining args
                        let key_name = format!(":{}", param.to_uppercase());
                        let key_name_lower = format!(":{}", param);
                        let mut found = false;
                        let mut i = arg_idx;
                        while i + 1 < call_args.len() {
                            if let ASTNode::Variable(k) = &call_args[i] {
                                if k == &key_name || k == &key_name_lower || k.to_uppercase() == key_name {
                                    substitutions.insert(param.clone(), call_args[i + 1].clone());
                                    found = true;
                                    break;
                                }
                            }
                            i += 2;
                        }
                        if !found {
                            substitutions.insert(param.clone(), ASTNode::nil());
                        }
                        param_idx += 1;
                    }
                }
            }
        }
    }

    Ok(substitutions)
}

/// Convert a slice of ASTNodes to a list AST representation for macro parameter binding
/// The result is a list structure that can be used directly in the macro body
fn args_to_list_ast(args: &[ASTNode]) -> ASTNode {
    if args.is_empty() {
        ASTNode::nil()
    } else {
        // Build a list call: (list 'arg1 'arg2 ...)
        // Each arg is quoted so it's treated as data, not code
        let mut quoted_args = Vec::new();
        for arg in args {
            quoted_args.push(ASTNode::Quote(Box::new(arg.clone())));
        }
        ASTNode::Call {
            function: Box::new(ASTNode::Variable("list".to_string())),
            args: quoted_args,
        }
    }
}

/// Expand backquote at compile time (simplified version)
fn expand_backquote_ast(ast: &ASTNode) -> ASTNode {
    match ast {
        ASTNode::Backquote(inner) => expand_backquote_inner(inner),
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(expand_backquote_ast).collect(),
            }
        }
        _ => ast.clone(),
    }
}

fn expand_backquote_inner(ast: &ASTNode) -> ASTNode {
    match ast {
        ASTNode::Unquote(inner) => {
            // Unquote just returns the inner value
            (**inner).clone()
        }
        ASTNode::Call { function, args } => {
            // Check if any args have unquote-splicing
            let mut expanded_args = Vec::new();
            for arg in args {
                match arg {
                    ASTNode::UnquoteSplicing(_) => {
                        // For now, just treat as unquote
                        expanded_args.push(expand_backquote_inner(arg));
                    }
                    ASTNode::Unquote(inner) => {
                        expanded_args.push((**inner).clone());
                    }
                    _ => {
                        expanded_args.push(expand_backquote_inner(arg));
                    }
                }
            }

            let expanded_func = match &**function {
                ASTNode::Unquote(inner) => (**inner).clone(),
                _ => expand_backquote_inner(function),
            };

            ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args,
            }
        }
        _ => ast.clone(),
    }
}

/// Recursively expand macrolet calls in an AST
fn expand_macrolet_in_ast(
    ast: &ASTNode,
    macros: &[(String, Vec<String>, ASTNode)],
) -> Result<ASTNode, String> {
    match ast {
        ASTNode::Call { function, args } => {
            // Check if this is a macro call
            if let ASTNode::Variable(name) = &**function {
                for (macro_name, params, body) in macros {
                    if macro_name == name {
                        // Expand this macro call
                        return expand_macrolet_call(params, body, args);
                    }
                }
            }

            // Not a macro call, recursively expand in function and args
            let expanded_func = expand_macrolet_in_ast(function, macros)?;
            let expanded_args: Result<Vec<ASTNode>, String> = args.iter()
                .map(|a| expand_macrolet_in_ast(a, macros))
                .collect();
            Ok(ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args?,
            })
        }
        ASTNode::If { test, then_branch, else_branch } => {
            Ok(ASTNode::If {
                test: Box::new(expand_macrolet_in_ast(test, macros)?),
                then_branch: Box::new(expand_macrolet_in_ast(then_branch, macros)?),
                else_branch: Box::new(expand_macrolet_in_ast(else_branch, macros)?),
            })
        }
        ASTNode::Progn { exprs } => {
            let expanded: Result<Vec<ASTNode>, String> = exprs.iter()
                .map(|e| expand_macrolet_in_ast(e, macros))
                .collect();
            Ok(ASTNode::Progn { exprs: expanded? })
        }
        ASTNode::Let { bindings, body } => {
            let expanded_bindings: Result<Vec<(String, ASTNode)>, String> = bindings.iter()
                .map(|(name, val)| Ok((name.clone(), expand_macrolet_in_ast(val, macros)?)))
                .collect();
            let expanded_body: Result<Vec<ASTNode>, String> = body.iter()
                .map(|e| expand_macrolet_in_ast(e, macros))
                .collect();
            Ok(ASTNode::Let {
                bindings: expanded_bindings?,
                body: expanded_body?,
            })
        }
        _ => Ok(ast.clone()),
    }
}
