/// List operations and predicates

use super::eval_types::EvalResult;
use super::eval_core::eval_with_env;
use super::eval_system::{result_to_ast_quoted, eval_lambda_call_with_values, call_function_with_values};
use crate::ir::{ASTNode, ConstantValue};
use std::collections::{HashMap, HashSet};
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
        EvalResult::Nil => Ok(EvalResult::Nil),  // (car nil) => nil in CL
        _ => Err("car requires a cons cell or nil".to_string()),
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

pub(super) fn is_car_cdr_accessor_name(name: &str) -> bool {
    let lower = name.to_ascii_lowercase();
    if matches!(
        lower.as_str(),
        "first" | "second" | "third" | "fourth" | "fifth" | "sixth" | "seventh" | "eighth" | "ninth" | "tenth"
    ) {
        return true;
    }
    if lower == "car" || lower == "cdr" {
        return true;
    }
    lower.len() >= 3
        && lower.starts_with('c')
        && lower.ends_with('r')
        && lower[1..lower.len() - 1]
            .chars()
            .all(|ch| ch == 'a' || ch == 'd')
}

fn canonical_car_cdr_accessor(name: &str) -> Option<String> {
    let lower = name.to_ascii_lowercase();
    let canonical = match lower.as_str() {
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
        _ => lower.clone(),
    };

    if is_car_cdr_accessor_name(&canonical) {
        Some(canonical)
    } else {
        None
    }
}

pub(super) fn eval_car_cdr_accessor(
    name: &str,
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err(format!("{} requires 1 argument", name));
    }

    let accessor = canonical_car_cdr_accessor(name)
        .ok_or_else(|| format!("{} is not a valid car/cdr accessor", name))?;
    let mut current = eval_with_env(&args[0], env)?;
    let ops: Vec<char> = if accessor == "car" {
        vec!['a']
    } else if accessor == "cdr" {
        vec!['d']
    } else {
        accessor
            .chars()
            .skip(1)
            .take(accessor.len().saturating_sub(2))
            .collect()
    };

    for op in ops.into_iter().rev() {
        current = match current {
            EvalResult::Cons(car, cdr) => {
                if op == 'a' {
                    car.borrow().clone()
                } else {
                    cdr.borrow().clone()
                }
            }
            EvalResult::Nil => EvalResult::Nil,
            _ => return Err(format!("{} requires a list", accessor)),
        };
    }

    Ok(current)
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
    if args.is_empty() || args.len() > 2 {
        return Err("last requires 1-2 arguments".to_string());
    }
    let list = eval_with_env(&args[0], env)?;
    let n = if args.len() == 2 {
        match eval_with_env(&args[1], env)? {
            EvalResult::Fixnum(n) => n as usize,
            EvalResult::Bignum(_) => {
                // Bignum count is always >= list length, return whole list
                return Ok(list);
            }
            _ => return Err("last: second argument must be an integer".to_string()),
        }
    } else {
        1
    };

    match &list {
        EvalResult::Nil => return Ok(EvalResult::Nil),
        EvalResult::Cons(_, _) => {},
        _ => return Err("last requires a list".to_string()),
    }

    if n == 0 {
        // (last list 0) returns the atom terminating the list
        let mut current = list;
        loop {
            match current {
                EvalResult::Cons(_, cdr) => current = cdr.borrow().clone(),
                other => return Ok(other),
            }
        }
    }

    // Count list length
    let mut len = 0usize;
    let mut current = list.clone();
    loop {
        match current {
            EvalResult::Cons(_, cdr) => { len += 1; current = cdr.borrow().clone(); }
            _ => break,
        }
    }

    // Skip (len - n) conses
    let skip = if len > n { len - n } else { 0 };
    let mut current = list;
    for _ in 0..skip {
        if let EvalResult::Cons(_, cdr) = &current {
            let next = cdr.borrow().clone();
            current = next;
        }
    }
    Ok(current)
}

pub(super) fn eval_list(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // Evaluate arguments left-to-right (CL compatibility), then build the list.
    let mut values = Vec::with_capacity(args.len());
    for arg in args {
        values.push(eval_with_env(arg, env)?);
    }
    let mut result = EvalResult::Nil;
    for val in values.into_iter().rev() {
        result = EvalResult::Cons(Rc::new(RefCell::new(val)), Rc::new(RefCell::new(result)));
    }
    Ok(result)
}

pub(super) fn eval_length(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("length requires 1 argument".to_string());
    }
    let seq = eval_with_env(&args[0], env)?;

    // Handle different sequence types
    match &seq {
        EvalResult::Nil => return Ok(EvalResult::Fixnum(0)),
        EvalResult::String(s) => return Ok(EvalResult::Fixnum(s.chars().count() as i64)),
        EvalResult::Array(arr) => return Ok(EvalResult::Fixnum(arr.borrow().len() as i64)),
        EvalResult::Cons(_, _) => {
            // Count list elements
            let mut count = 0i64;
            let mut current = seq;
            loop {
                match current {
                    EvalResult::Nil => return Ok(EvalResult::Fixnum(count)),
                    EvalResult::Cons(_, cdr) => {
                        count += 1;
                        let next = cdr.borrow().clone();
                        current = next;
                    }
                    _ => return Err("length: improper list".to_string()),
                }
            }
        }
        _ => return Err(format!("length requires a sequence (list, string, or vector), got {:?}", seq)),
    }
}

pub(super) fn eval_nth(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("nth requires 2 arguments (index list)".to_string());
    }
    let n = match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) if n >= 0 => n as usize,
        EvalResult::Fixnum(n) => return Err(format!("nth: index must be non-negative, got {}", n)),
        EvalResult::Bignum(ref b) => {
            use malachite::num::basic::traits::Zero;
            use malachite::Integer;
            if *b >= Integer::ZERO {
                return Ok(EvalResult::Nil); // Index too large, element can't exist
            } else {
                return Err("nth: index must be non-negative".to_string());
            }
        }
        EvalResult::Float(f) if f >= 0.0 => f as usize,
        _ => return Err("nth: index must be a non-negative integer".to_string()),
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
    let seq = eval_with_env(&args[0], env)?;

    match seq {
        EvalResult::String(s) => {
            Ok(EvalResult::String(s.chars().rev().collect()))
        }
        EvalResult::Array(arr) => {
            let mut v = arr.borrow().clone();
            v.reverse();
            Ok(EvalResult::Array(Rc::new(RefCell::new(v))))
        }
        _ => {
            let mut result = EvalResult::Nil;
            let mut current = seq;
            loop {
                match current {
                    EvalResult::Nil => return Ok(result),
                    EvalResult::Cons(car, cdr) => {
                        result = EvalResult::Cons(Rc::new(RefCell::new(car.borrow().clone())), Rc::new(RefCell::new(result)));
                        let next = cdr.borrow().clone();
                        current = next;
                    }
                    _ => return Err("reverse requires a sequence".to_string()),
                }
            }
        }
    }
}

