/// Control flow operations: do, dolist, dotimes, return

use super::eval_types::{
    EvalResult, RETURN_VALUE, ACTIVE_BLOCK_STACK, NEXT_BLOCK_ID, primary_value,
};
use super::eval_core::eval_with_env;
use crate::ir::{ASTNode, ConstantValue};
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

fn condition_true(value: &EvalResult) -> bool {
    let primary = primary_value(value.clone());
    !matches!(primary, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false))
}

fn canonical_block_name(name: &str) -> String {
    name.to_ascii_lowercase()
}

struct BlockFrameGuard {
    id: u64,
}

impl BlockFrameGuard {
    fn push(block_name: &str) -> Self {
        Self { id: push_block_frame(block_name) }
    }

    fn id(&self) -> u64 {
        self.id
    }
}

impl Drop for BlockFrameGuard {
    fn drop(&mut self) {
        pop_block_frame(self.id);
    }
}

pub(super) const BLOCK_CAPTURE_DEPTH_KEY: &str = "%__RLASP_BLOCK_CAPTURE_DEPTH__%";
pub(super) const BLOCK_CALL_ENTRY_DEPTH_KEY: &str = "%__RLASP_BLOCK_CALL_ENTRY_DEPTH__%";

fn depth_from_env(env: &HashMap<String, EvalResult>, key: &str) -> Option<usize> {
    match env.get(key) {
        Some(EvalResult::Fixnum(n)) if *n >= 0 => Some(*n as usize),
        _ => None,
    }
}

pub(super) fn current_block_depth() -> usize {
    ACTIVE_BLOCK_STACK.with(|stack| stack.borrow().len())
}

pub(super) fn push_block_frame(block_name: &str) -> u64 {
    let canonical = canonical_block_name(block_name);
    let id = NEXT_BLOCK_ID.with(|next| {
        let id = next.get();
        next.set(id + 1);
        id
    });
    ACTIVE_BLOCK_STACK.with(|stack| stack.borrow_mut().push((canonical, id)));
    id
}

pub(super) fn pop_block_frame(block_id: u64) {
    ACTIVE_BLOCK_STACK.with(|stack| {
        let mut stack = stack.borrow_mut();
        if matches!(stack.last(), Some((_, id)) if *id == block_id) {
            let _ = stack.pop();
            return;
        }
        if let Some(pos) = stack.iter().rposition(|(_, id)| *id == block_id) {
            stack.remove(pos);
        }
    });
}

pub(super) fn find_visible_block_id(block_name: &str, env: &HashMap<String, EvalResult>) -> Option<u64> {
    let capture_depth = depth_from_env(env, BLOCK_CAPTURE_DEPTH_KEY)?;
    let call_entry_depth = depth_from_env(env, BLOCK_CALL_ENTRY_DEPTH_KEY).unwrap_or(usize::MAX);
    let canonical = canonical_block_name(block_name);

    ACTIVE_BLOCK_STACK.with(|stack| {
        let stack = stack.borrow();
        for (idx, (active_name, id)) in stack.iter().enumerate().rev() {
            let depth = idx + 1;
            let visible = depth <= capture_depth || depth > call_entry_depth;
            if visible && active_name.eq_ignore_ascii_case(&canonical) {
                return Some(*id);
            }
        }
        None
    })
}

pub(super) fn extract_return_from_payload<'a>(err: &'a str, expected_block: &str) -> Option<&'a str> {
    let trimmed = err
        .split(" (callee ast:")
        .next()
        .unwrap_or(err)
        .trim();
    if trimmed.starts_with("RETURN-FROM-ID:") {
        return None;
    }
    let rest = trimmed.strip_prefix("RETURN-FROM:")?;
    let (block_name, payload) = rest.split_once(':')?;
    if block_name.eq_ignore_ascii_case(expected_block) {
        Some(payload)
    } else {
        None
    }
}

pub(super) fn extract_return_from_payload_for_block<'a>(
    err: &'a str,
    expected_block: &str,
    expected_block_id: u64,
) -> Option<&'a str> {
    let trimmed = err
        .split(" (callee ast:")
        .next()
        .unwrap_or(err)
        .trim();
    if let Some(rest) = trimmed.strip_prefix("RETURN-FROM-ID:") {
        let mut parts = rest.splitn(3, ':');
        let id = parts.next()?.parse::<u64>().ok()?;
        let _block = parts.next()?;
        let payload = parts.next()?;
        if id == expected_block_id {
            return Some(payload);
        }
        return None;
    }
    extract_return_from_payload(trimmed, expected_block)
}

/// Setf expander entry - stores either a simple updater function name
/// or a complex expansion (lambda-list, store-vars, body)
#[derive(Clone)]
pub enum SetfExpander {
    /// Simple form: (defsetf accessor updater) - call (updater args... new-value)
    Simple(String),
    /// Complex form: (defsetf accessor lambda-list (store-var) body...)
    Complex {
        lambda_list: Vec<String>,
        store_vars: Vec<String>,
        body: Vec<ASTNode>,
    },
}

thread_local! {
    /// Global table of setf expanders defined by defsetf
    pub static SETF_EXPANDERS: RefCell<HashMap<String, SetfExpander>> = RefCell::new(HashMap::new());
}

/// Register a setf expander for an accessor
pub fn register_setf_expander(accessor: &str, expander: SetfExpander) {
    SETF_EXPANDERS.with(|table| {
        table.borrow_mut().insert(accessor.to_uppercase(), expander);
    });
}

/// Get a setf expander for an accessor
pub fn get_setf_expander(accessor: &str) -> Option<SetfExpander> {
    SETF_EXPANDERS.with(|table| {
        table.borrow().get(&accessor.to_uppercase()).cloned()
    })
}

/// Evaluate defsetf
/// Simple form: (defsetf accessor updater)
/// Complex form: (defsetf accessor lambda-list (store-var) body...)
pub fn eval_defsetf(args: &[ASTNode], _env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("defsetf requires at least 2 arguments".to_string());
    }

    // Get accessor name
    let accessor = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("defsetf: first argument must be a symbol".to_string()),
    };

    // Simple form:
    //   (defsetf accessor updater)
    //   (defsetf accessor updater "docstring")
    let is_simple_form = matches!(&args[1], ASTNode::Variable(_))
        && (args.len() == 2
            || (args.len() == 3
                && matches!(&args[2], ASTNode::Constant(ConstantValue::String(_)))));

    if is_simple_form {
        let updater = match &args[1] {
            ASTNode::Variable(name) => name.clone(),
            _ => unreachable!(),
        };
        register_setf_expander(&accessor, SetfExpander::Simple(updater));
    } else {
        // Complex form: (defsetf accessor lambda-list (store-var) [docstring] body...)
        // Extract lambda-list
        let lambda_list = extract_lambda_list(&args[1])?;

        // Extract store-vars (should be a list with one variable)
        let store_vars = extract_lambda_list(&args[2])?;

        // Rest is body (skip optional docstring)
        let body_start = if args.len() > 3 {
            if let ASTNode::Constant(ConstantValue::String(_)) = &args[3] {
                4 // Skip docstring
            } else {
                3
            }
        } else {
            3
        };

        let body = args[body_start..].to_vec();

        register_setf_expander(&accessor, SetfExpander::Complex {
            lambda_list,
            store_vars,
            body,
        });
    }

    Ok(EvalResult::Symbol(accessor))
}

/// Extract parameter names from a lambda list AST node
fn extract_lambda_list(ast: &ASTNode) -> Result<Vec<String>, String> {
    match ast {
        ASTNode::Call { function, args } => {
            let mut params = Vec::new();
            if let ASTNode::Variable(name) = &**function {
                params.push(name.clone());
            }
            for arg in args {
                if let ASTNode::Variable(name) = arg {
                    params.push(name.clone());
                }
            }
            Ok(params)
        }
        ASTNode::Constant(ConstantValue::Nil) => Ok(vec![]),
        ASTNode::Variable(name) => Ok(vec![name.clone()]),
        _ => Err(format!("Invalid lambda list: {:?}", ast)),
    }
}

// Helper to check if a name is a car/cdr accessor
fn is_car_cdr_accessor(name: &str) -> bool {
    name == "car" || name == "cdr" ||
    name == "caar" || name == "cadr" || name == "cdar" || name == "cddr" ||
    name == "caaar" || name == "caadr" || name == "cadar" || name == "caddr" ||
    name == "cdaar" || name == "cdadr" || name == "cddar" || name == "cdddr" ||
    name == "caaaar" || name == "caaadr" || name == "caadar" || name == "caaddr" ||
    name == "cadaar" || name == "cadadr" || name == "caddar" || name == "cadddr" ||
    name == "cdaaar" || name == "cdaadr" || name == "cdadar" || name == "cdaddr" ||
    name == "cddaar" || name == "cddadr" || name == "cdddar" || name == "cddddr"
}

