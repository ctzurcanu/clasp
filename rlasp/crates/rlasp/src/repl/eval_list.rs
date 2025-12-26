/// List operations and predicates

use super::eval_types::EvalResult;
use super::eval_core::eval_with_env;
use super::eval_system::result_to_ast;
use crate::ir::ASTNode;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

pub(super) fn eval_cons(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("cons requires 2 arguments".to_string());
    }
    let car = eval_with_env(&args[0], env)?;
    let cdr = eval_with_env(&args[1], env)?;
    Ok(EvalResult::Cons(Rc::new(RefCell::new(car)), Rc::new(RefCell::new(cdr))))
}

pub(super) fn eval_car(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("car requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(car, _) => Ok(car.borrow().clone()),
        _ => Err("car requires a cons cell".to_string()),
    }
}

pub(super) fn eval_cdr(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("cdr requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(_, cdr) => Ok(cdr.borrow().clone()),
        EvalResult::Nil => Ok(EvalResult::Nil),
        _ => Err("cdr requires a list".to_string()),
    }
}

pub(super) fn eval_caar(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("caar requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::Cons(car, _) => {
            let car_val = car.borrow();
            match &*car_val {
                EvalResult::Cons(car2, _) => Ok(car2.borrow().clone()),
                _ => Err("caar: car is not a cons".to_string()),
            }
        },
        _ => Err("caar requires a list".to_string()),
    }
}

pub(super) fn eval_cdar(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("cdar requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::Cons(car, _) => {
            let car_val = car.borrow();
            match &*car_val {
                EvalResult::Cons(_, cdr2) => Ok(cdr2.borrow().clone()),
                _ => Err("cdar: car is not a cons".to_string()),
            }
        },
        _ => Err("cdar requires a list".to_string()),
    }
}

pub(super) fn eval_cadr(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("cadr requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::Cons(_, cdr) => {
            let cdr_val = cdr.borrow();
            match &*cdr_val {
                EvalResult::Cons(car2, _) => Ok(car2.borrow().clone()),
                _ => Err("cadr: not enough elements".to_string()),
            }
        },
        _ => Err("cadr requires a list".to_string()),
    }
}

pub(super) fn eval_cddr(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("cddr requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::Cons(_, cdr) => {
            let cdr_val = cdr.borrow();
            match &*cdr_val {
                EvalResult::Cons(_, cdr2) => Ok(cdr2.borrow().clone()),
                _ => Err("cddr: not enough elements".to_string()),
            }
        },
        _ => Err("cddr requires a list".to_string()),
    }
}

pub(super) fn eval_caddr(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("caddr requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::Cons(_, cdr) => {
            let cdr_val = cdr.borrow();
            match &*cdr_val {
                EvalResult::Cons(_, cdr2) => {
                    let cdr2_val = cdr2.borrow();
                    match &*cdr2_val {
                        EvalResult::Cons(car3, _) => Ok(car3.borrow().clone()),
                        _ => Err("caddr: not enough elements".to_string()),
                    }
                }
                _ => Err("caddr: not enough elements".to_string()),
            }
        },
        _ => Err("caddr requires a list".to_string()),
    }
}

pub(super) fn eval_cadddr(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (cadddr x) = (car (cdr (cdr (cdr x)))) = fourth element
    if args.len() != 1 {
        return Err("cadddr requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::Cons(_, cdr) => {
            let cdr_val = cdr.borrow();
            match &*cdr_val {
                EvalResult::Cons(_, cdr2) => {
                    let cdr2_val = cdr2.borrow();
                    match &*cdr2_val {
                        EvalResult::Cons(_, cdr3) => {
                            let cdr3_val = cdr3.borrow();
                            match &*cdr3_val {
                                EvalResult::Cons(car4, _) => Ok(car4.borrow().clone()),
                                _ => Err("cadddr: not enough elements".to_string()),
                            }
                        }
                        _ => Err("cadddr: not enough elements".to_string()),
                    }
                }
                _ => Err("cadddr: not enough elements".to_string()),
            }
        },
        _ => Err("cadddr requires a list".to_string()),
    }
}

pub(super) fn eval_cdddr(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("cdddr requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::Cons(_, cdr) => {
            let cdr_val = cdr.borrow();
            match &*cdr_val {
                EvalResult::Cons(_, cdr2) => {
                    let cdr2_val = cdr2.borrow();
                    match &*cdr2_val {
                        EvalResult::Cons(_, cdr3) => Ok(cdr3.borrow().clone()),
                        _ => Err("cdddr: not enough elements".to_string()),
                    }
                }
                _ => Err("cdddr: not enough elements".to_string()),
            }
        },
        _ => Err("cdddr requires a list".to_string()),
    }
}