pub(super) fn eval_nreverse(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("nreverse requires 1 argument".to_string());
    }
    let seq = eval_with_env(&args[0], env)?;

    match seq {
        EvalResult::String(s) => {
            Ok(EvalResult::String(s.chars().rev().collect()))
        }
        EvalResult::Array(arr) => {
            arr.borrow_mut().reverse();
            Ok(EvalResult::Array(arr))
        }
        _ => {
            let mut result = EvalResult::Nil;
            let mut current = seq;
            loop {
                match current {
                    EvalResult::Nil => return Ok(result),
                    EvalResult::Cons(car, cdr) => {
                        let next = cdr.borrow().clone();
                        *cdr.borrow_mut() = result;
                        result = EvalResult::Cons(car.clone(), cdr.clone());
                        current = next;
                    }
                    _ => return Err("nreverse requires a sequence".to_string()),
                }
            }
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

pub(super) fn apply_function(
    func: &EvalResult,
    args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    match func {
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: closure_env, dynamic_env } => {
            // Use the full lambda call handler that supports &optional, &rest, &key, etc.
            eval_lambda_call_with_values(params.clone(), defaults.clone(), supplied_p_vars.clone(), key_params.clone(), body.clone(), *dynamic_env, closure_env.clone(), args, env)
        }
        EvalResult::BuiltinFunction(name) => {
            super::eval_system::call_function_with_values(EvalResult::BuiltinFunction(name.clone()), args, env)
        }
        EvalResult::GenericFunction(gf) => {
            super::eval_system::call_function_with_values(EvalResult::GenericFunction(gf.clone()), args, env)
        }
        EvalResult::ForeignFunction(func) => {
            super::eval_system::call_function_with_values(EvalResult::ForeignFunction(func.clone()), args, env)
        }
        EvalResult::Symbol(name) => {
            // Handle function name - look up in environment or call builtin
            if let Some(EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: closure_env, dynamic_env }) = env.get(name).cloned() {
                // User-defined function - use full lambda call handler
                eval_lambda_call_with_values(params, defaults, supplied_p_vars, key_params, body, dynamic_env, closure_env, args, env)
            } else {
                // Try calling as a builtin by creating an AST call
                // Use result_to_ast_quoted to properly handle all types including Cons
                let ast_args: Result<Vec<ASTNode>, String> = args.iter()
                    .map(|a| super::eval_system::result_to_ast_quoted(a))
                    .collect();
                let ast_args = ast_args?;
                let call = ASTNode::Call {
                    function: Box::new(ASTNode::Variable(name.clone())),
                    args: ast_args,
                };
                eval_with_env(&call, env)
            }
        }
        _ => Err("mapcar: first argument must be a function".to_string()),
    }
}

/// mapc - like mapcar but for side effects, returns the original list
pub(super) fn eval_mapc(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("mapc requires at least 2 arguments".to_string());
    }

    let func = eval_with_env(&args[0], env)?;
    let original_list = eval_with_env(&args[1], env)?;

    // Collect elements from the list
    let mut elements = Vec::new();
    let mut current = original_list.clone();
    while let EvalResult::Cons(car, cdr) = current {
        elements.push(car.borrow().clone());
        current = cdr.borrow().clone();
    }

    // Apply function to each element (for side effects)
    if !matches!(
        func,
        EvalResult::Lambda { .. }
            | EvalResult::Symbol(_)
            | EvalResult::BuiltinFunction(_)
            | EvalResult::GenericFunction(_)
            | EvalResult::ForeignFunction(_)
    ) {
        return Err("mapc: first argument must be a function".to_string());
    }
    for elem in elements {
        apply_function(&func, &[elem], env)?;
    }

    // Return the original list
    Ok(original_list)
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
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: closure_env, dynamic_env } => {
            let result = eval_lambda_call_with_values(
                params.clone(),
                defaults.clone(),
                supplied_p_vars.clone(),
                key_params.clone(),
                body.clone(),
                *dynamic_env,
                closure_env.clone(),
                &[value.clone()],
                env
            )?;
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
        EvalResult::BuiltinFunction(_) | EvalResult::GenericFunction(_) => {
            call_function_with_values(key_fn.clone(), &[value.clone()], env)
        }
        _ => Err("Key must be a function".to_string()),
    }
}

// Helper to call test function
fn call_test_fn(test_fn: &EvalResult, a: &EvalResult, b: &EvalResult, env: &mut HashMap<String, EvalResult>) -> Result<bool, String> {
    match test_fn {
        EvalResult::Nil => {
            // If test is nil, default to eql
            let result = call_function_with_values(
                EvalResult::Symbol("eql".to_string()),
                &[a.clone(), b.clone()],
                env
            )?;
            Ok(!matches!(result, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)))
        }
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: closure_env, dynamic_env } => {
            let result = eval_lambda_call_with_values(
                params.clone(),
                defaults.clone(),
                supplied_p_vars.clone(),
                key_params.clone(),
                body.clone(),
                *dynamic_env,
                closure_env.clone(),
                &[a.clone(), b.clone()],
                env
            )?;
            Ok(!matches!(result, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)))
        }
        EvalResult::Symbol(name) => {
            // Try looking up in environment first
            if let Some(func) = env.get(name).cloned() {
                call_test_fn(&func, a, b, env)
            } else {
                let result = call_function_with_values(
                    EvalResult::Symbol(name.clone()),
                    &[a.clone(), b.clone()],
                    env
                )?;
                Ok(!matches!(result, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)))
            }
        }
        EvalResult::BuiltinFunction(_) | EvalResult::GenericFunction(_) => {
            let result = call_function_with_values(test_fn.clone(), &[a.clone(), b.clone()], env)?;
            Ok(!matches!(result, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)))
        }
        _ => Err("Test must be a function".to_string()),
    }
}

