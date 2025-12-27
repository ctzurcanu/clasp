/// Arithmetic and comparison operations

use super::eval_types::{EvalResult, primary_value};
use super::eval_core::eval_with_env;
use crate::ir::ASTNode;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;
use malachite::Integer;
use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

pub(super) fn eval_add_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use malachite::Rational;

    let mut sum_bigint = Integer::from(0);
    let mut sum_ratio = Rational::from(0);
    let mut sum_float: f64 = 0.0;
    let mut has_float = false;
    let mut has_ratio = false;

    for arg in args {
        let val = primary_value(eval_with_env(arg, env)?);
        match val {
            EvalResult::Fixnum(n) => {
                sum_bigint += Integer::from(n);
                sum_ratio += Rational::from(n);
                sum_float += n as f64;
            }
            EvalResult::Bignum(b) => {
                sum_bigint += &b;
                sum_ratio += Rational::from(b);
            }
            EvalResult::Ratio(r) => {
                has_ratio = true;
                sum_ratio += r;
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
    } else if has_ratio {
        // Return ratio if result is not an integer
        if sum_ratio.denominator_ref() == &1 {
            let num = Integer::from(sum_ratio.numerator_ref().clone());
            if i64::convertible_from(&num) {
                Ok(EvalResult::Fixnum(i64::exact_from(&num)))
            } else {
                Ok(EvalResult::Bignum(num))
            }
        } else {
            Ok(EvalResult::Ratio(sum_ratio))
        }
    } else {
        // Try to fit in Fixnum, otherwise return Bignum
        if i64::convertible_from(&sum_bigint) {
            Ok(EvalResult::Fixnum(i64::exact_from(&sum_bigint)))
        } else {
            Ok(EvalResult::Bignum(sum_bigint))
        }
    }
}

pub(super) fn eval_sub_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use malachite::Rational;

    if args.is_empty() {
        return Err("- requires at least one argument".to_string());
    }

    let first = primary_value(eval_with_env(&args[0], env)?);
    let (mut result_bigint, mut result_ratio, mut result_float, mut has_float, mut has_ratio) = match first {
        EvalResult::Fixnum(n) => (Integer::from(n), Rational::from(n), n as f64, false, false),
        EvalResult::Bignum(b) => (b.clone(), Rational::from(b), 0.0, false, false),
        EvalResult::Ratio(r) => (Integer::from(0), r, 0.0, false, true),
        EvalResult::Float(f) => (Integer::from(0), Rational::from(0), f, true, false),
        EvalResult::Nil => (Integer::from(0), Rational::from(0), 0.0, false, false), // Treat nil as 0
        _ => return Err("- requires numeric arguments".to_string()),
    };

    if args.len() == 1 {
        return if has_float {
            Ok(EvalResult::Float(-result_float))
        } else if has_ratio {
            let neg = -result_ratio;
            if neg.denominator_ref() == &1 {
                let num = Integer::from(neg.numerator_ref().clone());
                if i64::convertible_from(&num) {
                    Ok(EvalResult::Fixnum(i64::exact_from(&num)))
                } else {
                    Ok(EvalResult::Bignum(num))
                }
            } else {
                Ok(EvalResult::Ratio(neg))
            }
        } else {
            let neg = -result_bigint;
            if i64::convertible_from(&neg) {
                Ok(EvalResult::Fixnum(i64::exact_from(&neg)))
            } else {
                Ok(EvalResult::Bignum(neg))
            }
        };
    }

    for arg in &args[1..] {
        let val = primary_value(eval_with_env(arg, env)?);
        match val {
            EvalResult::Fixnum(n) => {
                result_bigint -= Integer::from(n);
                result_ratio -= Rational::from(n);
                result_float -= n as f64;
            }
            EvalResult::Bignum(b) => {
                result_bigint -= &b;
                result_ratio -= Rational::from(b);
            }
            EvalResult::Ratio(r) => {
                has_ratio = true;
                result_ratio -= r;
            }
            EvalResult::Float(f) => {
                has_float = true;
                result_float -= f;
            }
            EvalResult::Nil => {
                // Treat nil as 0 - don't subtract anything
            }
            _ => return Err("- requires numeric arguments".to_string()),
        }
    }

    if has_float {
        Ok(EvalResult::Float(result_float))
    } else if has_ratio {
        if result_ratio.denominator_ref() == &1 {
            let num = Integer::from(result_ratio.numerator_ref().clone());
            if i64::convertible_from(&num) {
                Ok(EvalResult::Fixnum(i64::exact_from(&num)))
            } else {
                Ok(EvalResult::Bignum(num))
            }
        } else {
            Ok(EvalResult::Ratio(result_ratio))
        }
    } else {
        // Try to fit in Fixnum, otherwise return Bignum
        if i64::convertible_from(&result_bigint) {
            Ok(EvalResult::Fixnum(i64::exact_from(&result_bigint)))
        } else {
            Ok(EvalResult::Bignum(result_bigint))
        }
    }
}