pub(super) fn eval_rplacd(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("rplacd requires 2 arguments".to_string());
    }
    let cons_cell = eval_with_env(&args[0], env)?;
    let new_cdr = eval_with_env(&args[1], env)?;
    match &cons_cell {
        EvalResult::Cons(_, cdr) => {
            *cdr.borrow_mut() = new_cdr;
            Ok(cons_cell)
        }
        _ => Err("rplacd: first argument must be a cons cell".to_string()),
    }
}

pub(super) fn eval_rplaca(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("rplaca requires 2 arguments".to_string());
    }
    let cons_cell = eval_with_env(&args[0], env)?;
    let new_car = eval_with_env(&args[1], env)?;
    match &cons_cell {
        EvalResult::Cons(car, _) => {
            *car.borrow_mut() = new_car;
            Ok(cons_cell)
        }
        _ => Err("rplaca: first argument must be a cons cell".to_string()),
    }
}

pub(super) fn eval_last(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("last requires 1 argument".to_string());
    }
    let list = eval_with_env(&args[0], env)?;

    // Handle empty list case
    match &list {
        EvalResult::Nil => return Ok(EvalResult::Nil),
        EvalResult::Cons(_, _) => {},
        _ => return Err("last requires a list".to_string()),
    }

    let mut current = list.clone();
    loop {
        match &current {
            EvalResult::Cons(_, cdr) => {
                let next = cdr.borrow().clone();
                match next {
                    EvalResult::Nil => {
                        // Current is the last cons cell - return it as-is
                        return Ok(current);
                    }
                    _ => {
                        current = next;
                    }
                }
            }
            _ => return Err("last requires a proper list".to_string()),
        }
    }
}

pub(super) fn eval_list(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    let mut result = EvalResult::Nil;
    for arg in args.iter().rev() {
        let val = eval_with_env(arg, env)?;
        result = EvalResult::Cons(Rc::new(RefCell::new(val)), Rc::new(RefCell::new(result)));
    }
    Ok(result)
}

pub(super) fn eval_length(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("length requires 1 argument".to_string());
    }
    let list = eval_with_env(&args[0], env)?;
    let mut count = 0;
    let mut current = list;

    loop {
        match current {
            EvalResult::Nil => return Ok(EvalResult::Fixnum(count)),
            EvalResult::Cons(_, cdr) => {
                count += 1;
                let next = cdr.borrow().clone();
                current = next;
            }
            _ => return Err("length requires a list".to_string()),
        }
    }
}

pub(super) fn eval_nth(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("nth requires 2 arguments (index list)".to_string());
    }
    let n = match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) if n >= 0 => n as usize,
        EvalResult::Fixnum(n) => return Err(format!("nth: index must be non-negative, got {}", n)),
        _ => return Err("nth: index must be a fixnum".to_string()),
    };

    let list = eval_with_env(&args[1], env)?;
    let mut current = list;
    let mut index = 0;

    loop {
        match current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                if index == n {
                    return Ok(car.borrow().clone());
                }
                index += 1;
                let next = cdr.borrow().clone();
                current = next;
            }
            _ => return Err("nth: second argument must be a list".to_string()),
        }
    }
}

pub(super) fn eval_append(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Ok(EvalResult::Nil);
    }

    // If only one argument, return it as-is (not copied)
    if args.len() == 1 {
        return eval_with_env(&args[0], env);
    }

    // The last argument becomes the tail of the result (can be any object)
    let mut result = eval_with_env(&args[args.len() - 1], env)?;

    // Process all arguments except the last in reverse order
    for arg in args[..args.len() - 1].iter().rev() {
        let list = eval_with_env(arg, env)?;
        let mut elements = Vec::new();
        let mut current = list;

        // Collect all elements from this list
        loop {
            match current {
                EvalResult::Nil => break,
                EvalResult::Cons(car, cdr) => {
                    elements.push(car.borrow().clone());
                    let next = cdr.borrow().clone();
                    current = next;
                }
                _ => return Err("append: all arguments except the last must be lists".to_string()),
            }
        }

        // Build result by prepending elements in reverse order
        for elem in elements.into_iter().rev() {
            result = EvalResult::Cons(Rc::new(RefCell::new(elem)), Rc::new(RefCell::new(result)));
        }
    }

    Ok(result)
}

pub(super) fn eval_reverse(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("reverse requires 1 argument".to_string());
    }
    let list = eval_with_env(&args[0], env)?;
    let mut result = EvalResult::Nil;
    let mut current = list;

    loop {
        match current {
            EvalResult::Nil => return Ok(result),
            EvalResult::Cons(car, cdr) => {
                result = EvalResult::Cons(Rc::new(RefCell::new(car.borrow().clone())), Rc::new(RefCell::new(result)));
                let next = cdr.borrow().clone();
                current = next;
            }
            _ => return Err("reverse requires a list".to_string()),
        }
    }
}