// Helper to complement a function
fn eval_complement_fn(fn_val: EvalResult) -> Result<EvalResult, String> {
    match fn_val {
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env, dynamic_env } => {
            // Create a new lambda that negates the result
            let not_body = vec![
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("not".to_string())),
                    args: vec![ASTNode::Progn { exprs: body }],
                }
            ];
            Ok(EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body: not_body, env, dynamic_env })
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
            // Get current value of place - check dynamic vars first for special variables
            let current = if super::eval_types::is_special_variable(place_name) {
                super::eval_types::get_dynamic_var(place_name)
                    .or_else(|| env.get(place_name).cloned())
                    .unwrap_or(EvalResult::Nil)
            } else {
                env.get(place_name).cloned().unwrap_or(EvalResult::Nil)
            };

            // Create new cons cell with item as car and current list as cdr
            let new_list = EvalResult::Cons(
                Rc::new(RefCell::new(item.clone())),
                Rc::new(RefCell::new(current))
            );

            // Update the place
            env.insert(place_name.clone(), new_list.clone());
            // Also update global dynamic store for special variables
            if super::eval_types::is_special_variable(place_name) {
                super::eval_types::set_dynamic_var(place_name, new_list.clone());
            }

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
            let new_val_ast = result_to_ast_quoted(&new_list)?;
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
            // Get current value of place - check dynamic vars for special variables
            let current = if super::eval_types::is_special_variable(place_name) {
                super::eval_types::get_dynamic_var(place_name)
                    .or_else(|| env.get(place_name).cloned())
                    .unwrap_or(EvalResult::Nil)
            } else {
                env.get(place_name).cloned().unwrap_or(EvalResult::Nil)
            };

            match current {
                EvalResult::Nil => {
                    env.insert(place_name.clone(), EvalResult::Nil);
                    if super::eval_types::is_special_variable(place_name) {
                        super::eval_types::set_dynamic_var(place_name, EvalResult::Nil);
                    }
                    Ok(EvalResult::Nil)
                }
                EvalResult::Cons(car, cdr) => {
                    let result = car.borrow().clone();
                    let new_list = cdr.borrow().clone();
                    // Update the place with the cdr
                    env.insert(place_name.clone(), new_list.clone());
                    if super::eval_types::is_special_variable(place_name) {
                        super::eval_types::set_dynamic_var(place_name, new_list);
                    }
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
                EvalResult::Nil => {
                    // Store back using setf
                    let new_val_ast = result_to_ast_quoted(&EvalResult::Nil)?;
                    let setf_call = ASTNode::Call {
                        function: Box::new(ASTNode::Variable("setf".to_string())),
                        args: vec![place.clone(), new_val_ast],
                    };
                    eval_with_env(&setf_call, env)?;
                    Ok(EvalResult::Nil)
                }
                EvalResult::Cons(car, cdr) => {
                    let result = car.borrow().clone();
                    let new_list = cdr.borrow().clone();

                    // Store back using setf
                    let new_val_ast = result_to_ast_quoted(&new_list)?;
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
    if args.len() < 2 {
        return Err("pushnew requires at least 2 arguments (item place)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;

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

    match &args[1] {
        // Simple variable place
        ASTNode::Variable(place_name) => {
            // Get current value of place - check dynamic vars for special variables
            let current = if place_name == "*features*" {
                super::eval_symbol::get_features()
            } else if super::eval_types::is_special_variable(place_name) {
                super::eval_types::get_dynamic_var(place_name)
                    .or_else(|| env.get(place_name).cloned())
                    .unwrap_or(EvalResult::Nil)
            } else {
                env.get(place_name).cloned().unwrap_or(EvalResult::Nil)
            };

            // Check if item is already in the list
            if list_contains_with_key(&item, &current, test_fn.as_ref(), key_fn.as_ref(), env)? {
                return Ok(current);
            }

            // Item not found, cons it onto the list
            let new_list = EvalResult::Cons(
                Rc::new(RefCell::new(item)),
                Rc::new(RefCell::new(current))
            );

            // Store the new list - handle special global variables
            if place_name == "*features*" {
                super::eval_symbol::set_features(new_list.clone());
            } else {
                env.insert(place_name.clone(), new_list.clone());
                if super::eval_types::is_special_variable(place_name) {
                    super::eval_types::set_dynamic_var(place_name, new_list.clone());
                }
            }
            Ok(new_list)
        }
        // Complex place form - use setf expansion
        place => {
            // Read current value from place
            let current = eval_with_env(place, env)?;

            // Check if item is already in the list
            if list_contains_with_key(&item, &current, test_fn.as_ref(), key_fn.as_ref(), env)? {
                return Ok(current);
            }

            // Item not found, cons it onto the list
            let new_list = EvalResult::Cons(
                Rc::new(RefCell::new(item)),
                Rc::new(RefCell::new(current))
            );

            // Store back using setf
            let new_val_ast = result_to_ast_quoted(&new_list)?;
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
        (EvalResult::Character(x), EvalResult::Character(y)) => x == y,
        (EvalResult::Symbol(x), EvalResult::Symbol(y)) => {
            // Case-insensitive comparison for symbols (Common Lisp semantics)
            x.eq_ignore_ascii_case(y)
        }
        (EvalResult::String(x), EvalResult::String(y)) => x == y,
        _ => false,
    }
}

fn list_contains_with_key(
    item: &EvalResult,
    list: &EvalResult,
    test_fn: Option<&EvalResult>,
    key_fn: Option<&EvalResult>,
    env: &mut HashMap<String, EvalResult>,
) -> Result<bool, String> {
    let mut current = list.clone();
    loop {
        match current {
            EvalResult::Nil => return Ok(false),
            EvalResult::Cons(car, cdr) => {
                let car_val = car.borrow().clone();
                let test_item = if let Some(key) = key_fn {
                    apply_key_fn(key, &car_val, env)?
                } else {
                    car_val.clone()
                };

                let keyed_item = if let Some(key) = key_fn {
                    apply_key_fn(key, item, env)?
                } else {
                    item.clone()
                };

                let matches = if let Some(test) = test_fn {
                    call_test_fn(test, &keyed_item, &test_item, env)?
                } else {
                    values_equal(&keyed_item, &test_item)
                };

                if matches {
                    return Ok(true);
                }
                current = cdr.borrow().clone();
            }
            _ => return Err("pushnew: place must contain a list".to_string()),
        }
    }
}

fn truthy(val: &EvalResult) -> bool {
    !matches!(val, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false))
}

fn parse_index(val: &EvalResult, name: &str) -> Result<Option<usize>, String> {
    match val {
        EvalResult::Nil => Ok(None),
        EvalResult::Fixnum(n) if *n >= 0 => Ok(Some(*n as usize)),
        EvalResult::Float(f) if *f >= 0.0 => Ok(Some(*f as usize)),
        _ => Err(format!("{} must be a non-negative integer or NIL", name)),
    }
}

#[derive(Clone, Copy)]
enum SequenceKind {
    List,
    String,
    Array,
}

fn collect_sequence(seq: &EvalResult) -> Result<(SequenceKind, Vec<EvalResult>), String> {
    match seq {
        EvalResult::Nil => Ok((SequenceKind::List, Vec::new())),
        EvalResult::Cons(_, _) => {
            let mut items = Vec::new();
            let mut current = seq.clone();
            loop {
                match current {
                    EvalResult::Nil => break,
                    EvalResult::Cons(car, cdr) => {
                        items.push(car.borrow().clone());
                        current = cdr.borrow().clone();
                    }
                    _ => return Err("sequence must be a proper list".to_string()),
                }
            }
            Ok((SequenceKind::List, items))
        }
        EvalResult::String(s) => {
            let items = s.chars().map(EvalResult::Character).collect();
            Ok((SequenceKind::String, items))
        }
        EvalResult::Array(arr) => {
            let items = arr.borrow().clone();
            let is_character_vector = items.iter().all(|item| match item {
                EvalResult::Character(_) => true,
                EvalResult::String(s) => s.chars().count() == 1,
                _ => false,
            });
            if is_character_vector {
                Ok((SequenceKind::String, items))
            } else {
                Ok((SequenceKind::Array, items))
            }
        }
        _ => Err("sequence must be a list, string, or array".to_string()),
    }
}

fn build_sequence(kind: SequenceKind, items: Vec<EvalResult>) -> Result<EvalResult, String> {
    match kind {
        SequenceKind::String => {
            let mut s = String::new();
            for item in items {
                match item {
                    EvalResult::Character(c) => s.push(c),
                    EvalResult::String(str_val) if str_val.chars().count() == 1 => {
                        s.push(str_val.chars().next().unwrap())
                    }
                    _ => return Err("string sequence element must be a character".to_string()),
                }
            }
            Ok(EvalResult::String(s))
        }
        SequenceKind::Array => {
            Ok(EvalResult::Array(Rc::new(RefCell::new(items))))
        }
        SequenceKind::List => {
            let mut result = EvalResult::Nil;
            for item in items.into_iter().rev() {
                result = EvalResult::Cons(
                    Rc::new(RefCell::new(item)),
                    Rc::new(RefCell::new(result))
                );
            }
            Ok(result)
        }
    }
}

fn parse_sequence_keywords(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<(bool, usize, Option<usize>, Option<usize>, Option<EvalResult>), String> {
    let mut from_end = false;
    let mut start: usize = 0;
    let mut end: Option<usize> = None;
    let mut count: Option<usize> = None;
    let mut key_fn: Option<EvalResult> = None;

    let normalize_key = |raw: &str| -> String {
        raw.rsplit(':')
            .next()
            .unwrap_or(raw)
            .trim_start_matches(':')
            .to_ascii_lowercase()
    };

    let mut i = 2;
    while i < args.len() {
        let key = match &args[i] {
            ASTNode::Variable(name) => normalize_key(name),
            ASTNode::Constant(ConstantValue::Symbol(name)) => normalize_key(name),
            _ => {
                i += 1;
                continue;
            }
        };
        if i + 1 >= args.len() {
            return Err(format!("Missing value for keyword {}", key));
        }
        let val = eval_with_env(&args[i + 1], env)?;
        match key.as_str() {
            "from-end" => {
                from_end = truthy(&val);
            }
            "start" => {
                start = parse_index(&val, "start")?.unwrap_or(0);
            }
            "end" => {
                end = parse_index(&val, "end")?;
            }
            "count" => {
                count = parse_index(&val, "count")?;
            }
            "key" => {
                key_fn = Some(val);
            }
            _ => {}
        }
        i += 2;
    }

    Ok((from_end, start, end, count, key_fn))
}

fn apply_predicate(
    predicate: &EvalResult,
    key_fn: &Option<EvalResult>,
    elem: &EvalResult,
    env: &mut HashMap<String, EvalResult>,
) -> Result<bool, String> {
    let key_val = if let Some(key) = key_fn {
        apply_function(key, &[elem.clone()], env)?
    } else {
        elem.clone()
    };
    let result = apply_function(predicate, &[key_val], env)?;
    Ok(truthy(&result))
}

pub(super) fn eval_remove_if(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("remove-if requires at least 2 arguments (predicate sequence)".to_string());
    }

    let predicate = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;
    let (from_end, start, end, count, key_fn) = parse_sequence_keywords(args, env)?;

    let (sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Err("start must be <= end".to_string());
    }

    let mut matches: Vec<usize> = Vec::new();
    for (idx, elem) in items.iter().enumerate().take(end_idx).skip(start) {
        if apply_predicate(&predicate, &key_fn, elem, env)? {
            matches.push(idx);
        }
    }

    let remove_set: HashSet<usize> = if let Some(limit) = count {
        if from_end {
            matches.into_iter().rev().take(limit).collect()
        } else {
            matches.into_iter().take(limit).collect()
        }
    } else {
        matches.into_iter().collect()
    };

    let kept: Vec<EvalResult> = items.into_iter()
        .enumerate()
        .filter_map(|(idx, elem)| if remove_set.contains(&idx) { None } else { Some(elem) })
        .collect();

    build_sequence(sequence_kind, kept)
}

pub(super) fn eval_remove_if_not(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("remove-if-not requires at least 2 arguments (predicate sequence)".to_string());
    }

    let predicate = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;
    let (from_end, start, end, count, key_fn) = parse_sequence_keywords(args, env)?;

    let (sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Err("start must be <= end".to_string());
    }

    let mut matches: Vec<usize> = Vec::new();
    for (idx, elem) in items.iter().enumerate().take(end_idx).skip(start) {
        if !apply_predicate(&predicate, &key_fn, elem, env)? {
            matches.push(idx);
        }
    }

    let remove_set: HashSet<usize> = if let Some(limit) = count {
        if from_end {
            matches.into_iter().rev().take(limit).collect()
        } else {
            matches.into_iter().take(limit).collect()
        }
    } else {
        matches.into_iter().collect()
    };

    let kept: Vec<EvalResult> = items.into_iter()
        .enumerate()
        .filter_map(|(idx, elem)| if remove_set.contains(&idx) { None } else { Some(elem) })
        .collect();

    build_sequence(sequence_kind, kept)
}

pub(super) fn eval_position_if(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("position-if requires at least 2 arguments (predicate sequence)".to_string());
    }
    let predicate = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;
    let (from_end, start, end, _count, key_fn) = parse_sequence_keywords(args, env)?;

    let (_sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Ok(EvalResult::Nil);
    }

    if from_end {
        for (idx, elem) in items.iter().enumerate().take(end_idx).skip(start).rev() {
            if apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(EvalResult::Fixnum(idx as i64));
            }
        }
    } else {
        for (idx, elem) in items.iter().enumerate().take(end_idx).skip(start) {
            if apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(EvalResult::Fixnum(idx as i64));
            }
        }
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_position_if_not(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("position-if-not requires at least 2 arguments (predicate sequence)".to_string());
    }
    let predicate = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;
    let (from_end, start, end, _count, key_fn) = parse_sequence_keywords(args, env)?;

    let (_sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Ok(EvalResult::Nil);
    }

    if from_end {
        for (idx, elem) in items.iter().enumerate().take(end_idx).skip(start).rev() {
            if !apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(EvalResult::Fixnum(idx as i64));
            }
        }
    } else {
        for (idx, elem) in items.iter().enumerate().take(end_idx).skip(start) {
            if !apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(EvalResult::Fixnum(idx as i64));
            }
        }
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_find_if(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("find-if requires at least 2 arguments (predicate sequence)".to_string());
    }
    let predicate = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;
    let (from_end, start, end, _count, key_fn) = parse_sequence_keywords(args, env)?;

    let (_sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Ok(EvalResult::Nil);
    }

    if from_end {
        for elem in items.iter().take(end_idx).skip(start).rev() {
            if apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(elem.clone());
            }
        }
    } else {
        for elem in items.iter().take(end_idx).skip(start) {
            if apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(elem.clone());
            }
        }
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_find_if_not(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("find-if-not requires at least 2 arguments (predicate sequence)".to_string());
    }
    let predicate = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;
    let (from_end, start, end, _count, key_fn) = parse_sequence_keywords(args, env)?;

    let (_sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Ok(EvalResult::Nil);
    }

    if from_end {
        for elem in items.iter().take(end_idx).skip(start).rev() {
            if !apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(elem.clone());
            }
        }
    } else {
        for elem in items.iter().take(end_idx).skip(start) {
            if !apply_predicate(&predicate, &key_fn, elem, env)? {
                return Ok(elem.clone());
            }
        }
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_remove(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (remove item sequence &key test test-not key start end count from-end)
    if args.len() < 2 {
        return Err("remove requires at least 2 arguments (item sequence)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;
    let (from_end, start, end, count, key_fn) = parse_sequence_keywords(args, env)?;

    // Parse :test and :test-not from keyword args
    let mut test_fn: Option<EvalResult> = None;
    let mut test_not_fn: Option<EvalResult> = None;
    let normalize_key = |raw: &str| -> String {
        raw.rsplit(':')
            .next()
            .unwrap_or(raw)
            .trim_start_matches(':')
            .to_ascii_lowercase()
    };
    let mut i = 2;
    while i + 1 < args.len() {
        let key = match &args[i] {
            ASTNode::Variable(kw) => normalize_key(kw),
            ASTNode::Constant(ConstantValue::Symbol(kw)) => normalize_key(kw),
            _ => {
                i += 1;
                continue;
            }
        };
        if key == "test" {
            test_fn = Some(eval_with_env(&args[i + 1], env)?);
        } else if key == "test-not" {
            test_not_fn = Some(eval_with_env(&args[i + 1], env)?);
        }
        i += 2;
    }

    let (sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Err("start must be <= end".to_string());
    }

    // Find elements that match the item
    let mut matches: Vec<usize> = Vec::new();
    for (idx, elem) in items.iter().enumerate().take(end_idx).skip(start) {
        // Apply key function if present
        let elem_val = if let Some(ref kf) = key_fn {
            apply_function(kf, &[elem.clone()], env)?
        } else {
            elem.clone()
        };

        // Compare using test function or default eql
        let is_match = if let Some(ref tf) = test_fn {
            let result = apply_function(tf, &[item.clone(), elem_val], env)?;
            !matches!(result, EvalResult::Nil | EvalResult::Boolean(false))
        } else if let Some(ref tnf) = test_not_fn {
            let result = apply_function(tnf, &[item.clone(), elem_val], env)?;
            matches!(result, EvalResult::Nil | EvalResult::Boolean(false))
        } else {
            values_equal(&item, &elem_val)
        };

        if is_match {
            matches.push(idx);
        }
    }

    // Apply count limit
    let remove_set: HashSet<usize> = if let Some(limit) = count {
        if from_end {
            matches.into_iter().rev().take(limit).collect()
        } else {
            matches.into_iter().take(limit).collect()
        }
    } else {
        matches.into_iter().collect()
    };

    // Build result with non-matching elements
    let result_items: Vec<EvalResult> = items
        .into_iter()
        .enumerate()
        .filter(|(idx, _)| !remove_set.contains(idx))
        .map(|(_, elem)| elem)
        .collect();

    build_sequence(sequence_kind, result_items)
}

pub(super) fn eval_delete(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (delete item list) - destructively remove item from list
    // For simplicity, we implement this same as remove (non-destructive)
    // since proper destructive delete would require tracking list structure
    eval_remove(args, env)
}

pub(super) fn eval_find(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (find item sequence &key test key from-end start end)
    if args.len() < 2 {
        return Err("find requires at least 2 arguments (item sequence)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;

    // Parse keyword arguments
    let mut test_fn: Option<EvalResult> = None;
    let mut key_fn: Option<EvalResult> = None;
    let mut from_end = false;
    let mut start: usize = 0;
    let mut end: Option<usize> = None;
    let mut negate_test = false;

    let normalize_key = |raw: &str| -> String {
        raw.rsplit(':')
            .next()
            .unwrap_or(raw)
            .trim_start_matches(':')
            .to_ascii_lowercase()
    };

    let mut i = 2;
    while i + 1 < args.len() {
        let key = match &args[i] {
            ASTNode::Variable(name) => normalize_key(name),
            ASTNode::Constant(ConstantValue::Symbol(name)) => normalize_key(name),
            _ => {
                i += 1;
                continue;
            }
        };
        let val = eval_with_env(&args[i + 1], env)?;
        match key.as_str() {
            "test" => {
                test_fn = Some(val);
                negate_test = false;
            }
            "test-not" => {
                test_fn = Some(val);
                negate_test = true;
            }
            "key" => key_fn = Some(val),
            "from-end" => from_end = truthy(&val),
            "start" => start = parse_index(&val, "start")?.unwrap_or(0),
            "end" => end = parse_index(&val, "end")?,
            _ => {}
        }
        i += 2;
    }

    let (_sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Ok(EvalResult::Nil);
    }

    let iter: Box<dyn Iterator<Item = usize>> = if from_end {
        Box::new((start..end_idx).rev())
    } else {
        Box::new(start..end_idx)
    };

    for idx in iter {
        let elem = items[idx].clone();
        let key_elem = if let Some(ref key) = key_fn {
            call_function_with_values(key.clone(), &[elem.clone()], env)?
        } else {
            elem.clone()
        };

        let mut matches = if let Some(ref test) = test_fn {
            let result = call_function_with_values(test.clone(), &[item.clone(), key_elem], env)?;
            !matches!(result, EvalResult::Nil | EvalResult::Boolean(false) | EvalResult::Bool(false))
        } else {
            values_equal(&item, &key_elem)
        };

        if negate_test {
            matches = !matches;
        }
        if matches {
            return Ok(elem);
        }
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_position(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (position item sequence &key test test-not key start end from-end)
    if args.len() < 2 {
        return Err("position requires at least 2 arguments (item sequence)".to_string());
    }

    let item = eval_with_env(&args[0], env)?;
    let sequence = eval_with_env(&args[1], env)?;

    let mut from_end = false;
    let mut start: usize = 0;
    let mut end: Option<usize> = None;
    let mut key_fn: Option<EvalResult> = None;
    let mut test_fn: Option<EvalResult> = None;
    let mut negate_test = false;
    let normalize_key = |raw: &str| -> String {
        raw.rsplit(':')
            .next()
            .unwrap_or(raw)
            .trim_start_matches(':')
            .to_ascii_lowercase()
    };

    let mut i = 2;
    while i < args.len() {
        let key = match &args[i] {
            ASTNode::Variable(name) => normalize_key(name),
            ASTNode::Constant(ConstantValue::Symbol(name)) => normalize_key(name),
            _ => {
                i += 1;
                continue;
            }
        };
        if i + 1 >= args.len() {
            return Err(format!("Missing value for keyword {}", key));
        }
        let val = eval_with_env(&args[i + 1], env)?;
        match key.as_str() {
            "from-end" => {
                from_end = truthy(&val);
            }
            "start" => {
                start = parse_index(&val, "start")?.unwrap_or(0);
            }
            "end" => {
                end = parse_index(&val, "end")?;
            }
            "key" => {
                key_fn = Some(val);
            }
            "test" => {
                test_fn = Some(val);
                negate_test = false;
            }
            "test-not" => {
                test_fn = Some(val);
                negate_test = true;
            }
            _ => {}
        }
        i += 2;
    }

    let (_sequence_kind, items) = collect_sequence(&sequence)?;
    let len = items.len();
    let end_idx = end.unwrap_or(len).min(len);
    if start > end_idx {
        return Ok(EvalResult::Nil);
    }

    if from_end {
        if end_idx == 0 {
            return Ok(EvalResult::Nil);
        }
        let mut idx = end_idx as i64 - 1;
        while idx >= start as i64 {
            let elem = &items[idx as usize];
            let key_elem = if let Some(ref key) = key_fn {
                apply_key_fn(key, elem, env)?
            } else {
                elem.clone()
            };
            let mut matches = if let Some(ref test) = test_fn {
                call_test_fn(test, &item, &key_elem, env)?
            } else {
                values_equal(&item, &key_elem)
            };
            if negate_test {
                matches = !matches;
            }
            if matches {
                return Ok(EvalResult::Fixnum(idx));
            }
            idx -= 1;
        }
    } else {
        for idx in start..end_idx {
            let elem = &items[idx];
            let key_elem = if let Some(ref key) = key_fn {
                apply_key_fn(key, elem, env)?
            } else {
                elem.clone()
            };
            let mut matches = if let Some(ref test) = test_fn {
                call_test_fn(test, &item, &key_elem, env)?
            } else {
                values_equal(&item, &key_elem)
            };
            if negate_test {
                matches = !matches;
            }
            if matches {
                return Ok(EvalResult::Fixnum(idx as i64));
            }
        }
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_search(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (search seq1 seq2) - find position of seq1 as subsequence in seq2
    if args.len() < 2 {
        return Err("search requires 2 arguments (seq1 seq2)".to_string());
    }

    let seq1 = eval_with_env(&args[0], env)?;
    let seq2 = eval_with_env(&args[1], env)?;

    // Handle string search
    if let (EvalResult::String(s1), EvalResult::String(s2)) = (&seq1, &seq2) {
        if let Some(pos) = s2.find(s1.as_str()) {
            return Ok(EvalResult::Fixnum(pos as i64));
        }
        return Ok(EvalResult::Nil);
    }

    // Handle list search - find seq1 as subsequence of seq2
    // Convert seq1 to a vector for matching
    let mut needle: Vec<EvalResult> = Vec::new();
    let mut cur1 = seq1.clone();
    loop {
        match cur1 {
            EvalResult::Cons(car, cdr) => {
                needle.push(car.borrow().clone());
                cur1 = cdr.borrow().clone();
            }
            EvalResult::Nil => break,
            _ => break,
        }
    }

    if needle.is_empty() {
        return Ok(EvalResult::Fixnum(0));
    }

    // Search in seq2
    // Helper function to check if needle matches at current position
    fn matches_at(start: &EvalResult, needle: &[EvalResult]) -> bool {
        let mut cur = start.clone();
        for needle_elem in needle {
            match cur {
                EvalResult::Cons(mcar, mcdr) => {
                    if !values_equal(&mcar.borrow(), needle_elem) {
                        return false;
                    }
                    cur = mcdr.borrow().clone();
                }
                _ => return false,
            }
        }
        true
    }

    let mut pos = 0i64;
    let mut cur2 = seq2.clone();
    loop {
        let next = match &cur2 {
            EvalResult::Cons(_, cdr) => Some(cdr.borrow().clone()),
            _ => None,
        };

        if matches_at(&cur2, &needle) {
            return Ok(EvalResult::Fixnum(pos));
        }

        match next {
            Some(n) => {
                cur2 = n;
                pos += 1;
            }
            None => break,
        }
    }
    Ok(EvalResult::Nil)
}

pub(super) fn eval_count(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("count requires at least 2 arguments (item sequence)".to_string());
    }

    fn truthy(v: &EvalResult) -> bool {
        !matches!(v, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false))
    }

    fn eval_non_negative_index(ast: &ASTNode, env: &mut HashMap<String, EvalResult>) -> Result<usize, String> {
        match super::eval_types::primary_value(eval_with_env(ast, env)?) {
            EvalResult::Fixnum(n) if n >= 0 => Ok(n as usize),
            EvalResult::Bignum(ref b) => b.to_string().parse::<usize>().map_err(|_| "count: index must be a non-negative integer".to_string()),
            _ => Err("count: index must be a non-negative integer".to_string()),
        }
    }

    let item = super::eval_types::primary_value(eval_with_env(&args[0], env)?);
    let sequence = super::eval_types::primary_value(eval_with_env(&args[1], env)?);
    let mut test_fn: Option<EvalResult> = None;
    let mut test_not_fn: Option<EvalResult> = None;
    let mut key_fn: Option<EvalResult> = None;
    let mut start: usize = 0;
    let mut end: Option<usize> = None;

    let mut i = 2;
    while i + 1 < args.len() {
        let key = match super::eval_types::primary_value(eval_with_env(&args[i], env)?) {
            EvalResult::Symbol(s) => s.rsplit(':').next().unwrap_or(&s).trim_start_matches(':').to_ascii_lowercase(),
            _ => {
                i += 1;
                continue;
            }
        };
        match key.as_str() {
            "test" => test_fn = Some(super::eval_types::primary_value(eval_with_env(&args[i + 1], env)?)),
            "test-not" => test_not_fn = Some(super::eval_types::primary_value(eval_with_env(&args[i + 1], env)?)),
            "key" => key_fn = Some(super::eval_types::primary_value(eval_with_env(&args[i + 1], env)?)),
            "start" => start = eval_non_negative_index(&args[i + 1], env)?,
            "end" => {
                let v = super::eval_types::primary_value(eval_with_env(&args[i + 1], env)?);
                end = match v {
                    EvalResult::Nil => None,
                    EvalResult::Fixnum(n) if n >= 0 => Some(n as usize),
                    EvalResult::Bignum(b) => b.to_string().parse::<usize>().ok(),
                    _ => return Err("count: :end must be NIL or a non-negative integer".to_string()),
                };
            }
            _ => {}
        }
        i += 2;
    }

    let mut matches_item = |elem: EvalResult| -> Result<bool, String> {
        let probe = if let Some(keyf) = &key_fn {
            super::eval_types::primary_value(call_function_with_values(keyf.clone(), &[elem], env)?)
        } else {
            elem
        };
        if let Some(tf) = &test_fn {
            let r = super::eval_types::primary_value(call_function_with_values(tf.clone(), &[item.clone(), probe], env)?);
            Ok(truthy(&r))
        } else if let Some(tn) = &test_not_fn {
            let r = super::eval_types::primary_value(call_function_with_values(tn.clone(), &[item.clone(), probe], env)?);
            Ok(!truthy(&r))
        } else {
            Ok(values_equal(&item, &probe))
        }
    };

    let mut count = 0i64;
    match sequence {
        EvalResult::Nil | EvalResult::Cons(_, _) => {
            let mut idx = 0usize;
            let stop = end.unwrap_or(usize::MAX);
            let mut current = sequence;
            loop {
                match current {
                    EvalResult::Nil => break,
                    EvalResult::Cons(car, cdr) => {
                        if idx >= start && idx < stop && matches_item(car.borrow().clone())? {
                            count += 1;
                        }
                        idx += 1;
                        current = cdr.borrow().clone();
                    }
                    _ => return Err("count: second argument must be a proper sequence".to_string()),
                }
            }
        }
        EvalResult::String(s) => {
            let chars: Vec<char> = s.chars().collect();
            let stop = end.unwrap_or(chars.len()).min(chars.len());
            let begin = start.min(stop);
            for ch in chars.into_iter().skip(begin).take(stop - begin) {
                if matches_item(EvalResult::Character(ch))? {
                    count += 1;
                }
            }
        }
        EvalResult::Array(arr) => {
            let vals = arr.borrow();
            let stop = end.unwrap_or(vals.len()).min(vals.len());
            let begin = start.min(stop);
            for elem in vals.iter().skip(begin).take(stop - begin) {
                if matches_item(elem.clone())? {
                    count += 1;
                }
            }
        }
        _ => return Err("count: second argument must be a sequence".to_string()),
    }

    Ok(EvalResult::Fixnum(count))
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
            EvalResult::Bignum(_) => {
                // Bignum count is always >= list length, return NIL
                return Ok(EvalResult::Nil);
            }
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

    if let EvalResult::String(s) = sequence {
        let chars: Vec<char> = s.chars().collect();
        let end_idx = end.unwrap_or(chars.len()).min(chars.len());
        if start > end_idx {
            return Err("subseq: invalid start/end indices".to_string());
        }
        let subseq: String = chars[start..end_idx].iter().collect();
        return Ok(EvalResult::String(subseq));
    }
    if let EvalResult::Array(arr) = sequence {
        let arr_ref = arr.borrow();
        let end_idx = end.unwrap_or(arr_ref.len()).min(arr_ref.len());
        if start > end_idx {
            return Err("subseq: invalid start/end indices".to_string());
        }
        let slice = &arr_ref[start..end_idx];
        if slice.iter().all(|e| matches!(e, EvalResult::Character(_))) {
            let mut s = String::new();
            for elem in slice {
                if let EvalResult::Character(c) = elem {
                    s.push(*c);
                }
            }
            return Ok(EvalResult::String(s));
        }
        return Ok(EvalResult::Array(Rc::new(RefCell::new(slice.to_vec()))));
    }

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
            _ => return Err("subseq: first argument must be a list or string".to_string()),
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
        // Call the function with (function accumulator element)
        accumulator = call_function_with_values(
            function.clone(),
            &[accumulator.clone(), elem.clone()],
            env
        )?;
    }

    Ok(accumulator)
}

/// (set-difference list1 list2 &key test key)
/// Returns elements in list1 that are not in list2
pub(super) fn eval_set_difference(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("set-difference requires at least 2 arguments".to_string());
    }

    let list1 = eval_with_env(&args[0], env)?;
    let list2 = eval_with_env(&args[1], env)?;

    // Convert lists to vectors
    let mut elems1 = Vec::new();
    let mut current = list1;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elems1.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("set-difference: first argument must be a list".to_string()),
        }
    }

    let mut elems2 = Vec::new();
    current = list2;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elems2.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("set-difference: second argument must be a list".to_string()),
        }
    }

    // Filter elements in list1 that are not in list2
    let mut result_vec = Vec::new();
    for elem in elems1 {
        let found = elems2.iter().any(|e| results_equal(&elem, e));
        if !found {
            result_vec.push(elem);
        }
    }

    // Build result list
    let mut result = EvalResult::Nil;
    for item in result_vec.iter().rev() {
        result = EvalResult::Cons(Rc::new(RefCell::new(item.clone())), Rc::new(RefCell::new(result)));
    }

    Ok(result)
}

fn results_equal(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Boolean(x), EvalResult::Boolean(y)) => x == y,
        (EvalResult::Fixnum(x), EvalResult::Fixnum(y)) => x == y,
        (EvalResult::Float(x), EvalResult::Float(y)) => (x - y).abs() < f64::EPSILON,
        (EvalResult::String(x), EvalResult::String(y)) => x == y,
        (EvalResult::Symbol(x), EvalResult::Symbol(y)) => x == y,
        (EvalResult::Character(x), EvalResult::Character(y)) => x == y,
        _ => false,
    }
}

