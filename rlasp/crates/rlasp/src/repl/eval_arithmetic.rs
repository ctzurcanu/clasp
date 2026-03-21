/// Arithmetic and comparison operations

use super::eval_types::{EvalResult, primary_value};
use super::eval_core::eval_with_env;
use crate::ir::ASTNode;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;
use malachite::Integer;
use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom, RoundingFrom};
use malachite::rounding_modes::RoundingMode;

// Helper: canonicalize a complex result per CL rules
// If imag is 0 and both inputs were exact (not float), return real part as integer/ratio
fn canonicalize_complex(re: f64, im: f64, had_float_input: bool) -> EvalResult {
    if im == 0.0 && !had_float_input {
        // Try to return as exact integer
        if re == re.floor() && re.abs() < i64::MAX as f64 {
            return EvalResult::Fixnum(re as i64);
        }
        return EvalResult::Float(re);
    }
    if im == 0.0 && had_float_input {
        return EvalResult::Float(re);
    }
    EvalResult::Complex(re, im)
}

// Check if a value has float type (for complex canonicalization)
fn is_float_type(val: &EvalResult) -> bool {
    matches!(val, EvalResult::Float(_) | EvalResult::Complex(_, _))
}

// Helper to convert numeric EvalResult to (real, imag) complex pair
fn to_complex(val: &EvalResult) -> Option<(f64, f64)> {
    match val {
        EvalResult::Fixnum(n) => Some((*n as f64, 0.0)),
        EvalResult::Float(f) => Some((*f, 0.0)),
        EvalResult::Complex(re, im) => Some((*re, *im)),
        EvalResult::Bignum(b) => {
            use malachite::num::conversion::traits::ConvertibleFrom;
            if f64::convertible_from(b) {
                use malachite::num::conversion::traits::RoundingFrom;
                use malachite::rounding_modes::RoundingMode;
                Some((f64::rounding_from(b, RoundingMode::Nearest).0, 0.0))
            } else {
                None
            }
        }
        EvalResult::Ratio(r) => {
            use malachite::num::conversion::traits::RoundingFrom;
            use malachite::rounding_modes::RoundingMode;
            Some((f64::rounding_from(r, RoundingMode::Nearest).0, 0.0))
        }
        _ => None,
    }
}

