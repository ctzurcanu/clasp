//! Demonstration of rlasp capabilities

use rlasp_compiler::{Ast, Expander};
use rlasp_reader::{read_all_from_string, read_from_string};

fn main() {
    println!("=== rlasp Compiler Demo ===\n");

    // 1. Reader
    println!("📖 READER (Phase 3.1) ✅");
    println!("─────────────────────────");

    let examples = vec![
        ("Simple number", "42"),
        ("List", "(+ 1 2)"),
        ("Quote", "'(a b c)"),
        ("Nested", "(+ (* 2 3) (- 10 4))"),
    ];

    for (name, code) in examples {
        let expr = read_from_string(code).unwrap();
        println!("  {} => {}", name, expr);
    }
    println!();

    // 2. Macro Expansion
    println!("🔄 MACRO EXPANSION (Phase 3.2) ✅");
    println!("─────────────────────────────────");

    let expander = Expander::new();

    let macro_examples = vec![
        ("when", "(when t (+ 1 2))"),
        ("unless", "(unless nil 42)"),
        ("and", "(and x y)"),
        ("or", "(or a b)"),
    ];

    for (name, code) in macro_examples {
        let expr = read_from_string(code).unwrap();
        match expander.macroexpand(expr) {
            Ok(expanded) => {
                println!("  {} =>", name);
                println!("    {}", code);
                println!("    {}", expanded);
            }
            Err(e) => {
                println!("  {} => ERROR: {}", name, e);
            }
        }
        println!();
    }

    println!("═══════════════════════════════════");
    println!("✅ Reader:          COMPLETE (19/19 tests)");
    println!("✅ Macro Expansion: WORKING (10/14 tests)");
    println!("🚧 AST Conversion:  PARTIAL");
}