pub(super) fn eval_return(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // return exits from the nearest enclosing NIL block (implicitly created by do, loop, etc.)
    // This is equivalent to (return-from nil value)
    let return_val = if args.is_empty() {
        EvalResult::Nil
    } else {
        eval_with_env(&args[0], env)?
    };

    let encoded = encode_return_value(&return_val);
    if env.contains_key(BLOCK_CAPTURE_DEPTH_KEY) {
        if let Some(target_id) = find_visible_block_id("nil", env) {
            if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
                eprintln!("[return-raise] block=nil target={} value={:?}", target_id, return_val);
            }
            return Err(format!("RETURN-FROM-ID:{}:nil:{}", target_id, encoded));
        }
    }
    if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
        eprintln!("[return-raise] block=nil target=<name-only> value={:?}", return_val);
    }
    Err(format!("RETURN-FROM:nil:{}", encoded))
}

pub(super) fn eval_block(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (block name body-forms...)
    if args.is_empty() {
        return Err("block requires at least a name argument".to_string());
    }

    let block_name = canonical_block_name(&match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Nil) => "nil".to_string(),
        _ => return Err("block name must be a symbol".to_string()),
    });

    let body_forms = &args[1..];
    let block_id = push_block_frame(&block_name);

    let result = (|| -> Result<EvalResult, String> {
        let mut result = EvalResult::Nil;
        for form in body_forms {
            match eval_with_env(form, env) {
                Ok(val) => result = val,
                Err(e) => {
                    if let Some(value_part) =
                        extract_return_from_payload_for_block(&e, &block_name, block_id)
                    {
                        return decode_return_value(value_part.to_string());
                    }
                    return Err(e);
                }
            }
        }
        Ok(result)
    })();

    pop_block_frame(block_id);
    result
}

pub(super) fn eval_return_from(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (return-from name [value])
    if args.is_empty() {
        return Err("return-from requires at least a name argument".to_string());
    }

    let block_name = canonical_block_name(&match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Nil) => "nil".to_string(),
        _ => return Err("return-from name must be a symbol".to_string()),
    });

    let return_val = if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Nil
    };

    let encoded = encode_return_value(&return_val);
    if env.contains_key(BLOCK_CAPTURE_DEPTH_KEY) {
        if let Some(target_id) = find_visible_block_id(&block_name, env) {
            if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
                eprintln!(
                    "[return-raise] block={} target={} value={:?}",
                    block_name, target_id, return_val
                );
            }
            return Err(format!("RETURN-FROM-ID:{}:{}:{}", target_id, block_name, encoded));
        }
    }
    if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
        eprintln!(
            "[return-raise] block={} target=<name-only> value={:?}",
            block_name, return_val
        );
    }
    Err(format!("RETURN-FROM:{}:{}", block_name, encoded))
}

fn encode_return_value(val: &EvalResult) -> String {
    match val {
        EvalResult::Fixnum(n) => format!("FIXNUM:{}", n),
        EvalResult::Float(f) => format!("FLOAT:{}", f),
        EvalResult::Bool(b) => format!("BOOL:{}", b),
        EvalResult::Nil => "NIL".to_string(),
        EvalResult::String(s) => format!("STRING:{}", s),
        EvalResult::Symbol(s) => format!("SYMBOL:{}", s),
        _ => {
            RETURN_VALUE.with(|rv| *rv.borrow_mut() = Some(val.clone()));
            "COMPLEX".to_string()
        }
    }
}

// Decode the "RETURN:TYPE:value" format from eval_return
fn decode_return_from_format(e: &str) -> Result<EvalResult, String> {
    let e = e
        .split(" (callee ast:")
        .next()
        .unwrap_or(e)
        .trim();
    if e == "RETURN:NIL" {
        Ok(EvalResult::Nil)
    } else if e.starts_with("RETURN:FIXNUM:") {
        let num_str = &e[14..];
        num_str.parse::<i64>()
            .map(EvalResult::Fixnum)
            .map_err(|_| "Failed to parse fixnum".to_string())
    } else if e.starts_with("RETURN:FLOAT:") {
        let num_str = &e[13..];
        num_str.parse::<f64>()
            .map(EvalResult::Float)
            .map_err(|_| "Failed to parse float".to_string())
    } else if e.starts_with("RETURN:BOOL:") {
        let bool_str = &e[12..];
        Ok(EvalResult::Bool(bool_str == "true"))
    } else if e.starts_with("RETURN:STRING:") {
        Ok(EvalResult::String(e[14..].to_string()))
    } else if e.starts_with("RETURN:SYMBOL:") {
        Ok(EvalResult::Symbol(e[14..].to_string()))
    } else if e == "RETURN:CONS" || e == "RETURN:LAMBDA" || e.starts_with("RETURN:COMPLEX") {
        RETURN_VALUE.with(|rv| {
            rv.borrow_mut().take().ok_or_else(|| "return value not found".to_string())
        })
    } else {
        Ok(EvalResult::Nil)
    }
}

pub(super) fn decode_return_value(encoded: String) -> Result<EvalResult, String> {
    let encoded = encoded
        .split(" (callee ast:")
        .next()
        .unwrap_or(encoded.as_str())
        .trim()
        .to_string();
    if encoded == "NIL" {
        Ok(EvalResult::Nil)
    } else if encoded.starts_with("FIXNUM:") {
        let num_str = &encoded[7..];
        num_str.parse::<i64>()
            .map(EvalResult::Fixnum)
            .map_err(|_| "Failed to parse fixnum".to_string())
    } else if encoded.starts_with("FLOAT:") {
        let num_str = &encoded[6..];
        num_str.parse::<f64>()
            .map(EvalResult::Float)
            .map_err(|_| "Failed to parse float".to_string())
    } else if encoded.starts_with("BOOL:") {
        let bool_str = &encoded[5..];
        Ok(EvalResult::Bool(bool_str == "true"))
    } else if encoded.starts_with("STRING:") {
        Ok(EvalResult::String(encoded[7..].to_string()))
    } else if encoded.starts_with("SYMBOL:") {
        Ok(EvalResult::Symbol(encoded[7..].to_string()))
    } else if encoded.starts_with("COMPLEX") {
        RETURN_VALUE.with(|rv| {
            rv.borrow_mut().take()
                .ok_or_else(|| "return value not found".to_string())
        })
    } else {
        Err(format!("Unknown return encoding: {}", encoded))
    }
}

