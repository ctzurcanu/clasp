use super::eval_core::eval_with_env;
use super::eval_package::{get_current_package, PACKAGES};
/// eval_conditions.rs - Common Lisp condition system implementation
///
/// Implements:
/// - define-condition: Define condition types with inheritance and slots
/// - make-condition: Create condition instances
/// - signal, error, warn, cerror: Signal conditions
/// - handler-case, handler-bind: Establish condition handlers
/// - typep support for condition types
use super::eval_types::EvalResult;
use crate::ir::{ASTNode, ConstantValue};
use std::cell::{Cell, RefCell};
use std::collections::HashMap;
use std::rc::Rc;

/// A slot in a condition type
#[derive(Debug, Clone)]
pub struct ConditionSlot {
    pub name: String,
    pub initarg: Option<String>,
    pub initform: Option<ASTNode>,
    pub reader: Option<String>,
    pub writer: Option<String>,
    pub accessor: Option<String>,
}

/// A condition type definition
#[derive(Debug, Clone)]
pub struct ConditionType {
    pub name: String,
    pub parent_types: Vec<String>,
    pub slots: Vec<ConditionSlot>,
    pub report_fn: Option<ASTNode>,
    pub documentation: Option<String>,
}

impl ConditionType {
    /// Check if this condition type is a subtype of another
    pub fn is_subtype_of(&self, other: &str, registry: &HashMap<String, ConditionType>) -> bool {
        if self.name == other {
            return true;
        }
        for parent in &self.parent_types {
            if parent == other {
                return true;
            }
            if let Some(parent_type) = registry.get(parent) {
                if parent_type.is_subtype_of(other, registry) {
                    return true;
                }
            }
        }
        false
    }
}

/// A condition instance
#[derive(Debug, Clone)]
pub struct ConditionInstance {
    pub type_name: String,
    pub slots: HashMap<String, EvalResult>,
}

/// Create a simple-error condition from a message string
pub fn make_simple_error(msg: &str) -> EvalResult {
    let mut slots = HashMap::new();
    slots.insert(
        "FORMAT-CONTROL".to_string(),
        EvalResult::String(msg.to_string()),
    );
    slots.insert("FORMAT-ARGUMENTS".to_string(), EvalResult::Nil);
    EvalResult::Condition(Rc::new(RefCell::new(ConditionInstance {
        type_name: "SIMPLE-ERROR".to_string(),
        slots,
    })))
}

pub fn make_error_condition_from_message(msg: &str) -> EvalResult {
    let upper = msg.trim().to_ascii_uppercase();
    let type_name = if upper.starts_with("PROGRAM-ERROR") {
        "PROGRAM-ERROR"
    } else if upper.starts_with("FILE-ERROR") {
        "FILE-ERROR"
    } else if upper.starts_with("STREAM-DECODING-ERROR") || upper.contains("STREAM-DECODING-ERROR")
    {
        "STREAM-DECODING-ERROR"
    } else if upper.starts_with("STREAM-ERROR") {
        "STREAM-ERROR"
    } else if upper.starts_with("END-OF-FILE") || upper.contains("END OF FILE") {
        "END-OF-FILE"
    } else if upper.starts_with("READER-ERROR") || upper.contains("READER-ERROR") {
        "READER-ERROR"
    } else if upper.starts_with("UNDEFINED-FUNCTION") || upper.contains("UNDEFINED FUNCTION") {
        "UNDEFINED-FUNCTION"
    } else if upper.starts_with("UNBOUND-VARIABLE") || upper.contains("UNBOUND VARIABLE") {
        "UNBOUND-VARIABLE"
    } else if upper.starts_with("UNBOUND-SLOT")
        || (upper.starts_with("SLOT ") && upper.ends_with(" IS UNBOUND"))
    {
        "UNBOUND-SLOT"
    } else if upper.starts_with("DIVISION-BY-ZERO") || upper.contains("DIVISION BY ZERO") {
        "DIVISION-BY-ZERO"
    } else if upper.starts_with("FLOATING-POINT-OVERFLOW") {
        "FLOATING-POINT-OVERFLOW"
    } else if upper.starts_with("FLOATING-POINT-INEXACT") {
        "FLOATING-POINT-INEXACT"
    } else if upper.starts_with("FLOATING-POINT-INVALID-OPERATION") {
        "FLOATING-POINT-INVALID-OPERATION"
    } else if upper.starts_with("PARSE-ERROR")
        || upper.contains("CANNOT PARSE")
        || upper.contains("PARSE ERROR")
    {
        "PARSE-ERROR"
    } else if upper.starts_with("TYPE-ERROR") {
        "TYPE-ERROR"
    } else {
        "SIMPLE-ERROR"
    };
    let mut slots = HashMap::new();
    slots.insert(
        "FORMAT-CONTROL".to_string(),
        EvalResult::String(msg.to_string()),
    );
    slots.insert("FORMAT-ARGUMENTS".to_string(), EvalResult::Nil);
    if type_name == "UNDEFINED-FUNCTION" || type_name == "UNBOUND-VARIABLE" {
        let prefix = if type_name == "UNDEFINED-FUNCTION" {
            "Undefined function "
        } else {
            "Unbound variable "
        };
        if let Some(raw_name) = msg.trim().strip_prefix(prefix) {
            let name = raw_name
                .split_whitespace()
                .next()
                .unwrap_or("")
                .trim_matches(|c: char| c == '(' || c == ')' || c == '\'' || c == '"');
            if !name.is_empty() {
                slots.insert("NAME".to_string(), EvalResult::Symbol(name.to_ascii_uppercase()));
            }
        }
    }
    EvalResult::Condition(Rc::new(RefCell::new(ConditionInstance {
        type_name: type_name.to_string(),
        slots,
    })))
}

