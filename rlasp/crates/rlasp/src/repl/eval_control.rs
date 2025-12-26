/// Control flow operations: do, dolist, dotimes, return

use super::eval_types::{EvalResult, RETURN_VALUE};
use super::eval_core::eval_with_env;
use crate::ir::{ASTNode, ConstantValue};
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

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
    // return exits from the nearest enclosing NIL block (implicitly created by do)
    // For now, we signal this using a special error with JSON encoding
    let return_val = if args.is_empty() {
        EvalResult::Nil
    } else {
        eval_with_env(&args[0], env)?
    };

    // Encode the return value in a way we can decode
    // For complex types, we use serde_json
    let encoded = match &return_val {
        EvalResult::Fixnum(n) => format!("RETURN:FIXNUM:{}", n),
        EvalResult::Float(f) => format!("RETURN:FLOAT:{}", f),
        EvalResult::Bool(b) => format!("RETURN:BOOL:{}", b),
        EvalResult::Nil => "RETURN:NIL".to_string(),
        EvalResult::String(s) => format!("RETURN:STRING:{}", s),
        EvalResult::Symbol(s) => format!("RETURN:SYMBOL:{}", s),
        EvalResult::Cons(_, _) => {
            // For cons, store in a global and return a marker
            // This is a workaround - ideally we'd use a proper exception mechanism
            RETURN_VALUE.with(|rv| *rv.borrow_mut() = Some(return_val.clone()));
            "RETURN:CONS".to_string()
        }
        EvalResult::Lambda { .. } => {
            RETURN_VALUE.with(|rv| *rv.borrow_mut() = Some(return_val.clone()));
            "RETURN:LAMBDA".to_string()
        }
        _ => {
            RETURN_VALUE.with(|rv| *rv.borrow_mut() = Some(return_val.clone()));
            "RETURN:COMPLEX".to_string()
        }
    };

    Err(encoded)
}

pub(super) fn eval_block(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (block name body-forms...)
    if args.is_empty() {
        return Err("block requires at least a name argument".to_string());
    }

    let block_name = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Nil) => "nil".to_string(),
        _ => return Err("block name must be a symbol".to_string()),
    };

    let body_forms = &args[1..];

    // Execute body forms
    let mut result = EvalResult::Nil;
    for form in body_forms {
        match eval_with_env(form, env) {
            Ok(val) => result = val,
            Err(e) if e.starts_with(&format!("RETURN-FROM:{}:", block_name)) => {
                // Return from this block
                let value_part = &e[format!("RETURN-FROM:{}:", block_name).len()..];
                return decode_return_value(value_part.to_string());
            }
            Err(e) => return Err(e),
        }
    }

    Ok(result)
}

pub(super) fn eval_return_from(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (return-from name [value])
    if args.is_empty() {
        return Err("return-from requires at least a name argument".to_string());
    }

    let block_name = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Nil) => "nil".to_string(),
        _ => return Err("return-from name must be a symbol".to_string()),
    };

    let return_val = if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Nil
    };

    // Encode the return value
    let encoded = encode_return_value(&return_val);
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