pub(super) fn eval_do(args: &[ASTNode], env: &mut HashMap<String, EvalResult>, sequential: bool) -> Result<EvalResult, String> {
    // (do ((var init step)...) (end-test result...) body...)
    if args.len() < 2 {
        return Err("do requires at least 2 arguments".to_string());
    }
    let block_guard = BlockFrameGuard::push("nil");

    // Parse variable bindings
    let var_specs = &args[0];
    let mut var_bindings: Vec<(String, EvalResult, Option<ASTNode>)> = Vec::new();

    // Extract variable specifications
    match var_specs {
        ASTNode::Constant(ConstantValue::Nil) => {
            // No variable bindings
        }
        ASTNode::Call { function, args: spec_args } => {
            // Process first binding
            if let ASTNode::Call { function: var_func, args: var_args } = &**function {
                if let ASTNode::Variable(var_name) = &**var_func {
                    let init_val = if !var_args.is_empty() {
                        eval_with_env(&var_args[0], env)?
                    } else {
                        EvalResult::Nil
                    };
                    let step_form = if var_args.len() > 1 {
                        Some(var_args[1].clone())
                    } else {
                        None
                    };
                    var_bindings.push((var_name.clone(), init_val, step_form));
                }
            }
            // Process remaining bindings
            for spec in spec_args {
                if let ASTNode::Call { function: var_func, args: var_args } = spec {
                    if let ASTNode::Variable(var_name) = &**var_func {
                        let init_val = if !var_args.is_empty() {
                            if sequential {
                                // do*: evaluate in the extended environment
                                let mut loop_env = env.clone();
                                for (name, val, _) in &var_bindings {
                                    loop_env.insert(name.clone(), val.clone());
                                }
                                eval_with_env(&var_args[0], &mut loop_env)?
                            } else {
                                // do: evaluate in original environment
                                eval_with_env(&var_args[0], env)?
                            }
                        } else {
                            EvalResult::Nil
                        };
                        let step_form = if var_args.len() > 1 {
                            Some(var_args[1].clone())
                        } else {
                            None
                        };
                        var_bindings.push((var_name.clone(), init_val, step_form));
                    }
                }
            }
        }
        _ => return Err("do: invalid variable specifications".to_string()),
    }

    // Parse end test and result forms
    let end_clause = &args[1];
    let (end_test, result_forms) = match end_clause {
        ASTNode::Call { function, args: result_args } => {
            (function.as_ref().clone(), result_args.clone())
        }
        _ => return Err("do: invalid end clause".to_string()),
    };

    // Body forms
    let body_forms = &args[2..];

    // Create loop environment
    let mut loop_env = env.clone();
    for (var_name, init_val, _) in &var_bindings {
        loop_env.insert(var_name.clone(), init_val.clone());
    }

    // Loop until end test is true
    let mut iteration_count = 0;
    loop {
        iteration_count += 1;
        if iteration_count > 10000 {
            return Err("do: exceeded maximum iterations (possible infinite loop)".to_string());
        }

        // Check end test
        let test_result = eval_with_env(&end_test, &mut loop_env)?;
        if condition_true(&test_result) {
            // End test is true, evaluate result forms
            let mut result = EvalResult::Nil;
            for form in &result_forms {
                result = eval_with_env(form, &mut loop_env)?;
            }
            return Ok(result);
        }

        // Execute body forms
        for form in body_forms {
            match eval_with_env(form, &mut loop_env) {
                Ok(_) => {},
                Err(e) if extract_return_from_payload_for_block(&e, "nil", block_guard.id()).is_some() => {
                    let payload =
                        extract_return_from_payload_for_block(&e, "nil", block_guard.id()).unwrap_or("NIL");
                    return decode_return_value(payload.to_string());
                }
                Err(e) if e.starts_with("RETURN:") => {
                    // Return signaled from body - decode the value
                    if e == "RETURN:NIL" {
                        return Ok(EvalResult::Nil);
                    } else if e.starts_with("RETURN:FIXNUM:") {
                        let num_str = &e[14..];
                        if let Ok(n) = num_str.parse::<i64>() {
                            return Ok(EvalResult::Fixnum(n));
                        }
                    } else if e.starts_with("RETURN:FLOAT:") {
                        let num_str = &e[13..];
                        if let Ok(f) = num_str.parse::<f64>() {
                            return Ok(EvalResult::Float(f));
                        }
                    } else if e.starts_with("RETURN:BOOL:") {
                        let bool_str = &e[12..];
                        if bool_str == "true" {
                            return Ok(EvalResult::Bool(true));
                        } else {
                            return Ok(EvalResult::Nil);
                        }
                    } else if e.starts_with("RETURN:STRING:") {
                        let s = &e[14..];
                        return Ok(EvalResult::String(s.to_string()));
                    } else if e.starts_with("RETURN:SYMBOL:") {
                        let s = &e[14..];
                        return Ok(EvalResult::Symbol(s.to_string()));
                    } else if e == "RETURN:CONS" || e == "RETURN:LAMBDA" || e == "RETURN:COMPLEX" {
                        // Get from thread-local storage
                        return RETURN_VALUE.with(|rv| {
                            rv.borrow_mut().take().ok_or_else(|| "return value not found".to_string())
                        });
                    }
                    return Ok(EvalResult::Nil);
                }
                Err(e) => return Err(e),
            }
        }

        // Step variables
        if sequential {
            // do*: evaluate and update sequentially
            for (var_name, _current_val, step_form) in &var_bindings {
                if let Some(step) = step_form {
                    let new_val = eval_with_env(step, &mut loop_env)?;
                    loop_env.insert(var_name.clone(), new_val);
                }
            }
        } else {
            // do: evaluate all steps in parallel then update
            let mut new_values = Vec::new();
            for (var_name, _current_val, step_form) in &var_bindings {
                let new_val = if let Some(step) = step_form {
                    eval_with_env(step, &mut loop_env)?
                } else {
                    loop_env.get(var_name).cloned().unwrap_or(EvalResult::Nil)
                };
                new_values.push((var_name.clone(), new_val));
            }
            // Update all variables at once
            for (var_name, new_val) in new_values {
                loop_env.insert(var_name, new_val);
            }
        }
    }
}

pub(super) fn eval_dolist(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (dolist (var list-form result-form) body...)
    if args.is_empty() {
        return Err("dolist requires at least 1 argument".to_string());
    }
    let block_guard = BlockFrameGuard::push("nil");

    // Parse the iteration spec: (var list-form result-form?)
    let spec = &args[0];
    let spec_parts = match spec {
        ASTNode::Call { function, args: spec_args } => {
            let mut parts = vec![*function.clone()];
            parts.extend(spec_args.clone());
            parts
        }
        _ => return Err("dolist spec must be a list".to_string()),
    };

    if spec_parts.len() < 2 || spec_parts.len() > 3 {
        return Err("dolist spec must have 2 or 3 elements: (var list-form [result-form])".to_string());
    }

    let var_name = match &spec_parts[0] {
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("dolist variable must be a symbol".to_string()),
    };

    let list_form = &spec_parts[1];
    let result_form = spec_parts.get(2);
    let body_forms = &args[1..];

    // Evaluate the list form
    let list_val = eval_with_env(list_form, env)?;

    // Save old value of var (if it exists)
    let old_val = env.get(&var_name).cloned();

    // Iterate over the list
    let mut current = list_val;
    let mut iteration_count = 0;
    loop {
        iteration_count += 1;
        if iteration_count > 10000 {
            return Err("dolist: exceeded maximum iterations (possible infinite loop)".to_string());
        }

        // Extract current element and next before match
        let (elem, next) = match &current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                (car.borrow().clone(), cdr.borrow().clone())
            }
            _ => return Err("dolist list must be a proper list".to_string()),
        };

        // Bind var to current element
        env.insert(var_name.clone(), elem);

        // Execute body forms
        for form in body_forms {
            match eval_with_env(form, env) {
                Ok(_) => {},
                Err(e) if extract_return_from_payload_for_block(&e, "nil", block_guard.id()).is_some() => {
                    // Restore old value and return
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    let payload =
                        extract_return_from_payload_for_block(&e, "nil", block_guard.id()).unwrap_or("NIL");
                    return decode_return_value(payload.to_string());
                }
                Err(e) if e.starts_with("RETURN:") => {
                    // Restore old value and return
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    return decode_return_value(e);
                }
                Err(e) => {
                    // Restore old value before propagating error
                    if let Some(val) = old_val {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    return Err(e);
                }
            }
        }

        // Move to next element
        current = next;
    }

    // Set var to nil after iteration (Common Lisp spec)
    env.insert(var_name.clone(), EvalResult::Nil);

    // Evaluate result form if provided
    let result = if let Some(form) = result_form {
        eval_with_env(form, env)?
    } else {
        EvalResult::Nil
    };

    // Restore old value of var
    if let Some(val) = old_val {
        env.insert(var_name, val);
    } else {
        env.remove(&var_name);
    }

    Ok(result)
}

pub(super) fn eval_dotimes(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (dotimes (var count-form result-form) body...)
    if args.is_empty() {
        return Err("dotimes requires at least 1 argument".to_string());
    }
    let block_guard = BlockFrameGuard::push("nil");

    // Parse the iteration spec: (var count-form result-form?)
    let spec = &args[0];
    let spec_parts = match spec {
        ASTNode::Call { function, args: spec_args } => {
            let mut parts = vec![*function.clone()];
            parts.extend(spec_args.clone());
            parts
        }
        _ => return Err("dotimes spec must be a list".to_string()),
    };

    if spec_parts.len() < 2 || spec_parts.len() > 3 {
        return Err("dotimes spec must have 2 or 3 elements: (var count-form [result-form])".to_string());
    }

    let var_name = match &spec_parts[0] {
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("dotimes variable must be a symbol".to_string()),
    };

    let count_form = &spec_parts[1];
    let result_form = spec_parts.get(2);
    let body_forms = &args[1..];

    // Evaluate the count form
    let count_val = eval_with_env(count_form, env)?;
    let count = match count_val {
        EvalResult::Fixnum(n) if n >= 0 => n as usize,
        EvalResult::Fixnum(n) => return Err(format!("dotimes count must be non-negative, got {}", n)),
        _ => return Err("dotimes count must be a fixnum".to_string()),
    };

    // Save old value of var (if it exists)
    let old_val = env.get(&var_name).cloned();

    // Iterate from 0 to count-1
    for i in 0..count {
        // Bind var to current index
        env.insert(var_name.clone(), EvalResult::Fixnum(i as i64));

        // Execute body forms
        for form in body_forms {
            match eval_with_env(form, env) {
                Ok(_) => {},
                // Check RETURN-FROM NIL FIRST (more specific pattern)
                Err(e) if extract_return_from_payload_for_block(&e, "nil", block_guard.id()).is_some() => {
                    // Handle return-from nil format (from (return ...) which converts to (return-from nil ...))
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    let value_part =
                        extract_return_from_payload_for_block(&e, "nil", block_guard.id()).unwrap_or("NIL");
                    return decode_return_value(value_part.to_string());
                }
                // Then check RETURN: (less specific pattern)
                Err(e) if e.starts_with("RETURN:") => {
                    // Restore old value and return
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    // Decode the return value
                    return decode_return_from_format(&e);
                }
                Err(e) => {
                    // Restore old value before propagating error
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    return Err(e);
                }
            }
        }
    }

    // Set var to count after iteration (Common Lisp spec)
    env.insert(var_name.clone(), EvalResult::Fixnum(count as i64));

    // Evaluate result form if provided
    let result = if let Some(form) = result_form {
        eval_with_env(form, env)?
    } else {
        EvalResult::Nil
    };

    // Restore old value of var
    if let Some(val) = old_val {
        env.insert(var_name, val);
    } else {
        env.remove(&var_name);
    }

    Ok(result)
}

