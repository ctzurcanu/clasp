//! REPL with pre-registered Rust functions
//!
//! Shows how to expose Rust functions to Lisp

use rlasp::Repl;
use rlasp_macros::lisp_fn;

/// Factorial in Rust
#[lisp_fn]
pub fn factorial(n: i64) -> i64 {
    if n <= 1 {
        1
    } else {
        n * factorial(n - 1)
    }
}

/// Power function
#[lisp_fn]
pub fn pow(base: f64, exp: f64) -> f64 {
    base.powf(exp)
}

/// Check if even
#[lisp_fn]
pub fn is_even(n: i64) -> i64 {
    if n % 2 == 0 {
        1
    } else {
        0
    }
}

fn main() {
    let mut repl = Repl::new();

    // Register Rust functions
    println!("Registering Rust functions...");
    let (name1, func1) = register_factorial();
    repl.register_rust_fn(name1, func1);
    println!("  Registered: {}", name1);

    let (name2, func2) = register_pow();
    repl.register_rust_fn(name2, func2);
    println!("  Registered: {}", name2);

    let (name3, func3) = register_is_even();
    repl.register_rust_fn(name3, func3);
    println!("  Registered: {}", name3);

    println!("\nTry calling them:");
    println!("  (factorial 5)   => 120");
    println!("  (pow 2.0 10.0)  => 1024.0");
    println!("  (is-even 42)    => 1");
    println!();

    repl.run();
}