pub(super) fn eval_add_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use malachite::Rational;

    // Fast path: pure fixnum/nil addition is the dominant interpreter numeric workload.
    let mut has_complex = false;
    let mut all_fixnums_or_nil = true;
    let mut fixnum_sum: i64 = 0;
    let mut overflowed_fixnum_sum = false;
    let mut evaluated_args = Vec::with_capacity(args.len());
    for arg in args {
        let val = primary_value(eval_with_env(arg, env)?);
        if matches!(val, EvalResult::Complex(_, _)) {
            has_complex = true;
        }
        match &val {
            EvalResult::Fixnum(n) => {
                if all_fixnums_or_nil && !overflowed_fixnum_sum {
                    match fixnum_sum.checked_add(*n) {
                        Some(sum) => fixnum_sum = sum,
                        None => overflowed_fixnum_sum = true,
                    }
                }
            }
            EvalResult::Nil => {}
            _ => all_fixnums_or_nil = false,
        }
        evaluated_args.push(val);
    }

    if all_fixnums_or_nil && !has_complex && !overflowed_fixnum_sum {
        return Ok(EvalResult::Fixnum(fixnum_sum));
    }

    // If any complex, do complex arithmetic
    if has_complex {
        let had_float = evaluated_args.iter().any(|v| matches!(v, EvalResult::Float(_)));
        let mut sum_re = 0.0;
        let mut sum_im = 0.0;
        for val in &evaluated_args {
            match to_complex(val) {
                Some((re, im)) => {
                    sum_re += re;
                    sum_im += im;
                }
                None => return Err("+ requires numeric arguments".to_string()),
            }
        }
        return Ok(canonicalize_complex(sum_re, sum_im, had_float));
    }

    let has_float = evaluated_args.iter().any(|v| matches!(v, EvalResult::Float(_)));
    if has_float {
        let mut sum_float: f64 = 0.0;
        for val in evaluated_args {
            if matches!(val, EvalResult::Nil) {
                continue;
            }
            let f = to_f64_for_cmp(&val).ok_or_else(|| "+ requires numeric arguments".to_string())?;
            sum_float += f;
        }
        return Ok(EvalResult::Float(sum_float));
    }

    let has_ratio = evaluated_args.iter().any(|v| matches!(v, EvalResult::Ratio(_)));
    if has_ratio {
        let mut sum_ratio = Rational::from(0);
        for val in evaluated_args {
            match val {
                EvalResult::Fixnum(n) => sum_ratio += Rational::from(n),
                EvalResult::Bignum(b) => sum_ratio += Rational::from(b),
                EvalResult::Ratio(r) => sum_ratio += r,
                EvalResult::Nil => {}
                _ => return Err("+ requires numeric arguments".to_string()),
            }
        }
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
        let mut sum_bigint = Integer::from(0);
        for val in evaluated_args {
            match val {
                EvalResult::Fixnum(n) => sum_bigint += Integer::from(n),
                EvalResult::Bignum(b) => sum_bigint += &b,
                EvalResult::Nil => {}
                _ => return Err("+ requires numeric arguments".to_string()),
            }
        }
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

    if args.len() == 1 {
        let value = primary_value(eval_with_env(&args[0], env)?);
        return match value {
            EvalResult::Fixnum(n) => match 0_i64.checked_sub(n) {
                Some(v) => Ok(EvalResult::Fixnum(v)),
                None => Ok(EvalResult::Bignum(-Integer::from(n))),
            },
            EvalResult::Nil => Ok(EvalResult::Fixnum(0)),
            other => {
                if matches!(other, EvalResult::Complex(_, _)) {
                    let had_float = matches!(other, EvalResult::Float(_));
                    let (re, im) =
                        to_complex(&other).ok_or_else(|| "- requires numeric arguments".to_string())?;
                    Ok(canonicalize_complex(-re, -im, had_float))
                } else {
                    match other {
                        EvalResult::Float(f) => Ok(EvalResult::Float(-f)),
                        EvalResult::Bignum(b) => Ok(EvalResult::Bignum(-b)),
                        EvalResult::Ratio(r) => Ok(EvalResult::Ratio(-r)),
                        _ => Err("- requires numeric arguments".to_string()),
                    }
                }
            }
        };
    }

    if args.len() == 2 {
        let left = primary_value(eval_with_env(&args[0], env)?);
        let right = primary_value(eval_with_env(&args[1], env)?);
        match (&left, &right) {
            (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
                return match a.checked_sub(*b) {
                    Some(v) => Ok(EvalResult::Fixnum(v)),
                    None => Ok(EvalResult::Bignum(Integer::from(*a) - Integer::from(*b))),
                };
            }
            (EvalResult::Fixnum(a), EvalResult::Nil) => return Ok(EvalResult::Fixnum(*a)),
            (EvalResult::Nil, EvalResult::Fixnum(b)) => {
                return match 0_i64.checked_sub(*b) {
                    Some(v) => Ok(EvalResult::Fixnum(v)),
                    None => Ok(EvalResult::Bignum(-Integer::from(*b))),
                };
            }
            (EvalResult::Nil, EvalResult::Nil) => return Ok(EvalResult::Fixnum(0)),
            _ => {}
        }
    }

    // First pass: evaluate all args and check for complex
    let mut has_complex = false;
    let mut evaluated_args = Vec::new();
    for arg in args {
        let val = primary_value(eval_with_env(arg, env)?);
        if matches!(val, EvalResult::Complex(_, _)) {
            has_complex = true;
        }
        evaluated_args.push(val);
    }

    // Complex arithmetic
    if has_complex {
        let had_float = evaluated_args.iter().any(|v| matches!(v, EvalResult::Float(_)));
        let first = to_complex(&evaluated_args[0])
            .ok_or_else(|| "- requires numeric arguments".to_string())?;
        let mut result_re = first.0;
        let mut result_im = first.1;

        if evaluated_args.len() == 1 {
            return Ok(canonicalize_complex(-result_re, -result_im, had_float));
        }

        for val in &evaluated_args[1..] {
            match to_complex(val) {
                Some((re, im)) => {
                    result_re -= re;
                    result_im -= im;
                }
                None => return Err("- requires numeric arguments".to_string()),
            }
        }
        return Ok(canonicalize_complex(result_re, result_im, had_float));
    }

    let first = evaluated_args.remove(0);
    let has_float = matches!(first, EvalResult::Float(_))
        || evaluated_args.iter().any(|v| matches!(v, EvalResult::Float(_)));
    if has_float {
        let mut result_float = match &first {
            EvalResult::Nil => 0.0,
            _ => to_f64_for_cmp(&first).ok_or_else(|| "- requires numeric arguments".to_string())?,
        };
        if evaluated_args.is_empty() {
            return Ok(EvalResult::Float(-result_float));
        }
        for val in evaluated_args {
            if matches!(val, EvalResult::Nil) {
                continue;
            }
            let f = to_f64_for_cmp(&val).ok_or_else(|| "- requires numeric arguments".to_string())?;
            result_float -= f;
        }
        return Ok(EvalResult::Float(result_float));
    }

    let has_ratio = matches!(first, EvalResult::Ratio(_))
        || evaluated_args.iter().any(|v| matches!(v, EvalResult::Ratio(_)));
    if has_ratio {
        let mut result_ratio = match first {
            EvalResult::Fixnum(n) => Rational::from(n),
            EvalResult::Bignum(b) => Rational::from(b),
            EvalResult::Ratio(r) => r,
            EvalResult::Nil => Rational::from(0),
            _ => return Err("- requires numeric arguments".to_string()),
        };
        if evaluated_args.is_empty() {
            result_ratio = -result_ratio;
        } else {
            for val in evaluated_args {
                match val {
                    EvalResult::Fixnum(n) => result_ratio -= Rational::from(n),
                    EvalResult::Bignum(b) => result_ratio -= Rational::from(b),
                    EvalResult::Ratio(r) => result_ratio -= r,
                    EvalResult::Nil => {}
                    _ => return Err("- requires numeric arguments".to_string()),
                }
            }
        }
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
        let mut result_bigint = match first {
            EvalResult::Fixnum(n) => Integer::from(n),
            EvalResult::Bignum(b) => b,
            EvalResult::Nil => Integer::from(0),
            _ => return Err("- requires numeric arguments".to_string()),
        };
        if evaluated_args.is_empty() {
            result_bigint = -result_bigint;
        } else {
            for val in evaluated_args {
                match val {
                    EvalResult::Fixnum(n) => result_bigint -= Integer::from(n),
                    EvalResult::Bignum(b) => result_bigint -= &b,
                    EvalResult::Nil => {}
                    _ => return Err("- requires numeric arguments".to_string()),
                }
            }
        }
        if i64::convertible_from(&result_bigint) {
            Ok(EvalResult::Fixnum(i64::exact_from(&result_bigint)))
        } else {
            Ok(EvalResult::Bignum(result_bigint))
        }
    }
}

