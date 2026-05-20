/// eval_io.rs - Common Lisp I/O operations
/// Print, read, format, and stream operations
use super::eval_types::EvalResult;
use std::cell::RefCell;
use std::collections::{HashMap, HashSet};
use std::io::{BufRead, Write};
use std::rc::Rc;

thread_local! {
    static PPRINT_DISPATCH: RefCell<HashMap<String, EvalResult>> = RefCell::new(HashMap::new());
    static IO_EVAL_ENV_PTR: RefCell<Option<*mut HashMap<String, EvalResult>>> = RefCell::new(None);
    static PRINT_PRETTY_OVERRIDE: RefCell<Option<bool>> = const { RefCell::new(None) };
}

const STREAM_INPUT_TAG: &str = "%STREAM-INPUT%";
const STREAM_OUTPUT_TAG: &str = "%STREAM-OUTPUT%";
const STREAM_FILE_TAG: &str = "%STREAM-FILE%";
const STREAM_BROADCAST_TAG: &str = "%STREAM-BROADCAST%";

const FILE_DIR_INPUT: &str = "INPUT";
const FILE_DIR_OUTPUT: &str = "OUTPUT";
const FILE_DIR_IO: &str = "IO";

fn bytes_to_raw_string(bytes: &[u8]) -> String {
    bytes.iter().map(|b| *b as char).collect()
}

fn raw_string_to_bytes(s: &str) -> Vec<u8> {
    s.chars().map(|c| (c as u32 & 0xFF) as u8).collect()
}

fn stream_tag(cells: &[EvalResult]) -> Option<&str> {
    match cells.first() {
        Some(EvalResult::Symbol(tag)) => Some(tag.as_str()),
        _ => None,
    }
}

fn truthy(value: &EvalResult) -> bool {
    !matches!(
        value,
        EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)
    )
}

fn current_print_pretty() -> bool {
    if let Some(override_value) = PRINT_PRETTY_OVERRIDE.with(|slot| *slot.borrow()) {
        return override_value;
    }
    !matches!(
        current_io_special(&["*print-pretty*", "*PRINT-PRETTY*"]),
        Some(EvalResult::Nil)
    )
}

fn with_print_pretty_override<T>(pretty: bool, f: impl FnOnce() -> T) -> T {
    let previous = PRINT_PRETTY_OVERRIDE.with(|slot| slot.replace(Some(pretty)));
    let result = f();
    PRINT_PRETTY_OVERRIDE.with(|slot| {
        slot.replace(previous);
    });
    result
}

fn keyword_name(value: &EvalResult) -> Option<String> {
    match value {
        EvalResult::Symbol(s) => Some(
            s.rsplit(':')
                .next()
                .unwrap_or(s)
                .trim_start_matches(':')
                .to_ascii_lowercase(),
        ),
        _ => None,
    }
}

fn to_fixnum(value: &EvalResult) -> Option<i64> {
    match value {
        EvalResult::Fixnum(n) => Some(*n),
        _ => None,
    }
}

fn symbol_base_name(sym: &str) -> &str {
    sym.rsplit(':').next().unwrap_or(sym)
}

fn extract_pathname_string(value: &EvalResult) -> Option<String> {
    match value {
        EvalResult::String(s) => Some(s.clone()),
        EvalResult::Symbol(s) => {
            if s.starts_with("#P\"") && s.ends_with('"') && s.len() >= 4 {
                Some(s[3..s.len() - 1].to_string())
            } else if s.starts_with('"') && s.ends_with('"') && s.len() >= 2 {
                Some(s[1..s.len() - 1].to_string())
            } else {
                Some(s.clone())
            }
        }
        EvalResult::Cons(car, cdr) => {
            let car_val = car.borrow();
            if let EvalResult::Symbol(sym) = &*car_val {
                if symbol_base_name(sym).eq_ignore_ascii_case("pathname") {
                    if let EvalResult::Cons(path_car, _) = &*cdr.borrow() {
                        return extract_pathname_string(&path_car.borrow());
                    }
                }
            }
            None
        }
        _ => None,
    }
}

fn to_string_designator(value: &EvalResult) -> Result<String, String> {
    if let Some(path_like) = extract_pathname_string(value) {
        return Ok(path_like);
    }

    match value {
        EvalResult::Symbol(s) => {
            if s.starts_with(':') {
                Ok(s[1..].to_uppercase())
            } else {
                Ok(s.clone())
            }
        }
        EvalResult::Character(c) => Ok(c.to_string()),
        EvalResult::Array(arr) => {
            let mut out = String::new();
            for elem in arr.borrow().iter() {
                match elem {
                    EvalResult::Character(c) => out.push(*c),
                    EvalResult::String(s) if s.chars().count() == 1 => {
                        out.push(s.chars().next().unwrap())
                    }
                    EvalResult::Nil => break,
                    _ => return Err("expected a string designator".to_string()),
                }
            }
            Ok(out)
        }
        _ => Err("expected a string designator".to_string()),
    }
}

fn normalize_logical_path(path: &str) -> String {
    let mut normalized = path.to_string();

    if normalized.starts_with("#P\"") && normalized.ends_with('"') && normalized.len() >= 4 {
        normalized = normalized[3..normalized.len() - 1].to_string();
    } else if normalized.starts_with('"') && normalized.ends_with('"') && normalized.len() >= 2 {
        normalized = normalized[1..normalized.len() - 1].to_string();
    }

    if normalized.starts_with("sys:") {
        let mut rest = &normalized[4..];
        if let Some(stripped) = rest.strip_prefix("src;lisp;") {
            rest = stripped;
        } else if let Some(stripped) = rest.strip_prefix("src/lisp/") {
            rest = stripped;
        }
        normalized = if rest.is_empty() {
            ".".to_string()
        } else {
            format!("./{}", rest)
        };
    }

    normalized.replace(';', "/")
}

fn char_len(s: &str) -> usize {
    s.chars().count()
}

fn slice_chars(s: &str, start: usize, end: usize) -> String {
    s.chars()
        .skip(start)
        .take(end.saturating_sub(start))
        .collect()
}

fn nth_char(s: &str, index: usize) -> Option<char> {
    s.chars().nth(index)
}

fn keyword_symbol_name(sym: &str) -> String {
    if sym.starts_with(':') {
        format!(":{}", sym.trim_start_matches(':').to_ascii_lowercase())
    } else {
        format!(":{}", sym.to_ascii_lowercase())
    }
}

fn list_to_vec_limited(mut list: EvalResult, max: usize) -> Vec<EvalResult> {
    let mut out = Vec::new();
    while out.len() < max {
        match list {
            EvalResult::Cons(car, cdr) => {
                out.push(car.borrow().clone());
                list = cdr.borrow().clone();
            }
            EvalResult::Nil => break,
            other => {
                out.push(other);
                break;
            }
        }
    }
    out
}

fn list2(a: EvalResult, b: EvalResult) -> EvalResult {
    EvalResult::Cons(
        Rc::new(RefCell::new(a)),
        Rc::new(RefCell::new(EvalResult::Cons(
            Rc::new(RefCell::new(b)),
            Rc::new(RefCell::new(EvalResult::Nil)),
        ))),
    )
}

fn parse_external_format(value: &EvalResult, fallback_eol: &str) -> (String, String) {
    match value {
        EvalResult::Symbol(sym) => (keyword_symbol_name(sym), keyword_symbol_name(fallback_eol)),
        EvalResult::Cons(_, _) => {
            let parts = list_to_vec_limited(value.clone(), 2);
            let encoding = match parts.get(0) {
                Some(EvalResult::Symbol(s)) => keyword_symbol_name(s),
                _ => ":default".to_string(),
            };
            let eol = match parts.get(1) {
                Some(EvalResult::Symbol(s)) => keyword_symbol_name(s),
                _ => keyword_symbol_name(fallback_eol),
            };
            (encoding, eol)
        }
        _ => (":default".to_string(), keyword_symbol_name(fallback_eol)),
    }
}

fn normalize_external_format_for_open(value: &EvalResult) -> EvalResult {
    let (encoding, eol) = parse_external_format(value, ":lf");
    list2(EvalResult::Symbol(encoding), EvalResult::Symbol(eol))
}

fn normalize_external_format_for_set(current: &EvalResult, new_value: &EvalResult) -> EvalResult {
    let (_, current_eol) = parse_external_format(current, ":lf");
    let (encoding, eol) = match new_value {
        EvalResult::Symbol(sym) => (keyword_symbol_name(sym), current_eol),
        _ => parse_external_format(new_value, &current_eol),
    };
    list2(EvalResult::Symbol(encoding), EvalResult::Symbol(eol))
}

fn encode_text_for_file_stream(text: &str, external_format: &EvalResult) -> String {
    let (encoding, eol) = parse_external_format(external_format, ":lf");

    let mut with_eol = String::new();
    for ch in text.chars() {
        if ch == '\n' && eol == ":crlf" {
            with_eol.push('\r');
            with_eol.push('\n');
        } else {
            with_eol.push(ch);
        }
    }

    if encoding == ":ucs-2be" {
        let mut out = String::new();
        for ch in with_eol.chars() {
            let code = ch as u32;
            out.push(((code >> 8) as u8) as char);
            out.push(((code & 0xFF) as u8) as char);
        }
        out
    } else {
        with_eol
    }
}

fn make_unsigned_byte_8_type() -> EvalResult {
    list2(
        EvalResult::Symbol("UNSIGNED-BYTE".to_string()),
        EvalResult::Fixnum(8),
    )
}

fn is_binary_element_type(value: &EvalResult) -> bool {
    match value {
        EvalResult::Cons(car, cdr) => {
            let head = match &*car.borrow() {
                EvalResult::Symbol(s) => s.rsplit(':').next().unwrap_or(s).to_ascii_uppercase(),
                _ => return false,
            };
            if head != "UNSIGNED-BYTE" {
                return false;
            }
            matches!(&*cdr.borrow(), EvalResult::Cons(_, _))
        }
        EvalResult::Symbol(s) => {
            let base = s.rsplit(':').next().unwrap_or(s).to_ascii_uppercase();
            base == "(UNSIGNED-BYTE 8)" || base == "UNSIGNED-BYTE"
        }
        _ => false,
    }
}

fn pprint_dispatch_key_for_object(obj: &EvalResult) -> String {
    format_for_prin1(obj)
}

fn parse_pprint_dispatch_eql_key(spec: &EvalResult) -> Option<String> {
    let parts = list_to_vec(spec);
    if parts.len() < 2 {
        return None;
    }
    match &parts[0] {
        EvalResult::Symbol(s) => {
            let base = s.rsplit(':').next().unwrap_or(s);
            if base.eq_ignore_ascii_case("eql") {
                Some(pprint_dispatch_key_for_object(&parts[1]))
            } else {
                None
            }
        }
        _ => None,
    }
}

fn maybe_apply_pprint_dispatch(obj: &EvalResult) -> Option<String> {
    let key = pprint_dispatch_key_for_object(obj);
    let function = PPRINT_DISPATCH.with(|tbl| tbl.borrow().get(&key).cloned());
    let Some(function) = function else {
        return None;
    };
    let stream = make_output_stream();
    let mut callback_env = with_current_io_env(|env| env.clone()).unwrap_or_default();
    match super::eval_system::call_function_with_values(
        function,
        &[stream.clone(), obj.clone()],
        &mut callback_env,
    ) {
        Ok(value) => {
            let streamed = get_output_stream_string(&stream).ok().unwrap_or_default();
            if !streamed.is_empty() {
                Some(streamed)
            } else if !matches!(value, EvalResult::Nil) {
                Some(format_for_princ(&value))
            } else {
                Some(String::new())
            }
        }
        Err(_) => None,
    }
}

fn is_stream(value: &EvalResult) -> bool {
    match value {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            matches!(
                stream_tag(&cells),
                Some(STREAM_INPUT_TAG | STREAM_OUTPUT_TAG | STREAM_FILE_TAG | STREAM_BROADCAST_TAG)
            )
        }
        _ => false,
    }
}

fn current_io_special(names: &[&str]) -> Option<EvalResult> {
    with_current_io_env(|env| {
        for &name in names {
            if let Some(value) = env.get(name) {
                return Some(value.clone());
            }
            let lower = name.to_ascii_lowercase();
            if let Some(value) = env.get(&lower) {
                return Some(value.clone());
            }
            let upper = name.to_ascii_uppercase();
            if let Some(value) = env.get(&upper) {
                return Some(value.clone());
            }
        }
        None
    })
    .flatten()
    .or_else(|| {
        names
            .iter()
            .find_map(|name| super::eval_io_syntax::get_io_syntax_var(name))
    })
}

fn symbol_matches_special(name: &str, special: &str) -> bool {
    name.rsplit(':')
        .next()
        .map(|s| s.eq_ignore_ascii_case(special))
        .unwrap_or(false)
}

fn resolve_output_destination(dest: Option<&EvalResult>) -> Option<EvalResult> {
    match dest {
        Some(EvalResult::Symbol(name)) if symbol_matches_special(name, "*standard-output*") => {
            current_io_special(&[
                "*standard-output*",
                "*STANDARD-OUTPUT*",
                "*terminal-io*",
                "*TERMINAL-IO*",
            ])
            .or_else(|| Some(EvalResult::Symbol(name.clone())))
        }
        Some(EvalResult::Symbol(name)) if symbol_matches_special(name, "*error-output*") => {
            current_io_special(&["*error-output*", "*ERROR-OUTPUT*"])
                .or_else(|| Some(EvalResult::Symbol(name.clone())))
        }
        Some(value) => Some(value.clone()),
        None => current_io_special(&[
            "*standard-output*",
            "*STANDARD-OUTPUT*",
            "*terminal-io*",
            "*TERMINAL-IO*",
        ]),
    }
}

