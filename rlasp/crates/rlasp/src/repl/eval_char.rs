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
                    Ok(EvalResult::Float(c.to_digit(10).unwrap() as f64))
                } else {
                    Ok(EvalResult::Nil)
                }
            },
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
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(c.is_uppercase())),
            _ => Err("upper-case-p requires a character".to_string()),
        },

        "lower-case-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(c.is_lowercase())),
            _ => Err("lower-case-p requires a character".to_string()),
        },

        "both-case-p" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Boolean(c.is_alphabetic())),
            _ => Err("both-case-p requires a character".to_string()),
        },

        "char-upcase" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Character(c.to_ascii_uppercase())),
            _ => Err("char-upcase requires a character".to_string()),
        },

        "char-downcase" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Character(c.to_ascii_lowercase())),
            _ => Err("char-downcase requires a character".to_string()),
        },

        "char-code" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Float(*c as u32 as f64)),
            _ => Err("char-code requires a character".to_string()),
        },

        "code-char" => match args.get(0) {
            Some(EvalResult::Float(n)) if *n >= 0.0 && *n < 128.0 => {
                Ok(EvalResult::Character(*n as u8 as char))
            },
            _ => Err("code-char requires a valid character code".to_string()),
        },

        "char-int" => match args.get(0) {
            Some(EvalResult::Character(c)) => Ok(EvalResult::Float(*c as u32 as f64)),
            _ => Err("char-int requires a character".to_string()),
        },

        // Character comparison
        "char=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a == b))
            },
            _ => Err("char= requires two characters".to_string()),
        },

        "char/=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a != b))
            },
            _ => Err("char/= requires two characters".to_string()),
        },

        "char<" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a < b))
            },
            _ => Err("char< requires two characters".to_string()),
        },

        "char>" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a > b))
            },
            _ => Err("char> requires two characters".to_string()),
        },

        "char<=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a <= b))
            },
            _ => Err("char<= requires two characters".to_string()),
        },

        "char>=" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a >= b))
            },
            _ => Err("char>= requires two characters".to_string()),
        },

        "char-equal" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a.to_ascii_lowercase() == b.to_ascii_lowercase()))
            },
            _ => Err("char-equal requires two characters".to_string()),
        },

        "char-not-equal" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a.to_ascii_lowercase() != b.to_ascii_lowercase()))
            },
            _ => Err("char-not-equal requires two characters".to_string()),
        },

        "char-lessp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a.to_ascii_lowercase() < b.to_ascii_lowercase()))
            },
            _ => Err("char-lessp requires two characters".to_string()),
        },

        "char-greaterp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a.to_ascii_lowercase() > b.to_ascii_lowercase()))
            },
            _ => Err("char-greaterp requires two characters".to_string()),
        },

        "char-not-greaterp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a.to_ascii_lowercase() <= b.to_ascii_lowercase()))
            },
            _ => Err("char-not-greaterp requires two characters".to_string()),
        },

        "char-not-lessp" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a.to_ascii_lowercase() >= b.to_ascii_lowercase()))
            },
            _ => Err("char-not-lessp requires two characters".to_string()),
        },

        // Aliases with different naming convention
        "char-EQ-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a == b))
            },
            _ => Err("char-EQ- requires two characters".to_string()),
        },

        "char-NE-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a != b))
            },
            _ => Err("char-NE- requires two characters".to_string()),
        },

        "char-LT-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a < b))
            },
            _ => Err("char-LT- requires two characters".to_string()),
        },

        "char-GT-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a > b))
            },
            _ => Err("char-GT- requires two characters".to_string()),
        },

        "char-LE-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a <= b))
            },
            _ => Err("char-LE- requires two characters".to_string()),
        },

        "char-GE-" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::Character(a)), Some(EvalResult::Character(b))) => {
                Ok(EvalResult::Boolean(a >= b))
            },
            _ => Err("char-GE- requires two characters".to_string()),
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
                let name = if s.starts_with(':') && s.len() > 1 { &s[1..] } else { s.as_str() };
                let ch = match name.to_lowercase().as_str() {
                    "space" => Some(' '),
                    "newline" | "linefeed" => Some('\n'),
                    "tab" => Some('\t'),
                    "return" => Some('\r'),
                    "backspace" => Some('\u{0008}'),
                    "page" | "formfeed" => Some('\u{000C}'),
                    "rubout" | "delete" => Some('\u{007F}'),
                    "nul" | "null" => Some('\u{0000}'),
                    "escape" | "esc" => Some('\u{001B}'),
                    "bell" | "bel" => Some('\u{0007}'),
                    _ if name.len() == 1 => Some(name.chars().next().unwrap()),
                    _ => {
                        // Try parsing as "U+XXXX" or hex code point
                        let hex = if name.starts_with("U+") || name.starts_with("u+") {
                            &name[2..]
                        } else if name.starts_with("U") || name.starts_with("u") {
                            &name[1..]
                        } else {
                            name
                        };
                        u32::from_str_radix(hex, 16).ok().and_then(char::from_u32)
                    }
                };
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