pub(super) fn eval_mul_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use malachite::Rational;

    #[inline]
    fn integer_to_eval(n: Integer) -> EvalResult {
        if i64::convertible_from(&n) {
            EvalResult::Fixnum(i64::exact_from(&n))
        } else {
            EvalResult::Bignum(n)
        }
    }

    #[inline]
    fn rational_to_eval(r: Rational) -> EvalResult {
        if r.denominator_ref() == &1 {
            let num = Integer::from(r.numerator_ref().clone());
            integer_to_eval(num)
        } else {
            EvalResult::Ratio(r)
        }
    }

    // Hot path: binary multiplication is dominant in recursive numeric workloads.
    if args.len() == 2 {
        let left = primary_value(eval_with_env(&args[0], env)?);
        let right = primary_value(eval_with_env(&args[1], env)?);

        if matches!(left, EvalResult::Complex(_, _)) || matches!(right, EvalResult::Complex(_, _)) {
            let had_float = matches!(left, EvalResult::Float(_)) || matches!(right, EvalResult::Float(_));
            let (lre, lim) = to_complex(&left).ok_or_else(|| "* requires numeric arguments".to_string())?;
            let (rre, rim) = to_complex(&right).ok_or_else(|| "* requires numeric arguments".to_string())?;
            let out_re = lre * rre - lim * rim;
            let out_im = lre * rim + lim * rre;
            return Ok(canonicalize_complex(out_re, out_im, had_float));
        }

        if matches!(left, EvalResult::Nil) || matches!(right, EvalResult::Nil) {
            return Ok(EvalResult::Fixnum(0));
        }

        return match (left, right) {
            (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
                if let Some(v) = a.checked_mul(b) {
                    Ok(EvalResult::Fixnum(v))
                } else {
                    Ok(EvalResult::Bignum(Integer::from(a) * Integer::from(b)))
                }
            }
            (EvalResult::Bignum(a), EvalResult::Bignum(b)) => Ok(EvalResult::Bignum(a * b)),
            (EvalResult::Fixnum(a), EvalResult::Bignum(b)) => Ok(EvalResult::Bignum(Integer::from(a) * b)),
            (EvalResult::Bignum(a), EvalResult::Fixnum(b)) => Ok(EvalResult::Bignum(a * Integer::from(b))),
            (EvalResult::Float(a), other) | (other, EvalResult::Float(a)) => {
                let b = to_f64_for_cmp(&other).ok_or_else(|| "* requires numeric arguments".to_string())?;
                Ok(EvalResult::Float(a * b))
            }
            (EvalResult::Ratio(a), EvalResult::Ratio(b)) => Ok(rational_to_eval(a * b)),
            (EvalResult::Ratio(a), EvalResult::Fixnum(b)) | (EvalResult::Fixnum(b), EvalResult::Ratio(a)) => {
                Ok(rational_to_eval(a * Rational::from(b)))
            }
            (EvalResult::Ratio(a), EvalResult::Bignum(b)) | (EvalResult::Bignum(b), EvalResult::Ratio(a)) => {
                Ok(rational_to_eval(a * Rational::from(b)))
            }
            _ => Err("* requires numeric arguments".to_string()),
        };
    }

    // First pass: evaluate all args and check for complex
    let mut has_complex = false;
    let mut evaluated_args = Vec::new();
    for arg in args {
        let val = primary_value(eval_with_env(arg, env)?);
        if matches!(val, EvalResult::Complex(_, _)) {
            has_complex = true;
        }
        evaluated_args.push(val);
    }

    // Complex multiplication: (a+bi)(c+di) = (ac-bd) + (ad+bc)i
    if has_complex {
        let had_float = evaluated_args.iter().any(|v| matches!(v, EvalResult::Float(_)));
        let mut result_re = 1.0;
        let mut result_im = 0.0;

        for val in &evaluated_args {
            match to_complex(val) {
                Some((re, im)) => {
                    // (result_re + result_im*i) * (re + im*i)
                    let new_re = result_re * re - result_im * im;
                    let new_im = result_re * im + result_im * re;
                    result_re = new_re;
                    result_im = new_im;
                }
                None => return Err("* requires numeric arguments".to_string()),
            }
        }
        return Ok(canonicalize_complex(result_re, result_im, had_float));
    }

    let has_float = evaluated_args.iter().any(|v| matches!(v, EvalResult::Float(_)));
    if has_float {
        let mut product_float: f64 = 1.0;
        for val in evaluated_args {
            if matches!(val, EvalResult::Nil) {
                return Ok(EvalResult::Fixnum(0));
            }
            let f = to_f64_for_cmp(&val).ok_or_else(|| "* requires numeric arguments".to_string())?;
            product_float *= f;
        }
        return Ok(EvalResult::Float(product_float));
    }

    let has_ratio = evaluated_args.iter().any(|v| matches!(v, EvalResult::Ratio(_)));
    if has_ratio {
        let mut product_ratio = Rational::from(1);
        for val in evaluated_args {
            match val {
                EvalResult::Fixnum(n) => product_ratio *= Rational::from(n),
                EvalResult::Bignum(b) => product_ratio *= Rational::from(b),
                EvalResult::Ratio(r) => product_ratio *= r,
                EvalResult::Nil => return Ok(EvalResult::Fixnum(0)),
                _ => return Err("* requires numeric arguments".to_string()),
            }
        }
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
        let mut product_bigint = Integer::from(1);
        for val in evaluated_args {
            match val {
                EvalResult::Fixnum(n) => product_bigint *= Integer::from(n),
                EvalResult::Bignum(b) => product_bigint *= &b,
                EvalResult::Nil => return Ok(EvalResult::Fixnum(0)),
                _ => return Err("* requires numeric arguments".to_string()),
            }
        }
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

    // Evaluate all args first to check for complex
    let mut evaluated_args = Vec::new();
    let mut has_complex = false;
    let mut has_float_input = false;
    for arg in args {
        let val = primary_value(eval_with_env(arg, env)?);
        if matches!(val, EvalResult::Complex(_, _)) {
            has_complex = true;
        }
        if matches!(val, EvalResult::Float(_)) {
            has_float_input = true;
        }
        evaluated_args.push(val);
    }

    // Complex division: (a+bi)/(c+di) = ((ac+bd)+(bc-ad)i)/(c²+d²)
    if has_complex {
        let first = to_complex(&evaluated_args[0])
            .ok_or_else(|| "/ requires numeric arguments".to_string())?;
        let mut result_re = first.0;
        let mut result_im = first.1;

        if evaluated_args.len() == 1 {
            // (/ z) = 1/z
            let denom = result_re * result_re + result_im * result_im;
            if denom == 0.0 {
                return Err("Division by zero".to_string());
            }
            result_re = result_re / denom;
            result_im = -result_im / denom;
            return Ok(canonicalize_complex(result_re, result_im, has_float_input));
        }

        for val in &evaluated_args[1..] {
            match to_complex(val) {
                Some((re, im)) => {
                    let denom = re * re + im * im;
                    if denom == 0.0 {
                        return Err("Division by zero".to_string());
                    }
                    let new_re = (result_re * re + result_im * im) / denom;
                    let new_im = (result_im * re - result_re * im) / denom;
                    result_re = new_re;
                    result_im = new_im;
                }
                None => return Err("/ requires numeric arguments".to_string()),
            }
        }
        return Ok(canonicalize_complex(result_re, result_im, has_float_input));
    }

    let first = evaluated_args.remove(0);

    // If any argument is a float, do float division
    let has_float = matches!(first, EvalResult::Float(_)) || has_float_input;

    if has_float {
        // Float division
        let mut result = match &first {
            EvalResult::Fixnum(n) => *n as f64,
            EvalResult::Float(f) => *f,
            EvalResult::Bignum(b) => {
                use malachite::num::conversion::traits::RoundingFrom;
                use malachite::rounding_modes::RoundingMode;
                f64::rounding_from(b, RoundingMode::Nearest).0
            }
            EvalResult::Ratio(r) => {
                use malachite::num::conversion::traits::RoundingFrom;
                use malachite::rounding_modes::RoundingMode;
                f64::rounding_from(r, RoundingMode::Nearest).0
            }
            _ => return Err("/ requires numeric arguments".to_string()),
        };

        if evaluated_args.is_empty() {
            // (/ x) = 1/x
            return Ok(EvalResult::Float(1.0 / result));
        }

        for val in &evaluated_args {
            let divisor = match val {
                EvalResult::Fixnum(n) => *n as f64,
                EvalResult::Float(f) => *f,
                EvalResult::Bignum(b) => {
                    use malachite::num::conversion::traits::RoundingFrom;
                    use malachite::rounding_modes::RoundingMode;
                    f64::rounding_from(b, RoundingMode::Nearest).0
                }
                EvalResult::Ratio(r) => {
                    use malachite::num::conversion::traits::RoundingFrom;
                    use malachite::rounding_modes::RoundingMode;
                    f64::rounding_from(r, RoundingMode::Nearest).0
                }
                _ => return Err("/ requires numeric arguments".to_string()),
            };
            result /= divisor;
        }

        Ok(EvalResult::Float(result))
    } else {
        // Rational division - create ratio
        let mut ratio = match first {
            EvalResult::Fixnum(n) => Rational::from(n),
            EvalResult::Bignum(b) => Rational::from(b),
            EvalResult::Ratio(r) => r,
            _ => return Err("/ requires numeric arguments".to_string()),
        };

        if evaluated_args.is_empty() {
            // (/ n) = 1/n
            if ratio == 0 {
                return Err("Division by zero".to_string());
            }
            ratio = Rational::from(1) / ratio;
            if ratio.denominator_ref() == &1 {
                let num = Integer::from(ratio.numerator_ref().clone());
                if i64::convertible_from(&num) {
                    return Ok(EvalResult::Fixnum(i64::exact_from(&num)));
                }
            }
            return Ok(EvalResult::Ratio(ratio));
        }

        for val in evaluated_args {
            let divisor = match val {
                EvalResult::Fixnum(n) => {
                    if n == 0 {
                        return Err("Division by zero".to_string());
                    }
                    Rational::from(n)
                }
                EvalResult::Bignum(b) => {
                    if b == Integer::from(0) {
                        return Err("Division by zero".to_string());
                    }
                    Rational::from(b)
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

// Convert any numeric EvalResult to Rational for comparison
fn to_rational_for_cmp(v: &EvalResult) -> Option<malachite::Rational> {
    match v {
        EvalResult::Fixnum(n) => Some(malachite::Rational::from(*n)),
        EvalResult::Bignum(b) => Some(malachite::Rational::from(b.clone())),
        EvalResult::Ratio(r) => Some(r.clone()),
        EvalResult::Float(f) => {
            // Use f64 comparison directly for floats
            None
        }
        EvalResult::Nil => Some(malachite::Rational::from(0)),
        _ => None,
    }
}

fn to_f64_for_cmp(v: &EvalResult) -> Option<f64> {
    match v {
        EvalResult::Fixnum(n) => Some(*n as f64),
        EvalResult::Float(f) => Some(*f),
        EvalResult::Bignum(b) => Some(f64::rounding_from(b, RoundingMode::Nearest).0),
        EvalResult::Ratio(r) => Some(f64::rounding_from(r, RoundingMode::Nearest).0),
        EvalResult::Nil => Some(0.0),
        _ => None,
    }
}

fn numeric_equal(a: &EvalResult, b: &EvalResult) -> Result<bool, String> {
    // Handle complex numbers
    match (a, b) {
        (EvalResult::Complex(ar, ai), EvalResult::Complex(br, bi)) => {
            return Ok(ar == br && ai == bi);
        }
        (EvalResult::Complex(ar, ai), _) => {
            if *ai != 0.0 { return Ok(false); }
            // Compare real part only
            return numeric_equal(&EvalResult::Float(*ar), b);
        }
        (_, EvalResult::Complex(br, bi)) => {
            if *bi != 0.0 { return Ok(false); }
            return numeric_equal(a, &EvalResult::Float(*br));
        }
        _ => {}
    }
    // If both can be rational (no floats), compare exactly
    if !matches!(a, EvalResult::Float(_)) && !matches!(b, EvalResult::Float(_)) {
        match (to_rational_for_cmp(a), to_rational_for_cmp(b)) {
            (Some(ra), Some(rb)) => return Ok(ra == rb),
            _ => {}
        }
    }
    // Float comparison
    match (to_f64_for_cmp(a), to_f64_for_cmp(b)) {
        (Some(fa), Some(fb)) => Ok(fa == fb),
        _ => Err("= requires numeric arguments".to_string()),
    }
}

pub(super) fn eval_eq_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("= requires at least two arguments".to_string());
    }
    let first = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let val = eval_with_env(arg, env)?;
        if !numeric_equal(&first, &val)? {
            return Ok(EvalResult::Nil);
        }
    }
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_ne_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("/= requires at least two arguments".to_string());
    }
    if args.len() == 2 {
        let left = primary_value(eval_with_env(&args[0], env)?);
        let right = primary_value(eval_with_env(&args[1], env)?);
        return if numeric_equal(&left, &right)? {
            Ok(EvalResult::Nil)
        } else {
            Ok(EvalResult::Bool(true))
        };
    }
    // /= returns true if no two arguments are equal
    for i in 0..args.len() {
        for j in i+1..args.len() {
            let val_i = eval_with_env(&args[i], env)?;
            let val_j = eval_with_env(&args[j], env)?;
            if numeric_equal(&val_i, &val_j)? {
                return Ok(EvalResult::Nil);
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
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a.eq_ignore_ascii_case(b),
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Boolean(a), EvalResult::Boolean(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Boolean(b))
        | (EvalResult::Boolean(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Bool(true), EvalResult::Symbol(s))
        | (EvalResult::Boolean(true), EvalResult::Symbol(s))
        | (EvalResult::Symbol(s), EvalResult::Bool(true))
        | (EvalResult::Symbol(s), EvalResult::Boolean(true)) => s.eq_ignore_ascii_case("T"),
        (EvalResult::Nil, EvalResult::Symbol(s))
        | (EvalResult::Symbol(s), EvalResult::Nil)
        | (EvalResult::Bool(false), EvalResult::Symbol(s))
        | (EvalResult::Boolean(false), EvalResult::Symbol(s))
        | (EvalResult::Symbol(s), EvalResult::Bool(false))
        | (EvalResult::Symbol(s), EvalResult::Boolean(false)) => s.eq_ignore_ascii_case("NIL"),
        (EvalResult::BuiltinFunction(a), EvalResult::BuiltinFunction(b)) => a == b,
        (
            EvalResult::Lambda { env: a_env, .. },
            EvalResult::Lambda { env: b_env, .. },
        ) => Rc::ptr_eq(a_env, b_env),
        (EvalResult::GenericFunction(a), EvalResult::GenericFunction(b)) => Rc::ptr_eq(a, b),
        (EvalResult::ForeignFunction(a), EvalResult::ForeignFunction(b)) => Rc::ptr_eq(a, b),
        (EvalResult::Array(a), EvalResult::Array(b)) => Rc::ptr_eq(a, b),
        (EvalResult::HashTable(a), EvalResult::HashTable(b)) => Rc::ptr_eq(a, b),
        (EvalResult::Instance(a), EvalResult::Instance(b)) => a.id == b.id,
        (EvalResult::Cons(ac, ad), EvalResult::Cons(bc, bd)) => Rc::ptr_eq(ac, bc) && Rc::ptr_eq(ad, bd),
        _ => false,
    };

    if result {
        Ok(EvalResult::Bool(true))
    } else {
        Ok(EvalResult::Nil)
    }
}

fn numeric_cmp(a: &EvalResult, b: &EvalResult) -> Result<std::cmp::Ordering, String> {
    match (a, b) {
        (EvalResult::Fixnum(la), EvalResult::Fixnum(lb)) => return Ok(la.cmp(lb)),
        (EvalResult::Bignum(la), EvalResult::Bignum(lb)) => return Ok(la.cmp(lb)),
        (EvalResult::Fixnum(la), EvalResult::Bignum(lb)) => return Ok(Integer::from(*la).cmp(lb)),
        (EvalResult::Bignum(la), EvalResult::Fixnum(lb)) => return Ok(la.cmp(&Integer::from(*lb))),
        (EvalResult::Float(la), EvalResult::Float(lb)) => {
            return la.partial_cmp(lb).ok_or_else(|| "comparison with NaN".to_string())
        }
        _ => {}
    }

    // If both can be rational (no floats), compare exactly
    if !matches!(a, EvalResult::Float(_)) && !matches!(b, EvalResult::Float(_)) {
        match (to_rational_for_cmp(a), to_rational_for_cmp(b)) {
            (Some(ra), Some(rb)) => return Ok(ra.cmp(&rb)),
            _ => {}
        }
    }
    // Float comparison
    match (to_f64_for_cmp(a), to_f64_for_cmp(b)) {
        (Some(fa), Some(fb)) => {
            fa.partial_cmp(&fb).ok_or_else(|| "comparison with NaN".to_string())
        }
        _ => Err("comparison requires numeric arguments".to_string()),
    }
}

pub(super) fn eval_lt_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("< requires at least two arguments".to_string());
    }
    let mut prev = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let curr = eval_with_env(arg, env)?;
        if numeric_cmp(&prev, &curr)? != std::cmp::Ordering::Less {
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
        if numeric_cmp(&prev, &curr)? != std::cmp::Ordering::Greater {
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
        if numeric_cmp(&prev, &curr)? == std::cmp::Ordering::Greater {
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
        if numeric_cmp(&prev, &curr)? == std::cmp::Ordering::Less {
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
        EvalResult::Fixnum(n) => {
            match n.checked_add(1) {
                Some(result) => Ok(EvalResult::Fixnum(result)),
                None => Ok(EvalResult::Bignum(malachite::Integer::from(n) + malachite::Integer::from(1))),
            }
        }
        EvalResult::Bignum(n) => Ok(EvalResult::Bignum(n + malachite::Integer::from(1))),
        EvalResult::Float(f) => Ok(EvalResult::Float(f + 1.0)),
        EvalResult::Complex(re, im) => Ok(EvalResult::Complex(re + 1.0, im)),
        EvalResult::Ratio(r) => {
            let result = r + malachite::Rational::from(1);
            if result.denominator_ref() == &1u32 {
                let num = malachite::Integer::from(result.numerator_ref().clone());
                use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
                if i64::convertible_from(&num) { Ok(EvalResult::Fixnum(i64::exact_from(&num))) } else { Ok(EvalResult::Bignum(num)) }
            } else {
                Ok(EvalResult::Ratio(result))
            }
        }
        EvalResult::Nil => Ok(EvalResult::Fixnum(1)),
        _ => Err("1+ requires a number".to_string()),
    }
}

pub(super) fn eval_one_minus(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("1- requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => {
            match n.checked_sub(1) {
                Some(result) => Ok(EvalResult::Fixnum(result)),
                None => Ok(EvalResult::Bignum(malachite::Integer::from(n) - malachite::Integer::from(1))),
            }
        }
        EvalResult::Bignum(n) => Ok(EvalResult::Bignum(n - malachite::Integer::from(1))),
        EvalResult::Float(f) => Ok(EvalResult::Float(f - 1.0)),
        EvalResult::Complex(re, im) => Ok(EvalResult::Complex(re - 1.0, im)),
        EvalResult::Ratio(r) => {
            let result = r - malachite::Rational::from(1);
            if result.denominator_ref() == &1u32 {
                let num = malachite::Integer::from(result.numerator_ref().clone());
                use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
                if i64::convertible_from(&num) { Ok(EvalResult::Fixnum(i64::exact_from(&num))) } else { Ok(EvalResult::Bignum(num)) }
            } else {
                Ok(EvalResult::Ratio(result))
            }
        }
        EvalResult::Nil => Ok(EvalResult::Fixnum(-1)),
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
        EvalResult::Fixnum(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_)
            | EvalResult::Float(_) | EvalResult::Complex(_, _) => Ok(EvalResult::Bool(true)),
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

    use malachite::Rational;
    use malachite::Integer;
    use malachite::num::conversion::traits::ExactFrom;
    use malachite::num::conversion::traits::ConvertibleFrom;

    // Helper: convert to Rational
    fn to_rational(v: &EvalResult) -> Option<Rational> {
        match v {
            EvalResult::Fixnum(n) => Some(Rational::from(*n)),
            EvalResult::Bignum(b) => Some(Rational::from(b.clone())),
            EvalResult::Ratio(r) => Some(r.clone()),
            _ => None,
        }
    }

    // Check for float involvement
    let has_float = matches!(&num, EvalResult::Float(_)) ||
        matches!(&divisor, Some(EvalResult::Float(_)));

    if has_float {
        let n_f = eval_to_f64(&num).map_err(|_| "floor: not a number".to_string())?;
        let d_f = match &divisor {
            Some(v) => eval_to_f64(v).map_err(|_| "floor: not a number".to_string())?,
            None => 1.0,
        };
        if d_f == 0.0 { return Err("Division by zero".to_string()); }
        let quotient = (n_f / d_f).floor();
        let remainder = n_f - quotient * d_f;
        let q_i64 = quotient as i64;
        return Ok(EvalResult::MultipleValues(vec![
            EvalResult::Fixnum(q_i64),
            EvalResult::Float(remainder),
        ]));
    }

    // Rational path
    let n_r = to_rational(&num).ok_or_else(|| "floor: not a number".to_string())?;
    let d_r = match &divisor {
        Some(v) => to_rational(v).ok_or_else(|| "floor: not a number".to_string())?,
        None => Rational::from(1),
    };
    if d_r == Rational::from(0) { return Err("Division by zero".to_string()); }

    let ratio = &n_r / &d_r;
    // Floor: largest integer <= ratio
    // For a/b where b > 0: if a >= 0, floor = a / b; if a < 0, floor = (a - b + 1) / b
    let num = Integer::from(ratio.numerator_ref().clone());
    let den = Integer::from(ratio.denominator_ref().clone());
    let q_int = if den == Integer::from(1) {
        num
    } else if num >= Integer::from(0) {
        &num / &den
    } else {
        (&num - &den + Integer::from(1)) / &den
    };
    let q_rational = Rational::from(q_int.clone());
    let remainder = &n_r - &(&q_rational * &d_r);
    let q_val = if i64::convertible_from(&q_int) {
        EvalResult::Fixnum(i64::exact_from(&q_int))
    } else {
        EvalResult::Bignum(q_int)
    };
    let rem_val = if remainder == Rational::from(0) {
        EvalResult::Fixnum(0)
    } else if remainder.denominator_ref() == &1u32 {
        let rem_int = Integer::from(remainder.numerator_ref().clone());
        if i64::convertible_from(&rem_int) {
            EvalResult::Fixnum(i64::exact_from(&rem_int))
        } else {
            EvalResult::Bignum(rem_int)
        }
    } else {
        EvalResult::Ratio(remainder)
    };
    Ok(EvalResult::MultipleValues(vec![q_val, rem_val]))
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

    use malachite::Rational;
    use malachite::Integer;
    use malachite::num::conversion::traits::ExactFrom;
    use malachite::num::conversion::traits::ConvertibleFrom;

    fn to_rational(v: &EvalResult) -> Option<Rational> {
        match v {
            EvalResult::Fixnum(n) => Some(Rational::from(*n)),
            EvalResult::Bignum(b) => Some(Rational::from(b.clone())),
            EvalResult::Ratio(r) => Some(r.clone()),
            _ => None,
        }
    }

    let has_float = matches!(&num, EvalResult::Float(_)) ||
        matches!(&divisor, Some(EvalResult::Float(_)));

    if has_float {
        let n_f = eval_to_f64(&num).map_err(|_| "ceiling: not a number".to_string())?;
        let d_f = match &divisor {
            Some(v) => eval_to_f64(v).map_err(|_| "ceiling: not a number".to_string())?,
            None => 1.0,
        };
        if d_f == 0.0 { return Err("Division by zero".to_string()); }
        let quotient = (n_f / d_f).ceil();
        let remainder = n_f - quotient * d_f;
        let q_i64 = quotient as i64;
        return Ok(EvalResult::MultipleValues(vec![
            EvalResult::Fixnum(q_i64),
            EvalResult::Float(remainder),
        ]));
    }

    let n_r = to_rational(&num).ok_or_else(|| "ceiling: not a number".to_string())?;
    let d_r = match &divisor {
        Some(v) => to_rational(v).ok_or_else(|| "ceiling: not a number".to_string())?,
        None => Rational::from(1),
    };
    if d_r == Rational::from(0) { return Err("Division by zero".to_string()); }

    let ratio = &n_r / &d_r;
    // Ceiling: smallest integer >= ratio
    // For a/b where b > 0: if a % b == 0, ceil = a / b; else ceil = floor(a/b) + 1
    let num = Integer::from(ratio.numerator_ref().clone());
    let den = Integer::from(ratio.denominator_ref().clone());
    let q_int = if den == Integer::from(1) {
        num
    } else if num >= Integer::from(0) {
        (&num + &den - Integer::from(1)) / &den
    } else {
        &num / &den  // truncation towards zero IS ceiling for negatives
    };
    let q_rational = Rational::from(q_int.clone());
    let remainder = &n_r - &(&q_rational * &d_r);
    let q_val = if i64::convertible_from(&q_int) {
        EvalResult::Fixnum(i64::exact_from(&q_int))
    } else {
        EvalResult::Bignum(q_int)
    };
    let rem_val = if remainder == Rational::from(0) {
        EvalResult::Fixnum(0)
    } else if remainder.denominator_ref() == &1u32 {
        let rem_int = Integer::from(remainder.numerator_ref().clone());
        if i64::convertible_from(&rem_int) {
            EvalResult::Fixnum(i64::exact_from(&rem_int))
        } else {
            EvalResult::Bignum(rem_int)
        }
    } else {
        EvalResult::Ratio(remainder)
    };
    Ok(EvalResult::MultipleValues(vec![q_val, rem_val]))
}

// Helper to convert EvalResult to f64
fn eval_to_f64(v: &EvalResult) -> Result<f64, String> {
    match v {
        EvalResult::Fixnum(n) => Ok(*n as f64),
        EvalResult::Float(f) => Ok(*f),
        EvalResult::Bignum(b) => {
            use malachite::num::conversion::traits::RoundingFrom;
            use malachite::rounding_modes::RoundingMode;
            Ok(f64::rounding_from(b, RoundingMode::Nearest).0)
        }
        EvalResult::Ratio(r) => {
            use malachite::num::conversion::traits::RoundingFrom;
            use malachite::rounding_modes::RoundingMode;
            Ok(f64::rounding_from(r, RoundingMode::Nearest).0)
        }
        _ => Err("not a number".to_string()),
    }
}

pub(super) fn eval_ffloor(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() || args.len() > 2 {
        return Err("ffloor requires 1 or 2 arguments".to_string());
    }
    let n = eval_to_f64(&eval_with_env(&args[0], env)?)?;
    let d = if args.len() == 2 { eval_to_f64(&eval_with_env(&args[1], env)?)? } else { 1.0 };
    if d == 0.0 { return Err("Division by zero".to_string()); }
    let q = (n / d).floor();
    let r = n - q * d;
    Ok(EvalResult::MultipleValues(vec![EvalResult::Float(q), EvalResult::Float(r)]))
}

pub(super) fn eval_fceiling(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() || args.len() > 2 {
        return Err("fceiling requires 1 or 2 arguments".to_string());
    }
    let n = eval_to_f64(&eval_with_env(&args[0], env)?)?;
    let d = if args.len() == 2 { eval_to_f64(&eval_with_env(&args[1], env)?)? } else { 1.0 };
    if d == 0.0 { return Err("Division by zero".to_string()); }
    let q = (n / d).ceil();
    let r = n - q * d;
    Ok(EvalResult::MultipleValues(vec![EvalResult::Float(q), EvalResult::Float(r)]))
}

pub(super) fn eval_ftruncate(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() || args.len() > 2 {
        return Err("ftruncate requires 1 or 2 arguments".to_string());
    }
    let n = eval_to_f64(&eval_with_env(&args[0], env)?)?;
    let d = if args.len() == 2 { eval_to_f64(&eval_with_env(&args[1], env)?)? } else { 1.0 };
    if d == 0.0 { return Err("Division by zero".to_string()); }
    let q = (n / d).trunc();
    let r = n - q * d;
    Ok(EvalResult::MultipleValues(vec![EvalResult::Float(q), EvalResult::Float(r)]))
}

pub(super) fn eval_fround(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() || args.len() > 2 {
        return Err("fround requires 1 or 2 arguments".to_string());
    }
    let n = eval_to_f64(&eval_with_env(&args[0], env)?)?;
    let d = if args.len() == 2 { eval_to_f64(&eval_with_env(&args[1], env)?)? } else { 1.0 };
    if d == 0.0 { return Err("Division by zero".to_string()); }
    let q_raw = n / d;
    let q = {
        let sign = if q_raw.is_sign_negative() { -1.0 } else { 1.0 };
        let abs = q_raw.abs();
        let i = abs.floor();
        let frac = abs - i;
        let rounded = if frac < 0.5 {
            i
        } else if frac > 0.5 {
            i + 1.0
        } else if (i as i64) % 2 == 0 {
            i
        } else {
            i + 1.0
        };
        sign * rounded
    };
    let r = n - q * d;
    Ok(EvalResult::MultipleValues(vec![EvalResult::Float(q), EvalResult::Float(r)]))
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

    let idx = match &index {
        EvalResult::Fixnum(i) => {
            if *i < 0 { return Err("logbitp: index must be non-negative".to_string()); }
            *i as u64
        }
        EvalResult::Bignum(b) => {
            // Very large index - for positive numbers all high bits are 0, for negative all are 1
            match &integer {
                EvalResult::Fixnum(n) => return Ok(EvalResult::Boolean(*n < 0)),
                EvalResult::Bignum(bn) => return Ok(EvalResult::Boolean(*bn < malachite::Integer::from(0))),
                _ => return Err("logbitp requires integer arguments".to_string()),
            }
        }
        _ => return Err("logbitp requires integer arguments".to_string()),
    };

    match &integer {
        EvalResult::Fixnum(n) => {
            if idx >= 64 {
                // For fixnum, bits above 63 follow the sign
                Ok(EvalResult::Boolean(*n < 0))
            } else {
                Ok(EvalResult::Boolean((*n & (1_i64 << idx)) != 0))
            }
        }
        EvalResult::Bignum(b) => {
            use malachite::num::logic::traits::BitAccess;
            let bit_set = b.get_bit(idx);
            Ok(EvalResult::Boolean(bit_set))
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
        EvalResult::Bignum(b) => f64::rounding_from(&b, RoundingMode::Nearest).0,
        EvalResult::Ratio(r) => f64::rounding_from(&r, RoundingMode::Nearest).0,
        _ => return Err("sqrt requires a numeric argument".to_string()),
    };

    if num < 0.0 {
        // Return complex number for negative sqrt
        return Ok(EvalResult::Complex(0.0, (-num).sqrt()));
    }

    Ok(EvalResult::Float(num.sqrt()))
}

pub(super) fn eval_isqrt(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("isqrt requires 1 argument".to_string());
    }

    let value = primary_value(eval_with_env(&args[0], env)?);
    let n = match value {
        EvalResult::Fixnum(v) => {
            if v < 0 {
                return Err("isqrt requires a non-negative integer".to_string());
            }
            Integer::from(v)
        }
        EvalResult::Bignum(v) => {
            if v < 0 {
                return Err("isqrt requires a non-negative integer".to_string());
            }
            v
        }
        _ => return Err("isqrt requires a non-negative integer".to_string()),
    };

    // Exact integer sqrt via monotonic binary search.
    if n <= 1 {
        return if i64::convertible_from(&n) {
            Ok(EvalResult::Fixnum(i64::exact_from(&n)))
        } else {
            Ok(EvalResult::Bignum(n))
        };
    }

    let mut lo = Integer::from(0);
    let mut hi = &n + Integer::from(1);
    while &lo + Integer::from(1) < hi {
        let mid = (&lo + &hi) >> 1;
        let mid_sq = &mid * &mid;
        if mid_sq <= n {
            lo = mid;
        } else {
            hi = mid;
        }
    }

    if i64::convertible_from(&lo) {
        Ok(EvalResult::Fixnum(i64::exact_from(&lo)))
    } else {
        Ok(EvalResult::Bignum(lo))
    }
}

pub(super) fn eval_complex(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (complex real &optional imaginary)
    if args.is_empty() || args.len() > 2 {
        return Err("complex requires 1-2 arguments (real and optional imaginary parts)".to_string());
    }

    let real = primary_value(eval_with_env(&args[0], env)?);
    let imag = if args.len() == 2 {
        primary_value(eval_with_env(&args[1], env)?)
    } else {
        EvalResult::Fixnum(0)
    };

    // Check if imaginary is zero for rational inputs (CL canonicalization)
    let imag_is_zero = match &imag {
        EvalResult::Fixnum(0) => true,
        EvalResult::Bignum(b) => *b == Integer::from(0),
        EvalResult::Ratio(r) => *r == malachite::Rational::from(0),
        EvalResult::Float(f) => *f == 0.0,
        _ => false,
    };
    let real_is_rational = matches!(&real, EvalResult::Fixnum(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_));
    let imag_is_rational = matches!(&imag, EvalResult::Fixnum(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_));

    // CL rule: (complex a 0) for rational a returns a, not #c(a 0)
    if imag_is_zero && real_is_rational && imag_is_rational {
        return Ok(real);
    }

    // Convert to f64
    let real_f64 = match &real {
        EvalResult::Fixnum(n) => *n as f64,
        EvalResult::Float(f) => *f,
        EvalResult::Bignum(b) => {
            use malachite::num::conversion::traits::RoundingFrom;
            use malachite::rounding_modes::RoundingMode;
            f64::rounding_from(b, RoundingMode::Nearest).0
        }
        EvalResult::Ratio(r) => {
            use malachite::num::conversion::traits::RoundingFrom;
            use malachite::rounding_modes::RoundingMode;
            f64::rounding_from(r, RoundingMode::Nearest).0
        }
        _ => return Err("complex: real part must be a number".to_string()),
    };

    let imag_f64 = match &imag {
        EvalResult::Fixnum(n) => *n as f64,
        EvalResult::Float(f) => *f,
        EvalResult::Bignum(b) => {
            use malachite::num::conversion::traits::RoundingFrom;
            use malachite::rounding_modes::RoundingMode;
            f64::rounding_from(b, RoundingMode::Nearest).0
        }
        EvalResult::Ratio(r) => {
            use malachite::num::conversion::traits::RoundingFrom;
            use malachite::rounding_modes::RoundingMode;
            f64::rounding_from(r, RoundingMode::Nearest).0
        }
        _ => return Err("complex: imaginary part must be a number".to_string()),
    };

    Ok(EvalResult::Complex(real_f64, imag_f64))
}

pub(super) fn eval_realpart(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (realpart complex-number)
    if args.len() != 1 {
        return Err("realpart requires 1 argument".to_string());
    }

    let val = primary_value(eval_with_env(&args[0], env)?);

    match val {
        EvalResult::Complex(re, _im) => Ok(EvalResult::Float(re)),
        // If it's a real number, return it as-is
        EvalResult::Fixnum(_) | EvalResult::Float(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_) => Ok(val),
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

    let to_integer = |v: EvalResult| -> Option<Integer> {
        match v {
            EvalResult::Fixnum(n) => Some(Integer::from(n)),
            EvalResult::Bignum(b) => Some(b),
            _ => None,
        }
    };

    let n = to_integer(num).ok_or_else(|| "ratio requires integer arguments".to_string())?;
    let d = to_integer(denom).ok_or_else(|| "ratio requires integer arguments".to_string())?;
    if d == Integer::from(0) {
        return Err("Division by zero in ratio".to_string());
    }

    let ratio = Rational::from_integers(n, d);
    if ratio.denominator_ref() == &1u32 {
        let numerator = Integer::from(ratio.numerator_ref().clone());
        if i64::convertible_from(&numerator) {
            Ok(EvalResult::Fixnum(i64::exact_from(&numerator)))
        } else {
            Ok(EvalResult::Bignum(numerator))
        }
    } else {
        Ok(EvalResult::Ratio(ratio))
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

    match val {
        EvalResult::Complex(_re, im) => Ok(EvalResult::Float(im)),
        // If it's a real number, return 0
        EvalResult::Fixnum(_) | EvalResult::Float(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_) => Ok(EvalResult::Fixnum(0)),
        _ => Err("imagpart requires a number".to_string()),
    }
}