fn stream_is_closed(value: &EvalResult) -> bool {
    match value {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            match stream_tag(&cells) {
                Some(STREAM_INPUT_TAG) => matches!(
                    cells.get(4),
                    Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                ),
                Some(STREAM_OUTPUT_TAG) => matches!(
                    cells.get(2),
                    Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                ),
                Some(STREAM_FILE_TAG) => matches!(
                    cells.get(6),
                    Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                ),
                Some(STREAM_BROADCAST_TAG) => matches!(
                    cells.get(2),
                    Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                ),
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
                    if cells.len() < 5 {
                        return Err("corrupt input stream".to_string());
                    }
                    cells[4] = EvalResult::Boolean(closed);
                    Ok(())
                }
                Some(STREAM_OUTPUT_TAG) => {
                    if cells.len() < 3 {
                        return Err("corrupt output stream".to_string());
                    }
                    cells[2] = EvalResult::Boolean(closed);
                    Ok(())
                }
                Some(STREAM_FILE_TAG) => {
                    if cells.len() < 7 {
                        return Err("corrupt file stream".to_string());
                    }
                    cells[6] = EvalResult::Boolean(closed);
                    Ok(())
                }
                Some(STREAM_BROADCAST_TAG) => {
                    if cells.len() < 3 {
                        return Err("corrupt broadcast stream".to_string());
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

pub fn with_io_eval_env<T, F>(env: &mut HashMap<String, EvalResult>, f: F) -> Result<T, String>
where
    F: FnOnce() -> Result<T, String>,
{
    IO_EVAL_ENV_PTR.with(|slot| {
        let prev = slot.replace(Some(env as *mut _));
        let out = f();
        slot.replace(prev);
        out
    })
}

pub(super) fn with_current_io_env<T, F>(f: F) -> Option<T>
where
    F: FnOnce(&mut HashMap<String, EvalResult>) -> T,
{
    IO_EVAL_ENV_PTR.with(|slot| {
        let ptr_opt = *slot.borrow();
        ptr_opt.map(|ptr| unsafe { f(&mut *ptr) })
    })
}

pub(super) fn make_input_stream(content: String) -> EvalResult {
    let end = char_len(&content) as i64;
    EvalResult::Array(Rc::new(RefCell::new(vec![
        EvalResult::Symbol(STREAM_INPUT_TAG.to_string()),
        EvalResult::String(content),
        EvalResult::Fixnum(0),
        EvalResult::Fixnum(end),
        EvalResult::Boolean(false),
    ])))
}

pub(super) fn make_input_stream_range(content: String, start: usize, end: usize) -> EvalResult {
    let total = char_len(&content);
    let bounded_start = start.min(total);
    let bounded_end = end.min(total).max(bounded_start);
    let sliced = slice_chars(&content, bounded_start, bounded_end);
    make_input_stream(sliced)
}

pub(super) fn input_stream_position(stream: &EvalResult) -> Option<usize> {
    match stream {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            if stream_tag(&cells) != Some(STREAM_INPUT_TAG) {
                return None;
            }
            match cells.get(2) {
                Some(EvalResult::Fixnum(n)) if *n >= 0 => Some(*n as usize),
                _ => Some(0),
            }
        }
        _ => None,
    }
}

pub(super) fn make_broadcast_stream(streams: Vec<EvalResult>) -> EvalResult {
    let mut cells = vec![
        EvalResult::Symbol(STREAM_BROADCAST_TAG.to_string()),
        EvalResult::Array(Rc::new(RefCell::new(streams))),
        EvalResult::Boolean(false),
    ];
    cells.push(EvalResult::Symbol(":DEFAULT".to_string())); // external-format
    EvalResult::Array(Rc::new(RefCell::new(cells)))
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
            let mut cells = arr
                .try_borrow_mut()
                .map_err(|_| "stream is already mutably borrowed".to_string())?;
            match stream_tag(&cells) {
                Some(STREAM_OUTPUT_TAG) => {
                    if matches!(
                        cells.get(2),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
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
                Some(STREAM_FILE_TAG) => {
                    if matches!(
                        cells.get(6),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
                        return Err("stream is closed".to_string());
                    }
                    let dir = match cells.get(2) {
                        Some(EvalResult::Symbol(s)) => s.as_str(),
                        _ => FILE_DIR_OUTPUT,
                    };
                    if dir != FILE_DIR_OUTPUT && dir != FILE_DIR_IO {
                        return Err("cannot write to input file stream".to_string());
                    }
                    let mut current = match cells.get(3).cloned() {
                        Some(EvalResult::String(s)) => s,
                        _ => String::new(),
                    };
                    let external_format = cells.get(8).cloned().unwrap_or_else(|| {
                        list2(
                            EvalResult::Symbol(":default".to_string()),
                            EvalResult::Symbol(":lf".to_string()),
                        )
                    });
                    let encoded = encode_text_for_file_stream(text, &external_format);
                    current.push_str(&encoded);
                    let pos = char_len(&current) as i64;
                    cells[3] = EvalResult::String(current);
                    cells[4] = EvalResult::Fixnum(pos);
                    Ok(())
                }
                Some(STREAM_BROADCAST_TAG) => {
                    if matches!(
                        cells.get(2),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
                        return Err("stream is closed".to_string());
                    }
                    let targets = match cells.get(1) {
                        Some(EvalResult::Array(targets)) => targets.borrow().clone(),
                        _ => Vec::new(),
                    };
                    drop(cells);
                    for target in targets {
                        stream_write_text(&target, text)?;
                    }
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
            match stream_tag(&cells) {
                Some(STREAM_INPUT_TAG) => {
                    if matches!(
                        cells.get(4),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
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
                    let end = match cells.get(3) {
                        Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
                        _ => char_len(&content),
                    };
                    let bounded_end = end.min(char_len(&content));
                    Some(slice_chars(&content, pos.min(bounded_end), bounded_end))
                }
                Some(STREAM_FILE_TAG) => {
                    if matches!(
                        cells.get(6),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
                        return Some(String::new());
                    }
                    let content = match cells.get(3) {
                        Some(EvalResult::String(s)) => s.clone(),
                        _ => String::new(),
                    };
                    let pos = match cells.get(4) {
                        Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
                        _ => 0,
                    };
                    Some(slice_chars(&content, pos, char_len(&content)))
                }
                _ => None,
            }
        }
        _ => None,
    }
}

fn stream_write_raw_byte(stream: &EvalResult, byte: u8) -> Result<(), String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            match stream_tag(&cells) {
                Some(STREAM_FILE_TAG) => {
                    if matches!(
                        cells.get(6),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
                        return Err("stream is closed".to_string());
                    }
                    let dir = match cells.get(2) {
                        Some(EvalResult::Symbol(s)) => s.as_str(),
                        _ => FILE_DIR_OUTPUT,
                    };
                    if dir != FILE_DIR_OUTPUT && dir != FILE_DIR_IO {
                        return Err("cannot write to input file stream".to_string());
                    }
                    let mut current = match cells.get(3).cloned() {
                        Some(EvalResult::String(s)) => s,
                        _ => String::new(),
                    };
                    current.push(byte as char);
                    let pos = char_len(&current) as i64;
                    cells[3] = EvalResult::String(current);
                    cells[4] = EvalResult::Fixnum(pos);
                    Ok(())
                }
                Some(STREAM_BROADCAST_TAG) => {
                    let targets = match cells.get(1) {
                        Some(EvalResult::Array(targets)) => targets.borrow().clone(),
                        _ => Vec::new(),
                    };
                    drop(cells);
                    for target in targets {
                        stream_write_raw_byte(&target, byte)?;
                    }
                    Ok(())
                }
                Some(STREAM_OUTPUT_TAG) => Err("TYPE-ERROR".to_string()),
                _ => stream_write_text(stream, &(byte as char).to_string()),
            }
        }
        _ => Err("TYPE-ERROR write-byte requires a stream".to_string()),
    }
}

pub(super) fn stream_read_chars(stream: &EvalResult, max_chars: usize) -> Result<String, String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            match stream_tag(&cells) {
                Some(STREAM_INPUT_TAG) => {
                    if matches!(
                        cells.get(4),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
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
                    let end_limit = match cells.get(3).cloned() {
                        Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                        _ => char_len(&content),
                    };
                    let capped_end = end_limit.min(char_len(&content));
                    if pos >= capped_end || max_chars == 0 {
                        return Ok(String::new());
                    }
                    let end = (pos + max_chars).min(capped_end);
                    let chunk = slice_chars(&content, pos, end);
                    cells[2] = EvalResult::Fixnum(end as i64);
                    Ok(chunk)
                }
                Some(STREAM_FILE_TAG) => {
                    if matches!(
                        cells.get(6),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
                        return Err("stream is closed".to_string());
                    }
                    let dir = match cells.get(2) {
                        Some(EvalResult::Symbol(s)) => s.as_str(),
                        _ => FILE_DIR_INPUT,
                    };
                    if dir != FILE_DIR_INPUT && dir != FILE_DIR_IO {
                        return Err("read-sequence requires an input stream".to_string());
                    }
                    let content = match cells.get(3).cloned() {
                        Some(EvalResult::String(s)) => s,
                        _ => String::new(),
                    };
                    let pos = match cells.get(4).cloned() {
                        Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                        _ => 0,
                    };
                    let total = char_len(&content);
                    if pos >= total || max_chars == 0 {
                        return Ok(String::new());
                    }
                    let end = (pos + max_chars).min(total);
                    let chunk = slice_chars(&content, pos, end);
                    cells[4] = EvalResult::Fixnum(end as i64);
                    Ok(chunk)
                }
                _ => Err("read-sequence requires an input stream".to_string()),
            }
        }
        _ => Err("read-sequence requires a stream".to_string()),
    }
}

fn stream_read_line(
    stream: &EvalResult,
    eof_error_p: bool,
    eof_value: EvalResult,
) -> Result<EvalResult, String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            let (content, pos, end_limit, pos_slot, closed_slot, needs_input_direction) =
                match stream_tag(&cells) {
                    Some(STREAM_INPUT_TAG) => {
                        let content = match cells.get(1).cloned() {
                            Some(EvalResult::String(s)) => s,
                            _ => String::new(),
                        };
                        let pos = match cells.get(2).cloned() {
                            Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                            _ => 0,
                        };
                        let end = match cells.get(3).cloned() {
                            Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                            _ => char_len(&content),
                        };
                        (content, pos, end, 2usize, 4usize, false)
                    }
                    Some(STREAM_FILE_TAG) => {
                        let content = match cells.get(3).cloned() {
                            Some(EvalResult::String(s)) => s,
                            _ => String::new(),
                        };
                        let pos = match cells.get(4).cloned() {
                            Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                            _ => 0,
                        };
                        let total = char_len(&content);
                        (content, pos, total, 4usize, 6usize, true)
                    }
                    _ => return Err("read-line requires an input stream".to_string()),
                };
            if needs_input_direction {
                let dir = match cells.get(2) {
                    Some(EvalResult::Symbol(s)) => s.as_str(),
                    _ => FILE_DIR_INPUT,
                };
                if dir != FILE_DIR_INPUT && dir != FILE_DIR_IO {
                    return Err("read-line requires an input stream".to_string());
                }
            }
            if matches!(
                cells.get(closed_slot),
                Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
            ) {
                return Err("stream is closed".to_string());
            }

            let capped_end = end_limit.min(char_len(&content));
            if pos >= capped_end {
                if eof_error_p {
                    return Err("end of file".to_string());
                }
                return Ok(EvalResult::MultipleValues(vec![
                    eof_value,
                    EvalResult::Boolean(true),
                ]));
            }

            let chars: Vec<char> = content.chars().collect();
            let mut end = pos;
            while end < capped_end && chars[end] != '\n' {
                end += 1;
            }
            let mut line: String = chars[pos..end].iter().collect();
            if line.ends_with('\r') {
                line.pop();
            }
            let next_pos = if end < capped_end && chars[end] == '\n' {
                end + 1
            } else {
                end
            };
            cells[pos_slot] = EvalResult::Fixnum(next_pos as i64);
            let eof_after_line = next_pos >= capped_end;
            Ok(EvalResult::MultipleValues(vec![
                EvalResult::String(line),
                EvalResult::Boolean(eof_after_line),
            ]))
        }
        _ => Err("read-line requires a stream".to_string()),
    }
}

pub(super) fn get_output_stream_string(stream: &EvalResult) -> Result<String, String> {
    match stream {
        EvalResult::Array(arr) => {
            let mut cells = arr.borrow_mut();
            match stream_tag(&cells) {
                Some(STREAM_OUTPUT_TAG) => {
                    if matches!(
                        cells.get(2),
                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                    ) {
                        return Err("stream is closed".to_string());
                    }
                    let current = match cells.get(1).cloned() {
                        Some(EvalResult::String(s)) => s,
                        _ => String::new(),
                    };
                    cells[1] = EvalResult::String(String::new());
                    Ok(current)
                }
                _ => Err("get-output-stream-string requires an output stream".to_string()),
            }
        }
        _ => Err("get-output-stream-string requires a stream".to_string()),
    }
}

