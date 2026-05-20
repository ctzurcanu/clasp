//! Common Lisp Reader for rlasp
//!
//! This module implements a full Common Lisp reader that can parse
//! Clasp source files into s-expressions.
//!
//! ## Features
//! - Tokenization of numbers, symbols, strings, characters
//! - S-expression parsing (lists, vectors, arrays)
//! - Reader macros (quote, backquote, function, etc.)
//! - Package-qualified symbols
//! - Comments (line and block)
//!
//! ## Usage
//! ```rust,ignore
//! use rlasp_reader::Reader;
//!
//! let source = "(defun factorial (n) (if (<= n 1) 1 (* n (factorial (- n 1)))))";
//! let reader = Reader::from_string(source);
//! let expr = reader.read().unwrap();
//! ```

pub mod error;
pub mod lexer;
pub mod parser;
pub mod reader;
pub mod token;

pub use error::{ReaderError, ReaderResult};
pub use lexer::Lexer;
pub use parser::{is_skip_marker, Parser};
pub use reader::{read_all_from_string, read_from_string, read_from_string_with_positions, Reader};
pub use token::Token;
