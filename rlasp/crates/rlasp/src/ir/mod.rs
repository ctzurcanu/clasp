pub mod ast;
pub mod codegen;
/// IR - Intermediate representation (Cleavir2-style)
///
/// Three-level IR hierarchy:
/// - BIR (Basic IR): High-level semantic IR
/// - BMIR (Backend Machine IR): Type-specialized IR
/// - BLIR (Backend Low-level IR): Memory-explicit IR
///
/// Currently implementing BIR level.
pub mod datum;
pub mod iblock;
pub mod instruction;
pub mod interpreter;
pub mod lower;
pub mod module;
pub mod passes;
pub mod wasm_codegen;

pub use ast::*;
pub use codegen::*;
pub use datum::*;
pub use iblock::*;
pub use instruction::*;
pub use interpreter::*;
pub use lower::*;
pub use module::*;
pub use passes::*;
pub use rlasp_runtime::FloatFormat;
pub use wasm_codegen::*;
