/// eval_io2.rs - Additional I/O operations
use super::eval_types::EvalResult;
use std::cell::RefCell;
use std::rc::Rc;

pub fn call_io2_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "open" => {
            match args.get(0) {
                Some(EvalResult::String(path)) => Ok(EvalResult::String(path.clone())),
                _ => Err("open requires a pathname".to_string()),
            }
        }

        "close" => {
            Ok(EvalResult::Boolean(true))
        }

        "input-stream-p" | "output-stream-p" | "streamp" => {
            Ok(EvalResult::Boolean(false))
        }

        "read-byte" | "read-char-no-hang" => {
            Ok(EvalResult::Nil)
        }

        "write-byte" => {
            match args.get(0) {
                Some(byte) => Ok(byte.clone()),
                None => Err("write-byte requires a byte".to_string()),
            }
        }

        "read-sequence" | "write-sequence" => {
            Ok(EvalResult::Fixnum(0))
        }

        "clear-input" | "clear-output" | "finish-output" | "force-output" => {
            Ok(EvalResult::Nil)
        }

        "make-string-input-stream" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
                _ => Err("make-string-input-stream requires a string".to_string()),
            }
        }

        "make-string-output-stream" => {
            Ok(EvalResult::String("".to_string()))
        }

        "stream-element-type" | "stream-external-format" => {
            Ok(EvalResult::Symbol("CHARACTER".to_string()))
        }

        "set-stream-element-type" | "set-stream-external-format" => {
            Ok(EvalResult::Nil)
        }

        "read-from-string" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    // Simple parse - just return first symbol/number
                    let trimmed = s.trim();
                    if let Ok(n) = trimmed.parse::<i64>() {
                        Ok(EvalResult::Fixnum(n))
                    } else if let Ok(f) = trimmed.parse::<f64>() {
                        Ok(EvalResult::Float(f))
                    } else {
                        Ok(EvalResult::Symbol(trimmed.to_string()))
                    }
                }
                _ => Err("read-from-string requires a string".to_string()),
            }
        }

        "read-preserving-whitespace" => {
            Ok(EvalResult::Nil)
        }

        "read-delimited-list" => {
            let delimiter = match args.get(0) {
                Some(EvalResult::Character(c)) => *c,
                Some(EvalResult::String(s)) if s.chars().count() == 1 => s.chars().next().unwrap(),
                _ => return Err("read-delimited-list requires a delimiter character".to_string()),
            };
            let stream = args.get(1).cloned().unwrap_or(EvalResult::Nil);
            let eof_marker = EvalResult::Symbol("__EOF__".to_string());
            let mut out: Vec<EvalResult> = Vec::new();

            let parse_token = |token: &str| -> EvalResult {
                if let Ok(n) = token.parse::<i64>() {
                    EvalResult::Fixnum(n)
                } else if let Ok(f) = token.parse::<f64>() {
                    EvalResult::Float(f)
                } else {
                    EvalResult::Symbol(token.to_string())
                }
            };

            loop {
                let first = loop {
                    let ch = super::eval_io::call_io_builtin(
                        "read-char",
                        &[stream.clone(), EvalResult::Boolean(false), eof_marker.clone()],
                    )?;
                    match ch {
                        EvalResult::Symbol(ref s) if s == "__EOF__" => break None,
                        EvalResult::Character(c) if c.is_whitespace() => continue,
                        EvalResult::Character(c) if c == delimiter => break None,
                        EvalResult::Character(c) => break Some(c),
                        _ => break None,
                    }
                };

                let Some(first_ch) = first else { break };
                let mut token = String::new();
                token.push(first_ch);

                loop {
                    let ch = super::eval_io::call_io_builtin(
                        "read-char",
                        &[stream.clone(), EvalResult::Boolean(false), eof_marker.clone()],
                    )?;
                    match ch {
                        EvalResult::Symbol(ref s) if s == "__EOF__" => break,
                        EvalResult::Character(c) if c.is_whitespace() => break,
                        EvalResult::Character(c) if c == delimiter => break,
                        EvalResult::Character(c) => token.push(c),
                        _ => break,
                    }
                }

                out.push(parse_token(&token));
            }

            let mut list = EvalResult::Nil;
            for value in out.into_iter().rev() {
                list = EvalResult::Cons(
                    Rc::new(RefCell::new(value)),
                    Rc::new(RefCell::new(list)),
                );
            }
            Ok(list)
        }

        "file-string-length" => {
            match args.get(1) {
                Some(EvalResult::String(s)) => Ok(EvalResult::Fixnum(s.len() as i64)),
                _ => Ok(EvalResult::Fixnum(1)),
            }
        }

        _ => Err(format!("Unknown io2 builtin: {}", name)),
    }
}
