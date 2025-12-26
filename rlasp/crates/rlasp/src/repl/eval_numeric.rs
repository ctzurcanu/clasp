/// eval_numeric.rs - Common Lisp numeric builtins
use super::eval_types::EvalResult;
use std::collections::HashMap;

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

    // Float operations
    env.insert("float-radix".to_string(), EvalResult::BuiltinFunction("float-radix".to_string()));
    env.insert("float-sign".to_string(), EvalResult::BuiltinFunction("float-sign".to_string()));
    env.insert("float-digits".to_string(), EvalResult::BuiltinFunction("float-digits".to_string()));
    env.insert("float-precision".to_string(), EvalResult::BuiltinFunction("float-precision".to_string()));
    env.insert("decode-float".to_string(), EvalResult::BuiltinFunction("decode-float".to_string()));
    env.insert("scale-float".to_string(), EvalResult::BuiltinFunction("scale-float".to_string()));
    env.insert("integer-decode-float".to_string(), EvalResult::BuiltinFunction("integer-decode-float".to_string()));

    // Rational/complex operations
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
        // Predicates
        "numberp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::Float(_))))),
        "integerp" => Ok(EvalResult::Boolean(match args.get(0) {
            Some(EvalResult::Float(n)) => n.fract() == 0.0,
            _ => false,
        })),
        "floatp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::Float(_))))),
        "zerop" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Boolean(*n == 0.0)),
            _ => Err("zerop requires a number".to_string()),
        },
        "plusp" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Boolean(*n > 0.0)),
            _ => Err("plusp requires a number".to_string()),
        },
        "minusp" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Boolean(*n < 0.0)),
            _ => Err("minusp requires a number".to_string()),
        },
        "evenp" => match args.get(0) {
            Some(EvalResult::Float(n)) if n.fract() == 0.0 => Ok(EvalResult::Boolean((*n as i64) % 2 == 0)),
            _ => Err("evenp requires an integer".to_string()),
        },
        "oddp" => match args.get(0) {
            Some(EvalResult::Float(n)) if n.fract() == 0.0 => Ok(EvalResult::Boolean((*n as i64) % 2 != 0)),
            _ => Err("oddp requires an integer".to_string()),
        },

        // Math functions
        "abs" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.abs())),
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
            _ => Err("exp requires a number".to_string()),
        },
        "log" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.ln())),
            _ => Err("log requires a number".to_string()),
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
        "truncate" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.trunc())),
            _ => Err("truncate requires a number".to_string()),
        },
        "round" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(n.round())),
            _ => Err("round requires a number".to_string()),
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

        "expt" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Float(base)), Some(EvalResult::Float(power))) => {
                Ok(EvalResult::Float(base.powf(*power)))
            }
            (Some(EvalResult::Fixnum(base)), Some(EvalResult::Fixnum(power))) => {
                Ok(EvalResult::Float((*base as f64).powf(*power as f64)))
            }
            _ => Err("expt requires two numbers".to_string()),
        },

        "gcd" => {
            if args.is_empty() {
                return Ok(EvalResult::Fixnum(0));
            }
            fn gcd_two(a: i64, b: i64) -> i64 {
                if b == 0 { a.abs() } else { gcd_two(b, a % b) }
            }
            let mut result = match args[0] {
                EvalResult::Fixnum(i) => i,
                EvalResult::Float(n) => n as i64,
                _ => return Err("gcd requires integers".to_string()),
            };
            for arg in &args[1..] {
                let val = match arg {
                    EvalResult::Fixnum(i) => *i,
                    EvalResult::Float(n) => *n as i64,
                    _ => return Err("gcd requires integers".to_string()),
                };
                result = gcd_two(result, val);
            }
            Ok(EvalResult::Fixnum(result))
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
            _ => Err("signum requires a number".to_string()),
        },

        "float" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Float(*n as f64)),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(*n)),
            _ => Err("float requires a number".to_string()),
        },

        "rational" | "rationalize" => match args.get(0) {
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(*n)),
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Fixnum(*n)),
            _ => Err("rational requires a number".to_string()),
        },

        "numerator" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Fixnum(*n)),
            Some(EvalResult::Float(n)) => Ok(EvalResult::Float(*n)),
            _ => Err("numerator requires a rational".to_string()),
        },

        "denominator" => match args.get(0) {
            Some(EvalResult::Fixnum(_)) => Ok(EvalResult::Fixnum(1)),
            Some(EvalResult::Float(_)) => Ok(EvalResult::Float(1.0)),
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
                let bits = if *n == 0 { 0 } else { 64 - n.abs().leading_zeros() as i64 };
                Ok(EvalResult::Fixnum(bits))
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
            _ => Err("random requires a positive number".to_string()),
        },

        "random-state-p" => Ok(EvalResult::Boolean(false)),

        // Bitwise logic operations
        "logand" => {
            let mut result = -1_i64;
            for arg in args {
                match arg {
                    EvalResult::Fixnum(n) => result &= n,
                    _ => return Err("logand requires integers".to_string()),
                }
            }
            Ok(EvalResult::Fixnum(result))
        },

        "logior" => {
            let mut result = 0_i64;
            for arg in args {
                match arg {
                    EvalResult::Fixnum(n) => result |= n,
                    _ => return Err("logior requires integers".to_string()),
                }
            }
            Ok(EvalResult::Fixnum(result))
        },

        "logxor" => {
            let mut result = 0_i64;
            for arg in args {
                match arg {
                    EvalResult::Fixnum(n) => result ^= n,
                    _ => return Err("logxor requires integers".to_string()),
                }
            }
            Ok(EvalResult::Fixnum(result))
        },

        "lognot" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) => Ok(EvalResult::Fixnum(!n)),
            _ => Err("lognot requires an integer".to_string()),
        },

        "logandc1" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Fixnum(a)), Some(EvalResult::Fixnum(b))) => {
                Ok(EvalResult::Fixnum(!a & b))
            }
            _ => Err("logandc1 requires two integers".to_string()),
        },

        "logandc2" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Fixnum(a)), Some(EvalResult::Fixnum(b))) => {
                Ok(EvalResult::Fixnum(a & !b))
            }
            _ => Err("logandc2 requires two integers".to_string()),
        },

        "logorc1" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Fixnum(a)), Some(EvalResult::Fixnum(b))) => {
                Ok(EvalResult::Fixnum(!a | b))
            }
            _ => Err("logorc1 requires two integers".to_string()),
        },

        "logorc2" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Fixnum(a)), Some(EvalResult::Fixnum(b))) => {
                Ok(EvalResult::Fixnum(a | !b))
            }
            _ => Err("logorc2 requires two integers".to_string()),
        },

        "lognand" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Fixnum(a)), Some(EvalResult::Fixnum(b))) => {
                Ok(EvalResult::Fixnum(!(a & b)))
            }
            _ => Err("lognand requires two integers".to_string()),
        },

        "lognor" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Fixnum(a)), Some(EvalResult::Fixnum(b))) => {
                Ok(EvalResult::Fixnum(!(a | b)))
            }
            _ => Err("lognor requires two integers".to_string()),
        },

        "logeqv" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Fixnum(a)), Some(EvalResult::Fixnum(b))) => {
                Ok(EvalResult::Fixnum(!(a ^ b)))
            }
            _ => Err("logeqv requires two integers".to_string()),
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
