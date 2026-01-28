/// eval_string.rs - Common Lisp string builtins
use super::eval_types::EvalResult;
use std::collections::HashMap;

pub fn register_string_builtins(env: &mut HashMap<String, EvalResult>) {
    // String predicates
    env.insert("stringp".to_string(), EvalResult::BuiltinFunction("stringp".to_string()));
    env.insert("simple-string-p".to_string(), EvalResult::BuiltinFunction("simple-string-p".to_string()));

    // String construction
    env.insert("make-string".to_string(), EvalResult::BuiltinFunction("make-string".to_string()));
    env.insert("string".to_string(), EvalResult::BuiltinFunction("string".to_string()));

    // String comparison
    env.insert("string=".to_string(), EvalResult::BuiltinFunction("string=".to_string()));
    env.insert("string/=".to_string(), EvalResult::BuiltinFunction("string/=".to_string()));
    env.insert("string<".to_string(), EvalResult::BuiltinFunction("string<".to_string()));
    env.insert("string>".to_string(), EvalResult::BuiltinFunction("string>".to_string()));
    env.insert("string<=".to_string(), EvalResult::BuiltinFunction("string<=".to_string()));
    env.insert("string>=".to_string(), EvalResult::BuiltinFunction("string>=".to_string()));
    env.insert("string-equal".to_string(), EvalResult::BuiltinFunction("string-equal".to_string()));
    env.insert("string-not-equal".to_string(), EvalResult::BuiltinFunction("string-not-equal".to_string()));
    env.insert("string-lessp".to_string(), EvalResult::BuiltinFunction("string-lessp".to_string()));
    env.insert("string-greaterp".to_string(), EvalResult::BuiltinFunction("string-greaterp".to_string()));
    env.insert("string-not-greaterp".to_string(), EvalResult::BuiltinFunction("string-not-greaterp".to_string()));
    env.insert("string-not-lessp".to_string(), EvalResult::BuiltinFunction("string-not-lessp".to_string()));

    // String case conversion
    env.insert("string-upcase".to_string(), EvalResult::BuiltinFunction("string-upcase".to_string()));
    env.insert("string-downcase".to_string(), EvalResult::BuiltinFunction("string-downcase".to_string()));
    env.insert("string-capitalize".to_string(), EvalResult::BuiltinFunction("string-capitalize".to_string()));
    env.insert("nstring-upcase".to_string(), EvalResult::BuiltinFunction("nstring-upcase".to_string()));
    env.insert("nstring-downcase".to_string(), EvalResult::BuiltinFunction("nstring-downcase".to_string()));
    env.insert("nstring-capitalize".to_string(), EvalResult::BuiltinFunction("nstring-capitalize".to_string()));

    // String trimming
    env.insert("string-trim".to_string(), EvalResult::BuiltinFunction("string-trim".to_string()));
    env.insert("string-left-trim".to_string(), EvalResult::BuiltinFunction("string-left-trim".to_string()));
    env.insert("string-right-trim".to_string(), EvalResult::BuiltinFunction("string-right-trim".to_string()));
}

