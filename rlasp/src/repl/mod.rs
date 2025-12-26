/// REPL - Read-Eval-Print Loop

pub mod reader;
pub mod eval;

use reader::Reader;
use std::io::{self, Write};
use std::collections::HashMap;

pub use reader::*;
pub use eval::*;

/// REPL state
pub struct Repl {
    env: HashMap<String, EvalResult>,
}

impl Repl {
    pub fn new() -> Self {
        Self {
            env: HashMap::new(),
        }
    }

    /// Evaluate one form
    pub fn eval(&mut self, input: &str) -> Result<EvalResult, String> {
        // 1. Read
        let mut reader = Reader::new(input);
        let ast = reader.read().map_err(|e| format!("Read error: {}", e))?;

        // 2. Evaluate with persistent environment
        eval::eval_with_persistent_env(&ast, &mut self.env)
    }

    /// Run the REPL
    pub fn run(&mut self) {
        println!("rlasp REPL v0.1.0");
        println!("Type expressions to evaluate, or :quit to exit");
        println!();

        loop {
            print!("rlasp> ");
            io::stdout().flush().unwrap();

            let mut input = String::new();
            if io::stdin().read_line(&mut input).is_err() {
                break;
            }

            let input = input.trim();

            // Echo input when stdin is not a terminal (piped input)
            if !input.is_empty() && !atty::is(atty::Stream::Stdin) {
                println!("{}", input);
            }

            if input.is_empty() {
                continue;
            }

            if input == ":quit" || input == ":q" {
                println!("Goodbye!");
                break;
            }

            if input == ":help" || input == ":h" {
                self.print_help();
                continue;
            }

            match self.eval(input) {
                Ok(result) => {
                    println!("=> {}", result);
                }
                Err(e) => {
                    println!("Error: {}", e);
                }
            }
        }
    }

    fn print_help(&self) {
        println!("Commands:");
        println!("  :help, :h    - Show this help");
        println!("  :quit, :q    - Exit REPL");
        println!();
        println!("Examples:");
        println!("  42           - Number literal");
        println!("  (+ 1 2)      - Function call");
        println!("  (* 3 4)      - Multiplication");
        println!("  (if t 1 2)   - Conditional");
        println!();
        println!("Note: Full Lisp semantics are being implemented.");
        println!("      Currently supports basic arithmetic and forms.");
    }
}

impl Default for Repl {
    fn default() -> Self {
        Self::new()
    }
}
