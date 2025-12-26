/// Arithmetic and comparison operations

use super::eval_types::{EvalResult, primary_value};
use super::eval_core::eval_with_env;
use crate::ir::ASTNode;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

pub(super) fn eval_add_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    let mut sum_int: i64 = 0;
    let mut sum_float: f64 = 0.0;
    let mut has_float = false;

    for arg in args {
        let val = primary_value(eval_with_env(arg, env)?);
        match val {
            EvalResult::Fixnum(n) => {
                sum_int += n;
                sum_float += n as f64;
            }
            EvalResult::Float(f) => {
                has_float = true;
                sum_float += f;
            }
            EvalResult::Nil => {
                // Treat nil as 0 (runtime limitation: nil == fixnum 0)
                // Don't add anything
            }
            _ => return Err("+ requires numeric arguments".to_string()),
        }
    }

    if has_float {
        Ok(EvalResult::Float(sum_float))
    } else {
        Ok(EvalResult::Fixnum(sum_int))
    }
}

pub(super) fn eval_sub_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("- requires at least one argument".to_string());
    }

    let first = eval_with_env(&args[0], env)?;
    let (mut result_int, mut result_float, mut has_float) = match first {
        EvalResult::Fixnum(n) => (n, n as f64, false),
        EvalResult::Float(f) => (0, f, true),
        EvalResult::Nil => (0, 0.0, false), // Treat nil as 0 (runtime limitation)
        _ => return Err("- requires numeric arguments".to_string()),
    };

    if args.len() == 1 {
        return if has_float {
            Ok(EvalResult::Float(-result_float))
        } else {
            Ok(EvalResult::Fixnum(-result_int))
        };
    }

    for arg in &args[1..] {
        match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => {
                result_int -= n;
                result_float -= n as f64;
            }
            EvalResult::Float(f) => {
                has_float = true;
                result_float -= f;
            }
            EvalResult::Nil => {
                // Treat nil as 0 (runtime limitation: nil == fixnum 0)
                // Don't subtract anything
            }
            _ => return Err("- requires numeric arguments".to_string()),
        }
    }

    if has_float {
        Ok(EvalResult::Float(result_float))
    } else {
        Ok(EvalResult::Fixnum(result_int))
    }
}

pub(super) fn eval_mul_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    let mut product_int: i64 = 1;
    let mut product_float: f64 = 1.0;
    let mut has_float = false;

    for arg in args {
        match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => {
                product_int *= n;
                product_float *= n as f64;
            }
            EvalResult::Float(f) => {
                has_float = true;
                product_float *= f;
            }
            _ => return Err("* requires numeric arguments".to_string()),
        }
    }

    if has_float {
        Ok(EvalResult::Float(product_float))
    } else {
        Ok(EvalResult::Fixnum(product_int))
    }
}

pub(super) fn eval_div_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("/ requires at least one argument".to_string());
    }

    let first = eval_with_env(&args[0], env)?;
    let mut result = match first {
        EvalResult::Fixnum(n) => n as f64,
        EvalResult::Float(f) => f,
        _ => return Err("/ requires numeric arguments".to_string()),
    };

    if args.len() == 1 {
        if result == 0.0 {
            return Err("Division by zero".to_string());
        }
        return Ok(EvalResult::Float(1.0 / result));
    }

    for arg in &args[1..] {
        let divisor = match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => n as f64,
            EvalResult::Float(f) => f,
            _ => return Err("/ requires numeric arguments".to_string()),
        };
        if divisor == 0.0 {
            return Err("Division by zero".to_string());
        }
        result /= divisor;
    }

    Ok(EvalResult::Float(result))
}