pub(super) fn eval_prog1(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (prog1 first-form other-forms...)
    // Evaluates all forms in sequence, returns the value of the first form
    if args.is_empty() {
        return Err("prog1 requires at least 1 argument".to_string());
    }

    let first_result = eval_with_env(&args[0], env)?;

    // Evaluate remaining forms for side effects
    for form in &args[1..] {
        eval_with_env(form, env)?;
    }

    Ok(first_result)
}

pub(super) fn eval_prog2(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (prog2 first-form second-form other-forms...)
    // Evaluates all forms in sequence, returns the value of the second form
    if args.len() < 2 {
        return Err("prog2 requires at least 2 arguments".to_string());
    }

    // Evaluate first form for side effects
    eval_with_env(&args[0], env)?;

    // Evaluate second form and save result
    let second_result = eval_with_env(&args[1], env)?;

    // Evaluate remaining forms for side effects
    for form in &args[2..] {
        eval_with_env(form, env)?;
    }

    Ok(second_result)
}

pub(super) fn eval_while(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (while test body...)
    // Evaluates body forms repeatedly while test is non-nil
    if args.is_empty() {
        return Err("while requires at least 1 argument (test condition)".to_string());
    }

    let test = &args[0];
    let body_forms = &args[1..];

    let mut iteration_count = 0;
    const MAX_ITERATIONS: usize = 1000000;

    loop {
        iteration_count += 1;
        if iteration_count > MAX_ITERATIONS {
            return Err("while: exceeded maximum iterations (possible infinite loop)".to_string());
        }

        // Evaluate test condition
        let test_result = eval_with_env(test, env)?;

        // Check if test is nil or false
        let is_nil = !condition_true(&test_result);
        if is_nil {
            break;
        }

        // Execute body forms
        for form in body_forms {
            eval_with_env(form, env)?;
        }
    }

    // while returns nil
    Ok(EvalResult::Nil)
}

pub(super) fn eval_assert(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (assert test-form)
    if args.is_empty() {
        return Err("assert requires at least 1 argument".to_string());
    }

    let test_form = &args[0];
    let test_result = eval_with_env(test_form, env)?;

    // Check if test is false
    if !condition_true(&test_result) {
        return Err(format!("Assertion failed: {:?}", test_form));
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_check_type(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (check-type place typespec &optional string)
    // Signals an error if the value of place is not of type typespec
    if args.len() < 2 {
        return Err("check-type requires at least 2 arguments (place typespec)".to_string());
    }

    let place = &args[0];
    let value = eval_with_env(place, env)?;
    let typespec = &args[1];

    // Check if the value matches the typespec
    let matches = check_typespec_matches(&value, typespec, env)?;

    if !matches {
        let type_desc = format_typespec(typespec);
        let place_desc = format!("{:?}", place);
        eprintln!("DEBUG check-type failed: place={} value={:?} type={}", place_desc, value, type_desc);
        let string_desc = if args.len() > 2 {
            match eval_with_env(&args[2], env)? {
                EvalResult::String(s) => format!(": {}", s),
                _ => String::new(),
            }
        } else {
            String::new()
        };
        return Err(format!("The value {:?} is not of type {}{}", value, type_desc, string_desc));
    }

    Ok(EvalResult::Nil)
}

fn format_typespec(typespec: &ASTNode) -> String {
    match typespec {
        ASTNode::Variable(name) => name.to_uppercase(),
        ASTNode::Quote(inner) => format_typespec(inner),
        ASTNode::Call { function, args } => {
            if let ASTNode::Variable(name) = function.as_ref() {
                let args_str: Vec<String> = args.iter().map(format_typespec).collect();
                format!("({} {})", name.to_uppercase(), args_str.join(" "))
            } else {
                "UNKNOWN-TYPE".to_string()
            }
        }
        ASTNode::Constant(c) => format!("{:?}", c),
        _ => "UNKNOWN-TYPE".to_string(),
    }
}

fn check_typespec_matches(value: &EvalResult, typespec: &ASTNode, env: &mut HashMap<String, EvalResult>) -> Result<bool, String> {
    match typespec {
        ASTNode::Variable(name) => Ok(type_matches(value, &name.to_uppercase())),
        ASTNode::Quote(inner) => check_typespec_matches(value, inner, env),
        ASTNode::Call { function, args } => {
            // Handle compound type specifiers like (member nil t), (or null package), etc.
            if let ASTNode::Variable(name) = function.as_ref() {
                match name.to_uppercase().as_str() {
                    "MEMBER" => {
                        // (member item1 item2 ...) - check if value is eql to any item
                        for arg in args {
                            let item = eval_with_env(arg, env)?;
                            if eql_values(value, &item) {
                                return Ok(true);
                            }
                        }
                        Ok(false)
                    }
                    "OR" => {
                        // (or type1 type2 ...) - check if value matches any type
                        for arg in args {
                            if check_typespec_matches(value, arg, env)? {
                                return Ok(true);
                            }
                        }
                        Ok(false)
                    }
                    "AND" => {
                        // (and type1 type2 ...) - check if value matches all types
                        for arg in args {
                            if !check_typespec_matches(value, arg, env)? {
                                return Ok(false);
                            }
                        }
                        Ok(true)
                    }
                    "NOT" => {
                        // (not type) - check if value does NOT match type
                        if args.len() != 1 {
                            return Err("NOT type specifier requires exactly one argument".to_string());
                        }
                        Ok(!check_typespec_matches(value, &args[0], env)?)
                    }
                    "EQL" => {
                        // (eql object) - check if value is eql to object
                        if args.len() != 1 {
                            return Err("EQL type specifier requires exactly one argument".to_string());
                        }
                        let item = eval_with_env(&args[0], env)?;
                        Ok(eql_values(value, &item))
                    }
                    "SATISFIES" => {
                        // (satisfies predicate) - always return true for now (complex to implement)
                        Ok(true)
                    }
                    _ => {
                        // Unknown compound type - be permissive
                        Ok(true)
                    }
                }
            } else {
                // Unknown function form - be permissive
                Ok(true)
            }
        }
        _ => {
            // Unknown typespec form - be permissive
            Ok(true)
        }
    }
}

/// EQ comparison (pointer identity for cons, otherwise same as eql)
pub(super) fn eq_values(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Cons(car1, cdr1), EvalResult::Cons(car2, cdr2)) => {
            Rc::ptr_eq(car1, car2) && Rc::ptr_eq(cdr1, cdr2)
        }
        _ => eql_values(a, b),
    }
}

pub(super) fn eql_values(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Boolean(x), EvalResult::Boolean(y)) => x == y,
        (EvalResult::Bool(x), EvalResult::Bool(y)) => x == y,
        (EvalResult::Fixnum(x), EvalResult::Fixnum(y)) => x == y,
        (EvalResult::Float(x), EvalResult::Float(y)) => x == y,
        (EvalResult::Character(x), EvalResult::Character(y)) => x == y,
        (EvalResult::Symbol(x), EvalResult::Symbol(y)) => x == y,
        (EvalResult::String(x), EvalResult::String(y)) => x == y,
        _ => false,
    }
}

fn type_matches(value: &EvalResult, type_name: &str) -> bool {
    match type_name {
        "T" => true,
        "NIL" => false,
        "NULL" => matches!(value, EvalResult::Nil),
        "SYMBOL" => matches!(value, EvalResult::Symbol(_)),
        "KEYWORD" => {
            if let EvalResult::Symbol(s) = value {
                s.starts_with(':')
            } else {
                false
            }
        },
        "STRING" => matches!(value, EvalResult::String(_)),
        "INTEGER" => matches!(value, EvalResult::Fixnum(_) | EvalResult::Bignum(_)),
        "FIXNUM" => matches!(value, EvalResult::Fixnum(_)),
        "BIGNUM" => matches!(value, EvalResult::Bignum(_)),
        "FLOAT" => matches!(value, EvalResult::Float(_)),
        "NUMBER" | "REAL" => matches!(value, EvalResult::Fixnum(_) | EvalResult::Float(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_)),
        "RATIO" => matches!(value, EvalResult::Ratio(_)),
        "COMPLEX" => matches!(value, EvalResult::Complex(_, _)),
        "CONS" => matches!(value, EvalResult::Cons(_, _)),
        "LIST" => matches!(value, EvalResult::Cons(_, _) | EvalResult::Nil),
        "ATOM" => !matches!(value, EvalResult::Cons(_, _)),
        "SEQUENCE" => matches!(value, EvalResult::Cons(_, _) | EvalResult::Array(_) | EvalResult::String(_) | EvalResult::Nil),
        "ARRAY" | "VECTOR" | "SIMPLE-VECTOR" => matches!(value, EvalResult::Array(_)),
        "HASH-TABLE" => matches!(value, EvalResult::HashTable(_)),
        "FUNCTION" => matches!(value, EvalResult::Lambda { .. } | EvalResult::Macro { .. } | EvalResult::ModifyMacro { .. } | EvalResult::BuiltinFunction(_) | EvalResult::GenericFunction(_) | EvalResult::ForeignFunction(_)),
        "BOOLEAN" => {
            match value {
                EvalResult::Nil | EvalResult::Bool(_) | EvalResult::Boolean(_) => true,
                EvalResult::Symbol(s) if s.to_uppercase() == "T" => true,
                _ => false,
            }
        },
        "CHARACTER" => matches!(value, EvalResult::Character(_)),
        "INSTANCE" => matches!(value, EvalResult::Instance(_)),
        "GENERIC-FUNCTION" => matches!(value, EvalResult::GenericFunction(_)),
        "PACKAGE" => {
            // Check if the value is a Package object or a symbol naming a valid package
            match value {
                EvalResult::Package(_) => true,
                EvalResult::Symbol(name) => {
                    super::eval_package::PACKAGES.with(|p| {
                        p.borrow().contains_key(&name.to_uppercase())
                    })
                }
                _ => false
            }
        }
        "PACKAGE-DESIGNATOR" => {
            // A package designator can be a package, string, or symbol
            matches!(value, EvalResult::Symbol(_) | EvalResult::String(_))
        }
        _ => {
            // For compound types like (or null package), (member nil t), etc.
            // or for unknown types, just return true for now (permissive)
            true
        }
    }
}

