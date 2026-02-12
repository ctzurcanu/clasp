/// eval_conditions.rs - Common Lisp condition system implementation
///
/// Implements:
/// - define-condition: Define condition types with inheritance and slots
/// - make-condition: Create condition instances
/// - signal, error, warn, cerror: Signal conditions
/// - handler-case, handler-bind: Establish condition handlers
/// - typep support for condition types

use super::eval_types::EvalResult;
use super::eval_core::eval_with_env;
use super::eval_package::{PACKAGES, get_current_package};
use crate::ir::{ASTNode, ConstantValue};
use std::collections::HashMap;
use std::cell::RefCell;
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
    slots.insert("FORMAT-CONTROL".to_string(), EvalResult::String(msg.to_string()));
    slots.insert("FORMAT-ARGUMENTS".to_string(), EvalResult::Nil);
    EvalResult::Condition(Rc::new(RefCell::new(ConditionInstance {
        type_name: "SIMPLE-ERROR".to_string(),
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
        RefCell::new(map)
    };
}

/// A handler binding for handler-bind
#[derive(Clone)]
pub struct Handler {
    pub condition_type: String,
    pub handler_fn: ASTNode,
    pub env: Rc<RefCell<HashMap<String, EvalResult>>>,
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
    let name_upper = name.to_uppercase();
    RESTART_STACK.with(|stack| {
        let stack = stack.borrow();
        // Search from innermost to outermost
        for cluster in stack.iter().rev() {
            for restart in cluster.iter().rev() {
                if restart.name.to_uppercase() == name_upper {
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
            let mut i = 0;
            while i < args.len() {
                if let ASTNode::Variable(kw) = &args[i] {
                    let kw_lower = kw.to_lowercase();
                    match kw_lower.as_str() {
                        ":initarg" | "initarg" => {
                            if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                                slot.initarg = Some(v.to_uppercase());
                                i += 1;
                            }
                        }
                        ":initform" | "initform" => {
                            if let Some(form) = args.get(i + 1) {
                                slot.initform = Some(form.clone());
                                i += 1;
                            }
                        }
                        ":reader" | "reader" => {
                            if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                                slot.reader = Some(v.to_uppercase());
                                i += 1;
                            }
                        }
                        ":writer" | "writer" => {
                            if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                                slot.writer = Some(v.to_uppercase());
                                i += 1;
                            }
                        }
                        ":accessor" | "accessor" => {
                            if let Some(ASTNode::Variable(v)) = args.get(i + 1) {
                                slot.accessor = Some(v.to_uppercase());
                                i += 1;
                            }
                        }
                        _ => {}
                    }
                }
                i += 1;
            }

            Some(slot)
        }
        _ => None,
    }
}

/// Evaluate (define-condition name (parents...) (slots...) options...)
pub fn eval_define_condition(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
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
        match &args[1] {
            ASTNode::Call { function: _, args: parents } => {
                parents.iter().filter_map(|p| {
                    if let ASTNode::Variable(n) = p {
                        Some(n.to_uppercase())
                    } else {
                        None
                    }
                }).collect()
            }
            ASTNode::Constant(ConstantValue::Nil) => vec!["CONDITION".to_string()],
            _ => vec!["CONDITION".to_string()],
        }
    } else {
        vec!["CONDITION".to_string()]
    };

    // Get slots
    let slots: Vec<ConditionSlot> = if args.len() > 2 {
        match &args[2] {
            ASTNode::Call { function: _, args: slot_specs } => {
                slot_specs.iter().filter_map(|s| parse_slot_spec(s)).collect()
            }
            ASTNode::Constant(ConstantValue::Nil) => vec![],
            _ => vec![],
        }
    } else {
        vec![]
    };

    // Parse options (:report, :documentation)
    let mut report_fn = None;
    let mut documentation = None;

    let mut i = 3;
    while i < args.len() {
        if let ASTNode::Variable(kw) = &args[i] {
            let kw_lower = kw.to_lowercase();
            match kw_lower.as_str() {
                ":report" | "report" => {
                    if let Some(form) = args.get(i + 1) {
                        report_fn = Some(form.clone());
                        i += 1;
                    }
                }
                ":documentation" | "documentation" => {
                    if let Some(ASTNode::Constant(crate::ir::ConstantValue::String(s))) = args.get(i + 1) {
                        documentation = Some(s.clone());
                        i += 1;
                    }
                }
                _ => {}
            }
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

    Ok(EvalResult::Symbol(name))
}

/// Evaluate (make-condition type &rest initargs)
pub fn eval_make_condition(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("make-condition requires a type".to_string());
    }

    // Get condition type name
    let type_result = eval_with_env(&args[0], env)?;
    let type_name = match type_result {
        EvalResult::Symbol(n) => {
            if n.starts_with(':') || n.starts_with("'") {
                n.trim_start_matches(':').trim_start_matches('\'').to_uppercase()
            } else {
                n.to_uppercase()
            }
        }
        _ => return Err("make-condition: type must be a symbol".to_string()),
    };

    // Check that the condition type exists
    let type_exists = CONDITION_TYPES.with(|types| {
        types.borrow().contains_key(&type_name)
    });

    if !type_exists {
        return Err(format!("make-condition: unknown condition type {}", type_name));
    }

    // Parse initargs
    let mut slot_values: HashMap<String, EvalResult> = HashMap::new();
    let mut i = 1;
    while i < args.len() {
        let key = eval_with_env(&args[i], env)?;
        if let EvalResult::Symbol(k) = key {
            let key_name = k.trim_start_matches(':').to_uppercase();
            if i + 1 < args.len() {
                let value = eval_with_env(&args[i + 1], env)?;
                slot_values.insert(key_name, value);
                i += 2;
            } else {
                i += 1;
            }
        } else {
            i += 1;
        }
    }

    // Create the condition instance
    let instance = ConditionInstance {
        type_name: type_name.clone(),
        slots: slot_values,
    };

    // Return as a special condition result
    Ok(EvalResult::Condition(Rc::new(RefCell::new(instance))))
}

/// Check if a condition is of a given type
pub fn condition_typep(condition: &ConditionInstance, type_name: &str) -> bool {
    CONDITION_TYPES.with(|types| {
        let types = types.borrow();
        if let Some(cond_type) = types.get(&condition.type_name) {
            cond_type.is_subtype_of(type_name, &types)
        } else {
            false
        }
    })
}

/// Evaluate (signal condition)
pub fn eval_signal(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("signal requires a condition".to_string());
    }

    let condition = eval_with_env(&args[0], env)?;

    // Get the condition type name
    let condition_type = match &condition {
        EvalResult::Condition(c) => c.borrow().type_name.clone(),
        EvalResult::Symbol(s) => s.trim_start_matches(':').trim_start_matches('\'').to_uppercase(),
        _ => return Ok(EvalResult::Nil),
    };

    // Walk the handler stack from innermost to outermost
    let matching_handler = HANDLER_STACK.with(|stack| {
        let stack = stack.borrow();
        for cluster in stack.iter().rev() {
            for handler in cluster.iter().rev() {
                // Check if this handler's condition type matches
                let handler_type = handler.condition_type.to_uppercase();
                if handler_type == condition_type ||
                   handler_type == "T" ||
                   handler_type == "CONDITION" {
                    // Also check inheritance
                    let type_matches = CONDITION_TYPES.with(|types| {
                        let types = types.borrow();
                        if let Some(cond_type) = types.get(&condition_type) {
                            cond_type.is_subtype_of(&handler_type, &types)
                        } else {
                            handler_type == condition_type || handler_type == "T"
                        }
                    });
                    if type_matches {
                        return Some(handler.clone());
                    }
                }
            }
        }
        None
    });

    // If we found a matching handler, invoke it
    if let Some(handler) = matching_handler {
        // Call the handler function with the condition
        let handler_env = handler.env.borrow().clone();
        let mut call_env = handler_env;
        call_env.extend(env.clone());

        // Create a call to the handler function with the condition
        let call = ASTNode::Call {
            function: Box::new(handler.handler_fn),
            args: vec![match &condition {
                EvalResult::Condition(_) => ASTNode::Variable("__condition__".to_string()),
                _ => ASTNode::Variable(condition_type.clone()),
            }],
        };

        // Store condition in env for the call
        if let EvalResult::Condition(c) = &condition {
            call_env.insert("__condition__".to_string(), EvalResult::Condition(c.clone()));
        }

        eval_with_env(&call, &mut call_env)?;
    }

    // signal returns nil (unless a handler transfers control)
    Ok(EvalResult::Nil)
}

/// Evaluate (warn datum &rest args)
pub fn eval_warn(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
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
pub fn eval_handler_bind(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("handler-bind requires at least 1 argument".to_string());
    }

    // Parse handler bindings from first argument
    let mut handlers = Vec::new();

    if let ASTNode::Call { function: _, args: binding_list } = &args[0] {
        for binding in binding_list {
            // Each binding is (condition-type handler-function)
            if let ASTNode::Call { function: cond_type_node, args: handler_args } = binding {
                let cond_type = match cond_type_node.as_ref() {
                    ASTNode::Variable(name) => name.trim_start_matches(':').to_uppercase(),
                    _ => continue,
                };

                if let Some(handler_fn_node) = handler_args.get(0) {
                    handlers.push(Handler {
                        condition_type: cond_type,
                        handler_fn: handler_fn_node.clone(),
                        env: Rc::new(RefCell::new(env.clone())),
                    });
                }
            }
        }
    }

    // Push handlers onto the stack
    push_handlers(handlers);

    // Execute body forms
    let body = &args[1..];
    let mut result = EvalResult::Nil;
    for form in body {
        result = eval_with_env(form, env)?;
    }

    // Pop handlers from the stack
    pop_handlers();

    Ok(result)
}

/// Evaluate (restart-case form (restart-name (params) options... body...)...)
pub fn eval_restart_case(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("restart-case requires at least 1 argument".to_string());
    }

    let protected_form = &args[0];
    let restart_clauses = &args[1..];

    // Parse restart definitions
    let mut restarts = Vec::new();

    for clause in restart_clauses {
        // Each clause is (restart-name (params) options... body...)
        if let ASTNode::Call { function: restart_name_node, args: clause_args } = clause {
            let restart_name = match restart_name_node.as_ref() {
                ASTNode::Variable(name) => name.to_uppercase(),
                _ => continue,
            };

            // First arg should be params list (we'll treat the rest as body)
            let params = if let Some(ASTNode::Call { function: first_param, args: rest_params }) = clause_args.get(0) {
                let mut params = vec![match first_param.as_ref() {
                    ASTNode::Variable(v) => v.clone(),
                    _ => String::new(),
                }];
                for p in rest_params {
                    if let ASTNode::Variable(v) = p {
                        params.push(v.clone());
                    }
                }
                params.into_iter().filter(|s| !s.is_empty()).collect::<Vec<_>>()
            } else if let Some(ASTNode::Constant(ConstantValue::Nil)) = clause_args.get(0) {
                Vec::new()
            } else {
                Vec::new()
            };

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
                defaults: HashMap::new(),
                supplied_p_vars: HashMap::new(),
                key_params: HashMap::new(),
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

    // Push restarts onto the stack
    push_restarts(restarts);

    // Execute the protected form
    let result = eval_with_env(protected_form, env);

    // Pop restarts from the stack
    pop_restarts();

    result
}

/// Evaluate (invoke-restart restart-name &rest args)
pub fn eval_invoke_restart(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("invoke-restart requires a restart designator".to_string());
    }

    // Get restart name
    let restart_name = eval_with_env(&args[0], env)?;
    let name = match restart_name {
        EvalResult::Symbol(s) => s.trim_start_matches(':').to_uppercase(),
        EvalResult::String(s) => s.to_uppercase(),
        _ => return Err("invoke-restart: restart designator must be a symbol or string".to_string()),
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
            return super::eval_system::call_function_with_values(lambda, &restart_args, &mut call_env);
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

        return eval_with_env(&call, &mut call_env);
    }

    Err(format!("No restart named {} is active", name))
}

/// Evaluate (find-restart restart-name &optional condition)
pub fn eval_find_restart(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("find-restart requires a restart designator".to_string());
    }

    // Get restart name
    let restart_name = eval_with_env(&args[0], env)?;
    let name = match restart_name {
        EvalResult::Symbol(s) => s.trim_start_matches(':').to_uppercase(),
        EvalResult::String(s) => s.to_uppercase(),
        _ => return Err("find-restart: restart designator must be a symbol or string".to_string()),
    };

    // Find the restart
    let restart = find_restart_by_name(&name);
    if restart.is_some() {
        // Return the restart name as a symbol (simplified - in full CL this would be a restart object)
        Ok(EvalResult::Symbol(name))
    } else {
        Ok(EvalResult::Nil)
    }
}

/// Evaluate (compute-restarts &optional condition)
pub fn eval_compute_restarts(args: &[ASTNode], _env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    let restarts = compute_all_restarts();

    // Build a list of restart names
    let mut result = EvalResult::Nil;
    for restart in restarts.iter().rev() {
        result = EvalResult::Cons(
            Rc::new(RefCell::new(EvalResult::Symbol(restart.name.clone()))),
            Rc::new(RefCell::new(result)),
        );
    }

    Ok(result)
}

/// Evaluate (invoke-restart-interactively restart-name)
pub fn eval_invoke_restart_interactively(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("invoke-restart-interactively requires a restart designator".to_string());
    }

    // Get restart name
    let restart_name = eval_with_env(&args[0], env)?;
    let name = match restart_name {
        EvalResult::Symbol(s) => s.trim_start_matches(':').to_uppercase(),
        EvalResult::String(s) => s.to_uppercase(),
        _ => return Err("invoke-restart-interactively: restart designator must be a symbol".to_string()),
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
