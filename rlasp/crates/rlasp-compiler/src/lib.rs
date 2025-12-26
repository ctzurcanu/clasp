//! Common Lisp Compiler for rlasp
//!
//! This crate provides:
//! - AST representation for all special forms
//! - Macro expansion (macroexpand-1, macroexpand)
//! - Code analysis and optimization
//! - Compilation to LLVM IR (via rlasp-jit)

pub mod ast;
pub mod macros;
pub mod expander;
pub mod error;

pub use ast::Ast;
pub use macros::MacroTable;
pub use expander::Expander;
pub use error::{CompilerError, CompilerResult};