pub(super) fn eval_eq_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("= requires at least two arguments".to_string());
    }
    let first = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let val = eval_with_env(arg, env)?;
        match (&first, &val) {
            (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
                if a != b {
                    return Ok(EvalResult::Nil);
                }
            }
            (EvalResult::Float(a), EvalResult::Float(b)) => {
                if (a - b).abs() > f64::EPSILON {
                    return Ok(EvalResult::Nil);
                }
            }
            (EvalResult::Fixnum(a), EvalResult::Float(b)) | (EvalResult::Float(b), EvalResult::Fixnum(a)) => {
                if (*a as f64 - b).abs() > f64::EPSILON {
                    return Ok(EvalResult::Nil);
                }
            }
            // Treat nil as 0 (runtime limitation: nil == fixnum 0)
            (EvalResult::Nil, EvalResult::Fixnum(b)) | (EvalResult::Fixnum(b), EvalResult::Nil) => {
                if *b != 0 {
                    return Ok(EvalResult::Nil);
                }
            }
            (EvalResult::Nil, EvalResult::Float(b)) | (EvalResult::Float(b), EvalResult::Nil) => {
                if b.abs() > f64::EPSILON {
                    return Ok(EvalResult::Nil);
                }
            }
            (EvalResult::Nil, EvalResult::Nil) => {
                // Both nil, considered equal to 0
            }
            _ => return Err("= requires numeric arguments".to_string()),
        }
    }
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_ne_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("/= requires at least two arguments".to_string());
    }
    // /= returns true if no two arguments are equal
    for i in 0..args.len() {
        for j in i+1..args.len() {
            let val_i = eval_with_env(&args[i], env)?;
            let val_j = eval_with_env(&args[j], env)?;
            match (&val_i, &val_j) {
                (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
                    if a == b {
                        return Ok(EvalResult::Nil);
                    }
                }
                (EvalResult::Float(a), EvalResult::Float(b)) => {
                    if (a - b).abs() <= f64::EPSILON {
                        return Ok(EvalResult::Nil);
                    }
                }
                (EvalResult::Fixnum(a), EvalResult::Float(b)) | (EvalResult::Float(b), EvalResult::Fixnum(a)) => {
                    if (*a as f64 - b).abs() <= f64::EPSILON {
                        return Ok(EvalResult::Nil);
                    }
                }
                (EvalResult::Nil, EvalResult::Fixnum(b)) | (EvalResult::Fixnum(b), EvalResult::Nil) => {
                    if *b == 0 {
                        return Ok(EvalResult::Nil);
                    }
                }
                (EvalResult::Nil, EvalResult::Float(b)) | (EvalResult::Float(b), EvalResult::Nil) => {
                    if b.abs() <= f64::EPSILON {
                        return Ok(EvalResult::Nil);
                    }
                }
                (EvalResult::Nil, EvalResult::Nil) => {
                    return Ok(EvalResult::Nil);
                }
                _ => return Err("/= requires numeric arguments".to_string()),
            }
        }
    }
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_eq_lisp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("eq requires exactly 2 arguments".to_string());
    }
    let first = eval_with_env(&args[0], env)?;
    let second = eval_with_env(&args[1], env)?;

    let result = match (&first, &second) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a == b,
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a == b,
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        _ => false,
    };

    if result {
        Ok(EvalResult::Bool(true))
    } else {
        Ok(EvalResult::Nil)
    }
}