pub(super) fn eval_nreverse(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("nreverse requires 1 argument".to_string());
    }
    let list = eval_with_env(&args[0], env)?;
    let mut result = EvalResult::Nil;
    let mut current = list;

    loop {
        match current {
            EvalResult::Nil => return Ok(result),
            EvalResult::Cons(car, cdr) => {
                let next = cdr.borrow().clone();
                // Destructively modify the cdr to point to result
                *cdr.borrow_mut() = result;
                result = EvalResult::Cons(car.clone(), cdr.clone());
                current = next;
            }
            _ => return Err("nreverse requires a list".to_string()),
        }
    }
}

pub(super) fn eval_nreconc(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("nreconc requires 2 arguments".to_string());
    }
    let list1 = eval_with_env(&args[0], env)?;
    let list2 = eval_with_env(&args[1], env)?;

    // nreconc is (nconc (nreverse list1) list2)
    let mut result = list2;
    let mut current = list1;

    loop {
        match current {
            EvalResult::Nil => return Ok(result),
            EvalResult::Cons(car, cdr) => {
                let next = cdr.borrow().clone();
                // Destructively modify the cdr to point to result
                *cdr.borrow_mut() = result;
                result = EvalResult::Cons(car.clone(), cdr.clone());
                current = next;
            }
            _ => return Err("nreconc requires a list as first argument".to_string()),
        }
    }
}

pub(super) fn eval_mapcar(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("mapcar requires at least 2 arguments".to_string());
    }

    let func = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    let mut results = Vec::new();
    let mut current = list.clone();

    loop {
        let next = match &current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                // Call function with car
                let result = apply_function(&func, &[car.borrow().clone()], env)?;
                results.push(result);
                cdr.borrow().clone()
            }
            _ => return Err("mapcar: not a proper list".to_string()),
        };
        current = next;
    }

    // Build result list
    let mut result = EvalResult::Nil;
    for item in results.iter().rev() {
        result = EvalResult::Cons(Rc::new(RefCell::new(item.clone())), Rc::new(RefCell::new(result)));
    }

    Ok(result)
}

fn apply_function(
    func: &EvalResult,
    args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    match func {
        EvalResult::Lambda { params, defaults, supplied_p_vars: _, body, env: closure_env } => {
            if params.len() != args.len() {
                return Err(format!("Expected {} arguments, got {}", params.len(), args.len()));
            }

            let mut lambda_env = closure_env.borrow().clone();

            // Merge calling environment for recursive functions
            for (key, value) in env.iter() {
                if !lambda_env.contains_key(key) {
                    lambda_env.insert(key.clone(), value.clone());
                }
            }

            // Bind parameters
            for (param, arg) in params.iter().zip(args.iter()) {
                lambda_env.insert(param.clone(), arg.clone());
            }

            // Evaluate body
            let mut result = EvalResult::Nil;
            for expr in body {
                result = eval_with_env(expr, &mut lambda_env)?;
            }
            Ok(result)
        }
        _ => Err("mapcar: first argument must be a function".to_string()),
    }
}

pub(super) fn eval_member(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("member requires at least 2 arguments".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    // Parse keyword arguments
    let mut test_fn: Option<EvalResult> = None;
    let mut key_fn: Option<EvalResult> = None;

    let mut i = 2;
    while i < args.len() {
        if let ASTNode::Variable(kw) = &args[i] {
            if i + 1 >= args.len() {
                return Err(format!("Keyword {} requires a value", kw));
            }
            match kw.as_str() {
                ":test" => {
                    test_fn = Some(eval_with_env(&args[i + 1], env)?);
                    i += 2;
                }
                ":test-not" => {
                    // test-not is complement of test
                    let fn_val = eval_with_env(&args[i + 1], env)?;
                    test_fn = Some(eval_complement_fn(fn_val)?);
                    i += 2;
                }
                ":key" => {
                    key_fn = Some(eval_with_env(&args[i + 1], env)?);
                    i += 2;
                }
                _ => return Err(format!("Unknown keyword argument: {}", kw)),
            }
        } else {
            i += 1;
        }
    }

    let mut current = list.clone();

    loop {
        match &current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                let car_val = car.borrow().clone();
                let cdr_val = cdr.borrow().clone();

                // Apply key function if provided
                let test_item = if let Some(ref key) = key_fn {
                    apply_key_fn(key, &car_val, env)?
                } else {
                    car_val.clone()
                };

                // Compare using test function
                let matches = if let Some(ref test) = test_fn {
                    call_test_fn(test, &item, &test_item, env)?
                } else {
                    values_equal(&item, &test_item)
                };

                if matches {
                    return Ok(current.clone());
                }
                current = cdr_val;
            }
            _ => return Ok(EvalResult::Nil),
        }
    }
}