/// Global condition type registry
thread_local! {
    pub static CONDITION_TYPES: RefCell<HashMap<String, ConditionType>> = {
        let mut map = HashMap::new();
        // Built-in condition types
        map.insert("CONDITION".to_string(), ConditionType {
            name: "CONDITION".to_string(),
            parent_types: vec![],
            slots: vec![],
            report_fn: None,
            documentation: Some("The base condition type".to_string()),
        });
        map.insert("SERIOUS-CONDITION".to_string(), ConditionType {
            name: "SERIOUS-CONDITION".to_string(),
            parent_types: vec!["CONDITION".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: Some("Conditions that require handling".to_string()),
        });
        map.insert("ERROR".to_string(), ConditionType {
            name: "ERROR".to_string(),
            parent_types: vec!["SERIOUS-CONDITION".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: Some("Error conditions".to_string()),
        });
        map.insert("PROGRAM-ERROR".to_string(), ConditionType {
            name: "PROGRAM-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: Some("Program error conditions".to_string()),
        });
        map.insert("WARNING".to_string(), ConditionType {
            name: "WARNING".to_string(),
            parent_types: vec!["CONDITION".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: Some("Warning conditions".to_string()),
        });
        map.insert("STYLE-WARNING".to_string(), ConditionType {
            name: "STYLE-WARNING".to_string(),
            parent_types: vec!["WARNING".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: Some("Style warning conditions".to_string()),
        });
        map.insert("SIMPLE-CONDITION".to_string(), ConditionType {
            name: "SIMPLE-CONDITION".to_string(),
            parent_types: vec!["CONDITION".to_string()],
            slots: vec![
                ConditionSlot {
                    name: "FORMAT-CONTROL".to_string(),
                    initarg: Some(":FORMAT-CONTROL".to_string()),
                    initform: None,
                    reader: Some("SIMPLE-CONDITION-FORMAT-CONTROL".to_string()),
                    writer: None,
                    accessor: None,
                },
                ConditionSlot {
                    name: "FORMAT-ARGUMENTS".to_string(),
                    initarg: Some(":FORMAT-ARGUMENTS".to_string()),
                    initform: Some(ASTNode::nil()),
                    reader: Some("SIMPLE-CONDITION-FORMAT-ARGUMENTS".to_string()),
                    writer: None,
                    accessor: None,
                },
            ],
            report_fn: None,
            documentation: Some("Condition with format-control and format-arguments".to_string()),
        });
        map.insert("SIMPLE-ERROR".to_string(), ConditionType {
            name: "SIMPLE-ERROR".to_string(),
            parent_types: vec!["SIMPLE-CONDITION".to_string(), "ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("SIMPLE-WARNING".to_string(), ConditionType {
            name: "SIMPLE-WARNING".to_string(),
            parent_types: vec!["SIMPLE-CONDITION".to_string(), "WARNING".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("SIMPLE-STYLE-WARNING".to_string(), ConditionType {
            name: "SIMPLE-STYLE-WARNING".to_string(),
            parent_types: vec!["SIMPLE-CONDITION".to_string(), "STYLE-WARNING".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("TYPE-ERROR".to_string(), ConditionType {
            name: "TYPE-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![
                ConditionSlot {
                    name: "DATUM".to_string(),
                    initarg: Some(":DATUM".to_string()),
                    initform: None,
                    reader: Some("TYPE-ERROR-DATUM".to_string()),
                    writer: None,
                    accessor: None,
                },
                ConditionSlot {
                    name: "EXPECTED-TYPE".to_string(),
                    initarg: Some(":EXPECTED-TYPE".to_string()),
                    initform: None,
                    reader: Some("TYPE-ERROR-EXPECTED-TYPE".to_string()),
                    writer: None,
                    accessor: None,
                },
            ],
            report_fn: None,
            documentation: None,
        });
        map.insert("PARSE-ERROR".to_string(), ConditionType {
            name: "PARSE-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("DIVISION-BY-ZERO".to_string(), ConditionType {
            name: "DIVISION-BY-ZERO".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("ARITHMETIC-ERROR".to_string(), ConditionType {
            name: "ARITHMETIC-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        for name in [
            "FLOATING-POINT-OVERFLOW",
            "FLOATING-POINT-INEXACT",
            "FLOATING-POINT-INVALID-OPERATION",
        ] {
            map.insert(name.to_string(), ConditionType {
                name: name.to_string(),
                parent_types: vec!["ARITHMETIC-ERROR".to_string()],
                slots: vec![],
                report_fn: None,
                documentation: None,
            });
        }
        map.insert("CELL-ERROR".to_string(), ConditionType {
            name: "CELL-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![
                ConditionSlot {
                    name: "NAME".to_string(),
                    initarg: Some(":NAME".to_string()),
                    initform: None,
                    reader: Some("CELL-ERROR-NAME".to_string()),
                    writer: None,
                    accessor: None,
                },
            ],
            report_fn: None,
            documentation: None,
        });
        map.insert("UNBOUND-VARIABLE".to_string(), ConditionType {
            name: "UNBOUND-VARIABLE".to_string(),
            parent_types: vec!["CELL-ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("UNDEFINED-FUNCTION".to_string(), ConditionType {
            name: "UNDEFINED-FUNCTION".to_string(),
            parent_types: vec!["CELL-ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("UNBOUND-SLOT".to_string(), ConditionType {
            name: "UNBOUND-SLOT".to_string(),
            parent_types: vec!["CELL-ERROR".to_string()],
            slots: vec![
                ConditionSlot {
                    name: "INSTANCE".to_string(),
                    initarg: Some(":INSTANCE".to_string()),
                    initform: None,
                    reader: Some("UNBOUND-SLOT-INSTANCE".to_string()),
                    writer: None,
                    accessor: None,
                },
            ],
            report_fn: None,
            documentation: None,
        });
        map.insert("STREAM-ERROR".to_string(), ConditionType {
            name: "STREAM-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![
                ConditionSlot {
                    name: "STREAM".to_string(),
                    initarg: Some(":STREAM".to_string()),
                    initform: None,
                    reader: Some("STREAM-ERROR-STREAM".to_string()),
                    writer: None,
                    accessor: None,
                },
            ],
            report_fn: None,
            documentation: None,
        });
        map.insert("END-OF-FILE".to_string(), ConditionType {
            name: "END-OF-FILE".to_string(),
            parent_types: vec!["STREAM-ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("STREAM-DECODING-ERROR".to_string(), ConditionType {
            name: "STREAM-DECODING-ERROR".to_string(),
            parent_types: vec!["STREAM-ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("READER-ERROR".to_string(), ConditionType {
            name: "READER-ERROR".to_string(),
            parent_types: vec!["PARSE-ERROR".to_string(), "STREAM-ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("FILE-ERROR".to_string(), ConditionType {
            name: "FILE-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![
                ConditionSlot {
                    name: "PATHNAME".to_string(),
                    initarg: Some(":PATHNAME".to_string()),
                    initform: None,
                    reader: Some("FILE-ERROR-PATHNAME".to_string()),
                    writer: None,
                    accessor: None,
                },
            ],
            report_fn: None,
            documentation: None,
        });
        map.insert("PACKAGE-ERROR".to_string(), ConditionType {
            name: "PACKAGE-ERROR".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        map.insert("NOT-ATOMIC".to_string(), ConditionType {
            name: "NOT-ATOMIC".to_string(),
            parent_types: vec!["ERROR".to_string()],
            slots: vec![ConditionSlot {
                name: "PLACE".to_string(),
                initarg: Some(":PLACE".to_string()),
                initform: None,
                reader: Some("MP:NOT-ATOMIC-PLACE".to_string()),
                writer: None,
                accessor: None,
            }],
            report_fn: None,
            documentation: None,
        });
        map.insert("NAME-CONFLICT".to_string(), ConditionType {
            name: "NAME-CONFLICT".to_string(),
            parent_types: vec!["PACKAGE-ERROR".to_string()],
            slots: vec![
                ConditionSlot {
                    name: "CANDIDATES".to_string(),
                    initarg: Some(":CANDIDATES".to_string()),
                    initform: Some(ASTNode::nil()),
                    reader: Some("NAME-CONFLICT-CANDIDATES".to_string()),
                    writer: None,
                    accessor: None,
                },
            ],
            report_fn: None,
            documentation: None,
        });
        map.insert("PACKAGE-LOCK-VIOLATION".to_string(), ConditionType {
            name: "PACKAGE-LOCK-VIOLATION".to_string(),
            parent_types: vec!["PACKAGE-ERROR".to_string()],
            slots: vec![],
            report_fn: None,
            documentation: None,
        });
        RefCell::new(map)
    };
}

/// A handler binding for handler-bind
#[derive(Clone)]
pub struct Handler {
    pub condition_type: String,
    pub handler_fn: ASTNode,
    pub handler_value: Option<EvalResult>,
    pub env: Rc<RefCell<HashMap<String, EvalResult>>>,
    pub was_invoked: Rc<Cell<bool>>,
}

/// A restart definition for restart-case
#[derive(Clone)]
pub struct Restart {
    pub name: String,
    pub function: ASTNode,
    pub env: Rc<RefCell<HashMap<String, EvalResult>>>,
    pub interactive: Option<ASTNode>,
    pub report: Option<ASTNode>,
    pub test: Option<ASTNode>,
}

/// Handler stack for dynamic handler binding
thread_local! {
    pub static HANDLER_STACK: RefCell<Vec<Vec<Handler>>> = RefCell::new(Vec::new());
    pub static RESTART_STACK: RefCell<Vec<Vec<Restart>>> = RefCell::new(Vec::new());
    static LAST_RESTART_INVOCATION: RefCell<Option<(String, EvalResult)>> = RefCell::new(None);
    static PENDING_SIGNAL_CONDITION: RefCell<Option<EvalResult>> = RefCell::new(None);
    static IGNORE_ERRORS_DEPTH: std::cell::Cell<u32> = const { std::cell::Cell::new(0) };
}

fn encode_restart_value(val: &EvalResult) -> String {
    match val {
        EvalResult::Fixnum(n) => format!("FIXNUM:{}", n),
        EvalResult::Float(f) => format!("FLOAT:{}", f),
        EvalResult::Bool(b) | EvalResult::Boolean(b) => format!("BOOL:{}", b),
        EvalResult::Nil => "NIL".to_string(),
        EvalResult::String(s) => format!("STRING:{}", s),
        EvalResult::Symbol(s) => format!("SYMBOL:{}", s),
        _ => super::eval_types::stash_nonlocal_return_value(val),
    }
}

fn decode_restart_value(encoded: &str) -> Result<EvalResult, String> {
    if encoded == "NIL" {
        return Ok(EvalResult::Nil);
    }
    if let Some(rest) = encoded.strip_prefix("FIXNUM:") {
        return rest
            .parse::<i64>()
            .map(EvalResult::Fixnum)
            .map_err(|_| "Invalid FIXNUM in restart transfer".to_string());
    }
    if let Some(rest) = encoded.strip_prefix("FLOAT:") {
        return rest
            .parse::<f64>()
            .map(EvalResult::Float)
            .map_err(|_| "Invalid FLOAT in restart transfer".to_string());
    }
    if let Some(rest) = encoded.strip_prefix("BOOL:") {
        return match rest {
            "true" => Ok(EvalResult::Boolean(true)),
            "false" => Ok(EvalResult::Nil),
            _ => Err("Invalid BOOL in restart transfer".to_string()),
        };
    }
    if let Some(rest) = encoded.strip_prefix("STRING:") {
        return Ok(EvalResult::String(rest.to_string()));
    }
    if let Some(rest) = encoded.strip_prefix("SYMBOL:") {
        return Ok(EvalResult::Symbol(rest.to_string()));
    }
    super::eval_types::take_nonlocal_return_value(encoded)
        .ok_or_else(|| "Missing restart transfer value".to_string())
}

pub(super) fn extract_restart_transfer_payload<'a>(
    err: &'a str,
    expected_name: &str,
) -> Option<&'a str> {
    let trimmed = err.split(" (callee ast:").next().unwrap_or(err).trim();
    let rest = trimmed.strip_prefix("INVOKE-RESTART:")?;
    let (restart_name, payload) = rest.split_once(':')?;
    if restart_name.eq_ignore_ascii_case(expected_name) {
        Some(payload)
    } else {
        None
    }
}

pub fn clear_last_restart_invocation() {
    LAST_RESTART_INVOCATION.with(|slot| {
        *slot.borrow_mut() = None;
    });
}

pub fn take_last_restart_invocation() -> Option<(String, EvalResult)> {
    LAST_RESTART_INVOCATION.with(|slot| slot.borrow_mut().take())
}

pub fn set_pending_signaled_condition(condition: EvalResult) {
    PENDING_SIGNAL_CONDITION.with(|slot| {
        *slot.borrow_mut() = Some(condition);
    });
}

pub fn take_pending_signaled_condition() -> Option<EvalResult> {
    PENDING_SIGNAL_CONDITION.with(|slot| slot.borrow_mut().take())
}

pub fn push_ignore_errors_trap() {
    IGNORE_ERRORS_DEPTH.with(|depth| depth.set(depth.get().saturating_add(1)));
}

pub fn pop_ignore_errors_trap() {
    IGNORE_ERRORS_DEPTH.with(|depth| {
        depth.set(depth.get().saturating_sub(1));
    });
}

fn ignore_errors_traps_condition(condition_type: &str) -> bool {
    IGNORE_ERRORS_DEPTH
        .with(|depth| depth.get() > 0 && handler_matches_condition("ERROR", condition_type))
}

/// Push a handler cluster onto the stack
pub fn push_handlers(handlers: Vec<Handler>) {
    HANDLER_STACK.with(|stack| {
        stack.borrow_mut().push(handlers);
    });
}

/// Pop a handler cluster from the stack
pub fn pop_handlers() {
    HANDLER_STACK.with(|stack| {
        stack.borrow_mut().pop();
    });
}

/// Push a restart cluster onto the stack
pub fn push_restarts(restarts: Vec<Restart>) {
    RESTART_STACK.with(|stack| {
        stack.borrow_mut().push(restarts);
    });
}

/// Pop a restart cluster from the stack
pub fn pop_restarts() {
    RESTART_STACK.with(|stack| {
        stack.borrow_mut().pop();
    });
}

/// Find a restart by name
pub fn find_restart_by_name(name: &str) -> Option<Restart> {
    let name_upper = name.rsplit(':').next().unwrap_or(name).to_uppercase();
    RESTART_STACK.with(|stack| {
        let stack = stack.borrow();
        // Search from innermost to outermost
        for cluster in stack.iter().rev() {
            for restart in cluster.iter().rev() {
                let restart_name = restart
                    .name
                    .rsplit(':')
                    .next()
                    .unwrap_or(restart.name.as_str())
                    .to_uppercase();
                if restart_name == name_upper {
                    return Some(restart.clone());
                }
            }
        }
        None
    })
}

/// Get all active restarts
pub fn compute_all_restarts() -> Vec<Restart> {
    RESTART_STACK.with(|stack| {
        let stack = stack.borrow();
        let mut restarts = Vec::new();
        for cluster in stack.iter() {
            for restart in cluster.iter() {
                restarts.push(restart.clone());
            }
        }
        restarts
    })
}

/// Parse a slot specification from define-condition
fn parse_slot_spec(spec: &ASTNode) -> Option<ConditionSlot> {
    match spec {
        ASTNode::Variable(name) => {
            // Simple slot: just a name
            Some(ConditionSlot {
                name: name.to_uppercase(),
                initarg: None,
                initform: None,
                reader: None,
                writer: None,
                accessor: None,
            })
        }
        ASTNode::Call { function, args } => {
            // Complex slot: (name :initarg :foo :reader bar ...)
            let name = match function.as_ref() {
                ASTNode::Variable(n) => n.to_uppercase(),
                _ => return None,
            };

            let mut slot = ConditionSlot {
                name,
                initarg: None,
                initform: None,
                reader: None,
                writer: None,
                accessor: None,
            };

            // Parse keyword options
            let normalize_key = |raw: &str| -> String {
                raw.rsplit(':')
                    .next()
                    .unwrap_or(raw)
                    .trim_start_matches(':')
                    .to_ascii_lowercase()
            };
            let mut i = 0;
            while i < args.len() {
                let key = match &args[i] {
                    ASTNode::Variable(kw) => normalize_key(kw),
                    ASTNode::Constant(ConstantValue::Symbol(kw)) => normalize_key(kw),
                    _ => {
                        i += 1;
                        continue;
                    }
                };
                match key.as_str() {
                    "initarg" => {
                        if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                            slot.initarg = Some(v.to_uppercase());
                            i += 1;
                        } else if let Some(ASTNode::Constant(ConstantValue::Symbol(v))) =
                            args.get(i + 1)
                        {
                            slot.initarg = Some(v.to_uppercase());
                            i += 1;
                        }
                    }
                    "initform" => {
                        if let Some(form) = args.get(i + 1) {
                            slot.initform = Some(form.clone());
                            i += 1;
                        }
                    }
                    "reader" => {
                        if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                            slot.reader = Some(v.to_uppercase());
                            i += 1;
                        } else if let Some(ASTNode::Constant(ConstantValue::Symbol(v))) =
                            args.get(i + 1)
                        {
                            slot.reader = Some(v.to_uppercase());
                            i += 1;
                        }
                    }
                    "writer" => {
                        if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                            slot.writer = Some(v.to_uppercase());
                            i += 1;
                        } else if let Some(ASTNode::Constant(ConstantValue::Symbol(v))) =
                            args.get(i + 1)
                        {
                            slot.writer = Some(v.to_uppercase());
                            i += 1;
                        }
                    }
                    "accessor" => {
                        if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                            slot.accessor = Some(v.to_uppercase());
                            i += 1;
                        } else if let Some(ASTNode::Constant(ConstantValue::Symbol(v))) =
                            args.get(i + 1)
                        {
                            slot.accessor = Some(v.to_uppercase());
                            i += 1;
                        }
                    }
                    _ => {}
                }
                i += 1;
            }

            Some(slot)
        }
        _ => None,
    }
}

fn list_items_from_ast(ast: &ASTNode) -> Option<Vec<ASTNode>> {
    match ast {
        ASTNode::Constant(ConstantValue::Nil) => Some(Vec::new()),
        ASTNode::DottedPair { car, cdr } => {
            let mut items = vec![(**car).clone()];
            let mut tail = list_items_from_ast(cdr)?;
            items.append(&mut tail);
            Some(items)
        }
        ASTNode::Call { function, args } => {
            let mut items = vec![(**function).clone()];
            items.extend(args.iter().cloned());
            Some(items)
        }
        _ => None,
    }
}

fn normalize_condition_initarg(raw: &str) -> String {
    raw.trim_start_matches('\'')
        .trim_start_matches(':')
        .rsplit(':')
        .next()
        .unwrap_or(raw)
        .to_uppercase()
}

fn install_condition_reader_function(
    env: &mut HashMap<String, EvalResult>,
    reader_name: &str,
    slot_name: &str,
) {
    let lambda = EvalResult::Lambda {
        params: vec!["condition".to_string()],
        defaults: HashMap::new(),
        supplied_p_vars: HashMap::new(),
        key_params: HashMap::new(),
        body: vec![ASTNode::Call {
            function: Box::new(ASTNode::Variable("slot-value".to_string())),
            args: vec![
                ASTNode::Variable("condition".to_string()),
                ASTNode::Quote(Box::new(ASTNode::Variable(slot_name.to_string()))),
            ],
        }],
        env: Rc::new(RefCell::new(HashMap::new())),
        dynamic_env: false,
    };
    super::eval_core::assign_setq_like(
        &format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, reader_name),
        lambda.clone(),
        env,
    );
    let reader_base = reader_name.rsplit(':').next().unwrap_or(reader_name);
    if reader_base != reader_name {
        super::eval_core::assign_setq_like(
            &format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, reader_base),
            lambda,
            env,
        );
    }
}

fn install_condition_writer_function(
    env: &mut HashMap<String, EvalResult>,
    writer_name: &str,
    slot_name: &str,
) {
    let lambda = EvalResult::Lambda {
        params: vec!["new-value".to_string(), "condition".to_string()],
        defaults: HashMap::new(),
        supplied_p_vars: HashMap::new(),
        key_params: HashMap::new(),
        body: vec![ASTNode::Call {
            function: Box::new(ASTNode::Variable("set-slot-value".to_string())),
            args: vec![
                ASTNode::Variable("condition".to_string()),
                ASTNode::Quote(Box::new(ASTNode::Variable(slot_name.to_string()))),
                ASTNode::Variable("new-value".to_string()),
            ],
        }],
        env: Rc::new(RefCell::new(HashMap::new())),
        dynamic_env: false,
    };
    super::eval_core::assign_setq_like(
        &format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, writer_name),
        lambda.clone(),
        env,
    );
    let writer_base = writer_name.rsplit(':').next().unwrap_or(writer_name);
    if writer_base != writer_name {
        super::eval_core::assign_setq_like(
            &format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, writer_base),
            lambda,
            env,
        );
    }
}

fn install_condition_accessors(env: &mut HashMap<String, EvalResult>, slots: &[ConditionSlot]) {
    for slot in slots {
        if let Some(accessor_name) = slot.accessor.as_deref() {
            install_condition_reader_function(env, accessor_name, &slot.name);
            install_condition_writer_function(
                env,
                &format!("(setf {})", accessor_name),
                &slot.name,
            );
            let accessor_base = accessor_name.rsplit(':').next().unwrap_or(accessor_name);
            if accessor_base != accessor_name {
                install_condition_writer_function(
                    env,
                    &format!("(setf {})", accessor_base),
                    &slot.name,
                );
            }
        }
        if let Some(reader_name) = slot.reader.as_deref() {
            install_condition_reader_function(env, reader_name, &slot.name);
        }
        if let Some(writer_name) = slot.writer.as_deref() {
            install_condition_writer_function(env, writer_name, &slot.name);
        }
    }
}

fn collect_effective_condition_slots(
    type_name: &str,
    registry: &HashMap<String, ConditionType>,
    slots: &mut Vec<ConditionSlot>,
    visiting: &mut std::collections::HashSet<String>,
) {
    let key = type_name.to_uppercase();
    if !visiting.insert(key.clone()) {
        return;
    }
    let Some(cond_type) = registry.get(&key) else {
        return;
    };
    for parent in &cond_type.parent_types {
        collect_effective_condition_slots(parent, registry, slots, visiting);
    }
    for slot in &cond_type.slots {
        if let Some(existing) = slots
            .iter_mut()
            .find(|existing| existing.name.eq_ignore_ascii_case(&slot.name))
        {
            *existing = slot.clone();
        } else {
            slots.push(slot.clone());
        }
    }
}

/// Evaluate (define-condition name (parents...) (slots...) options...)
pub fn eval_define_condition(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("define-condition requires a name".to_string());
    }

    // Get condition name
    let name = match &args[0] {
        ASTNode::Variable(n) => n.to_uppercase(),
        _ => return Err("define-condition: name must be a symbol".to_string()),
    };

    // Get parent types (default to CONDITION if none specified)
    let parent_types: Vec<String> = if args.len() > 1 {
        let parents = list_items_from_ast(&args[1]).unwrap_or_default();
        let parsed: Vec<String> = parents
            .iter()
            .filter_map(|p| match p {
                ASTNode::Variable(n) => Some(n.to_uppercase()),
                ASTNode::Constant(ConstantValue::Symbol(n)) => Some(n.to_uppercase()),
                _ => None,
            })
            .collect();
        if parsed.is_empty() {
            vec!["CONDITION".to_string()]
        } else {
            parsed
        }
    } else {
        vec!["CONDITION".to_string()]
    };

    // Get slots
    let slots: Vec<ConditionSlot> = if args.len() > 2 {
        list_items_from_ast(&args[2])
            .unwrap_or_default()
            .iter()
            .filter_map(parse_slot_spec)
            .collect()
    } else {
        vec![]
    };

    // Parse options (:report, :documentation)
    let mut report_fn = None;
    let mut documentation = None;

    let normalize_key = |raw: &str| -> String {
        raw.rsplit(':')
            .next()
            .unwrap_or(raw)
            .trim_start_matches(':')
            .to_ascii_lowercase()
    };
    let mut i = 3;
    while i < args.len() {
        let key = match &args[i] {
            ASTNode::Variable(kw) => normalize_key(kw),
            ASTNode::Constant(ConstantValue::Symbol(kw)) => normalize_key(kw),
            _ => {
                i += 1;
                continue;
            }
        };
        match key.as_str() {
            "report" => {
                if let Some(form) = args.get(i + 1) {
                    report_fn = Some(form.clone());
                    i += 1;
                }
            }
            "documentation" => {
                if let Some(ASTNode::Constant(crate::ir::ConstantValue::String(s))) =
                    args.get(i + 1)
                {
                    documentation = Some(s.clone());
                    i += 1;
                }
            }
            _ => {}
        }
        i += 1;
    }

    // Create the condition type
    let condition_type = ConditionType {
        name: name.clone(),
        parent_types,
        slots,
        report_fn,
        documentation,
    };

    // Register the condition type
    CONDITION_TYPES.with(|types| {
        types.borrow_mut().insert(name.clone(), condition_type);
    });

    // Also intern the symbol in the current package
    PACKAGES.with(|p| {
        let current_pkg = get_current_package();
        let mut packages = p.borrow_mut();
        if let Some(pkg) = packages.get_mut(&current_pkg) {
            pkg.add_internal_symbol(&name);
        }
    });

    CONDITION_TYPES.with(|types| {
        if let Some(cond_type) = types.borrow().get(&name).cloned() {
            install_condition_accessors(env, &cond_type.slots);
        }
    });

    Ok(EvalResult::Symbol(name))
}

/// Evaluate (make-condition type &rest initargs)
pub fn eval_make_condition(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("make-condition requires a type".to_string());
    }

    // Get condition type name
    let type_result = eval_with_env(&args[0], env)?;
    let type_name = match type_result {
        EvalResult::Symbol(n) => {
            let trimmed = n.trim_start_matches(':').trim_start_matches('\'');
            trimmed.rsplit(':').next().unwrap_or(trimmed).to_uppercase()
        }
        _ => return Err("make-condition: type must be a symbol".to_string()),
    };

    let effective_slots = CONDITION_TYPES.with(|types| {
        let types = types.borrow();
        if !types.contains_key(&type_name) {
            return None;
        }
        let mut slots = Vec::new();
        let mut visiting = std::collections::HashSet::new();
        collect_effective_condition_slots(&type_name, &types, &mut slots, &mut visiting);
        Some(slots)
    });

    let effective_slots = effective_slots
        .ok_or_else(|| format!("make-condition: unknown condition type {}", type_name))?;
    install_condition_accessors(env, &effective_slots);

    // Parse initargs
    let mut provided_initargs: HashMap<String, EvalResult> = HashMap::new();
    let mut i = 1;
    while i < args.len() {
        let key = eval_with_env(&args[i], env)?;
        if let EvalResult::Symbol(k) = key {
            let key_name = normalize_condition_initarg(&k);
            if i + 1 < args.len() {
                let value = eval_with_env(&args[i + 1], env)?;
                provided_initargs.insert(key_name, value);
                i += 2;
            } else {
                i += 1;
            }
        } else {
            i += 1;
        }
    }

    let mut slot_values: HashMap<String, EvalResult> = HashMap::new();
    for slot in effective_slots {
        let explicit_value = slot
            .initarg
            .as_deref()
            .map(normalize_condition_initarg)
            .and_then(|key| provided_initargs.get(&key).cloned())
            .or_else(|| provided_initargs.get(&slot.name).cloned());
        if let Some(value) = explicit_value {
            slot_values.insert(slot.name.clone(), value);
        } else if let Some(initform) = slot.initform.as_ref() {
            let value = eval_with_env(initform, env)?;
            slot_values.insert(slot.name.clone(), value);
        }
    }

    // Create the condition instance
    if std::env::var("RLASP_DEBUG_CIRCULAR_CONDITION").is_ok()
        && type_name.eq_ignore_ascii_case("CIRCULAR-DEPENDENCY")
    {
        eprintln!("[circular-condition] slots={:?}", slot_values);
    }
    let instance = ConditionInstance {
        type_name: type_name.clone(),
        slots: slot_values,
    };

    // Return as a special condition result
    Ok(EvalResult::Condition(Rc::new(RefCell::new(instance))))
}

/// Check if a condition is of a given type
pub fn condition_typep(condition: &ConditionInstance, type_name: &str) -> bool {
    let normalized_type = type_name
        .trim_start_matches('\'')
        .trim_start_matches(':')
        .rsplit(':')
        .next()
        .unwrap_or(type_name)
        .to_uppercase();
    CONDITION_TYPES.with(|types| {
        let types = types.borrow();
        if let Some(cond_type) = types.get(&condition.type_name) {
            cond_type.is_subtype_of(&normalized_type, &types)
        } else {
            false
        }
    })
}

fn handler_matches_condition(handler_type: &str, condition_type: &str) -> bool {
    let handler_upper = handler_type
        .trim_start_matches('\'')
        .trim_start_matches(':')
        .rsplit(':')
        .next()
        .unwrap_or(handler_type)
        .to_uppercase();
    let condition_upper = condition_type
        .trim_start_matches('\'')
        .trim_start_matches(':')
        .rsplit(':')
        .next()
        .unwrap_or(condition_type)
        .to_uppercase();
    if handler_upper == "T" || handler_upper == "CONDITION" {
        return true;
    }
    CONDITION_TYPES.with(|types| {
        let types = types.borrow();
        if let Some(cond_type) = types.get(&condition_upper) {
            cond_type.is_subtype_of(&handler_upper, &types)
        } else {
            handler_upper == condition_upper
        }
    })
}

fn invoke_handler_function(
    handler_fn: &ASTNode,
    condition: &EvalResult,
    condition_type: &str,
    call_env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    let arg = condition.clone();
    match handler_fn {
        ASTNode::Lambda { .. } => {
            let lambda = eval_with_env(handler_fn, call_env)?;
            let closure_env = match &lambda {
                EvalResult::Lambda { env, .. } => Some(env.clone()),
                _ => None,
            };
            let result = super::eval_system::call_function_with_values(lambda, &[arg], call_env);
            if std::env::var("RLASP_DEBUG_HANDLER_SYNC").is_ok() {
                eprintln!(
                    "[invoke-handler after-call] call-out={:?}",
                    call_env.get("out")
                );
            }
            if let Some(closure_env) = closure_env {
                if let Ok(closure_env) = closure_env.try_borrow() {
                    if std::env::var("RLASP_DEBUG_HANDLER_SYNC").is_ok() {
                        eprintln!(
                            "[invoke-handler closure] closure-out={:?} shadow-out={:?}",
                            closure_env.get("out"),
                            closure_env.get(&format!(
                                "{}out",
                                super::eval_core::SHADOWED_LEXICAL_CAPTURE_PREFIX
                            ))
                        );
                    }
                    let shadow_updates: Vec<(String, EvalResult)> = closure_env
                        .iter()
                        .filter_map(|(key, value)| {
                            key.strip_prefix(super::eval_core::SHADOWED_LEXICAL_CAPTURE_PREFIX)
                                .map(|plain| (plain.to_string(), value.clone()))
                        })
                        .collect();
                    for (key, value) in closure_env.iter() {
                        if call_env.contains_key(key) {
                            call_env.insert(key.clone(), value.clone());
                        }
                    }
                    for (plain, value) in shadow_updates {
                        call_env.insert(plain, value);
                    }
                    if std::env::var("RLASP_DEBUG_HANDLER_SYNC").is_ok() {
                        eprintln!(
                            "[invoke-handler after-closure-sync] call-out={:?}",
                            call_env.get("out")
                        );
                    }
                }
            }
            return result;
        }
        ASTNode::Variable(name) => {
            let base = name.rsplit(':').next().unwrap_or(name.as_str());
            let fn_candidates = [
                format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, name),
                format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, base),
                format!(
                    "{}{}",
                    super::eval_core::FUNCTION_NS_PREFIX,
                    name.to_ascii_uppercase()
                ),
                format!(
                    "{}{}",
                    super::eval_core::FUNCTION_NS_PREFIX,
                    base.to_ascii_uppercase()
                ),
                format!(
                    "{}{}",
                    super::eval_core::FUNCTION_NS_PREFIX,
                    name.to_ascii_lowercase()
                ),
                format!(
                    "{}{}",
                    super::eval_core::FUNCTION_NS_PREFIX,
                    base.to_ascii_lowercase()
                ),
            ];
            if let Some(fn_val) = fn_candidates
                .iter()
                .find_map(|candidate| call_env.get(candidate).cloned())
                .or_else(|| {
                    let base_lower = base.to_ascii_lowercase();
                    if rlasp_runtime::is_cl_builtin(base)
                        || rlasp_runtime::is_cl_builtin(base_lower.as_str())
                    {
                        Some(EvalResult::BuiltinFunction(base_lower))
                    } else {
                        None
                    }
                })
            {
                return super::eval_system::call_function_with_values(fn_val, &[arg], call_env);
            }
        }
        ASTNode::Call { function, args }
            if matches!(function.as_ref(), ASTNode::Variable(name) if name.eq_ignore_ascii_case("function"))
                && args.len() == 1 =>
        {
            return invoke_handler_function(&args[0], condition, condition_type, call_env);
        }
        _ => {}
    }

    let call = ASTNode::Call {
        function: Box::new(handler_fn.clone()),
        args: vec![match condition {
            EvalResult::Condition(_) => ASTNode::Variable("__condition__".to_string()),
            _ => ASTNode::Variable(condition_type.to_string()),
        }],
    };
    eval_with_env(&call, call_env)
}

fn sync_handler_lambda_closure_into_call_env(
    handler_value: &EvalResult,
    call_env: &mut HashMap<String, EvalResult>,
) {
    let Some(closure_env) = (match handler_value {
        EvalResult::Lambda { env, .. } => Some(env.clone()),
        _ => None,
    }) else {
        return;
    };
    let Ok(closure_env) = closure_env.try_borrow() else {
        return;
    };
    let shadow_updates: Vec<(String, EvalResult)> = closure_env
        .iter()
        .filter_map(|(key, value)| {
            key.strip_prefix(super::eval_core::SHADOWED_LEXICAL_CAPTURE_PREFIX)
                .map(|plain| (plain.to_string(), value.clone()))
        })
        .collect();
    for (key, value) in closure_env.iter() {
        if call_env.contains_key(key) {
            call_env.insert(key.clone(), value.clone());
        }
    }
    for (plain, value) in shadow_updates {
        call_env.insert(plain, value);
    }
}

fn snapshot_handler_lambda_env(handler_value: &EvalResult) -> Option<HashMap<String, EvalResult>> {
    let EvalResult::Lambda { env, .. } = handler_value else {
        return None;
    };
    let Ok(env) = env.try_borrow() else {
        return None;
    };
    Some(env.clone())
}

/// Evaluate (signal condition)
pub fn eval_signal(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("signal requires a condition".to_string());
    }

    let condition = eval_with_env(&args[0], env)?;

    // Get the condition type name
    let condition_type = match &condition {
        EvalResult::Condition(c) => c.borrow().type_name.clone(),
        EvalResult::Symbol(s) => s
            .trim_start_matches(':')
            .trim_start_matches('\'')
            .to_uppercase(),
        _ => return Ok(EvalResult::Nil),
    };

    // Walk the handler stack from innermost to outermost
    let matching_handler = HANDLER_STACK.with(|stack| {
        let stack = stack.borrow();
        for cluster in stack.iter().rev() {
            for handler in cluster.iter().rev() {
                if handler_matches_condition(&handler.condition_type, &condition_type) {
                    return Some(handler.clone());
                }
            }
        }
        None
    });

    // If we found a matching handler, invoke it
    if let Some(handler) = matching_handler {
        let handler_seed = handler.env.borrow().clone();
        let mut tracked_keys: std::collections::HashSet<String> =
            handler_seed.keys().cloned().collect();
        tracked_keys.extend(env.keys().cloned());
        let mut call_env = handler_seed.clone();
        for (key, value) in env.iter() {
            let keep_handler_lexical = handler_seed.contains_key(key)
                && !key.starts_with('*')
                && !key.starts_with('%')
                && !key.contains(':')
                && !super::eval_types::is_special_variable(key)
                && key != "__condition__";
            if keep_handler_lexical {
                continue;
            }
            call_env.insert(key.clone(), value.clone());
        }

        // Store condition in env for the call
        if let EvalResult::Condition(c) = &condition {
            call_env.insert(
                "__condition__".to_string(),
                EvalResult::Condition(c.clone()),
            );
        }

        let call_result = if let Some(handler_value) = handler.handler_value.clone() {
            let result = super::eval_system::call_function_with_values(
                handler_value.clone(),
                &[condition.clone()],
                &mut call_env,
            );
            sync_handler_lambda_closure_into_call_env(&handler_value, &mut call_env);
            result
        } else {
            invoke_handler_function(
                &handler.handler_fn,
                &condition,
                &condition_type,
                &mut call_env,
            )
        };
        let shadow_updates: Vec<(String, EvalResult)> = call_env
            .iter()
            .filter_map(|(key, value)| {
                key.strip_prefix(super::eval_core::SHADOWED_LEXICAL_CAPTURE_PREFIX)
                    .map(|plain| (plain.to_string(), value.clone()))
            })
            .collect();
        for (plain, value) in shadow_updates {
            tracked_keys.insert(plain.clone());
            call_env.insert(plain, value);
        }
        let persisted_source = handler
            .handler_value
            .as_ref()
            .and_then(snapshot_handler_lambda_env)
            .unwrap_or_else(|| call_env.clone());
        let mut persisted_handler_env = handler.env.borrow_mut();
        let mut new_persisted_handler_env = persisted_source;
        new_persisted_handler_env.remove("__condition__");
        *persisted_handler_env = new_persisted_handler_env;
        for key in tracked_keys {
            if key == "__condition__" || key.starts_with('%') {
                continue;
            }
            let value = persisted_handler_env
                .get(&key)
                .cloned()
                .or_else(|| call_env.get(&key).cloned());
            let Some(value) = value else {
                continue;
            };
            let env_has_direct = env.contains_key(&key);
            let env_has_shadow = super::eval_core::env_has_shadowed_lexical_capture(env, &key);
            let env_has_captured = super::eval_core::env_has_explicit_captured_lexical(env, &key);
            if env_has_direct || env_has_shadow || env_has_captured {
                env.insert(key.clone(), value.clone());
                if let Some(shadow_key) = super::eval_core::shadowed_lexical_capture_key(&key) {
                    if env.contains_key(&shadow_key) {
                        env.insert(shadow_key, value);
                    }
                }
            }
        }
        if std::env::var("RLASP_DEBUG_HANDLER_SYNC").is_ok() {
            eprintln!(
                "[handler-signal-sync] call-out={:?} persisted-out={:?} env-out={:?}",
                call_env.get("out"),
                persisted_handler_env.get("out"),
                env.get("out")
            );
        }
        call_result?;
    }

    // signal returns nil (unless a handler transfers control)
    Ok(EvalResult::Nil)
}

pub fn signal_condition_value(
    condition: EvalResult,
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // Get the condition type name
    let condition_type = match &condition {
        EvalResult::Condition(c) => c.borrow().type_name.clone(),
        EvalResult::Symbol(s) => s
            .trim_start_matches(':')
            .trim_start_matches('\'')
            .to_uppercase(),
        _ => return Ok(EvalResult::Nil),
    };

    // Walk the handler stack from innermost to outermost
    let matching_handler = HANDLER_STACK.with(|stack| {
        let stack = stack.borrow();
        for cluster in stack.iter().rev() {
            for handler in cluster.iter().rev() {
                if handler_matches_condition(&handler.condition_type, &condition_type) {
                    return Some(handler.clone());
                }
            }
        }
        None
    });

    // If we found a matching handler, invoke it
    if let Some(handler) = matching_handler {
        handler.was_invoked.set(true);
        // Call the handler function with the condition.
        // The handler's lexical environment is established at handler-bind time,
        // but mutations performed by the handler must remain visible to the
        // surrounding dynamic extent. Preserve that by syncing back only the
        // bindings that were already visible before the call.
        let handler_seed = handler.env.borrow().clone();
        let mut tracked_keys: std::collections::HashSet<String> =
            handler_seed.keys().cloned().collect();
        tracked_keys.extend(env.keys().cloned());
        let mut call_env = handler_seed.clone();
        for (key, value) in env.iter() {
            let keep_handler_lexical = handler_seed.contains_key(key)
                && !key.starts_with('*')
                && !key.starts_with('%')
                && !key.contains(':')
                && !super::eval_types::is_special_variable(key)
                && key != "__condition__";
            if keep_handler_lexical {
                continue;
            }
            call_env.insert(key.clone(), value.clone());
        }

        // Store condition in env for the call
        if let EvalResult::Condition(c) = &condition {
            call_env.insert(
                "__condition__".to_string(),
                EvalResult::Condition(c.clone()),
            );
        }

        let call_result = if let Some(handler_value) = handler.handler_value.clone() {
            let result = super::eval_system::call_function_with_values(
                handler_value.clone(),
                &[condition.clone()],
                &mut call_env,
            );
            sync_handler_lambda_closure_into_call_env(&handler_value, &mut call_env);
            result
        } else {
            invoke_handler_function(
                &handler.handler_fn,
                &condition,
                &condition_type,
                &mut call_env,
            )
        };
        let persisted_source = handler
            .handler_value
            .as_ref()
            .and_then(snapshot_handler_lambda_env)
            .unwrap_or_else(|| call_env.clone());
        let mut persisted_handler_env = handler.env.borrow_mut();
        let mut new_persisted_handler_env = persisted_source;
        new_persisted_handler_env.remove("__condition__");
        *persisted_handler_env = new_persisted_handler_env;
        for key in tracked_keys {
            if key == "__condition__" || key.starts_with('%') {
                continue;
            }
            let value = persisted_handler_env
                .get(&key)
                .cloned()
                .or_else(|| call_env.get(&key).cloned());
            let Some(value) = value else {
                continue;
            };
            let env_has_direct = env.contains_key(&key);
            let env_has_shadow = super::eval_core::env_has_shadowed_lexical_capture(env, &key);
            let env_has_captured = super::eval_core::env_has_explicit_captured_lexical(env, &key);
            if env_has_direct || env_has_shadow || env_has_captured {
                env.insert(key.clone(), value.clone());
                if let Some(shadow_key) = super::eval_core::shadowed_lexical_capture_key(&key) {
                    if env.contains_key(&shadow_key) {
                        env.insert(shadow_key, value);
                    }
                }
            }
        }
        if std::env::var("RLASP_DEBUG_HANDLER_SYNC").is_ok() {
            eprintln!(
                "[handler-signal-value-sync] call-out={:?} persisted-out={:?} env-out={:?}",
                call_env.get("out"),
                persisted_handler_env.get("out"),
                env.get("out")
            );
        }
        call_result?;
    }

    if ignore_errors_traps_condition(&condition_type) {
        set_pending_signaled_condition(condition);
        return Ok(EvalResult::Nil);
    }

    Ok(EvalResult::Nil)
}

/// Evaluate (warn datum &rest args)
pub fn eval_warn(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("warn requires a datum".to_string());
    }

    let datum = eval_with_env(&args[0], env)?;

    // Print the warning
    match datum {
        EvalResult::String(s) => {
            eprintln!("WARNING: {}", s);
        }
        EvalResult::Condition(c) => {
            let cond = c.borrow();
            if let Some(fmt) = cond.slots.get("FORMAT-CONTROL") {
                if let EvalResult::String(s) = fmt {
                    eprintln!("WARNING: {}", s);
                } else {
                    eprintln!("WARNING: condition of type {}", cond.type_name);
                }
            } else {
                eprintln!("WARNING: condition of type {}", cond.type_name);
            }
        }
        EvalResult::Symbol(s) => {
            // Assume it's a condition type, create and signal it
            eprintln!("WARNING: {}", s);
        }
        _ => {
            eprintln!("WARNING: {:?}", datum);
        }
    }

    Ok(EvalResult::Nil)
}

/// Evaluate (handler-bind ((condition-type handler-fn) ...) body...)
pub fn eval_handler_bind(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("handler-bind requires at least 1 argument".to_string());
    }

    // Parse handler bindings from first argument
    let mut handlers = Vec::new();

    for binding in list_items_from_ast(&args[0]).unwrap_or_default() {
        let items = list_items_from_ast(&binding).unwrap_or_else(|| match binding {
            ASTNode::Call { function, args } => {
                let mut out = vec![*function];
                out.extend(args);
                out
            }
            other => vec![other],
        });
        if items.len() >= 2 {
            let cond_type = match &items[0] {
                ASTNode::Variable(name) => name
                    .trim_start_matches(':')
                    .rsplit(':')
                    .next()
                    .unwrap_or(name.as_str())
                    .to_uppercase(),
                _ => continue,
            };

            if let Some(handler_fn_node) = items.get(1) {
                let handler_fn = match handler_fn_node {
                    // #'foo / #'(lambda ...) is read as (function foo). Keep symbol
                    // designators wrapped so the ordinary FUNCTION operator can resolve
                    // the function cell; lower literal lambdas directly for handler calls.
                    ASTNode::Call {
                        function: fn_head,
                        args: fn_args,
                    } if matches!(fn_head.as_ref(), ASTNode::Variable(name) if name.eq_ignore_ascii_case("function"))
                        && fn_args.len() == 1 =>
                    {
                        let designator = match &fn_args[0] {
                            ASTNode::Quote(inner) => inner.as_ref(),
                            other => other,
                        };
                        match designator {
                            ASTNode::Lambda { .. } => designator.clone(),
                            ASTNode::Call {
                                function: lam_fn,
                                args: lam_args,
                            } if matches!(lam_fn.as_ref(), ASTNode::Variable(name) if name.eq_ignore_ascii_case("lambda")) => {
                                if lam_args.is_empty() {
                                    handler_fn_node.clone()
                                } else {
                                    let (params, defaults, supplied_p_vars, key_params) =
                                        super::eval_core::extract_params_with_defaults(
                                            &lam_args[0],
                                        );
                                    ASTNode::Lambda {
                                        params,
                                        defaults,
                                        supplied_p_vars,
                                        key_params,
                                        body: lam_args[1..].to_vec(),
                                    }
                                }
                            }
                            _ => handler_fn_node.clone(),
                        }
                    }
                    _ => handler_fn_node.clone(),
                };
                let handler_value = eval_with_env(&handler_fn, env).ok().and_then(|value| {
                    if matches!(value, EvalResult::Lambda { .. }) {
                        Some(value)
                    } else {
                        None
                    }
                });
                let handler_env = match &handler_value {
                    Some(EvalResult::Lambda { env, .. }) => env.clone(),
                    _ => Rc::new(RefCell::new(env.clone())),
                };
                handlers.push(Handler {
                    condition_type: cond_type,
                    handler_fn,
                    handler_value,
                    env: handler_env,
                    was_invoked: Rc::new(Cell::new(false)),
                });
            }
        }
    }

    // Push handlers onto the stack and ensure cleanup on all exits.
    let sync_handlers = handlers.clone();
    push_handlers(handlers);
    let result = (|| {
        let body = &args[1..];
        let mut result = EvalResult::Nil;
        for form in body {
            result = eval_with_env(form, env)?;
        }
        Ok(result)
    })();
    for handler in &sync_handlers {
        if !handler.was_invoked.get() {
            continue;
        }
        let Ok(handler_env) = handler.env.try_borrow() else {
            continue;
        };
        let shadow_updates: Vec<(String, EvalResult)> = handler_env
            .iter()
            .filter_map(|(key, value)| {
                key.strip_prefix(super::eval_core::SHADOWED_LEXICAL_CAPTURE_PREFIX)
                    .map(|plain| (plain.to_string(), value.clone()))
            })
            .collect();
        for (plain, value) in shadow_updates {
            let env_has_direct = env.contains_key(&plain);
            let env_has_shadow = super::eval_core::env_has_shadowed_lexical_capture(env, &plain);
            let env_has_captured = super::eval_core::env_has_explicit_captured_lexical(env, &plain);
            if env_has_direct || env_has_shadow || env_has_captured {
                env.insert(plain.clone(), value.clone());
                if let Some(shadow_key) = super::eval_core::shadowed_lexical_capture_key(&plain) {
                    if env.contains_key(&shadow_key) {
                        env.insert(shadow_key, value);
                    }
                }
            }
        }
        for (key, value) in handler_env.iter() {
            if key == "__condition__" || key.starts_with('%') {
                continue;
            }
            let env_has_direct = env.contains_key(key);
            let env_has_shadow = super::eval_core::env_has_shadowed_lexical_capture(env, key);
            let env_has_captured = super::eval_core::env_has_explicit_captured_lexical(env, key);
            if env_has_direct || env_has_shadow || env_has_captured {
                env.insert(key.clone(), value.clone());
                if let Some(shadow_key) = super::eval_core::shadowed_lexical_capture_key(key) {
                    if env.contains_key(&shadow_key) {
                        env.insert(shadow_key, value.clone());
                    }
                }
            }
        }
        if std::env::var("RLASP_DEBUG_HANDLER_SYNC").is_ok() {
            eprintln!(
                "[handler-bind-final-sync] handler-out={:?} env-out={:?}",
                handler_env.get("out"),
                env.get("out")
            );
        }
    }
    pop_handlers();
    result
}