/// (intersection list1 list2 &key test key)
/// Returns elements common to both lists
pub(super) fn eval_intersection(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("intersection requires at least 2 arguments".to_string());
    }

    let list1 = eval_with_env(&args[0], env)?;
    let list2 = eval_with_env(&args[1], env)?;

    // Convert lists to vectors
    let mut elems1 = Vec::new();
    let mut current = list1;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elems1.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("intersection: first argument must be a list".to_string()),
        }
    }

    let mut elems2 = Vec::new();
    current = list2;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elems2.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("intersection: second argument must be a list".to_string()),
        }
    }

    // Filter elements in list1 that are also in list2
    let mut result_vec = Vec::new();
    for elem in elems1 {
        let found = elems2.iter().any(|e| results_equal(&elem, e));
        if found {
            result_vec.push(elem);
        }
    }

    // Build result list
    let mut result = EvalResult::Nil;
    for item in result_vec.iter().rev() {
        result = EvalResult::Cons(Rc::new(RefCell::new(item.clone())), Rc::new(RefCell::new(result)));
    }

    Ok(result)
}

/// (union list1 list2 &key test key)
/// Returns elements that are in either list, without duplicates
pub(super) fn eval_union(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("union requires at least 2 arguments".to_string());
    }

    let list1 = eval_with_env(&args[0], env)?;
    let list2 = eval_with_env(&args[1], env)?;

    // Convert lists to vectors
    let mut elems1 = Vec::new();
    let mut current = list1;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elems1.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("union: first argument must be a list".to_string()),
        }
    }

    let mut elems2 = Vec::new();
    current = list2;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                elems2.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("union: second argument must be a list".to_string()),
        }
    }

    // Start with all elements from list1
    let mut result_vec = elems1.clone();

    // Add elements from list2 that are not in list1
    for elem in elems2 {
        let found = result_vec.iter().any(|e| results_equal(&elem, e));
        if !found {
            result_vec.push(elem);
        }
    }

    // Build result list
    let mut result = EvalResult::Nil;
    for item in result_vec.iter().rev() {
        result = EvalResult::Cons(Rc::new(RefCell::new(item.clone())), Rc::new(RefCell::new(result)));
    }

    Ok(result)
}