pub(super) fn eval_lt_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("< requires at least two arguments".to_string());
    }
    let mut prev = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let curr = eval_with_env(arg, env)?;
        let cmp = match (&prev, &curr) {
            (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a < b,
            (EvalResult::Float(a), EvalResult::Float(b)) => a < b,
            (EvalResult::Fixnum(a), EvalResult::Float(b)) => (*a as f64) < *b,
            (EvalResult::Float(a), EvalResult::Fixnum(b)) => *a < (*b as f64),
            _ => return Err("< requires numeric arguments".to_string()),
        };
        if !cmp {
            return Ok(EvalResult::Nil);
        }
        prev = curr;
    }
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_gt_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("> requires at least two arguments".to_string());
    }
    let mut prev = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let curr = eval_with_env(arg, env)?;
        let cmp = match (&prev, &curr) {
            (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a > b,
            (EvalResult::Float(a), EvalResult::Float(b)) => a > b,
            (EvalResult::Fixnum(a), EvalResult::Float(b)) => (*a as f64) > *b,
            (EvalResult::Float(a), EvalResult::Fixnum(b)) => *a > (*b as f64),
            _ => return Err("> requires numeric arguments".to_string()),
        };
        if !cmp {
            return Ok(EvalResult::Nil);
        }
        prev = curr;
    }
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_le_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("<= requires at least two arguments".to_string());
    }
    let mut prev = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let curr = eval_with_env(arg, env)?;
        let cmp = match (&prev, &curr) {
            (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a <= b,
            (EvalResult::Float(a), EvalResult::Float(b)) => a <= b,
            (EvalResult::Fixnum(a), EvalResult::Float(b)) => (*a as f64) <= *b,
            (EvalResult::Float(a), EvalResult::Fixnum(b)) => *a <= (*b as f64),
            _ => return Err("<= requires numeric arguments".to_string()),
        };
        if !cmp {
            return Ok(EvalResult::Nil);
        }
        prev = curr;
    }
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_ge_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err(">= requires at least two arguments".to_string());
    }
    let mut prev = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let curr = eval_with_env(arg, env)?;
        let cmp = match (&prev, &curr) {
            (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a >= b,
            (EvalResult::Float(a), EvalResult::Float(b)) => a >= b,
            (EvalResult::Fixnum(a), EvalResult::Float(b)) => (*a as f64) >= *b,
            (EvalResult::Float(a), EvalResult::Fixnum(b)) => *a >= (*b as f64),
            _ => return Err(">= requires numeric arguments".to_string()),
        };
        if !cmp {
            return Ok(EvalResult::Nil);
        }
        prev = curr;
    }
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_one_plus(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("1+ requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => Ok(EvalResult::Fixnum(n + 1)),
        EvalResult::Float(f) => Ok(EvalResult::Float(f + 1.0)),
        EvalResult::Nil => Ok(EvalResult::Fixnum(1)), // Treat nil as 0 (runtime limitation)
        _ => Err("1+ requires a number".to_string()),
    }
}

pub(super) fn eval_one_minus(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("1- requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => Ok(EvalResult::Fixnum(n - 1)),
        EvalResult::Float(f) => Ok(EvalResult::Float(f - 1.0)),
        EvalResult::Nil => Ok(EvalResult::Fixnum(-1)), // Treat nil as 0 (runtime limitation)
        _ => Err("1- requires a number".to_string()),
    }
}

pub(super) fn eval_int(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("int requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => Ok(EvalResult::Fixnum(n)),
        EvalResult::Float(f) => {
            if f.is_finite() && f >= i64::MIN as f64 && f <= i64::MAX as f64 {
                Ok(EvalResult::Fixnum(f as i64))
            } else {
                Err("int: value out of range".to_string())
            }
        }
        _ => Err("int: not a number".to_string()),
    }
}

pub(super) fn eval_zerop(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("zerop requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(0) => Ok(EvalResult::Bool(true)),
        EvalResult::Float(f) if f == 0.0 => Ok(EvalResult::Bool(true)),
        EvalResult::Nil => Ok(EvalResult::Bool(true)), // Treat nil as 0 (runtime limitation: nil == fixnum 0)
        EvalResult::Fixnum(_) | EvalResult::Float(_) => Ok(EvalResult::Nil),
        _ => Err("zerop requires a number".to_string()),
    }
}

pub(super) fn eval_plusp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("plusp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) if n > 0 => Ok(EvalResult::Bool(true)),
        EvalResult::Float(f) if f > 0.0 => Ok(EvalResult::Bool(true)),
        EvalResult::Nil => Ok(EvalResult::Nil), // Treat nil as 0 (runtime limitation)
        EvalResult::Fixnum(_) | EvalResult::Float(_) => Ok(EvalResult::Nil),
        _ => Err("plusp requires a number".to_string()),
    }
}