// member1 - takes positional arguments instead of keywords
// This is an internal helper used by set operations in listlib.lisp
pub(super) fn eval_member1(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // member1 takes: item list test test-not key (all positional)
    if args.len() != 5 {
        return Err(format!("member1 requires exactly 5 arguments, got {}", args.len()));
    }

    let item = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;
    let test_arg = eval_with_env(&args[2], env)?;
    let test_not_arg = eval_with_env(&args[3], env)?;
    let key_arg = eval_with_env(&args[4], env)?;

    // Determine which test function to use
    let test_fn: Option<EvalResult>;
    let negate_result: bool;

    if !matches!(test_not_arg, EvalResult::Nil) {
        // test-not is provided, use it and negate the result
        test_fn = Some(test_not_arg);
        negate_result = true;
    } else if !matches!(test_arg, EvalResult::Nil) {
        // test is provided
        test_fn = Some(test_arg);
        negate_result = false;
    } else {
        // Default to eql
        test_fn = None;
        negate_result = false;
    }

    let key_fn = if !matches!(key_arg, EvalResult::Nil) {
        Some(key_arg)
    } else {
        None
    };

    let mut current = list.clone();

    loop {
        match &current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                let car_val = car.borrow().clone();
                let cdr_val = cdr.borrow().clone();

                // Apply key function if provided
                let test_item = if let Some(ref key) = key_fn {
                    apply_key_fn(key, &car_val, env)?
                } else {
                    car_val.clone()
                };

                // Compare using test function
                let mut matches = if let Some(ref test) = test_fn {
                    call_test_fn(test, &item, &test_item, env)?
                } else {
                    values_equal(&item, &test_item)
                };

                // Negate result if using test-not
                if negate_result {
                    matches = !matches;
                }

                if matches {
                    return Ok(current.clone());
                }
                current = cdr_val;
            }
            _ => return Ok(EvalResult::Nil),
        }
    }
}

// Helper to apply key function
fn apply_key_fn(key_fn: &EvalResult, value: &EvalResult, env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    match key_fn {
        EvalResult::Nil => {
            // If key is nil, return value unchanged
            Ok(value.clone())
        }
        EvalResult::Lambda { params, defaults: _, supplied_p_vars: _, body, env: closure_env } => {
            let mut local_env = closure_env.borrow().clone();
            if params.len() != 1 {
                return Err("Key function must take exactly 1 argument".to_string());
            }
            local_env.insert(params[0].clone(), value.clone());
            let mut result = EvalResult::Nil;
            for expr in body {
                result = eval_with_env(expr, &mut local_env)?;
            }
            Ok(result)
        }
        EvalResult::Symbol(name) => {
            // Try calling as built-in function
            if let Some(func) = env.get(name).cloned() {
                apply_key_fn(&func, value, env)
            } else {
                Err(format!("Unknown key function: {}", name))
            }
        }
        _ => Err("Key must be a function".to_string()),
    }
}

// Helper to call test function
fn call_test_fn(test_fn: &EvalResult, a: &EvalResult, b: &EvalResult, env: &mut HashMap<String, EvalResult>) -> Result<bool, String> {
    match test_fn {
        EvalResult::Nil => {
            // If test is nil, default to eql
            let a_ast = result_to_ast(a)?;
            let b_ast = result_to_ast(b)?;
            let call_ast = ASTNode::Call {
                function: Box::new(ASTNode::Variable("eql".to_string())),
                args: vec![a_ast, b_ast],
            };
            let result = eval_with_env(&call_ast, env)?;
            Ok(!matches!(result, EvalResult::Nil | EvalResult::Bool(false)))
        }
        EvalResult::Lambda { params, defaults: _, supplied_p_vars: _, body, env: closure_env } => {
            let mut local_env = closure_env.borrow().clone();
            if params.len() != 2 {
                return Err("Test function must take exactly 2 arguments".to_string());
            }
            local_env.insert(params[0].clone(), a.clone());
            local_env.insert(params[1].clone(), b.clone());
            let mut result = EvalResult::Nil;
            for expr in body {
                result = eval_with_env(expr, &mut local_env)?;
            }
            Ok(!matches!(result, EvalResult::Nil | EvalResult::Bool(false)))
        }
        EvalResult::Symbol(name) => {
            // Try looking up in environment first
            if let Some(func) = env.get(name).cloned() {
                call_test_fn(&func, a, b, env)
            } else {
                // Try calling as built-in function by constructing and evaluating a call
                let a_ast = result_to_ast(a)?;
                let b_ast = result_to_ast(b)?;
                let call_ast = ASTNode::Call {
                    function: Box::new(ASTNode::Variable(name.clone())),
                    args: vec![a_ast, b_ast],
                };
                let result = eval_with_env(&call_ast, env)?;
                Ok(!matches!(result, EvalResult::Nil | EvalResult::Bool(false)))
            }
        }
        _ => Err("Test must be a function".to_string()),
    }
}

// Helper to complement a function
fn eval_complement_fn(fn_val: EvalResult) -> Result<EvalResult, String> {
    match fn_val {
        EvalResult::Lambda { params, defaults, supplied_p_vars, body, env } => {
            // Create a new lambda that negates the result
            let not_body = vec![
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("not".to_string())),
                    args: vec![ASTNode::Progn { exprs: body }],
                }
            ];
            Ok(EvalResult::Lambda { params, defaults, supplied_p_vars, body: not_body, env })
        }
        _ => Err("complement: argument must be a function".to_string()),
    }
}

