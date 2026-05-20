/// IR - Intermediate representation (Cleavir2-style)
///
/// Three-level IR hierarchy:
/// - BIR (Basic IR): High-level semantic IR
/// - BMIR (Backend Machine IR): Type-specialized IR
/// - BLIR (Backend Low-level IR): Memory-explicit IR
///
/// Currently implementing BIR level.

pub mod datum;
pub mod instruction;
pub mod iblock;
pub mod module;
pub mod ast;
pub mod lower;
pub mod passes;
pub mod codegen;
pub mod wasm_codegen;
pub mod interpreter;

pub use datum::*;
pub use instruction::*;
pub use iblock::*;
pub use module::*;
pub use ast::*;
pub use lower::*;
pub use passes::*;
pub use codegen::*;
pub use wasm_codegen::*;
pub use interpreter::*;