pub(super) fn eval_minusp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("minusp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) if n < 0 => Ok(EvalResult::Bool(true)),
        EvalResult::Float(f) if f < 0.0 => Ok(EvalResult::Bool(true)),
        EvalResult::Nil => Ok(EvalResult::Nil), // Treat nil as 0 (runtime limitation)
        EvalResult::Fixnum(_) | EvalResult::Float(_) => Ok(EvalResult::Nil),
        _ => Err("minusp requires a number".to_string()),
    }
}

pub(super) fn eval_numberp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("numberp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(_) | EvalResult::Float(_) => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_mod(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("mod requires exactly 2 arguments".to_string());
    }
    let a = eval_with_env(&args[0], env)?;
    let b = eval_with_env(&args[1], env)?;
    match (a, b) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
            if b == 0 {
                return Err("Division by zero".to_string());
            }
            Ok(EvalResult::Fixnum(a.rem_euclid(b)))
        }
        (EvalResult::Float(a), EvalResult::Float(b)) => {
            if b == 0.0 {
                return Err("Division by zero".to_string());
            }
            // Common Lisp mod for floats: a - b * floor(a/b)
            Ok(EvalResult::Float(a - b * (a / b).floor()))
        }
        (EvalResult::Fixnum(a), EvalResult::Float(b)) => {
            if b == 0.0 {
                return Err("Division by zero".to_string());
            }
            let a = a as f64;
            Ok(EvalResult::Float(a - b * (a / b).floor()))
        }
        (EvalResult::Float(a), EvalResult::Fixnum(b)) => {
            if b == 0 {
                return Err("Division by zero".to_string());
            }
            let b = b as f64;
            Ok(EvalResult::Float(a - b * (a / b).floor()))
        }
        _ => Err("mod requires numeric arguments".to_string()),
    }
}

pub(super) fn eval_rem(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("rem requires exactly 2 arguments".to_string());
    }
    let a = eval_with_env(&args[0], env)?;
    let b = eval_with_env(&args[1], env)?;
    match (a, b) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
            if b == 0 {
                return Err("Division by zero".to_string());
            }
            Ok(EvalResult::Fixnum(a % b))
        }
        _ => Err("rem requires integer arguments".to_string()),
    }
}

pub(super) fn eval_floor(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() || args.len() > 2 {
        return Err("floor requires 1 or 2 arguments".to_string());
    }
    let num = eval_with_env(&args[0], env)?;
    let divisor = if args.len() == 2 {
        Some(eval_with_env(&args[1], env)?)
    } else {
        None
    };

    match (num, divisor) {
        (EvalResult::Fixnum(n), None) => Ok(EvalResult::Fixnum(n)),
        (EvalResult::Float(n), None) => Ok(EvalResult::Fixnum(n.floor() as i64)),
        (EvalResult::Fixnum(n), Some(EvalResult::Fixnum(d))) => {
            if d == 0 {
                return Err("Division by zero".to_string());
            }
            Ok(EvalResult::Fixnum(n / d))
        }
        _ => Err("floor type mismatch".to_string()),
    }
}

pub(super) fn eval_ceiling(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() || args.len() > 2 {
        return Err("ceiling requires 1 or 2 arguments".to_string());
    }
    let num = eval_with_env(&args[0], env)?;
    let divisor = if args.len() == 2 {
        Some(eval_with_env(&args[1], env)?)
    } else {
        None
    };

    match (num, divisor) {
        (EvalResult::Fixnum(n), None) => Ok(EvalResult::Fixnum(n)),
        (EvalResult::Float(n), None) => Ok(EvalResult::Fixnum(n.ceil() as i64)),
        (EvalResult::Fixnum(n), Some(EvalResult::Fixnum(d))) => {
            if d == 0 {
                return Err("Division by zero".to_string());
            }
            let result = (n as f64 / d as f64).ceil() as i64;
            Ok(EvalResult::Fixnum(result))
        }
        _ => Err("ceiling type mismatch".to_string()),
    }
}