pub(super) fn eval_assoc(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("assoc requires at least 2 arguments".to_string());
    }

    let key = eval_with_env(&args[0], env)?;
    let alist = eval_with_env(&args[1], env)?;

    // Parse keyword arguments
    let mut test_fn: Option<EvalResult> = None;

    let mut i = 2;
    while i < args.len() {
        if let ASTNode::Variable(kw) = &args[i] {
            if i + 1 >= args.len() {
                return Err(format!("Keyword {} requires a value", kw));
            }
            match kw.as_str() {
                ":test" => {
                    test_fn = Some(eval_with_env(&args[i + 1], env)?);
                    i += 2;
                }
                ":test-not" => {
                    let fn_val = eval_with_env(&args[i + 1], env)?;
                    test_fn = Some(eval_complement_fn(fn_val)?);
                    i += 2;
                }
                _ => return Err(format!("Unknown keyword argument: {}", kw)),
            }
        } else {
            i += 1;
        }
    }

    // Default test function is eql
    let test_fn = test_fn.unwrap_or(EvalResult::Symbol("eql".to_string()));

    let mut current = alist.clone();

    loop {
        match &current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                // Check if car is a cons cell (key . value)
                let car_val = car.borrow().clone();
                let cdr_val = cdr.borrow().clone();
                if let EvalResult::Cons(pair_car, _) = &car_val {
                    let pair_car_val = pair_car.borrow().clone();
                    // Use direct comparison instead of call_test_fn to avoid symbol evaluation issues
                    let matches = match &test_fn {
                        EvalResult::Nil => values_equal(&key, &pair_car_val),
                        EvalResult::Symbol(name) if name == "eql" || name == "eq" => {
                            values_equal(&key, &pair_car_val)
                        }
                        EvalResult::Symbol(name) if name == "equal" => {
                            deep_equal_for_assoc(&key, &pair_car_val)
                        }
                        _ => call_test_fn(&test_fn, &key, &pair_car_val, env)?
                    };

                    if matches {
                        return Ok(car_val.clone());
                    }
                }
                current = cdr_val;
            }
            _ => return Ok(EvalResult::Nil),
        }
    }
}

pub(super) fn eval_rassoc(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("rassoc requires at least 2 arguments".to_string());
    }

    let value = eval_with_env(&args[0], env)?;
    let alist = eval_with_env(&args[1], env)?;

    // Parse keyword arguments
    let mut test_fn: Option<EvalResult> = None;
    let mut key_fn: Option<EvalResult> = None;

    let mut i = 2;
    while i < args.len() {
        if let ASTNode::Variable(kw) = &args[i] {
            if i + 1 >= args.len() {
                return Err(format!("Keyword {} requires a value", kw));
            }
            match kw.as_str() {
                ":test" => {
                    test_fn = Some(eval_with_env(&args[i + 1], env)?);
                    i += 2;
                }
                ":test-not" => {
                    let fn_val = eval_with_env(&args[i + 1], env)?;
                    test_fn = Some(eval_complement_fn(fn_val)?);
                    i += 2;
                }
                ":key" => {
                    key_fn = Some(eval_with_env(&args[i + 1], env)?);
                    i += 2;
                }
                _ => return Err(format!("Unknown keyword argument: {}", kw)),
            }
        } else {
            i += 1;
        }
    }

    // Default test function is eql
    let test_fn = test_fn.unwrap_or(EvalResult::Symbol("eql".to_string()));

    let mut current = alist.clone();

    loop {
        match &current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                // Check if car is a cons cell (key . value)
                let car_val = car.borrow().clone();
                let cdr_val = cdr.borrow().clone();
                if let EvalResult::Cons(_, pair_cdr) = &car_val {
                    let mut pair_cdr_val = pair_cdr.borrow().clone();

                    // Apply key function if provided
                    if let Some(ref key) = key_fn {
                        pair_cdr_val = apply_key_fn(key, &pair_cdr_val, env)?;
                    }

                    // Use direct comparison instead of call_test_fn to avoid symbol evaluation issues
                    let matches = match &test_fn {
                        EvalResult::Nil => values_equal(&value, &pair_cdr_val),
                        EvalResult::Symbol(name) if name == "eql" || name == "eq" => {
                            values_equal(&value, &pair_cdr_val)
                        }
                        EvalResult::Symbol(name) if name == "equal" => {
                            deep_equal_for_assoc(&value, &pair_cdr_val)
                        }
                        _ => call_test_fn(&test_fn, &value, &pair_cdr_val, env)?
                    };

                    if matches {
                        return Ok(car_val.clone());
                    }
                }
                current = cdr_val;
            }
            _ => return Ok(EvalResult::Nil),
        }
    }
}

