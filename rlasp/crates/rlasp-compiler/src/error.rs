//! Compiler error types

use std::fmt;

/// Compiler error type
#[derive(Debug, Clone, PartialEq)]
pub enum CompilerError {
    /// Invalid syntax
    InvalidSyntax { form: String, msg: String },

    /// Undefined variable
    UndefinedVariable { name: String },

    /// Undefined function
    UndefinedFunction { name: String },

    /// Macro expansion error
    MacroExpansionError { msg: String },

    /// Invalid special form
    InvalidSpecialForm { form: String, msg: String },

    /// Arity mismatch
    ArityMismatch { expected: usize, got: usize },

    /// Type error
    TypeError { expected: String, got: String },

    /// Reader error
    ReaderError(String),
}

impl fmt::Display for CompilerError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            CompilerError::InvalidSyntax { form, msg } => {
                write!(f, "Invalid syntax in {}: {}", form, msg)
            }
            CompilerError::UndefinedVariable { name } => {
                write!(f, "Undefined variable: {}", name)
            }
            CompilerError::UndefinedFunction { name } => {
                write!(f, "Undefined function: {}", name)
            }
            CompilerError::MacroExpansionError { msg } => {
                write!(f, "Macro expansion error: {}", msg)
            }
            CompilerError::InvalidSpecialForm { form, msg } => {
                write!(f, "Invalid special form {}: {}", form, msg)
            }
            CompilerError::ArityMismatch { expected, got } => {
                write!(f, "Arity mismatch: expected {}, got {}", expected, got)
            }
            CompilerError::TypeError { expected, got } => {
                write!(f, "Type error: expected {}, got {}", expected, got)
            }
            CompilerError::ReaderError(msg) => {
                write!(f, "Reader error: {}", msg)
            }
        }
    }
}

impl std::error::Error for CompilerError {}

impl From<rlasp_reader::ReaderError> for CompilerError {
    fn from(err: rlasp_reader::ReaderError) -> Self {
        CompilerError::ReaderError(err.to_string())
    }
}

/// Result type for compiler operations
pub type CompilerResult<T> = Result<T, CompilerError>;
