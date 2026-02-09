/// eval_io.rs - Common Lisp I/O operations
/// Print, read, format, and stream operations
use super::eval_types::EvalResult;
use std::rc::Rc;
use std::cell::RefCell;
use std::io::Write;

const STREAM_INPUT_TAG: &str = "%STREAM-INPUT%";
const STREAM_OUTPUT_TAG: &str = "%STREAM-OUTPUT%";

fn stream_tag(cells: &[EvalResult]) -> Option<&str> {
    match cells.first() {
        Some(EvalResult::Symbol(tag)) => Some(tag.as_str()),
        _ => None,
    }
}

fn is_stream(value: &EvalResult) -> bool {
    match value {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            matches!(stream_tag(&cells), Some(STREAM_INPUT_TAG | STREAM_OUTPUT_TAG))
        }
        _ => false,
    }
}

fn stream_is_closed(value: &EvalResult) -> bool {
    match value {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            match stream_tag(&cells) {
                Some(STREAM_INPUT_TAG) => matches!(cells.get(3), Some(EvalResult::Boolean(true) | EvalResult::Bool(true))),
                Some(STREAM_OUTPUT_TAG) => matches!(cells.get(2), Some(EvalResult::Boolean(true) | EvalResult::Bool(true))),
                _ => true,
            }
        }
        _ => true,
    }
}

fn set_stream_closed(value: &EvalResult, closed: bool) -> Result<(), String> {
    match value {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            match stream_tag(&cells) {
                Some(STREAM_INPUT_TAG) => {
                    if cells.len() < 4 {
                        return Err("corrupt input stream".to_string());
                    }
                    cells[3] = EvalResult::Boolean(closed);
                    Ok(())
                }
                Some(STREAM_OUTPUT_TAG) => {
                    if cells.len() < 3 {
                        return Err("corrupt output stream".to_string());
                    }
                    cells[2] = EvalResult::Boolean(closed);
                    Ok(())
                }
                _ => Err("not a stream".to_string()),
            }
        }
        _ => Err("not a stream".to_string()),
    }
}

pub(super) fn make_input_stream(content: String) -> EvalResult {
    EvalResult::Array(Rc::new(RefCell::new(vec![
        EvalResult::Symbol(STREAM_INPUT_TAG.to_string()),
        EvalResult::String(content),
        EvalResult::Fixnum(0),
        EvalResult::Boolean(false),
    ])))
}

pub(super) fn make_output_stream() -> EvalResult {
    EvalResult::Array(Rc::new(RefCell::new(vec![
        EvalResult::Symbol(STREAM_OUTPUT_TAG.to_string()),
        EvalResult::String(String::new()),
        EvalResult::Boolean(false),
    ])))
}

pub(super) fn stream_write_text(stream: &EvalResult, text: &str) -> Result<(), String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            match stream_tag(&cells) {
                Some(STREAM_OUTPUT_TAG) => {
                    if matches!(cells.get(2), Some(EvalResult::Boolean(true) | EvalResult::Bool(true))) {
                        return Err("stream is closed".to_string());
                    }
                    let mut current = match cells.get(1).cloned() {
                        Some(EvalResult::String(s)) => s,
                        _ => String::new(),
                    };
                    current.push_str(text);
                    cells[1] = EvalResult::String(current);
                    Ok(())
                }
                Some(STREAM_INPUT_TAG) => Err("cannot write to input stream".to_string()),
                _ => Err("not a stream".to_string()),
            }
        }
        _ => Err("not a stream".to_string()),
    }
}

pub(super) fn stream_remaining_input(stream: &EvalResult) -> Option<String> {
    match stream {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            if stream_tag(&cells) != Some(STREAM_INPUT_TAG) {
                return None;
            }
            if matches!(cells.get(3), Some(EvalResult::Boolean(true) | EvalResult::Bool(true))) {
                return Some(String::new());
            }
            let content = match cells.get(1) {
                Some(EvalResult::String(s)) => s.clone(),
                _ => String::new(),
            };
            let pos = match cells.get(2) {
                Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
                _ => 0,
            };
            Some(content.chars().skip(pos).collect())
        }
        _ => None,
    }
}

