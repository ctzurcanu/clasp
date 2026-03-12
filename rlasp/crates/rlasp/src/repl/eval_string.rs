/// eval_string.rs - Common Lisp string builtins
use super::eval_types::EvalResult;
use std::collections::{HashMap, HashSet};

/// Convert a string designator to a string
/// In CL, string designators are: string, symbol (uses symbol-name), or character
fn get_string_designator(arg: &EvalResult) -> Result<String, String> {
    match arg {
        EvalResult::String(s) => Ok(s.clone()),
        EvalResult::Symbol(s) => {
            // For symbols, use SYMBOL-NAME semantics: strip package prefix.
            let stripped = if s.starts_with(':') { &s[1..] } else { s.as_str() };
            let base = stripped.rsplit(':').next().unwrap_or(stripped);
            Ok(base.to_uppercase())
        }
        EvalResult::Character(c) => Ok(c.to_string()),
        EvalResult::Array(arr) => {
            // rlasp currently represents many character vectors as Array.
            // Treat contiguous character elements as a string; stop at NIL.
            let mut out = String::new();
            for elem in arr.borrow().iter() {
                match elem {
                    EvalResult::Character(c) => out.push(*c),
                    EvalResult::String(s) if s.chars().count() == 1 => out.push(s.chars().next().unwrap()),
                    EvalResult::Nil => break,
                    _ => {
                        return Err(format!("Expected a string designator, got {:?}", arg));
                    }
                }
            }
            Ok(out)
        }
        _ => Err(format!("Expected a string designator, got {:?}", arg)),
    }
}

