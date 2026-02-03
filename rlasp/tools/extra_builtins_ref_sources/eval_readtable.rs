/// eval_readtable.rs - Readtable operations
use super::eval_types::EvalResult;

pub fn call_readtable_builtin(name: &str, _args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "readtablep" => Ok(EvalResult::Boolean(false)),
        "copy-readtable" => Ok(EvalResult::Symbol("READTABLE".to_string())),
        "readtable-case" => Ok(EvalResult::Symbol("UPCASE".to_string())),
        "get-macro-character" | "get-dispatch-macro-character" => Ok(EvalResult::Nil),
        "set-macro-character" | "set-dispatch-macro-character" | "make-dispatch-macro-character" => Ok(EvalResult::Boolean(true)),
        "set-syntax-from-char" => Ok(EvalResult::Boolean(true)),
        _ => Err(format!("Unknown readtable builtin: {}", name)),
    }
}
