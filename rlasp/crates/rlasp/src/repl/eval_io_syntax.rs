//! IO Syntax special variables for Common Lisp compatibility
//!
//! This module wraps the rlasp-runtime io_syntax module to provide
//! EvalResult-based access for the interpreter.

use super::eval_types::EvalResult;
use rlasp_runtime::io_syntax::{self, IoSyntaxValue};
use std::collections::HashMap;

/// Convert IoSyntaxValue to EvalResult
fn to_eval_result(val: IoSyntaxValue) -> EvalResult {
    match val {
        IoSyntaxValue::Nil => EvalResult::Nil,
        IoSyntaxValue::True => EvalResult::Bool(true),
        IoSyntaxValue::False => EvalResult::Bool(false),
        IoSyntaxValue::Fixnum(n) => EvalResult::Fixnum(n),
        IoSyntaxValue::Symbol(s) => EvalResult::Symbol(s),
    }
}

/// Convert EvalResult to IoSyntaxValue
fn from_eval_result(val: &EvalResult) -> IoSyntaxValue {
    match val {
        EvalResult::Nil => IoSyntaxValue::Nil,
        EvalResult::Bool(true) => IoSyntaxValue::True,
        EvalResult::Bool(false) => IoSyntaxValue::False,
        EvalResult::Fixnum(n) => IoSyntaxValue::Fixnum(*n),
        EvalResult::Symbol(s) => IoSyntaxValue::Symbol(s.clone()),
        EvalResult::String(s) => IoSyntaxValue::Symbol(s.clone()),
        _ => IoSyntaxValue::Nil,
    }
}

/// Get the current value of an IO syntax variable
pub fn get_io_syntax_var(name: &str) -> Option<EvalResult> {
    io_syntax::get_io_syntax_var(&name.to_ascii_lowercase()).map(to_eval_result)
}

/// Set the value of an IO syntax variable
pub fn set_io_syntax_var(name: &str, value: EvalResult) {
    io_syntax::set_io_syntax_var(&name.to_ascii_lowercase(), from_eval_result(&value));
}

/// Check if a name is an IO syntax variable
pub fn is_io_syntax_var(name: &str) -> bool {
    io_syntax::is_io_syntax_var(&name.to_ascii_lowercase())
}

/// Saved state for restore
pub struct SavedIoSyntaxState {
    state: HashMap<String, IoSyntaxValue>,
}

/// Save all current IO syntax variable values
pub fn save_io_syntax_state() -> SavedIoSyntaxState {
    SavedIoSyntaxState {
        state: io_syntax::save_io_syntax_state(),
    }
}

/// Restore all IO syntax variables from a saved state
pub fn restore_io_syntax_state(saved: SavedIoSyntaxState) {
    io_syntax::restore_io_syntax_state(saved.state);
}

/// Set all IO syntax variables to their standard values
pub fn set_standard_io_syntax() {
    io_syntax::set_standard_io_syntax();
}

/// List of all IO syntax variable names for iteration
pub const IO_SYNTAX_VAR_NAMES: &[&str] = io_syntax::IO_SYNTAX_VAR_NAMES;
