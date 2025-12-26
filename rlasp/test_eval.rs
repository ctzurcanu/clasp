use rlasp::Repl;

fn main() {
    let mut repl = Repl::new();

    // Test eval with quoted arithmetic
    test_eval(&mut repl, "(eval '(+ 1 2))", "3");

    // Test eval with variable reference
    test_eval(&mut repl, "(eval '(+ 3 4))", "7");

    // Test nested eval
    test_eval(&mut repl, "(eval (eval ''(+ 5 6)))", "11");

    println!("\nAll eval tests passed!");
}

fn test_eval(repl: &mut Repl, input: &str, expected: &str) {
    match repl.eval(input) {
        Ok(result) => {
            let result_str = result.to_string();
            if result_str == expected {
                println!("✓ {} => {}", input, result_str);
            } else {
                println!("✗ {} => {} (expected {})", input, result_str, expected);
            }
        }
        Err(e) => println!("✗ {} => {}", input, e),
    }
}