fn decode_return_value(encoded: String) -> Result<EvalResult, String> {
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
    } else if encoded == "COMPLEX" {
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
        if !matches!(test_result, EvalResult::Nil | EvalResult::Bool(false)) {
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
                Err(e) if e.starts_with("RETURN:") => {
                    // Restore old value and return
                    if let Some(val) = old_val {
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
                Err(e) if e.starts_with("RETURN:") => {
                    // Restore old value and return
                    if let Some(val) = old_val {
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
        let is_nil = matches!(test_result, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false));
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
    if matches!(test_result, EvalResult::Nil | EvalResult::Bool(false)) {
        return Err(format!("Assertion failed: {:?}", test_form));
    }

    Ok(EvalResult::Nil)
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
        _ => Err(format!("Not a cons cell for final {} operation", accessor)),
    }
}

pub(super) fn eval_incf(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (incf place [delta])
    if args.is_empty() {
        return Err("incf requires at least 1 argument".to_string());
    }

    let delta = if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Fixnum(1)
    };

    let place = &args[0];

    // Check for car/cdr accessors first
    if let ASTNode::Call { function, args: place_args } = place {
        if let ASTNode::Variable(func_name) = &**function {
            if place_args.len() == 1 && is_car_cdr_accessor(func_name) {
                let cons = eval_with_env(&place_args[0], env)?;
                return navigate_and_incf(func_name, cons, delta);
            }
        }
    }

    // Get current value from place
    let current_val = match place {
        ASTNode::Variable(name) => {
            env.get(name).cloned().unwrap_or(EvalResult::Fixnum(0))
        }
        ASTNode::Call { function, args: place_args } => {
            if let ASTNode::Variable(func_name) = &**function {
                match func_name.as_str() {
                    "aref" if place_args.len() >= 2 => {
                        let array = eval_with_env(&place_args[0], env)?;
                        let index = eval_with_env(&place_args[1], env)?;
                        let idx = match index {
                            EvalResult::Fixnum(n) if n >= 0 => n as usize,
                            _ => return Err("aref index must be a non-negative integer".to_string()),
                        };
                        match array {
                            EvalResult::Array(ref arr) => {
                                arr.borrow().get(idx).cloned()
                                    .ok_or_else(|| format!("aref index {} out of bounds", idx))?
                            }
                            _ => return Err("incf aref: not an array".to_string()),
                        }
                    }
                    "gethash" if place_args.len() >= 2 => {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;
                        let key_str = match key {
                            EvalResult::String(s) => s,
                            EvalResult::Symbol(s) => s,
                            EvalResult::Fixnum(n) => n.to_string(),
                            _ => return Err("gethash key must be a string, symbol, or number".to_string()),
                        };
                        match ht {
                            EvalResult::HashTable(ref table) => {
                                table.borrow().get(&key_str).cloned().unwrap_or(EvalResult::Fixnum(0))
                            }
                            _ => return Err("incf gethash: not a hash table".to_string()),
                        }
                    }
                    _ => return Err(format!("incf: unsupported place form: {}", func_name)),
                }
            } else {
                return Err("incf: complex place forms not yet supported".to_string());
            }
        }
        _ => return Err("incf: unsupported place form".to_string()),
    };

    // Add delta to current value
    let new_val = match (current_val, delta) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a + b),
        (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a + b),
        (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 + b),
        (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a + b as f64),
        _ => return Err("incf requires numeric arguments".to_string()),
    };

    // Set new value back to place
    match place {
        ASTNode::Variable(name) => {
            env.insert(name.clone(), new_val.clone());
        }
        ASTNode::Call { function, args: place_args } => {
            if let ASTNode::Variable(func_name) = &**function {
                match func_name.as_str() {
                    "aref" if place_args.len() >= 2 => {
                        let array = eval_with_env(&place_args[0], env)?;
                        let index = eval_with_env(&place_args[1], env)?;
                        let idx = match index {
                            EvalResult::Fixnum(n) if n >= 0 => n as usize,
                            _ => return Err("aref index must be a non-negative integer".to_string()),
                        };
                        match array {
                            EvalResult::Array(ref arr) => {
                                let mut array_mut = arr.borrow_mut();
                                if idx < array_mut.len() {
                                    array_mut[idx] = new_val.clone();
                                } else {
                                    return Err(format!("aref index {} out of bounds", idx));
                                }
                            }
                            _ => return Err("incf aref: not an array".to_string()),
                        }
                    }
                    "gethash" if place_args.len() >= 2 => {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;
                        let key_str = match key {
                            EvalResult::String(s) => s,
                            EvalResult::Symbol(s) => s,
                            EvalResult::Fixnum(n) => n.to_string(),
                            _ => return Err("gethash key must be a string, symbol, or number".to_string()),
                        };
                        match ht {
                            EvalResult::HashTable(ref table) => {
                                table.borrow_mut().insert(key_str, new_val.clone());
                            }
                            _ => return Err("incf gethash: not a hash table".to_string()),
                        }
                    }
                    _ => return Err(format!("incf: unsupported place form: {}", func_name)),
                }
            }
        }
        _ => {}
    }

    Ok(new_val)
}