/// (mismatch seq1 seq2 &key test key start1 end1 start2 end2 from-end)
/// Returns the index of the first position where sequences differ, or NIL if equal
pub(super) fn eval_mismatch(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("mismatch requires at least 2 arguments".to_string());
    }

    let seq1 = eval_with_env(&args[0], env)?;
    let seq2 = eval_with_env(&args[1], env)?;

    // Parse keyword arguments
    let mut start1: usize = 0;
    let mut end1: Option<usize> = None;
    let mut start2: usize = 0;
    let mut end2: Option<usize> = None;
    let mut test_fn: Option<EvalResult> = None;
    let mut key_fn: Option<EvalResult> = None;
    let mut from_end = false;

    let mut i = 2;
    while i + 1 < args.len() {
        if let ASTNode::Variable(kw) = &args[i] {
            let kw_lower = kw.to_lowercase();
            match kw_lower.as_str() {
                ":start1" | "start1" => {
                    if let EvalResult::Fixnum(n) = eval_with_env(&args[i + 1], env)? {
                        start1 = n as usize;
                    }
                }
                ":end1" | "end1" => {
                    let v = eval_with_env(&args[i + 1], env)?;
                    if let EvalResult::Fixnum(n) = v {
                        end1 = Some(n as usize);
                    }
                }
                ":start2" | "start2" => {
                    if let EvalResult::Fixnum(n) = eval_with_env(&args[i + 1], env)? {
                        start2 = n as usize;
                    }
                }
                ":end2" | "end2" => {
                    let v = eval_with_env(&args[i + 1], env)?;
                    if let EvalResult::Fixnum(n) = v {
                        end2 = Some(n as usize);
                    }
                }
                ":test" | "test" => {
                    test_fn = Some(eval_with_env(&args[i + 1], env)?);
                }
                ":key" | "key" => {
                    let v = eval_with_env(&args[i + 1], env)?;
                    if !matches!(v, EvalResult::Nil) {
                        key_fn = Some(v);
                    }
                }
                ":from-end" | "from-end" => {
                    let v = eval_with_env(&args[i + 1], env)?;
                    from_end = !matches!(v, EvalResult::Nil | EvalResult::Boolean(false));
                }
                _ => {}
            }
            i += 2;
        } else {
            i += 1;
        }
    }

    // Collect sequences
    let (_, items1) = collect_sequence(&seq1)?;
    let (_, items2) = collect_sequence(&seq2)?;

    let end1 = end1.unwrap_or(items1.len()).min(items1.len());
    let end2 = end2.unwrap_or(items2.len()).min(items2.len());

    let slice1: Vec<_> = items1[start1..end1].to_vec();
    let slice2: Vec<_> = items2[start2..end2].to_vec();

    // Compare elements
    let mut compare_items = |idx1: usize, idx2: usize| -> Result<bool, String> {
        let elem1 = &slice1[idx1];
        let elem2 = &slice2[idx2];

        // Apply key function if present
        let val1 = if let Some(ref kf) = key_fn {
            apply_function(kf, &[elem1.clone()], env)?
        } else {
            elem1.clone()
        };
        let val2 = if let Some(ref kf) = key_fn {
            apply_function(kf, &[elem2.clone()], env)?
        } else {
            elem2.clone()
        };

        // Compare using test function or default eql
        if let Some(ref tf) = test_fn {
            let result = apply_function(tf, &[val1, val2], env)?;
            Ok(!matches!(result, EvalResult::Nil | EvalResult::Boolean(false)))
        } else {
            Ok(values_equal(&val1, &val2))
        }
    };

    let len1 = slice1.len();
    let len2 = slice2.len();
    let min_len = len1.min(len2);

    if from_end {
        // Compare from end
        for i in 0..min_len {
            let idx1 = len1 - 1 - i;
            let idx2 = len2 - 1 - i;
            if !compare_items(idx1, idx2)? {
                return Ok(EvalResult::Fixnum((start1 + idx1) as i64));
            }
        }
        // If lengths differ, return position of length difference
        if len1 != len2 {
            if len1 > len2 {
                return Ok(EvalResult::Fixnum((start1 + len1 - min_len - 1) as i64));
            } else {
                return Ok(EvalResult::Fixnum(start1 as i64));
            }
        }
    } else {
        // Compare from start
        for i in 0..min_len {
            if !compare_items(i, i)? {
                return Ok(EvalResult::Fixnum((start1 + i) as i64));
            }
        }
        // If lengths differ, return position after common prefix
        if len1 != len2 {
            return Ok(EvalResult::Fixnum((start1 + min_len) as i64));
        }
    }

    // Sequences are equal
    Ok(EvalResult::Nil)
}

