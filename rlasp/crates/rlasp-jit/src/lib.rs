//! rlasp-jit: LLVM JIT Compiler
//!
//! Provides JIT compilation for rlasp using LLVM via inkwell

pub mod codegen;
pub mod intrinsics;
pub mod intrinsics_clos;
pub mod jit;

pub use codegen::CodeGenerator;
pub use jit::JitEngine;