pub(super) fn eval_mul_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use malachite::Rational;

    let mut product_bigint = Integer::from(1);
    let mut product_ratio = Rational::from(1);
    let mut product_float: f64 = 1.0;
    let mut has_float = false;
    let mut has_ratio = false;

    for arg in args {
        let val = primary_value(eval_with_env(arg, env)?);
        match val {
            EvalResult::Fixnum(n) => {
                product_bigint *= Integer::from(n);
                product_ratio *= Rational::from(n);
                product_float *= n as f64;
            }
            EvalResult::Bignum(b) => {
                product_bigint *= &b;
                product_ratio *= Rational::from(b);
            }
            EvalResult::Ratio(r) => {
                has_ratio = true;
                product_ratio *= r;
            }
            EvalResult::Float(f) => {
                has_float = true;
                product_float *= f;
            }
            EvalResult::Nil => {
                // Treat nil as 0 for multiplication makes result 0
                return Ok(EvalResult::Fixnum(0));
            }
            _ => return Err("* requires numeric arguments".to_string()),
        }
    }

    if has_float {
        Ok(EvalResult::Float(product_float))
    } else if has_ratio {
        if product_ratio.denominator_ref() == &1 {
            let num = Integer::from(product_ratio.numerator_ref().clone());
            if i64::convertible_from(&num) {
                Ok(EvalResult::Fixnum(i64::exact_from(&num)))
            } else {
                Ok(EvalResult::Bignum(num))
            }
        } else {
            Ok(EvalResult::Ratio(product_ratio))
        }
    } else {
        // Try to fit in Fixnum, otherwise return Bignum
        if i64::convertible_from(&product_bigint) {
            Ok(EvalResult::Fixnum(i64::exact_from(&product_bigint)))
        } else {
            Ok(EvalResult::Bignum(product_bigint))
        }
    }
}

