/// eval_numeric.rs - Common Lisp numeric builtins
use super::eval_types::EvalResult;
use std::collections::HashMap;
use malachite::Integer;
use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

pub fn register_numeric_builtins(env: &mut HashMap<String, EvalResult>) {
    // Numeric predicates
    env.insert("numberp".to_string(), EvalResult::BuiltinFunction("numberp".to_string()));
    env.insert("integerp".to_string(), EvalResult::BuiltinFunction("integerp".to_string()));
    env.insert("floatp".to_string(), EvalResult::BuiltinFunction("floatp".to_string()));
    env.insert("rationalp".to_string(), EvalResult::BuiltinFunction("rationalp".to_string()));
    env.insert("realp".to_string(), EvalResult::BuiltinFunction("realp".to_string()));
    env.insert("complexp".to_string(), EvalResult::BuiltinFunction("complexp".to_string()));
    env.insert("zerop".to_string(), EvalResult::BuiltinFunction("zerop".to_string()));
    env.insert("plusp".to_string(), EvalResult::BuiltinFunction("plusp".to_string()));
    env.insert("minusp".to_string(), EvalResult::BuiltinFunction("minusp".to_string()));
    env.insert("evenp".to_string(), EvalResult::BuiltinFunction("evenp".to_string()));
    env.insert("oddp".to_string(), EvalResult::BuiltinFunction("oddp".to_string()));

    // Numeric comparison
    env.insert("=".to_string(), EvalResult::BuiltinFunction("=".to_string()));
    env.insert("/=".to_string(), EvalResult::BuiltinFunction("/=".to_string()));

    // Math functions
    env.insert("abs".to_string(), EvalResult::BuiltinFunction("abs".to_string()));
    env.insert("signum".to_string(), EvalResult::BuiltinFunction("signum".to_string()));
    env.insert("sqrt".to_string(), EvalResult::BuiltinFunction("sqrt".to_string()));
    env.insert("exp".to_string(), EvalResult::BuiltinFunction("exp".to_string()));
    env.insert("expt".to_string(), EvalResult::BuiltinFunction("expt".to_string()));
    env.insert("log".to_string(), EvalResult::BuiltinFunction("log".to_string()));
    env.insert("sin".to_string(), EvalResult::BuiltinFunction("sin".to_string()));
    env.insert("cos".to_string(), EvalResult::BuiltinFunction("cos".to_string()));
    env.insert("tan".to_string(), EvalResult::BuiltinFunction("tan".to_string()));
    env.insert("asin".to_string(), EvalResult::BuiltinFunction("asin".to_string()));
    env.insert("acos".to_string(), EvalResult::BuiltinFunction("acos".to_string()));
    env.insert("atan".to_string(), EvalResult::BuiltinFunction("atan".to_string()));
    env.insert("sinh".to_string(), EvalResult::BuiltinFunction("sinh".to_string()));
    env.insert("cosh".to_string(), EvalResult::BuiltinFunction("cosh".to_string()));
    env.insert("tanh".to_string(), EvalResult::BuiltinFunction("tanh".to_string()));

    // Rounding functions
    env.insert("truncate".to_string(), EvalResult::BuiltinFunction("truncate".to_string()));
    env.insert("round".to_string(), EvalResult::BuiltinFunction("round".to_string()));
    env.insert("ffloor".to_string(), EvalResult::BuiltinFunction("ffloor".to_string()));
    env.insert("fceiling".to_string(), EvalResult::BuiltinFunction("fceiling".to_string()));
    env.insert("ftruncate".to_string(), EvalResult::BuiltinFunction("ftruncate".to_string()));
    env.insert("fround".to_string(), EvalResult::BuiltinFunction("fround".to_string()));

    // Logical operations on integers
    env.insert("logand".to_string(), EvalResult::BuiltinFunction("logand".to_string()));
    env.insert("logior".to_string(), EvalResult::BuiltinFunction("logior".to_string()));
    env.insert("logxor".to_string(), EvalResult::BuiltinFunction("logxor".to_string()));
    env.insert("lognot".to_string(), EvalResult::BuiltinFunction("lognot".to_string()));
    env.insert("logeqv".to_string(), EvalResult::BuiltinFunction("logeqv".to_string()));
    env.insert("lognand".to_string(), EvalResult::BuiltinFunction("lognand".to_string()));
    env.insert("lognor".to_string(), EvalResult::BuiltinFunction("lognor".to_string()));
    env.insert("logandc1".to_string(), EvalResult::BuiltinFunction("logandc1".to_string()));
    env.insert("logandc2".to_string(), EvalResult::BuiltinFunction("logandc2".to_string()));
    env.insert("logorc1".to_string(), EvalResult::BuiltinFunction("logorc1".to_string()));
    env.insert("logorc2".to_string(), EvalResult::BuiltinFunction("logorc2".to_string()));
    env.insert("logbitp".to_string(), EvalResult::BuiltinFunction("logbitp".to_string()));
    env.insert("logcount".to_string(), EvalResult::BuiltinFunction("logcount".to_string()));

    // Integer operations
    env.insert("mod".to_string(), EvalResult::BuiltinFunction("mod".to_string()));
    env.insert("rem".to_string(), EvalResult::BuiltinFunction("rem".to_string()));
    env.insert("gcd".to_string(), EvalResult::BuiltinFunction("gcd".to_string()));
    env.insert("lcm".to_string(), EvalResult::BuiltinFunction("lcm".to_string()));
    env.insert("integer-length".to_string(), EvalResult::BuiltinFunction("integer-length".to_string()));

    // Type constructors (for reading back typed values)
    env.insert("fixnum".to_string(), EvalResult::BuiltinFunction("fixnum".to_string()));
    env.insert("bignum".to_string(), EvalResult::BuiltinFunction("bignum".to_string()));
    env.insert("float".to_string(), EvalResult::BuiltinFunction("float".to_string()));
    env.insert("string".to_string(), EvalResult::BuiltinFunction("string".to_string()));
    env.insert("symbol".to_string(), EvalResult::BuiltinFunction("symbol".to_string()));
    env.insert("character".to_string(), EvalResult::BuiltinFunction("character".to_string()));

    // Float operations
    env.insert("float-radix".to_string(), EvalResult::BuiltinFunction("float-radix".to_string()));
    env.insert("float-sign".to_string(), EvalResult::BuiltinFunction("float-sign".to_string()));
    env.insert("float-digits".to_string(), EvalResult::BuiltinFunction("float-digits".to_string()));
    env.insert("float-precision".to_string(), EvalResult::BuiltinFunction("float-precision".to_string()));
    env.insert("decode-float".to_string(), EvalResult::BuiltinFunction("decode-float".to_string()));
    env.insert("scale-float".to_string(), EvalResult::BuiltinFunction("scale-float".to_string()));
    env.insert("integer-decode-float".to_string(), EvalResult::BuiltinFunction("integer-decode-float".to_string()));

    // Rational/complex operations
    env.insert("ratio".to_string(), EvalResult::BuiltinFunction("ratio".to_string()));
    env.insert("numerator".to_string(), EvalResult::BuiltinFunction("numerator".to_string()));
    env.insert("denominator".to_string(), EvalResult::BuiltinFunction("denominator".to_string()));
    env.insert("rational".to_string(), EvalResult::BuiltinFunction("rational".to_string()));
    env.insert("rationalize".to_string(), EvalResult::BuiltinFunction("rationalize".to_string()));
    env.insert("realpart".to_string(), EvalResult::BuiltinFunction("realpart".to_string()));
    env.insert("imagpart".to_string(), EvalResult::BuiltinFunction("imagpart".to_string()));
    env.insert("complex".to_string(), EvalResult::BuiltinFunction("complex".to_string()));
    env.insert("conjugate".to_string(), EvalResult::BuiltinFunction("conjugate".to_string()));
    env.insert("phase".to_string(), EvalResult::BuiltinFunction("phase".to_string()));
    env.insert("cis".to_string(), EvalResult::BuiltinFunction("cis".to_string()));

    // Random numbers
    env.insert("random".to_string(), EvalResult::BuiltinFunction("random".to_string()));
    env.insert("make-random-state".to_string(), EvalResult::BuiltinFunction("make-random-state".to_string()));
    env.insert("random-state-p".to_string(), EvalResult::BuiltinFunction("random-state-p".to_string()));
}

