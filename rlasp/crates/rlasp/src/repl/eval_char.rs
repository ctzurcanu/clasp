/// eval_char.rs - Common Lisp character builtins
use super::eval_types::EvalResult;
use std::collections::HashMap;

pub fn register_char_builtins(env: &mut HashMap<String, EvalResult>) {
    // Character predicates
    env.insert("characterp".to_string(), EvalResult::BuiltinFunction("characterp".to_string()));
    env.insert("alpha-char-p".to_string(), EvalResult::BuiltinFunction("alpha-char-p".to_string()));
    env.insert("alphanumericp".to_string(), EvalResult::BuiltinFunction("alphanumericp".to_string()));
    env.insert("digit-char-p".to_string(), EvalResult::BuiltinFunction("digit-char-p".to_string()));
    env.insert("graphic-char-p".to_string(), EvalResult::BuiltinFunction("graphic-char-p".to_string()));
    env.insert("standard-char-p".to_string(), EvalResult::BuiltinFunction("standard-char-p".to_string()));
    env.insert("upper-case-p".to_string(), EvalResult::BuiltinFunction("upper-case-p".to_string()));
    env.insert("lower-case-p".to_string(), EvalResult::BuiltinFunction("lower-case-p".to_string()));
    env.insert("both-case-p".to_string(), EvalResult::BuiltinFunction("both-case-p".to_string()));

    // Character case conversion
    env.insert("char-upcase".to_string(), EvalResult::BuiltinFunction("char-upcase".to_string()));
    env.insert("char-downcase".to_string(), EvalResult::BuiltinFunction("char-downcase".to_string()));

    // Character conversion
    env.insert("char-code".to_string(), EvalResult::BuiltinFunction("char-code".to_string()));
    env.insert("code-char".to_string(), EvalResult::BuiltinFunction("code-char".to_string()));
    env.insert("char-int".to_string(), EvalResult::BuiltinFunction("char-int".to_string()));
    env.insert("char-name".to_string(), EvalResult::BuiltinFunction("char-name".to_string()));
    env.insert("name-char".to_string(), EvalResult::BuiltinFunction("name-char".to_string()));
    env.insert("digit-char".to_string(), EvalResult::BuiltinFunction("digit-char".to_string()));

    // Character comparison
    env.insert("char=".to_string(), EvalResult::BuiltinFunction("char=".to_string()));
    env.insert("char/=".to_string(), EvalResult::BuiltinFunction("char/=".to_string()));
    env.insert("char<".to_string(), EvalResult::BuiltinFunction("char<".to_string()));
    env.insert("char>".to_string(), EvalResult::BuiltinFunction("char>".to_string()));
    env.insert("char<=".to_string(), EvalResult::BuiltinFunction("char<=".to_string()));
    env.insert("char>=".to_string(), EvalResult::BuiltinFunction("char>=".to_string()));
    env.insert("char-equal".to_string(), EvalResult::BuiltinFunction("char-equal".to_string()));
    env.insert("char-not-equal".to_string(), EvalResult::BuiltinFunction("char-not-equal".to_string()));
    env.insert("char-lessp".to_string(), EvalResult::BuiltinFunction("char-lessp".to_string()));
    env.insert("char-greaterp".to_string(), EvalResult::BuiltinFunction("char-greaterp".to_string()));
    env.insert("char-not-greaterp".to_string(), EvalResult::BuiltinFunction("char-not-greaterp".to_string()));
    env.insert("char-not-lessp".to_string(), EvalResult::BuiltinFunction("char-not-lessp".to_string()));
}