/// Evaluate (restart-case form (restart-name (params) options... body...)...)
pub fn eval_restart_case(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("restart-case requires at least 1 argument".to_string());
    }

    let protected_form = &args[0];
    let restart_clauses = &args[1..];

    // Parse restart definitions
    let mut restarts = Vec::new();

    for clause in restart_clauses {
        // Each clause is (restart-name (params) options... body...)
        if let ASTNode::Call {
            function: restart_name_node,
            args: clause_args,
        } = clause
        {
            let restart_name = match restart_name_node.as_ref() {
                ASTNode::Variable(name) => name.to_uppercase(),
                _ => continue,
            };

            // First arg is the restart lambda list. Parse it with the same helper used for
            // ordinary lambdas so &rest/&optional/&key semantics are preserved.
            let (params, defaults, supplied_p_vars, key_params) = clause_args
                .get(0)
                .map(super::eval_core::extract_params_with_defaults)
                .unwrap_or_else(|| (Vec::new(), HashMap::new(), HashMap::new(), HashMap::new()));

            // Parse options and body
            let mut interactive = None;
            let mut report = None;
            let mut test = None;
            let mut body_start = 1;

            // Check for keyword options
            for (i, arg) in clause_args.iter().enumerate().skip(1) {
                if let ASTNode::Variable(kw) = arg {
                    let kw_lower = kw.to_lowercase();
                    if kw_lower == ":interactive" || kw_lower == "interactive" {
                        if let Some(form) = clause_args.get(i + 1) {
                            interactive = Some(form.clone());
                            body_start = i + 2;
                        }
                    } else if kw_lower == ":report" || kw_lower == "report" {
                        if let Some(form) = clause_args.get(i + 1) {
                            report = Some(form.clone());
                            body_start = i + 2;
                        }
                    } else if kw_lower == ":test" || kw_lower == "test" {
                        if let Some(form) = clause_args.get(i + 1) {
                            test = Some(form.clone());
                            body_start = i + 2;
                        }
                    } else {
                        // Not a keyword, start of body
                        body_start = i;
                        break;
                    }
                } else {
                    body_start = i;
                    break;
                }
            }

            let body: Vec<ASTNode> = clause_args[body_start..].to_vec();

            // Create a lambda for the restart function
            let restart_fn = ASTNode::Lambda {
                params,
                defaults,
                supplied_p_vars,
                key_params,
                body,
            };

            restarts.push(Restart {
                name: restart_name,
                function: restart_fn,
                env: Rc::new(RefCell::new(env.clone())),
                interactive,
                report,
                test,
            });
        }
    }

    let restart_names: Vec<String> = restarts
        .iter()
        .map(|restart| restart.name.clone())
        .collect();

    // Push restarts onto the stack
    push_restarts(restarts);

    // Execute the protected form
    let result = match eval_with_env(protected_form, env) {
        Ok(value) => Ok(value),
        Err(e) => {
            let mut handled = None;
            for restart_name in &restart_names {
                if let Some(payload) = extract_restart_transfer_payload(&e, restart_name) {
                    handled = Some(decode_restart_value(payload));
                    break;
                }
            }
            handled.unwrap_or(Err(e))
        }
    };

    // Pop restarts from the stack
    pop_restarts();

    result
}

