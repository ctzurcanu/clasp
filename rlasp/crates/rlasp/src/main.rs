use rlasp::Repl;
use std::env;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();
    let mut repl = Repl::new();

    // Process arguments
    let mut i = 1;
    let mut interactive = true;
    let mut eval_exprs: Vec<String> = Vec::new();

    while i < args.len() {
        match args[i].as_str() {
            "-e" | "--eval" => {
                if i + 1 < args.len() {
                    eval_exprs.push(args[i + 1].clone());
                    i += 2;
                } else {
                    eprintln!("Error: -e requires an expression argument");
                    std::process::exit(1);
                }
            }
            "--no-repl" => {
                interactive = false;
                i += 1;
            }
            "-h" | "--help" => {
                println!("rlasp - A Rust-based Common Lisp implementation");
                println!();
                println!("Usage: rlasp [OPTIONS] [FILES...]");
                println!();
                println!("Options:");
                println!("  -e, --eval EXPR   Evaluate EXPR after loading files");
                println!("  --no-repl         Exit after loading files and evaluating -e expressions");
                println!("  -h, --help        Show this help");
                println!();
                println!("Examples:");
                println!("  rlasp                          Start interactive REPL");
                println!("  rlasp foo.lisp                 Load foo.lisp then start REPL");
                println!("  rlasp foo.lisp -e '(test)'     Load foo.lisp, evaluate (test), then REPL");
                println!("  rlasp foo.lisp --no-repl       Load foo.lisp and exit");
                return;
            }
            file => {
                // Load file
                match fs::read_to_string(file) {
                    Ok(content) => {
                        match repl.eval_file(&content) {
                            Ok(_) => {}
                            Err(e) => {
                                eprintln!("Error loading {}: {}", file, e);
                                std::process::exit(1);
                            }
                        }
                    }
                    Err(e) => {
                        eprintln!("Error reading {}: {}", file, e);
                        std::process::exit(1);
                    }
                }
                i += 1;
            }
        }
    }

    // Evaluate -e expressions
    for expr in eval_exprs {
        match repl.eval(&expr) {
            Ok(result) => println!("=> {}", result),
            Err(e) => {
                eprintln!("Error: {}", e);
                std::process::exit(1);
            }
        }
    }

    // Start interactive REPL if requested
    if interactive {
        repl.run();
    }
}
