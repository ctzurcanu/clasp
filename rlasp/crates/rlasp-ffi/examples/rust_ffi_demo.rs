//! Demo: Exposing Rust functions to Lisp
//!
//! Run with: cargo run --example rust_ffi_demo

use rlasp_macros::lisp_fn;
use rlasp_runtime::LispObject;

/// Add two numbers (exposed to Lisp as "rust-add")
#[lisp_fn]
pub fn rust_add(a: i64, b: i64) -> i64 {
    a + b
}

/// Multiply two numbers
#[lisp_fn]
pub fn rust_multiply(a: i64, b: i64) -> i64 {
    a * b
}

/// Square a number
#[lisp_fn]
pub fn rust_square(n: f64) -> f64 {
    n * n
}

/// Fibonacci (recursive)
#[lisp_fn]
pub fn rust_fib(n: i64) -> i64 {
    if n <= 1 {
        n
    } else {
        rust_fib(n - 1) + rust_fib(n - 2)
    }
}

fn main() {
    println!("=== rlasp Rust FFI Demo ===\n");

    // Get registration info
    let (name1, func1) = register_rust_add();
    let (name2, func2) = register_rust_multiply();
    let (name3, func3) = register_rust_square();
    let (name4, func4) = register_rust_fib();

    println!("Registered Rust functions:");
    println!("  - {}", name1);
    println!("  - {}", name2);
    println!("  - {}", name3);
    println!("  - {}", name4);
    println!();

    // Test calling from Rust
    use rlasp_ffi::types::ToLisp;

    println!("Testing {} (5, 7):", name1);
    let args1 = vec![5i64.to_lisp(), 7i64.to_lisp()];
    match func1(&args1) {
        Ok(result) => {
            if let Some(n) = result.as_fixnum() {
                println!("  => {}", n);
            }
        }
        Err(e) => println!("  Error: {}", e),
    }

    println!("\nTesting {} (6, 7):", name2);
    let args2 = vec![6i64.to_lisp(), 7i64.to_lisp()];
    match func2(&args2) {
        Ok(result) => {
            if let Some(n) = result.as_fixnum() {
                println!("  => {}", n);
            }
        }
        Err(e) => println!("  Error: {}", e),
    }

    println!("\nTesting {} (12.5):", name3);
    let args3 = vec![12.5f64.to_lisp()];
    match func3(&args3) {
        Ok(result) => {
            if let Some(f) = result.as_float() {
                println!("  => {}", f);
            }
        }
        Err(e) => println!("  Error: {}", e),
    }

    println!("\nTesting {} (10):", name4);
    let args4 = vec![10i64.to_lisp()];
    match func4(&args4) {
        Ok(result) => {
            if let Some(n) = result.as_fixnum() {
                println!("  => {} (fib(10))", n);
            }
        }
        Err(e) => println!("  Error: {}", e),
    }

    println!("\n=== All Rust FFI calls successful! ===");
    println!("\nThis demonstrates:");
    println!("  ✓ #[lisp_fn] proc-macro");
    println!("  ✓ Automatic Rust → Lisp type conversion");
    println!("  ✓ Kebab-case naming (rust_add → rust-add)");
    println!("  ✓ Function registration");
    println!("  ✓ Calling Rust functions with Lisp arguments");
}
