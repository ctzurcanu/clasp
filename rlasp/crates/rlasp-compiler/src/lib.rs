//! Common Lisp Compiler for rlasp
//!
//! This crate provides:
//! - AST representation for all special forms
//! - Macro expansion (macroexpand-1, macroexpand)
//! - Code analysis and optimization
//! - Compilation to LLVM IR (via rlasp-jit)

pub mod ast;
pub mod error;
pub mod expander;
pub mod macros;
pub mod semantic;

pub use ast::Ast;
pub use error::{CompilerError, CompilerResult};
pub use expander::Expander;
pub use macros::MacroTable;
pub use semantic::{
    compile_expanded_unit, compile_expanded_unit_with_originals, compile_source_unit, compile_unit,
    compile_unit_with_expander, BlockId, CallKind, ClosedCellId, CompilationMode, ConstId, FormId,
    FunctionId, GenericDispatchSite, GenericDispatchSiteId, LexicalSlotId, LoadTimeValueId, MvOp,
    NlExitOp, PackageEffect, SemanticConstant, SemanticForm, SemanticFunction,
    SemanticLoadTimeValue, SemanticUnit, SpecialSlotId, TagId,
};