fn deep_equal_for_assoc(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a == b,
        (EvalResult::Float(a), EvalResult::Float(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::String(a), EvalResult::String(b)) => a == b,
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a == b,
        (EvalResult::Cons(car1, cdr1), EvalResult::Cons(car2, cdr2)) => {
            deep_equal_for_assoc(&car1.borrow(), &car2.borrow()) &&
            deep_equal_for_assoc(&cdr1.borrow(), &cdr2.borrow())
        }
        _ => false,
    }
}

pub(super) fn eval_acons(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 3 {
        return Err("acons requires 3 arguments (key datum alist)".to_string());
    }

    let key = eval_with_env(&args[0], env)?;
    let datum = eval_with_env(&args[1], env)?;
    let alist = eval_with_env(&args[2], env)?;

    // Create (cons key datum)
    let pair = EvalResult::Cons(
        Rc::new(RefCell::new(key)),
        Rc::new(RefCell::new(datum))
    );

    // Create (cons pair alist)
    let result = EvalResult::Cons(
        Rc::new(RefCell::new(pair)),
        Rc::new(RefCell::new(alist))
    );

    Ok(result)
}

pub(super) fn eval_pair_p(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("pair? requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(_, _) => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_null_p(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("null? requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Nil => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_null(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("null requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Nil => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_atom(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("atom requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(_, _) => Ok(EvalResult::Nil),
        _ => Ok(EvalResult::Bool(true)),
    }
}

pub(super) fn eval_listp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("listp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Nil => Ok(EvalResult::Bool(true)),
        EvalResult::Cons(_, _) => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_consp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("consp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(_, _) => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_endp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("endp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Nil => Ok(EvalResult::Bool(true)),
        EvalResult::Cons(_, _) => Ok(EvalResult::Nil),
        _ => Err("endp: argument must be a list".to_string()),
    }
}

pub(super) fn eval_push(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("push requires 2 arguments (item place)".to_string());
    }

    // Evaluate the item to push
    let item = eval_with_env(&args[0], env)?;

    match &args[1] {
        // Simple variable place
        ASTNode::Variable(place_name) => {
            // Get current value of place
            let current = env.get(place_name).cloned().unwrap_or(EvalResult::Nil);

            // Create new cons cell with item as car and current list as cdr
            let new_list = EvalResult::Cons(
                Rc::new(RefCell::new(item.clone())),
                Rc::new(RefCell::new(current))
            );

            // Update the place
            env.insert(place_name.clone(), new_list.clone());

            Ok(new_list)
        }
        // Complex place form - use setf expansion
        place => {
            // Read current value from place
            let current = eval_with_env(place, env)?;

            // Create new cons
            let new_list = EvalResult::Cons(
                Rc::new(RefCell::new(item.clone())),
                Rc::new(RefCell::new(current))
            );

            // Store back using setf
            let new_val_ast = result_to_ast(&new_list)?;
            let setf_call = ASTNode::Call {
                function: Box::new(ASTNode::Variable("setf".to_string())),
                args: vec![place.clone(), new_val_ast],
            };
            eval_with_env(&setf_call, env)?;

            Ok(new_list)
        }
    }
}

pub(super) fn eval_pop(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("pop requires 1 argument (place)".to_string());
    }

    match &args[0] {
        // Simple variable place
        ASTNode::Variable(place_name) => {
            // Get current value of place
            let current = env.get(place_name).cloned().unwrap_or(EvalResult::Nil);

            match current {
                EvalResult::Nil => Err("pop: cannot pop from empty list".to_string()),
                EvalResult::Cons(car, cdr) => {
                    let result = car.borrow().clone();
                    let new_list = cdr.borrow().clone();
                    // Update the place with the cdr
                    env.insert(place_name.clone(), new_list);
                    Ok(result)
                }
                _ => Err("pop: argument must be a list".to_string()),
            }
        }
        // Complex place form - use setf expansion
        place => {
            // Read current value from place
            let current = eval_with_env(place, env)?;

            match current {
                EvalResult::Nil => Err("pop: cannot pop from empty list".to_string()),
                EvalResult::Cons(car, cdr) => {
                    let result = car.borrow().clone();
                    let new_list = cdr.borrow().clone();

                    // Store back using setf
                    let new_val_ast = result_to_ast(&new_list)?;
                    let setf_call = ASTNode::Call {
                        function: Box::new(ASTNode::Variable("setf".to_string())),
                        args: vec![place.clone(), new_val_ast],
                    };
                    eval_with_env(&setf_call, env)?;

                    Ok(result)
                }
                _ => Err("pop: argument must be a list".to_string()),
            }
        }
    }
}