// --- Phase 3A: Missing list functions ---

pub(super) fn eval_adjoin(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (adjoin item list &key :test :key) - add item to list if not already present
    if args.len() < 2 {
        return Err("adjoin requires at least 2 arguments".to_string());
    }
    let item = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    // Parse keyword args
    let mut test_fn: Option<EvalResult> = None;
    let mut key_fn: Option<EvalResult> = None;
    let mut i = 2;
    while i + 1 < args.len() {
        let key = match eval_with_env(&args[i], env)? {
            EvalResult::Symbol(s) => s.to_uppercase(),
            _ => { i += 1; continue; }
        };
        let val = eval_with_env(&args[i + 1], env)?;
        match key.as_str() {
            ":TEST" => test_fn = Some(val),
            ":KEY" => if !matches!(val, EvalResult::Nil) { key_fn = Some(val); },
            _ => {}
        }
        i += 2;
    }

    // Apply key to item
    let item_key = if let Some(ref kf) = key_fn {
        call_function_with_values(kf.clone(), &[item.clone()], env)?
    } else {
        item.clone()
    };

    // Check if item is already in list
    let mut current = list.clone();
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                let elem = car.borrow().clone();
                let elem_key = if let Some(ref kf) = key_fn {
                    call_function_with_values(kf.clone(), &[elem.clone()], env)?
                } else {
                    elem.clone()
                };
                let equal = if let Some(ref tf) = test_fn {
                    let r = call_function_with_values(tf.clone(), &[item_key.clone(), elem_key], env)?;
                    !matches!(r, EvalResult::Nil)
                } else {
                    super::eval_control::eql_values(&item_key, &elem_key)
                };
                if equal {
                    return Ok(list); // already present
                }
                current = cdr.borrow().clone();
            }
            _ => break,
        }
    }

    // Not found, cons item onto list
    Ok(EvalResult::Cons(
        Rc::new(RefCell::new(item)),
        Rc::new(RefCell::new(list)),
    ))
}