pub fn call_string_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "stringp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::String(_))))),

        "simple-string-p" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::String(_))))),

        "make-string" => match args.get(0) {
            Some(EvalResult::Float(n)) if *n >= 0.0 => {
                let len = *n as usize;
                let ch = match args.get(1) {
                    Some(EvalResult::Character(c)) => *c,
                    _ => ' ',
                };
                Ok(EvalResult::String(ch.to_string().repeat(len)))
            },
            _ => Err("make-string requires a non-negative integer".to_string()),
        },

        "string" => match args.get(0) {
            Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
            Some(EvalResult::Symbol(s)) => {
                // For keywords (start with :), strip the colon and uppercase
                let name = if s.starts_with(':') {
                    s[1..].to_uppercase()
                } else {
                    s.to_uppercase()
                };
                Ok(EvalResult::String(name))
            },
            Some(EvalResult::Character(c)) => Ok(EvalResult::String(c.to_string())),
            _ => Err("string requires a string designator".to_string()),
        },

        // String comparison
        "string=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a == b))
            },
            _ => Err("string= requires two strings".to_string()),
        },

        "string/=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a != b))
            },
            _ => Err("string/= requires two strings".to_string()),
        },

        "string<" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a < b))
            },
            _ => Err("string< requires two strings".to_string()),
        },

        "string>" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a > b))
            },
            _ => Err("string> requires two strings".to_string()),
        },

        "string<=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a <= b))
            },
            _ => Err("string<= requires two strings".to_string()),
        },

        "string>=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a >= b))
            },
            _ => Err("string>= requires two strings".to_string()),
        },

        "string-equal" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a.to_lowercase() == b.to_lowercase()))
            },
            _ => Err("string-equal requires two strings".to_string()),
        },

        "string-not-equal" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a.to_lowercase() != b.to_lowercase()))
            },
            _ => Err("string-not-equal requires two strings".to_string()),
        },

        "string-lessp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a.to_lowercase() < b.to_lowercase()))
            },
            _ => Err("string-lessp requires two strings".to_string()),
        },

        "string-greaterp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a.to_lowercase() > b.to_lowercase()))
            },
            _ => Err("string-greaterp requires two strings".to_string()),
        },

        "string-not-greaterp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a.to_lowercase() <= b.to_lowercase()))
            },
            _ => Err("string-not-greaterp requires two strings".to_string()),
        },

        "string-not-lessp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a.to_lowercase() >= b.to_lowercase()))
            },
            _ => Err("string-not-lessp requires two strings".to_string()),
        },

        // String case conversion
        "string-upcase" => match args.get(0) {
            Some(EvalResult::String(s)) => Ok(EvalResult::String(s.to_uppercase())),
            _ => Err("string-upcase requires a string".to_string()),
        },

        "string-downcase" => match args.get(0) {
            Some(EvalResult::String(s)) => Ok(EvalResult::String(s.to_lowercase())),
            _ => Err("string-downcase requires a string".to_string()),
        },

        "string-capitalize" => match args.get(0) {
            Some(EvalResult::String(s)) => {
                let mut result = String::new();
                let mut capitalize_next = true;
                for c in s.chars() {
                    if c.is_whitespace() {
                        capitalize_next = true;
                        result.push(c);
                    } else if capitalize_next {
                        result.push(c.to_uppercase().next().unwrap());
                        capitalize_next = false;
                    } else {
                        result.push(c.to_lowercase().next().unwrap());
                    }
                }
                Ok(EvalResult::String(result))
            },
            _ => Err("string-capitalize requires a string".to_string()),
        },

        // String trimming
        "string-trim" => match args.get(1) {
            Some(EvalResult::String(s)) => {
                // For simplicity, trim whitespace. Full implementation would accept character bag.
                Ok(EvalResult::String(s.trim().to_string()))
            },
            _ => Err("string-trim requires a character bag and string".to_string()),
        },

        "string-left-trim" => match args.get(1) {
            Some(EvalResult::String(s)) => {
                Ok(EvalResult::String(s.trim_start().to_string()))
            },
            _ => Err("string-left-trim requires a character bag and string".to_string()),
        },

        "string-right-trim" => match args.get(1) {
            Some(EvalResult::String(s)) => {
                Ok(EvalResult::String(s.trim_end().to_string()))
            },
            _ => Err("string-right-trim requires a character bag and string".to_string()),
        },

        // Character access
        "char" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(s)), Some(EvalResult::Fixnum(idx))) if *idx >= 0 => {
                s.chars().nth(*idx as usize)
                    .map(EvalResult::Character)
                    .ok_or_else(|| "Index out of bounds".to_string())
            }
            (Some(EvalResult::String(s)), Some(EvalResult::Float(idx))) if *idx >= 0.0 => {
                s.chars().nth(*idx as usize)
                    .map(EvalResult::Character)
                    .ok_or_else(|| "Index out of bounds".to_string())
            }
            _ => Err("char requires a string and non-negative index".to_string()),
        },

        "schar" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(s)), Some(EvalResult::Fixnum(idx))) if *idx >= 0 => {
                s.chars().nth(*idx as usize)
                    .map(EvalResult::Character)
                    .ok_or_else(|| "Index out of bounds".to_string())
            }
            (Some(EvalResult::String(s)), Some(EvalResult::Float(idx))) if *idx >= 0.0 => {
                s.chars().nth(*idx as usize)
                    .map(EvalResult::Character)
                    .ok_or_else(|| "Index out of bounds".to_string())
            }
            _ => Err("schar requires a simple string and non-negative index".to_string()),
        },

        // Destructive case conversion
        "nstring-upcase" => match args.get(0) {
            Some(EvalResult::String(s)) => {
                Ok(EvalResult::String(s.to_uppercase()))
            },
            _ => Err("nstring-upcase requires a string".to_string()),
        },

        "nstring-downcase" => match args.get(0) {
            Some(EvalResult::String(s)) => {
                Ok(EvalResult::String(s.to_lowercase()))
            },
            _ => Err("nstring-downcase requires a string".to_string()),
        },

        "nstring-capitalize" => match args.get(0) {
            Some(EvalResult::String(s)) => {
                let mut result = String::new();
                let mut capitalize_next = true;
                for ch in s.chars() {
                    if ch.is_alphabetic() {
                        if capitalize_next {
                            result.push_str(&ch.to_uppercase().to_string());
                            capitalize_next = false;
                        } else {
                            result.push_str(&ch.to_lowercase().to_string());
                        }
                    } else {
                        result.push(ch);
                        capitalize_next = true;
                    }
                }
                Ok(EvalResult::String(result))
            },
            _ => Err("nstring-capitalize requires a string".to_string()),
        },

        // Direct comparison operators (aliases for existing ones)
        "string=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a == b))
            }
            _ => Err("string= requires two strings".to_string()),
        },

        "string/=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a != b))
            }
            _ => Err("string/= requires two strings".to_string()),
        },

        "string<" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a < b))
            }
            _ => Err("string< requires two strings".to_string()),
        },

        "string>" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a > b))
            }
            _ => Err("string> requires two strings".to_string()),
        },

        "string<=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a <= b))
            }
            _ => Err("string<= requires two strings".to_string()),
        },

        "string>=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a >= b))
            }
            _ => Err("string>= requires two strings".to_string()),
        },

        // Aliases with different naming convention
        "string-EQ-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a == b))
            }
            _ => Err("string-EQ- requires two strings".to_string()),
        },

        "string-LT-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a < b))
            }
            _ => Err("string-LT- requires two strings".to_string()),
        },

        "string-GT-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a > b))
            }
            _ => Err("string-GT- requires two strings".to_string()),
        },

        "string-LE-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a <= b))
            }
            _ => Err("string-LE- requires two strings".to_string()),
        },

        "string-GE-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a >= b))
            }
            _ => Err("string-GE- requires two strings".to_string()),
        },

        "string-NE-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(a)), Some(EvalResult::String(b))) => {
                Ok(EvalResult::Boolean(a != b))
            }
            _ => Err("string-NE- requires two strings".to_string()),
        },

        _ => Err(format!("Unknown string builtin: {}", name)),
    }
}