pub(super) fn eval_pushnew(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (pushnew item place &key :test :test-not :key)
    // Push item onto list at place only if it's not already there
    // For now, ignore keyword arguments and just handle the basic case
    if args.len() < 2 {
        return Err("pushnew requires at least 2 arguments (item place)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;

    match &args[1] {
        // Simple variable place
        ASTNode::Variable(place_name) => {
            // Get current value of place
            let current = env.get(place_name).cloned().unwrap_or(EvalResult::Nil);

            // Check if item is already in the list
            let mut list_iter = current.clone();
            loop {
                match list_iter {
                    EvalResult::Nil => break,
                    EvalResult::Cons(car, cdr) => {
                        if values_equal(&item, &car.borrow()) {
                            // Item already present, return the list unchanged
                            return Ok(current);
                        }
                        list_iter = cdr.borrow().clone();
                    }
                    _ => return Err("pushnew: place must contain a list".to_string()),
                }
            }

            // Item not found, cons it onto the list
            let new_list = EvalResult::Cons(
                Rc::new(RefCell::new(item)),
                Rc::new(RefCell::new(current))
            );

            env.insert(place_name.clone(), new_list.clone());
            Ok(new_list)
        }
        // Complex place form - use setf expansion
        place => {
            // Read current value from place
            let current = eval_with_env(place, env)?;

            // Check if item is already in the list
            let mut list_iter = current.clone();
            loop {
                match list_iter {
                    EvalResult::Nil => break,
                    EvalResult::Cons(car, cdr) => {
                        if values_equal(&item, &car.borrow()) {
                            // Item already present, return the list unchanged
                            return Ok(current);
                        }
                        list_iter = cdr.borrow().clone();
                    }
                    _ => return Err("pushnew: place must contain a list".to_string()),
                }
            }

            // Item not found, cons it onto the list
            let new_list = EvalResult::Cons(
                Rc::new(RefCell::new(item)),
                Rc::new(RefCell::new(current))
            );

            // Store back using setf
            let new_val_ast = result_to_ast(&new_list)?;
            let setf_call = ASTNode::Call {
                function: Box::new(ASTNode::Variable("setf".to_string())),
                args: vec![place.clone(), new_val_ast],
            };
            eval_with_env(&setf_call, env)?;

            Ok(new_list)
        }
    }
}

// Helper function for equality comparison
fn values_equal(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Fixnum(x), EvalResult::Fixnum(y)) => x == y,
        (EvalResult::Float(x), EvalResult::Float(y)) => x == y,
        (EvalResult::Bool(x), EvalResult::Bool(y)) => x == y,
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Symbol(x), EvalResult::Symbol(y)) => x == y,
        (EvalResult::String(x), EvalResult::String(y)) => x == y,
        _ => false,
    }
}

pub(super) fn eval_remove(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (remove item list) - return new list with item removed
    if args.len() != 2 {
        return Err("remove requires 2 arguments (item list)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    let mut result_items = Vec::new();
    let mut current = list;

    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                let elem = car.borrow().clone();
                if !values_equal(&item, &elem) {
                    result_items.push(elem);
                }
                current = cdr.borrow().clone();
            }
            _ => return Err("remove: second argument must be a list".to_string()),
        }
    }

    // Build result list
    let mut result = EvalResult::Nil;
    for elem in result_items.iter().rev() {
        result = EvalResult::Cons(
            Rc::new(RefCell::new(elem.clone())),
            Rc::new(RefCell::new(result))
        );
    }

    Ok(result)
}

pub(super) fn eval_delete(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (delete item list) - destructively remove item from list
    // For simplicity, we implement this same as remove (non-destructive)
    // since proper destructive delete would require tracking list structure
    eval_remove(args, env)
}

pub(super) fn eval_find(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (find item list) - find first occurrence of item in list
    if args.len() != 2 {
        return Err("find requires 2 arguments (item list)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    let mut current = list;
    loop {
        match current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                let elem = car.borrow().clone();
                if values_equal(&item, &elem) {
                    return Ok(elem);
                }
                current = cdr.borrow().clone();
            }
            _ => return Err("find: second argument must be a list".to_string()),
        }
    }
}

pub(super) fn eval_position(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (position item list) - find position of first occurrence
    if args.len() != 2 {
        return Err("position requires 2 arguments (item list)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    let mut current = list;
    let mut pos = 0i64;

    loop {
        match current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                let elem = car.borrow().clone();
                if values_equal(&item, &elem) {
                    return Ok(EvalResult::Fixnum(pos));
                }
                pos += 1;
                current = cdr.borrow().clone();
            }
            _ => return Err("position: second argument must be a list".to_string()),
        }
    }
}