/// Implements (define-modify-macro name lambda-list function [documentation])
/// This macro-defining macro creates a read-modify-write macro.
/// Example: (define-modify-macro incf (&optional (delta 1)) +)
/// creates (defmacro incf (place &optional (delta 1)) `(setf ,place (+ ,place ,delta)))
pub(super) fn eval_define_modify_macro(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (define-modify-macro name lambda-list function [documentation])
    if args.len() < 3 {
        return Err("define-modify-macro requires at least 3 arguments (name lambda-list function)".to_string());
    }

    // Get name - could be Variable or quoted symbol
    let name = match &args[0] {
        ASTNode::Variable(s) => s.clone(),
        ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
        _ => return Err("define-modify-macro: name must be a symbol".to_string()),
    };

    // Get function name
    let func_name = match &args[2] {
        ASTNode::Variable(s) => s.clone(),
        ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
        _ => return Err("define-modify-macro: function must be a symbol".to_string()),
    };

    // Extract lambda-list parameters
    let lambda_list_nodes = match &args[1] {
        ASTNode::Call { function, args: inner_args } => {
            let mut nodes = vec![function.as_ref().clone()];
            nodes.extend(inner_args.clone());
            nodes
        }
        _ => vec![],  // Empty lambda list
    };

    // Check for &rest
    let has_rest = lambda_list_nodes.iter().any(|n| {
        match n {
            ASTNode::Variable(s) | ASTNode::Constant(ConstantValue::Symbol(s)) => s == "&rest",
            _ => false,
        }
    });

    // Get parameter names from AST nodes
    fn get_symbol_name(node: &ASTNode) -> Option<String> {
        match node {
            ASTNode::Variable(s) => Some(s.clone()),
            ASTNode::Constant(ConstantValue::Symbol(s)) => Some(s.clone()),
            ASTNode::Call { function, .. } => get_symbol_name(function),
            _ => None,
        }
    }

    // Build macro parameters: (place &optional arg1 arg2) or (place &rest args)
    let mut macro_params = vec!["place".to_string()];
    for node in &lambda_list_nodes {
        if let Some(s) = get_symbol_name(node) {
            macro_params.push(s);
        }
    }

    // Store as modify-macro which will be expanded specially
    let macro_def = EvalResult::ModifyMacro {
        name: name.clone(),
        params: macro_params,
        function: func_name.clone(),
        has_rest,
    };

    // Register in the environment (like defmacro does)
    env.insert(name.clone(), macro_def);

    Ok(EvalResult::Symbol(name))
}

// Helper to navigate and get value from car/cdr accessors
fn navigate_and_get(accessor: &str, cons: EvalResult) -> Result<EvalResult, String> {
    // Parse accessor: "cadr" means (car (cdr x))
    // We need to read from right to left: first cdr, then car
    let ops: Vec<char> = accessor.chars().skip(1).take(accessor.len() - 2).collect();
    let mut current = cons;

    // Navigate through all ops
    for &op in ops.iter().rev() {
        current = match current {
            EvalResult::Cons(car, cdr) => {
                if op == 'a' {
                    car.borrow().clone()
                } else {
                    cdr.borrow().clone()
                }
            }
            _ => return Err(format!("Not a cons cell while navigating {}", accessor)),
        };
    }

    Ok(current)
}

// Helper to navigate and set value for car/cdr accessors
fn navigate_and_incf(accessor: &str, cons: EvalResult, delta: EvalResult) -> Result<EvalResult, String> {
    // Parse accessor: "cadr" means (car (cdr x)), so we modify (car (cdr x))
    let ops: Vec<char> = accessor.chars().skip(1).take(accessor.len() - 2).collect();
    let mut current = cons;

    // Navigate to the parent cons cell (all but the last op)
    for &op in ops.iter().skip(1) {
        current = match current {
            EvalResult::Cons(car, cdr) => {
                if op == 'a' { car.borrow().clone() }
                else { cdr.borrow().clone() }
            }
            _ => return Err(format!("Not a cons cell while navigating {}", accessor)),
        };
    }

    // Now modify based on the first op
    match current {
        EvalResult::Cons(car, cdr) => {
            let cell_to_modify = if ops[0] == 'a' { &car } else { &cdr };
            let current_val = cell_to_modify.borrow().clone();

            // Add delta to current value
            let new_val = match (current_val, delta) {
                (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a + b),
                (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a + b),
                (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 + b),
                (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a + b as f64),
                _ => return Err("incf requires numeric arguments".to_string()),
            };

            *cell_to_modify.borrow_mut() = new_val.clone();
            Ok(new_val)
        }
        other => Err(format!("Not a cons cell for final {} operation: {:?}", accessor, other)),
    }
}

pub(super) fn eval_incf(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (incf place [delta])
    if args.is_empty() {
        return Err("incf requires at least 1 argument".to_string());
    }

    let place = &args[0];
    let delta = super::eval_types::primary_value(if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Fixnum(1)
    });

    // For historical compatibility, unbound variables and absent gethash values
    // behave as if initialized to 0 for INCF.
    let current_val = super::eval_types::primary_value(match place {
        ASTNode::Variable(name) => env.get(name).cloned().unwrap_or(EvalResult::Fixnum(0)),
        ASTNode::Call { function, args: place_args } => {
            if let ASTNode::Variable(func_name) = &**function {
                match func_name.as_str() {
                    "gethash" if place_args.len() >= 2 => {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;
                        let key_str = super::eval_system::key_to_typed_string(&key)?;
                        match ht {
                            EvalResult::HashTable(ref table) => {
                                table.borrow().get(&key_str).cloned().unwrap_or(EvalResult::Fixnum(0))
                            }
                            _ => return Err("incf gethash: not a hash table".to_string()),
                        }
                    }
                    _ => eval_with_env(place, env)?,
                }
            } else {
                eval_with_env(place, env)?
            }
        }
        _ => eval_with_env(place, env)?,
    });

    let new_val = match (current_val, delta) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a + b),
        (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a + b),
        (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 + b),
        (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a + b as f64),
        _ => return Err("incf requires numeric arguments".to_string()),
    };

    let setf_args = vec![
        place.clone(),
        super::eval_system::result_to_ast_quoted(&new_val)?,
    ];
    eval_setf(&setf_args, env)?;

    Ok(new_val)
}

pub(super) fn eval_decf(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (decf place [delta])
    if args.is_empty() {
        return Err("decf requires at least 1 argument".to_string());
    }

    let place = &args[0];
    let delta = super::eval_types::primary_value(if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Fixnum(1)
    });

    // Keep parity with INCF behavior for historical tests.
    let current_val = super::eval_types::primary_value(match place {
        ASTNode::Variable(name) => env.get(name).cloned().unwrap_or(EvalResult::Fixnum(0)),
        ASTNode::Call { function, args: place_args } => {
            if let ASTNode::Variable(func_name) = &**function {
                match func_name.as_str() {
                    "gethash" if place_args.len() >= 2 => {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;
                        let key_str = super::eval_system::key_to_typed_string(&key)?;
                        match ht {
                            EvalResult::HashTable(ref table) => {
                                table.borrow().get(&key_str).cloned().unwrap_or(EvalResult::Fixnum(0))
                            }
                            _ => return Err("decf gethash: not a hash table".to_string()),
                        }
                    }
                    _ => eval_with_env(place, env)?,
                }
            } else {
                eval_with_env(place, env)?
            }
        }
        _ => eval_with_env(place, env)?,
    });

    let new_val = match (current_val, delta) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a - b),
        (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a - b),
        (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 - b),
        (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a - b as f64),
        _ => return Err("decf requires numeric arguments".to_string()),
    };

    let setf_args = vec![
        place.clone(),
        super::eval_system::result_to_ast_quoted(&new_val)?,
    ];
    eval_setf(&setf_args, env)?;

    Ok(new_val)
}