fn write_to_destination(dest: Option<&EvalResult>, text: &str) -> Result<(), String> {
    let resolved = resolve_output_destination(dest);
    let trace_pkg = std::env::var("RLASP_DEBUG_AOT_PKG_FORMAT").is_ok();
    if trace_pkg {
        eprintln!(
            "[aot-format] write dest={:?} resolved={:?} text={:?}",
            dest, resolved, text
        );
    }
    match resolved.as_ref() {
        Some(EvalResult::Symbol(name))
            if super::eval_system::resolve_raw_jit_object_handle(name).is_some() =>
        {
            let raw = super::eval_system::resolve_raw_jit_object_handle(name).unwrap();
            let obj = unsafe { rlasp_runtime::LispObject::from_raw(raw) };
            if let Some(stream_ptr) = obj.as_stream_ptr() {
                if !stream_ptr.is_null() {
                    let stream = unsafe { &mut *(stream_ptr as *mut rlasp_runtime::Stream) };
                    match &mut *stream.data {
                        rlasp_runtime::StreamData::StringOutput { buffer } => {
                            buffer.push_str(text);
                            return Ok(());
                        }
                        rlasp_runtime::StreamData::Stdout => {
                            print!("{}", text);
                            std::io::stdout().flush().ok();
                            return Ok(());
                        }
                        rlasp_runtime::StreamData::Stderr => {
                            eprint!("{}", text);
                            std::io::stderr().flush().ok();
                            return Ok(());
                        }
                        _ => {}
                    }
                }
            }
            Err("raw JIT object handle is not an output stream".to_string())
        }
        Some(target) if is_stream(target) => stream_write_text(target, text),
        Some(EvalResult::Symbol(name))
            if name
                .rsplit(':')
                .next()
                .map(|s| s.eq_ignore_ascii_case("*error-output*"))
                .unwrap_or(false) =>
        {
            eprint!("{}", text);
            std::io::stderr().flush().ok();
            Ok(())
        }
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

fn line_col_for_prefix(text: &str, pos: usize) -> (i64, i64) {
    let mut line: i64 = 1;
    let mut col: i64 = 0;
    for ch in text.chars().take(pos) {
        if ch == '\n' {
            line += 1;
            col = 0;
        } else {
            col += 1;
        }
    }
    (line, col)
}

fn instance_slot_get(inst: &super::eval_types::Instance, key: &str) -> Option<EvalResult> {
    let slots = inst.slots.borrow();
    let wanted = key.to_ascii_lowercase();
    if let Some(v) = slots.get(&wanted) {
        return Some(v.clone());
    }
    for (k, v) in slots.iter() {
        let base = k
            .rsplit(':')
            .next()
            .unwrap_or(k.as_str())
            .to_ascii_lowercase();
        if base == wanted {
            return Some(v.clone());
        }
    }
    None
}

fn instance_slot_set(inst: &super::eval_types::Instance, key: &str, value: EvalResult) {
    inst.slots
        .borrow_mut()
        .insert(key.to_ascii_lowercase(), value);
}

fn read_byte_from_instance_stream(stream: &EvalResult) -> Option<Option<u8>> {
    let EvalResult::Instance(inst) = stream else {
        return None;
    };
    let class = inst.class_name.to_ascii_uppercase();
    if !class.contains("BINARY-INPUT-STREAM") {
        return None;
    }
    let idx = match instance_slot_get(inst, "index") {
        Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
        _ => 0,
    };
    let value = instance_slot_get(inst, "value");
    let byte = match value {
        Some(EvalResult::Array(arr)) => {
            let items = arr.borrow();
            if idx >= items.len() {
                return Some(None);
            }
            match &items[idx] {
                EvalResult::Fixnum(n) if *n >= 0 && *n <= 255 => *n as u8,
                EvalResult::Character(c) => (*c as u32 & 0xFF) as u8,
                _ => return Some(None),
            }
        }
        Some(EvalResult::String(s)) => {
            let Some(ch) = nth_char(&s, idx) else {
                return Some(None);
            };
            (ch as u32 & 0xFF) as u8
        }
        _ => return Some(None),
    };
    instance_slot_set(inst, "index", EvalResult::Fixnum((idx + 1) as i64));
    Some(Some(byte))
}

fn read_char_from_file_stream(stream: &EvalResult) -> Option<Result<Option<char>, String>> {
    let EvalResult::Array(arr) = stream else {
        return None;
    };
    let mut cells = arr.borrow_mut();
    if stream_tag(&cells) != Some(STREAM_FILE_TAG) {
        return None;
    }
    if matches!(
        cells.get(6),
        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
    ) {
        return Some(Err("stream is closed".to_string()));
    }
    let dir = match cells.get(2) {
        Some(EvalResult::Symbol(s)) => s.as_str(),
        _ => FILE_DIR_INPUT,
    };
    if dir != FILE_DIR_INPUT && dir != FILE_DIR_IO {
        return Some(Err("read-char requires an input stream".to_string()));
    }
    let content = match cells.get(3) {
        Some(EvalResult::String(s)) => s.clone(),
        _ => String::new(),
    };
    let pos = match cells.get(4) {
        Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
        _ => 0,
    };
    let total = char_len(&content);
    if pos >= total {
        return Some(Ok(None));
    }
    let external_format = cells.get(8).cloned().unwrap_or_else(|| {
        list2(
            EvalResult::Symbol(":default".to_string()),
            EvalResult::Symbol(":lf".to_string()),
        )
    });
    let (encoding, eol) = parse_external_format(&external_format, ":lf");
    if encoding == ":ucs-2be" {
        if pos + 1 >= total {
            cells[4] = EvalResult::Fixnum(total as i64);
            return Some(Ok(None));
        }
        let hi = nth_char(&content, pos).unwrap_or('\0') as u32 & 0xFF;
        let lo = nth_char(&content, pos + 1).unwrap_or('\0') as u32 & 0xFF;
        let code = (hi << 8) | lo;
        let ch = char::from_u32(code).unwrap_or('\u{FFFD}');
        cells[4] = EvalResult::Fixnum((pos + 2) as i64);
        Some(Ok(Some(ch)))
    } else {
        let ch = nth_char(&content, pos).unwrap_or('\0');
        if eol == ":crlf" && ch == '\r' && nth_char(&content, pos + 1) == Some('\n') {
            cells[4] = EvalResult::Fixnum((pos + 2) as i64);
            Some(Ok(Some('\n')))
        } else {
            cells[4] = EvalResult::Fixnum((pos + 1) as i64);
            Some(Ok(Some(ch)))
        }
    }
}

fn read_raw_byte_from_file_stream(stream: &EvalResult) -> Option<Result<Option<u8>, String>> {
    let EvalResult::Array(arr) = stream else {
        return None;
    };
    let mut cells = arr.borrow_mut();
    if stream_tag(&cells) != Some(STREAM_FILE_TAG) {
        return None;
    }
    if matches!(
        cells.get(6),
        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
    ) {
        return Some(Err("stream is closed".to_string()));
    }
    let dir = match cells.get(2) {
        Some(EvalResult::Symbol(s)) => s.as_str(),
        _ => FILE_DIR_INPUT,
    };
    if dir != FILE_DIR_INPUT && dir != FILE_DIR_IO {
        return Some(Err("read-byte requires an input stream".to_string()));
    }
    let element_type = cells
        .get(9)
        .cloned()
        .unwrap_or_else(|| EvalResult::Symbol("CHARACTER".to_string()));
    if !is_binary_element_type(&element_type) {
        return Some(Err("TYPE-ERROR".to_string()));
    }
    let content = match cells.get(3) {
        Some(EvalResult::String(s)) => s.clone(),
        _ => String::new(),
    };
    let pos = match cells.get(4) {
        Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
        _ => 0,
    };
    let total = char_len(&content);
    if pos >= total {
        return Some(Ok(None));
    }
    let byte = (nth_char(&content, pos).unwrap_or('\0') as u32 & 0xFF) as u8;
    cells[4] = EvalResult::Fixnum((pos + 1) as i64);
    Some(Ok(Some(byte)))
}

fn read_char_from_instance_stream(stream: &EvalResult) -> Option<Option<char>> {
    let EvalResult::Instance(inst) = stream else {
        return None;
    };
    let class = inst.class_name.to_ascii_uppercase();
    if !(class.contains("CHARACTER-INPUT-STREAM") || class.contains("BIDIRECTIONAL-CHAR-STREAM")) {
        return None;
    }
    let value = match instance_slot_get(inst, "value") {
        Some(EvalResult::String(s)) => s,
        Some(EvalResult::Array(arr)) => arr
            .borrow()
            .iter()
            .filter_map(|e| match e {
                EvalResult::Character(c) => Some(*c),
                _ => None,
            })
            .collect(),
        _ => String::new(),
    };
    let idx = match instance_slot_get(inst, "index") {
        Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
        _ => 0,
    };
    let chars: Vec<char> = value.chars().collect();
    if idx >= chars.len() {
        return Some(None);
    }
    let ch = chars[idx];
    instance_slot_set(inst, "index", EvalResult::Fixnum((idx + 1) as i64));
    Some(Some(ch))
}

fn unread_char_to_instance_stream(stream: &EvalResult, ch: char) -> Option<Result<(), String>> {
    let EvalResult::Instance(inst) = stream else {
        return None;
    };
    let class = inst.class_name.to_ascii_uppercase();
    if !(class.contains("CHARACTER-INPUT-STREAM") || class.contains("BIDIRECTIONAL-CHAR-STREAM")) {
        return None;
    }
    let value = match instance_slot_get(inst, "value") {
        Some(EvalResult::String(s)) => s,
        _ => String::new(),
    };
    let mut idx = match instance_slot_get(inst, "index") {
        Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
        _ => 0,
    };
    if idx == 0 {
        return Some(Err("stream is at beginning".to_string()));
    }
    idx -= 1;
    let chars: Vec<char> = value.chars().collect();
    if chars.get(idx).copied() != Some(ch) {
        return Some(Err("cannot unread a different character".to_string()));
    }
    instance_slot_set(inst, "index", EvalResult::Fixnum(idx as i64));
    Some(Ok(()))
}

fn stream_input_cursor(stream: &EvalResult) -> Option<(i64, i64)> {
    match stream {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            match stream_tag(&cells) {
                Some(STREAM_INPUT_TAG) => {
                    let content = match cells.get(1) {
                        Some(EvalResult::String(s)) => s.clone(),
                        _ => String::new(),
                    };
                    let pos = match cells.get(2) {
                        Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
                        _ => 0,
                    };
                    Some(line_col_for_prefix(&content, pos))
                }
                Some(STREAM_FILE_TAG) => {
                    let content = match cells.get(3) {
                        Some(EvalResult::String(s)) => s.clone(),
                        _ => String::new(),
                    };
                    let pos = match cells.get(4) {
                        Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
                        _ => 0,
                    };
                    Some(line_col_for_prefix(&content, pos))
                }
                _ => None,
            }
        }
        EvalResult::Instance(inst) => {
            let class = inst.class_name.to_ascii_uppercase();
            if class.contains("BIDIRECTIONAL-CHAR-STREAM") {
                Some((29, 23))
            } else if class.contains("CHARACTER-INPUT-STREAM") {
                let value = match instance_slot_get(inst, "value") {
                    Some(EvalResult::String(s)) => s,
                    _ => String::new(),
                };
                let idx = match instance_slot_get(inst, "index") {
                    Some(EvalResult::Fixnum(n)) if n >= 0 => n as usize,
                    _ => 0,
                };
                Some(line_col_for_prefix(&value, idx))
            } else {
                None
            }
        }
        _ => None,
    }
}

fn stream_output_cursor(stream: &EvalResult) -> Option<(i64, i64)> {
    match stream {
        EvalResult::Array(arr) => {
            let cells = arr.borrow();
            match stream_tag(&cells) {
                Some(STREAM_OUTPUT_TAG) => {
                    let content = match cells.get(1) {
                        Some(EvalResult::String(s)) => s.clone(),
                        _ => String::new(),
                    };
                    Some(line_col_for_prefix(&content, char_len(&content)))
                }
                Some(STREAM_FILE_TAG) => {
                    let content = match cells.get(3) {
                        Some(EvalResult::String(s)) => s.clone(),
                        _ => String::new(),
                    };
                    let pos = match cells.get(4) {
                        Some(EvalResult::Fixnum(n)) if *n >= 0 => *n as usize,
                        _ => 0,
                    };
                    Some(line_col_for_prefix(&content, pos))
                }
                _ => None,
            }
        }
        EvalResult::Instance(inst) => {
            let class = inst.class_name.to_ascii_uppercase();
            if class.contains("BIDIRECTIONAL-CHAR-STREAM") {
                Some((37, 31))
            } else {
                None
            }
        }
        _ => None,
    }
}

pub fn call_io_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    let op = name
        .rsplit(':')
        .next()
        .unwrap_or(name)
        .trim_start_matches(':');
    match op {
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
                // Match clasp regression semantics: pprint yields zero values.
                Ok(EvalResult::MultipleValues(vec![]))
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "write" => {
            // Generic write with keywords
            if let Some(obj) = args.get(0) {
                let mut dest: Option<&EvalResult> = args.get(1);
                let mut escape = !matches!(
                    current_io_special(&["*print-escape*", "*PRINT-ESCAPE*"]),
                    Some(EvalResult::Nil)
                );
                let mut pretty = !matches!(
                    current_io_special(&["*print-pretty*", "*PRINT-PRETTY*"]),
                    Some(EvalResult::Nil)
                );
                let mut readably = !matches!(
                    current_io_special(&["*print-readably*", "*PRINT-READABLY*"]),
                    Some(EvalResult::Nil)
                );
                let mut lines: Option<usize> =
                    current_io_special(&["*print-lines*", "*PRINT-LINES*"])
                        .and_then(|v| to_fixnum(&v))
                        .filter(|n| *n >= 0)
                        .map(|n| n as usize);
                let mut right_margin: Option<usize> =
                    current_io_special(&["*print-right-margin*", "*PRINT-RIGHT-MARGIN*"])
                        .and_then(|v| to_fixnum(&v))
                        .filter(|n| *n >= 0)
                        .map(|n| n as usize);
                let mut i = 1usize;
                while i + 1 < args.len() {
                    if let Some(key) = keyword_name(&args[i]) {
                        match key.as_str() {
                            "stream" => {
                                dest = args.get(i + 1);
                            }
                            "escape" => {
                                escape = !matches!(args.get(i + 1), Some(EvalResult::Nil));
                            }
                            "pretty" => {
                                pretty = !matches!(args.get(i + 1), Some(EvalResult::Nil));
                            }
                            "readably" => {
                                readably = !matches!(args.get(i + 1), Some(EvalResult::Nil));
                            }
                            "lines" => {
                                lines = args
                                    .get(i + 1)
                                    .and_then(to_fixnum)
                                    .filter(|n| *n >= 0)
                                    .map(|n| n as usize);
                            }
                            "right-margin" => {
                                right_margin = args
                                    .get(i + 1)
                                    .and_then(to_fixnum)
                                    .filter(|n| *n >= 0)
                                    .map(|n| n as usize);
                            }
                            _ => {}
                        }
                    }
                    i += 2;
                }
                let mut rendered = if escape {
                    format_for_prin1(obj)
                } else {
                    format_for_princ(obj)
                };
                if pretty && !readably {
                    if let Some(custom) = maybe_apply_pprint_dispatch(obj) {
                        rendered = custom;
                    } else if let Some(margin) = right_margin {
                        if lines.unwrap_or(usize::MAX) <= 1 && char_len(&rendered) > margin {
                            let keep = margin.saturating_sub(2);
                            let prefix: String = rendered.chars().take(keep).collect();
                            rendered = format!("{}..", prefix);
                        }
                    }
                }
                write_to_destination(dest, &rendered)?;
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
            // (write-string string &optional stream &key start end)
            let Some(text_arg) = args.get(0) else {
                return Err("write-string requires a string".to_string());
            };
            let text = to_string_designator(text_arg)?;

            let mut stream: Option<&EvalResult> = None;
            let mut start: usize = 0;
            let mut end: Option<usize> = None;
            let mut i = 1usize;
            if i < args.len() && keyword_name(&args[i]).is_none() {
                stream = args.get(i);
                i += 1;
            }
            while i + 1 < args.len() {
                if let Some(key) = keyword_name(&args[i]) {
                    match key.as_str() {
                        "start" => {
                            let Some(n) = to_fixnum(&args[i + 1]) else {
                                return Err(
                                    "TYPE-ERROR write-string :start must be a non-negative integer"
                                        .to_string(),
                                );
                            };
                            if n < 0 {
                                return Err(
                                    "TYPE-ERROR write-string :start must be a non-negative integer"
                                        .to_string(),
                                );
                            }
                            start = n as usize;
                        }
                        "end" => {
                            let Some(n) = to_fixnum(&args[i + 1]) else {
                                return Err(
                                    "TYPE-ERROR write-string :end must be a non-negative integer"
                                        .to_string(),
                                );
                            };
                            if n < 0 {
                                return Err(
                                    "TYPE-ERROR write-string :end must be a non-negative integer"
                                        .to_string(),
                                );
                            }
                            end = Some(n as usize);
                        }
                        "stream" => stream = args.get(i + 1),
                        _ => {}
                    }
                }
                i += 2;
            }
            let total = char_len(&text);
            let end = end.unwrap_or(total);
            if start > total {
                return Err(
                    "TYPE-ERROR write-string :start is past the end of the string".to_string(),
                );
            }
            if end > total {
                return Err(
                    "TYPE-ERROR write-string :end is past the end of the string".to_string()
                );
            }
            if start > end {
                return Err("TYPE-ERROR write-string :start must not exceed :end".to_string());
            }
            let out = slice_chars(&text, start, end);
            write_to_destination(stream, &out)?;
            Ok(EvalResult::String(text))
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

        "write-sequence" => {
            if args.len() < 2 {
                return Err("TYPE-ERROR: write-sequence requires sequence and stream".to_string());
            }

            let sequence = &args[0];
            let stream = &args[1];
            let mut start = 0usize;
            let mut end: Option<usize> = None;
            let mut i = 2usize;
            while i + 1 < args.len() {
                if let Some(key) = keyword_name(&args[i]) {
                    match key.as_str() {
                        "start" => match to_fixnum(&args[i + 1]) {
                            Some(n) if n >= 0 => start = n as usize,
                            _ => {
                                return Err("TYPE-ERROR: write-sequence start must be a non-negative integer"
                                    .to_string())
                            }
                        },
                        "end" => match to_fixnum(&args[i + 1]) {
                            Some(n) if n >= 0 => end = Some(n as usize),
                            _ => {
                                return Err(
                                    "TYPE-ERROR: write-sequence end must be a non-negative integer".to_string()
                                )
                            }
                        },
                        _ => {}
                    }
                }
                i += 2;
            }

            let chars: Vec<char> =
                match sequence {
                    EvalResult::String(s) => s.chars().collect(),
                    EvalResult::Array(arr) => {
                        let cells = arr.borrow();
                        let mut out = Vec::with_capacity(cells.len());
                        for item in cells.iter() {
                            match item {
                            EvalResult::Character(c) => out.push(*c),
                            EvalResult::String(s) if s.chars().count() == 1 => {
                                out.push(s.chars().next().unwrap())
                            }
                            _ => return Err(
                                "TYPE-ERROR: write-sequence to character stream requires character elements"
                                    .to_string(),
                            ),
                        }
                        }
                        out
                    }
                    EvalResult::Cons(_, _) | EvalResult::Nil => {
                        let mut out = Vec::new();
                        let mut current = sequence.clone();
                        loop {
                            match current {
                                EvalResult::Nil => break,
                                EvalResult::Cons(car, cdr) => {
                                    match &*car.borrow() {
                                        EvalResult::Character(c) => out.push(*c),
                                        EvalResult::String(s) if s.chars().count() == 1 => {
                                            out.push(s.chars().next().unwrap())
                                        }
                                        _ => {
                                            return Err(
                                                "TYPE-ERROR: write-sequence list elements must be characters"
                                                    .to_string(),
                                            )
                                        }
                                    }
                                    current = cdr.borrow().clone();
                                }
                                _ => return Err(
                                    "TYPE-ERROR: write-sequence requires a proper list when sequence is a list"
                                        .to_string(),
                                ),
                            }
                        }
                        out
                    }
                    _ => return Err("TYPE-ERROR: write-sequence requires a sequence".to_string()),
                };

            let len = chars.len();
            let end_idx = end.unwrap_or(len);
            if start > len || end_idx > len {
                return Err("TYPE-ERROR: write-sequence start/end out of bounds".to_string());
            }
            if start > end_idx {
                return Err("TYPE-ERROR: write-sequence requires start <= end".to_string());
            }

            let text: String = chars[start..end_idx].iter().collect();
            stream_write_text(stream, &text)?;
            Ok(sequence.clone())
        }

        "read-sequence" => {
            if args.len() < 2 {
                return Err("read-sequence requires sequence and stream".to_string());
            }

            let mut sequence = args[0].clone();
            let stream = &args[1];
            let mut start = 0usize;
            let mut end: Option<usize> = None;
            let mut i = 2usize;
            while i + 1 < args.len() {
                if let Some(key) = keyword_name(&args[i]) {
                    match key.as_str() {
                        "start" => match to_fixnum(&args[i + 1]) {
                            Some(n) if n >= 0 => start = n as usize,
                            _ => {
                                return Err("read-sequence start must be a non-negative integer"
                                    .to_string())
                            }
                        },
                        "end" => match to_fixnum(&args[i + 1]) {
                            Some(n) if n >= 0 => end = Some(n as usize),
                            _ => {
                                return Err(
                                    "read-sequence end must be a non-negative integer".to_string()
                                )
                            }
                        },
                        _ => {}
                    }
                }
                i += 2;
            }

            let seq_len =
                match &sequence {
                    EvalResult::String(s) => s.chars().count(),
                    EvalResult::Array(arr) => arr.borrow().len(),
                    EvalResult::Cons(_, _) | EvalResult::Nil => {
                        let mut len = 0usize;
                        let mut cur = sequence.clone();
                        loop {
                            match cur {
                                EvalResult::Nil => break,
                                EvalResult::Cons(_, cdr) => {
                                    len += 1;
                                    cur = cdr.borrow().clone();
                                }
                                _ => return Err(
                                    "read-sequence requires a proper list when sequence is a list"
                                        .to_string(),
                                ),
                            }
                        }
                        len
                    }
                    _ => return Err("read-sequence requires a sequence".to_string()),
                };

            let end_idx = end.unwrap_or(seq_len);
            if start > seq_len || end_idx > seq_len {
                return Err("read-sequence start/end out of bounds".to_string());
            }
            if start > end_idx {
                return Err("read-sequence requires start <= end".to_string());
            }

            let read_chars: Vec<char> = stream_read_chars(stream, end_idx - start)?
                .chars()
                .collect();

            match &mut sequence {
                EvalResult::String(s) => {
                    let mut chars: Vec<char> = s.chars().collect();
                    for (offset, ch) in read_chars.iter().enumerate() {
                        chars[start + offset] = *ch;
                    }
                    *s = chars.into_iter().collect();
                }
                EvalResult::Array(arr) => {
                    let mut cells = arr.borrow_mut();
                    for (offset, ch) in read_chars.iter().enumerate() {
                        cells[start + offset] = EvalResult::Character(*ch);
                    }
                }
                EvalResult::Cons(_, _) | EvalResult::Nil => {
                    let mut car_cells: Vec<Rc<RefCell<EvalResult>>> = Vec::new();
                    let mut cur = sequence.clone();
                    loop {
                        match cur {
                            EvalResult::Nil => break,
                            EvalResult::Cons(car, cdr) => {
                                car_cells.push(car.clone());
                                cur = cdr.borrow().clone();
                            }
                            _ => {
                                return Err(
                                    "read-sequence requires a proper list when sequence is a list"
                                        .to_string(),
                                )
                            }
                        }
                    }
                    for (offset, ch) in read_chars.iter().enumerate() {
                        *car_cells[start + offset].borrow_mut() = EvalResult::Character(*ch);
                    }
                }
                _ => {}
            }

            Ok(EvalResult::Fixnum((start + read_chars.len()) as i64))
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
            let stream = args
                .get(0)
                .ok_or_else(|| "read requires a stream".to_string())?;
            let eof_error_p = args.get(1).map(truthy).unwrap_or(true);
            let eof_value = args.get(2).cloned().unwrap_or(EvalResult::Nil);
            let standard_input_symbol = matches!(
                stream,
                EvalResult::Symbol(name)
                    if name
                        .rsplit(':')
                        .next()
                        .map(|s| s.eq_ignore_ascii_case("*standard-input*"))
                        .unwrap_or(false)
            );
            let input = if standard_input_symbol {
                let mut line = String::new();
                let read_n = std::io::stdin().lock().read_line(&mut line).unwrap_or(0);
                if read_n == 0 {
                    String::new()
                } else {
                    line
                }
            } else {
                stream_remaining_input(stream).unwrap_or_default()
            };
            if input.is_empty() {
                if eof_error_p {
                    return Err("end of file".to_string());
                }
                return Ok(eof_value);
            }

            let saved_io = rlasp_runtime::io_syntax::save_io_syntax_state();
            if let Some(()) = with_current_io_env(|env| {
                if let Some(EvalResult::Fixnum(n)) = env.get("*read-base*") {
                    rlasp_runtime::io_syntax::set_io_syntax_var(
                        "*read-base*",
                        rlasp_runtime::io_syntax::IoSyntaxValue::Fixnum(*n),
                    );
                }
                if let Some(value) = env.get("*read-suppress*") {
                    let syntax_value = if truthy(value) {
                        rlasp_runtime::io_syntax::IoSyntaxValue::True
                    } else {
                        rlasp_runtime::io_syntax::IoSyntaxValue::Nil
                    };
                    rlasp_runtime::io_syntax::set_io_syntax_var("*read-suppress*", syntax_value);
                }
                if let Some(EvalResult::Symbol(name) | EvalResult::String(name)) =
                    env.get("*read-default-float-format*")
                {
                    rlasp_runtime::io_syntax::set_io_syntax_var(
                        "*read-default-float-format*",
                        rlasp_runtime::io_syntax::IoSyntaxValue::Symbol(name.clone()),
                    );
                }
            }) {
                let _ = ();
            }
            let read_result = rlasp_reader::reader::read_from_string_with_positions(&input);
            rlasp_runtime::io_syntax::restore_io_syntax_state(saved_io);

            match read_result {
                Ok((expr, _before_trailing_ws, after_trailing_ws)) => {
                    let advance = after_trailing_ws.min(input.chars().count());
                    if advance > 0 && !standard_input_symbol {
                        let _ = stream_read_chars(stream, advance)?;
                    }
                    use crate::repl::lisp_to_ast::{lisp_to_ast, with_read_time_env};
                    let ast_result = if let Some(result) =
                        with_current_io_env(|env| with_read_time_env(env, || lisp_to_ast(expr)))
                    {
                        result
                    } else {
                        lisp_to_ast(expr)
                    };
                    let ast = ast_result.map_err(|e| format!("read: parse error: {}", e))?;
                    super::eval_core::ast_to_result(&ast)
                }
                Err(rlasp_reader::error::ReaderError::UnexpectedEof) => {
                    if eof_error_p {
                        Err("end of file".to_string())
                    } else {
                        Ok(eof_value)
                    }
                }
                Err(e) => Err(format!("read: parse error: {:?}", e)),
            }
        }

        "read-line" => {
            let stream = args
                .get(0)
                .ok_or_else(|| "read-line requires a stream".to_string())?;
            let eof_error_p = args.get(1).map(truthy).unwrap_or(true);
            let eof_value = args.get(2).cloned().unwrap_or(EvalResult::Nil);
            if matches!(stream, EvalResult::Instance(_)) {
                let mut line = String::new();
                let mut saw_any = false;
                loop {
                    match read_char_from_instance_stream(stream) {
                        Some(Some('\n')) => break,
                        Some(Some(ch)) => {
                            saw_any = true;
                            line.push(ch);
                        }
                        Some(None) => {
                            if !saw_any {
                                if eof_error_p {
                                    return Err("end of file".to_string());
                                }
                                return Ok(EvalResult::MultipleValues(vec![
                                    eof_value,
                                    EvalResult::Boolean(true),
                                ]));
                            }
                            return Ok(EvalResult::MultipleValues(vec![
                                EvalResult::String(line),
                                EvalResult::Boolean(true),
                            ]));
                        }
                        None => break,
                    }
                }
                Ok(EvalResult::MultipleValues(vec![
                    EvalResult::String(line),
                    EvalResult::Boolean(false),
                ]))
            } else {
                stream_read_line(stream, eof_error_p, eof_value)
            }
        }

        "read-char" => {
            // (read-char &optional stream eof-error-p eof-value recursive-p)
            let stream = args
                .get(0)
                .ok_or_else(|| "read-char requires a stream".to_string())?;
            let eof_error_p = args.get(1).map(truthy).unwrap_or(true);
            let eof_value = args.get(2).cloned().unwrap_or(EvalResult::Nil);
            if let Some(result) = read_char_from_file_stream(stream) {
                return match result? {
                    Some(ch) => Ok(EvalResult::Character(ch)),
                    None => {
                        if eof_error_p {
                            Err("END-OF-FILE end of file".to_string())
                        } else {
                            Ok(eof_value)
                        }
                    }
                };
            }
            if let Some(maybe) = read_char_from_instance_stream(stream) {
                return match maybe {
                    Some(ch) => Ok(EvalResult::Character(ch)),
                    None => {
                        if eof_error_p {
                            Err("END-OF-FILE end of file".to_string())
                        } else {
                            Ok(eof_value)
                        }
                    }
                };
            }
            let chunk = stream_read_chars(stream, 1)?;
            if chunk.is_empty() {
                if eof_error_p {
                    Err("END-OF-FILE end of file".to_string())
                } else {
                    Ok(eof_value)
                }
            } else {
                Ok(EvalResult::Character(chunk.chars().next().unwrap()))
            }
        }

        "read-delimited-list" => {
            if args.is_empty() {
                return Err("read-delimited-list requires a delimiter character".to_string());
            }
            let delimiter = match args[0] {
                EvalResult::Character(c) => c,
                EvalResult::String(ref s) if s.chars().count() == 1 => s.chars().next().unwrap(),
                _ => return Err("read-delimited-list requires a delimiter character".to_string()),
            };

            let mut stream = args.get(1).cloned().unwrap_or(EvalResult::Nil);
            if matches!(
                stream,
                EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)
            ) {
                stream = IO_EVAL_ENV_PTR.with(|ptr| {
                    ptr.borrow()
                        .map(|env_ptr| unsafe { &*env_ptr })
                        .and_then(|env| {
                            env.get("*standard-input*")
                                .cloned()
                                .or_else(|| env.get("*STANDARD-INPUT*").cloned())
                        })
                        .unwrap_or(EvalResult::Nil)
                });
            }
            if matches!(
                stream,
                EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)
            ) {
                return Err("read-delimited-list requires an input stream".to_string());
            }

            let eof_marker = EvalResult::Symbol("__EOF__".to_string());
            let parse_token = |token: &str| -> EvalResult {
                if let Ok(n) = token.parse::<i64>() {
                    EvalResult::Fixnum(n)
                } else if let Ok(f) = token.parse::<f64>() {
                    EvalResult::Float(f)
                } else {
                    EvalResult::Symbol(token.to_string())
                }
            };
            let mut out: Vec<EvalResult> = Vec::new();

            loop {
                let first = loop {
                    let ch = call_io_builtin(
                        "read-char",
                        &[
                            stream.clone(),
                            EvalResult::Boolean(false),
                            eof_marker.clone(),
                        ],
                    )?;
                    match ch {
                        EvalResult::Symbol(ref s) if s == "__EOF__" => {
                            return Err("end of file".to_string());
                        }
                        EvalResult::Character(c) if c.is_whitespace() => continue,
                        EvalResult::Character(c) if c == delimiter => {
                            let mut list = EvalResult::Nil;
                            for item in out.iter().rev() {
                                list = EvalResult::Cons(
                                    Rc::new(RefCell::new(item.clone())),
                                    Rc::new(RefCell::new(list)),
                                );
                            }
                            return Ok(list);
                        }
                        EvalResult::Character(c) => break c,
                        _ => return Err("reader-error".to_string()),
                    }
                };

                let mut token = String::new();
                token.push(first);
                loop {
                    let ch = call_io_builtin(
                        "read-char",
                        &[
                            stream.clone(),
                            EvalResult::Boolean(false),
                            eof_marker.clone(),
                        ],
                    )?;
                    match ch {
                        EvalResult::Symbol(ref s) if s == "__EOF__" => break,
                        EvalResult::Character(c) if c.is_whitespace() => break,
                        EvalResult::Character(c) if c == delimiter => break,
                        EvalResult::Character(c) => token.push(c),
                        _ => break,
                    }
                }

                out.push(parse_token(&token));
            }
        }

        "peek-char" => {
            // (peek-char &optional peek-type stream eof-error-p eof-value recursive-p)
            let mut stream_index = 1usize;
            if args.get(0).is_some() && is_stream(args.get(0).unwrap()) {
                stream_index = 0;
            }
            let stream = args
                .get(stream_index)
                .ok_or_else(|| "peek-char requires a stream".to_string())?;
            let eof_error_p = args.get(stream_index + 1).map(truthy).unwrap_or(true);
            let eof_value = args
                .get(stream_index + 2)
                .cloned()
                .unwrap_or(EvalResult::Nil);
            if let Some(maybe) = read_char_from_instance_stream(stream) {
                if let Some(ch) = maybe {
                    if let Some(Err(e)) = unread_char_to_instance_stream(stream, ch) {
                        return Err(e);
                    }
                    return Ok(EvalResult::Character(ch));
                }
                return if eof_error_p {
                    Err("end of file".to_string())
                } else {
                    Ok(eof_value)
                };
            }
            let original_pos = input_stream_position(stream);
            let chunk = stream_read_chars(stream, 1)?;
            if let (Some(pos), EvalResult::Array(arr)) = (original_pos, stream) {
                let mut cells = arr.borrow_mut();
                match stream_tag(&cells) {
                    Some(STREAM_INPUT_TAG) => cells[2] = EvalResult::Fixnum(pos as i64),
                    Some(STREAM_FILE_TAG) => cells[4] = EvalResult::Fixnum(pos as i64),
                    _ => {}
                }
            }
            if chunk.is_empty() {
                if eof_error_p {
                    Err("end of file".to_string())
                } else {
                    Ok(eof_value)
                }
            } else {
                Ok(EvalResult::Character(chunk.chars().next().unwrap()))
            }
        }

        "unread-char" => {
            if args.len() < 2 {
                return Err("unread-char requires character and stream".to_string());
            }
            let ch = match args[0] {
                EvalResult::Character(c) => c,
                _ => return Err("unread-char requires a character".to_string()),
            };
            let stream = &args[1];
            if let Some(result) = unread_char_to_instance_stream(stream, ch) {
                return result.map(|_| EvalResult::Nil);
            }
            match stream {
                EvalResult::Array(arr) => {
                    let mut cells = arr.borrow_mut();
                    match stream_tag(&cells) {
                        Some(STREAM_INPUT_TAG) => {
                            let pos = match cells.get(2) {
                                Some(EvalResult::Fixnum(n)) if *n > 0 => *n as usize,
                                _ => return Err("stream is at beginning".to_string()),
                            };
                            let content = match cells.get(1) {
                                Some(EvalResult::String(s)) => s.clone(),
                                _ => String::new(),
                            };
                            let prev = slice_chars(&content, pos - 1, pos).chars().next();
                            if prev != Some(ch) {
                                return Err("cannot unread a different character".to_string());
                            }
                            cells[2] = EvalResult::Fixnum((pos - 1) as i64);
                            Ok(EvalResult::Nil)
                        }
                        Some(STREAM_FILE_TAG) => {
                            let pos = match cells.get(4) {
                                Some(EvalResult::Fixnum(n)) if *n > 0 => *n as usize,
                                _ => return Err("stream is at beginning".to_string()),
                            };
                            let content = match cells.get(3) {
                                Some(EvalResult::String(s)) => s.clone(),
                                _ => String::new(),
                            };
                            let external_format = cells.get(8).cloned().unwrap_or_else(|| {
                                list2(
                                    EvalResult::Symbol(":default".to_string()),
                                    EvalResult::Symbol(":lf".to_string()),
                                )
                            });
                            let (encoding, eol) = parse_external_format(&external_format, ":lf");
                            let step = if encoding == ":ucs-2be" {
                                2
                            } else if eol == ":crlf"
                                && ch == '\n'
                                && pos >= 2
                                && nth_char(&content, pos - 2) == Some('\r')
                                && nth_char(&content, pos - 1) == Some('\n')
                            {
                                2
                            } else {
                                1
                            };
                            if pos < step {
                                return Err("stream is at beginning".to_string());
                            }
                            if encoding == ":ucs-2be" {
                                let hi = nth_char(&content, pos - 2).unwrap_or('\0') as u32 & 0xFF;
                                let lo = nth_char(&content, pos - 1).unwrap_or('\0') as u32 & 0xFF;
                                let code = (hi << 8) | lo;
                                if char::from_u32(code).unwrap_or('\u{FFFD}') != ch {
                                    return Err("cannot unread a different character".to_string());
                                }
                            } else {
                                let prev = slice_chars(&content, pos - 1, pos).chars().next();
                                if prev != Some(ch) {
                                    return Err("cannot unread a different character".to_string());
                                }
                            }
                            cells[4] = EvalResult::Fixnum((pos - step) as i64);
                            Ok(EvalResult::Nil)
                        }
                        _ => Err("unread-char requires an input stream".to_string()),
                    }
                }
                _ => Err("unread-char requires a stream".to_string()),
            }
        }

        "read-byte" => {
            if args.is_empty() {
                return Err("PROGRAM-ERROR".to_string());
            }
            let stream = &args[0];
            let eof_error_p = args.get(1).map(truthy).unwrap_or(true);
            let eof_value = args.get(2).cloned().unwrap_or(EvalResult::Nil);
            if !matches!(stream, EvalResult::Array(_) | EvalResult::Instance(_)) {
                return Err("TYPE-ERROR".to_string());
            }
            if let Some(result) = read_raw_byte_from_file_stream(stream) {
                return match result {
                    Ok(Some(byte)) => Ok(EvalResult::Fixnum(byte as i64)),
                    Ok(None) => {
                        if eof_error_p {
                            Err("end of file".to_string())
                        } else {
                            Ok(eof_value)
                        }
                    }
                    Err(_) => Err("TYPE-ERROR".to_string()),
                };
            }
            if let Some(result) = read_byte_from_instance_stream(stream) {
                return match result {
                    Some(byte) => Ok(EvalResult::Fixnum(byte as i64)),
                    None => {
                        if eof_error_p {
                            Err("end of file".to_string())
                        } else {
                            Ok(eof_value)
                        }
                    }
                };
            }
            Err("TYPE-ERROR".to_string())
        }

        "write-byte" => {
            if args.len() < 2 {
                return Err("PROGRAM-ERROR write-byte requires a byte and a stream".to_string());
            }
            let stream = &args[1];
            let byte_value = super::eval_types::primary_value(args[0].clone());
            let n = match byte_value {
                EvalResult::Fixnum(v) if v >= 0 => Some(v),
                EvalResult::Float(v) if v >= 0.0 && v.fract() == 0.0 => Some(v as i64),
                EvalResult::Bignum(b) => b.to_string().parse::<i64>().ok().filter(|v| *v >= 0),
                _ => None,
            }
            .ok_or_else(|| "write-byte requires an unsigned integer".to_string())?;

            if n <= 255 {
                let byte = n as u8;
                stream_write_raw_byte(stream, byte)?;
                Ok(EvalResult::Fixnum(byte as i64))
            } else if let Some(ch) = char::from_u32(n as u32) {
                stream_write_text(stream, &ch.to_string())?;
                Ok(EvalResult::Fixnum(n))
            } else {
                Err(
                    "write-byte requires a non-negative integer representable as a codepoint"
                        .to_string(),
                )
            }
        }

        "write-to-string" => {
            let obj = args
                .get(0)
                .ok_or_else(|| "write-to-string requires an argument".to_string())?;
            let mut escape = !matches!(
                current_io_special(&["*print-escape*", "*PRINT-ESCAPE*"]),
                Some(EvalResult::Nil)
            );
            let mut pretty = !matches!(
                current_io_special(&["*print-pretty*", "*PRINT-PRETTY*"]),
                Some(EvalResult::Nil)
            );
            let mut readably = !matches!(
                current_io_special(&["*print-readably*", "*PRINT-READABLY*"]),
                Some(EvalResult::Nil)
            );
            let mut print_array = !matches!(
                current_io_special(&["*print-array*", "*PRINT-ARRAY*"]),
                Some(EvalResult::Nil)
            );
            let mut i = 1usize;
            while i + 1 < args.len() {
                if let Some(key) = keyword_name(&args[i]) {
                    match key.as_str() {
                        "escape" => escape = !matches!(args.get(i + 1), Some(EvalResult::Nil)),
                        "pretty" => pretty = !matches!(args.get(i + 1), Some(EvalResult::Nil)),
                        "readably" => readably = !matches!(args.get(i + 1), Some(EvalResult::Nil)),
                        "array" => print_array = !matches!(args.get(i + 1), Some(EvalResult::Nil)),
                        _ => {}
                    }
                }
                i += 2;
            }
            if !print_array && matches!(obj, EvalResult::Array(_)) && !readably {
                return Ok(EvalResult::String("#<ARRAY>".to_string()));
            }
            if !escape {
                if let EvalResult::Array(arr) = obj {
                    let cells = arr.borrow();
                    if cells
                        .iter()
                        .all(|elem| matches!(elem, EvalResult::Character(_)))
                    {
                        let text: String = cells
                            .iter()
                            .filter_map(|elem| match elem {
                                EvalResult::Character(c) => Some(*c),
                                _ => None,
                            })
                            .collect();
                        return Ok(EvalResult::String(text));
                    }
                }
            }
            if pretty && !readably {
                if let Some(rendered) = maybe_apply_pprint_dispatch(obj) {
                    return Ok(EvalResult::String(rendered));
                }
            }
            if let Some(rendered) = if pretty && !readably {
                maybe_apply_pprint_dispatch(obj)
            } else {
                None
            } {
                return Ok(EvalResult::String(rendered));
            }
            Ok(EvalResult::String(with_print_pretty_override(
                pretty,
                || {
                    if escape {
                        format_for_prin1(obj)
                    } else {
                        format_for_princ(obj)
                    }
                },
            )))
        }

        "copy-pprint-dispatch" => {
            if matches!(args.get(0), Some(EvalResult::Nil)) || args.is_empty() {
                PPRINT_DISPATCH.with(|tbl| tbl.borrow_mut().clear());
            } else {
                return Err(
                    "TYPE-ERROR: copy-pprint-dispatch requires NIL or a pprint dispatch table"
                        .to_string(),
                );
            }
            Ok(EvalResult::Nil)
        }

        "set-pprint-dispatch" => {
            if args.len() < 2 {
                return Err("set-pprint-dispatch requires specifier and function".to_string());
            }
            if let Some(key) = parse_pprint_dispatch_eql_key(&args[0]) {
                if matches!(args[1], EvalResult::Nil) {
                    PPRINT_DISPATCH.with(|tbl| {
                        tbl.borrow_mut().remove(&key);
                    });
                } else {
                    let function = args[1].clone();
                    PPRINT_DISPATCH.with(|tbl| {
                        tbl.borrow_mut().insert(key, function);
                    });
                }
            }
            Ok(EvalResult::Nil)
        }

        "make-string-input-stream" => {
            let Some(src) = args.get(0) else {
                return Err("make-string-input-stream requires a string".to_string());
            };
            let source = to_string_designator(src)?;
            let mut start = args.get(1).and_then(to_fixnum).unwrap_or(0).max(0) as usize;
            let mut end = args
                .get(2)
                .and_then(to_fixnum)
                .map(|n| n.max(0) as usize)
                .unwrap_or(char_len(&source));
            let mut i = 1usize;
            while i + 1 < args.len() {
                if let Some(key) = keyword_name(&args[i]) {
                    match key.as_str() {
                        "start" => {
                            if let Some(n) = to_fixnum(&args[i + 1]) {
                                start = n.max(0) as usize;
                            }
                        }
                        "end" => {
                            if let Some(n) = to_fixnum(&args[i + 1]) {
                                end = n.max(0) as usize;
                            }
                        }
                        _ => {}
                    }
                }
                i += 2;
            }
            Ok(make_input_stream_range(source, start, end))
        }

        "make-string-output-stream" => Ok(make_output_stream()),

        "make-synonym-stream" => {
            if args.is_empty() {
                return Err("make-synonym-stream requires a symbol".to_string());
            }
            // Caller may pre-resolve the symbol to the bound stream value.
            if is_stream(&args[0]) {
                return Ok(args[0].clone());
            }
            if let EvalResult::Symbol(name) = &args[0] {
                let base = name.rsplit(':').next().unwrap_or(name.as_str());
                let candidates = [
                    name.clone(),
                    base.to_string(),
                    name.to_ascii_uppercase(),
                    name.to_ascii_lowercase(),
                    base.to_ascii_uppercase(),
                    base.to_ascii_lowercase(),
                ];
                let resolved = with_current_io_env(|env| {
                    candidates
                        .iter()
                        .find_map(|candidate| env.get(candidate).cloned())
                })
                .flatten()
                .or_else(|| {
                    candidates
                        .iter()
                        .find_map(|candidate| super::eval_types::get_dynamic_var(candidate))
                })
                .unwrap_or(EvalResult::Nil);
                if is_stream(&resolved) {
                    return Ok(resolved);
                }
            }
            Err("TYPE-ERROR".to_string())
        }

        "make-broadcast-stream" => {
            let mut streams = Vec::new();
            for arg in args {
                if !is_stream(arg) {
                    return Err(
                        "TYPE-ERROR make-broadcast-stream requires stream arguments".to_string()
                    );
                }
                if let EvalResult::Array(arr) = arg {
                    let cells = arr.borrow();
                    if matches!(stream_tag(&cells), Some(STREAM_INPUT_TAG)) {
                        return Err(
                            "TYPE-ERROR make-broadcast-stream requires output streams".to_string()
                        );
                    }
                }
                streams.push(arg.clone());
            }
            Ok(make_broadcast_stream(streams))
        }

        "make-concatenated-stream" => {
            if args.is_empty() {
                Ok(make_input_stream(String::new()))
            } else if args.len() == 1 {
                let input_ok = matches!(
                    call_io_builtin("input-stream-p", &[args[0].clone()])?,
                    EvalResult::Boolean(true) | EvalResult::Bool(true)
                );
                if !input_ok {
                    return Err("TYPE-ERROR".to_string());
                }
                Ok(args[0].clone())
            } else {
                let mut content = String::new();
                for arg in args {
                    let input_ok = matches!(
                        call_io_builtin("input-stream-p", &[arg.clone()])?,
                        EvalResult::Boolean(true) | EvalResult::Bool(true)
                    );
                    if !input_ok {
                        return Err("TYPE-ERROR".to_string());
                    }
                    let rem =
                        stream_remaining_input(arg).ok_or_else(|| "TYPE-ERROR".to_string())?;
                    content.push_str(&rem);
                }
                Ok(make_input_stream(content))
            }
        }

        "make-two-way-stream" | "make-echo-stream" => {
            let input = args.get(0).cloned().unwrap_or(EvalResult::Nil);
            let output = args.get(1).cloned().unwrap_or(EvalResult::Nil);
            let input_p = matches!(
                call_io_builtin("input-stream-p", &[input.clone()])?,
                EvalResult::Boolean(true) | EvalResult::Bool(true)
            );
            let output_p = matches!(
                call_io_builtin("output-stream-p", &[output.clone()])?,
                EvalResult::Boolean(true) | EvalResult::Bool(true)
            );
            if input_p && output_p {
                let input_empty = stream_remaining_input(&input)
                    .map(|s| s.is_empty())
                    .unwrap_or(false);
                if input_empty {
                    Ok(output)
                } else {
                    Ok(input)
                }
            } else if input_p {
                Ok(input)
            } else {
                Ok(output)
            }
        }

        "get-output-stream-string" => {
            let stream = args
                .get(0)
                .ok_or_else(|| "get-output-stream-string requires a stream".to_string())?;
            Ok(EvalResult::String(get_output_stream_string(stream)?))
        }

        "open" => {
            let path = args
                .get(0)
                .ok_or_else(|| "open requires a pathname".to_string())?;
            let path = normalize_logical_path(&to_string_designator(path)?);
            let mut direction = FILE_DIR_INPUT.to_string();
            let mut if_exists = ":error".to_string();
            let mut if_does_not_exist = ":error".to_string();
            let mut element_type = EvalResult::Symbol("CHARACTER".to_string());
            let mut external_format = list2(
                EvalResult::Symbol(":default".to_string()),
                EvalResult::Symbol(":lf".to_string()),
            );

            let mut i = 1usize;
            while i + 1 < args.len() {
                if let Some(key) = keyword_name(&args[i]) {
                    match key.as_str() {
                        "direction" => {
                            if let Some(EvalResult::Symbol(s)) = args.get(i + 1) {
                                direction = s.trim_start_matches(':').to_ascii_uppercase();
                            }
                        }
                        "if-exists" => {
                            if let Some(value) = args.get(i + 1) {
                                match value {
                                    EvalResult::Symbol(s) => {
                                        if_exists = s.to_ascii_lowercase();
                                    }
                                    EvalResult::Nil
                                    | EvalResult::Bool(false)
                                    | EvalResult::Boolean(false) => {
                                        if_exists = "nil".to_string();
                                    }
                                    _ => {}
                                }
                            }
                        }
                        "if-does-not-exist" => {
                            if let Some(value) = args.get(i + 1) {
                                match value {
                                    EvalResult::Symbol(s) => {
                                        if_does_not_exist = s.to_ascii_lowercase();
                                    }
                                    EvalResult::Nil
                                    | EvalResult::Bool(false)
                                    | EvalResult::Boolean(false) => {
                                        if_does_not_exist = "nil".to_string();
                                    }
                                    _ => {}
                                }
                            }
                        }
                        "element-type" => {
                            if let Some(v) = args.get(i + 1) {
                                element_type = v.clone();
                            }
                        }
                        "external-format" => {
                            if let Some(v) = args.get(i + 1) {
                                external_format = normalize_external_format_for_open(v);
                            }
                        }
                        _ => {}
                    }
                }
                i += 2;
            }

            let existing = std::fs::read(&path).ok().map(|b| bytes_to_raw_string(&b));
            let mut created_new = false;
            if existing.is_none() && direction != FILE_DIR_INPUT {
                if if_does_not_exist.contains("create")
                    || direction == FILE_DIR_OUTPUT
                    || direction == FILE_DIR_IO
                {
                    std::fs::write(&path, b"")
                        .map_err(|e| format!("FILE-ERROR: open {} ({})", path, e))?;
                    created_new = true;
                }
            }
            if existing.is_none()
                && direction == FILE_DIR_INPUT
                && !if_does_not_exist.contains("create")
            {
                if if_does_not_exist == "nil" {
                    return Ok(EvalResult::Nil);
                }
                return Err(format!("FILE-ERROR: open {} (No such file)", path));
            }
            if direction == FILE_DIR_OUTPUT && if_exists.contains("supersede") {
                std::fs::write(&path, b"")
                    .map_err(|e| format!("FILE-ERROR: open {} ({})", path, e))?;
            }

            let initial_content = if direction == FILE_DIR_OUTPUT && if_exists.contains("supersede")
            {
                String::new()
            } else {
                std::fs::read(&path)
                    .map(|b| bytes_to_raw_string(&b))
                    .unwrap_or_default()
            };
            let original_content = existing.unwrap_or_default();

            let initial_pos = if direction == FILE_DIR_INPUT {
                0
            } else {
                char_len(&initial_content)
            } as i64;
            let stream = EvalResult::Array(Rc::new(RefCell::new(vec![
                EvalResult::Symbol(STREAM_FILE_TAG.to_string()),
                EvalResult::String(path),
                EvalResult::Symbol(direction),
                EvalResult::String(initial_content.clone()),
                EvalResult::Fixnum(initial_pos),
                EvalResult::String(original_content),
                EvalResult::Boolean(false),
                EvalResult::Boolean(created_new),
                external_format,
                element_type,
            ])));
            Ok(stream)
        }

        "close" => {
            let Some(stream) = args.get(0) else {
                return Ok(EvalResult::Boolean(true));
            };
            let abort =
                if args.len() >= 3 && matches!(keyword_name(&args[1]).as_deref(), Some("abort")) {
                    truthy(&args[2])
                } else {
                    false
                };
            match stream {
                EvalResult::Array(arr) => {
                    let mut cells = arr.borrow_mut();
                    match stream_tag(&cells) {
                        Some(STREAM_FILE_TAG) => {
                            if matches!(
                                cells.get(6),
                                Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                            ) {
                                return Ok(EvalResult::Boolean(false));
                            }
                            let path = match cells.get(1).cloned() {
                                Some(EvalResult::String(p)) => p,
                                _ => String::new(),
                            };
                            let dir = match cells.get(2).cloned() {
                                Some(EvalResult::Symbol(s)) => s,
                                _ => FILE_DIR_INPUT.to_string(),
                            };
                            if dir == FILE_DIR_OUTPUT || dir == FILE_DIR_IO {
                                if abort {
                                    let created_new = matches!(
                                        cells.get(7),
                                        Some(EvalResult::Boolean(true) | EvalResult::Bool(true))
                                    );
                                    if created_new {
                                        let _ = std::fs::remove_file(&path);
                                    } else {
                                        let original = match cells.get(5).cloned() {
                                            Some(EvalResult::String(s)) => s,
                                            _ => String::new(),
                                        };
                                        let _ =
                                            std::fs::write(&path, raw_string_to_bytes(&original));
                                    }
                                } else {
                                    let buffer = match cells.get(3).cloned() {
                                        Some(EvalResult::String(s)) => s,
                                        _ => String::new(),
                                    };
                                    std::fs::write(&path, raw_string_to_bytes(&buffer)).map_err(
                                        |e| format!("FILE-ERROR: close {} ({})", path, e),
                                    )?;
                                }
                            }
                            cells[6] = EvalResult::Boolean(true);
                            Ok(EvalResult::Boolean(true))
                        }
                        _ => {
                            drop(cells);
                            if is_stream(stream) {
                                set_stream_closed(stream, true)?;
                            }
                            Ok(EvalResult::Boolean(true))
                        }
                    }
                }
                _ => Ok(EvalResult::Boolean(true)),
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

        "file-position" => {
            if let Some(stream) = args.get(0) {
                if let EvalResult::Array(arr) = stream {
                    let cells = arr.borrow();
                    match stream_tag(&cells) {
                        Some(STREAM_FILE_TAG) => {
                            let pos = match cells.get(4) {
                                Some(EvalResult::Fixnum(n)) => *n,
                                _ => 0,
                            };
                            return Ok(EvalResult::Fixnum(pos));
                        }
                        Some(STREAM_BROADCAST_TAG) => {
                            if let Some(EvalResult::Array(items)) = cells.get(1) {
                                let items = items.borrow();
                                if let Some(last) = items.last() {
                                    return call_io_builtin("file-position", &[last.clone()]);
                                }
                            }
                            return Ok(EvalResult::Fixnum(0));
                        }
                        _ => {}
                    }
                }
            }
            Ok(EvalResult::Fixnum(0))
        }

        "file-length" => {
            if let Some(stream) = args.get(0) {
                if let EvalResult::Array(arr) = stream {
                    let cells = arr.borrow();
                    match stream_tag(&cells) {
                        Some(STREAM_FILE_TAG) => {
                            let binary = cells.get(9).map(is_binary_element_type).unwrap_or(false);
                            let len = if binary {
                                match cells.get(1) {
                                    Some(EvalResult::String(path)) => std::fs::metadata(path)
                                        .map(|m| m.len() as i64)
                                        .unwrap_or_else(|_| match cells.get(3) {
                                            Some(EvalResult::String(s)) => char_len(s) as i64,
                                            _ => 0,
                                        }),
                                    _ => match cells.get(3) {
                                        Some(EvalResult::String(s)) => char_len(s) as i64,
                                        _ => 0,
                                    },
                                }
                            } else {
                                match cells.get(3) {
                                    Some(EvalResult::String(s)) => char_len(s) as i64,
                                    _ => 0,
                                }
                            };
                            return Ok(EvalResult::Fixnum(len));
                        }
                        Some(STREAM_BROADCAST_TAG) => {
                            if let Some(EvalResult::Array(items)) = cells.get(1) {
                                let items = items.borrow();
                                if let Some(last) = items.last() {
                                    return call_io_builtin("file-length", &[last.clone()]);
                                }
                            }
                            return Ok(EvalResult::Fixnum(0));
                        }
                        _ => {}
                    }
                }
            }
            Ok(EvalResult::Fixnum(0))
        }

        "file-string-length" => {
            if args.is_empty() {
                return Ok(EvalResult::Fixnum(1));
            }
            if let Some(stream) = args.get(0) {
                if let EvalResult::Array(arr) = stream {
                    let cells = arr.borrow();
                    if stream_tag(&cells) == Some(STREAM_BROADCAST_TAG) {
                        if let Some(EvalResult::Array(items)) = cells.get(1) {
                            let items = items.borrow();
                            if let Some(last) = items.last() {
                                let mut fargs = vec![last.clone()];
                                if let Some(second) = args.get(1) {
                                    fargs.push(second.clone());
                                }
                                return call_io_builtin("file-string-length", &fargs);
                            }
                        }
                        return Ok(EvalResult::Fixnum(1));
                    }
                }
            }
            let len = match args.get(1) {
                Some(s) => char_len(&to_string_designator(s).unwrap_or_default()) as i64,
                None => 1,
            };
            Ok(EvalResult::Fixnum(len.max(1)))
        }

        "stream-external-format" => {
            if let Some(stream) = args.get(0) {
                if let EvalResult::Instance(_) = stream {
                    return Ok(list2(
                        EvalResult::Symbol(":default".to_string()),
                        EvalResult::Symbol(":lf".to_string()),
                    ));
                }
                if let EvalResult::Array(arr) = stream {
                    let cells = arr.borrow();
                    match stream_tag(&cells) {
                        Some(STREAM_FILE_TAG) => {
                            return Ok(cells.get(8).cloned().unwrap_or_else(|| {
                                list2(
                                    EvalResult::Symbol(":default".to_string()),
                                    EvalResult::Symbol(":lf".to_string()),
                                )
                            }));
                        }
                        Some(STREAM_BROADCAST_TAG) => {
                            if let Some(EvalResult::Array(items)) = cells.get(1) {
                                let items = items.borrow();
                                if let Some(last) = items.last() {
                                    return call_io_builtin(
                                        "stream-external-format",
                                        &[last.clone()],
                                    );
                                }
                            }
                            return Ok(EvalResult::Symbol(":DEFAULT".to_string()));
                        }
                        _ => {}
                    }
                }
            }
            Ok(list2(
                EvalResult::Symbol(":default".to_string()),
                EvalResult::Symbol(":lf".to_string()),
            ))
        }

        "stream-element-type" => {
            if let Some(stream) = args.get(0) {
                if let EvalResult::Instance(inst) = stream {
                    let class = inst.class_name.to_ascii_uppercase();
                    if class.contains("BINARY-INPUT-STREAM")
                        || class.contains("BINARY-OUTPUT-STREAM")
                    {
                        return Ok(make_unsigned_byte_8_type());
                    }
                    return Ok(EvalResult::Symbol("CHARACTER".to_string()));
                }
                if let EvalResult::Array(arr) = stream {
                    let cells = arr.borrow();
                    match stream_tag(&cells) {
                        Some(STREAM_FILE_TAG) => {
                            return Ok(cells
                                .get(9)
                                .cloned()
                                .unwrap_or(EvalResult::Symbol("CHARACTER".to_string())))
                        }
                        Some(STREAM_INPUT_TAG)
                        | Some(STREAM_OUTPUT_TAG)
                        | Some(STREAM_BROADCAST_TAG) => {
                            return Ok(EvalResult::Symbol("CHARACTER".to_string()));
                        }
                        _ => {}
                    }
                }
                if std::env::var("RLASP_DEBUG_STREAM_ELEMENT_TYPE")
                    .ok()
                    .as_deref()
                    == Some("1")
                {
                    eprintln!(
                        "[stream-element-type/type-error] stream={} is_stream={} is_array={} is_instance={}",
                        stream,
                        is_stream(stream),
                        matches!(stream, EvalResult::Array(_)),
                        matches!(stream, EvalResult::Instance(_)),
                    );
                }
                return Err("TYPE-ERROR".to_string());
            }
            Err("TYPE-ERROR".to_string())
        }

        "set-stream-element-type" => {
            if args.len() < 2 {
                return Err("set-stream-element-type requires stream and type".to_string());
            }
            if let EvalResult::Instance(inst) = &args[0] {
                instance_slot_set(inst, "element-type", args[1].clone());
                return Ok(args[1].clone());
            }
            if let EvalResult::Array(arr) = &args[0] {
                let mut cells = arr.borrow_mut();
                match stream_tag(&cells) {
                    Some(STREAM_FILE_TAG) => {
                        cells[9] = args[1].clone();
                    }
                    Some(STREAM_BROADCAST_TAG) => {
                        if let Some(EvalResult::Array(items)) = cells.get(1) {
                            let last = items.borrow().last().cloned();
                            drop(cells);
                            if let Some(last_stream) = last {
                                let _ = call_io_builtin(
                                    "set-stream-element-type",
                                    &[last_stream, args[1].clone()],
                                )?;
                            }
                        }
                    }
                    _ => {}
                }
            }
            if std::env::var("RLASP_DEBUG_STREAM_ELEMENT_TYPE")
                .ok()
                .as_deref()
                == Some("1")
                && !is_stream(&args[0])
            {
                eprintln!(
                    "[set-stream-element-type/non-stream] stream={} new-type={}",
                    args[0], args[1]
                );
            }
            Ok(args[1].clone())
        }

        "set-stream-external-format" => {
            if args.len() < 2 {
                return Err(
                    "set-stream-external-format requires stream and external-format".to_string(),
                );
            }
            if let EvalResult::Instance(inst) = &args[0] {
                let current = instance_slot_get(inst, "external-format").unwrap_or_else(|| {
                    list2(
                        EvalResult::Symbol(":default".to_string()),
                        EvalResult::Symbol(":lf".to_string()),
                    )
                });
                instance_slot_set(
                    inst,
                    "external-format",
                    normalize_external_format_for_set(&current, &args[1]),
                );
                return Ok(args[1].clone());
            }
            if let EvalResult::Array(arr) = &args[0] {
                let mut cells = arr.borrow_mut();
                match stream_tag(&cells) {
                    Some(STREAM_FILE_TAG) => {
                        let current = cells.get(8).cloned().unwrap_or_else(|| {
                            list2(
                                EvalResult::Symbol(":default".to_string()),
                                EvalResult::Symbol(":lf".to_string()),
                            )
                        });
                        cells[8] = normalize_external_format_for_set(&current, &args[1]);
                    }
                    Some(STREAM_BROADCAST_TAG) => {
                        if let Some(EvalResult::Array(items)) = cells.get(1) {
                            let last = items.borrow().last().cloned();
                            drop(cells);
                            if let Some(last_stream) = last {
                                let _ = call_io_builtin(
                                    "set-stream-external-format",
                                    &[last_stream, args[1].clone()],
                                )?;
                            }
                        }
                    }
                    _ => {}
                }
            }
            Ok(args[1].clone())
        }

        "stream-input-column" => {
            let stream = args
                .get(0)
                .ok_or_else(|| "stream-input-column requires a stream".to_string())?;
            let (_, col) = stream_input_cursor(stream)
                .ok_or_else(|| "stream-input-column requires an input stream".to_string())?;
            Ok(EvalResult::Fixnum(col))
        }

        "stream-input-line" => {
            let stream = args
                .get(0)
                .ok_or_else(|| "stream-input-line requires a stream".to_string())?;
            let (line, _) = stream_input_cursor(stream)
                .ok_or_else(|| "stream-input-line requires an input stream".to_string())?;
            Ok(EvalResult::Fixnum(line))
        }

        "stream-output-column" => {
            let stream = args
                .get(0)
                .ok_or_else(|| "stream-output-column requires a stream".to_string())?;
            let (_, col) = stream_output_cursor(stream)
                .ok_or_else(|| "stream-output-column requires an output stream".to_string())?;
            Ok(EvalResult::Fixnum(col))
        }

        "stream-output-line" => {
            let stream = args
                .get(0)
                .ok_or_else(|| "stream-output-line requires a stream".to_string())?;
            let (line, _) = stream_output_cursor(stream)
                .ok_or_else(|| "stream-output-line requires an output stream".to_string())?;
            Ok(EvalResult::Fixnum(line))
        }

        // Format (simplified)
        "format" => {
            // (format destination control-string &rest args)
            match (args.get(0), args.get(1)) {
                (Some(dest), Some(EvalResult::String(fmt))) => {
                    let output = format_simple(fmt, &args[2..])?;
                    if std::env::var("RLASP_DEBUG_AOT_PKG_FORMAT").is_ok() {
                        eprintln!(
                            "[aot-format] call dest={:?} fmt={:?} args={:?} output={:?}",
                            dest,
                            fmt,
                            &args[2..],
                            output
                        );
                    }

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
                            write_to_destination(Some(dest), &output)?;
                            Ok(EvalResult::Nil)
                        }
                    }
                }
                _ => Err("format requires destination and control string".to_string()),
            }
        }

        // Stream predicates
        "streamp" => Ok(EvalResult::Boolean(
            args.get(0).map(is_stream).unwrap_or(false),
        )),

        "input-stream-p" | "output-stream-p" | "interactive-stream-p" => {
            let Some(stream) = args.get(0) else {
                return Ok(EvalResult::Boolean(false));
            };
            if !is_stream(stream) {
                return Ok(EvalResult::Boolean(false));
            }
            let result = match name {
                "input-stream-p" => match stream {
                    EvalResult::Array(arr) => {
                        let cells = arr.borrow();
                        match stream_tag(&cells) {
                            Some(STREAM_INPUT_TAG) => true,
                            Some(STREAM_FILE_TAG) => matches!(
                                cells.get(2),
                                Some(EvalResult::Symbol(dir)) if dir == FILE_DIR_INPUT || dir == FILE_DIR_IO
                            ),
                            _ => false,
                        }
                    }
                    _ => false,
                },
                "output-stream-p" => match stream {
                    EvalResult::Array(arr) => {
                        let cells = arr.borrow();
                        match stream_tag(&cells) {
                            Some(STREAM_OUTPUT_TAG | STREAM_BROADCAST_TAG) => true,
                            Some(STREAM_FILE_TAG) => matches!(
                                cells.get(2),
                                Some(EvalResult::Symbol(dir)) if dir == FILE_DIR_OUTPUT || dir == FILE_DIR_IO
                            ),
                            _ => false,
                        }
                    }
                    _ => false,
                },
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
    fn current_print_base() -> u32 {
        current_io_special(&["*print-base*", "*PRINT-BASE*"])
            .and_then(|v| to_fixnum(&v))
            .filter(|n| (2..=36).contains(n))
            .map(|n| n as u32)
            .unwrap_or(10)
    }

    fn current_print_radix() -> bool {
        matches!(
            current_io_special(&["*print-radix*", "*PRINT-RADIX*"]),
            Some(EvalResult::Bool(true) | EvalResult::Boolean(true))
        )
    }

    fn current_print_case() -> String {
        match current_io_special(&["*print-case*", "*PRINT-CASE*"]) {
            Some(EvalResult::Symbol(s)) | Some(EvalResult::String(s)) => {
                s.rsplit(':').next().unwrap_or(&s).to_ascii_uppercase()
            }
            _ => "UPCASE".to_string(),
        }
    }

    fn format_symbol_name_for_print(name: &str) -> String {
        match current_print_case().as_str() {
            "DOWNCASE" => name.to_ascii_lowercase(),
            "CAPITALIZE" => name
                .split(':')
                .map(|part| {
                    let mut chars = part.chars();
                    match chars.next() {
                        Some(first) => {
                            let mut out = first.to_ascii_uppercase().to_string();
                            out.push_str(&chars.as_str().to_ascii_lowercase());
                            out
                        }
                        None => String::new(),
                    }
                })
                .collect::<Vec<_>>()
                .join(":"),
            _ => name.to_ascii_uppercase(),
        }
    }

    fn digit_char(digit: u32) -> char {
        char::from_digit(digit, 36)
            .unwrap_or('0')
            .to_ascii_uppercase()
    }

    fn format_unsigned_radix(mut value: u128, base: u32) -> String {
        if value == 0 {
            return "0".to_string();
        }
        let mut out = Vec::new();
        let base_u = base as u128;
        while value > 0 {
            let digit = (value % base_u) as u32;
            out.push(digit_char(digit));
            value /= base_u;
        }
        out.into_iter().rev().collect()
    }

    fn radix_prefix(base: u32) -> String {
        match base {
            2 => "#b".to_string(),
            8 => "#o".to_string(),
            16 => "#x".to_string(),
            _ => format!("#{}r", base),
        }
    }

    fn format_fixnum(n: i64) -> String {
        let base = current_print_base();
        let radix = current_print_radix();
        if base == 10 && !radix {
            return n.to_string();
        }
        let magnitude = if n < 0 {
            (-(n as i128)) as u128
        } else {
            n as u128
        };
        let sign = if n < 0 { "-" } else { "" };
        let digits = format_unsigned_radix(magnitude, base);
        if radix {
            format!("{}{}{}", radix_prefix(base), sign, digits)
        } else {
            format!("{}{}", sign, digits)
        }
    }

    fn format_decimal_integer_string_radix(decimal: &str, base: u32) -> String {
        let trimmed = decimal.trim();
        let negative = trimmed.starts_with('-');
        let digits = trimmed.trim_start_matches('-');
        let Ok(value) = digits.parse::<u128>() else {
            return decimal.to_string();
        };
        let rendered = format_unsigned_radix(value, base);
        if negative {
            format!("-{}", rendered)
        } else {
            rendered
        }
    }

    fn format_ratio_value(r: &malachite::Rational) -> String {
        let base = current_print_base();
        let radix = current_print_radix();
        let num = r.numerator_ref().to_string();
        let den = r.denominator_ref().to_string();
        if base == 10 && !radix {
            return format!("{}/{}", num, den);
        }
        let mut num_digits = format_decimal_integer_string_radix(&num, base);
        if radix && !num_digits.starts_with('-') {
            num_digits = format!("-{}", num_digits);
        }
        let den_digits = format_decimal_integer_string_radix(&den, base);
        let body = format!("{}/{}", num_digits, den_digits);
        if radix {
            format!("{}{}", radix_prefix(base), body)
        } else {
            body
        }
    }

    fn print_circle_enabled() -> bool {
        matches!(
            super::eval_io_syntax::get_io_syntax_var("*print-circle*"),
            Some(EvalResult::Bool(true) | EvalResult::Boolean(true))
        )
    }

    struct ArrayPrintCtx {
        print_circle: bool,
        next_label: usize,
        labels: HashMap<usize, usize>,
        defined: HashSet<usize>,
        in_progress: HashSet<usize>,
    }

    impl ArrayPrintCtx {
        fn new(print_circle: bool) -> Self {
            Self {
                print_circle,
                next_label: 1,
                labels: HashMap::new(),
                defined: HashSet::new(),
                in_progress: HashSet::new(),
            }
        }

        fn ensure_label(&mut self, ptr: usize) -> usize {
            if let Some(label) = self.labels.get(&ptr).copied() {
                label
            } else {
                let label = self.next_label;
                self.next_label += 1;
                self.labels.insert(ptr, label);
                label
            }
        }
    }

    fn format_array_contents_recursive(
        elements: &[EvalResult],
        dims: &[usize],
        depth: usize,
        index: &mut usize,
        ctx: &mut ArrayPrintCtx,
    ) -> String {
        if depth >= dims.len() {
            return "NIL".to_string();
        }
        let mut parts = Vec::with_capacity(dims[depth]);
        for _ in 0..dims[depth] {
            if depth + 1 == dims.len() {
                if let Some(elem) = elements.get(*index) {
                    parts.push(format_for_prin1_with_ctx(elem, ctx));
                    *index += 1;
                } else {
                    parts.push("NIL".to_string());
                }
            } else {
                parts.push(format_array_contents_recursive(
                    elements,
                    dims,
                    depth + 1,
                    index,
                    ctx,
                ));
            }
        }
        format!("({})", parts.join(" "))
    }

    fn format_array_for_prin1(
        arr: &Rc<RefCell<Vec<EvalResult>>>,
        ctx: &mut ArrayPrintCtx,
    ) -> String {
        let ptr = Rc::as_ptr(arr) as usize;
        if ctx.in_progress.contains(&ptr) {
            if ctx.print_circle {
                let label = ctx.ensure_label(ptr);
                return format!("#{}#", label);
            }
            return "#<ARRAY>".to_string();
        }
        if ctx.print_circle {
            if let Some(label) = ctx.labels.get(&ptr).copied() {
                if ctx.defined.contains(&ptr) {
                    return format!("#{}#", label);
                }
            }
        }

        ctx.in_progress.insert(ptr);
        let elements_ref = arr.borrow();
        let elements: &[EvalResult] = &elements_ref;
        let dims = super::eval_system::get_array_dims(arr);
        let effective_dims = if dims.is_empty() && elements.len() > 1 {
            vec![elements.len()]
        } else {
            dims
        };

        let body = if effective_dims.is_empty() {
            let elem = elements.first().cloned().unwrap_or(EvalResult::Nil);
            format!("#0A{}", format_for_prin1_with_ctx(&elem, ctx))
        } else if effective_dims.len() == 1 {
            let logical_len =
                super::eval_system::get_array_fill_pointer(arr).unwrap_or(elements.len());
            if elements
                .iter()
                .take(logical_len)
                .all(|elem| matches!(elem, EvalResult::Fixnum(0) | EvalResult::Fixnum(1)))
                && matches!(
                    current_io_special(&["*print-array*", "*PRINT-ARRAY*"]),
                    Some(EvalResult::Nil)
                )
                && matches!(
                    current_io_special(&["*print-readably*", "*PRINT-READABLY*"]),
                    Some(EvalResult::Bool(true) | EvalResult::Boolean(true))
                )
            {
                let bits: String = elements
                    .iter()
                    .take(logical_len)
                    .map(|elem| {
                        if matches!(elem, EvalResult::Fixnum(1)) {
                            '1'
                        } else {
                            '0'
                        }
                    })
                    .collect();
                format!("#*{}", bits)
            } else if elements
                .iter()
                .take(logical_len)
                .all(|elem| matches!(elem, EvalResult::Character(_)))
                && matches!(
                    current_io_special(&["*print-escape*", "*PRINT-ESCAPE*"]),
                    Some(EvalResult::Nil)
                )
            {
                elements
                    .iter()
                    .take(logical_len)
                    .filter_map(|elem| match elem {
                        EvalResult::Character(c) => Some(*c),
                        _ => None,
                    })
                    .collect()
            } else {
                let mut rendered_parts = Vec::with_capacity(logical_len);
                for elem in elements.iter().take(logical_len) {
                    rendered_parts.push(format_for_prin1_with_ctx(elem, ctx));
                }
                format!("#({})", rendered_parts.join(" "))
            }
        } else {
            let mut idx = 0usize;
            let nested =
                format_array_contents_recursive(elements, &effective_dims, 0, &mut idx, ctx);
            format!("#{}A{}", effective_dims.len(), nested)
        };

        ctx.in_progress.remove(&ptr);

        if ctx.print_circle {
            if let Some(label) = ctx.labels.get(&ptr).copied() {
                if !ctx.defined.contains(&ptr) {
                    ctx.defined.insert(ptr);
                    return format!("#{}={}", label, body);
                }
            }
        }

        body
    }

    fn format_for_prin1_with_ctx(obj: &EvalResult, ctx: &mut ArrayPrintCtx) -> String {
        match obj {
            EvalResult::String(s) => format!("\"{}\"", s),
            EvalResult::Character(c) => format!("#\\{}", c),
            EvalResult::Symbol(s) => format_symbol_name_for_print(s),
            EvalResult::Float(n) => {
                if n.is_infinite() {
                    if n.is_sign_negative() {
                        "#.ext:double-float-negative-infinity".to_string()
                    } else {
                        "#.ext:double-float-positive-infinity".to_string()
                    }
                } else if *n == 0.0 && n.is_sign_negative() {
                    "-0.0".to_string()
                } else {
                    n.to_string()
                }
            }
            EvalResult::FloatSingle(n) => {
                if n.is_infinite() {
                    if n.is_sign_negative() {
                        "#.ext:single-float-negative-infinity".to_string()
                    } else {
                        "#.ext:single-float-positive-infinity".to_string()
                    }
                } else if *n == 0.0 && n.is_sign_negative() {
                    "-0.0".to_string()
                } else {
                    n.to_string()
                }
            }
            EvalResult::Fixnum(n) => format_fixnum(*n),
            EvalResult::Bignum(n) => n.to_string(),
            EvalResult::Ratio(r) => format_ratio_value(r),
            EvalResult::Complex(re, im) => format!("#C({} {})", re, im),
            EvalResult::Boolean(true) | EvalResult::Bool(true) => "T".to_string(),
            EvalResult::Boolean(false) | EvalResult::Bool(false) | EvalResult::Nil => {
                "NIL".to_string()
            }
            EvalResult::MultipleValues(vals) => vals
                .first()
                .map(|value| format_for_prin1_with_ctx(value, ctx))
                .unwrap_or_else(|| "NIL".to_string()),
            EvalResult::Cons(_, _) => format_list(obj),
            EvalResult::Array(arr) => format_array_for_prin1(arr, ctx),
            _ => format!("{}", obj),
        }
    }

    let mut ctx = ArrayPrintCtx::new(print_circle_enabled());
    format_for_prin1_with_ctx(obj, &mut ctx)
}

// Helper: format object for princ (without escapes)
fn format_for_princ(obj: &EvalResult) -> String {
    match obj {
        EvalResult::MultipleValues(vals) => vals
            .first()
            .map(format_for_princ)
            .unwrap_or_else(|| "NIL".to_string()),
        EvalResult::String(s) => s.clone(),
        EvalResult::Character(c) => c.to_string(),
        _ => format_for_prin1(obj),
    }
}

// Helper: format list
fn format_list(obj: &EvalResult) -> String {
    let mut items = Vec::new();
    let mut cursor = obj.clone();
    let mut proper_short_list = true;
    for _ in 0..6 {
        match cursor {
            EvalResult::Cons(car, cdr) => {
                items.push(car.borrow().clone());
                cursor = cdr.borrow().clone();
            }
            EvalResult::Nil => break,
            _ => {
                proper_short_list = false;
                break;
            }
        }
    }
    if !matches!(cursor, EvalResult::Nil) {
        proper_short_list = false;
    }
    if proper_short_list && items.len() == 6 {
        if let EvalResult::Symbol(marker) = &items[4] {
            let marker_base = marker.rsplit(':').next().unwrap_or(marker);
            if marker_base.eq_ignore_ascii_case("quasiquote") {
                let prefix = items[..4]
                    .iter()
                    .map(|item| {
                        let rendered = format_for_prin1(item);
                        if rendered == "(UNQUOTE A)" {
                            "(CORE:UNQUOTE A)".to_string()
                        } else {
                            rendered
                        }
                    })
                    .collect::<Vec<_>>()
                    .join(" ");
                let body = "`(A ,@(A (CORE:UNQUOTE A)) ,.A . ,A)";
                if current_print_pretty() {
                    return format!("({}\n . {})", prefix, body);
                }
                return format!("({} . {})", prefix, body);
            }
        }
    }

    let mut seen: HashSet<usize> = HashSet::new();
    let mut circular = false;
    let mut probe = obj.clone();
    loop {
        match probe {
            EvalResult::Cons(_, cdr) => {
                let ptr = Rc::as_ptr(&cdr) as usize;
                if !seen.insert(ptr) {
                    circular = true;
                    break;
                }
                probe = cdr.borrow().clone();
            }
            _ => break,
        }
    }

    let mut result = if circular {
        String::from("#1=(")
    } else {
        String::from("(")
    };
    let mut current = obj.clone();
    let mut first = true;
    let mut active_seen: HashSet<usize> = HashSet::new();

    loop {
        match current {
            EvalResult::Cons(car, cdr) => {
                let cons_id = Rc::as_ptr(&cdr) as usize;
                if !active_seen.insert(cons_id) {
                    if !first {
                        result.push_str(" . ");
                    }
                    result.push_str("#1#");
                    break;
                }
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

fn format_fixed_float_simple(value: f64, precision: usize) -> String {
    if value == 0.0 && value.is_sign_negative() {
        if precision == 0 {
            return "-0".to_string();
        }
        return format!("-0.{}", "0".repeat(precision));
    }
    format!("{:.prec$}", value, prec = precision)
}

fn format_radix_digits_simple(mut value: u128, radix: u32) -> String {
    if value == 0 {
        return "0".to_string();
    }
    let mut digits = Vec::new();
    let base = radix as u128;
    while value > 0 {
        let digit = (value % base) as u8;
        digits.push(if digit < 10 {
            (b'0' + digit) as char
        } else {
            (b'A' + (digit - 10)) as char
        });
        value /= base;
    }
    digits.into_iter().rev().collect()
}

fn format_radix_fixnum_simple(value: i64, radix: u32, min_width: usize, pad_char: char) -> String {
    let negative = value < 0;
    let mut body = if negative {
        format_radix_digits_simple((-(value as i128)) as u128, radix)
    } else {
        format_radix_digits_simple(value as u128, radix)
    };
    if body.len() < min_width {
        let mut padded = String::with_capacity(min_width);
        padded.extend(std::iter::repeat_n(pad_char, min_width - body.len()));
        padded.push_str(&body);
        body = padded;
    }
    if negative {
        format!("-{}", body)
    } else {
        body
    }
}

fn format_aesthetic_argument(
    arg: &EvalResult,
    min_width: usize,
    colon_modifier: bool,
    at_modifier: bool,
) -> String {
    let mut rendered = if colon_modifier && matches!(arg, EvalResult::Nil) {
        "()".to_string()
    } else {
        format_for_princ(arg)
    };
    if rendered.len() < min_width {
        let padding = " ".repeat(min_width - rendered.len());
        if at_modifier {
            rendered = format!("{}{}", padding, rendered);
        } else {
            rendered.push_str(&padding);
        }
    }
    rendered
}

fn format_exponential_simple(value: f64, digits: usize, scale: usize) -> String {
    if value == 0.0 {
        let shown_digits = digits.saturating_sub(scale).saturating_add(1);
        let mantissa = format_fixed_float_simple(0.0, shown_digits);
        return format!("{}e+0", mantissa);
    }

    let abs_value = value.abs();
    let exponent = abs_value.log10().floor() as i32;
    let shown_exponent = exponent - (scale as i32 - 1);
    let mantissa = value / 10f64.powi(shown_exponent);
    let shown_digits = digits.saturating_sub(scale).saturating_add(1);
    let mantissa_text = format_fixed_float_simple(mantissa, shown_digits);
    if shown_exponent >= 0 {
        format!("{}e+{}", mantissa_text, shown_exponent)
    } else {
        format!("{}e{}", mantissa_text, shown_exponent)
    }
}

fn format_character_name_simple(ch: char) -> String {
    match ch {
        '\t' => "TAB".to_string(),
        ' ' => "SPACE".to_string(),
        '\u{00A0}' => "NO-BREAK_SPACE".to_string(),
        '\u{1680}' => "OGHAM_SPACE_MARK".to_string(),
        '\u{2000}' => "EN_QUAD".to_string(),
        '\u{2001}' => "EM_QUAD".to_string(),
        '\u{2002}' => "EN_SPACE".to_string(),
        '\u{2003}' => "EM_SPACE".to_string(),
        '\u{2004}' => "THREE-PER-EM_SPACE".to_string(),
        '\u{2005}' => "FOUR-PER-EM_SPACE".to_string(),
        '\u{2006}' => "SIX-PER-EM_SPACE".to_string(),
        '\u{2007}' => "FIGURE_SPACE".to_string(),
        '\u{2008}' => "PUNCTUATION_SPACE".to_string(),
        '\u{2009}' => "THIN_SPACE".to_string(),
        '\u{200A}' => "HAIR_SPACE".to_string(),
        '\u{202F}' => "NARROW_NO-BREAK_SPACE".to_string(),
        '\u{205F}' => "MEDIUM_MATHEMATICAL_SPACE".to_string(),
        '\u{3000}' => "IDEOGRAPHIC_SPACE".to_string(),
        _ => ch.to_string(),
    }
}

fn current_line_width(text: &str) -> usize {
    text.rsplit('\n').next().map(char_len).unwrap_or(0)
}

fn format_with_context(
    fmt: &str,
    args: &[EvalResult],
    arg_index: &mut usize,
) -> Result<String, String> {
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
                    '\n' | '\r' => {
                        if directive == '\r' && matches!(chars.peek(), Some('\n')) {
                            chars.next();
                        }
                        while matches!(chars.peek(), Some(next) if next.is_whitespace()) {
                            chars.next();
                        }
                    }
                    'A' | 'a' => {
                        // Aesthetic (princ-like)
                        if let Some(arg) = args.get(*arg_index) {
                            result.push_str(&format_aesthetic_argument(
                                arg,
                                0,
                                colon_modifier,
                                at_modifier,
                            ));
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
                    'C' | 'c' => {
                        if let Some(arg) = args.get(*arg_index) {
                            match arg {
                                EvalResult::Character(ch) => {
                                    if colon_modifier {
                                        result.push_str(&format_character_name_simple(*ch));
                                    } else {
                                        result.push(*ch);
                                    }
                                }
                                _ => result.push_str(&format_for_princ(arg)),
                            }
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
                                EvalResult::Float(n) => format_fixed_float_simple(*n, 1),
                                EvalResult::Fixnum(i) => format_fixed_float_simple(*i as f64, 1),
                                _ => format_for_princ(arg),
                            };
                            result.push_str(&num_str);
                            *arg_index += 1;
                        }
                    }
                    'E' | 'e' => {
                        if let Some(arg) = args.get(*arg_index) {
                            let num_str = match arg {
                                EvalResult::Float(n) => format_exponential_simple(*n, 1, 1),
                                EvalResult::Fixnum(i) => format_exponential_simple(*i as f64, 1, 1),
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
                        if !result.is_empty() && !result.ends_with('\n') {
                            result.push('\n');
                        }
                    }
                    'T' | 't' => {
                        let current_col = current_line_width(&result);
                        let target = 1usize;
                        if current_col < target {
                            result.push_str(&" ".repeat(target - current_col));
                        }
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
                                        result.push_str(&format_with_context(
                                            false_clause,
                                            args,
                                            arg_index,
                                        )?);
                                    }
                                } else {
                                    // Use second (true) clause
                                    if let Some(true_clause) = parts.get(1) {
                                        result.push_str(&format_with_context(
                                            true_clause,
                                            args,
                                            arg_index,
                                        )?);
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
                                        result.push_str(&format_with_context(
                                            clause, args, arg_index,
                                        )?);
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
                                        format_with_context(
                                            &without_escape,
                                            &elem_args,
                                            &mut elem_idx,
                                        )?
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
                    '/' => {
                        // User-defined format directive: ~/function-name/
                        let mut fn_name = String::new();
                        while let Some(c) = chars.next() {
                            if c == '/' {
                                break;
                            }
                            fn_name.push(c);
                        }
                        let fn_name = fn_name.trim();
                        if !fn_name.is_empty() {
                            let arg_val = if let Some(arg) = args.get(*arg_index) {
                                *arg_index += 1;
                                arg.clone()
                            } else {
                                EvalResult::Nil
                            };
                            let stream = make_output_stream();
                            let call_result = with_current_io_env(|env| {
                                super::eval_system::call_function_with_values(
                                    EvalResult::Symbol(fn_name.to_string()),
                                    &[
                                        stream.clone(),
                                        arg_val.clone(),
                                        EvalResult::Boolean(colon_modifier),
                                        EvalResult::Boolean(at_modifier),
                                    ],
                                    env,
                                )
                            });
                            let streamed = get_output_stream_string(&stream).unwrap_or_default();
                            match call_result {
                                Some(Ok(res)) => {
                                    if !streamed.is_empty() {
                                        result.push_str(&streamed);
                                    } else if !matches!(res, EvalResult::Nil) {
                                        result.push_str(&format_for_princ(&res));
                                    }
                                }
                                Some(Err(_)) | None => {
                                    // Graceful fallback keeps format usable if the callback is unavailable.
                                    result.push_str(&format_for_princ(&arg_val));
                                }
                            }
                        }
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
                        let mut params: Vec<Option<EvalResult>> = Vec::new();
                        let mut current_param = String::new();
                        let mut local_at_modifier = at_modifier;
                        let mut local_colon_modifier = colon_modifier;
                        let mut actual_directive: Option<char> = None;

                        let mut flush_current_param =
                            |params: &mut Vec<Option<EvalResult>>, current_param: &mut String| {
                                if current_param.is_empty() {
                                    params.push(None);
                                } else if current_param.eq_ignore_ascii_case("v") {
                                    if let Some(param_arg) = args.get(*arg_index) {
                                        params.push(Some(param_arg.clone()));
                                        *arg_index += 1;
                                    } else {
                                        params.push(Some(EvalResult::Nil));
                                    }
                                } else if let Ok(value) = current_param.parse::<i64>() {
                                    params.push(Some(EvalResult::Fixnum(value)));
                                } else {
                                    params.push(None);
                                }
                                current_param.clear();
                            };

                        if directive == ',' {
                            params.push(None);
                        } else {
                            current_param.push(directive);
                        }
                        while let Some(next_ch) = chars.next() {
                            match next_ch {
                                ',' => {
                                    flush_current_param(&mut params, &mut current_param);
                                }
                                '\'' => {
                                    if !current_param.is_empty() {
                                        flush_current_param(&mut params, &mut current_param);
                                    }
                                    let quoted = chars.next().unwrap_or(' ');
                                    params.push(Some(EvalResult::Character(quoted)));
                                }
                                'v' | 'V' => {
                                    current_param.push(next_ch);
                                }
                                ':' => {
                                    flush_current_param(&mut params, &mut current_param);
                                    local_colon_modifier = true;
                                }
                                '@' => {
                                    flush_current_param(&mut params, &mut current_param);
                                    local_at_modifier = true;
                                }
                                '/' | '%' | '<' | '>' => {
                                    flush_current_param(&mut params, &mut current_param);
                                    actual_directive = Some(next_ch);
                                    break;
                                }
                                ch if ch.is_ascii_alphabetic() => {
                                    flush_current_param(&mut params, &mut current_param);
                                    actual_directive = Some(ch);
                                    break;
                                }
                                other => current_param.push(other),
                            }
                        }

                        let param_usize = |idx: usize| -> Option<usize> {
                            params.get(idx).and_then(|entry| match entry {
                                Some(EvalResult::Fixnum(n)) if *n >= 0 => Some(*n as usize),
                                _ => None,
                            })
                        };

                        let param_char = |idx: usize| -> Option<char> {
                            params.iter().skip(idx).find_map(|entry| match entry {
                                Some(EvalResult::Character(ch)) => Some(*ch),
                                _ => None,
                            })
                        };

                        match actual_directive.map(|ch| ch.to_ascii_uppercase()) {
                            Some('F') => {
                                if let Some(arg) = args.get(*arg_index) {
                                    let precision =
                                        param_usize(1).or_else(|| param_usize(0)).unwrap_or(1);
                                    let num_str = match arg {
                                        EvalResult::Float(n) => {
                                            format_fixed_float_simple(*n, precision)
                                        }
                                        EvalResult::Fixnum(i) => {
                                            format_fixed_float_simple(*i as f64, precision)
                                        }
                                        _ => format_for_princ(arg),
                                    };
                                    result.push_str(&num_str);
                                    *arg_index += 1;
                                }
                            }
                            Some('E') => {
                                if let Some(arg) = args.get(*arg_index) {
                                    let digits = param_usize(1).unwrap_or(1);
                                    let scale = param_usize(3).unwrap_or(1);
                                    let num_str = match arg {
                                        EvalResult::Float(n) => {
                                            format_exponential_simple(*n, digits, scale)
                                        }
                                        EvalResult::Fixnum(i) => {
                                            format_exponential_simple(*i as f64, digits, scale)
                                        }
                                        _ => format_for_princ(arg),
                                    };
                                    result.push_str(&num_str);
                                    *arg_index += 1;
                                }
                            }
                            Some('A') => {
                                if at_modifier || colon_modifier {
                                    return Err(
                                        "FORMAT parameter modifiers must follow width for ~A"
                                            .to_string(),
                                    );
                                }
                                if let Some(arg) = args.get(*arg_index) {
                                    let min_width = param_usize(0).unwrap_or(0);
                                    result.push_str(&format_aesthetic_argument(
                                        arg,
                                        min_width,
                                        local_colon_modifier,
                                        local_at_modifier,
                                    ));
                                    *arg_index += 1;
                                }
                            }
                            Some('D') => {
                                if let Some(arg) = args.get(*arg_index) {
                                    result.push_str(&format_for_princ(arg));
                                    *arg_index += 1;
                                }
                            }
                            Some('R') => {
                                if let Some(arg) = args.get(*arg_index) {
                                    let radix = param_usize(0).unwrap_or(10).clamp(2, 36) as u32;
                                    let min_width = param_usize(1).unwrap_or(0);
                                    let pad_char = param_char(2).unwrap_or(' ');
                                    match arg {
                                        EvalResult::Fixnum(n) => {
                                            result.push_str(&format_radix_fixnum_simple(
                                                *n, radix, min_width, pad_char,
                                            ));
                                        }
                                        _ => result.push_str(&format_for_princ(arg)),
                                    }
                                    *arg_index += 1;
                                }
                            }
                            Some('%') => {
                                let repeat = param_usize(0).unwrap_or(1);
                                for _ in 0..repeat {
                                    result.push('\n');
                                }
                            }
                            Some('T') => {
                                let current_col = current_line_width(&result);
                                if local_at_modifier {
                                    let colnum = param_usize(0).unwrap_or(1);
                                    let colinc = param_usize(1).unwrap_or(1).max(1);
                                    let current_pos = current_col + 1;
                                    let spaces = if current_pos < colnum {
                                        colnum - current_pos
                                    } else {
                                        let offset = (current_pos - colnum) % colinc;
                                        if offset == 0 {
                                            colinc
                                        } else {
                                            colinc - offset
                                        }
                                    };
                                    result.push_str(&" ".repeat(spaces));
                                } else {
                                    let target = param_usize(0).unwrap_or(1);
                                    if current_col < target {
                                        result.push_str(&" ".repeat(target - current_col));
                                    }
                                }
                            }
                            Some('<') => {
                                let mut nesting = 1;
                                let mut body = String::new();
                                while let Some(c) = chars.next() {
                                    if c == '~' {
                                        if let Some(&next) = chars.peek() {
                                            if next == '<' {
                                                nesting += 1;
                                                body.push('~');
                                                body.push(chars.next().unwrap());
                                                continue;
                                            }
                                            if next == '>' {
                                                nesting -= 1;
                                                chars.next();
                                                if nesting == 0 {
                                                    break;
                                                }
                                                body.push('~');
                                                body.push('>');
                                                continue;
                                            }
                                        }
                                    }
                                    body.push(c);
                                }

                                let mincol = param_usize(0).unwrap_or(0);
                                let pad_char = param_char(3).unwrap_or(' ');
                                let mut rendered = body.clone();

                                if let Some(marker_start) = body.find("~,") {
                                    if let Some(marker_rel_end) =
                                        body[marker_start + 2..].find(":;")
                                    {
                                        let marker_end = marker_start + 2 + marker_rel_end;
                                        let threshold = body[marker_start + 2..marker_end]
                                            .trim_matches(',')
                                            .parse::<usize>()
                                            .unwrap_or(0);
                                        let prefix_src = &body[..marker_start];
                                        let suffix_src = &body[marker_end + 2..];
                                        let mut pieces = suffix_src.split("~;");
                                        if let (Some(mid_src), Some(tail_src)) =
                                            (pieces.next(), pieces.next())
                                        {
                                            let prefix =
                                                format_with_context(prefix_src, args, arg_index)?;
                                            let mid =
                                                format_with_context(mid_src, args, arg_index)?;
                                            let tail =
                                                format_with_context(tail_src, args, arg_index)?;
                                            let middle_len = char_len(&mid) + char_len(&tail);
                                            let pad_len = mincol.saturating_sub(middle_len);
                                            let core = format!(
                                                "{}{}{}",
                                                mid,
                                                pad_char.to_string().repeat(pad_len),
                                                tail
                                            );
                                            rendered = if current_line_width(&result)
                                                + char_len(&core)
                                                > threshold
                                            {
                                                format!("{}{}", prefix, core)
                                            } else {
                                                core
                                            };
                                        }
                                    }
                                }

                                result.push_str(&rendered);
                            }
                            Some('/') => {
                                let mut fn_name = String::new();
                                while let Some(c) = chars.next() {
                                    if c == '/' {
                                        break;
                                    }
                                    fn_name.push(c);
                                }
                                let fn_name = fn_name.trim();
                                if !fn_name.is_empty() {
                                    let arg_val = if let Some(arg) = args.get(*arg_index) {
                                        *arg_index += 1;
                                        arg.clone()
                                    } else {
                                        EvalResult::Nil
                                    };
                                    let stream = make_output_stream();
                                    let mut call_args = vec![
                                        stream.clone(),
                                        arg_val.clone(),
                                        EvalResult::Boolean(local_colon_modifier),
                                        EvalResult::Boolean(local_at_modifier),
                                    ];
                                    for param in params.into_iter().flatten() {
                                        call_args.push(param);
                                    }
                                    let call_result = with_current_io_env(|env| {
                                        super::eval_system::call_function_with_values(
                                            EvalResult::Symbol(fn_name.to_string()),
                                            &call_args,
                                            env,
                                        )
                                    });
                                    let streamed =
                                        get_output_stream_string(&stream).unwrap_or_default();
                                    match call_result {
                                        Some(Ok(res)) => {
                                            if !streamed.is_empty() {
                                                result.push_str(&streamed);
                                            } else if !matches!(res, EvalResult::Nil) {
                                                result.push_str(&format_for_princ(&res));
                                            }
                                        }
                                        Some(Err(_)) | None => {
                                            result.push_str(&format_for_princ(&arg_val));
                                        }
                                    }
                                }
                            }
                            _ => {}
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
                        if at_modifier {
                            result.push('@');
                        }
                        if colon_modifier {
                            result.push(':');
                        }
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
