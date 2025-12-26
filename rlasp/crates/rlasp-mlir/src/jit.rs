/// MLIR-based JIT compilation
///
/// This module provides JIT execution using the MLIR → LLVM IR lowering pipeline.
/// It integrates MLIRCodegen with the rlasp-jit execution engine.

use anyhow::Result;
use inkwell::context::Context;
use inkwell::module::Module;
use inkwell::memory_buffer::MemoryBuffer;
use crate::lowering::lower_mlir_to_llvm;

/// Parse LLVM IR text into an inkwell Module
pub fn parse_llvm_ir<'ctx>(context: &'ctx Context, llvm_ir: &str) -> Result<Module<'ctx>> {
    // Write LLVM IR to a temporary file and parse from there
    // This avoids issues with MemoryBuffer null-termination
    // Use unique temp file name to avoid conflicts in parallel tests
    use std::sync::atomic::{AtomicUsize, Ordering};
    static COUNTER: AtomicUsize = AtomicUsize::new(0);
    let id = COUNTER.fetch_add(1, Ordering::SeqCst);
    let temp_file = std::env::temp_dir().join(format!("mlir_jit_temp_{}.ll", id));
    std::fs::write(&temp_file, llvm_ir)?;

    let module = Module::parse_bitcode_from_path(&temp_file, context)
        .or_else(|_| {
            // If bitcode fails, try text IR
            let memory_buffer = inkwell::memory_buffer::MemoryBuffer::create_from_file(&temp_file)
                .map_err(|e| anyhow::anyhow!("Failed to read temp file: {}", e))?;
            context.create_module_from_ir(memory_buffer)
                .map_err(|e| anyhow::anyhow!("Failed to parse LLVM IR: {}", e))
        })?;

    // Clean up temp file
    let _ = std::fs::remove_file(&temp_file);

    Ok(module)
}

/// Create a JIT engine from MLIR text
///
/// This function:
/// 1. Lowers MLIR to LLVM IR using mlir-opt and mlir-translate
/// 2. Parses the LLVM IR into an inkwell Module
/// 3. Creates a JIT engine from the module
pub fn create_jit_from_mlir<'ctx>(
    context: &'ctx Context,
    mlir_text: &str,
) -> Result<rlasp_jit::JitEngine<'ctx>> {
    // Step 1: Lower MLIR to LLVM IR
    let llvm_ir = lower_mlir_to_llvm(mlir_text)?;

    // Debug: write LLVM IR to temp file
    std::fs::write("/tmp/debug_llvm_ir.ll", &llvm_ir)?;

    // Step 2: Parse LLVM IR into inkwell Module
    let module = parse_llvm_ir(context, &llvm_ir)?;

    // Step 3: Create JIT engine with proper intrinsic mapping
    crate::jit_fixed::create_jit_engine_fixed(module)
        .map_err(|e| anyhow::anyhow!("Failed to create JIT engine: {}", e))
}

/// Compile and execute a function using MLIR JIT
///
/// This is a convenience function that:
/// 1. Generates MLIR for a function
/// 2. Lowers to LLVM IR
/// 3. Creates a JIT engine
/// 4. Returns the JIT engine for execution
///
/// Note: This function takes ownership of the codegen since finalize() consumes it
pub fn jit_compile_function<'ctx>(
    context: &'ctx Context,
    mut codegen: crate::MLIRCodegen,
    function_name: &str,
    params: &[String],
    body: &rlasp::ir::ASTNode,
) -> Result<rlasp_jit::JitEngine<'ctx>> {
    // Compile the function to MLIR
    codegen.compile_function(function_name, params, body)?;

    // Finalize and get MLIR text
    let mlir_text = codegen.finalize();

    // Create JIT engine
    create_jit_from_mlir(context, &mlir_text)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::MLIRCodegen;
    use rlasp::ir::{ASTNode, ConstantValue};

    #[test]
    fn test_mlir_jit_constant() {
        let context = Context::create();
        let codegen = MLIRCodegen::new("test_constant");

        // (defun get_42 () 42)
        let body = ASTNode::Constant(ConstantValue::Fixnum(42));

        let jit = jit_compile_function(&context, codegen, "test_const_func", &[], &body)
            .expect("Failed to create JIT");

        unsafe {
            // MLIR functions return i64, not usize, so we need to get the function with the right signature
            let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn() -> i64>
                = jit.execution_engine().get_function("test_const_func")
                    .expect("Failed to get function");
            let result = func.call();
            let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
            assert_eq!(unboxed, 42);
        }
    }

    #[test]
    fn test_mlir_jit_addition() {
        let context = Context::create();
        let codegen = MLIRCodegen::new("test_addition");

        // (defun add_one (x) (+ x 1))
        let body = ASTNode::Call {
            function: Box::new(ASTNode::Variable("+".to_string())),
            args: vec![
                ASTNode::Variable("x".to_string()),
                ASTNode::Constant(ConstantValue::Fixnum(1)),
            ],
        };

        let jit = jit_compile_function(&context, codegen, "test_add_func", &["x".to_string()], &body)
            .expect("Failed to create JIT");

        unsafe {
            // Entry point functions have direct parameters
            let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn(i64) -> i64>
                = jit.execution_engine().get_function("test_add_func")
                    .expect("Failed to get function");

            // Test: 41 + 1 = 42
            let input = (41i64 << 2); // Tag as fixnum
            let result = func.call(input);
            let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
            assert_eq!(unboxed, 42);
        }
    }
}