pub(super) fn eval_eval_when(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (eval-when (situation*) form*)
    // Situations: :compile-toplevel, :load-toplevel, :execute
    // In interpreter mode:
    //   - :execute means execute now
    //   - :load-toplevel means execute when loading
    //   - :compile-toplevel is ignored (we're not compiling)
    if args.is_empty() {
        return Err("eval-when requires at least 1 argument".to_string());
    }

    // Parse the situations list
    let mut should_execute = false;

    if let Some(situations) = args.get(0) {
        let situation_list = match situations {
            ASTNode::Call { function: _, args: situations_args } => {
                // (situation1 situation2 ...)
                let mut slist = vec![];
                match &**&situations {
                    ASTNode::Variable(first) => slist.push(first.clone()),
                    ASTNode::Constant(crate::ir::ConstantValue::Symbol(s)) => slist.push(s.clone()),
                    _ => {}
                }
                for arg in situations_args {
                    match arg {
                        ASTNode::Variable(s) => slist.push(s.clone()),
                        ASTNode::Constant(crate::ir::ConstantValue::Symbol(s)) => slist.push(s.clone()),
                        _ => {}
                    }
                }
                slist
            }
            ASTNode::Constant(crate::ir::ConstantValue::Nil) => {
                // Empty situations list - don't execute
                vec![]
            }
            ASTNode::Variable(s) => vec![s.clone()],
            ASTNode::Constant(crate::ir::ConstantValue::Symbol(s)) => vec![s.clone()],
            _ => vec![],
        };

        // Check if any situation matches interpreter mode
        for situation in situation_list {
            let sit_lower = situation.to_lowercase();
            let sit_normalized = sit_lower.trim_start_matches(':');
            match sit_normalized {
                "execute" | "eval" => {
                    // :execute - execute at runtime in interpreter
                    should_execute = true;
                }
                "load-toplevel" | "load" => {
                    // :load-toplevel - execute when loading file (interpreter loads)
                    should_execute = true;
                }
                "compile-toplevel" | "compile" => {
                    // :compile-toplevel - only for compiler, ignore in interpreter
                    // But many ASDF forms use this, so we execute anyway for compatibility
                    should_execute = true;
                }
                _ => {}
            }
        }
    }

    if !should_execute {
        return Ok(EvalResult::Nil);
    }

    // Execute the forms
    let forms = &args[1..];
    let mut result = EvalResult::Nil;
    for form in forms {
        result = eval_with_env(form, env)?;
    }
    Ok(result)
}

pub(super) fn eval_setf(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (setf place value [place value]...)
    if args.is_empty() || args.len() % 2 != 0 {
        return Err("setf requires an even number of arguments (place value pairs)".to_string());
    }

    let mut last_value = EvalResult::Nil;

    for i in (0..args.len()).step_by(2) {
        let place = &args[i];
        let value = eval_with_env(&args[i + 1], env)?;

        match place {
            // Simple variable
            ASTNode::Variable(var_name) => {
                // Handle special global variables
                if var_name == "*features*" {
                    super::eval_symbol::set_features(value.clone());
                    last_value = value.clone();
                } else {
                    env.insert(var_name.clone(), value.clone());
                    // Also update global dynamic store for special variables
                    if super::eval_types::is_special_variable(var_name) {
                        super::eval_types::set_dynamic_var(var_name, value.clone());
                    }
                    last_value = value.clone();
                }
            }
            // (gethash key ht) or (aref array index)
            ASTNode::Call { function, args: place_args } => {
                if let ASTNode::Variable(func_name) = &**function {
                    let base_name = func_name.rsplit(':').next().unwrap_or(func_name.as_str());
                    if base_name.eq_ignore_ascii_case("atomic") && !place_args.is_empty() {
                        // (setf (mp:atomic PLACE &key ...) value) -> (setf PLACE value)
                        let nested_setf = ASTNode::Call {
                            function: Box::new(ASTNode::Variable("setf".to_string())),
                            args: vec![
                                place_args[0].clone(),
                                super::eval_system::result_to_ast_quoted(&value)?,
                            ],
                        };
                        last_value = eval_with_env(&nested_setf, env)?;
                    } else if func_name == "stream-element-type" && !place_args.is_empty() {
                        let stream = eval_with_env(&place_args[0], env)?;
                        let _ = super::eval_io::call_io_builtin(
                            "set-stream-element-type",
                            &[stream, value.clone()],
                        )?;
                        last_value = value.clone();
                    } else if func_name == "stream-external-format" && !place_args.is_empty() {
                        let stream = eval_with_env(&place_args[0], env)?;
                        let _ = super::eval_io::call_io_builtin(
                            "set-stream-external-format",
                            &[stream, value.clone()],
                        )?;
                        last_value = value.clone();
                    } else
                    if func_name == "gethash" && place_args.len() >= 2 {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;

                        let key_str = super::eval_system::key_to_typed_string(&key)?;

                        match ht {
                            EvalResult::HashTable(ref table) => {
                                table.borrow_mut().insert(key_str, value.clone());
                                last_value = value.clone();
                            }
                            _ => return Err("setf gethash: second argument must be a hash table".to_string()),
                        }
                    } else if func_name == "symbol-value" && place_args.len() == 1 {
                        let sym_val = eval_with_env(&place_args[0], env)?;
                        let sym_val = match sym_val {
                            EvalResult::MultipleValues(vals) if !vals.is_empty() => vals[0].clone(),
                            other => other,
                        };

                        let sym_name = match sym_val {
                            EvalResult::Symbol(name) => name,
                            EvalResult::Nil => return Err("setf symbol-value: nil is not a symbol".to_string()),
                            _ => return Err("setf symbol-value requires a symbol".to_string()),
                        };

                        if sym_name == "*features*" {
                            super::eval_symbol::set_features(value.clone());
                        } else {
                            env.insert(sym_name, value.clone());
                        }
                        last_value = value.clone();
                    } else if (func_name == "aref" || func_name == "svref") && place_args.len() >= 2 {
                        // For (setf (aref array-var index) value), get the array from environment
                        let array_result = eval_with_env(&place_args[0], env)?;
                        let index = eval_with_env(&place_args[1], env)?;

                        let idx = match index {
                            EvalResult::Fixnum(n) if n >= 0 => n as usize,
                            _ => return Err("aref index must be a non-negative integer".to_string()),
                        };

                        match array_result {
                            EvalResult::Array(ref arr) => {
                                let mut array_mut = arr.borrow_mut();
                                if idx < array_mut.len() {
                                    array_mut[idx] = value.clone();
                                    last_value = value.clone();
                                } else {
                                    return Err(format!("aref index {} out of bounds (array length {})", idx, array_mut.len()));
                                }
                            }
                            EvalResult::String(ref s) => {
                                // Special case: strings are mutable in Common Lisp
                                // Convert to Vec<char>, modify, convert back
                                let mut chars: Vec<char> = s.chars().collect();
                                if idx >= chars.len() {
                                    return Err(format!("aref index {} out of bounds (string length {})", idx, chars.len()));
                                }

                                // Get the character to set
                                let new_char = match value {
                                    EvalResult::Character(c) => c,
                                    EvalResult::String(ref s) if s.len() == 1 => s.chars().next().unwrap(),
                                    _ => return Err("setf aref on string requires a character value".to_string()),
                                };

                                chars[idx] = new_char;
                                let new_string = chars.into_iter().collect::<String>();

                                // Update the variable in the environment
                                // We need to get the variable name from place_args[0]
                                if let ASTNode::Variable(var_name) = &place_args[0] {
                                    env.insert(var_name.clone(), EvalResult::String(new_string));
                                    last_value = EvalResult::Character(new_char);
                                } else {
                                    return Err("setf aref: string place must be a simple variable".to_string());
                                }
                            }
                            _ => return Err(format!("setf aref: first argument must be an array or string, got {:?}", array_result)),
                        }
                    } else if func_name == "char" && place_args.len() >= 2 {
                        // (setf (char string index) value) - same as aref for strings
                        let string_result = eval_with_env(&place_args[0], env)?;
                        let index = eval_with_env(&place_args[1], env)?;

                        let idx = match index {
                            EvalResult::Fixnum(n) if n >= 0 => n as usize,
                            _ => return Err("char index must be a non-negative integer".to_string()),
                        };

                        match string_result {
                            EvalResult::String(ref s) => {
                                let mut chars: Vec<char> = s.chars().collect();
                                if idx >= chars.len() {
                                    return Err(format!("char index {} out of bounds (string length {})", idx, chars.len()));
                                }

                                // Get the character to set
                                let new_char = match value {
                                    EvalResult::Character(c) => c,
                                    EvalResult::String(ref s) if s.len() == 1 => s.chars().next().unwrap(),
                                    _ => return Err("setf char requires a character value".to_string()),
                                };

                                chars[idx] = new_char;
                                let new_string = chars.into_iter().collect::<String>();

                                // Update the variable in the environment
                                if let ASTNode::Variable(var_name) = &place_args[0] {
                                    env.insert(var_name.clone(), EvalResult::String(new_string));
                                    last_value = EvalResult::Character(new_char);
                                } else {
                                    return Err("setf char: string place must be a simple variable".to_string());
                                }
                            }
                            _ => return Err("setf char: first argument must be a string".to_string()),
                        }
                    } else if base_name.eq_ignore_ascii_case("slot-value") && place_args.len() >= 2 {
                        let object = eval_with_env(&place_args[0], env)?;
                        let slot_name = eval_with_env(&place_args[1], env)?;
                        let clos_args = vec![object, slot_name, value.clone()];
                        last_value = super::eval_clos::call_clos_builtin("set-slot-value", &clos_args, env)?;
                    } else if super::eval_list::is_car_cdr_accessor_name(base_name) && place_args.len() >= 1 {
                        // (setf (car list) value) or (setf (cadr list) value), etc.
                        // Evaluate the list expression
                        let list_result = eval_with_env(&place_args[0], env)?;
                        let canonical_accessor = match base_name.to_ascii_lowercase().as_str() {
                            "first" => "car".to_string(),
                            "second" => "cadr".to_string(),
                            "third" => "caddr".to_string(),
                            "fourth" => "cadddr".to_string(),
                            "fifth" => "caddddr".to_string(),
                            "sixth" => "cadddddr".to_string(),
                            "seventh" => "caddddddr".to_string(),
                            "eighth" => "cadddddddr".to_string(),
                            "ninth" => "caddddddddr".to_string(),
                            "tenth" => "cadddddddddr".to_string(),
                            _ => base_name.to_ascii_lowercase(),
                        };

                        // Navigate to the correct cons cell based on the accessor
                        fn navigate_and_set(accessor: &str, cons: EvalResult, value: EvalResult) -> Result<EvalResult, String> {
                            use std::rc::Rc;
                            use std::cell::RefCell;

                            if accessor.is_empty() {
                                return Err("Invalid accessor".to_string());
                            }

                            // Parse accessor: "cadr" means (car (cdr x))
                            // Extract 'a' and 'd' characters between 'c' and 'r'
                            let ops: Vec<char> = accessor.chars().skip(1).take(accessor.len() - 2).collect();

                            if ops.is_empty() {
                                return Err("Invalid accessor - no operations".to_string());
                            }

                            // Navigate to the target cons cell
                            // For "cadr": ops = ['a', 'd'], we first navigate through all but the first op
                            // i.e., we navigate through ['d'] to get to the cell, then set 'a' of that cell
                            let mut current = cons;

                            // Navigate through all ops except the first (skip the first which is what we set)
                            // For "cadr": navigate through 'd' (cdr)
                            for &op in ops.iter().skip(1) {
                                current = match current {
                                    EvalResult::Cons(car, cdr) => {
                                        if op == 'a' {
                                            car.borrow().clone()
                                        } else {
                                            cdr.borrow().clone()
                                        }
                                    }
                                    _ => return Err(format!("Not a cons cell while navigating {}", accessor)),
                                };
                            }

                            // Now set based on the first op (leftmost, i.e., outermost operation)
                            // For "cadr": set the 'a' (car) of the cell
                            match current {
                                EvalResult::Cons(car, cdr) => {
                                    if ops[0] == 'a' {
                                        *car.borrow_mut() = value.clone();
                                    } else {
                                        *cdr.borrow_mut() = value.clone();
                                    }
                                    Ok(value)
                                }
                                _ => {
                                    #[cfg(debug_assertions)]
                                    eprintln!("DEBUG setf: non-cons for final {} operation", accessor);
                                    Err(format!("Not a cons cell for final {} operation", accessor))
                                },
                            }
                        }

                        last_value = navigate_and_set(&canonical_accessor, list_result, value.clone())?;
                    } else if let Some(expander) = get_setf_expander(func_name) {
                        // User-defined setf expander from defsetf
                        match expander {
                            SetfExpander::Simple(updater) => {
                                // (defsetf accessor updater) -> (updater args... new-value)
                                let mut call_args = place_args.clone();
                                call_args.push(super::eval_system::result_to_ast_quoted(&value)?);
                                last_value = eval_with_env(&ASTNode::Call {
                                    function: Box::new(ASTNode::Variable(updater)),
                                    args: call_args,
                                }, env)?;
                            }
                            SetfExpander::Complex { lambda_list, store_vars, body } => {
                                // Complex form - bind lambda-list params to place args, store-vars to value
                                let mut expansion_env = env.clone();

                                // Bind lambda-list params to evaluated place args
                                for (param, arg) in lambda_list.iter().zip(place_args.iter()) {
                                    let arg_val = eval_with_env(arg, env)?;
                                    expansion_env.insert(param.clone(), arg_val);
                                }

                                // Bind store vars to the new value
                                for store_var in &store_vars {
                                    expansion_env.insert(store_var.clone(), value.clone());
                                }

                                // Evaluate the body to get the expansion form
                                let mut expansion = EvalResult::Nil;
                                for expr in &body {
                                    expansion = eval_with_env(expr, &mut expansion_env)?;
                                }

                                // The expansion should be code to evaluate
                                let expansion_ast = super::eval_system::result_to_ast(&expansion)?;
                                last_value = eval_with_env(&expansion_ast, env)?;
                            }
                        }
                    } else {
                        // Try to find a setf function defined via (defun (setf name) ...)
                        // These are stored as %FN%(setf name) in the environment
                        let setf_fn_name = format!("{}(setf {})", super::eval_core::FUNCTION_NS_PREFIX, func_name);
                        if let Some(func_val) = env.get(&setf_fn_name).cloned() {
                            match func_val {
                                EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: closure_env, dynamic_env } => {
                                    // Call the setf function with (new-value ...other-args)
                                    // First arg is the new value, rest are the place args
                                    let mut all_args: Vec<ASTNode> = Vec::new();
                                    all_args.push(super::eval_system::result_to_ast_quoted(&value)?);
                                    all_args.extend(place_args.iter().cloned());
                                    last_value = super::eval_core::eval_lambda_call(
                                        params, defaults, supplied_p_vars, key_params, body, dynamic_env, closure_env, &all_args, env
                                    )?;
                                }
                                _ => {
                                    // Unknown accessor - just return the value without erroring
                                    last_value = value.clone();
                                }
                            }
                        } else {
                            // Unknown accessor - just return the value without erroring
                            // This allows files to parse even if we don't support the accessor
                            last_value = value.clone();
                        }
                    }
                } else {
                    // Complex place forms not yet supported - return value without erroring
                    last_value = value.clone();
                }
            }
            _ => {
                // Unsupported place form - return value without erroring
                last_value = value.clone();
            }
        }
    }

    Ok(last_value)
}

