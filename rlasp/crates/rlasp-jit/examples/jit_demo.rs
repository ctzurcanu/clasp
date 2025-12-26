// JIT Compilation Demo
//
// This demonstrates:
// - Compiling simple functions to LLVM IR
// - JIT executing compiled code
// - Using intrinsics for type boxing/unboxing

use rlasp_jit::CodeGenerator;
use rlasp_ffi::types::ToLisp;
use inkwell::context::Context;

fn main() {
    println!("=== rlasp JIT Compilation Demo ===\n");

    // Create LLVM context and code generator
    let context = Context::create();
    let codegen = CodeGenerator::new(&context, "demo");

    // Compile a constant function
    println!("1. Compiling constant function: get_42");
    codegen.compile_constant_fixnum("get_42", 42);

    // Compile an addition function
    println!("2. Compiling addition function: add");
    codegen.compile_add_fixnums("add");

    // Print the generated LLVM IR
    println!("\n=== Generated LLVM IR ===");
    codegen.print_ir();

    // Create JIT engine
    println!("\n=== Creating JIT Engine ===");
    let jit = codegen.into_jit_engine().expect("Failed to create JIT engine");
    println!("JIT engine created successfully\n");

    // Test 1: Execute constant function
    println!("=== Test 1: Constant Function ===");
    unsafe {
        let func = jit.get_function_0("get_42").expect("Failed to get get_42");
        let result = func.call();
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result);
        println!("get_42() = {}", unboxed);
        assert_eq!(unboxed, 42);
        println!("✓ Test passed!\n");
    }

    // Test 2: Execute addition function
    println!("=== Test 2: Addition Function ===");
    unsafe {
        let func = jit.get_function_2("add").expect("Failed to get add");

        // Test: 10 + 20 = 30
        let a = 10i64.to_lisp().raw();
        let b = 20i64.to_lisp().raw();
        let result = func.call(a, b);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result);
        println!("add(10, 20) = {}", unboxed);
        assert_eq!(unboxed, 30);

        // Test: 100 + 234 = 334
        let a = 100i64.to_lisp().raw();
        let b = 234i64.to_lisp().raw();
        let result = func.call(a, b);
        let unboxed = rlasp_jit::intrinsics::cc_unbox_fixnum(result);
        println!("add(100, 234) = {}", unboxed);
        assert_eq!(unboxed, 334);

        println!("✓ All tests passed!\n");
    }

    println!("=== Demo Complete ===");
    println!("Successfully demonstrated:");
    println!("  ✓ LLVM IR code generation");
    println!("  ✓ JIT compilation");
    println!("  ✓ Runtime execution of compiled code");
    println!("  ✓ Type boxing/unboxing with intrinsics");
}