pub fn call_char_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    let simple_upcase = |c: char| {
        if !(c.is_lowercase() || c.is_uppercase()) {
            return c;
        }
        let mut mapped = c.to_uppercase();
        let first = mapped.next().unwrap_or(c);
        if mapped.next().is_some() {
            c
        } else {
            first
        }
    };
    let simple_downcase = |c: char| {
        if !(c.is_lowercase() || c.is_uppercase()) {
            return c;
        }
        let mut mapped = c.to_lowercase();
        let first = mapped.next().unwrap_or(c);
        if mapped.next().is_some() {
            c
        } else {
            first
        }
    };
    let is_upper_case = |c: char| {
        let up = simple_upcase(c);
        let down = simple_downcase(c);
        c == up && c != down
    };
    let is_lower_case = |c: char| {
        let up = simple_upcase(c);
        let down = simple_downcase(c);
        c == down && c != up
    };
    let lower1 = |c: char| simple_downcase(c);

    match name {
        "characterp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::Character(_))))),

        "alpha-char-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(c.is_alphabetic())),
            _ => Err("alpha-char-p requires a character".to_string()),
        },

        "alphanumericp" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(c.is_alphanumeric())),
            _ => Err("alphanumericp requires a character".to_string()),
        },

        "digit-char-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => {
                if c.is_ascii_digit() {
                    Ok(EvalResult::Fixnum(c.to_digit(10).unwrap() as i64))
                } else {
                    Ok(EvalResult::Nil)
                }
            }
            _ => Err("digit-char-p requires a character".to_string()),
        },

        "graphic-char-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(!c.is_control() && !c.is_whitespace())),
            _ => Err("graphic-char-p requires a character".to_string()),
        },

        "standard-char-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(c.is_ascii())),
            _ => Err("standard-char-p requires a character".to_string()),
        },

        "upper-case-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(is_upper_case(*c))),
            _ => Err("upper-case-p requires a character".to_string()),
        },

        "lower-case-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(is_lower_case(*c))),
            _ => Err("lower-case-p requires a character".to_string()),
        },

        "both-case-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(is_upper_case(*c) || is_lower_case(*c))),
            _ => Err("both-case-p requires a character".to_string()),
        },

        "char-upcase" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Character(simple_upcase(*c))),
            _ => Err("char-upcase requires a character".to_string()),
        },

        "char-downcase" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Character(simple_downcase(*c))),
            _ => Err("char-downcase requires a character".to_string()),
        },

        "char-code" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Fixnum(*c as u32 as i64)),
            _ => Err("char-code requires a character".to_string()),
        },

        "code-char" => match args.get(0) {
            Some(EvalResult::Fixnum(n)) if *n >= 0 => {
                match char::from_u32(*n as u32) {
                    Some(c) => Ok(EvalResult::Character(c)),
                    None => Ok(EvalResult::Nil),
                }
            }
            Some(EvalResult::Bignum(_)) => Ok(EvalResult::Nil),
            _ => Err("code-char requires an integer character code".to_string()),
        },

        "char-int" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Fixnum(*c as u32 as i64)),
            _ => Err("char-int requires a character".to_string()),
        },

        // Character comparison (CL semantics: at least one argument).
        "char="
        | "char/="
        | "char<"
        | "char>"
        | "char<="
        | "char>="
        | "char-equal"
        | "char-not-equal"
        | "char-lessp"
        | "char-greaterp"
        | "char-not-greaterp"
        | "char-not-lessp"
        | "char-EQ-"
        | "char-NE-"
        | "char-LT-"
        | "char-GT-"
        | "char-LE-"
        | "char-GE-" => {
            if args.is_empty() {
                return Err(format!("{name} requires at least one argument"));
            }

            let mut chars = Vec::with_capacity(args.len());
            for arg in args {
                if let EvalResult::Character(c) = arg {
                    chars.push(*c);
                } else {
                    return Err("character comparison requires character arguments".to_string());
                }
            }

            let canonical = match name {
                "char-EQ-" => "char=",
                "char-NE-" => "char/=",
                "char-LT-" => "char<",
                "char-GT-" => "char>",
                "char-LE-" => "char<=",
                "char-GE-" => "char>=",
                other => other,
            };

            if chars.len() == 1 {
                return Ok(EvalResult::Boolean(true));
            }

            let cmp_case = |a: char, b: char| a.cmp(&b);
            let cmp_folded = |a: char, b: char| lower1(a).cmp(&lower1(b));
            let pairwise_case = |pred: fn(std::cmp::Ordering) -> bool| -> bool {
                chars
                    .windows(2)
                    .all(|w| pred(cmp_case(w[0], w[1])))
            };
            let pairwise_fold = |pred: fn(std::cmp::Ordering) -> bool| -> bool {
                chars
                    .windows(2)
                    .all(|w| pred(cmp_folded(w[0], w[1])))
            };
            let all_distinct_case = || -> bool {
                for i in 0..chars.len() {
                    for j in (i + 1)..chars.len() {
                        if cmp_case(chars[i], chars[j]) == std::cmp::Ordering::Equal {
                            return false;
                        }
                    }
                }
                true
            };
            let all_distinct_fold = || -> bool {
                for i in 0..chars.len() {
                    for j in (i + 1)..chars.len() {
                        if cmp_folded(chars[i], chars[j]) == std::cmp::Ordering::Equal {
                            return false;
                        }
                    }
                }
                true
            };

            let result = match canonical {
                "char=" => pairwise_case(|o| o == std::cmp::Ordering::Equal),
                "char/=" => all_distinct_case(),
                "char<" => pairwise_case(|o| o == std::cmp::Ordering::Less),
                "char>" => pairwise_case(|o| o == std::cmp::Ordering::Greater),
                "char<=" => pairwise_case(|o| matches!(o, std::cmp::Ordering::Less | std::cmp::Ordering::Equal)),
                "char>=" => pairwise_case(|o| matches!(o, std::cmp::Ordering::Greater | std::cmp::Ordering::Equal)),
                "char-equal" => pairwise_fold(|o| o == std::cmp::Ordering::Equal),
                "char-not-equal" => all_distinct_fold(),
                "char-lessp" => pairwise_fold(|o| o == std::cmp::Ordering::Less),
                "char-greaterp" => pairwise_fold(|o| o == std::cmp::Ordering::Greater),
                "char-not-greaterp" => pairwise_fold(|o| matches!(o, std::cmp::Ordering::Less | std::cmp::Ordering::Equal)),
                "char-not-lessp" => pairwise_fold(|o| matches!(o, std::cmp::Ordering::Greater | std::cmp::Ordering::Equal)),
                _ => false,
            };
            Ok(EvalResult::Boolean(result))
        },

        "char-name" => match args.get(0) {
            Some(EvalResult::Character(c)) => {
                let name = match c {
                    ' ' => "Space".to_string(),
                    '\n' => "Newline".to_string(),
                    '\t' => "Tab".to_string(),
                    '\r' => "Return".to_string(),
                    '\u{0008}' => "Backspace".to_string(),
                    '\u{000C}' => "Page".to_string(),
                    '\u{007F}' => "Rubout".to_string(),
                    '\u{0000}' => "Nul".to_string(),
                    '\u{001B}' => "Escape".to_string(),
                    '\u{0007}' => "Bell".to_string(),
                    _ if c.is_ascii_graphic() => c.to_string(),
                    _ => format!("U{:04X}", *c as u32),
                };
                Ok(EvalResult::String(name))
            },
            _ => Err("char-name requires a character".to_string()),
        },

        "name-char" => match args.get(0) {
            Some(EvalResult::String(s)) | Some(EvalResult::Symbol(s)) => {
                let ch = rlasp_runtime::parse_character_name(s);
                match ch {
                    Some(c) => Ok(EvalResult::Character(c)),
                    None => Ok(EvalResult::Nil),
                }
            },
            _ => Err("name-char requires a string".to_string()),
        },

        _ => Err(format!("Unknown character builtin: {}", name)),
    }
}
