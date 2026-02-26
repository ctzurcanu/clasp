/// eval_readtable.rs - Readtable operations
use super::eval_types::EvalResult;
use std::cell::RefCell;
use std::collections::HashMap;

#[derive(Clone)]
struct MacroEntry {
    function: EvalResult,
    non_terminating: bool,
}

#[derive(Clone)]
struct ReadtableState {
    case_mode: String,
    macro_chars: HashMap<char, MacroEntry>,
    dispatch_chars: HashMap<char, HashMap<char, EvalResult>>,
}

fn default_readtable_state() -> ReadtableState {
    let mut macro_chars = HashMap::new();
    macro_chars.insert(
        '`',
        MacroEntry {
            function: EvalResult::Symbol("READTABLE::BACKQUOTE-MACRO".to_string()),
            non_terminating: false,
        },
    );
    macro_chars.insert(
        '#',
        MacroEntry {
            function: EvalResult::Symbol("READTABLE::DISPATCH-MACRO".to_string()),
            non_terminating: false,
        },
    );

    let mut sharp_dispatch = HashMap::new();
    sharp_dispatch.insert('=', EvalResult::Symbol("READTABLE::SHARP-EQUAL".to_string()));
    sharp_dispatch.insert('#', EvalResult::Symbol("READTABLE::SHARP-SHARP".to_string()));
    sharp_dispatch.insert('I', EvalResult::Symbol("READTABLE::SHARP-I".to_string()));
    sharp_dispatch.insert('A', EvalResult::Symbol("READTABLE::SHARP-A".to_string()));
    sharp_dispatch.insert('S', EvalResult::Symbol("READTABLE::SHARP-S".to_string()));

    let mut dispatch_chars = HashMap::new();
    dispatch_chars.insert('#', sharp_dispatch);

    ReadtableState {
        case_mode: "UPCASE".to_string(),
        macro_chars,
        dispatch_chars,
    }
}

thread_local! {
    static READTABLES: RefCell<HashMap<u64, ReadtableState>> = {
        let mut tables = HashMap::new();
        tables.insert(0, default_readtable_state());
        RefCell::new(tables)
    };
    static CURRENT_READTABLE_ID: RefCell<u64> = RefCell::new(0);
    static NEXT_READTABLE_ID: RefCell<u64> = RefCell::new(1);
}

fn parse_readtable_case(arg: &EvalResult) -> Option<String> {
    let raw = match arg {
        EvalResult::Symbol(s) | EvalResult::String(s) => s.as_str(),
        _ => return None,
    };
    let trimmed = raw.strip_prefix(':').unwrap_or(raw).to_ascii_uppercase();
    match trimmed.as_str() {
        "UPCASE" | "DOWNCASE" | "PRESERVE" | "INVERT" => Some(trimmed),
        _ => None,
    }
}

fn readtable_token(id: u64) -> EvalResult {
    EvalResult::Symbol(format!("#<READTABLE:{}>", id))
}

fn parse_readtable_token(raw: &str) -> Option<u64> {
    let s = raw.trim();
    let inner = s.strip_prefix("#<READTABLE:")?.strip_suffix('>')?;
    inner.parse::<u64>().ok()
}

fn current_readtable_id() -> u64 {
    CURRENT_READTABLE_ID.with(|id| *id.borrow())
}

fn resolve_readtable_id(arg: Option<&EvalResult>) -> Result<u64, String> {
    match arg {
        None => Ok(current_readtable_id()),
        Some(EvalResult::Nil) => Ok(current_readtable_id()),
        Some(EvalResult::Symbol(s)) | Some(EvalResult::String(s)) => {
            if let Some(id) = parse_readtable_token(s) {
                let exists = READTABLES.with(|tables| tables.borrow().contains_key(&id));
                if exists {
                    return Ok(id);
                }
                return Err("type-error: readtable designator does not exist".to_string());
            }
            if s.eq_ignore_ascii_case("*READTABLE*")
                || s.eq_ignore_ascii_case("CL:*READTABLE*")
                || s.eq_ignore_ascii_case("READTABLE")
            {
                return Ok(current_readtable_id());
            }
            Err("type-error: expected readtable designator".to_string())
        }
        _ => Err("type-error: expected readtable designator".to_string()),
    }
}