/// Extract characters from a character-bag argument (string or list of chars)
fn get_char_bag(arg: &Option<&EvalResult>) -> Result<HashSet<char>, String> {
    match arg {
        Some(EvalResult::String(s)) => Ok(s.chars().collect()),
        Some(EvalResult::Symbol(s)) => {
            let stripped = if s.starts_with(':') { &s[1..] } else { s.as_str() };
            let base = stripped.rsplit(':').next().unwrap_or(stripped);
            Ok(base.chars().collect())
        }
        Some(EvalResult::Nil) => Ok(HashSet::new()),
        Some(EvalResult::Cons(_, _)) => {
            // For a list, we'd need to iterate - for now just use empty set
            // This handles edge cases where a list of characters is passed
            Ok(HashSet::new())
        }
        None => Ok(" \t\n\r".chars().collect()), // Default to whitespace
        _ => Ok(HashSet::new()),
    }
}

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
    let name = name.rsplit(':').next().unwrap_or(name).to_ascii_lowercase();
    match name.as_str() {
        "stringp" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::String(_) | EvalResult::Array(_))))),

        "simple-string-p" => Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::String(_) | EvalResult::Array(_))))),

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
            Some(v) => Ok(EvalResult::String(get_string_designator(v)?)),
            None => Err("string requires a string designator".to_string()),
        },

        // String comparison - CL spec compliant
        "string=" | "string/=" | "string<" | "string>" | "string<=" | "string>=" |
        "string-equal" | "string-not-equal" | "string-lessp" | "string-greaterp" |
        "string-not-greaterp" | "string-not-lessp" => {
            if args.len() < 2 {
                return Err(format!("{} requires at least two arguments", name));
            }
            let a_str = get_string_designator(&args[0])?;
            let b_str = get_string_designator(&args[1])?;

            // Parse keyword args: :start1 :end1 :start2 :end2
            let mut start1 = 0usize;
            let mut end1 = a_str.len();
            let mut start2 = 0usize;
            let mut end2 = b_str.len();
            let mut i = 2;
            while i + 1 < args.len() {
                let key = match &args[i] {
                    EvalResult::Symbol(s) => s.to_uppercase(),
                    _ => { i += 1; continue; }
                };
                let val = match &args[i + 1] {
                    EvalResult::Fixnum(n) => *n as usize,
                    EvalResult::Nil => { i += 2; continue; }
                    _ => { i += 2; continue; }
                };
                match key.as_str() {
                    ":START1" => start1 = val,
                    ":END1" => end1 = val,
                    ":START2" => start2 = val,
                    ":END2" => end2 = val,
                    _ => {}
                }
                i += 2;
            }

            let case_sensitive = matches!(name.as_str(), "string=" | "string/=" | "string<" | "string>" | "string<=" | "string>=");
            let a_chars: Vec<char> = a_str.chars().collect();
            let b_chars: Vec<char> = b_str.chars().collect();
            let end1 = end1.min(a_chars.len());
            let end2 = end2.min(b_chars.len());
            let start1 = start1.min(end1);
            let start2 = start2.min(end2);
            let a_sub: Vec<char> = a_chars[start1..end1].to_vec();
            let b_sub: Vec<char> = b_chars[start2..end2].to_vec();

            // Find first mismatch position
            let mut mismatch_pos: Option<usize> = None;
            for k in 0..a_sub.len().min(b_sub.len()) {
                let (ca, cb) = if case_sensitive {
                    (a_sub[k], b_sub[k])
                } else {
                    (a_sub[k].to_ascii_lowercase(), b_sub[k].to_ascii_lowercase())
                };
                if ca != cb {
                    mismatch_pos = Some(k);
                    break;
                }
            }
            if mismatch_pos.is_none() && a_sub.len() != b_sub.len() {
                mismatch_pos = Some(a_sub.len().min(b_sub.len()));
            }

            let result = match name.as_str() {
                "string=" | "string-equal" => {
                    if mismatch_pos.is_none() { EvalResult::Bool(true) } else { EvalResult::Nil }
                }
                "string/=" | "string-not-equal" => {
                    match mismatch_pos {
                        Some(pos) => EvalResult::Fixnum((start1 + pos) as i64),
                        None => EvalResult::Nil,
                    }
                }
                "string<" | "string-lessp" => {
                    match mismatch_pos {
                        Some(pos) => {
                            let ca = a_sub.get(pos).copied();
                            let cb = b_sub.get(pos).copied();
                            let less = match (ca, cb) {
                                (None, Some(_)) => true,  // a shorter
                                (Some(a), Some(b)) => {
                                    if case_sensitive { a < b } else { a.to_ascii_lowercase() < b.to_ascii_lowercase() }
                                }
                                _ => false,
                            };
                            if less { EvalResult::Fixnum((start1 + pos) as i64) } else { EvalResult::Nil }
                        }
                        None => EvalResult::Nil, // equal
                    }
                }
                "string>" | "string-greaterp" => {
                    match mismatch_pos {
                        Some(pos) => {
                            let ca = a_sub.get(pos).copied();
                            let cb = b_sub.get(pos).copied();
                            let greater = match (ca, cb) {
                                (Some(_), None) => true,  // b shorter
                                (Some(a), Some(b)) => {
                                    if case_sensitive { a > b } else { a.to_ascii_lowercase() > b.to_ascii_lowercase() }
                                }
                                _ => false,
                            };
                            if greater { EvalResult::Fixnum((start1 + pos) as i64) } else { EvalResult::Nil }
                        }
                        None => EvalResult::Nil,
                    }
                }
                "string<=" | "string-not-greaterp" => {
                    match mismatch_pos {
                        None => EvalResult::Fixnum((start1 + a_sub.len()) as i64), // equal => return end
                        Some(pos) => {
                            let ca = a_sub.get(pos).copied();
                            let cb = b_sub.get(pos).copied();
                            let le = match (ca, cb) {
                                (None, Some(_)) => true,
                                (Some(a), Some(b)) => {
                                    if case_sensitive { a < b } else { a.to_ascii_lowercase() < b.to_ascii_lowercase() }
                                }
                                _ => false,
                            };
                            if le { EvalResult::Fixnum((start1 + pos) as i64) } else { EvalResult::Nil }
                        }
                    }
                }
                "string>=" | "string-not-lessp" => {
                    match mismatch_pos {
                        None => EvalResult::Fixnum((start1 + a_sub.len()) as i64),
                        Some(pos) => {
                            let ca = a_sub.get(pos).copied();
                            let cb = b_sub.get(pos).copied();
                            let ge = match (ca, cb) {
                                (Some(_), None) => true,
                                (Some(a), Some(b)) => {
                                    if case_sensitive { a > b } else { a.to_ascii_lowercase() > b.to_ascii_lowercase() }
                                }
                                _ => false,
                            };
                            if ge { EvalResult::Fixnum((start1 + pos) as i64) } else { EvalResult::Nil }
                        }
                    }
                }
                _ => EvalResult::Nil,
            };
            Ok(result)
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

        // String trimming - trims characters from character-bag from string
        // Second argument is a string designator (string, symbol, or character)
        "string-trim" => {
            let char_bag = get_char_bag(&args.get(0))?;
            match args.get(1) {
                Some(arg) => {
                    let s = get_string_designator(arg)?;
                    let trimmed = s.trim_matches(|c| char_bag.contains(&c));
                    Ok(EvalResult::String(trimmed.to_string()))
                },
                _ => Err("string-trim requires a character bag and string designator".to_string()),
            }
        },

        "string-left-trim" => {
            let char_bag = get_char_bag(&args.get(0))?;
            match args.get(1) {
                Some(arg) => {
                    let s = get_string_designator(arg)?;
                    let trimmed = s.trim_start_matches(|c| char_bag.contains(&c));
                    Ok(EvalResult::String(trimmed.to_string()))
                },
                _ => Err("string-left-trim requires a character bag and string designator".to_string()),
            }
        },

        "string-right-trim" => {
            let char_bag = get_char_bag(&args.get(0))?;
            match args.get(1) {
                Some(arg) => {
                    let s = get_string_designator(arg)?;
                    let trimmed = s.trim_end_matches(|c| char_bag.contains(&c));
                    Ok(EvalResult::String(trimmed.to_string()))
                },
                _ => Err("string-right-trim requires a character bag and string designator".to_string()),
            }
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