pub(super) fn eval_ash(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (ash integer count) - arithmetic shift left/right
    // If count is positive, shift left; if negative, shift right
    if args.len() != 2 {
        return Err("ash requires 2 arguments (integer count)".to_string());
    }

    let num = eval_with_env(&args[0], env)?;
    let count = eval_with_env(&args[1], env)?;

    match (num, count) {
        (EvalResult::Fixnum(n), EvalResult::Fixnum(c)) => {
            if c >= 0 {
                // Shift left
                Ok(EvalResult::Fixnum(n << c))
            } else {
                // Shift right
                Ok(EvalResult::Fixnum(n >> (-c)))
            }
        }
        _ => Err("ash requires integer arguments".to_string()),
    }
}

pub(super) fn eval_logbitp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (logbitp index integer) - test if bit at index is set
    if args.len() != 2 {
        return Err("logbitp requires 2 arguments (index integer)".to_string());
    }

    let index = eval_with_env(&args[0], env)?;
    let integer = eval_with_env(&args[1], env)?;

    match (index, integer) {
        (EvalResult::Fixnum(i), EvalResult::Fixnum(n)) => {
            if i < 0 || i >= 64 {
                return Err("logbitp: index out of range".to_string());
            }
            let bit_set = (n & (1 << i)) != 0;
            Ok(EvalResult::Bool(bit_set))
        }
        _ => Err("logbitp requires integer arguments".to_string()),
    }
}

pub(super) fn eval_sqrt(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("sqrt requires 1 argument".to_string());
    }

    let val = primary_value(eval_with_env(&args[0], env)?);

    let num = match val {
        EvalResult::Fixnum(n) => n as f64,
        EvalResult::Float(f) => f,
        _ => return Err("sqrt requires a numeric argument".to_string()),
    };

    if num < 0.0 {
        return Err("sqrt: negative argument not supported".to_string());
    }

    Ok(EvalResult::Float(num.sqrt()))
}

pub(super) fn eval_complex(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (complex real imaginary)
    // Returns a list representation: (complex real imag)
    if args.len() != 2 {
        return Err("complex requires 2 arguments (real and imaginary parts)".to_string());
    }

    let real = primary_value(eval_with_env(&args[0], env)?);
    let imag = primary_value(eval_with_env(&args[1], env)?);

    // For now, return a tagged list (complex real imag)
    // This is evaluated as a special form
    Ok(EvalResult::Cons(
        Rc::new(RefCell::new(EvalResult::Symbol("complex".to_string()))),
        Rc::new(RefCell::new(EvalResult::Cons(
            Rc::new(RefCell::new(real)),
            Rc::new(RefCell::new(EvalResult::Cons(
                Rc::new(RefCell::new(imag)),
                Rc::new(RefCell::new(EvalResult::Nil)),
            ))),
        ))),
    ))
}

pub(super) fn eval_realpart(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (realpart complex-number)
    if args.len() != 1 {
        return Err("realpart requires 1 argument".to_string());
    }

    let val = primary_value(eval_with_env(&args[0], env)?);

    // Check if it's a complex number (complex real imag)
    match val {
        EvalResult::Cons(car, cdr) => {
            let car_val = car.borrow();
            if let EvalResult::Symbol(s) = &*car_val {
                if s == "complex" {
                    // Extract real part (second element)
                    let cdr_val = cdr.borrow();
                    if let EvalResult::Cons(real_cell, _) = &*cdr_val {
                        return Ok(real_cell.borrow().clone());
                    }
                }
            }
            Err("realpart: argument is not a complex number".to_string())
        }
        // If it's a real number, return it as-is
        EvalResult::Fixnum(_) | EvalResult::Float(_) => Ok(val),
        _ => Err("realpart requires a number".to_string()),
    }
}