pub(super) fn eval_ldiff(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (ldiff list object) - return elements of list before object (by EQ/pointer identity)
    if args.len() < 2 {
        return Err("ldiff requires 2 arguments".to_string());
    }
    let list = eval_with_env(&args[0], env)?;
    let object = eval_with_env(&args[1], env)?;

    // Collect elements until we find object (by eq)
    let mut elements = Vec::new();
    let mut current = list.clone();
    loop {
        // Check if current is eq to object
        if super::eval_control::eq_values(&current, &object) {
            break;
        }
        match current {
            EvalResult::Cons(car, cdr) => {
                elements.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => break, // end of list
        }
    }

    // Build result list
    let mut result = EvalResult::Nil;
    for elem in elements.into_iter().rev() {
        result = EvalResult::Cons(Rc::new(RefCell::new(elem)), Rc::new(RefCell::new(result)));
    }
    Ok(result)
}

pub(super) fn eval_get_properties(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (get-properties plist indicator-list) → indicator, value, tail
    if args.len() < 2 {
        return Err("get-properties requires 2 arguments".to_string());
    }
    let plist = eval_with_env(&args[0], env)?;
    let indicators = eval_with_env(&args[1], env)?;

    // Collect indicator list
    let mut indicator_list = Vec::new();
    let mut cur = indicators;
    loop {
        match cur {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                indicator_list.push(car.borrow().clone());
                cur = cdr.borrow().clone();
            }
            _ => break,
        }
    }

    // Search plist
    let mut current = plist;
    loop {
        match current {
            EvalResult::Cons(ind_rc, rest_rc) => {
                let ind = ind_rc.borrow().clone();
                let rest = rest_rc.borrow().clone();
                match rest {
                    EvalResult::Cons(val_rc, tail_rc) => {
                        let val = val_rc.borrow().clone();
                        // Check if ind matches any indicator
                        for indicator in &indicator_list {
                            if super::eval_control::eq_values(&ind, indicator) {
                                // Return (values indicator value tail)
                                let tail = EvalResult::Cons(ind_rc.clone(), rest_rc.clone());
                                return Ok(EvalResult::MultipleValues(vec![ind, val, tail]));
                            }
                        }
                        current = tail_rc.borrow().clone();
                    }
                    _ => break,
                }
            }
            _ => break,
        }
    }

    Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Nil, EvalResult::Nil]))
}