fn readtable_copy(id: u64) -> ReadtableState {
    READTABLES.with(|tables| {
        tables
            .borrow()
            .get(&id)
            .cloned()
            .unwrap_or_else(default_readtable_state)
    })
}

fn allocate_readtable(state: ReadtableState) -> u64 {
    let id = NEXT_READTABLE_ID.with(|next| {
        let mut slot = next.borrow_mut();
        let id = *slot;
        *slot += 1;
        id
    });
    READTABLES.with(|tables| {
        tables.borrow_mut().insert(id, state);
    });
    id
}

fn to_bool(v: &EvalResult) -> bool {
    !matches!(v, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false))
}

fn to_char_designator(v: &EvalResult) -> Result<char, String> {
    match v {
        EvalResult::Character(c) => Ok(*c),
        EvalResult::String(s) => {
            let mut it = s.chars();
            match (it.next(), it.next()) {
                (Some(c), None) => Ok(c),
                _ => Err("type-error: expected a character designator".to_string()),
            }
        }
        _ => Err("type-error: expected a character designator".to_string()),
    }
}

pub fn set_readtable_case_builtin(args: &[EvalResult]) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("setf readtable-case requires new-case and readtable".to_string());
    }
    let rt_id = resolve_readtable_id(args.get(1))?;
    let new_case =
        parse_readtable_case(&args[0]).ok_or_else(|| "type-error: invalid readtable-case".to_string())?;
    READTABLES.with(|tables| {
        if let Some(state) = tables.borrow_mut().get_mut(&rt_id) {
            state.case_mode = new_case.clone();
        }
    });
    Ok(EvalResult::Symbol(format!(":{}", new_case)))
}

