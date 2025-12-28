/// eval_io.rs - Common Lisp I/O operations
/// Print, read, format, and stream operations
use super::eval_types::EvalResult;
use std::rc::Rc;
use std::cell::RefCell;
use std::io::Write;

pub fn call_io_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        // Output functions
        "prin1" => {
            // Print object in readable form (with escape characters)
            if let Some(obj) = args.get(0) {
                print!("{}", format_for_prin1(obj));
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "princ" => {
            // Print object without escape characters
            if let Some(obj) = args.get(0) {
                print!("{}", format_for_princ(obj));
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "print" => {
            // Print with newline before and space after
            if let Some(obj) = args.get(0) {
                println!();
                print!("{} ", format_for_prin1(obj));
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "pprint" => {
            // Pretty print
            if let Some(obj) = args.get(0) {
                println!("{}", format_for_prin1(obj));
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "write" => {
            // Generic write with keywords
            if let Some(obj) = args.get(0) {
                print!("{}", format_for_prin1(obj));
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "write-line" => {
            // Write string with newline
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    println!("{}", s);
                    Ok(EvalResult::String(s.clone()))
                }
                Some(obj) => {
                    println!("{}", format_for_princ(obj));
                    Ok(obj.clone())
                }
                None => Ok(EvalResult::Nil),
            }
        }

        "write-string" => {
            // Write string without newline
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    print!("{}", s);
                    Ok(EvalResult::String(s.clone()))
                }
                _ => Err("write-string requires a string".to_string()),
            }
        }

        "write-char" => {
            // Write single character
            match args.get(0) {
                Some(EvalResult::Character(c)) => {
                    print!("{}", c);
                    Ok(EvalResult::Character(*c))
                }
                _ => Err("write-char requires a character".to_string()),
            }
        }

        "terpri" => {
            // Output newline
            println!();
            Ok(EvalResult::Nil)
        }

        "fresh-line" => {
            // Output newline if not at beginning of line
            // For simplicity, always output newline
            println!();
            Ok(EvalResult::Boolean(true))
        }

        "finish-output" | "force-output" | "clear-output" => {
            // Stream flushing operations - no-op in simple implementation
            Ok(EvalResult::Nil)
        }

        // Input functions (stubs for now)
        "read" => {
            // Read Lisp object from stream
            Err("read not implemented yet - requires reader integration".to_string())
        }

        "read-line" => {
            // Read line as string
            Err("read-line not implemented yet".to_string())
        }

        "read-char" => {
            // Read single character
            Err("read-char not implemented yet".to_string())
        }

        "peek-char" => {
            // Peek at next character without consuming
            Err("peek-char not implemented yet".to_string())
        }

        "unread-char" => {
            // Put character back into stream
            Err("unread-char not implemented yet".to_string())
        }

        "listen" => {
            // Check if input is available
            Ok(EvalResult::Nil)
        }

        "clear-input" => {
            // Clear input buffer
            Ok(EvalResult::Nil)
        }

        // Format (simplified)
        "format" => {
            // (format destination control-string &rest args)
            match (args.get(0), args.get(1)) {
                (Some(dest), Some(EvalResult::String(fmt))) => {
                    let output = format_simple(fmt, &args[2..])?;

                    match dest {
                        EvalResult::Nil => {
                            // Return string
                            Ok(EvalResult::String(output))
                        }
                        EvalResult::Boolean(true) | EvalResult::Bool(true) => {
                            // Output to stdout
                            print!("{}", output);
                            std::io::stdout().flush().ok();
                            Ok(EvalResult::Nil)
                        }
                        _ => {
                            // Stream output - not implemented
                            print!("{}", output);
                            std::io::stdout().flush().ok();
                            Ok(EvalResult::Nil)
                        }
                    }
                }
                _ => Err("format requires destination and control string".to_string()),
            }
        }

        // Stream predicates
        "streamp" => {
            // For now, no stream objects exist
            Ok(EvalResult::Boolean(false))
        }

        "input-stream-p" | "output-stream-p" | "interactive-stream-p" => {
            Ok(EvalResult::Boolean(false))
        }

        "open-stream-p" => {
            Ok(EvalResult::Boolean(false))
        }

        _ => Err(format!("Unknown I/O builtin: {}", name)),
    }
}

// Helper: format object for prin1 (with escapes)
fn format_for_prin1(obj: &EvalResult) -> String {
    match obj {
        EvalResult::String(s) => format!("\"{}\"", s),
        EvalResult::Character(c) => format!("#\\{}", c),
        EvalResult::Symbol(s) => s.clone(),
        EvalResult::Float(n) => n.to_string(),
        EvalResult::Fixnum(n) => n.to_string(),
        EvalResult::Bignum(n) => n.to_string(),
        EvalResult::Ratio(r) => format!("{}/{}", r.numerator_ref(), r.denominator_ref()),
        EvalResult::Complex(re, im) => format!("#C({} {})", re, im),
        EvalResult::Boolean(true) | EvalResult::Bool(true) => "T".to_string(),
        EvalResult::Boolean(false) | EvalResult::Bool(false) | EvalResult::Nil => "NIL".to_string(),
        EvalResult::Cons(_, _) => format_list(obj),
        _ => format!("{}", obj),
    }
}

// Helper: format object for princ (without escapes)
fn format_for_princ(obj: &EvalResult) -> String {
    match obj {
        EvalResult::String(s) => s.clone(),
        EvalResult::Character(c) => c.to_string(),
        _ => format_for_prin1(obj),
    }
}

// Helper: format list
fn format_list(obj: &EvalResult) -> String {
    let mut result = String::from("(");
    let mut current = obj.clone();
    let mut first = true;

    loop {
        match current {
            EvalResult::Cons(car, cdr) => {
                if !first {
                    result.push(' ');
                }
                first = false;
                result.push_str(&format_for_prin1(&car.borrow()));

                let cdr_val = cdr.borrow().clone();
                match cdr_val {
                    EvalResult::Nil => break,
                    EvalResult::Cons(_, _) => {
                        current = cdr_val;
                    }
                    _ => {
                        result.push_str(" . ");
                        result.push_str(&format_for_prin1(&cdr_val));
                        break;
                    }
                }
            }
            EvalResult::Nil => break,
            _ => {
                result.push_str(&format_for_prin1(&current));
                break;
            }
        }
    }

    result.push(')');
    result
}

// Simplified format implementation
fn format_simple(fmt: &str, args: &[EvalResult]) -> Result<String, String> {
    let mut result = String::new();
    let mut chars = fmt.chars().peekable();
    let mut arg_index = 0;

    while let Some(ch) = chars.next() {
        if ch == '~' {
            if let Some(&directive) = chars.peek() {
                chars.next(); // consume directive
                match directive {
                    'A' | 'a' => {
                        // Aesthetic (princ-like)
                        if let Some(arg) = args.get(arg_index) {
                            result.push_str(&format_for_princ(arg));
                            arg_index += 1;
                        }
                    }
                    'S' | 's' => {
                        // Standard (prin1-like)
                        if let Some(arg) = args.get(arg_index) {
                            result.push_str(&format_for_prin1(arg));
                            arg_index += 1;
                        }
                    }
                    'D' | 'd' => {
                        // Decimal
                        if let Some(arg) = args.get(arg_index) {
                            result.push_str(&format_for_princ(arg));
                            arg_index += 1;
                        }
                    }
                    'F' | 'f' => {
                        // Fixed-point float (handle ~,3F for 3 decimal places)
                        if let Some(arg) = args.get(arg_index) {
                            let num_str = match arg {
                                EvalResult::Float(n) => format!("{:.3}", n),
                                EvalResult::Fixnum(i) => format!("{:.3}", *i as f64),
                                _ => format_for_princ(arg),
                            };
                            result.push_str(&num_str);
                            arg_index += 1;
                        }
                    }
                    '%' => {
                        // Newline
                        result.push('\n');
                    }
                    '&' => {
                        // Fresh line (simplified: just newline)
                        result.push('\n');
                    }
                    '~' => {
                        // Literal tilde
                        result.push('~');
                    }
                    ',' | '0'..='9' => {
                        // Format parameters like ,3 in ~,3F - skip until we hit the directive letter
                        while let Some(&next_ch) = chars.peek() {
                            if next_ch.is_alphabetic() {
                                chars.next(); // consume the directive letter
                                match next_ch.to_ascii_uppercase() {
                                    'F' => {
                                        if let Some(arg) = args.get(arg_index) {
                                            let num_str = match arg {
                                                EvalResult::Float(n) => format!("{:.3}", n),
                                                EvalResult::Fixnum(i) => format!("{:.3}", *i as f64),
                                                _ => format_for_princ(arg),
                                            };
                                            result.push_str(&num_str);
                                            arg_index += 1;
                                        }
                                    }
                                    'D' => {
                                        if let Some(arg) = args.get(arg_index) {
                                            result.push_str(&format_for_princ(arg));
                                            arg_index += 1;
                                        }
                                    }
                                    _ => {}
                                }
                                break;
                            } else {
                                chars.next(); // skip format parameter chars
                            }
                        }
                    }
                    _ => {
                        // Unknown directive, pass through
                        result.push('~');
                        result.push(directive);
                    }
                }
            } else {
                result.push(ch);
            }
        } else {
            result.push(ch);
        }
    }

    Ok(result)
}