/// Evaluate (invoke-restart restart-name &rest args)
pub fn eval_invoke_restart(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("invoke-restart requires a restart designator".to_string());
    }

    // Get restart name
    let restart_name = eval_with_env(&args[0], env)?;
    let name = match restart_name {
        EvalResult::Restart(s) => s
            .trim_start_matches(':')
            .rsplit(':')
            .next()
            .unwrap_or(s.as_str())
            .to_uppercase(),
        EvalResult::Symbol(s) => s
            .trim_start_matches(':')
            .rsplit(':')
            .next()
            .unwrap_or(s.as_str())
            .to_uppercase(),
        EvalResult::String(s) => s.rsplit(':').next().unwrap_or(s.as_str()).to_uppercase(),
        _ => {
            return Err("invoke-restart: restart designator must be a symbol or string".to_string())
        }
    };

    // Find the restart
    let restart = find_restart_by_name(&name);
    if let Some(restart) = restart {
        // Evaluate arguments to pass to the restart function
        let mut restart_args = Vec::new();
        for arg in &args[1..] {
            restart_args.push(eval_with_env(arg, env)?);
        }

        // Call the restart function
        let restart_env = restart.env.borrow().clone();
        let mut call_env = restart_env;
        call_env.extend(env.clone());

        // If the restart function is a Lambda, evaluate it
        if let ASTNode::Lambda { params, body, .. } = &restart.function {
            let lambda = EvalResult::Lambda {
                params: params.clone(),
                defaults: HashMap::new(),
                supplied_p_vars: HashMap::new(),
                key_params: HashMap::new(),
                body: body.clone(),
                env: Rc::new(RefCell::new(call_env.clone())),
                dynamic_env: false,
            };
            let out = super::eval_system::call_function_with_values(
                lambda,
                &restart_args,
                &mut call_env,
            )?;
            LAST_RESTART_INVOCATION.with(|slot| {
                *slot.borrow_mut() = Some((name.clone(), out.clone()));
            });
            return Err(format!(
                "INVOKE-RESTART:{}:{}",
                name,
                encode_restart_value(&out)
            ));
        }

        // Otherwise try to call it as a regular function
        let mut call_args = Vec::new();
        for arg in &restart_args {
            call_args.push(super::eval_system::result_to_ast_quoted(arg)?);
        }

        let call = ASTNode::Call {
            function: Box::new(restart.function.clone()),
            args: call_args,
        };

        let out = eval_with_env(&call, &mut call_env)?;
        LAST_RESTART_INVOCATION.with(|slot| {
            *slot.borrow_mut() = Some((name.clone(), out.clone()));
        });
        return Err(format!(
            "INVOKE-RESTART:{}:{}",
            name,
            encode_restart_value(&out)
        ));
    }

    Err(format!("No restart named {} is active", name))
}

