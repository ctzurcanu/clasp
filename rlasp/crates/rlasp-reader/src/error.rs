//! Reader error types

use std::fmt;

/// Reader error type
#[derive(Debug, Clone, PartialEq)]
pub enum ReaderError {
    /// Unexpected end of input
    UnexpectedEof,

    /// Unexpected character
    UnexpectedChar { ch: char, pos: usize },

    /// Invalid number format
    InvalidNumber { text: String, pos: usize },

    /// Invalid character literal
    InvalidCharacter { text: String, pos: usize },

    /// Unterminated string
    UnterminatedString { pos: usize },

    /// Unterminated comment
    UnterminatedComment { pos: usize },

    /// Unmatched closing delimiter
    UnmatchedClosing { ch: char, pos: usize },

    /// Expected closing delimiter
    ExpectedClosing { expected: char, pos: usize },

    /// Invalid syntax
    InvalidSyntax { msg: String, pos: usize },

    /// Invalid package prefix
    InvalidPackagePrefix { text: String, pos: usize },

    /// Invalid reader macro
    InvalidReaderMacro { ch: char, pos: usize },
}

impl fmt::Display for ReaderError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            ReaderError::UnexpectedEof => write!(f, "Unexpected end of input"),
            ReaderError::UnexpectedChar { ch, pos } => {
                write!(f, "Unexpected character '{}' at position {}", ch, pos)
            }
            ReaderError::InvalidNumber { text, pos } => {
                write!(f, "Invalid number '{}' at position {}", text, pos)
            }
            ReaderError::InvalidCharacter { text, pos } => {
                write!(f, "Invalid character literal '{}' at position {}", text, pos)
            }
            ReaderError::UnterminatedString { pos } => {
                write!(f, "Unterminated string at position {}", pos)
            }
            ReaderError::UnterminatedComment { pos } => {
                write!(f, "Unterminated comment at position {}", pos)
            }
            ReaderError::UnmatchedClosing { ch, pos } => {
                write!(f, "Unmatched closing delimiter '{}' at position {}", ch, pos)
            }
            ReaderError::ExpectedClosing { expected, pos } => {
                write!(f, "Expected closing '{}' at position {}", expected, pos)
            }
            ReaderError::InvalidSyntax { msg, pos } => {
                write!(f, "Invalid syntax at position {}: {}", pos, msg)
            }
            ReaderError::InvalidPackagePrefix { text, pos } => {
                write!(f, "Invalid package prefix '{}' at position {}", text, pos)
            }
            ReaderError::InvalidReaderMacro { ch, pos } => {
                write!(f, "Invalid reader macro '{}' at position {}", ch, pos)
            }
        }
    }
}

impl std::error::Error for ReaderError {}

/// Result type for reader operations
pub type ReaderResult<T> = Result<T, ReaderError>;
