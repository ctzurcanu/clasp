//! Demo: Calling C functions from Lisp
//!
//! Run with: cargo run --example ffi_demo

use rlasp_ffi::types::{FromLisp, ToLisp};
use rlasp_ffi::{ForeignSignature, ForeignType, Library};
use rlasp_runtime::LispObject;

fn main() {
    println!("=== rlasp C FFI Demo ===\n");

    // Load the math library
    println!("Loading libm (math library)...");
    let libm = Library::load_libm().expect("Failed to load libm");
    println!("✓ libm loaded successfully!\n");

    // Example 1: sqrt(16.0) = 4.0
    println!("Example 1: Calling sqrt(16.0)");
    println!("----------------------------");

    let sqrt_sig = ForeignSignature {
        return_type: ForeignType::Double,
        param_types: vec![ForeignType::Double],
    };

    let sqrt_fn = libm
        .get_function("sqrt", sqrt_sig)
        .expect("Failed to get sqrt function");

    // Create Lisp value for 16.0
    let arg = 16.0f64.to_lisp();
    println!("  Input (Lisp):  {:?}", arg);
    println!("  Input (value): 16.0");

    // Call sqrt
    let result = sqrt_fn.call(&[arg]).expect("sqrt call failed");
    println!("  Result (Lisp): {:?}", result);

    // Convert back to Rust
    let value = f64::from_lisp(result).expect("Failed to convert result");
    println!("  Result (f64):  {}", value);
    println!("  ✓ sqrt(16.0) = {}\n", value);

    // Example 2: sqrt(2.0) ≈ 1.414
    println!("Example 2: Calling sqrt(2.0)");
    println!("----------------------------");
    let arg2 = 2.0f64.to_lisp();
    let result2 = sqrt_fn.call(&[arg2]).expect("sqrt call failed");
    let value2 = f64::from_lisp(result2).expect("Failed to convert result");
    println!("  ✓ sqrt(2.0) = {}\n", value2);

    // Example 3: Custom function (defined in Rust, called via FFI)
    println!("Example 3: Calling custom Rust function via FFI");
    println!("------------------------------------------------");

    extern "C" fn add(a: i32, b: i32) -> i32 {
        a + b
    }

    let add_sig = ForeignSignature {
        return_type: ForeignType::Int32,
        param_types: vec![ForeignType::Int32, ForeignType::Int32],
    };

    use rlasp_ffi::ForeignFunction;
    use std::ffi::c_void;

    let add_fn =
        ForeignFunction::new(add as *const c_void, add_sig).expect("Failed to create add function");

    let a = 5i32.to_lisp();
    let b = 7i32.to_lisp();
    println!("  Inputs: 5 + 7");

    let result3 = add_fn.call(&[a, b]).expect("add call failed");
    let sum = i32::from_lisp(result3).expect("Failed to convert result");
    println!("  ✓ add(5, 7) = {}\n", sum);

    // Example 4: Fixnum arithmetic via FFI
    println!("Example 4: Multiple FFI calls");
    println!("-----------------------------");

    extern "C" fn multiply(a: i32, b: i32) -> i32 {
        a * b
    }

    let mul_sig = ForeignSignature {
        return_type: ForeignType::Int32,
        param_types: vec![ForeignType::Int32, ForeignType::Int32],
    };

    let mul_fn = ForeignFunction::new(multiply as *const c_void, mul_sig)
        .expect("Failed to create multiply function");

    for (a, b) in &[(3, 4), (10, 5), (7, 8)] {
        let arg_a = (*a as i32).to_lisp();
        let arg_b = (*b as i32).to_lisp();
        let result = mul_fn.call(&[arg_a, arg_b]).expect("multiply call failed");
        let product = i32::from_lisp(result).expect("Failed to convert result");
        println!("  {} × {} = {}", a, b, product);
    }

    println!("\n=== All FFI calls successful! ===");
    println!("\nThis demonstrates:");
    println!("  ✓ Dynamic library loading (libm)");
    println!("  ✓ Type conversion (Lisp ↔ C)");
    println!("  ✓ Foreign function calling via libffi");
    println!("  ✓ Both system libraries and custom functions");
}