pub(super) fn eval_ratio(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (ratio numerator denominator)
    // Returns a ratio represented as a tagged list
    if args.len() != 2 {
        return Err("ratio requires 2 arguments (numerator and denominator)".to_string());
    }

    let num = primary_value(eval_with_env(&args[0], env)?);
    let denom = primary_value(eval_with_env(&args[1], env)?);

    // Return a tagged list (ratio num denom)
    Ok(EvalResult::Cons(
        Rc::new(RefCell::new(EvalResult::Symbol("ratio".to_string()))),
        Rc::new(RefCell::new(EvalResult::Cons(
            Rc::new(RefCell::new(num)),
            Rc::new(RefCell::new(EvalResult::Cons(
                Rc::new(RefCell::new(denom)),
                Rc::new(RefCell::new(EvalResult::Nil)),
            ))),
        ))),
    ))
}

pub(super) fn eval_numerator(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (numerator ratio)
    // Returns the numerator of a ratio
    if args.is_empty() {
        return Err("numerator requires an argument".to_string());
    }

    let arg = primary_value(eval_with_env(&args[0], env)?);

    // Check if it's a ratio (tagged list starting with 'ratio)
    if let EvalResult::Cons(car, cdr) = &arg {
        let car_val = car.borrow();
        if let EvalResult::Symbol(s) = &*car_val {
            if s == "ratio" {
                // Extract numerator (second element)
                let cdr_val = cdr.borrow();
                if let EvalResult::Cons(num_cell, _) = &*cdr_val {
                    return Ok(num_cell.borrow().clone());
                }
            }
        }
    }

    // If it's not a ratio, it's an integer with denominator 1
    Ok(arg)
}

pub(super) fn eval_denominator(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (denominator ratio)
    // Returns the denominator of a ratio
    if args.is_empty() {
        return Err("denominator requires an argument".to_string());
    }

    let arg = primary_value(eval_with_env(&args[0], env)?);

    // Check if it's a ratio (tagged list starting with 'ratio)
    if let EvalResult::Cons(car, cdr) = &arg {
        let car_val = car.borrow();
        if let EvalResult::Symbol(s) = &*car_val {
            if s == "ratio" {
                // Extract denominator (third element)
                let cdr_val = cdr.borrow();
                if let EvalResult::Cons(_, denom_list) = &*cdr_val {
                    let denom_list_val = denom_list.borrow();
                    if let EvalResult::Cons(denom_cell, _) = &*denom_list_val {
                        return Ok(denom_cell.borrow().clone());
                    }
                }
            }
        }
    }

    // If it's not a ratio, denominator is 1
    Ok(EvalResult::Fixnum(1))
}

pub(super) fn eval_imagpart(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (imagpart complex-number)
    if args.len() != 1 {
        return Err("imagpart requires 1 argument".to_string());
    }

    let val = primary_value(eval_with_env(&args[0], env)?);

    // Check if it's a complex number (complex real imag)
    match val {
        EvalResult::Cons(car, cdr) => {
            let car_val = car.borrow();
            if let EvalResult::Symbol(s) = &*car_val {
                if s == "complex" {
                    // Extract imaginary part (third element)
                    let cdr_val = cdr.borrow();
                    if let EvalResult::Cons(_, imag_cons) = &*cdr_val {
                        let imag_cons_val = imag_cons.borrow();
                        if let EvalResult::Cons(imag_cell, _) = &*imag_cons_val {
                            return Ok(imag_cell.borrow().clone());
                        }
                    }
                }
            }
            Err("imagpart: argument is not a complex number".to_string())
        }
        // If it's a real number, return 0
        EvalResult::Fixnum(_) | EvalResult::Float(_) => Ok(EvalResult::Fixnum(0)),
        _ => Err("imagpart requires a number".to_string()),
    }
}