pub fn call_readtable_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "readtablep" => {
            let is_rt = resolve_readtable_id(args.get(0)).is_ok();
            Ok(EvalResult::Boolean(is_rt))
        }
        "copy-readtable" => {
            let from_id = if let Some(EvalResult::Nil) = args.get(0) {
                0
            } else {
                resolve_readtable_id(args.get(0))?
            };
            let src = readtable_copy(from_id);

            match args.get(1) {
                Some(EvalResult::Nil) | None => {
                    let new_id = allocate_readtable(src);
                    Ok(readtable_token(new_id))
                }
                Some(_) => {
                    let to_id = resolve_readtable_id(args.get(1))?;
                    READTABLES.with(|tables| {
                        tables.borrow_mut().insert(to_id, src);
                    });
                    Ok(readtable_token(to_id))
                }
            }
        }
        "readtable-case" => {
            let rt_id = resolve_readtable_id(args.get(0))?;
            let case_mode = READTABLES.with(|tables| {
                tables
                    .borrow()
                    .get(&rt_id)
                    .map(|rt| rt.case_mode.clone())
                    .unwrap_or_else(|| "UPCASE".to_string())
            });
            Ok(EvalResult::Symbol(format!(":{}", case_mode)))
        }
        "get-macro-character" => {
            if args.is_empty() {
                return Err("get-macro-character requires a character".to_string());
            }
            let ch = to_char_designator(&args[0])?;
            let rt_id = resolve_readtable_id(args.get(1))?;
            let result = READTABLES.with(|tables| {
                tables
                    .borrow()
                    .get(&rt_id)
                    .and_then(|rt| rt.macro_chars.get(&ch).cloned())
            });
            if let Some(entry) = result {
                Ok(EvalResult::MultipleValues(vec![
                    entry.function,
                    if entry.non_terminating {
                        EvalResult::Boolean(true)
                    } else {
                        EvalResult::Nil
                    },
                ]))
            } else {
                Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Nil]))
            }
        }
        "set-macro-character" => {
            if args.len() < 2 {
                return Err("set-macro-character requires character and function".to_string());
            }
            let ch = to_char_designator(&args[0])?;
            let function = args[1].clone();
            let non_terminating = args.get(2).map(to_bool).unwrap_or(false);
            let rt_id = resolve_readtable_id(args.get(3))?;
            READTABLES.with(|tables| {
                if let Some(rt) = tables.borrow_mut().get_mut(&rt_id) {
                    rt.macro_chars.insert(
                        ch,
                        MacroEntry {
                            function,
                            non_terminating,
                        },
                    );
                }
            });
            Ok(EvalResult::Boolean(true))
        }
        "set-syntax-from-char" => {
            if args.len() < 2 {
                return Err("set-syntax-from-char requires to-char and from-char".to_string());
            }
            let to_ch = to_char_designator(&args[0])?;
            let from_ch = to_char_designator(&args[1])?;
            let to_rt_id = resolve_readtable_id(args.get(2))?;
            let from_rt_id = resolve_readtable_id(args.get(3))?;

            let from_macro = READTABLES.with(|tables| {
                tables
                    .borrow()
                    .get(&from_rt_id)
                    .and_then(|rt| rt.macro_chars.get(&from_ch).cloned())
            });
            READTABLES.with(|tables| {
                if let Some(to_rt) = tables.borrow_mut().get_mut(&to_rt_id) {
                    if let Some(entry) = from_macro {
                        to_rt.macro_chars.insert(to_ch, entry);
                    } else {
                        to_rt.macro_chars.remove(&to_ch);
                    }
                }
            });
            Ok(EvalResult::Boolean(true))
        }
        "get-dispatch-macro-character" => {
            if args.len() < 2 {
                return Err("get-dispatch-macro-character requires dispatch-char and sub-char".to_string());
            }
            let disp = to_char_designator(&args[0])?;
            let sub = to_char_designator(&args[1])?.to_ascii_uppercase();
            let rt_id = resolve_readtable_id(args.get(2))?;
            let value = READTABLES.with(|tables| {
                tables
                    .borrow()
                    .get(&rt_id)
                    .and_then(|rt| rt.dispatch_chars.get(&disp))
                    .and_then(|submap| submap.get(&sub))
                    .cloned()
            });
            Ok(value.unwrap_or(EvalResult::Nil))
        }
        "set-dispatch-macro-character" => {
            if args.len() < 3 {
                return Err("set-dispatch-macro-character requires dispatch-char, sub-char and function".to_string());
            }
            let disp = to_char_designator(&args[0])?;
            let sub = to_char_designator(&args[1])?.to_ascii_uppercase();
            let function = args[2].clone();
            let rt_id = resolve_readtable_id(args.get(3))?;
            READTABLES.with(|tables| {
                if let Some(rt) = tables.borrow_mut().get_mut(&rt_id) {
                    rt.dispatch_chars
                        .entry(disp)
                        .or_insert_with(HashMap::new)
                        .insert(sub, function);
                }
            });
            Ok(EvalResult::Boolean(true))
        }
        "make-dispatch-macro-character" => {
            if args.is_empty() {
                return Err("make-dispatch-macro-character requires a character".to_string());
            }
            let ch = to_char_designator(&args[0])?;
            let non_terminating = args.get(1).map(to_bool).unwrap_or(false);
            let rt_id = resolve_readtable_id(args.get(2))?;
            READTABLES.with(|tables| {
                if let Some(rt) = tables.borrow_mut().get_mut(&rt_id) {
                    rt.macro_chars.insert(
                        ch,
                        MacroEntry {
                            function: EvalResult::Symbol(format!(
                                "READTABLE::DISPATCH-MACRO-{}",
                                ch as u32
                            )),
                            non_terminating,
                        },
                    );
                    rt.dispatch_chars.entry(ch).or_insert_with(HashMap::new);
                }
            });
            Ok(EvalResult::Boolean(true))
        }
        _ => Err(format!("Unknown readtable builtin: {}", name)),
    }
}