pub(super) fn stream_read_chars(stream: &EvalResult, max_chars: usize) -> Result<String, String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            if stream_tag(&cells) != Some(STREAM_INPUT_TAG) {
                return Err("read-sequence requires an input stream".to_string());
            }
            if matches!(cells.get(3), Some(EvalResult::Boolean(true) | EvalResult::Bool(true))) {
                return Err("stream is closed".to_string());
            }

            let content = match cells.get(1).cloned() {
                Some(EvalResult::String(s)) => s,
                _ => String::new(),
            };
            let pos = match cells.get(2).cloned() {
                Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                _ => 0,
            };

            if pos >= content.chars().count() || max_chars == 0 {
                return Ok(String::new());
            }

            let chars: Vec<char> = content.chars().collect();
            let end = (pos + max_chars).min(chars.len());
            let chunk: String = chars[pos..end].iter().collect();
            cells[2] = EvalResult::Fixnum(end as i64);
            Ok(chunk)
        }
        _ => Err("read-sequence requires a stream".to_string()),
    }
}

fn stream_read_line(stream: &EvalResult, eof_error_p: bool, eof_value: EvalResult) -> Result<EvalResult, String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            if stream_tag(&cells) != Some(STREAM_INPUT_TAG) {
                return Err("read-line requires an input stream".to_string());
            }
            if matches!(cells.get(3), Some(EvalResult::Boolean(true) | EvalResult::Bool(true))) {
                return Err("stream is closed".to_string());
            }

            let content = match cells.get(1).cloned() {
                Some(EvalResult::String(s)) => s,
                _ => String::new(),
            };
            let pos = match cells.get(2).cloned() {
                Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                _ => 0,
            };

            if pos >= content.len() {
                if eof_error_p {
                    return Err("end of file".to_string());
                }
                return Ok(eof_value);
            }

            let bytes = content.as_bytes();
            let mut end = pos;
            while end < bytes.len() && bytes[end] != b'\n' {
                end += 1;
            }

            let line = content[pos..end].trim_end_matches('\r').to_string();
            let next_pos = if end < bytes.len() { end + 1 } else { end };
            cells[2] = EvalResult::Fixnum(next_pos as i64);
            Ok(EvalResult::String(line))
        }
        _ => Err("read-line requires a stream".to_string()),
    }
}

pub(super) fn get_output_stream_string(stream: &EvalResult) -> Result<String, String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            if stream_tag(&cells) != Some(STREAM_OUTPUT_TAG) {
                return Err("get-output-stream-string requires an output stream".to_string());
            }
            if matches!(cells.get(2), Some(EvalResult::Boolean(true) | EvalResult::Bool(true))) {
                return Err("stream is closed".to_string());
            }
            let current = match cells.get(1).cloned() {
                Some(EvalResult::String(s)) => s,
                _ => String::new(),
            };
            cells[1] = EvalResult::String(String::new());
            Ok(current)
        }
        _ => Err("get-output-stream-string requires a stream".to_string()),
    }
}

fn write_to_destination(dest: Option<&EvalResult>, text: &str) -> Result<(), String> {
    match dest {
        Some(target) if is_stream(target) => stream_write_text(target, text),
        Some(EvalResult::Boolean(true) | EvalResult::Bool(true)) | Some(EvalResult::Nil) | None => {
            print!("{}", text);
            std::io::stdout().flush().ok();
            Ok(())
        }
        _ => {
            print!("{}", text);
            std::io::stdout().flush().ok();
            Ok(())
        }
    }
}

