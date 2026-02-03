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

// Enhanced format implementation with ASDF-required directives
fn format_simple(fmt: &str, args: &[EvalResult]) -> Result<String, String> {
    format_with_context(fmt, args, &mut 0)
}

fn format_with_context(fmt: &str, args: &[EvalResult], arg_index: &mut usize) -> Result<String, String> {
    let mut result = String::new();
    let mut chars = fmt.chars().peekable();

    while let Some(ch) = chars.next() {
        if ch == '~' {
            // Check for modifiers (@ : @:)
            let mut at_modifier = false;
            let mut colon_modifier = false;

            while let Some(&modifier) = chars.peek() {
                if modifier == '@' {
                    at_modifier = true;
                    chars.next();
                } else if modifier == ':' {
                    colon_modifier = true;
                    chars.next();
                } else {
                    break;
                }
            }

            if let Some(&directive) = chars.peek() {
                chars.next(); // consume directive
                match directive {
                    'A' | 'a' => {
                        // Aesthetic (princ-like)
                        if let Some(arg) = args.get(*arg_index) {
                            result.push_str(&format_for_princ(arg));
                            *arg_index += 1;
                        }
                    }
                    'S' | 's' => {
                        // Standard (prin1-like)
                        if let Some(arg) = args.get(*arg_index) {
                            result.push_str(&format_for_prin1(arg));
                            *arg_index += 1;
                        }
                    }
                    'D' | 'd' => {
                        // Decimal
                        if let Some(arg) = args.get(*arg_index) {
                            if colon_modifier {
                                // ~:D - decimal with commas for thousands
                                if let EvalResult::Fixnum(n) = arg {
                                    result.push_str(&format_with_commas(*n));
                                } else {
                                    result.push_str(&format_for_princ(arg));
                                }
                            } else {
                                result.push_str(&format_for_princ(arg));
                            }
                            *arg_index += 1;
                        }
                    }
                    'F' | 'f' => {
                        // Fixed-point float
                        if let Some(arg) = args.get(*arg_index) {
                            let num_str = match arg {
                                EvalResult::Float(n) => format!("{:.3}", n),
                                EvalResult::Fixnum(i) => format!("{:.3}", *i as f64),
                                _ => format_for_princ(arg),
                            };
                            result.push_str(&num_str);
                            *arg_index += 1;
                        }
                    }
                    '%' => {
                        // Newline
                        result.push('\n');
                    }
                    '&' => {
                        // Fresh line
                        result.push('\n');
                    }
                    '~' => {
                        // Literal tilde
                        result.push('~');
                    }
                    '[' => {
                        // Conditional: ~[...~;...~] or ~@[...~] or ~:[...~]
                        // Find the matching ~]
                        let mut nesting = 1;
                        let mut body = String::new();
                        while let Some(c) = chars.next() {
                            if c == '~' {
                                if let Some(&next) = chars.peek() {
                                    if next == '[' {
                                        nesting += 1;
                                        body.push(c);
                                        body.push(chars.next().unwrap());
                                    } else if next == ']' {
                                        nesting -= 1;
                                        if nesting == 0 {
                                            chars.next(); // consume ]
                                            break;
                                        } else {
                                            body.push(c);
                                            body.push(chars.next().unwrap());
                                        }
                                    } else {
                                        body.push(c);
                                    }
                                } else {
                                    body.push(c);
                                }
                            } else {
                                body.push(c);
                            }
                        }

                        if at_modifier {
                            // ~@[...~] - conditional if arg is non-nil
                            if let Some(arg) = args.get(*arg_index) {
                                if !matches!(arg, EvalResult::Nil) {
                                    // Don't consume arg, just use it for the test
                                    result.push_str(&format_with_context(&body, args, arg_index)?);
                                } else {
                                    *arg_index += 1;
                                }
                            }
                        } else if colon_modifier {
                            // ~:[false~;true~] - conditional based on nil/non-nil
                            if let Some(arg) = args.get(*arg_index) {
                                *arg_index += 1;
                                let parts: Vec<&str> = body.split("~;").collect();
                                if matches!(arg, EvalResult::Nil) {
                                    // Use first (false) clause
                                    if let Some(false_clause) = parts.get(0) {
                                        result.push_str(&format_with_context(false_clause, args, arg_index)?);
                                    }
                                } else {
                                    // Use second (true) clause
                                    if let Some(true_clause) = parts.get(1) {
                                        result.push_str(&format_with_context(true_clause, args, arg_index)?);
                                    }
                                }
                            }
                        } else {
                            // ~[...~;...~] - numeric selection
                            if let Some(arg) = args.get(*arg_index) {
                                *arg_index += 1;
                                if let EvalResult::Fixnum(idx) = arg {
                                    let parts: Vec<&str> = body.split("~;").collect();
                                    if let Some(clause) = parts.get(*idx as usize) {
                                        result.push_str(&format_with_context(clause, args, arg_index)?);
                                    }
                                }
                            }
                        }
                    }
                    '{' => {
                        // Iteration: ~{...~}
                        // Find the matching ~}
                        let mut nesting = 1;
                        let mut body = String::new();
                        while let Some(c) = chars.next() {
                            if c == '~' {
                                if let Some(&next) = chars.peek() {
                                    if next == '{' {
                                        nesting += 1;
                                        body.push(c);
                                        body.push(chars.next().unwrap());
                                    } else if next == '}' {
                                        nesting -= 1;
                                        if nesting == 0 {
                                            chars.next(); // consume }
                                            break;
                                        } else {
                                            body.push(c);
                                            body.push(chars.next().unwrap());
                                        }
                                    } else {
                                        body.push(c);
                                    }
                                } else {
                                    body.push(c);
                                }
                            } else {
                                body.push(c);
                            }
                        }

                        // Get the list to iterate over
                        if let Some(arg) = args.get(*arg_index) {
                            *arg_index += 1;

                            // Convert to a list of elements
                            let elements = list_to_vec(arg);
                            let mut first = true;

                            for (idx, elem) in elements.iter().enumerate() {
                                let is_last = idx + 1 == elements.len();
                                let elem_args = vec![elem.clone()];
                                let mut elem_idx = 0;

                                let formatted = if body.contains("~^") {
                                    if is_last {
                                        // For the last element, stop at ~^ (skip separators)
                                        let prefix = body.split("~^").next().unwrap_or("");
                                        format_with_context(prefix, &elem_args, &mut elem_idx)?
                                    } else {
                                        // For non-last elements, ~^ is a no-op
                                        let without_escape = body.replace("~^", "");
                                        format_with_context(&without_escape, &elem_args, &mut elem_idx)?
                                    }
                                } else {
                                    format_with_context(&body, &elem_args, &mut elem_idx)?
                                };

                                // Handle ~^ for last element
                                if at_modifier && !first {
                                    // ~@{ puts elements on separate lines
                                    result.push('\n');
                                }

                                result.push_str(&formatted);
                                first = false;
                            }
                        }
                    }
                    '^' => {
                        // Escape from enclosing ~{...~} if no more args
                        // In this simplified version, we just skip it
                        // The parent iteration handler checks for this
                    }
                    '*' => {
                        // Argument repositioning
                        if colon_modifier {
                            // ~:* - go back one argument
                            if *arg_index > 0 {
                                *arg_index -= 1;
                            }
                        } else if at_modifier {
                            // ~@* - go to absolute position (next number, or 0)
                            *arg_index = 0;
                        } else {
                            // ~* - skip one argument forward
                            *arg_index += 1;
                        }
                    }
                    'R' | 'r' => {
                        // Radix (English words for numbers)
                        if let Some(arg) = args.get(*arg_index) {
                            if let EvalResult::Fixnum(n) = arg {
                                if colon_modifier {
                                    // ~:R - ordinal (1st, 2nd, etc.)
                                    result.push_str(&format_ordinal(*n));
                                } else {
                                    // ~R - cardinal (one, two, etc.)
                                    result.push_str(&format_cardinal(*n));
                                }
                            } else {
                                result.push_str(&format_for_princ(arg));
                            }
                            *arg_index += 1;
                        }
                    }
                    ',' | '0'..='9' => {
                        // Format parameters - skip until directive letter
                        while let Some(&next_ch) = chars.peek() {
                            if next_ch.is_alphabetic() {
                                chars.next();
                                match next_ch.to_ascii_uppercase() {
                                    'F' => {
                                        if let Some(arg) = args.get(*arg_index) {
                                            let num_str = match arg {
                                                EvalResult::Float(n) => format!("{:.3}", n),
                                                EvalResult::Fixnum(i) => format!("{:.3}", *i as f64),
                                                _ => format_for_princ(arg),
                                            };
                                            result.push_str(&num_str);
                                            *arg_index += 1;
                                        }
                                    }
                                    'D' => {
                                        if let Some(arg) = args.get(*arg_index) {
                                            result.push_str(&format_for_princ(arg));
                                            *arg_index += 1;
                                        }
                                    }
                                    _ => {}
                                }
                                break;
                            } else {
                                chars.next();
                            }
                        }
                    }
                    '(' => {
                        // Case conversion: ~:@( is upcase all
                        let mut nesting = 1;
                        let mut body = String::new();
                        while let Some(c) = chars.next() {
                            if c == '~' {
                                if let Some(&next) = chars.peek() {
                                    if next == '(' {
                                        nesting += 1;
                                        body.push(c);
                                        body.push(chars.next().unwrap());
                                    } else if next == ')' {
                                        nesting -= 1;
                                        if nesting == 0 {
                                            chars.next();
                                            break;
                                        } else {
                                            body.push(c);
                                            body.push(chars.next().unwrap());
                                        }
                                    } else {
                                        body.push(c);
                                    }
                                } else {
                                    body.push(c);
                                }
                            } else {
                                body.push(c);
                            }
                        }

                        let formatted = format_with_context(&body, args, arg_index)?;
                        if colon_modifier && at_modifier {
                            // ~:@( - upcase all
                            result.push_str(&formatted.to_uppercase());
                        } else if colon_modifier {
                            // ~:( - capitalize words
                            result.push_str(&capitalize_words(&formatted));
                        } else if at_modifier {
                            // ~@( - capitalize first word
                            result.push_str(&capitalize_first(&formatted));
                        } else {
                            // ~( - downcase all
                            result.push_str(&formatted.to_lowercase());
                        }
                    }
                    _ => {
                        // Unknown directive, pass through
                        result.push('~');
                        if at_modifier { result.push('@'); }
                        if colon_modifier { result.push(':'); }
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

// Helper: convert list to vector
fn list_to_vec(list: &EvalResult) -> Vec<EvalResult> {
    let mut result = Vec::new();
    let mut current = list.clone();
    while let EvalResult::Cons(car, cdr) = current {
        result.push(car.borrow().clone());
        current = cdr.borrow().clone();
    }
    result
}

// Helper: format number with commas
fn format_with_commas(n: i64) -> String {
    let s = n.abs().to_string();
    let mut result = String::new();
    for (i, c) in s.chars().rev().enumerate() {
        if i > 0 && i % 3 == 0 {
            result.insert(0, ',');
        }
        result.insert(0, c);
    }
    if n < 0 {
        result.insert(0, '-');
    }
    result
}

// Helper: format cardinal number (one, two, etc.)
fn format_cardinal(n: i64) -> String {
    match n {
        0 => "zero".to_string(),
        1 => "one".to_string(),
        2 => "two".to_string(),
        3 => "three".to_string(),
        4 => "four".to_string(),
        5 => "five".to_string(),
        6 => "six".to_string(),
        7 => "seven".to_string(),
        8 => "eight".to_string(),
        9 => "nine".to_string(),
        10 => "ten".to_string(),
        _ => n.to_string(),
    }
}

// Helper: format ordinal number (first, second, etc.)
fn format_ordinal(n: i64) -> String {
    match n {
        1 => "first".to_string(),
        2 => "second".to_string(),
        3 => "third".to_string(),
        4 => "fourth".to_string(),
        5 => "fifth".to_string(),
        6 => "sixth".to_string(),
        7 => "seventh".to_string(),
        8 => "eighth".to_string(),
        9 => "ninth".to_string(),
        10 => "tenth".to_string(),
        _ => {
            let suffix = match n % 10 {
                1 if n % 100 != 11 => "st",
                2 if n % 100 != 12 => "nd",
                3 if n % 100 != 13 => "rd",
                _ => "th",
            };
            format!("{}{}", n, suffix)
        }
    }
}

// Helper: capitalize first character
fn capitalize_first(s: &str) -> String {
    let mut chars = s.chars();
    match chars.next() {
        Some(first) => first.to_uppercase().chain(chars).collect(),
        None => String::new(),
    }
}

// Helper: capitalize each word
fn capitalize_words(s: &str) -> String {
    s.split_whitespace()
        .map(|word| capitalize_first(word))
        .collect::<Vec<_>>()
        .join(" ")
}
