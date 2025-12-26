/// MLIR JIT Compilation Demo
///
/// This demonstrates the complete MLIR-based JIT compilation pipeline:
/// 1. Generate MLIR text from AST
/// 2. Lower MLIR to LLVM IR (using mlir-opt and mlir-translate)
/// 3. Create JIT engine from LLVM IR
/// 4. Execute compiled functions

use rlasp_mlir::{MLIRCodegen, jit::create_jit_from_mlir};
use rlasp::ir::{ASTNode, ConstantValue};
use inkwell::context::Context;

fn main() {
    println!("=== MLIR-based JIT Compilation Demo ===\n");

    // Create LLVM context
    let context = Context::create();

    // Example 1: Constant function
    println!("=== Example 1: Constant Function ===");
    println!("Lisp code: (defun get-answer () 42)");

    let mut codegen1 = MLIRCodegen::new("example1");
    let body1 = ASTNode::Constant(ConstantValue::Fixnum(42));

    codegen1.compile_function("__main", &[], &body1)
        .expect("Failed to compile constant function");

    let mlir1 = codegen1.finalize();
    println!("\nGenerated MLIR:");
    println!("{}", mlir1);

    println!("\nCreating JIT engine and executing...");
    let jit1 = create_jit_from_mlir(&context, &mlir1)
        .expect("Failed to create JIT engine");

    unsafe {
        let func = jit1.get_function_0("__main")
            .expect("Failed to get function");
        let result = func.call();
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
        println!("Result: {}", unboxed);
        assert_eq!(unboxed, 42);
        println!("✓ Test passed!\n");
    }

    // Example 2: Arithmetic function
    println!("=== Example 2: Arithmetic Function ===");
    println!("Lisp code: (defun add-one (x) (+ x 1))");

    let mut codegen2 = MLIRCodegen::new("example2");
    let body2 = ASTNode::Call {
        function: Box::new(ASTNode::Variable("+".to_string())),
        args: vec![
            ASTNode::Variable("x".to_string()),
            ASTNode::Constant(ConstantValue::Fixnum(1)),
        ],
    };

    codegen2.compile_function("__main", &["x".to_string()], &body2)
        .expect("Failed to compile arithmetic function");

    let mlir2 = codegen2.finalize();
    println!("\nGenerated MLIR:");
    println!("{}", mlir2);

    println!("\nCreating JIT engine and executing...");
    let jit2 = create_jit_from_mlir(&context, &mlir2)
        .expect("Failed to create JIT engine");

    unsafe {
        let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn(i64) -> i64>
            = jit2.execution_engine().get_function("__main")
                .expect("Failed to get function");

        // Test: 41 + 1 = 42
        let input = 41i64 << 2; // Tag as fixnum
        let result = func.call(input);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
        println!("add-one(41) = {}", unboxed);
        assert_eq!(unboxed, 42);

        // Test: 99 + 1 = 100
        let input = 99i64 << 2;
        let result = func.call(input);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
        println!("add-one(99) = {}", unboxed);
        assert_eq!(unboxed, 100);

        println!("✓ All tests passed!\n");
    }

    // Example 3: If expression
    println!("=== Example 3: Conditional Expression ===");
    println!("Lisp code: (defun is-zero (x) (if (= x 0) 1 0))");

    let mut codegen3 = MLIRCodegen::new("example3");
    let body3 = ASTNode::If {
        test: Box::new(ASTNode::Call {
            function: Box::new(ASTNode::Variable("=".to_string())),
            args: vec![
                ASTNode::Variable("x".to_string()),
                ASTNode::Constant(ConstantValue::Fixnum(0)),
            ],
        }),
        then_branch: Box::new(ASTNode::Constant(ConstantValue::Fixnum(1))),
        else_branch: Box::new(ASTNode::Constant(ConstantValue::Fixnum(0))),
    };

    codegen3.compile_function("__main", &["x".to_string()], &body3)
        .expect("Failed to compile if expression");

    let mlir3 = codegen3.finalize();
    println!("\nGenerated MLIR:");
    println!("{}", mlir3);

    println!("\nCreating JIT engine and executing...");
    let jit3 = create_jit_from_mlir(&context, &mlir3)
        .expect("Failed to create JIT engine");

    unsafe {
        let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn(i64) -> i64>
            = jit3.execution_engine().get_function("__main")
                .expect("Failed to get function");

        // Test: is-zero(0) = 1
        let input = 0i64 << 2;
        let result = func.call(input);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
        println!("is-zero(0) = {}", unboxed);
        assert_eq!(unboxed, 1);

        // Test: is-zero(5) = 0
        let input = 5i64 << 2;
        let result = func.call(input);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
        println!("is-zero(5) = {}", unboxed);
        assert_eq!(unboxed, 0);

        println!("✓ All tests passed!\n");
    }

    // Example 4: Let binding
    println!("=== Example 4: Let Binding ===");
    println!("Lisp code: (defun double-plus-ten (x) (let ((y (* x 2))) (+ y 10)))");

    let mut codegen4 = MLIRCodegen::new("example4");
    let body4 = ASTNode::Let {
        bindings: vec![(
            "y".to_string(),
            ASTNode::Call {
                function: Box::new(ASTNode::Variable("*".to_string())),
                args: vec![
                    ASTNode::Variable("x".to_string()),
                    ASTNode::Constant(ConstantValue::Fixnum(2)),
                ],
            },
        )],
        body: vec![ASTNode::Call {
            function: Box::new(ASTNode::Variable("+".to_string())),
            args: vec![
                ASTNode::Variable("y".to_string()),
                ASTNode::Constant(ConstantValue::Fixnum(10)),
            ],
        }],
    };

    codegen4.compile_function("__main", &["x".to_string()], &body4)
        .expect("Failed to compile let binding");

    let mlir4 = codegen4.finalize();
    println!("\nGenerated MLIR:");
    println!("{}", mlir4);

    println!("\nCreating JIT engine and executing...");
    let jit4 = create_jit_from_mlir(&context, &mlir4)
        .expect("Failed to create JIT engine");

    unsafe {
        let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn(i64) -> i64>
            = jit4.execution_engine().get_function("__main")
                .expect("Failed to get function");

        // Test: double-plus-ten(5) = 5*2 + 10 = 20
        let input = 5i64 << 2;
        let result = func.call(input);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
        println!("double-plus-ten(5) = {}", unboxed);
        assert_eq!(unboxed, 20);

        // Test: double-plus-ten(15) = 15*2 + 10 = 40
        let input = 15i64 << 2;
        let result = func.call(input);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result as usize);
        println!("double-plus-ten(15) = {}", unboxed);
        assert_eq!(unboxed, 40);

        println!("✓ All tests passed!\n");
    }

    println!("=== Demo Complete ===");
    println!("Successfully demonstrated:");
    println!("  ✓ MLIR text generation from AST");
    println!("  ✓ MLIR → LLVM IR lowering (via mlir-opt & mlir-translate)");
    println!("  ✓ JIT compilation from LLVM IR");
    println!("  ✓ Runtime execution of compiled code");
    println!("  ✓ Constant functions");
    println!("  ✓ Arithmetic operations");
    println!("  ✓ Conditional expressions (if)");
    println!("  ✓ Let bindings");
}