pub(super) fn eval_multiple_value_bind(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (multiple-value-bind (var1 var2 ...) values-form body-forms...)
    if args.len() < 2 {
        return Err("multiple-value-bind requires at least 2 arguments".to_string());
    }

    fn collect_var_names(node: &ASTNode, out: &mut Vec<String>) -> Result<(), String> {
        match node {
            ASTNode::Constant(crate::ir::ConstantValue::Nil) => Ok(()),
            ASTNode::Variable(name) => {
                out.push(name.clone());
                Ok(())
            }
            ASTNode::Call { function, args } => {
                collect_var_names(function, out)?;
                for arg in args {
                    collect_var_names(arg, out)?;
                }
                Ok(())
            }
            _ => Err("multiple-value-bind: invalid variable list".to_string()),
        }
    }

    // Parse variable list.
    let var_list = &args[0];
    let mut var_names = Vec::new();
    collect_var_names(var_list, &mut var_names)?;

    // Evaluate the values form
    let values_form = &args[1];
    let result = eval_with_env(values_form, env)?;

    // Extract multiple values
    let values = match result {
        EvalResult::MultipleValues(vals) => vals,
        other => vec![other],  // Single value treated as (values single-val)
    };

    if std::env::var("RLASP_DEBUG_MVB").is_ok() {
        eprintln!("[mv-bind] vars={:?} values={:?} form={:?}", var_names, values, values_form);
    }

    // Save old variable values
    let old_values: Vec<Option<EvalResult>> = var_names.iter()
        .map(|name| env.get(name).cloned())
        .collect();

    // Bind variables to values (or NIL if not enough values)
    for (i, var_name) in var_names.iter().enumerate() {
        let val = values.get(i).cloned().unwrap_or(EvalResult::Nil);
        env.insert(var_name.clone(), val);
    }

    // Execute body forms
    let mut body_result = EvalResult::Nil;
    for form in &args[2..] {
        body_result = eval_with_env(form, env)?;
    }

    // Restore old variable values
    for (var_name, old_val) in var_names.iter().zip(old_values.iter()) {
        match old_val {
            Some(val) => env.insert(var_name.clone(), val.clone()),
            None => env.remove(var_name),
        };
    }

    Ok(body_result)
}

pub(super) fn eval_destructuring_bind(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (destructuring-bind lambda-list expression body-forms...)
    // Binds variables in lambda-list to parts of the evaluated expression
    if args.len() < 2 {
        return Err("destructuring-bind requires at least 2 arguments".to_string());
    }

    let lambda_list = &args[0];
    let expression = &args[1];
    let body = &args[2..];

    // Evaluate the expression to get the data to destructure
    let data = eval_with_env(expression, env)?;

    // Convert data to a list for easier processing
    let data_list = result_to_list(&data);

    // Parse lambda-list and bind variables
    let old_env = env.clone();
    destructure_bind(lambda_list, &data_list, env)?;

    // Execute body forms
    let mut result = EvalResult::Nil;
    for form in body {
        result = eval_with_env(form, env)?;
    }

    // Restore environment
    *env = old_env;

    Ok(result)
}