pub(super) fn eval_count(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (count item list) - count occurrences of item in list
    if args.len() != 2 {
        return Err("count requires 2 arguments (item list)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    let mut current = list;
    let mut count = 0i64;

    loop {
        match current {
            EvalResult::Nil => return Ok(EvalResult::Fixnum(count)),
            EvalResult::Cons(car, cdr) => {
                let elem = car.borrow().clone();
                if values_equal(&item, &elem) {
                    count += 1;
                }
                current = cdr.borrow().clone();
            }
            _ => return Err("count: second argument must be a list".to_string()),
        }
    }
}

pub(super) fn eval_butlast(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (butlast list [n]) - return list without last n elements (default n=1)
    if args.is_empty() || args.len() > 2 {
        return Err("butlast requires 1 or 2 arguments".to_string());
    }

    let list = eval_with_env(&args[0], env)?;
    let n = if args.len() == 2 {
        match eval_with_env(&args[1], env)? {
            EvalResult::Fixnum(n) => n as usize,
            _ => return Err("butlast: second argument must be an integer".to_string()),
        }
    } else {
        1
    };

    // Collect all elements into a vector
    let mut elements = Vec::new();
    let mut current = list;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elements.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("butlast: argument must be a list".to_string()),
        }
    }

    // Remove last n elements
    if n >= elements.len() {
        return Ok(EvalResult::Nil);
    }
    elements.truncate(elements.len() - n);

    // Build result list
    let mut result = EvalResult::Nil;
    for elem in elements.iter().rev() {
        result = EvalResult::Cons(
            Rc::new(RefCell::new(elem.clone())),
            Rc::new(RefCell::new(result))
        );
    }

    Ok(result)
}

pub(super) fn eval_subseq(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (subseq sequence start [end]) - extract subsequence
    if args.len() < 2 || args.len() > 3 {
        return Err("subseq requires 2 or 3 arguments".to_string());
    }

    let sequence = eval_with_env(&args[0], env)?;
    let start = match eval_with_env(&args[1], env)? {
        EvalResult::Fixnum(n) => n as usize,
        _ => return Err("subseq: start must be an integer".to_string()),
    };

    let end = if args.len() == 3 {
        match eval_with_env(&args[2], env)? {
            EvalResult::Fixnum(n) => Some(n as usize),
            _ => return Err("subseq: end must be an integer".to_string()),
        }
    } else {
        None
    };

    // Collect elements
    let mut elements = Vec::new();
    let mut current = sequence;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elements.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("subseq: first argument must be a list".to_string()),
        }
    }

    // Extract subsequence
    let end_idx = end.unwrap_or(elements.len());
    if start > elements.len() || end_idx > elements.len() || start > end_idx {
        return Err("subseq: invalid start/end indices".to_string());
    }

    let subseq_elements = &elements[start..end_idx];

    // Build result list
    let mut result = EvalResult::Nil;
    for elem in subseq_elements.iter().rev() {
        result = EvalResult::Cons(
            Rc::new(RefCell::new(elem.clone())),
            Rc::new(RefCell::new(result))
        );
    }

    Ok(result)
}

pub(super) fn eval_reduce(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (reduce function sequence &key initial-value)
    if args.len() < 2 {
        return Err("reduce requires at least 2 arguments (function and sequence)".to_string());
    }

    let function = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;

    // Check for :initial-value keyword
    let mut initial_value: Option<EvalResult> = None;
    for i in 2..args.len() {
        if let ASTNode::Variable(kw) = &args[i] {
            if kw == ":initial-value" && i + 1 < args.len() {
                initial_value = Some(eval_with_env(&args[i + 1], env)?);
                break;
            }
        }
    }

    // Convert sequence to vector of elements
    let elements = match sequence {
        EvalResult::Nil => {
            return match initial_value {
                Some(val) => Ok(val),
                None => Err("reduce: empty sequence requires :initial-value".to_string()),
            };
        }
        EvalResult::Cons(_, _) => {
            // Convert list to vector
            let mut elems = Vec::new();
            let mut current = sequence;
            loop {
                match current {
                    EvalResult::Nil => break,
                    EvalResult::Cons(car, cdr) => {
                        elems.push(car.borrow().clone());
                        current = cdr.borrow().clone();
                    }
                    _ => return Err("reduce: malformed list".to_string()),
                }
            }
            elems
        }
        EvalResult::Array(ref arr) => {
            arr.borrow().clone()
        }
        _ => return Err("reduce: second argument must be a sequence (list or array)".to_string()),
    };

    // If empty sequence, return initial value or error
    if elements.is_empty() {
        return match initial_value {
            Some(val) => Ok(val),
            None => Err("reduce: empty sequence requires :initial-value".to_string()),
        };
    }

    // Initialize accumulator
    let (mut accumulator, start_idx) = match initial_value {
        Some(val) => (val, 0),
        None => {
            if elements.len() == 1 {
                return Ok(elements[0].clone());
            }
            (elements[0].clone(), 1)
        }
    };

    // Apply function to accumulate values
    for i in start_idx..elements.len() {
        let elem = &elements[i];

        // Convert accumulator and elem to ASTNodes for function call
        let acc_ast = result_to_ast(&accumulator)?;
        let elem_ast = result_to_ast(elem)?;

        // Call the function with (function accumulator element)
        let call_node = ASTNode::Call {
            function: Box::new(result_to_ast(&function)?),
            args: vec![acc_ast, elem_ast],
        };

        accumulator = eval_with_env(&call_node, env)?;
    }

    Ok(accumulator)
}