pub(super) fn eval_div_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use malachite::Rational;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    if args.is_empty() {
        return Err("/ requires at least one argument".to_string());
    }

    let first = eval_with_env(&args[0], env)?;

    // If any argument is a float, do float division
    let has_float = matches!(first, EvalResult::Float(_)) || args[1..].iter().any(|arg| {
        if let Ok(val) = eval_with_env(arg, env) {
            matches!(val, EvalResult::Float(_))
        } else {
            false
        }
    });

    if has_float {
        // Float division
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
    } else {
        // Rational division - create ratio
        let mut ratio = match first {
            EvalResult::Fixnum(n) => Rational::from(n),
            EvalResult::Ratio(r) => r,
            _ => return Err("/ requires numeric arguments".to_string()),
        };

        if args.len() == 1 {
            // (/ n) = 1/n
            if ratio == 0 {
                return Err("Division by zero".to_string());
            }
            ratio = Rational::from(1) / ratio;
            if ratio.denominator_ref() == &1 {
                let num = ratio.numerator_ref();
                if i64::convertible_from(num) {
                    return Ok(EvalResult::Fixnum(i64::exact_from(num)));
                }
            }
            return Ok(EvalResult::Ratio(ratio));
        }

        for arg in &args[1..] {
            let divisor = match eval_with_env(arg, env)? {
                EvalResult::Fixnum(n) => {
                    if n == 0 {
                        return Err("Division by zero".to_string());
                    }
                    Rational::from(n)
                }
                EvalResult::Ratio(r) => {
                    if r == 0 {
                        return Err("Division by zero".to_string());
                    }
                    r
                }
                _ => return Err("/ requires numeric arguments".to_string()),
            };
            ratio /= divisor;
        }

        // If the result is an integer, return fixnum
        if ratio.denominator_ref() == &1 {
            let num = ratio.numerator_ref();
            if i64::convertible_from(num) {
                return Ok(EvalResult::Fixnum(i64::exact_from(num)));
            }
        }

        Ok(EvalResult::Ratio(ratio))
    }
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
    use malachite::Rational;
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
            (EvalResult::Ratio(a), EvalResult::Ratio(b)) => a < b,
            (EvalResult::Fixnum(a), EvalResult::Ratio(b)) => &Rational::from(*a) < b,
            (EvalResult::Ratio(a), EvalResult::Fixnum(b)) => a < &Rational::from(*b),
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
    use malachite::Rational;
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
            (EvalResult::Ratio(a), EvalResult::Ratio(b)) => a > b,
            (EvalResult::Fixnum(a), EvalResult::Ratio(b)) => &Rational::from(*a) > b,
            (EvalResult::Ratio(a), EvalResult::Fixnum(b)) => a > &Rational::from(*b),
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
    use malachite::Rational;
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
            (EvalResult::Ratio(a), EvalResult::Ratio(b)) => a <= b,
            (EvalResult::Fixnum(a), EvalResult::Ratio(b)) => &Rational::from(*a) <= b,
            (EvalResult::Ratio(a), EvalResult::Fixnum(b)) => a <= &Rational::from(*b),
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
    use malachite::Rational;
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
            (EvalResult::Ratio(a), EvalResult::Ratio(b)) => a >= b,
            (EvalResult::Fixnum(a), EvalResult::Ratio(b)) => &Rational::from(*a) >= b,
            (EvalResult::Ratio(a), EvalResult::Fixnum(b)) => a >= &Rational::from(*b),
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
        (EvalResult::Bignum(a), EvalResult::Fixnum(b)) => {
            if b == 0 {
                return Err("Division by zero".to_string());
            }
            let result = a % Integer::from(b);
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
        }
        (EvalResult::Fixnum(a), EvalResult::Bignum(b)) => {
            let result = Integer::from(a) % b;
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
        }
        (EvalResult::Bignum(a), EvalResult::Bignum(b)) => {
            let result = a % b;
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
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
        (EvalResult::Ratio(r), None) => {
            // Floor of a ratio: largest integer <= ratio
            // Convert to float, take floor
            let num_str = r.numerator_ref().to_string();
            let denom_str = r.denominator_ref().to_string();
            let num_f64: f64 = num_str.parse().unwrap_or(0.0);
            let denom_f64: f64 = denom_str.parse().unwrap_or(1.0);
            let result = (num_f64 / denom_f64).floor() as i64;
            Ok(EvalResult::Fixnum(result))
        }
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
        (EvalResult::Ratio(r), None) => {
            // Ceiling of a ratio: smallest integer >= ratio
            // Convert to float, take ceiling
            let num_str = r.numerator_ref().to_string();
            let denom_str = r.denominator_ref().to_string();
            let num_f64: f64 = num_str.parse().unwrap_or(0.0);
            let denom_f64: f64 = denom_str.parse().unwrap_or(1.0);
            let result = (num_f64 / denom_f64).ceil() as i64;
            Ok(EvalResult::Fixnum(result))
        }
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
    use malachite::Rational;
    // (ratio numerator denominator)
    // Returns an EvalResult::Ratio using Malachite Rational
    if args.len() != 2 {
        return Err("ratio requires 2 arguments (numerator and denominator)".to_string());
    }

    let num = primary_value(eval_with_env(&args[0], env)?);
    let denom = primary_value(eval_with_env(&args[1], env)?);

    match (num, denom) {
        (EvalResult::Fixnum(n), EvalResult::Fixnum(d)) => {
            if d == 0 {
                return Err("Division by zero in ratio".to_string());
            }
            let ratio = Rational::from_signeds(n, d);
            // If the result is an integer, return fixnum
            if ratio.denominator_ref() == &1 {
                let numerator = ratio.numerator_ref();
                if i64::convertible_from(numerator) {
                    return Ok(EvalResult::Fixnum(i64::exact_from(numerator)));
                }
            }
            Ok(EvalResult::Ratio(ratio))
        }
        _ => Err("ratio requires integer arguments".to_string()),
    }
}

pub(super) fn eval_numerator(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (numerator ratio)
    // Returns the numerator of a ratio
    if args.is_empty() {
        return Err("numerator requires an argument".to_string());
    }

    let arg = primary_value(eval_with_env(&args[0], env)?);

    match arg {
        EvalResult::Ratio(r) => {
            let num = Integer::from(r.numerator_ref().clone());
            if i64::convertible_from(&num) {
                Ok(EvalResult::Fixnum(i64::exact_from(&num)))
            } else {
                Ok(EvalResult::Bignum(num))
            }
        }
        // If it's not a ratio, it's an integer with numerator = itself
        EvalResult::Fixnum(_) => Ok(arg),
        _ => Err("numerator requires a rational number".to_string()),
    }
}

pub(super) fn eval_denominator(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (denominator ratio)
    // Returns the denominator of a ratio
    if args.is_empty() {
        return Err("denominator requires an argument".to_string());
    }

    let arg = primary_value(eval_with_env(&args[0], env)?);

    match arg {
        EvalResult::Ratio(r) => {
            let denom = Integer::from(r.denominator_ref().clone());
            if i64::convertible_from(&denom) {
                Ok(EvalResult::Fixnum(i64::exact_from(&denom)))
            } else {
                Ok(EvalResult::Bignum(denom))
            }
        }
        // If it's not a ratio, denominator is 1
        EvalResult::Fixnum(_) => Ok(EvalResult::Fixnum(1)),
        _ => Err("denominator requires a rational number".to_string()),
    }
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