pub fn call_io_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        // Output functions
        "prin1" => {
            // Print object in readable form (with escape characters)
            if let Some(obj) = args.get(0) {
                write_to_destination(args.get(1), &format_for_prin1(obj))?;
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "princ" => {
            // Print object without escape characters
            if let Some(obj) = args.get(0) {
                write_to_destination(args.get(1), &format_for_princ(obj))?;
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "print" => {
            // Print with newline before and space after
            if let Some(obj) = args.get(0) {
                let mut out = String::new();
                out.push('\n');
                out.push_str(&format_for_prin1(obj));
                out.push(' ');
                write_to_destination(args.get(1), &out)?;
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "pprint" => {
            // Pretty print
            if let Some(obj) = args.get(0) {
                let mut out = format_for_prin1(obj);
                out.push('\n');
                write_to_destination(args.get(1), &out)?;
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "write" => {
            // Generic write with keywords
            if let Some(obj) = args.get(0) {
                write_to_destination(args.get(1), &format_for_prin1(obj))?;
                Ok(obj.clone())
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "write-line" => {
            // Write string with newline
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    let mut out = s.clone();
                    out.push('\n');
                    write_to_destination(args.get(1), &out)?;
                    Ok(EvalResult::String(s.clone()))
                }
                Some(obj) => {
                    let mut out = format_for_princ(obj);
                    out.push('\n');
                    write_to_destination(args.get(1), &out)?;
                    Ok(obj.clone())
                }
                None => Ok(EvalResult::Nil),
            }
        }

        "write-string" => {
            // Write string without newline
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    write_to_destination(args.get(1), s)?;
                    Ok(EvalResult::String(s.clone()))
                }
                _ => Err("write-string requires a string".to_string()),
            }
        }

        "write-char" => {
            // Write single character
            match args.get(0) {
                Some(EvalResult::Character(c)) => {
                    write_to_destination(args.get(1), &c.to_string())?;
                    Ok(EvalResult::Character(*c))
                }
                _ => Err("write-char requires a character".to_string()),
            }
        }

        "terpri" => {
            // Output newline
            write_to_destination(args.get(0), "\n")?;
            Ok(EvalResult::Nil)
        }

        "fresh-line" => {
            // Output newline if not at beginning of line
            // For simplicity, always output newline
            write_to_destination(args.get(0), "\n")?;
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
            let stream = args.get(0).ok_or_else(|| "read-line requires a stream".to_string())?;
            let eof_error_p = args.get(1).map(|v| !matches!(v, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false))).unwrap_or(true);
            let eof_value = args.get(2).cloned().unwrap_or(EvalResult::Nil);
            stream_read_line(stream, eof_error_p, eof_value)
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

        "get-output-stream-string" => {
            let stream = args.get(0).ok_or_else(|| "get-output-stream-string requires a stream".to_string())?;
            Ok(EvalResult::String(get_output_stream_string(stream)?))
        }

        "close" => {
            match args.get(0) {
                Some(stream) if is_stream(stream) => {
                    set_stream_closed(stream, true)?;
                    Ok(EvalResult::Boolean(true))
                }
                Some(_) | None => Ok(EvalResult::Boolean(true)),
            }
        }

        "listen" => {
            if let Some(stream) = args.get(0) {
                if let Some(rem) = stream_remaining_input(stream) {
                    return Ok(EvalResult::Boolean(!rem.is_empty()));
                }
            }
            Ok(EvalResult::Boolean(false))
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
            Ok(EvalResult::Boolean(args.get(0).map(is_stream).unwrap_or(false)))
        }

        "input-stream-p" | "output-stream-p" | "interactive-stream-p" => {
            let Some(stream) = args.get(0) else {
                return Ok(EvalResult::Boolean(false));
            };
            if !is_stream(stream) {
                return Ok(EvalResult::Boolean(false));
            }
            let result = match name {
                "input-stream-p" => {
                    match stream {
                        EvalResult::Array(arr) => matches!(stream_tag(&arr.borrow()), Some(STREAM_INPUT_TAG)),
                        _ => false,
                    }
                }
                "output-stream-p" => {
                    match stream {
                        EvalResult::Array(arr) => matches!(stream_tag(&arr.borrow()), Some(STREAM_OUTPUT_TAG)),
                        _ => false,
                    }
                }
                _ => false,
            };
            Ok(EvalResult::Boolean(result))
        }

        "open-stream-p" => {
            if let Some(stream) = args.get(0) {
                if is_stream(stream) {
                    return Ok(EvalResult::Boolean(!stream_is_closed(stream)));
                }
            }
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