fn result_to_list(result: &EvalResult) -> Vec<EvalResult> {
    let mut list = Vec::new();
    let mut current = result.clone();
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                list.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            other => {
                // Non-list - treat as single element
                list.push(other);
                break;
            }
        }
    }
    list
}

fn destructure_bind(pattern: &ASTNode, data: &[EvalResult], env: &mut HashMap<String, EvalResult>) -> Result<(), String> {
    match pattern {
        ASTNode::Variable(name) => {
            // Single variable - bind to entire data as list
            if data.is_empty() {
                env.insert(name.clone(), EvalResult::Nil);
            } else if data.len() == 1 {
                env.insert(name.clone(), data[0].clone());
            } else {
                // Convert back to cons list
                let list = vec_to_cons(data);
                env.insert(name.clone(), list);
            }
            Ok(())
        }
        ASTNode::Constant(crate::ir::ConstantValue::Nil) => {
            // Empty pattern - nothing to bind
            Ok(())
        }
        ASTNode::Call { function, args: pattern_args } => {
            // Pattern is a list like (var1 var2 &optional var3 ...)
            let mut data_idx = 0;
            let mut pattern_idx = 0;
            let mut mode = "required";

            // First element of Call is the function (first pattern element)
            let mut all_patterns = Vec::new();
            all_patterns.push(function.as_ref().clone());
            all_patterns.extend(pattern_args.iter().cloned());

            while pattern_idx < all_patterns.len() {
                let pat = &all_patterns[pattern_idx];

                match pat {
                    ASTNode::Variable(name) if name == "&optional" => {
                        mode = "optional";
                        pattern_idx += 1;
                        continue;
                    }
                    ASTNode::Variable(name) if name == "&rest" || name == "&body" => {
                        // Bind rest parameter to remaining data
                        pattern_idx += 1;
                        if pattern_idx < all_patterns.len() {
                            if let ASTNode::Variable(rest_name) = &all_patterns[pattern_idx] {
                                let rest_data = if data_idx < data.len() {
                                    vec_to_cons(&data[data_idx..])
                                } else {
                                    EvalResult::Nil
                                };
                                env.insert(rest_name.clone(), rest_data);
                            }
                        }
                        return Ok(());
                    }
                    ASTNode::Variable(name) if name == "&key" || name == "&allow-other-keys" || name == "&aux" => {
                        // Skip these for now - simplified implementation
                        pattern_idx += 1;
                        continue;
                    }
                    ASTNode::Variable(name) if name.starts_with('&') => {
                        // Other lambda-list keyword - skip
                        pattern_idx += 1;
                        continue;
                    }
                    ASTNode::Variable(name) => {
                        // Simple variable
                        if data_idx < data.len() {
                            env.insert(name.clone(), data[data_idx].clone());
                            data_idx += 1;
                        } else if mode == "optional" {
                            env.insert(name.clone(), EvalResult::Nil);
                        } else {
                            return Err(format!("destructuring-bind: not enough values for {}", name));
                        }
                        pattern_idx += 1;
                    }
                    ASTNode::Call { function: inner_fn, args: inner_args } => {
                        // Could be (var default) for &optional, or nested destructuring
                        if mode == "optional" {
                            // (var default-value) form
                            if let ASTNode::Variable(var_name) = inner_fn.as_ref() {
                                if data_idx < data.len() {
                                    env.insert(var_name.clone(), data[data_idx].clone());
                                    data_idx += 1;
                                } else if !inner_args.is_empty() {
                                    // Use default value
                                    let default = eval_with_env(&inner_args[0], env)?;
                                    env.insert(var_name.clone(), default);
                                } else {
                                    env.insert(var_name.clone(), EvalResult::Nil);
                                }
                            }
                        } else {
                            // Nested destructuring
                            if data_idx < data.len() {
                                let nested_data = result_to_list(&data[data_idx]);
                                destructure_bind(pat, &nested_data, env)?;
                                data_idx += 1;
                            }
                        }
                        pattern_idx += 1;
                    }
                    _ => {
                        pattern_idx += 1;
                    }
                }
            }
            Ok(())
        }
        _ => Ok(()),
    }
}

fn vec_to_cons(items: &[EvalResult]) -> EvalResult {
    use std::rc::Rc;
    use std::cell::RefCell;

    let mut result = EvalResult::Nil;
    for item in items.iter().rev() {
        result = EvalResult::Cons(
            Rc::new(RefCell::new(item.clone())),
            Rc::new(RefCell::new(result))
        );
    }
    result
}

pub(super) fn eval_handler_case(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (handler-case protected-form (condition-type (var) handler-body)...)
    if args.is_empty() {
        return Err("handler-case requires at least 1 argument".to_string());
    }

    let protected_form = &args[0];
    let handlers = &args[1..];

    // Try to evaluate the protected form
    match eval_with_env(protected_form, env) {
        Ok(result) => Ok(result),
        Err(error_msg) => {
            let mut pending_condition = if error_msg == "__SIGNAL_CONDITION__" {
                super::eval_conditions::take_pending_signaled_condition()
            } else {
                None
            };
            // Try each handler
            for handler in handlers {
                if let ASTNode::Call { function: _condition_type, args: handler_args } = handler {
                    // For now, catch all errors (ignore condition type matching)
                    // Handler format: (condition-type (var) body...)
                    // handler_args[0] is (var) - the variable binding list
                    // handler_args[1..] is the body

                    let mut handler_env = env.clone();

                    // Extract variable from (var) list and bind error message
                    if let Some(var_list) = handler_args.get(0) {
                        match var_list {
                            // (var) form where var is called as function
                            ASTNode::Call { function, args: _ } => {
                                if let ASTNode::Variable(var_name) = &**function {
                                    if let Some(cond) = &pending_condition {
                                        handler_env.insert(var_name.clone(), cond.clone());
                                    } else {
                                        handler_env.insert(var_name.clone(), EvalResult::String(error_msg.clone()));
                                    }
                                }
                            }
                            // Single variable (no parens, rare)
                            ASTNode::Variable(var_name) => {
                                if let Some(cond) = &pending_condition {
                                    handler_env.insert(var_name.clone(), cond.clone());
                                } else {
                                    handler_env.insert(var_name.clone(), EvalResult::String(error_msg.clone()));
                                }
                            }
                            // nil or empty list means no binding
                            ASTNode::Constant(ConstantValue::Nil) => {}
                            _ => {}
                        }
                    }

                    // Execute handler body (all args after the variable list)
                    let mut handler_result = EvalResult::Nil;
                    for form in handler_args.iter().skip(1) {
                        handler_result = eval_with_env(form, &mut handler_env)?;
                    }
                    return Ok(handler_result);
                }
            }
            // No handler matched, re-raise the error
            if error_msg == "__SIGNAL_CONDITION__" {
                if let Some(cond) = pending_condition.take() {
                    super::eval_conditions::set_pending_signaled_condition(cond);
                }
            }
            Err(error_msg)
        }
    }
}

pub(super) fn eval_tagbody(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (tagbody tag1 form1 form2 tag2 form3 ...)
    // Tags are symbols or integers, forms are expressions to evaluate
    // Returns Nil

    // First pass: identify tags and their positions
    let mut tags: HashMap<String, usize> = HashMap::new();
    for (i, arg) in args.iter().enumerate() {
        match arg {
            ASTNode::Variable(name) => {
                tags.insert(name.clone(), i);
            }
            ASTNode::Constant(ConstantValue::Fixnum(n)) => {
                tags.insert(n.to_string(), i);
            }
            _ => {} // Forms, not tags
        }
    }

    let mut pc = 0; // Program counter
    while pc < args.len() {
        let arg = &args[pc];

        // Skip tags, execute forms
        let is_tag = match arg {
            ASTNode::Variable(name) => tags.contains_key(name),
            ASTNode::Constant(ConstantValue::Fixnum(n)) => tags.contains_key(&n.to_string()),
            _ => false,
        };

        if !is_tag {
            // Execute the form
            match eval_with_env(arg, env) {
                Ok(_) => {} // Continue
                Err(e) if e.starts_with("GO:") => {
                    // Extract tag name
                    let tag_name = &e[3..];
                    if let Some(&pos) = tags.get(tag_name) {
                        pc = pos;
                        continue;
                    } else {
                        return Err(format!("Unknown tag: {}", tag_name));
                    }
                }
                Err(e) => return Err(e), // Other errors propagate
            }
        }

        pc += 1;
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_go(args: &[ASTNode], _env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (go tag)
    if args.len() != 1 {
        return Err("go requires exactly 1 argument".to_string());
    }

    let tag_name = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Fixnum(n)) => n.to_string(),
        _ => return Err("go tag must be a symbol or integer".to_string()),
    };

    // Signal a GO via error
    Err(format!("GO:{}", tag_name))
}