pub(super) fn eval_member_if(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (member-if predicate list &key :key)
    if args.len() < 2 {
        return Err("member-if requires at least 2 arguments".to_string());
    }
    let pred = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    let mut key_fn: Option<EvalResult> = None;
    let mut i = 2;
    while i + 1 < args.len() {
        let key = match eval_with_env(&args[i], env)? {
            EvalResult::Symbol(s) => s.to_uppercase(),
            _ => { i += 1; continue; }
        };
        if key == ":KEY" {
            let val = eval_with_env(&args[i + 1], env)?;
            if !matches!(val, EvalResult::Nil) { key_fn = Some(val); }
        }
        i += 2;
    }

    let mut current = list;
    loop {
        match &current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                let elem = car.borrow().clone();
                let test_val = if let Some(ref kf) = key_fn {
                    call_function_with_values(kf.clone(), &[elem.clone()], env)?
                } else {
                    elem
                };
                let result = call_function_with_values(pred.clone(), &[test_val], env)?;
                if !matches!(result, EvalResult::Nil) {
                    return Ok(current);
                }
                let next = cdr.borrow().clone();
                current = next;
            }
            _ => return Ok(EvalResult::Nil),
        }
    }
}

pub(super) fn eval_member_if_not(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (member-if-not predicate list &key :key)
    if args.len() < 2 {
        return Err("member-if-not requires at least 2 arguments".to_string());
    }
    let pred = eval_with_env(&args[0], env)?;
    let list = eval_with_env(&args[1], env)?;

    let mut key_fn: Option<EvalResult> = None;
    let mut i = 2;
    while i + 1 < args.len() {
        let key = match eval_with_env(&args[i], env)? {
            EvalResult::Symbol(s) => s.to_uppercase(),
            _ => { i += 1; continue; }
        };
        if key == ":KEY" {
            let val = eval_with_env(&args[i + 1], env)?;
            if !matches!(val, EvalResult::Nil) { key_fn = Some(val); }
        }
        i += 2;
    }

    let mut current = list;
    loop {
        match &current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car, cdr) => {
                let elem = car.borrow().clone();
                let test_val = if let Some(ref kf) = key_fn {
                    call_function_with_values(kf.clone(), &[elem.clone()], env)?
                } else {
                    elem
                };
                let result = call_function_with_values(pred.clone(), &[test_val], env)?;
                if matches!(result, EvalResult::Nil) {
                    return Ok(current);
                }
                let next = cdr.borrow().clone();
                current = next;
            }
            _ => return Ok(EvalResult::Nil),
        }
    }
}