/// Evaluate (find-restart restart-name &optional condition)
pub fn eval_find_restart(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("find-restart requires a restart designator".to_string());
    }

    // Get restart name
    let restart_name = eval_with_env(&args[0], env)?;
    let name = match restart_name {
        EvalResult::Restart(s) => s
            .trim_start_matches(':')
            .rsplit(':')
            .next()
            .unwrap_or(s.as_str())
            .to_uppercase(),
        EvalResult::Symbol(s) => s
            .trim_start_matches(':')
            .rsplit(':')
            .next()
            .unwrap_or(s.as_str())
            .to_uppercase(),
        EvalResult::String(s) => s.rsplit(':').next().unwrap_or(s.as_str()).to_uppercase(),
        _ => return Err("find-restart: restart designator must be a symbol or string".to_string()),
    };

    // Find the restart
    let restart = find_restart_by_name(&name);
    if restart.is_some() {
        Ok(EvalResult::Restart(name))
    } else {
        Ok(EvalResult::Nil)
    }
}

/// Evaluate (compute-restarts &optional condition)
pub fn eval_compute_restarts(
    args: &[ASTNode],
    _env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    let restarts = compute_all_restarts();

    // Build a list of restart names
    let mut result = EvalResult::Nil;
    for restart in restarts.iter().rev() {
        result = EvalResult::Cons(
            Rc::new(RefCell::new(EvalResult::Restart(restart.name.clone()))),
            Rc::new(RefCell::new(result)),
        );
    }

    Ok(result)
}

