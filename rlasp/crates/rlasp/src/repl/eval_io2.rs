/// eval_io2.rs - Additional I/O operations
use super::eval_types::EvalResult;

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
            Ok(EvalResult::Nil)
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