pub(super) fn eval_decf(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (decf place [delta])
    if args.is_empty() {
        return Err("decf requires at least 1 argument".to_string());
    }

    let place = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("decf place must be a variable".to_string()),
    };

    let delta = if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Fixnum(1)
    };

    let current_val = env.get(&place).cloned().unwrap_or(EvalResult::Fixnum(0));

    let new_val = match (current_val, delta) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a - b),
        (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a - b),
        (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 - b),
        (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a - b as f64),
        _ => return Err("decf requires numeric arguments".to_string()),
    };

    env.insert(place, new_val.clone());
    Ok(new_val)
}

pub(super) fn eval_eval_when(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (eval-when (situation*) form*)
    // For now, we just execute all forms since we're interpreting
    // In a full compiler, we'd check for :compile-toplevel, :load-toplevel, :execute
    if args.is_empty() {
        return Err("eval-when requires at least 1 argument".to_string());
    }

    // Skip the situations list and execute all forms
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
                env.insert(var_name.clone(), value.clone());
                last_value = value.clone();
            }
            // (gethash key ht) or (aref array index)
            ASTNode::Call { function, args: place_args } => {
                if let ASTNode::Variable(func_name) = &**function {
                    if func_name == "gethash" && place_args.len() >= 2 {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;

                        let key_str = match key {
                            EvalResult::String(s) => s,
                            EvalResult::Symbol(s) => s,
                            EvalResult::Fixnum(n) => n.to_string(),
                            _ => return Err("gethash key must be a string, symbol, or number".to_string()),
                        };

                        match ht {
                            EvalResult::HashTable(ref table) => {
                                table.borrow_mut().insert(key_str, value.clone());
                                last_value = value.clone();
                            }
                            _ => return Err("setf gethash: second argument must be a hash table".to_string()),
                        }
                    } else if func_name == "aref" && place_args.len() >= 2 {
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
                    } else if (func_name == "car" || func_name == "cdr" ||
                               func_name == "caar" || func_name == "cadr" ||
                               func_name == "cdar" || func_name == "cddr" ||
                               func_name == "caaar" || func_name == "caadr" ||
                               func_name == "cadar" || func_name == "caddr" ||
                               func_name == "cdaar" || func_name == "cdadr" ||
                               func_name == "cddar" || func_name == "cdddr") &&
                              place_args.len() >= 1 {
                        // (setf (car list) value) or (setf (cadr list) value), etc.
                        // Evaluate the list expression
                        let list_result = eval_with_env(&place_args[0], env)?;

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
                                _ => Err(format!("Not a cons cell for final {} operation", accessor)),
                            }
                        }

                        last_value = navigate_and_set(func_name, list_result, value.clone())?;
                    } else {
                        // Unknown accessor - just return the value without erroring
                        // This allows files to parse even if we don't support the accessor
                        last_value = value.clone();
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

    // Parse variable list
    let var_list = &args[0];
    let mut var_names = Vec::new();

    match var_list {
        ASTNode::Constant(crate::ir::ConstantValue::Nil) => {
            // No variables to bind
        }
        ASTNode::Call { function, args: var_args } => {
            // Extract variable names from the list
            if let ASTNode::Variable(first_var) = &**function {
                var_names.push(first_var.clone());
            }
            for var_node in var_args {
                if let ASTNode::Variable(var_name) = var_node {
                    var_names.push(var_name.clone());
                }
            }
        }
        ASTNode::Variable(name) => {
            var_names.push(name.clone());
        }
        _ => return Err("multiple-value-bind: invalid variable list".to_string()),
    }

    // Evaluate the values form
    let values_form = &args[1];
    let result = eval_with_env(values_form, env)?;

    // Extract multiple values
    let values = match result {
        EvalResult::MultipleValues(vals) => vals,
        other => vec![other],  // Single value treated as (values single-val)
    };

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
            // Try each handler
            for handler in handlers {
                if let ASTNode::Call { function: _condition_type, args: handler_args } = handler {
                    // For now, catch all errors (ignore condition type matching)
                    // Execute handler body
                    let mut handler_result = EvalResult::Nil;
                    for form in handler_args {
                        handler_result = eval_with_env(form, env)?;
                    }
                    return Ok(handler_result);
                }
            }
            // No handler matched, re-raise the error
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