/// Evaluate (invoke-restart-interactively restart-name)
pub fn eval_invoke_restart_interactively(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("invoke-restart-interactively requires a restart designator".to_string());
    }

    // Get restart name
    let restart_name = eval_with_env(&args[0], env)?;
    let name = match restart_name {
        EvalResult::Symbol(s) => s
            .trim_start_matches(':')
            .rsplit(':')
            .next()
            .unwrap_or(s.as_str())
            .to_uppercase(),
        EvalResult::String(s) => s.rsplit(':').next().unwrap_or(s.as_str()).to_uppercase(),
        _ => {
            return Err(
                "invoke-restart-interactively: restart designator must be a symbol".to_string(),
            )
        }
    };

    // Find the restart
    let restart = find_restart_by_name(&name);
    if let Some(restart) = restart {
        // If there's an interactive function, call it to get arguments
        let restart_args: Vec<EvalResult> = if let Some(_interactive_fn) = &restart.interactive {
            // In a full implementation, we'd call the interactive function
            // For now, just use no arguments
            Vec::new()
        } else {
            Vec::new()
        };

        // Invoke the restart with the arguments
        let mut invoke_args = vec![ASTNode::Variable(name)];
        for arg in restart_args {
            invoke_args.push(super::eval_system::result_to_ast_quoted(&arg)?);
        }

        eval_invoke_restart(&invoke_args, env)
    } else {
        Err(format!("No restart named {} is active", name))
    }
}

/// Evaluate (continue &optional condition)
///
/// CL defines CONTINUE as invoking the CONTINUE restart when available.
pub fn eval_continue(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.len() > 1 {
        return Err("continue accepts at most one optional condition argument".to_string());
    }
    // Evaluate optional condition argument for side effects/consistency, but the
    // current restart lookup remains dynamic and condition-agnostic in this runtime.
    if let Some(arg) = args.get(0) {
        let _ = eval_with_env(arg, env)?;
    }
    eval_invoke_restart(
        &[ASTNode::Quote(Box::new(ASTNode::Variable(
            "CONTINUE".to_string(),
        )))],
        env,
    )
}