pub fn call_numeric_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        // Type constructors (for reading back typed values)
        "fixnum" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Fixnum(*n)),
            _ => Err("fixnum requires an integer argument".to_string()),
        },
        "bignum" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Bignum((*n).into())),
            Some(EvalResult::Bignum(n)) => Ok(EvalResult::Bignum(n.clone())),
            _ => Err("bignum requires an integer argument".to_string()),
        },
        "string" => match args.get(0) {
            Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
            _ => Err("string requires a string argument".to_string()),
        },
        "symbol" => match args.get(0) {
            Some(EvalResult::Symbol(s)) => Ok(EvalResult::Symbol(s.clone())),
            _ => Err("symbol requires a symbol argument".to_string()),
        },
        "character" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Character(*c)),
            _ => Err("character requires a character argument".to_string()),
        },

        // Predicates
        "numberp" => Ok(EvalResult::Boolean(matches!(args.get(0),
            Some(EvalResult::Float(_)) | Some(EvalResult::Fixnum(_)) | Some(EvalResult::Bignum(_)) |
            Some(EvalResult::Ratio(_)) | Some(EvalResult::Complex(_, _))))),
        "integerp" => Ok(EvalResult::Boolean(match args.get(0) {
            Some(EvalResult::Fixnum(_)) | Some(EvalResult::Bignum(_)) => true,
            Some(EvalResult::Float(n)) => n.fract() == 0.0,
            _ => false,
        })),
        "floatp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::Float(_))))),
        "rationalp" => Ok(EvalResult::Boolean(matches!(args.get(0),
            Some(EvalResult::Fixnum(_)) | Some(EvalResult::Bignum(_)) | Some(EvalResult::Ratio(_))))),
        "realp" => Ok(EvalResult::Boolean(matches!(args.get(0),
            Some(EvalResult::Fixnum(_)) | Some(EvalResult::Bignum(_)) | Some(EvalResult::Float(_)) | Some(EvalResult::Ratio(_))))),
        "complexp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::Complex(_, _))))),
        "zerop" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Boolean(*n == 0)),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Boolean(*n == 0.0)),
            Some(EvalResult::Bignum(n)) => Ok(EvalResult::Boolean(*n == 0)),
            _ => Err("zerop requires a number".to_string()),
        },
        "plusp" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Boolean(*n > 0)),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Boolean(*n > 0.0)),
            Some(EvalResult::Bignum(n)) => Ok(EvalResult::Boolean(*n > 0)),
            _ => Err("plusp requires a number".to_string()),
        },
        "minusp" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Boolean(*n < 0)),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Boolean(*n < 0.0)),
            Some(EvalResult::Bignum(n)) => Ok(EvalResult::Boolean(*n < 0)),
            _ => Err("minusp requires a number".to_string()),
        },
        "evenp" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Boolean(*n % 2 == 0)),
            Some(EvalResult::Float(n)) if n.fract() == 0.0 => Ok(EvalResult::Boolean((*n as i64) % 2 == 0)),
            Some(EvalResult::Bignum(n)) => {
                use malachite::num::arithmetic::traits::DivisibleBy;
                Ok(EvalResult::Boolean(n.divisible_by(&malachite::Integer::from(2))))
            },
            _ => Err("evenp requires an integer".to_string()),
        },
        "oddp" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Boolean(*n % 2 != 0)),
            Some(EvalResult::Float(n)) if n.fract() == 0.0 => Ok(EvalResult::Boolean((*n as i64) % 2 != 0)),
            Some(EvalResult::Bignum(n)) => {
                use malachite::num::arithmetic::traits::DivisibleBy;
                Ok(EvalResult::Boolean(!n.divisible_by(&malachite::Integer::from(2))))
            },
            _ => Err("oddp requires an integer".to_string()),
        },

        // Math functions
        "abs" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => {
                if *n == i64::MIN {
                    // i64::MIN.abs() overflows - promote to bignum
                    let big = malachite::Integer::from(*n);
                    let abs_val = if big < malachite::Integer::from(0) { -big } else { big };
                    Ok(EvalResult::Bignum(abs_val))
                } else {
                    Ok(EvalResult::Fixnum(n.abs()))
                }
            }
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.abs())),
            Some(EvalResult::Bignum(b)) => {
                let abs_val = if *b < malachite::Integer::from(0) { -b } else { b.clone() };
                Ok(EvalResult::Bignum(abs_val))
            }
            Some(EvalResult::Ratio(r)) => {
                let abs_val = if *r < malachite::Rational::from(0) { -r } else { r.clone() };
                Ok(EvalResult::Ratio(abs_val))
            }
            Some(EvalResult::Complex(re, im)) => Ok(EvalResult::Float((re * re + im * im).sqrt())),
            _ => Err("abs requires a number".to_string()),
        },
        "sqrt" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.sqrt())),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.sqrt())),
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Float((*n as f64).sqrt())),
            _ => Err("sqrt requires a number".to_string()),
        },
        "exp" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.exp())),
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Float((*n as f64).exp())),
            _ => Err("exp requires a number".to_string()),
        },
        "log" => {
            let val = args.get(0).ok_or_else(|| "log requires a number".to_string())?;
            let num = match val {
                EvalResult::Float(n) => *n,
                EvalResult::Fixnum(n) => *n as f64,
                EvalResult::Bignum(b) => { let s = b.to_string(); s.parse::<f64>().unwrap_or(f64::INFINITY) }
                EvalResult::Ratio(r) => { let n = r.numerator_ref().to_string().parse::<f64>().unwrap_or(0.0); let d = r.denominator_ref().to_string().parse::<f64>().unwrap_or(1.0); n / d }
                _ => return Err("log requires a number".to_string()),
            };
            if args.len() == 2 {
                let base = match &args[1] {
                    EvalResult::Float(n) => *n,
                    EvalResult::Fixnum(n) => *n as f64,
                    EvalResult::Bignum(b) => { let s = b.to_string(); s.parse::<f64>().unwrap_or(f64::INFINITY) }
                    _ => return Err("log: base must be a number".to_string()),
                };
                Ok(EvalResult::Float(num.ln() / base.ln()))
            } else {
                Ok(EvalResult::Float(num.ln()))
            }
        },
        "sin" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.sin())),
            _ => Err("sin requires a number".to_string()),
        },
        "cos" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.cos())),
            _ => Err("cos requires a number".to_string()),
        },
        "tan" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.tan())),
            _ => Err("tan requires a number".to_string()),
        },
        "asin" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.asin())),
            _ => Err("asin requires a number".to_string()),
        },
        "acos" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.acos())),
            _ => Err("acos requires a number".to_string()),
        },
        "atan" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.atan())),
            _ => Err("atan requires a number".to_string()),
        },
        "sinh" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.sinh())),
            _ => Err("sinh requires a number".to_string()),
        },
        "cosh" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.cosh())),
            _ => Err("cosh requires a number".to_string()),
        },
        "tanh" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.tanh())),
            _ => Err("tanh requires a number".to_string()),
        },

        // Rounding
        "truncate" => {
            // This path is for BuiltinFunction call with pre-evaluated args
            if args.is_empty() { return Err("truncate requires at least 1 argument".to_string()); }
            let num = &args[0];
            let div = args.get(1);
            match (num, div) {
                (EvalResult::Float(n), None) => {
                    let q = n.trunc();
                    let r = n - q;
                    Ok(EvalResult::MultipleValues(vec![EvalResult::Fixnum(q as i64), EvalResult::Float(r)]))
                }
                (EvalResult::Fixnum(n), None) => {
                    Ok(EvalResult::MultipleValues(vec![EvalResult::Fixnum(*n), EvalResult::Fixnum(0)]))
                }
                (EvalResult::Fixnum(n), Some(EvalResult::Fixnum(d))) if *d != 0 => {
                    let q = n / d;
                    let r = n - q * d;
                    Ok(EvalResult::MultipleValues(vec![EvalResult::Fixnum(q), EvalResult::Fixnum(r)]))
                }
                _ => Err("truncate: unsupported argument types".to_string()),
            }
        },
        "round" => {
            if args.is_empty() { return Err("round requires at least 1 argument".to_string()); }
            let num = &args[0];
            let div = args.get(1);
            match (num, div) {
                (EvalResult::Float(n), None) => {
                    let q = n.round();
                    let r = n - q;
                    Ok(EvalResult::MultipleValues(vec![EvalResult::Fixnum(q as i64), EvalResult::Float(r)]))
                }
                (EvalResult::Fixnum(n), None) => {
                    Ok(EvalResult::MultipleValues(vec![EvalResult::Fixnum(*n), EvalResult::Fixnum(0)]))
                }
                (EvalResult::Fixnum(n), Some(EvalResult::Fixnum(d))) if *d != 0 => {
                    // Round to nearest, ties to even
                    let q = (*n as f64 / *d as f64).round() as i64;
                    let r = n - q * d;
                    Ok(EvalResult::MultipleValues(vec![EvalResult::Fixnum(q), EvalResult::Fixnum(r)]))
                }
                _ => Err("round: unsupported argument types".to_string()),
            }
        },

        // Integer operations
        "mod" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Float(a)), Some(EvalResult::Float(b))) => {
                Ok(EvalResult::Float((*a as i64 % *b as i64) as f64))
            }
            _ => Err("mod requires two integers".to_string()),
        },
        "rem" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Float(a)), Some(EvalResult::Float(b))) => {
                Ok(EvalResult::Float((*a as i64 % *b as i64) as f64))
            }
            _ => Err("rem requires two integers".to_string()),
        },

        // Additional math operations
        "max" => {
            if args.is_empty() {
                return Err("max requires at least 1 argument".to_string());
            }
            let mut max_val = match args[0] {
                EvalResult::Float(n) => n,
                EvalResult::Fixnum(i) => i as f64,
                _ => return Err("max requires numeric arguments".to_string()),
            };
            for arg in &args[1..] {
                let val = match arg {
                    EvalResult::Float(n) => *n,
                    EvalResult::Fixnum(i) => *i as f64,
                    _ => return Err("max requires numeric arguments".to_string()),
                };
                if val > max_val {
                    max_val = val;
                }
            }
            Ok(EvalResult::Float(max_val))
        }

        "min" => {
            if args.is_empty() {
                return Err("min requires at least 1 argument".to_string());
            }
            let mut min_val = match args[0] {
                EvalResult::Float(n) => n,
                EvalResult::Fixnum(i) => i as f64,
                _ => return Err("min requires numeric arguments".to_string()),
            };
            for arg in &args[1..] {
                let val = match arg {
                    EvalResult::Float(n) => *n,
                    EvalResult::Fixnum(i) => *i as f64,
                    _ => return Err("min requires numeric arguments".to_string()),
                };
                if val < min_val {
                    min_val = val;
                }
            }
            Ok(EvalResult::Float(min_val))
        }

        "expt" => {
            if args.len() != 2 {
                return Err("expt requires 2 arguments".to_string());
            }
            let base = &args[0];
            let power = &args[1];
            let has_complex = matches!(base, EvalResult::Complex(_, _)) || matches!(power, EvalResult::Complex(_, _));
            let has_float = matches!(base, EvalResult::Float(_)) || matches!(power, EvalResult::Float(_));

            if has_complex {
                // Complex exponentiation: base^power using e^(power * ln(base))
                let (br, bi) = match base {
                    EvalResult::Complex(r, i) => (*r, *i),
                    EvalResult::Fixnum(n) => (*n as f64, 0.0),
                    EvalResult::Float(f) => (*f, 0.0),
                    _ => return Err("expt: not a number".to_string()),
                };
                let (pr, pi) = match power {
                    EvalResult::Complex(r, i) => (*r, *i),
                    EvalResult::Fixnum(n) => (*n as f64, 0.0),
                    EvalResult::Float(f) => (*f, 0.0),
                    _ => return Err("expt: not a number".to_string()),
                };
                // If power is an integer, use repeated multiplication for exactness
                if pi == 0.0 && pr == pr.floor() && pr.abs() < 1000.0 {
                    let n = pr as i64;
                    if n >= 0 {
                        let mut re = 1.0_f64;
                        let mut im = 0.0_f64;
                        for _ in 0..n {
                            let new_re = re * br - im * bi;
                            let new_im = re * bi + im * br;
                            re = new_re;
                            im = new_im;
                        }
                        // Canonicalize: if imaginary is ~0 and base was exact, return integer
                        if im.abs() < 1e-10 && bi == 0.0 {
                            let r = re.round();
                            if (re - r).abs() < 1e-10 {
                                return Ok(EvalResult::Fixnum(r as i64));
                            }
                        }
                        if im.abs() < 1e-10 && !has_float {
                            im = 0.0;
                            let r = re.round();
                            if (re - r).abs() < 1e-10 {
                                return Ok(EvalResult::Fixnum(r as i64));
                            }
                        }
                        if im == 0.0 {
                            return Ok(EvalResult::Float(re));
                        }
                        return Ok(EvalResult::Complex(re, im));
                    }
                }
                // General case: use polar form
                let mag = (br * br + bi * bi).sqrt();
                let angle = bi.atan2(br);
                let ln_mag = mag.ln();
                // ln(base) = ln_mag + angle*i
                // power * ln(base) = (pr*ln_mag - pi*angle) + (pr*angle + pi*ln_mag)*i
                let exp_re = pr * ln_mag - pi * angle;
                let exp_im = pr * angle + pi * ln_mag;
                let result_mag = exp_re.exp();
                let re = result_mag * exp_im.cos();
                let im = result_mag * exp_im.sin();
                if im.abs() < 1e-10 {
                    Ok(EvalResult::Float(re))
                } else {
                    Ok(EvalResult::Complex(re, im))
                }
            } else {
                match (base, power) {
                    (EvalResult::Float(b), EvalResult::Float(p)) => {
                        Ok(EvalResult::Float(b.powf(*p)))
                    }
                    (EvalResult::Fixnum(b), EvalResult::Fixnum(p)) => {
                        if *p >= 0 {
                            use malachite::num::arithmetic::traits::Pow;
                            let result = Integer::from(*b).pow(*p as u64);
                            if i64::convertible_from(&result) {
                                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
                            } else {
                                Ok(EvalResult::Bignum(result))
                            }
                        } else {
                            // Negative integer exponent: return ratio
                            use malachite::Rational;
                            use malachite::num::arithmetic::traits::Pow;
                            let base_r = Rational::from(*b);
                            let result = Rational::from(1) / Rational::from(Integer::from(*b).pow((-*p) as u64));
                            if result.denominator_ref() == &1u32 {
                                let n = Integer::from(result.numerator_ref().clone());
                                if i64::convertible_from(&n) {
                                    Ok(EvalResult::Fixnum(i64::exact_from(&n)))
                                } else {
                                    Ok(EvalResult::Bignum(n))
                                }
                            } else {
                                Ok(EvalResult::Ratio(result))
                            }
                        }
                    }
                    (EvalResult::Fixnum(b), EvalResult::Float(p)) => {
                        Ok(EvalResult::Float((*b as f64).powf(*p)))
                    }
                    (EvalResult::Float(b), EvalResult::Fixnum(p)) => {
                        Ok(EvalResult::Float(b.powf(*p as f64)))
                    }
                    (EvalResult::Ratio(b), EvalResult::Fixnum(p)) => {
                        use malachite::Rational;
                        use malachite::num::arithmetic::traits::Pow;
                        if *p >= 0 {
                            let num = Integer::from(b.numerator_ref().clone()).pow(*p as u64);
                            let den = Integer::from(b.denominator_ref().clone()).pow(*p as u64);
                            let result = Rational::from(num) / Rational::from(den);
                            if result.denominator_ref() == &1u32 {
                                let n = Integer::from(result.numerator_ref().clone());
                                if i64::convertible_from(&n) {
                                    Ok(EvalResult::Fixnum(i64::exact_from(&n)))
                                } else {
                                    Ok(EvalResult::Bignum(n))
                                }
                            } else {
                                Ok(EvalResult::Ratio(result))
                            }
                        } else {
                            // Negative: flip and raise to positive power
                            let num = Integer::from(b.denominator_ref().clone()).pow((-*p) as u64);
                            let den = Integer::from(b.numerator_ref().clone()).pow((-*p) as u64);
                            let result = Rational::from(num) / Rational::from(den);
                            Ok(EvalResult::Ratio(result))
                        }
                    }
                    _ => {
                        // Fallback: convert to f64
                        let b = match base {
                            EvalResult::Fixnum(n) => *n as f64,
                            EvalResult::Float(f) => *f,
                            EvalResult::Bignum(b) => { let s = b.to_string(); s.parse::<f64>().unwrap_or(0.0) }
                            EvalResult::Ratio(r) => { let n = r.numerator_ref().to_string().parse::<f64>().unwrap_or(0.0); let d = r.denominator_ref().to_string().parse::<f64>().unwrap_or(1.0); n / d }
                            _ => return Err("expt: not a number".to_string()),
                        };
                        let p = match power {
                            EvalResult::Fixnum(n) => *n as f64,
                            EvalResult::Float(f) => *f,
                            EvalResult::Bignum(b) => { let s = b.to_string(); s.parse::<f64>().unwrap_or(0.0) }
                            EvalResult::Ratio(r) => { let n = r.numerator_ref().to_string().parse::<f64>().unwrap_or(0.0); let d = r.denominator_ref().to_string().parse::<f64>().unwrap_or(1.0); n / d }
                            _ => return Err("expt: not a number".to_string()),
                        };
                        Ok(EvalResult::Float(b.powf(p)))
                    }
                }
            }
        }

        "gcd" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            if args.is_empty() {
                return Ok(EvalResult::Fixnum(0));
            }
            fn gcd_big(a: &Integer, b: &Integer) -> Integer {
                use malachite::num::arithmetic::traits::Gcd;
                let au = a.unsigned_abs_ref().clone();
                let bu = b.unsigned_abs_ref().clone();
                Integer::from(au.gcd(bu))
            }
            let mut result = match &args[0] {
                EvalResult::Fixnum(i) => Integer::from(*i),
                EvalResult::Bignum(b) => b.clone(),
                _ => return Err("gcd requires integers".to_string()),
            };
            for arg in &args[1..] {
                let val = match arg {
                    EvalResult::Fixnum(i) => Integer::from(*i),
                    EvalResult::Bignum(b) => b.clone(),
                    _ => return Err("gcd requires integers".to_string()),
                };
                result = gcd_big(&result, &val);
            }
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
        }

        "lcm" => {
            if args.is_empty() {
                return Ok(EvalResult::Fixnum(1));
            }
            fn gcd_two(a: i64, b: i64) -> i64 {
                if b == 0 { a.abs() } else { gcd_two(b, a % b) }
            }
            fn lcm_two(a: i64, b: i64) -> i64 {
                if a == 0 || b == 0 { 0 } else { (a * b).abs() / gcd_two(a, b) }
            }
            let mut result = match args[0] {
                EvalResult::Fixnum(i) => i,
                EvalResult::Float(n) => n as i64,
                _ => return Err("lcm requires integers".to_string()),
            };
            for arg in &args[1..] {
                let val = match arg {
                    EvalResult::Fixnum(i) => *i,
                    EvalResult::Float(n) => *n as i64,
                    _ => return Err("lcm requires integers".to_string()),
                };
                result = lcm_two(result, val);
            }
            Ok(EvalResult::Fixnum(result))
        }

        "boole" => {
            // (boole op integer1 integer2) - bitwise operation
            // For now, stub - would need to implement boole constants
            Err("boole not fully implemented yet".to_string())
        }

        "signum" => match args.get(0) {
            Some(EvalResult::Float(n)) => {
                Ok(EvalResult::Float(if *n > 0.0 { 1.0 } else if *n < 0.0 { -1.0 } else { 0.0 }))
            }
            Some(EvalResult::Fixnum(n)) => {
                Ok(EvalResult::Fixnum(if *n > 0 { 1 } else if *n < 0 { -1 } else { 0 }))
            }
            Some(EvalResult::Bignum(b)) => {
                Ok(EvalResult::Fixnum(if *b > malachite::Integer::from(0) { 1 } else if *b < malachite::Integer::from(0) { -1 } else { 0 }))
            }
            Some(EvalResult::Ratio(r)) => {
                Ok(EvalResult::Fixnum(if *r > malachite::Rational::from(0) { 1 } else if *r < malachite::Rational::from(0) { -1 } else { 0 }))
            }
            Some(EvalResult::Complex(re, im)) => {
                let mag = (re * re + im * im).sqrt();
                if mag == 0.0 {
                    Ok(EvalResult::Complex(0.0, 0.0))
                } else {
                    Ok(EvalResult::Complex(re / mag, im / mag))
                }
            }
            _ => Err("signum requires a number".to_string()),
        },

        "float" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Float(*n as f64)),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(*n)),
            Some(EvalResult::Bignum(b)) => {
                let s = b.to_string();
                Ok(EvalResult::Float(s.parse::<f64>().unwrap_or(f64::INFINITY)))
            }
            Some(EvalResult::Ratio(r)) => {
                let n = r.numerator_ref().to_string().parse::<f64>().unwrap_or(0.0);
                let d = r.denominator_ref().to_string().parse::<f64>().unwrap_or(1.0);
                Ok(EvalResult::Float(n / d))
            }
            _ => Err("float requires a number".to_string()),
        },

        "ratio" => {
            use malachite::Rational;
            use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

            match (args.get(0), args.get(1)) {
                (Some(EvalResult::Fixnum(num)), Some(EvalResult::Fixnum(denom))) => {
                    if *denom == 0 {
                        return Err("Division by zero".to_string());
                    }
                    let ratio = Rational::from_signeds(*num, *denom);
                    // If the result is an integer, return fixnum
                    if ratio.denominator_ref() == &1 {
                        let n = ratio.numerator_ref();
                        if i64::convertible_from(n) {
                            return Ok(EvalResult::Fixnum(i64::exact_from(n)));
                        }
                    }
                    Ok(EvalResult::Ratio(ratio))
                }
                _ => Err("ratio requires two integer arguments".to_string()),
            }
        },

        "rational" | "rationalize" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(*n)),
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Fixnum(*n)),
            Some(EvalResult::Ratio(r)) => Ok(EvalResult::Ratio(r.clone())),
            _ => Err("rational requires a number".to_string()),
        },

        "numerator" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Fixnum(*n)),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(*n)),
            Some(EvalResult::Ratio(r)) => {
                use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
                let num = r.numerator_ref();
                if i64::convertible_from(num) {
                    Ok(EvalResult::Fixnum(i64::exact_from(num)))
                } else {
                    Err("numerator too large".to_string())
                }
            }
            _ => Err("numerator requires a rational".to_string()),
        },

        "denominator" => match args.get(0) {
            Some(EvalResult::Fixnum(_)) => Ok(EvalResult::Fixnum(1)),
            Some(EvalResult::Float(_)) => Ok(EvalResult::Float(1.0)),
            Some(EvalResult::Ratio(r)) => {
                use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
                let denom = r.denominator_ref();
                if i64::convertible_from(denom) {
                    Ok(EvalResult::Fixnum(i64::exact_from(denom)))
                } else {
                    Err("denominator too large".to_string())
                }
            }
            _ => Err("denominator requires a rational".to_string()),
        },

        "realpart" => match args.get(0) {
            Some(n @ (EvalResult::Float(_) | EvalResult::Fixnum(_))) => Ok(n.clone()),
            _ => Err("realpart requires a number".to_string()),
        },

        "imagpart" => match args.get(0) {
            Some(EvalResult::Float(_)) => Ok(EvalResult::Float(0.0)),
            Some(EvalResult::Fixnum(_)) => Ok(EvalResult::Fixnum(0)),
            _ => Err("imagpart requires a number".to_string()),
        },

        "complex" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Float(r)), Some(EvalResult::Float(_i))) => Ok(EvalResult::Float(*r)),
            (Some(EvalResult::Fixnum(r)), Some(EvalResult::Fixnum(_i))) => Ok(EvalResult::Fixnum(*r)),
            (Some(r), None) => Ok(r.clone()),
            _ => Err("complex requires 1 or 2 numbers".to_string()),
        },

        "conjugate" => match args.get(0) {
            Some(n @ (EvalResult::Float(_) | EvalResult::Fixnum(_))) => Ok(n.clone()),
            _ => Err("conjugate requires a number".to_string()),
        },

        "complexp" => Ok(EvalResult::Boolean(false)),

        "rationalp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::Fixnum(_) | EvalResult::Float(_))))),

        "realp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::Fixnum(_) | EvalResult::Float(_))))),

        "float-sign" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Float(n)), _) => {
                let sign = if *n >= 0.0 { 1.0 } else { -1.0 };
                Ok(EvalResult::Float(sign))
            }
            _ => Err("float-sign requires a float".to_string()),
        },

        "float-digits" | "float-precision" | "float-radix" => {
            Ok(EvalResult::Fixnum(53))
        },

        "decode-float" => match args.get(0) {
            Some(EvalResult::Float(n)) => {
                Ok(EvalResult::Float(*n))
            }
            _ => Err("decode-float requires a float".to_string()),
        },

        "scale-float" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Float(f)), Some(EvalResult::Fixnum(exp))) => {
                Ok(EvalResult::Float(f * 2.0_f64.powi(*exp as i32)))
            }
            _ => Err("scale-float requires float and integer".to_string()),
        },

        "integer-decode-float" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Fixnum(*n as i64)),
            _ => Err("integer-decode-float requires a float".to_string()),
        },

        "integer-length" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => {
                let bits = if *n == 0 { 0 } else if *n == i64::MIN { 63 } else { 64 - n.abs().leading_zeros() as i64 };
                Ok(EvalResult::Fixnum(bits))
            }
            Some(EvalResult::Bignum(b)) => {
                use malachite::num::logic::traits::SignificantBits;
                let abs_b = b.unsigned_abs_ref();
                let bits = abs_b.significant_bits();
                Ok(EvalResult::Fixnum(bits as i64))
            }
            _ => Err("integer-length requires an integer".to_string()),
        },

        "random" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) if *n > 0 => {
                use std::collections::hash_map::RandomState;
                use std::hash::{BuildHasher, Hash, Hasher};
                let s = RandomState::new();
                let mut hasher = s.build_hasher();
                std::time::SystemTime::now().hash(&mut hasher);
                let r = (hasher.finish() % (*n as u64)) as i64;
                Ok(EvalResult::Fixnum(r))
            }
            Some(EvalResult::Float(n)) if *n > 0.0 => {
                use std::collections::hash_map::RandomState;
                use std::hash::{BuildHasher, Hash, Hasher};
                let s = RandomState::new();
                let mut hasher = s.build_hasher();
                std::time::SystemTime::now().hash(&mut hasher);
                let r = (hasher.finish() as f64 / u64::MAX as f64) * n;
                Ok(EvalResult::Float(r))
            }
            Some(EvalResult::Bignum(b)) if *b > malachite::Integer::from(0) => {
                // For bignum, generate a random number in range [0, b)
                use std::collections::hash_map::RandomState;
                use std::hash::{BuildHasher, Hash, Hasher};
                use malachite::Integer;
                use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
                let s = RandomState::new();
                let mut hasher = s.build_hasher();
                std::time::SystemTime::now().hash(&mut hasher);
                let hash_val = hasher.finish();
                // Simple modular reduction - not cryptographically uniform but sufficient
                let r = Integer::from(hash_val) % b;
                if i64::convertible_from(&r) {
                    Ok(EvalResult::Fixnum(i64::exact_from(&r)))
                } else {
                    Ok(EvalResult::Bignum(r))
                }
            }
            _ => Err("random requires a positive number".to_string()),
        },

        "random-state-p" => Ok(EvalResult::Boolean(false)),

        // Bitwise logic operations
        "logand" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            let mut result = Integer::from(-1);
            for arg in args {
                match arg {
                    EvalResult::Fixnum(n) => result &= Integer::from(*n),
                    EvalResult::Bignum(b) => result &= b,
                    _ => return Err("logand requires integers".to_string()),
                }
            }
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
        },

        "logior" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            let mut result = Integer::from(0);
            for arg in args {
                match arg {
                    EvalResult::Fixnum(n) => result |= Integer::from(*n),
                    EvalResult::Bignum(b) => result |= b,
                    _ => return Err("logior requires integers".to_string()),
                }
            }
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
        },

        "logxor" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            let mut result = Integer::from(0);
            for arg in args {
                match arg {
                    EvalResult::Fixnum(n) => result ^= Integer::from(*n),
                    EvalResult::Bignum(b) => result ^= b,
                    _ => return Err("logxor requires integers".to_string()),
                }
            }
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
        },

        "lognot" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            match args.get(0) {
                Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Fixnum(!n)),
                Some(EvalResult::Bignum(b)) => {
                    let r = !b;
                    if i64::convertible_from(&r) { Ok(EvalResult::Fixnum(i64::exact_from(&r))) } else { Ok(EvalResult::Bignum(r)) }
                }
                _ => Err("lognot requires an integer".to_string()),
            }
        },

        "logandc1" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            fn to_int(v: &EvalResult) -> Option<Integer> {
                match v { EvalResult::Fixnum(n) => Some(Integer::from(*n)), EvalResult::Bignum(b) => Some(b.clone()), _ => None }
            }
            match (args.get(0).and_then(to_int), args.get(1).and_then(to_int)) {
                (Some(a), Some(b)) => { let r = !a & b; if i64::convertible_from(&r) { Ok(EvalResult::Fixnum(i64::exact_from(&r))) } else { Ok(EvalResult::Bignum(r)) } }
                _ => Err("logandc1 requires two integers".to_string()),
            }
        },

        "logandc2" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            fn to_int(v: &EvalResult) -> Option<Integer> {
                match v { EvalResult::Fixnum(n) => Some(Integer::from(*n)), EvalResult::Bignum(b) => Some(b.clone()), _ => None }
            }
            match (args.get(0).and_then(to_int), args.get(1).and_then(to_int)) {
                (Some(a), Some(b)) => { let r = a & !b; if i64::convertible_from(&r) { Ok(EvalResult::Fixnum(i64::exact_from(&r))) } else { Ok(EvalResult::Bignum(r)) } }
                _ => Err("logandc2 requires two integers".to_string()),
            }
        },

        "logorc1" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            fn to_int(v: &EvalResult) -> Option<Integer> {
                match v { EvalResult::Fixnum(n) => Some(Integer::from(*n)), EvalResult::Bignum(b) => Some(b.clone()), _ => None }
            }
            match (args.get(0).and_then(to_int), args.get(1).and_then(to_int)) {
                (Some(a), Some(b)) => { let r = !a | b; if i64::convertible_from(&r) { Ok(EvalResult::Fixnum(i64::exact_from(&r))) } else { Ok(EvalResult::Bignum(r)) } }
                _ => Err("logorc1 requires two integers".to_string()),
            }
        },

        "logorc2" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            fn to_int(v: &EvalResult) -> Option<Integer> {
                match v { EvalResult::Fixnum(n) => Some(Integer::from(*n)), EvalResult::Bignum(b) => Some(b.clone()), _ => None }
            }
            match (args.get(0).and_then(to_int), args.get(1).and_then(to_int)) {
                (Some(a), Some(b)) => { let r = a | !b; if i64::convertible_from(&r) { Ok(EvalResult::Fixnum(i64::exact_from(&r))) } else { Ok(EvalResult::Bignum(r)) } }
                _ => Err("logorc2 requires two integers".to_string()),
            }
        },

        "lognand" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            fn to_int(v: &EvalResult) -> Option<Integer> {
                match v { EvalResult::Fixnum(n) => Some(Integer::from(*n)), EvalResult::Bignum(b) => Some(b.clone()), _ => None }
            }
            match (args.get(0).and_then(to_int), args.get(1).and_then(to_int)) {
                (Some(a), Some(b)) => { let r = !(a & b); if i64::convertible_from(&r) { Ok(EvalResult::Fixnum(i64::exact_from(&r))) } else { Ok(EvalResult::Bignum(r)) } }
                _ => Err("lognand requires two integers".to_string()),
            }
        },

        "lognor" => {
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            fn to_int(v: &EvalResult) -> Option<Integer> {
                match v { EvalResult::Fixnum(n) => Some(Integer::from(*n)), EvalResult::Bignum(b) => Some(b.clone()), _ => None }
            }
            match (args.get(0).and_then(to_int), args.get(1).and_then(to_int)) {
                (Some(a), Some(b)) => { let r = !(a | b); if i64::convertible_from(&r) { Ok(EvalResult::Fixnum(i64::exact_from(&r))) } else { Ok(EvalResult::Bignum(r)) } }
                _ => Err("lognor requires two integers".to_string()),
            }
        },

        "logeqv" => {
            // (logeqv) = -1, (logeqv x) = x, (logeqv a b ...) = !xor of all
            use malachite::Integer;
            use malachite::num::conversion::traits::{ExactFrom, ConvertibleFrom};
            if args.is_empty() {
                return Ok(EvalResult::Fixnum(-1));
            }
            let mut result = match &args[0] {
                EvalResult::Fixnum(n) => Integer::from(*n),
                EvalResult::Bignum(b) => b.clone(),
                _ => return Err("logeqv requires integers".to_string()),
            };
            for arg in &args[1..] {
                let val = match arg {
                    EvalResult::Fixnum(n) => Integer::from(*n),
                    EvalResult::Bignum(b) => b.clone(),
                    _ => return Err("logeqv requires integers".to_string()),
                };
                result = !(&result ^ &val);
            }
            if i64::convertible_from(&result) {
                Ok(EvalResult::Fixnum(i64::exact_from(&result)))
            } else {
                Ok(EvalResult::Bignum(result))
            }
        },

        "logcount" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => {
                Ok(EvalResult::Fixnum(n.count_ones() as i64))
            }
            _ => Err("logcount requires an integer".to_string()),
        },

        _ => Err(format!("Unknown numeric builtin: {}", name)),
    }
}
