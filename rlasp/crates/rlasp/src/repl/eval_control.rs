use super::eval_core::eval_with_env;
/// Control flow operations: do, dolist, dotimes, return
use super::eval_types::{
    primary_value, EvalResult, ACTIVE_BLOCK_STACK, NEXT_BLOCK_ID, RETURN_VALUE,
};
use crate::ir::{ASTNode, ConstantValue};
use std::cell::RefCell;
use std::collections::{HashMap, HashSet};
use std::rc::Rc;
use std::sync::LazyLock;

fn condition_true(value: &EvalResult) -> bool {
    let primary = primary_value(value.clone());
    !matches!(
        primary,
        EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)
    )
}

fn canonical_block_name(name: &str) -> String {
    name.to_ascii_lowercase()
}

struct BlockFrameGuard {
    id: u64,
}

impl BlockFrameGuard {
    fn push(block_name: &str) -> Self {
        Self {
            id: push_block_frame(block_name),
        }
    }

    fn id(&self) -> u64 {
        self.id
    }
}

impl Drop for BlockFrameGuard {
    fn drop(&mut self) {
        pop_block_frame(self.id);
    }
}

pub(super) const BLOCK_CAPTURE_DEPTH_KEY: &str = "%__RLASP_BLOCK_CAPTURE_DEPTH__%";
pub(super) const BLOCK_CALL_ENTRY_DEPTH_KEY: &str = "%__RLASP_BLOCK_CALL_ENTRY_DEPTH__%";
static TRACE_BLOCK_BODY_FOR: LazyLock<Option<HashSet<String>>> = LazyLock::new(|| {
    std::env::var("RLASP_TRACE_BLOCK_BODY_FOR")
        .ok()
        .and_then(|raw| {
            let names: HashSet<String> = raw
                .split(',')
                .map(|name| name.trim().to_ascii_lowercase())
                .filter(|name| !name.is_empty())
                .collect();
            if names.is_empty() {
                None
            } else {
                Some(names)
            }
        })
});

fn depth_from_env(env: &HashMap<String, EvalResult>, key: &str) -> Option<usize> {
    match env.get(key) {
        Some(EvalResult::Fixnum(n)) if *n >= 0 => Some(*n as usize),
        _ => None,
    }
}

pub(super) fn current_block_depth() -> usize {
    ACTIVE_BLOCK_STACK.with(|stack| stack.borrow().len())
}

pub(super) fn push_block_frame(block_name: &str) -> u64 {
    let canonical = canonical_block_name(block_name);
    let id = NEXT_BLOCK_ID.with(|next| {
        let id = next.get();
        next.set(id + 1);
        id
    });
    ACTIVE_BLOCK_STACK.with(|stack| stack.borrow_mut().push((canonical, id)));
    id
}

pub(super) fn pop_block_frame(block_id: u64) {
    ACTIVE_BLOCK_STACK.with(|stack| {
        let mut stack = stack.borrow_mut();
        if matches!(stack.last(), Some((_, id)) if *id == block_id) {
            let _ = stack.pop();
            return;
        }
        if let Some(pos) = stack.iter().rposition(|(_, id)| *id == block_id) {
            stack.remove(pos);
        }
    });
}

pub(super) fn find_visible_block_id(
    block_name: &str,
    env: &HashMap<String, EvalResult>,
) -> Option<u64> {
    let capture_depth = depth_from_env(env, BLOCK_CAPTURE_DEPTH_KEY)?;
    let call_entry_depth = depth_from_env(env, BLOCK_CALL_ENTRY_DEPTH_KEY).unwrap_or(usize::MAX);
    let canonical = canonical_block_name(block_name);

    ACTIVE_BLOCK_STACK.with(|stack| {
        let stack = stack.borrow();
        for (idx, (active_name, id)) in stack.iter().enumerate().rev() {
            let depth = idx + 1;
            let visible = depth <= capture_depth || depth > call_entry_depth;
            if visible && active_name.eq_ignore_ascii_case(&canonical) {
                return Some(*id);
            }
        }
        None
    })
}

pub(super) fn extract_return_from_payload<'a>(
    err: &'a str,
    expected_block: &str,
) -> Option<&'a str> {
    let trimmed = err.split(" (callee ast:").next().unwrap_or(err).trim();
    if trimmed.starts_with("RETURN-FROM-ID:") {
        return None;
    }
    let rest = trimmed.strip_prefix("RETURN-FROM:")?;
    let (block_name, payload) = rest.split_once(':')?;
    if block_name.eq_ignore_ascii_case(expected_block) {
        Some(payload)
    } else {
        None
    }
}

pub(super) fn extract_return_from_payload_for_block<'a>(
    err: &'a str,
    expected_block: &str,
    expected_block_id: u64,
) -> Option<&'a str> {
    let trimmed = err.split(" (callee ast:").next().unwrap_or(err).trim();
    if let Some(rest) = trimmed.strip_prefix("RETURN-FROM-ID:") {
        let mut parts = rest.splitn(3, ':');
        let id = parts.next()?.parse::<u64>().ok()?;
        let _block = parts.next()?;
        let payload = parts.next()?;
        if id == expected_block_id {
            return Some(payload);
        }
        return None;
    }
    extract_return_from_payload(trimmed, expected_block)
}

/// Setf expander entry - stores either a simple updater function name
/// or a complex expansion (lambda-list, store-vars, body)
#[derive(Clone)]
pub enum SetfExpander {
    /// Simple form: (defsetf accessor updater) - call (updater args... new-value)
    Simple(String),
    /// Complex form: (defsetf accessor lambda-list (store-var) body...)
    Complex {
        lambda_list: Vec<String>,
        store_vars: Vec<String>,
        body: Vec<ASTNode>,
    },
}

thread_local! {
    /// Global table of setf expanders defined by defsetf
    pub static SETF_EXPANDERS: RefCell<HashMap<String, SetfExpander>> = RefCell::new(HashMap::new());
}

/// Register a setf expander for an accessor
pub fn register_setf_expander(accessor: &str, expander: SetfExpander) {
    SETF_EXPANDERS.with(|table| {
        if std::env::var_os("RLASP_DEBUG_SETF_EXPANDERS").is_some() {
            eprintln!("[setf-expander] register {}", accessor);
        }
        table.borrow_mut().insert(accessor.to_uppercase(), expander);
    });
}

/// Get a setf expander for an accessor
pub fn get_setf_expander(accessor: &str) -> Option<SetfExpander> {
    SETF_EXPANDERS.with(|table| {
        let table = table.borrow();
        if std::env::var_os("RLASP_DEBUG_SETF_EXPANDERS").is_some() {
            let keys: Vec<String> = table.keys().cloned().collect();
            eprintln!("[setf-expander] lookup {} keys={:?}", accessor, keys);
        }
        if let Some(expander) = table.get(&accessor.to_uppercase()).cloned() {
            return Some(expander);
        }
        let base = accessor.rsplit(':').next().unwrap_or(accessor);
        table.get(&base.to_uppercase()).cloned().or_else(|| {
            table.iter().find_map(|(key, expander)| {
                let key_base = key.rsplit(':').next().unwrap_or(key.as_str());
                if key_base.eq_ignore_ascii_case(base) {
                    Some(expander.clone())
                } else {
                    None
                }
            })
        })
    })
}

fn eval_result_list_to_vec(value: &EvalResult) -> Result<Vec<EvalResult>, String> {
    let mut out = Vec::new();
    let mut current = value.clone();
    loop {
        match current {
            EvalResult::Nil => return Ok(out),
            EvalResult::Cons(car, cdr) => {
                out.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("expected a proper list".to_string()),
        }
    }
}

fn eval_result_list_to_symbol_names(value: &EvalResult) -> Result<Vec<String>, String> {
    eval_result_list_to_vec(value)?
        .into_iter()
        .map(|item| match item {
            EvalResult::Symbol(name) => Ok(name),
            EvalResult::Nil => Ok("nil".to_string()),
            _ => Err("expected a list of symbols".to_string()),
        })
        .collect()
}

fn make_proper_list(items: impl IntoIterator<Item = EvalResult>) -> EvalResult {
    let mut out = EvalResult::Nil;
    let collected: Vec<EvalResult> = items.into_iter().collect();
    for item in collected.into_iter().rev() {
        out = EvalResult::Cons(Rc::new(RefCell::new(item)), Rc::new(RefCell::new(out)));
    }
    out
}

fn next_setf_temp_symbol(prefix: &str) -> String {
    super::eval_types::GENSYM_COUNTER.with(|counter| {
        let id = *counter.borrow();
        *counter.borrow_mut() = id + 1;
        format!("{}{}", prefix, id)
    })
}

fn compute_setf_expansion_for_ast(place_ast: &ASTNode) -> Result<[EvalResult; 5], String> {
    match place_ast {
        ASTNode::Variable(name) => {
            let store = next_setf_temp_symbol("%SETF-STORE-");
            let writer = ASTNode::Call {
                function: Box::new(ASTNode::Variable("setq".to_string())),
                args: vec![
                    ASTNode::Variable(name.clone()),
                    ASTNode::Variable(store.clone()),
                ],
            };
            Ok([
                EvalResult::Nil,
                EvalResult::Nil,
                make_proper_list([EvalResult::Symbol(store.clone())]),
                super::eval_core::ast_to_result(&writer)?,
                super::eval_core::ast_to_result(place_ast)?,
            ])
        }
        ASTNode::Call { function, args } => {
            let ASTNode::Variable(func_name) = function.as_ref() else {
                return Err("get-setf-expansion: unsupported place".to_string());
            };
            let base_name = func_name.rsplit(':').next().unwrap_or(func_name.as_str());
            if super::eval_list::is_car_cdr_accessor_name(base_name) && args.len() == 1 {
                let temp = next_setf_temp_symbol("%SETF-TEMP-");
                let store = next_setf_temp_symbol("%SETF-STORE-");
                let reader = ASTNode::Call {
                    function: Box::new(ASTNode::Variable(func_name.clone())),
                    args: vec![ASTNode::Variable(temp.clone())],
                };
                let writer = ASTNode::Call {
                    function: Box::new(ASTNode::Variable("setf".to_string())),
                    args: vec![
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable(func_name.clone())),
                            args: vec![ASTNode::Variable(temp.clone())],
                        },
                        ASTNode::Variable(store.clone()),
                    ],
                };
                Ok([
                    make_proper_list([EvalResult::Symbol(temp.clone())]),
                    make_proper_list([super::eval_core::ast_to_result(&args[0])?]),
                    make_proper_list([EvalResult::Symbol(store.clone())]),
                    super::eval_core::ast_to_result(&writer)?,
                    super::eval_core::ast_to_result(&reader)?,
                ])
            } else {
                Err("get-setf-expansion: unsupported place".to_string())
            }
        }
        _ => Err("get-setf-expansion: unsupported place".to_string()),
    }
}

fn original_setf_pair_ast(place: &ASTNode, value: &ASTNode) -> ASTNode {
    ASTNode::Call {
        function: Box::new(ASTNode::Variable("setf".to_string())),
        args: vec![place.clone(), value.clone()],
    }
}

fn expand_complex_setf_expander_to_ast(
    lambda_list: &[String],
    body: &[ASTNode],
    place_args: &[ASTNode],
    value_ast: &ASTNode,
    env: &mut HashMap<String, EvalResult>,
) -> Result<ASTNode, String> {
    let mut expansion_env = env.clone();

    let mut place_arg_index = 0usize;
    let mut lambda_index = 0usize;
    while lambda_index < lambda_list.len() {
        let param = &lambda_list[lambda_index];
        if param.eq_ignore_ascii_case("&environment") {
            if let Some(env_param) = lambda_list.get(lambda_index + 1) {
                expansion_env.insert(env_param.clone(), EvalResult::Nil);
            }
            lambda_index += 2;
            continue;
        }
        if param.starts_with('&') {
            lambda_index += 1;
            continue;
        }
        if let Some(arg) = place_args.get(place_arg_index) {
            let arg_val = super::eval_core::ast_to_result(arg)?;
            expansion_env.insert(param.clone(), arg_val);
            place_arg_index += 1;
        }
        lambda_index += 1;
    }

    let mut expansion = EvalResult::Nil;
    for expr in body {
        expansion = eval_with_env(expr, &mut expansion_env)?;
    }

    if let EvalResult::MultipleValues(vals) = &expansion {
        if vals.len() == 5 {
            let temp_names = eval_result_list_to_symbol_names(&vals[0])?;
            let value_forms = eval_result_list_to_vec(&vals[1])?;
            let store_names = eval_result_list_to_symbol_names(&vals[2])?;
            if temp_names.len() != value_forms.len() {
                return Err("get-setf-expansion produced mismatched temp/value forms".to_string());
            }
            let writer_ast = super::eval_system::result_to_ast(&vals[3])?;

            let temp_bindings: Result<Vec<(String, ASTNode)>, String> = temp_names
                .into_iter()
                .zip(value_forms.iter())
                .map(|(name, value_form)| {
                    Ok((name, super::eval_system::result_to_ast(value_form)?))
                })
                .collect();

            let mut store_bindings = Vec::new();
            for (idx, store_name) in store_names.into_iter().enumerate() {
                let store_value = if idx == 0 {
                    value_ast.clone()
                } else {
                    ASTNode::Constant(ConstantValue::Nil)
                };
                store_bindings.push((store_name, store_value));
            }

            let with_stores = if store_bindings.is_empty() {
                writer_ast
            } else {
                ASTNode::LetStar {
                    bindings: store_bindings,
                    body: vec![writer_ast],
                }
            };

            let temp_bindings = temp_bindings?;
            return if temp_bindings.is_empty() {
                Ok(with_stores)
            } else {
                Ok(ASTNode::LetStar {
                    bindings: temp_bindings,
                    body: vec![with_stores],
                })
            };
        }
    }

    super::eval_system::result_to_ast(&expansion)
}

pub fn expand_setf_form_to_ast(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<Option<ASTNode>, String> {
    if args.len() < 2 || args.len() % 2 != 0 {
        return Ok(None);
    }

    let mut handled_any = false;
    let mut expanded_pairs = Vec::with_capacity(args.len() / 2);

    for chunk in args.chunks(2) {
        let place = &chunk[0];
        let value = &chunk[1];

        let expanded_pair = match place {
            ASTNode::Call {
                function,
                args: place_args,
            } => match function.as_ref() {
                ASTNode::Variable(func_name) => {
                    if local_macro_shadows_place(func_name, env) {
                        if let Some(local_macro_place) =
                            macroexpand_local_place_once(func_name, place_args, env)?
                        {
                            let nested_args = vec![local_macro_place, value.clone()];
                            if let Some(expanded) = expand_setf_form_to_ast(&nested_args, env)? {
                                handled_any = true;
                                expanded
                            } else {
                                ASTNode::Call {
                                    function: Box::new(ASTNode::Variable("setf".to_string())),
                                    args: nested_args,
                                }
                            }
                        } else {
                            original_setf_pair_ast(place, value)
                        }
                    } else if lexical_setf_function_visible(func_name, env) {
                        original_setf_pair_ast(place, value)
                    } else {
                        match get_setf_expander(func_name) {
                            Some(SetfExpander::Simple(updater)) => {
                                handled_any = true;
                                let mut call_args = place_args.clone();
                                call_args.push(value.clone());
                                ASTNode::Call {
                                    function: Box::new(ASTNode::Variable(updater)),
                                    args: call_args,
                                }
                            }
                            Some(SetfExpander::Complex {
                                lambda_list, body, ..
                            }) => {
                                handled_any = true;
                                expand_complex_setf_expander_to_ast(
                                    &lambda_list,
                                    &body,
                                    place_args,
                                    value,
                                    env,
                                )?
                            }
                            None => {
                                if let Some(local_macro_place) =
                                    macroexpand_local_place_once(func_name, place_args, env)?
                                {
                                    let nested_args = vec![local_macro_place, value.clone()];
                                    if let Some(expanded) =
                                        expand_setf_form_to_ast(&nested_args, env)?
                                    {
                                        handled_any = true;
                                        expanded
                                    } else {
                                        ASTNode::Call {
                                            function: Box::new(ASTNode::Variable(
                                                "setf".to_string(),
                                            )),
                                            args: nested_args,
                                        }
                                    }
                                } else {
                                    original_setf_pair_ast(place, value)
                                }
                            }
                        }
                    }
                }
                _ => original_setf_pair_ast(place, value),
            },
            _ => original_setf_pair_ast(place, value),
        };

        expanded_pairs.push(expanded_pair);
    }

    if !handled_any {
        return Ok(None);
    }

    Ok(Some(if expanded_pairs.len() == 1 {
        expanded_pairs.remove(0)
    } else {
        ASTNode::Progn {
            exprs: expanded_pairs,
        }
    }))
}

fn local_macro_shadows_place(func_name: &str, env: &HashMap<String, EvalResult>) -> bool {
    let func_base = func_name.rsplit(':').next().unwrap_or(func_name);
    super::eval_core::local_macro_names_from_env(env)
        .iter()
        .any(|name| {
            let name_base = name.rsplit(':').next().unwrap_or(name.as_str());
            name.eq_ignore_ascii_case(func_name) || name_base.eq_ignore_ascii_case(func_base)
        })
}

fn function_env_binding_visible(
    name: &str,
    env: &HashMap<String, EvalResult>,
) -> Option<EvalResult> {
    let requested = name
        .strip_prefix(super::eval_core::FUNCTION_NS_PREFIX)
        .unwrap_or(name);
    let requested_base = requested.rsplit(':').next().unwrap_or(requested);
    env.iter().find_map(|(key, value)| {
        let key_symbol = key
            .strip_prefix(super::eval_core::FUNCTION_NS_PREFIX)
            .or_else(|| {
                key.rsplit_once(super::eval_core::FUNCTION_NS_PREFIX)
                    .map(|(_, tail)| tail)
            })?;
        let key_base = key_symbol.rsplit(':').next().unwrap_or(key_symbol);
        if requested.eq_ignore_ascii_case(key_symbol)
            || requested_base.eq_ignore_ascii_case(key_base)
        {
            Some(value.clone())
        } else {
            None
        }
    })
}

fn lexical_setf_function_visible(func_name: &str, env: &HashMap<String, EvalResult>) -> bool {
    let setf_name = format!(
        "{}(setf {})",
        super::eval_core::FUNCTION_NS_PREFIX,
        func_name
    );
    function_env_binding_visible(&setf_name, env).is_some()
}

fn macroexpand_local_place_once(
    func_name: &str,
    place_args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<Option<ASTNode>, String> {
    let fn_name = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, func_name);
    let Some(EvalResult::Macro { params, body }) = function_env_binding_visible(&fn_name, env)
    else {
        return Ok(None);
    };
    super::eval_core::macroexpand_1_call_to_ast(&params, &body, Some(func_name), place_args, env)
        .map(Some)
}

pub fn eval_get_setf_expansion(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("get-setf-expansion requires a place".to_string());
    }
    let place_form = eval_with_env(&args[0], env)?;
    let place_ast = super::eval_system::result_to_ast(&place_form)?;
    let expansion = compute_setf_expansion_for_ast(&place_ast)?;
    Ok(EvalResult::MultipleValues(expansion.into_iter().collect()))
}

/// Evaluate defsetf
/// Simple form: (defsetf accessor updater)
/// Complex form: (defsetf accessor lambda-list (store-var) body...)
pub fn eval_defsetf(
    args: &[ASTNode],
    _env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("defsetf requires at least 2 arguments".to_string());
    }

    // Get accessor name
    let accessor = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("defsetf: first argument must be a symbol".to_string()),
    };

    // Simple form:
    //   (defsetf accessor updater)
    //   (defsetf accessor updater "docstring")
    let is_simple_form = matches!(&args[1], ASTNode::Variable(_))
        && (args.len() == 2
            || (args.len() == 3
                && matches!(&args[2], ASTNode::Constant(ConstantValue::String(_)))));

    if is_simple_form {
        let updater = match &args[1] {
            ASTNode::Variable(name) => name.clone(),
            _ => unreachable!(),
        };
        register_setf_expander(&accessor, SetfExpander::Simple(updater));
    } else {
        // Complex form: (defsetf accessor lambda-list (store-var) [docstring] body...)
        // Extract lambda-list
        let lambda_list = extract_lambda_list(&args[1])?;

        // Extract store-vars (should be a list with one variable)
        let store_vars = extract_lambda_list(&args[2])?;

        // Rest is body (skip optional docstring)
        let body_start = if args.len() > 3 {
            if let ASTNode::Constant(ConstantValue::String(_)) = &args[3] {
                4 // Skip docstring
            } else {
                3
            }
        } else {
            3
        };

        let body = args[body_start..].to_vec();

        register_setf_expander(
            &accessor,
            SetfExpander::Complex {
                lambda_list,
                store_vars,
                body,
            },
        );
    }

    Ok(EvalResult::Symbol(accessor))
}

/// Extract parameter names from a lambda list AST node
pub(crate) fn extract_lambda_list(ast: &ASTNode) -> Result<Vec<String>, String> {
    match ast {
        ASTNode::Call { function, args } => {
            let mut params = Vec::new();
            if let ASTNode::Variable(name) = &**function {
                params.push(name.clone());
            }
            for arg in args {
                if let ASTNode::Variable(name) = arg {
                    params.push(name.clone());
                }
            }
            Ok(params)
        }
        ASTNode::Constant(ConstantValue::Nil) => Ok(vec![]),
        ASTNode::Variable(name) => Ok(vec![name.clone()]),
        _ => Err(format!("Invalid lambda list: {:?}", ast)),
    }
}

// Helper to check if a name is a car/cdr accessor
fn is_car_cdr_accessor(name: &str) -> bool {
    name == "car"
        || name == "cdr"
        || name == "caar"
        || name == "cadr"
        || name == "cdar"
        || name == "cddr"
        || name == "caaar"
        || name == "caadr"
        || name == "cadar"
        || name == "caddr"
        || name == "cdaar"
        || name == "cdadr"
        || name == "cddar"
        || name == "cdddr"
        || name == "caaaar"
        || name == "caaadr"
        || name == "caadar"
        || name == "caaddr"
        || name == "cadaar"
        || name == "cadadr"
        || name == "caddar"
        || name == "cadddr"
        || name == "cdaaar"
        || name == "cdaadr"
        || name == "cdadar"
        || name == "cdaddr"
        || name == "cddaar"
        || name == "cddadr"
        || name == "cdddar"
        || name == "cddddr"
}

pub(super) fn eval_return(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // return exits from the nearest enclosing NIL block (implicitly created by do, loop, etc.)
    // This is equivalent to (return-from nil value)
    let return_val = if args.is_empty() {
        EvalResult::Nil
    } else {
        eval_with_env(&args[0], env)?
    };

    let encoded = encode_return_value(&return_val);
    if env.contains_key(BLOCK_CAPTURE_DEPTH_KEY) {
        if let Some(target_id) = find_visible_block_id("nil", env) {
            if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
                let stack_snapshot = ACTIVE_BLOCK_STACK.with(|s| s.borrow().clone());
                eprintln!(
                    "[return-raise] block=nil target={} value={:?}",
                    target_id, return_val
                );
                eprintln!("[return-raise] active-stack={:?}", stack_snapshot);
            }
            return Err(format!("RETURN-FROM-ID:{}:nil:{}", target_id, encoded));
        }
    }
    if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
        eprintln!(
            "[return-raise] block=nil target=<name-only> value={:?}",
            return_val
        );
    }
    Err(format!("RETURN-FROM:nil:{}", encoded))
}

pub(super) fn eval_block(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (block name body-forms...)
    if args.is_empty() {
        return Err("block requires at least a name argument".to_string());
    }

    let block_name = canonical_block_name(&match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Nil) => "nil".to_string(),
        _ => return Err("block name must be a symbol".to_string()),
    });

    let body_forms = &args[1..];
    let block_id = push_block_frame(&block_name);
    let trace_block_body = TRACE_BLOCK_BODY_FOR
        .as_ref()
        .map(|selected| selected.contains(&block_name))
        .unwrap_or(false);

    let result = (|| -> Result<EvalResult, String> {
        let mut result = EvalResult::Nil;
        for (form_index, form) in body_forms.iter().enumerate() {
            if trace_block_body {
                eprintln!(
                    "[trace-block-body before] block={} form#={} form={:?}",
                    block_name, form_index, form
                );
            }
            match eval_with_env(form, env) {
                Ok(val) => {
                    if trace_block_body {
                        eprintln!(
                            "[trace-block-body after] block={} form#={} result={:?}",
                            block_name, form_index, val
                        );
                    }
                    result = val
                }
                Err(e) => {
                    if trace_block_body {
                        eprintln!(
                            "[trace-block-body err] block={} form#={} err={}",
                            block_name, form_index, e
                        );
                    }
                    if let Some(value_part) =
                        extract_return_from_payload_for_block(&e, &block_name, block_id)
                    {
                        return decode_return_value(value_part.to_string());
                    }
                    return Err(e);
                }
            }
        }
        Ok(result)
    })();

    pop_block_frame(block_id);
    result
}

pub(super) fn eval_return_from(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (return-from name [value])
    if args.is_empty() {
        return Err("return-from requires at least a name argument".to_string());
    }

    let block_name = canonical_block_name(&match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Nil) => "nil".to_string(),
        _ => return Err("return-from name must be a symbol".to_string()),
    });

    let return_val = if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Nil
    };

    let encoded = encode_return_value(&return_val);
    if env.contains_key(BLOCK_CAPTURE_DEPTH_KEY) {
        if let Some(target_id) = find_visible_block_id(&block_name, env) {
            if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
                let stack_snapshot = ACTIVE_BLOCK_STACK.with(|s| s.borrow().clone());
                eprintln!(
                    "[return-raise] block={} target={} value={:?}",
                    block_name, target_id, return_val
                );
                eprintln!("[return-raise] active-stack={:?}", stack_snapshot);
            }
            return Err(format!(
                "RETURN-FROM-ID:{}:{}:{}",
                target_id, block_name, encoded
            ));
        }
    }
    if std::env::var("RLASP_DEBUG_RETURN").is_ok() {
        eprintln!(
            "[return-raise] block={} target=<name-only> value={:?}",
            block_name, return_val
        );
    }
    Err(format!("RETURN-FROM:{}:{}", block_name, encoded))
}

fn encode_return_value(val: &EvalResult) -> String {
    match val {
        EvalResult::Fixnum(n) => format!("FIXNUM:{}", n),
        EvalResult::Float(f) => format!("FLOAT:{}", f),
        EvalResult::Bool(b) => format!("BOOL:{}", b),
        EvalResult::Nil => "NIL".to_string(),
        EvalResult::String(s) => format!("STRING:{}", s),
        EvalResult::Symbol(s) => format!("SYMBOL:{}", s),
        _ => super::eval_types::stash_nonlocal_return_value(val),
    }
}

// Decode the "RETURN:TYPE:value" format from eval_return
fn decode_return_from_format(e: &str) -> Result<EvalResult, String> {
    let e = e.split(" (callee ast:").next().unwrap_or(e).trim();
    if e == "RETURN:NIL" {
        Ok(EvalResult::Nil)
    } else if e.starts_with("RETURN:FIXNUM:") {
        let num_str = &e[14..];
        num_str
            .parse::<i64>()
            .map(EvalResult::Fixnum)
            .map_err(|_| "Failed to parse fixnum".to_string())
    } else if e.starts_with("RETURN:FLOAT:") {
        let num_str = &e[13..];
        num_str
            .parse::<f64>()
            .map(EvalResult::Float)
            .map_err(|_| "Failed to parse float".to_string())
    } else if e.starts_with("RETURN:BOOL:") {
        let bool_str = &e[12..];
        Ok(EvalResult::Bool(bool_str == "true"))
    } else if e.starts_with("RETURN:STRING:") {
        Ok(EvalResult::String(e[14..].to_string()))
    } else if e.starts_with("RETURN:SYMBOL:") {
        Ok(EvalResult::Symbol(e[14..].to_string()))
    } else if e == "RETURN:CONS" || e == "RETURN:LAMBDA" || e.starts_with("RETURN:COMPLEX") {
        let encoded = e.strip_prefix("RETURN:").unwrap_or(e);
        super::eval_types::take_nonlocal_return_value(encoded)
            .ok_or_else(|| "return value not found".to_string())
    } else {
        Ok(EvalResult::Nil)
    }
}

pub(super) fn decode_return_value(encoded: String) -> Result<EvalResult, String> {
    let encoded = encoded
        .split(" (callee ast:")
        .next()
        .unwrap_or(encoded.as_str())
        .trim()
        .to_string();
    if encoded == "NIL" {
        Ok(EvalResult::Nil)
    } else if encoded.starts_with("FIXNUM:") {
        let num_str = &encoded[7..];
        num_str
            .parse::<i64>()
            .map(EvalResult::Fixnum)
            .map_err(|_| "Failed to parse fixnum".to_string())
    } else if encoded.starts_with("FLOAT:") {
        let num_str = &encoded[6..];
        num_str
            .parse::<f64>()
            .map(EvalResult::Float)
            .map_err(|_| "Failed to parse float".to_string())
    } else if encoded.starts_with("BOOL:") {
        let bool_str = &encoded[5..];
        Ok(EvalResult::Bool(bool_str == "true"))
    } else if encoded.starts_with("STRING:") {
        Ok(EvalResult::String(encoded[7..].to_string()))
    } else if encoded.starts_with("SYMBOL:") {
        Ok(EvalResult::Symbol(encoded[7..].to_string()))
    } else if encoded.starts_with("COMPLEX") {
        super::eval_types::take_nonlocal_return_value(&encoded)
            .ok_or_else(|| "return value not found".to_string())
    } else {
        Err(format!("Unknown return encoding: {}", encoded))
    }
}

pub(super) fn eval_do(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
    sequential: bool,
) -> Result<EvalResult, String> {
    // (do ((var init step)...) (end-test result...) body...)
    if args.len() < 2 {
        return Err("do requires at least 2 arguments".to_string());
    }
    let block_guard = BlockFrameGuard::push("nil");

    // Parse variable bindings
    let var_specs = &args[0];
    let mut var_bindings: Vec<(String, EvalResult, Option<ASTNode>)> = Vec::new();

    // Extract variable specifications
    match var_specs {
        ASTNode::Constant(ConstantValue::Nil) => {
            // No variable bindings
        }
        ASTNode::Call {
            function,
            args: spec_args,
        } => {
            // Process first binding
            if let ASTNode::Call {
                function: var_func,
                args: var_args,
            } = &**function
            {
                if let ASTNode::Variable(var_name) = &**var_func {
                    let init_val = if !var_args.is_empty() {
                        eval_with_env(&var_args[0], env)?
                    } else {
                        EvalResult::Nil
                    };
                    let step_form = if var_args.len() > 1 {
                        Some(var_args[1].clone())
                    } else {
                        None
                    };
                    var_bindings.push((var_name.clone(), init_val, step_form));
                }
            }
            // Process remaining bindings
            for spec in spec_args {
                if let ASTNode::Call {
                    function: var_func,
                    args: var_args,
                } = spec
                {
                    if let ASTNode::Variable(var_name) = &**var_func {
                        let init_val = if !var_args.is_empty() {
                            if sequential {
                                // do*: evaluate in the extended environment
                                let mut loop_env = env.clone();
                                for (name, val, _) in &var_bindings {
                                    loop_env.insert(name.clone(), val.clone());
                                }
                                eval_with_env(&var_args[0], &mut loop_env)?
                            } else {
                                // do: evaluate in original environment
                                eval_with_env(&var_args[0], env)?
                            }
                        } else {
                            EvalResult::Nil
                        };
                        let step_form = if var_args.len() > 1 {
                            Some(var_args[1].clone())
                        } else {
                            None
                        };
                        var_bindings.push((var_name.clone(), init_val, step_form));
                    }
                }
            }
        }
        _ => return Err("do: invalid variable specifications".to_string()),
    }

    // Parse end test and result forms
    let end_clause = &args[1];
    let (end_test, result_forms) = match end_clause {
        ASTNode::Call {
            function,
            args: result_args,
        } => (function.as_ref().clone(), result_args.clone()),
        _ => return Err("do: invalid end clause".to_string()),
    };

    // Body forms
    let body_forms = &args[2..];

    // Create loop environment
    let mut loop_env = env.clone();
    for (var_name, init_val, _) in &var_bindings {
        loop_env.insert(var_name.clone(), init_val.clone());
    }

    // Loop until end test is true
    loop {
        // Check end test
        let test_result = eval_with_env(&end_test, &mut loop_env)?;
        if condition_true(&test_result) {
            // End test is true, evaluate result forms
            let mut result = EvalResult::Nil;
            for form in &result_forms {
                result = eval_with_env(form, &mut loop_env)?;
            }
            return Ok(result);
        }

        // Execute body forms
        for form in body_forms {
            match eval_with_env(form, &mut loop_env) {
                Ok(_) => {}
                Err(e)
                    if extract_return_from_payload_for_block(&e, "nil", block_guard.id())
                        .is_some() =>
                {
                    let payload =
                        extract_return_from_payload_for_block(&e, "nil", block_guard.id())
                            .unwrap_or("NIL");
                    return decode_return_value(payload.to_string());
                }
                Err(e) if e.starts_with("RETURN:") => {
                    // Return signaled from body - decode the value
                    if e == "RETURN:NIL" {
                        return Ok(EvalResult::Nil);
                    } else if e.starts_with("RETURN:FIXNUM:") {
                        let num_str = &e[14..];
                        if let Ok(n) = num_str.parse::<i64>() {
                            return Ok(EvalResult::Fixnum(n));
                        }
                    } else if e.starts_with("RETURN:FLOAT:") {
                        let num_str = &e[13..];
                        if let Ok(f) = num_str.parse::<f64>() {
                            return Ok(EvalResult::Float(f));
                        }
                    } else if e.starts_with("RETURN:BOOL:") {
                        let bool_str = &e[12..];
                        if bool_str == "true" {
                            return Ok(EvalResult::Bool(true));
                        } else {
                            return Ok(EvalResult::Nil);
                        }
                    } else if e.starts_with("RETURN:STRING:") {
                        let s = &e[14..];
                        return Ok(EvalResult::String(s.to_string()));
                    } else if e.starts_with("RETURN:SYMBOL:") {
                        let s = &e[14..];
                        return Ok(EvalResult::Symbol(s.to_string()));
                    } else if e == "RETURN:CONS"
                        || e == "RETURN:LAMBDA"
                        || e.starts_with("RETURN:COMPLEX")
                    {
                        let encoded = e.strip_prefix("RETURN:").unwrap_or(e.as_str());
                        return super::eval_types::take_nonlocal_return_value(encoded)
                            .ok_or_else(|| "return value not found".to_string());
                    }
                    return Ok(EvalResult::Nil);
                }
                Err(e) => return Err(e),
            }
        }

        // Step variables
        if sequential {
            // do*: evaluate and update sequentially
            for (var_name, _current_val, step_form) in &var_bindings {
                if let Some(step) = step_form {
                    let new_val = eval_with_env(step, &mut loop_env)?;
                    loop_env.insert(var_name.clone(), new_val);
                }
            }
        } else {
            // do: evaluate all steps in parallel then update
            let mut new_values = Vec::new();
            for (var_name, _current_val, step_form) in &var_bindings {
                let new_val = if let Some(step) = step_form {
                    eval_with_env(step, &mut loop_env)?
                } else {
                    loop_env.get(var_name).cloned().unwrap_or(EvalResult::Nil)
                };
                new_values.push((var_name.clone(), new_val));
            }
            // Update all variables at once
            for (var_name, new_val) in new_values {
                loop_env.insert(var_name, new_val);
            }
        }
    }
}

pub(super) fn eval_dolist(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (dolist (var list-form result-form) body...)
    if args.is_empty() {
        return Err("dolist requires at least 1 argument".to_string());
    }
    let block_guard = BlockFrameGuard::push("nil");

    // Parse the iteration spec: (var list-form result-form?)
    let spec = &args[0];
    let spec_parts = super::eval_system::ast_list_elements(spec)
        .map_err(|_| "dolist spec must be a list".to_string())?;

    if spec_parts.len() < 2 || spec_parts.len() > 3 {
        return Err(
            "dolist spec must have 2 or 3 elements: (var list-form [result-form])".to_string(),
        );
    }

    let var_name = match &spec_parts[0] {
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("dolist variable must be a symbol".to_string()),
    };

    let list_form = &spec_parts[1];
    let result_form = spec_parts.get(2);
    let body_forms = &args[1..];

    // Evaluate the list form
    let list_val = eval_with_env(list_form, env)?;

    // Save old value of var (if it exists)
    let old_val = env.get(&var_name).cloned();

    // Iterate over the list
    let mut current = list_val;
    loop {
        // Extract current element and next before match
        let (elem, next) = match &current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => (car.borrow().clone(), cdr.borrow().clone()),
            _ => return Err("dolist list must be a proper list".to_string()),
        };

        // Bind var to current element without allocating a fresh key each iteration.
        if let Some(slot) = env.get_mut(&var_name) {
            *slot = elem;
        } else {
            env.insert(var_name.clone(), elem);
        }

        // Execute body forms
        for form in body_forms {
            match eval_with_env(form, env) {
                Ok(_) => {}
                Err(e)
                    if extract_return_from_payload_for_block(&e, "nil", block_guard.id())
                        .is_some() =>
                {
                    // Restore old value and return
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    let payload =
                        extract_return_from_payload_for_block(&e, "nil", block_guard.id())
                            .unwrap_or("NIL");
                    return decode_return_value(payload.to_string());
                }
                Err(e) if e.starts_with("RETURN:") => {
                    // Restore old value and return
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    return decode_return_value(e);
                }
                Err(e) => {
                    // Restore old value before propagating error
                    if let Some(val) = old_val {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    return Err(e);
                }
            }
        }

        // Move to next element
        current = next;
    }

    // Set var to nil after iteration (Common Lisp spec)
    env.insert(var_name.clone(), EvalResult::Nil);

    // Evaluate result form if provided
    let result = if let Some(form) = result_form {
        eval_with_env(form, env)?
    } else {
        EvalResult::Nil
    };

    // Restore old value of var
    if let Some(val) = old_val {
        env.insert(var_name, val);
    } else {
        env.remove(&var_name);
    }

    Ok(result)
}

pub(super) fn eval_dotimes(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (dotimes (var count-form result-form) body...)
    if args.is_empty() {
        return Err("dotimes requires at least 1 argument".to_string());
    }
    let block_guard = BlockFrameGuard::push("nil");

    // Parse the iteration spec: (var count-form result-form?)
    let spec = &args[0];
    let spec_parts = match spec {
        ASTNode::Call {
            function,
            args: spec_args,
        } => {
            let mut parts = vec![*function.clone()];
            parts.extend(spec_args.clone());
            parts
        }
        _ => return Err("dotimes spec must be a list".to_string()),
    };

    if spec_parts.len() < 2 || spec_parts.len() > 3 {
        return Err(
            "dotimes spec must have 2 or 3 elements: (var count-form [result-form])".to_string(),
        );
    }

    let var_name = match &spec_parts[0] {
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("dotimes variable must be a symbol".to_string()),
    };

    let count_form = &spec_parts[1];
    let result_form = spec_parts.get(2);
    let body_forms = &args[1..];

    // Evaluate the count form
    let count_val = eval_with_env(count_form, env)?;
    let count = match count_val {
        EvalResult::Fixnum(n) if n >= 0 => n as usize,
        EvalResult::Fixnum(n) => {
            return Err(format!("dotimes count must be non-negative, got {}", n))
        }
        _ => return Err("dotimes count must be a fixnum".to_string()),
    };

    // Save old value of var (if it exists)
    let old_val = env.get(&var_name).cloned();

    // Iterate from 0 to count-1
    for i in 0..count {
        // Bind var to current index without allocating a fresh key each iteration.
        if let Some(slot) = env.get_mut(&var_name) {
            *slot = EvalResult::Fixnum(i as i64);
        } else {
            env.insert(var_name.clone(), EvalResult::Fixnum(i as i64));
        }

        // Execute body forms
        for form in body_forms {
            match eval_with_env(form, env) {
                Ok(_) => {}
                // Check RETURN-FROM NIL FIRST (more specific pattern)
                Err(e)
                    if extract_return_from_payload_for_block(&e, "nil", block_guard.id())
                        .is_some() =>
                {
                    // Handle return-from nil format (from (return ...) which converts to (return-from nil ...))
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    let value_part =
                        extract_return_from_payload_for_block(&e, "nil", block_guard.id())
                            .unwrap_or("NIL");
                    return decode_return_value(value_part.to_string());
                }
                // Then check RETURN: (less specific pattern)
                Err(e) if e.starts_with("RETURN:") => {
                    // Restore old value and return
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    // Decode the return value
                    return decode_return_from_format(&e);
                }
                Err(e) => {
                    // Restore old value before propagating error
                    if let Some(val) = old_val.clone() {
                        env.insert(var_name.clone(), val);
                    } else {
                        env.remove(&var_name);
                    }
                    return Err(e);
                }
            }
        }
    }

    // Set var to count after iteration (Common Lisp spec)
    env.insert(var_name.clone(), EvalResult::Fixnum(count as i64));

    // Evaluate result form if provided
    let result = if let Some(form) = result_form {
        eval_with_env(form, env)?
    } else {
        EvalResult::Nil
    };

    // Restore old value of var
    if let Some(val) = old_val {
        env.insert(var_name, val);
    } else {
        env.remove(&var_name);
    }

    Ok(result)
}

pub(super) fn eval_prog1(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (prog1 first-form other-forms...)
    // Evaluates all forms in sequence, returns the value of the first form
    if args.is_empty() {
        return Err("prog1 requires at least 1 argument".to_string());
    }

    let first_result = eval_with_env(&args[0], env)?;

    // Evaluate remaining forms for side effects
    for form in &args[1..] {
        eval_with_env(form, env)?;
    }

    Ok(first_result)
}

pub(super) fn eval_prog2(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (prog2 first-form second-form other-forms...)
    // Evaluates all forms in sequence, returns the value of the second form
    if args.len() < 2 {
        return Err("prog2 requires at least 2 arguments".to_string());
    }

    // Evaluate first form for side effects
    eval_with_env(&args[0], env)?;

    // Evaluate second form and save result
    let second_result = eval_with_env(&args[1], env)?;

    // Evaluate remaining forms for side effects
    for form in &args[2..] {
        eval_with_env(form, env)?;
    }

    Ok(second_result)
}

pub(super) fn eval_while(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (while test body...)
    // Evaluates body forms repeatedly while test is non-nil
    if args.is_empty() {
        return Err("while requires at least 1 argument (test condition)".to_string());
    }

    let test = &args[0];
    let body_forms = &args[1..];

    loop {
        // Evaluate test condition
        let test_result = eval_with_env(test, env)?;

        // Check if test is nil or false
        let is_nil = !condition_true(&test_result);
        if is_nil {
            break;
        }

        // Execute body forms
        for form in body_forms {
            eval_with_env(form, env)?;
        }
    }

    // while returns nil
    Ok(EvalResult::Nil)
}

pub(super) fn eval_assert(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (assert test-form)
    if args.is_empty() {
        return Err("assert requires at least 1 argument".to_string());
    }

    let test_form = &args[0];
    let test_result = eval_with_env(test_form, env)?;

    // Check if test is false
    if !condition_true(&test_result) {
        return Err(format!("Assertion failed: {:?}", test_form));
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_check_type(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (check-type place typespec &optional string)
    // Signals an error if the value of place is not of type typespec
    if args.len() < 2 {
        return Err("check-type requires at least 2 arguments (place typespec)".to_string());
    }

    let place = &args[0];
    let value = eval_with_env(place, env)?;
    let typespec = &args[1];

    // Check if the value matches the typespec
    let matches = check_typespec_matches(&value, typespec, env)?;

    if !matches {
        let type_desc = format_typespec(typespec);
        let place_desc = format!("{:?}", place);
        eprintln!(
            "DEBUG check-type failed: place={} value={:?} type={}",
            place_desc, value, type_desc
        );
        let string_desc = if args.len() > 2 {
            match eval_with_env(&args[2], env)? {
                EvalResult::String(s) => format!(": {}", s),
                _ => String::new(),
            }
        } else {
            String::new()
        };
        return Err(format!(
            "The value {:?} is not of type {}{}",
            value, type_desc, string_desc
        ));
    }

    Ok(EvalResult::Nil)
}

fn format_typespec(typespec: &ASTNode) -> String {
    match typespec {
        ASTNode::Variable(name) => name.to_uppercase(),
        ASTNode::Quote(inner) => format_typespec(inner),
        ASTNode::Call { function, args } => {
            if let ASTNode::Variable(name) = function.as_ref() {
                let args_str: Vec<String> = args.iter().map(format_typespec).collect();
                format!("({} {})", name.to_uppercase(), args_str.join(" "))
            } else {
                "UNKNOWN-TYPE".to_string()
            }
        }
        ASTNode::Constant(c) => format!("{:?}", c),
        _ => "UNKNOWN-TYPE".to_string(),
    }
}

fn check_typespec_matches(
    value: &EvalResult,
    typespec: &ASTNode,
    env: &mut HashMap<String, EvalResult>,
) -> Result<bool, String> {
    match typespec {
        ASTNode::Variable(name) => Ok(type_matches(value, &name.to_uppercase())),
        ASTNode::Quote(inner) => check_typespec_matches(value, inner, env),
        ASTNode::Call { function, args } => {
            // Handle compound type specifiers like (member nil t), (or null package), etc.
            if let ASTNode::Variable(name) = function.as_ref() {
                match name.to_uppercase().as_str() {
                    "MEMBER" => {
                        // (member item1 item2 ...) - check if value is eql to any item
                        for arg in args {
                            let item = eval_with_env(arg, env)?;
                            if eql_values(value, &item) {
                                return Ok(true);
                            }
                        }
                        Ok(false)
                    }
                    "OR" => {
                        // (or type1 type2 ...) - check if value matches any type
                        for arg in args {
                            if check_typespec_matches(value, arg, env)? {
                                return Ok(true);
                            }
                        }
                        Ok(false)
                    }
                    "AND" => {
                        // (and type1 type2 ...) - check if value matches all types
                        for arg in args {
                            if !check_typespec_matches(value, arg, env)? {
                                return Ok(false);
                            }
                        }
                        Ok(true)
                    }
                    "NOT" => {
                        // (not type) - check if value does NOT match type
                        if args.len() != 1 {
                            return Err(
                                "NOT type specifier requires exactly one argument".to_string()
                            );
                        }
                        Ok(!check_typespec_matches(value, &args[0], env)?)
                    }
                    "EQL" => {
                        // (eql object) - check if value is eql to object
                        if args.len() != 1 {
                            return Err(
                                "EQL type specifier requires exactly one argument".to_string()
                            );
                        }
                        let item = eval_with_env(&args[0], env)?;
                        Ok(eql_values(value, &item))
                    }
                    "SATISFIES" => {
                        // (satisfies predicate) - always return true for now (complex to implement)
                        Ok(true)
                    }
                    _ => {
                        // Unknown compound type - be permissive
                        Ok(true)
                    }
                }
            } else {
                // Unknown function form - be permissive
                Ok(true)
            }
        }
        _ => {
            // Unknown typespec form - be permissive
            Ok(true)
        }
    }
}

/// EQ comparison (pointer identity for cons, otherwise same as eql)
pub(super) fn eq_values(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Cons(car1, cdr1), EvalResult::Cons(car2, cdr2)) => {
            Rc::ptr_eq(car1, car2) && Rc::ptr_eq(cdr1, cdr2)
        }
        _ => eql_values(a, b),
    }
}

pub(super) fn eql_values(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Boolean(x), EvalResult::Boolean(y)) => x == y,
        (EvalResult::Bool(x), EvalResult::Bool(y)) => x == y,
        (EvalResult::Fixnum(x), EvalResult::Fixnum(y)) => x == y,
        (EvalResult::Float(x), EvalResult::Float(y)) => x == y,
        (EvalResult::Character(x), EvalResult::Character(y)) => x == y,
        (EvalResult::Symbol(x), EvalResult::Symbol(y)) => x == y,
        (EvalResult::String(x), EvalResult::String(y)) => x == y,
        _ => false,
    }
}

fn type_matches(value: &EvalResult, type_name: &str) -> bool {
    match type_name {
        "T" => true,
        "NIL" => false,
        "NULL" => matches!(value, EvalResult::Nil),
        "SYMBOL" => matches!(value, EvalResult::Symbol(_)),
        "KEYWORD" => {
            if let EvalResult::Symbol(s) = value {
                s.starts_with(':')
            } else {
                false
            }
        }
        "STRING" => matches!(value, EvalResult::String(_)),
        "INTEGER" => matches!(value, EvalResult::Fixnum(_) | EvalResult::Bignum(_)),
        "FIXNUM" => matches!(value, EvalResult::Fixnum(_)),
        "BIGNUM" => matches!(value, EvalResult::Bignum(_)),
        "FLOAT" => matches!(value, EvalResult::Float(_)),
        "NUMBER" | "REAL" => matches!(
            value,
            EvalResult::Fixnum(_)
                | EvalResult::Float(_)
                | EvalResult::Bignum(_)
                | EvalResult::Ratio(_)
        ),
        "RATIO" => matches!(value, EvalResult::Ratio(_)),
        "COMPLEX" => matches!(value, EvalResult::Complex(_, _)),
        "CONS" => matches!(value, EvalResult::Cons(_, _)),
        "LIST" => matches!(value, EvalResult::Cons(_, _) | EvalResult::Nil),
        "ATOM" => !matches!(value, EvalResult::Cons(_, _)),
        "SEQUENCE" => matches!(
            value,
            EvalResult::Cons(_, _) | EvalResult::Array(_) | EvalResult::String(_) | EvalResult::Nil
        ),
        "ARRAY" | "VECTOR" | "SIMPLE-VECTOR" => matches!(value, EvalResult::Array(_)),
        "HASH-TABLE" => matches!(value, EvalResult::HashTable(_)),
        "FUNCTION" => matches!(
            value,
            EvalResult::Lambda { .. }
                | EvalResult::Macro { .. }
                | EvalResult::ModifyMacro { .. }
                | EvalResult::BuiltinFunction(_)
                | EvalResult::GenericFunction(_)
                | EvalResult::ForeignFunction(_)
        ),
        "BOOLEAN" => match value {
            EvalResult::Nil | EvalResult::Bool(_) | EvalResult::Boolean(_) => true,
            EvalResult::Symbol(s) if s.to_uppercase() == "T" => true,
            _ => false,
        },
        "CHARACTER" => matches!(value, EvalResult::Character(_)),
        "INSTANCE" => matches!(value, EvalResult::Instance(_)),
        "GENERIC-FUNCTION" => matches!(value, EvalResult::GenericFunction(_)),
        "PACKAGE" => {
            // Check if the value is a Package object or a symbol naming a valid package
            match value {
                EvalResult::Package(_) => true,
                EvalResult::Symbol(name) => super::eval_package::PACKAGES
                    .with(|p| p.borrow().contains_key(&name.to_uppercase())),
                _ => false,
            }
        }
        "PACKAGE-DESIGNATOR" => {
            // A package designator can be a package, string, or symbol
            matches!(value, EvalResult::Symbol(_) | EvalResult::String(_))
        }
        _ => {
            // For compound types like (or null package), (member nil t), etc.
            // or for unknown types, just return true for now (permissive)
            true
        }
    }
}

/// Implements (define-modify-macro name lambda-list function [documentation])
/// This macro-defining macro creates a read-modify-write macro.
/// Example: (define-modify-macro incf (&optional (delta 1)) +)
/// creates (defmacro incf (place &optional (delta 1)) `(setf ,place (+ ,place ,delta)))
pub(super) fn eval_define_modify_macro(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (define-modify-macro name lambda-list function [documentation])
    if args.len() < 3 {
        return Err(
            "define-modify-macro requires at least 3 arguments (name lambda-list function)"
                .to_string(),
        );
    }

    // Get name - could be Variable or quoted symbol
    let name = match &args[0] {
        ASTNode::Variable(s) => s.clone(),
        ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
        _ => return Err("define-modify-macro: name must be a symbol".to_string()),
    };

    // Get function name
    let func_name = match &args[2] {
        ASTNode::Variable(s) => s.clone(),
        ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
        _ => return Err("define-modify-macro: function must be a symbol".to_string()),
    };

    // Extract lambda-list parameters
    let lambda_list_nodes = match &args[1] {
        ASTNode::Call {
            function,
            args: inner_args,
        } => {
            let mut nodes = vec![function.as_ref().clone()];
            nodes.extend(inner_args.clone());
            nodes
        }
        _ => vec![], // Empty lambda list
    };

    // Check for &rest
    let has_rest = lambda_list_nodes.iter().any(|n| match n {
        ASTNode::Variable(s) | ASTNode::Constant(ConstantValue::Symbol(s)) => s == "&rest",
        _ => false,
    });

    // Get parameter names from AST nodes
    fn get_symbol_name(node: &ASTNode) -> Option<String> {
        match node {
            ASTNode::Variable(s) => Some(s.clone()),
            ASTNode::Constant(ConstantValue::Symbol(s)) => Some(s.clone()),
            ASTNode::Call { function, .. } => get_symbol_name(function),
            _ => None,
        }
    }

    // Build macro parameters: (place &optional arg1 arg2) or (place &rest args)
    let mut macro_params = vec!["place".to_string()];
    for node in &lambda_list_nodes {
        if let Some(s) = get_symbol_name(node) {
            macro_params.push(s);
        }
    }

    // Store as modify-macro which will be expanded specially
    let macro_def = EvalResult::ModifyMacro {
        name: name.clone(),
        params: macro_params,
        function: func_name.clone(),
        has_rest,
    };

    // Register in the environment (like defmacro does)
    env.insert(name.clone(), macro_def);

    Ok(EvalResult::Symbol(name))
}

// Helper to navigate and get value from car/cdr accessors
fn navigate_and_get(accessor: &str, cons: EvalResult) -> Result<EvalResult, String> {
    // Parse accessor: "cadr" means (car (cdr x))
    // We need to read from right to left: first cdr, then car
    let ops: Vec<char> = accessor.chars().skip(1).take(accessor.len() - 2).collect();
    let mut current = cons;

    // Navigate through all ops
    for &op in ops.iter().rev() {
        current = match current {
            EvalResult::Cons(car, cdr) => {
                if op == 'a' {
                    car.borrow().clone()
                } else {
                    cdr.borrow().clone()
                }
            }
            _ => return Err(format!("Not a cons cell while navigating {}", accessor)),
        };
    }

    Ok(current)
}

// Helper to navigate and set value for car/cdr accessors
fn navigate_and_incf(
    accessor: &str,
    cons: EvalResult,
    delta: EvalResult,
) -> Result<EvalResult, String> {
    // Parse accessor: "cadr" means (car (cdr x)), so we modify (car (cdr x))
    let ops: Vec<char> = accessor.chars().skip(1).take(accessor.len() - 2).collect();
    let mut current = cons;

    // Navigate to the parent cons cell (all but the last op)
    for &op in ops.iter().skip(1) {
        current = match current {
            EvalResult::Cons(car, cdr) => {
                if op == 'a' {
                    car.borrow().clone()
                } else {
                    cdr.borrow().clone()
                }
            }
            _ => return Err(format!("Not a cons cell while navigating {}", accessor)),
        };
    }

    // Now modify based on the first op
    match current {
        EvalResult::Cons(car, cdr) => {
            let cell_to_modify = if ops[0] == 'a' { &car } else { &cdr };
            let current_val = cell_to_modify.borrow().clone();

            // Add delta to current value
            let new_val = match (current_val, delta) {
                (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a + b),
                (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a + b),
                (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 + b),
                (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a + b as f64),
                _ => return Err("incf requires numeric arguments".to_string()),
            };

            *cell_to_modify.borrow_mut() = new_val.clone();
            Ok(new_val)
        }
        other => Err(format!(
            "Not a cons cell for final {} operation: {:?}",
            accessor, other
        )),
    }
}

pub(super) fn eval_incf(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (incf place [delta])
    if args.is_empty() {
        return Err("incf requires at least 1 argument".to_string());
    }

    let place = &args[0];
    let delta = super::eval_types::primary_value(if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Fixnum(1)
    });

    // For historical compatibility, unbound variables and absent gethash values
    // behave as if initialized to 0 for INCF.
    let current_val = super::eval_types::primary_value(match place {
        ASTNode::Variable(name) => env.get(name).cloned().unwrap_or(EvalResult::Fixnum(0)),
        ASTNode::Call {
            function,
            args: place_args,
        } => {
            if let ASTNode::Variable(func_name) = &**function {
                match func_name.as_str() {
                    "gethash" if place_args.len() >= 2 => {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;
                        let key_str = super::eval_system::key_to_typed_string(&key)?;
                        match ht {
                            EvalResult::HashTable(ref table) => table
                                .borrow()
                                .get(&key_str)
                                .cloned()
                                .unwrap_or(EvalResult::Fixnum(0)),
                            _ => return Err("incf gethash: not a hash table".to_string()),
                        }
                    }
                    _ => eval_with_env(place, env)?,
                }
            } else {
                eval_with_env(place, env)?
            }
        }
        _ => eval_with_env(place, env)?,
    });

    let new_val = match (current_val, delta) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a + b),
        (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a + b),
        (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 + b),
        (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a + b as f64),
        _ => return Err("incf requires numeric arguments".to_string()),
    };

    let setf_args = vec![
        place.clone(),
        super::eval_system::result_to_ast_quoted(&new_val)?,
    ];
    eval_setf(&setf_args, env)?;

    Ok(new_val)
}

pub(super) fn eval_decf(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (decf place [delta])
    if args.is_empty() {
        return Err("decf requires at least 1 argument".to_string());
    }

    let place = &args[0];
    let delta = super::eval_types::primary_value(if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Fixnum(1)
    });

    // Keep parity with INCF behavior for historical tests.
    let current_val = super::eval_types::primary_value(match place {
        ASTNode::Variable(name) => env.get(name).cloned().unwrap_or(EvalResult::Fixnum(0)),
        ASTNode::Call {
            function,
            args: place_args,
        } => {
            if let ASTNode::Variable(func_name) = &**function {
                match func_name.as_str() {
                    "gethash" if place_args.len() >= 2 => {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;
                        let key_str = super::eval_system::key_to_typed_string(&key)?;
                        match ht {
                            EvalResult::HashTable(ref table) => table
                                .borrow()
                                .get(&key_str)
                                .cloned()
                                .unwrap_or(EvalResult::Fixnum(0)),
                            _ => return Err("decf gethash: not a hash table".to_string()),
                        }
                    }
                    _ => eval_with_env(place, env)?,
                }
            } else {
                eval_with_env(place, env)?
            }
        }
        _ => eval_with_env(place, env)?,
    });

    let new_val = match (current_val, delta) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a - b),
        (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a - b),
        (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(a as f64 - b),
        (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a - b as f64),
        _ => return Err("decf requires numeric arguments".to_string()),
    };

    let setf_args = vec![
        place.clone(),
        super::eval_system::result_to_ast_quoted(&new_val)?,
    ];
    eval_setf(&setf_args, env)?;

    Ok(new_val)
}

pub(super) fn eval_eval_when(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (eval-when (situation*) form*)
    // Situations: :compile-toplevel, :load-toplevel, :execute
    // In interpreter mode:
    //   - :execute means execute now
    //   - :load-toplevel means execute when loading
    //   - :compile-toplevel is ignored (we're not compiling)
    if args.is_empty() {
        return Err("eval-when requires at least 1 argument".to_string());
    }

    // Parse the situations list
    let mut should_execute = false;

    if let Some(situations) = args.get(0) {
        let situation_list = match situations {
            ASTNode::Call {
                function: _,
                args: situations_args,
            } => {
                // (situation1 situation2 ...)
                let mut slist = vec![];
                match &**&situations {
                    ASTNode::Variable(first) => slist.push(first.clone()),
                    ASTNode::Constant(crate::ir::ConstantValue::Symbol(s)) => slist.push(s.clone()),
                    _ => {}
                }
                for arg in situations_args {
                    match arg {
                        ASTNode::Variable(s) => slist.push(s.clone()),
                        ASTNode::Constant(crate::ir::ConstantValue::Symbol(s)) => {
                            slist.push(s.clone())
                        }
                        _ => {}
                    }
                }
                slist
            }
            ASTNode::Constant(crate::ir::ConstantValue::Nil) => {
                // Empty situations list - don't execute
                vec![]
            }
            ASTNode::Variable(s) => vec![s.clone()],
            ASTNode::Constant(crate::ir::ConstantValue::Symbol(s)) => vec![s.clone()],
            _ => vec![],
        };

        // Check if any situation matches interpreter mode
        for situation in situation_list {
            let sit_lower = situation.to_lowercase();
            let sit_normalized = sit_lower.trim_start_matches(':');
            match sit_normalized {
                "execute" | "eval" => {
                    // :execute - execute at runtime in interpreter
                    should_execute = true;
                }
                "load-toplevel" | "load" => {
                    // :load-toplevel - execute when loading file (interpreter loads)
                    should_execute = true;
                }
                "compile-toplevel" | "compile" => {
                    // :compile-toplevel - only for compiler, ignore in interpreter
                    // But many ASDF forms use this, so we execute anyway for compatibility
                    should_execute = true;
                }
                _ => {}
            }
        }
    }

    if !should_execute {
        return Ok(EvalResult::Nil);
    }

    // Execute the forms
    let forms = &args[1..];
    let mut result = EvalResult::Nil;
    for form in forms {
        result = eval_with_env(form, env)?;
    }
    Ok(result)
}

pub(super) fn eval_setf(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (setf place value [place value]...)
    if args.is_empty() || args.len() % 2 != 0 {
        return Err("setf requires an even number of arguments (place value pairs)".to_string());
    }

    let mut last_value = EvalResult::Nil;

    for i in (0..args.len()).step_by(2) {
        let place = &args[i];
        let value = eval_with_env(&args[i + 1], env)?;

        match place {
            // Simple variable
            ASTNode::Variable(var_name) => {
                // Handle special global variables
                if var_name == "*features*" {
                    super::eval_symbol::set_features(value.clone());
                    last_value = value.clone();
                } else if super::eval_core::assign_existing_lexical_if_unambiguous(
                    var_name,
                    value.clone(),
                    env,
                ) {
                    last_value = value.clone();
                } else {
                    super::eval_core::assign_setq_like(var_name, value.clone(), env);
                    last_value = value.clone();
                }
            }
            // (gethash key ht) or (aref array index)
            ASTNode::Call {
                function,
                args: place_args,
            } => {
                if let ASTNode::Variable(func_name) = &**function {
                    let base_name = func_name.rsplit(':').next().unwrap_or(func_name.as_str());
                    if base_name.eq_ignore_ascii_case("atomic") && !place_args.is_empty() {
                        // (setf (mp:atomic PLACE &key ...) value) -> (setf PLACE value)
                        let nested_setf = ASTNode::Call {
                            function: Box::new(ASTNode::Variable("setf".to_string())),
                            args: vec![
                                place_args[0].clone(),
                                super::eval_system::result_to_ast_quoted(&value)?,
                            ],
                        };
                        last_value = eval_with_env(&nested_setf, env)?;
                    } else if base_name.eq_ignore_ascii_case("readtable-case")
                        && !place_args.is_empty()
                    {
                        let mut eval_args: Vec<EvalResult> = Vec::with_capacity(2);
                        eval_args.push(super::eval_types::primary_value(value.clone()));
                        eval_args.push(super::eval_types::primary_value(eval_with_env(
                            &place_args[0],
                            env,
                        )?));
                        last_value = super::eval_readtable::with_readtable_eval_env(env, || {
                            super::eval_readtable::set_readtable_case_builtin(&eval_args)
                        })?;
                    } else if base_name.eq_ignore_ascii_case("stream-element-type")
                        && !place_args.is_empty()
                    {
                        let stream = eval_with_env(&place_args[0], env)?;
                        let _ = super::eval_io::call_io_builtin(
                            "set-stream-element-type",
                            &[stream, value.clone()],
                        )?;
                        last_value = value.clone();
                    } else if base_name.eq_ignore_ascii_case("stream-external-format")
                        && !place_args.is_empty()
                    {
                        let stream = eval_with_env(&place_args[0], env)?;
                        let _ = super::eval_io::call_io_builtin(
                            "set-stream-external-format",
                            &[stream, value.clone()],
                        )?;
                        last_value = value.clone();
                    } else if base_name.eq_ignore_ascii_case("logical-pathname-translations")
                        && place_args.len() == 1
                    {
                        let host = eval_with_env(&place_args[0], env)?;
                        let host =
                            match host {
                                EvalResult::String(host) | EvalResult::Symbol(host) => host,
                                _ => return Err(
                                    "setf logical-pathname-translations requires a host designator"
                                        .to_string(),
                                ),
                            };
                        last_value =
                            super::eval_pathname::set_logical_pathname_translations(&host, &value)?;
                    } else if base_name.eq_ignore_ascii_case("documentation")
                        && place_args.len() >= 2
                    {
                        let target = eval_with_env(&place_args[0], env)?;
                        let doc_type = eval_with_env(&place_args[1], env)?;
                        match target {
                            EvalResult::Symbol(sym) => {
                                super::eval_symbol::set_symbol_property(
                                    &sym,
                                    doc_type,
                                    value.clone(),
                                );
                                last_value = value.clone();
                            }
                            _ => {
                                last_value = value.clone();
                            }
                        }
                    } else if base_name.eq_ignore_ascii_case("gethash") && place_args.len() >= 2 {
                        let key = eval_with_env(&place_args[0], env)?;
                        let ht = eval_with_env(&place_args[1], env)?;

                        let key_str = super::eval_system::key_to_typed_string(&key)?;

                        match ht {
                            EvalResult::HashTable(ref table) => {
                                table.borrow_mut().insert(key_str, value.clone());
                                last_value = value.clone();
                            }
                            _ => {
                                return Err("setf gethash: second argument must be a hash table"
                                    .to_string())
                            }
                        }
                    } else if base_name.eq_ignore_ascii_case("symbol-value")
                        && place_args.len() == 1
                    {
                        let sym_val = eval_with_env(&place_args[0], env)?;
                        let sym_val = match sym_val {
                            EvalResult::MultipleValues(vals) if !vals.is_empty() => vals[0].clone(),
                            other => other,
                        };

                        let sym_name = match sym_val {
                            EvalResult::Symbol(name) => name,
                            EvalResult::Nil => {
                                return Err("setf symbol-value: nil is not a symbol".to_string())
                            }
                            _ => return Err("setf symbol-value requires a symbol".to_string()),
                        };

                        if sym_name == "*features*" {
                            super::eval_symbol::set_features(value.clone());
                        } else {
                            super::eval_core::assign_setq_like(&sym_name, value.clone(), env);
                        }
                        last_value = value.clone();
                    } else if base_name.eq_ignore_ascii_case("symbol-plist")
                        && place_args.len() == 1
                    {
                        let sym_val = eval_with_env(&place_args[0], env)?;
                        let sym_name = match sym_val {
                            EvalResult::Symbol(name) => name,
                            EvalResult::Nil => "NIL".to_string(),
                            _ => return Err("setf symbol-plist requires a symbol".to_string()),
                        };
                        super::eval_symbol::set_symbol_plist(&sym_name, value.clone())?;
                        last_value = value.clone();
                    } else if base_name.eq_ignore_ascii_case("get") && place_args.len() >= 2 {
                        let sym_val = eval_with_env(&place_args[0], env)?;
                        let sym_name = match sym_val {
                            EvalResult::Symbol(name) => name,
                            EvalResult::Nil => "NIL".to_string(),
                            _ => return Err("setf get requires a symbol".to_string()),
                        };
                        let indicator = eval_with_env(&place_args[1], env)?;
                        super::eval_symbol::set_symbol_property(
                            &sym_name,
                            indicator,
                            value.clone(),
                        );
                        last_value = value.clone();
                    } else if base_name.eq_ignore_ascii_case("find-class") && !place_args.is_empty()
                    {
                        let class_name = match eval_with_env(&place_args[0], env)? {
                            EvalResult::Symbol(name) => name,
                            EvalResult::String(name) => name,
                            _ => return Err("setf find-class requires a symbol".to_string()),
                        };
                        let base = class_name.rsplit(':').next().unwrap_or(class_name.as_str());
                        if matches!(
                            value,
                            EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)
                        ) {
                            for name in [class_name.as_str(), base] {
                                super::eval_core::remove_setq_like(
                                    &super::eval_clos::class_slots_key(name),
                                    env,
                                );
                                super::eval_core::remove_setq_like(
                                    &super::eval_clos::class_initargs_key(name),
                                    env,
                                );
                                super::eval_core::remove_setq_like(
                                    &super::eval_clos::class_supers_key(name),
                                    env,
                                );
                                super::eval_core::remove_setq_like(
                                    &format!("*class-{}*", name.to_uppercase()),
                                    env,
                                );
                            }
                            super::eval_types::unregister_class_hierarchy(&class_name);
                        } else {
                            super::eval_core::assign_setq_like(
                                &format!("*class-{}*", class_name.to_uppercase()),
                                value.clone(),
                                env,
                            );
                            if !base.eq_ignore_ascii_case(&class_name) {
                                super::eval_core::assign_setq_like(
                                    &format!("*class-{}*", base.to_uppercase()),
                                    value.clone(),
                                    env,
                                );
                            }
                        }
                        last_value = value.clone();
                    } else if base_name.eq_ignore_ascii_case("fdefinition") && place_args.len() == 1
                    {
                        let target = eval_with_env(&place_args[0], env)?;
                        let parsed = super::eval_system::parse_function_name_designator(&target)
                            .map_err(|_| {
                                "TYPE-ERROR: setf fdefinition requires a valid function-name"
                                    .to_string()
                            })?;
                        let symbol_name = match &parsed {
                            super::eval_system::ParsedFunctionName::Ordinary(s)
                            | super::eval_system::ParsedFunctionName::Setf(s) => s.clone(),
                        };
                        let target_pkg = if let Some((pkg, _)) = symbol_name.split_once("::") {
                            pkg.to_string()
                        } else if let Some((pkg, _)) = symbol_name.split_once(':') {
                            pkg.to_string()
                        } else {
                            super::eval_package::get_current_package()
                        };
                        if super::eval_package::is_package_locked(&target_pkg) {
                            return super::eval_package::signal_package_lock_violation(
                                "Package is locked",
                                env,
                            );
                        }
                        match parsed {
                            super::eval_system::ParsedFunctionName::Ordinary(s) => {
                                for name in super::eval_system::ordinary_function_name_variants(&s)
                                {
                                    super::eval_core::assign_setq_like(
                                        &format!(
                                            "{}{}",
                                            super::eval_core::FUNCTION_NS_PREFIX,
                                            name
                                        ),
                                        value.clone(),
                                        env,
                                    );
                                }
                            }
                            super::eval_system::ParsedFunctionName::Setf(s) => {
                                for name in super::eval_system::ordinary_function_name_variants(&s)
                                {
                                    super::eval_core::assign_setq_like(
                                        &format!(
                                            "{}(setf {})",
                                            super::eval_core::FUNCTION_NS_PREFIX,
                                            name
                                        ),
                                        value.clone(),
                                        env,
                                    );
                                    super::eval_core::assign_setq_like(
                                        &format!(
                                            "{}setf-{}",
                                            super::eval_core::FUNCTION_NS_PREFIX,
                                            name
                                        ),
                                        value.clone(),
                                        env,
                                    );
                                    super::eval_core::assign_setq_like(
                                        &format!("(setf {})", name),
                                        value.clone(),
                                        env,
                                    );
                                }
                            }
                        }
                        last_value = value.clone();
                    } else if base_name.eq_ignore_ascii_case("macro-function")
                        && place_args.len() == 1
                    {
                        let target = eval_with_env(&place_args[0], env)?;
                        let symbol_name = match &target {
                            EvalResult::Symbol(s) | EvalResult::String(s) => s.clone(),
                            _ => return Err("setf macro-function requires a symbol".to_string()),
                        };
                        let target_pkg = if let Some((pkg, _)) = symbol_name.split_once("::") {
                            pkg.to_string()
                        } else if let Some((pkg, _)) = symbol_name.split_once(':') {
                            pkg.to_string()
                        } else {
                            super::eval_package::get_current_package()
                        };
                        if super::eval_package::is_package_locked(&target_pkg) {
                            return super::eval_package::signal_package_lock_violation(
                                "Package is locked",
                                env,
                            );
                        }
                        let macro_value = match value.clone() {
                            EvalResult::Lambda { params, body, .. } => {
                                let params_ast = if params.is_empty() {
                                    ASTNode::nil()
                                } else {
                                    let mut nodes: Vec<ASTNode> =
                                        params.into_iter().map(ASTNode::Variable).collect();
                                    let first = nodes.remove(0);
                                    ASTNode::Call {
                                        function: Box::new(first),
                                        args: nodes,
                                    }
                                };
                                EvalResult::Macro {
                                    params: Box::new(params_ast),
                                    body,
                                }
                            }
                            other => other,
                        };
                        let mut names = vec![
                            symbol_name.clone(),
                            symbol_name.to_ascii_uppercase(),
                            symbol_name.to_ascii_lowercase(),
                        ];
                        if let Some(base) = symbol_name.rsplit(':').next() {
                            if base != symbol_name {
                                names.push(base.to_string());
                                names.push(base.to_ascii_uppercase());
                                names.push(base.to_ascii_lowercase());
                            }
                        }
                        names.sort();
                        names.dedup();
                        for name in names {
                            super::eval_core::assign_setq_like(
                                &format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, name),
                                macro_value.clone(),
                                env,
                            );
                        }
                        last_value = macro_value;
                    } else if base_name.eq_ignore_ascii_case("compiler-macro-function")
                        && place_args.len() == 1
                    {
                        let target = eval_with_env(&place_args[0], env)?;
                        let symbol_name = match &target {
                            EvalResult::Symbol(s) | EvalResult::String(s) => s.clone(),
                            _ => {
                                return Err(
                                    "setf compiler-macro-function requires a symbol".to_string()
                                )
                            }
                        };
                        let target_pkg = if let Some((pkg, _)) = symbol_name.split_once("::") {
                            pkg.to_string()
                        } else if let Some((pkg, _)) = symbol_name.split_once(':') {
                            pkg.to_string()
                        } else {
                            super::eval_package::get_current_package()
                        };
                        if super::eval_package::is_package_locked(&target_pkg) {
                            return super::eval_package::signal_package_lock_violation(
                                "Package is locked",
                                env,
                            );
                        }
                        let mut names = vec![symbol_name.clone(), symbol_name.to_ascii_uppercase()];
                        if let Some(base) = symbol_name.rsplit(':').next() {
                            names.push(base.to_string());
                            names.push(base.to_ascii_uppercase());
                        }
                        names.sort();
                        names.dedup();
                        for name in names {
                            super::eval_core::assign_setq_like(
                                &format!("compiler-macro:{}", name),
                                value.clone(),
                                env,
                            );
                        }
                        last_value = value.clone();
                    } else if (base_name.eq_ignore_ascii_case("sbit")
                        || base_name.eq_ignore_ascii_case("bit"))
                        && place_args.len() >= 2
                    {
                        let array_result = eval_with_env(&place_args[0], env)?;
                        let index = eval_with_env(&place_args[1], env)?;
                        let idx = match index {
                            EvalResult::Fixnum(n) if n >= 0 => n as usize,
                            _ => {
                                return Err(format!(
                                    "{} index must be a non-negative integer",
                                    func_name
                                ))
                            }
                        };
                        let bit_value = match value {
                            EvalResult::Fixnum(0) | EvalResult::Nil => EvalResult::Fixnum(0),
                            EvalResult::Fixnum(1)
                            | EvalResult::Bool(true)
                            | EvalResult::Boolean(true) => EvalResult::Fixnum(1),
                            _ => {
                                return Err(format!(
                                    "setf {} requires a bit value of 0 or 1",
                                    func_name
                                ))
                            }
                        };
                        match array_result {
                            EvalResult::Array(ref arr) => {
                                let mut array_mut = arr.borrow_mut();
                                if idx < array_mut.len() {
                                    array_mut[idx] = bit_value.clone();
                                    last_value = bit_value;
                                } else {
                                    return Err(format!(
                                        "{} index {} out of bounds (array length {})",
                                        func_name,
                                        idx,
                                        array_mut.len()
                                    ));
                                }
                            }
                            EvalResult::String(ref s) => {
                                let mut chars: Vec<char> = s.chars().collect();
                                if idx >= chars.len() {
                                    return Err(format!(
                                        "{} index {} out of bounds (string length {})",
                                        func_name,
                                        idx,
                                        chars.len()
                                    ));
                                }
                                chars[idx] = if matches!(bit_value, EvalResult::Fixnum(0)) {
                                    '0'
                                } else {
                                    '1'
                                };
                                let new_string = chars.into_iter().collect::<String>();
                                if let ASTNode::Variable(var_name) = &place_args[0] {
                                    env.insert(var_name.clone(), EvalResult::String(new_string));
                                    last_value = bit_value;
                                } else {
                                    return Err(format!(
                                        "setf {}: string place must be a simple variable",
                                        func_name
                                    ));
                                }
                            }
                            _ => {
                                return Err(format!(
                                    "setf {}: first argument must be a bit array",
                                    func_name
                                ))
                            }
                        }
                    } else if (base_name.eq_ignore_ascii_case("aref")
                        || base_name.eq_ignore_ascii_case("svref"))
                        && !place_args.is_empty()
                    {
                        // For (setf (aref array-var index) value), get the array from environment
                        let array_result = eval_with_env(&place_args[0], env)?;

                        match array_result {
                            EvalResult::Array(ref arr) => {
                                let idx = if place_args.len() == 1 {
                                    if super::eval_system::get_array_dims(arr).is_empty() {
                                        0
                                    } else {
                                        return Err(
                                            "setf aref requires an index for non-rank-0 arrays"
                                                .to_string(),
                                        );
                                    }
                                } else {
                                    match eval_with_env(&place_args[1], env)? {
                                        EvalResult::Fixnum(n) if n >= 0 => n as usize,
                                        _ => {
                                            return Err("aref index must be a non-negative integer"
                                                .to_string())
                                        }
                                    }
                                };
                                let mut array_mut = arr.borrow_mut();
                                if idx < array_mut.len() {
                                    array_mut[idx] = value.clone();
                                    last_value = value.clone();
                                } else {
                                    return Err(format!(
                                        "aref index {} out of bounds (array length {})",
                                        idx,
                                        array_mut.len()
                                    ));
                                }
                            }
                            EvalResult::String(ref s) => {
                                if place_args.len() < 2 {
                                    return Err("setf aref on string requires exactly one index"
                                        .to_string());
                                }
                                // Special case: strings are mutable in Common Lisp
                                // Convert to Vec<char>, modify, convert back
                                let idx = match eval_with_env(&place_args[1], env)? {
                                    EvalResult::Fixnum(n) if n >= 0 => n as usize,
                                    _ => {
                                        return Err(
                                            "aref index must be a non-negative integer".to_string()
                                        )
                                    }
                                };
                                let mut chars: Vec<char> = s.chars().collect();
                                if idx >= chars.len() {
                                    return Err(format!(
                                        "aref index {} out of bounds (string length {})",
                                        idx,
                                        chars.len()
                                    ));
                                }

                                // Get the character to set
                                let new_char = match value {
                                    EvalResult::Character(c) => c,
                                    EvalResult::String(ref s) if s.len() == 1 => {
                                        s.chars().next().unwrap()
                                    }
                                    _ => {
                                        return Err(
                                            "setf aref on string requires a character value"
                                                .to_string(),
                                        )
                                    }
                                };

                                chars[idx] = new_char;
                                let new_string = chars.into_iter().collect::<String>();

                                // Update the variable in the environment
                                // We need to get the variable name from place_args[0]
                                if let ASTNode::Variable(var_name) = &place_args[0] {
                                    env.insert(var_name.clone(), EvalResult::String(new_string));
                                    last_value = EvalResult::Character(new_char);
                                } else {
                                    return Err(
                                        "setf aref: string place must be a simple variable"
                                            .to_string(),
                                    );
                                }
                            }
                            _ => {
                                return Err(format!(
                                "setf aref: first argument must be an array or string, got {:?}",
                                array_result
                            ))
                            }
                        }
                    } else if (base_name.eq_ignore_ascii_case("mem-ref")
                        || base_name.eq_ignore_ascii_case("mem-aref"))
                        && place_args.len() >= 2
                    {
                        let ptr = eval_with_env(&place_args[0], env)?;
                        let type_val = eval_with_env(&place_args[1], env)?;
                        let mut byte_offset = if place_args.len() >= 3 {
                            let off_val = eval_with_env(&place_args[2], env)?;
                            match off_val {
                                EvalResult::Fixnum(n) if n >= 0 => n as usize,
                                _ => {
                                    return Err(
                                        "setf mem-ref offset must be a non-negative integer"
                                            .to_string(),
                                    )
                                }
                            }
                        } else {
                            0usize
                        };
                        if base_name.eq_ignore_ascii_case("mem-aref") {
                            let size_call = ASTNode::Call {
                                function: Box::new(ASTNode::Variable(
                                    "clasp-ffi:%foreign-type-size".to_string(),
                                )),
                                args: vec![super::eval_system::result_to_ast_quoted(&type_val)?],
                            };
                            let elem_size = match eval_with_env(&size_call, env)? {
                                EvalResult::Fixnum(n) if n >= 0 => n as usize,
                                _ => {
                                    return Err("setf mem-aref unsupported foreign element type"
                                        .to_string())
                                }
                            };
                            byte_offset = byte_offset
                                .checked_mul(elem_size)
                                .ok_or_else(|| "setf mem-aref offset overflow".to_string())?;
                            if place_args.len() >= 4 {
                                let extra_off = eval_with_env(&place_args[3], env)?;
                                let extra = match extra_off {
                                    EvalResult::Fixnum(n) if n >= 0 => n as usize,
                                    _ => return Err(
                                        "setf mem-aref extra offset must be a non-negative integer"
                                            .to_string(),
                                    ),
                                };
                                byte_offset = byte_offset
                                    .checked_add(extra)
                                    .ok_or_else(|| "setf mem-aref offset overflow".to_string())?;
                            }
                        }
                        let ptr_tmp = format!("__SETF_MEM_PTR_{}__", i);
                        env.insert(ptr_tmp.clone(), ptr);
                        let set_call = ASTNode::Call {
                            function: Box::new(ASTNode::Variable("clasp-ffi:%mem-set".to_string())),
                            args: vec![
                                ASTNode::Variable(ptr_tmp.clone()),
                                super::eval_system::result_to_ast_quoted(&type_val)?,
                                super::eval_system::result_to_ast_quoted(&value)?,
                                ASTNode::fixnum(byte_offset as i64),
                            ],
                        };
                        last_value = eval_with_env(&set_call, env)?;
                        env.remove(&ptr_tmp);
                    } else if base_name.eq_ignore_ascii_case("char") && place_args.len() >= 2 {
                        // (setf (char string index) value) - same as aref for strings
                        let string_result = eval_with_env(&place_args[0], env)?;
                        let index = eval_with_env(&place_args[1], env)?;

                        let idx = match index {
                            EvalResult::Fixnum(n) if n >= 0 => n as usize,
                            _ => {
                                return Err("char index must be a non-negative integer".to_string())
                            }
                        };

                        match string_result {
                            EvalResult::String(ref s) => {
                                let mut chars: Vec<char> = s.chars().collect();
                                if idx >= chars.len() {
                                    return Err(format!(
                                        "char index {} out of bounds (string length {})",
                                        idx,
                                        chars.len()
                                    ));
                                }

                                // Get the character to set
                                let new_char = match value {
                                    EvalResult::Character(c) => c,
                                    EvalResult::String(ref s) if s.len() == 1 => {
                                        s.chars().next().unwrap()
                                    }
                                    _ => {
                                        return Err(
                                            "setf char requires a character value".to_string()
                                        )
                                    }
                                };

                                chars[idx] = new_char;
                                let new_string = chars.into_iter().collect::<String>();

                                // Update the variable in the environment
                                if let ASTNode::Variable(var_name) = &place_args[0] {
                                    env.insert(var_name.clone(), EvalResult::String(new_string));
                                    last_value = EvalResult::Character(new_char);
                                } else {
                                    return Err(
                                        "setf char: string place must be a simple variable"
                                            .to_string(),
                                    );
                                }
                            }
                            _ => {
                                return Err("setf char: first argument must be a string".to_string())
                            }
                        }
                    } else if base_name.eq_ignore_ascii_case("fill-pointer")
                        && place_args.len() == 1
                    {
                        let array_result = eval_with_env(&place_args[0], env)?;
                        let new_fp = match &value {
                            EvalResult::Fixnum(n) if *n >= 0 => *n as usize,
                            _ => return Err("TYPE-ERROR".to_string()),
                        };

                        match array_result {
                            EvalResult::Array(arr) => {
                                let dims = super::eval_system::get_array_dims(&arr);
                                if dims.len() != 1 {
                                    return Err("TYPE-ERROR".to_string());
                                }
                                if super::eval_system::get_array_fill_pointer(&arr).is_none() {
                                    return Err("TYPE-ERROR".to_string());
                                }
                                if new_fp > arr.borrow().len() {
                                    return Err("TYPE-ERROR".to_string());
                                }
                                super::eval_system::set_array_fill_pointer(&arr, Some(new_fp));
                                last_value = value.clone();
                            }
                            _ => return Err("TYPE-ERROR".to_string()),
                        }
                    } else if base_name.eq_ignore_ascii_case("elt") && place_args.len() >= 2 {
                        let sequence_result = eval_with_env(&place_args[0], env)?;
                        let index_result = eval_with_env(&place_args[1], env)?;

                        let idx = match index_result {
                            EvalResult::Fixnum(n) if n >= 0 => n as usize,
                            _ => return Err("TYPE-ERROR".to_string()),
                        };

                        match sequence_result {
                            EvalResult::Array(arr) => {
                                let active_len = super::eval_system::get_array_fill_pointer(&arr)
                                    .unwrap_or_else(|| arr.borrow().len());
                                if idx >= active_len {
                                    return Err("TYPE-ERROR".to_string());
                                }
                                let mut cells = arr.borrow_mut();
                                if idx >= cells.len() {
                                    return Err("TYPE-ERROR".to_string());
                                }
                                cells[idx] = value.clone();
                                last_value = value.clone();
                            }
                            EvalResult::String(s) => {
                                let mut chars: Vec<char> = s.chars().collect();
                                if idx >= chars.len() {
                                    return Err("TYPE-ERROR".to_string());
                                }
                                let new_char = match value {
                                    EvalResult::Character(c) => c,
                                    EvalResult::String(ref s) if s.chars().count() == 1 => {
                                        s.chars().next().unwrap()
                                    }
                                    _ => return Err("TYPE-ERROR".to_string()),
                                };
                                chars[idx] = new_char;
                                let new_string = chars.into_iter().collect::<String>();
                                if let ASTNode::Variable(var_name) = &place_args[0] {
                                    env.insert(var_name.clone(), EvalResult::String(new_string));
                                    last_value = EvalResult::Character(new_char);
                                } else {
                                    return Err("TYPE-ERROR".to_string());
                                }
                            }
                            EvalResult::Cons(_, _) | EvalResult::Nil => {
                                let mut current = sequence_result;
                                for _ in 0..idx {
                                    match current {
                                        EvalResult::Cons(_, cdr) => {
                                            current = cdr.borrow().clone();
                                        }
                                        _ => return Err("TYPE-ERROR".to_string()),
                                    }
                                }
                                match current {
                                    EvalResult::Cons(car, _) => {
                                        *car.borrow_mut() = value.clone();
                                        last_value = value.clone();
                                    }
                                    _ => return Err("TYPE-ERROR".to_string()),
                                }
                            }
                            _ => return Err("TYPE-ERROR".to_string()),
                        }
                    } else if base_name.eq_ignore_ascii_case("slot-value") && place_args.len() >= 2
                    {
                        let object = eval_with_env(&place_args[0], env)?;
                        let slot_name = eval_with_env(&place_args[1], env)?;
                        let clos_args = vec![object, slot_name, value.clone()];
                        last_value =
                            super::eval_clos::call_clos_builtin("set-slot-value", &clos_args, env)?;
                    } else if super::eval_list::is_car_cdr_accessor_name(base_name)
                        && place_args.len() >= 1
                    {
                        // (setf (car list) value) or (setf (cadr list) value), etc.
                        // Evaluate the list expression
                        let list_result = eval_with_env(&place_args[0], env)?;
                        let canonical_accessor = match base_name.to_ascii_lowercase().as_str() {
                            "first" => "car".to_string(),
                            "rest" => "cdr".to_string(),
                            "second" => "cadr".to_string(),
                            "third" => "caddr".to_string(),
                            "fourth" => "cadddr".to_string(),
                            "fifth" => "caddddr".to_string(),
                            "sixth" => "cadddddr".to_string(),
                            "seventh" => "caddddddr".to_string(),
                            "eighth" => "cadddddddr".to_string(),
                            "ninth" => "caddddddddr".to_string(),
                            "tenth" => "cadddddddddr".to_string(),
                            _ => base_name.to_ascii_lowercase(),
                        };

                        // Navigate to the correct cons cell based on the accessor
                        fn navigate_and_set(
                            accessor: &str,
                            cons: EvalResult,
                            value: EvalResult,
                        ) -> Result<EvalResult, String> {
                            use std::cell::RefCell;
                            use std::rc::Rc;

                            if accessor.is_empty() {
                                return Err("Invalid accessor".to_string());
                            }

                            // Parse accessor: "cadr" means (car (cdr x))
                            // Extract 'a' and 'd' characters between 'c' and 'r'
                            let ops: Vec<char> =
                                accessor.chars().skip(1).take(accessor.len() - 2).collect();

                            if ops.is_empty() {
                                return Err("Invalid accessor - no operations".to_string());
                            }

                            // Navigate to the target cons cell
                            // For "cadr": ops = ['a', 'd'], we first navigate through all but the first op
                            // i.e., we navigate through ['d'] to get to the cell, then set 'a' of that cell
                            let mut current = cons;

                            // Navigate through all ops except the first (skip the first which is what we set)
                            // For "cadr": navigate through 'd' (cdr)
                            for &op in ops.iter().skip(1) {
                                current = match current {
                                    EvalResult::Cons(car, cdr) => {
                                        if op == 'a' {
                                            car.borrow().clone()
                                        } else {
                                            cdr.borrow().clone()
                                        }
                                    }
                                    _ => {
                                        return Err(format!(
                                            "Not a cons cell while navigating {}",
                                            accessor
                                        ))
                                    }
                                };
                            }

                            // Now set based on the first op (leftmost, i.e., outermost operation)
                            // For "cadr": set the 'a' (car) of the cell
                            match current {
                                EvalResult::Cons(car, cdr) => {
                                    if ops[0] == 'a' {
                                        *car.borrow_mut() = value.clone();
                                    } else {
                                        *cdr.borrow_mut() = value.clone();
                                    }
                                    Ok(value)
                                }
                                _ => {
                                    #[cfg(debug_assertions)]
                                    eprintln!(
                                        "DEBUG setf: non-cons for final {} operation",
                                        accessor
                                    );
                                    Err(format!("Not a cons cell for final {} operation", accessor))
                                }
                            }
                        }

                        last_value =
                            navigate_and_set(&canonical_accessor, list_result, value.clone())?;
                    } else if let Some(expander) = get_setf_expander(func_name) {
                        // User-defined setf expander from defsetf
                        let setf_fn_name = format!(
                            "{}(setf {})",
                            super::eval_core::FUNCTION_NS_PREFIX,
                            func_name
                        );
                        let setf_fn = super::eval_core::lookup_env_binding(&setf_fn_name, env)
                            .or_else(|| {
                                super::eval_core::lookup_global_function_binding(&setf_fn_name)
                            })
                            .or_else(|| {
                                let base_name =
                                    func_name.rsplit(':').next().unwrap_or(func_name.as_str());
                                if base_name.eq_ignore_ascii_case(func_name) {
                                    None
                                } else {
                                    let base_setf = format!(
                                        "{}(setf {})",
                                        super::eval_core::FUNCTION_NS_PREFIX,
                                        base_name
                                    );
                                    super::eval_core::lookup_env_binding(&base_setf, env).or_else(
                                        || {
                                            super::eval_core::lookup_global_function_binding(
                                                &base_setf,
                                            )
                                        },
                                    )
                                }
                            });
                        if let Some(func_val) = setf_fn {
                            let mut eval_args: Vec<EvalResult> =
                                Vec::with_capacity(place_args.len() + 1);
                            eval_args.push(value.clone());
                            for arg_ast in place_args {
                                eval_args.push(eval_with_env(arg_ast, env)?);
                            }
                            last_value = super::eval_system::call_function_with_values(
                                func_val, &eval_args, env,
                            )?;
                            continue;
                        }

                        let local_macro_names = super::eval_core::local_macro_names_from_env(env);
                        let has_local_macro_shadow = local_macro_names.iter().any(|name| {
                            name.eq_ignore_ascii_case(func_name)
                                || name
                                    .rsplit(':')
                                    .next()
                                    .unwrap_or(name.as_str())
                                    .eq_ignore_ascii_case(
                                        func_name.rsplit(':').next().unwrap_or(func_name.as_str()),
                                    )
                        });
                        if has_local_macro_shadow {
                            let macroexpand_1_form = ASTNode::Call {
                                function: Box::new(ASTNode::Variable("macroexpand-1".to_string())),
                                args: vec![ASTNode::Quote(Box::new(place.clone()))],
                            };
                            let expanded_place = super::eval_system::result_to_ast(
                                &eval_with_env(&macroexpand_1_form, env)?,
                            )?;
                            let nested_setf = ASTNode::Call {
                                function: Box::new(ASTNode::Variable("setf".to_string())),
                                args: vec![
                                    expanded_place,
                                    super::eval_system::result_to_ast_quoted(&value)?,
                                ],
                            };
                            last_value = eval_with_env(&nested_setf, env)?;
                            continue;
                        }

                        match expander {
                            SetfExpander::Simple(updater) => {
                                // (defsetf accessor updater) -> (updater args... new-value)
                                let mut call_args = place_args.clone();
                                call_args.push(super::eval_system::result_to_ast_quoted(&value)?);
                                last_value = eval_with_env(
                                    &ASTNode::Call {
                                        function: Box::new(ASTNode::Variable(updater)),
                                        args: call_args,
                                    },
                                    env,
                                )?;
                            }
                            SetfExpander::Complex {
                                lambda_list,
                                store_vars,
                                body,
                            } => {
                                // Complex form - bind lambda-list params to place args, store-vars to value.
                                // Also accepts DEFINE-SETF-EXPANDER style lambda-lists with &environment.
                                let mut expansion_env = env.clone();

                                let mut place_arg_index = 0usize;
                                let mut lambda_index = 0usize;
                                while lambda_index < lambda_list.len() {
                                    let param = &lambda_list[lambda_index];
                                    if param.eq_ignore_ascii_case("&environment") {
                                        if let Some(env_param) = lambda_list.get(lambda_index + 1) {
                                            expansion_env
                                                .insert(env_param.clone(), EvalResult::Nil);
                                        }
                                        lambda_index += 2;
                                        continue;
                                    }
                                    if param.starts_with('&') {
                                        lambda_index += 1;
                                        continue;
                                    }
                                    if let Some(arg) = place_args.get(place_arg_index) {
                                        let arg_val = super::eval_core::ast_to_result(arg)?;
                                        expansion_env.insert(param.clone(), arg_val);
                                        place_arg_index += 1;
                                    }
                                    lambda_index += 1;
                                }

                                // Bind store vars to the new value
                                for store_var in &store_vars {
                                    expansion_env.insert(store_var.clone(), value.clone());
                                }

                                // Evaluate the body to get the expansion form
                                let mut expansion = EvalResult::Nil;
                                for expr in &body {
                                    expansion = eval_with_env(expr, &mut expansion_env)?;
                                }

                                if let EvalResult::MultipleValues(vals) = &expansion {
                                    if vals.len() == 5 {
                                        let temp_names =
                                            eval_result_list_to_symbol_names(&vals[0])?;
                                        let value_forms = eval_result_list_to_vec(&vals[1])?;
                                        let store_names =
                                            eval_result_list_to_symbol_names(&vals[2])?;
                                        if temp_names.len() != value_forms.len() {
                                            return Err(
                                                "get-setf-expansion produced mismatched temp/value forms"
                                                    .to_string(),
                                            );
                                        }
                                        let writer_ast =
                                            super::eval_system::result_to_ast(&vals[3])?;
                                        let mut saved_bindings: HashMap<
                                            String,
                                            Option<EvalResult>,
                                        > = HashMap::new();

                                        for (temp_name, value_form) in
                                            temp_names.iter().zip(value_forms.iter())
                                        {
                                            saved_bindings
                                                .entry(temp_name.clone())
                                                .or_insert_with(|| env.get(temp_name).cloned());
                                            let value_ast =
                                                super::eval_system::result_to_ast(value_form)?;
                                            let evaluated = eval_with_env(&value_ast, env)?;
                                            env.insert(
                                                temp_name.clone(),
                                                super::eval_types::primary_value(evaluated),
                                            );
                                        }
                                        if store_names.is_empty() {
                                            return Err(
                                                "get-setf-expansion produced no store variables"
                                                    .to_string(),
                                            );
                                        }
                                        for (idx, store_name) in store_names.iter().enumerate() {
                                            saved_bindings
                                                .entry(store_name.clone())
                                                .or_insert_with(|| env.get(store_name).cloned());
                                            env.insert(
                                                store_name.clone(),
                                                if idx == 0 {
                                                    value.clone()
                                                } else {
                                                    EvalResult::Nil
                                                },
                                            );
                                        }
                                        let writer_result = eval_with_env(&writer_ast, env);
                                        for (name, old_value) in saved_bindings {
                                            match old_value {
                                                Some(old) => {
                                                    env.insert(name, old);
                                                }
                                                None => {
                                                    env.remove(&name);
                                                }
                                            }
                                        }
                                        last_value = writer_result?;
                                        continue;
                                    }
                                }

                                // Otherwise the expansion should be code to evaluate directly.
                                let expansion_ast = super::eval_system::result_to_ast(&expansion)?;
                                last_value = eval_with_env(&expansion_ast, env)?;
                            }
                        }
                    } else {
                        // Try to find a setf function defined via (defun (setf name) ...)
                        // These are stored as %FN%(setf name) in the environment
                        let setf_fn_name = format!(
                            "{}(setf {})",
                            super::eval_core::FUNCTION_NS_PREFIX,
                            func_name
                        );
                        let setf_fn = super::eval_core::lookup_env_binding(&setf_fn_name, env)
                            .or_else(|| {
                                super::eval_core::lookup_global_function_binding(&setf_fn_name)
                            })
                            .or_else(|| {
                                let base_name =
                                    func_name.rsplit(':').next().unwrap_or(func_name.as_str());
                                if base_name.eq_ignore_ascii_case(func_name) {
                                    None
                                } else {
                                    let base_setf = format!(
                                        "{}(setf {})",
                                        super::eval_core::FUNCTION_NS_PREFIX,
                                        base_name
                                    );
                                    super::eval_core::lookup_env_binding(&base_setf, env).or_else(
                                        || {
                                            super::eval_core::lookup_global_function_binding(
                                                &base_setf,
                                            )
                                        },
                                    )
                                }
                            });
                        if let Some(func_val) = setf_fn {
                            // Call the setf function with evaluated values directly:
                            // (new-value ...place-arguments)
                            // This preserves non-printable runtime objects (instances, hash tables, etc.)
                            // that would otherwise be degraded by AST round-tripping.
                            let mut eval_args: Vec<EvalResult> =
                                Vec::with_capacity(place_args.len() + 1);
                            eval_args.push(value.clone());
                            for arg_ast in place_args {
                                eval_args.push(eval_with_env(arg_ast, env)?);
                            }
                            last_value = super::eval_system::call_function_with_values(
                                func_val, &eval_args, env,
                            )?;
                        } else {
                            let macroexpand_1_form = ASTNode::Call {
                                function: Box::new(ASTNode::Variable("macroexpand-1".to_string())),
                                args: vec![ASTNode::Quote(Box::new(place.clone()))],
                            };
                            let expanded_place = super::eval_system::result_to_ast(
                                &eval_with_env(&macroexpand_1_form, env)?,
                            )?;
                            if format!("{:?}", expanded_place) != format!("{:?}", place) {
                                let nested_setf = ASTNode::Call {
                                    function: Box::new(ASTNode::Variable("setf".to_string())),
                                    args: vec![
                                        expanded_place,
                                        super::eval_system::result_to_ast_quoted(&value)?,
                                    ],
                                };
                                last_value = eval_with_env(&nested_setf, env)?;
                            } else {
                                return Err(format!("SETF undefined for place {}", func_name));
                            }
                        }
                    }
                } else {
                    return Err("SETF unsupported complex place form".to_string());
                }
            }
            _ => {
                return Err("SETF unsupported place form".to_string());
            }
        }
    }

    Ok(last_value)
}

pub(super) fn eval_multiple_value_bind(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (multiple-value-bind (var1 var2 ...) values-form body-forms...)
    if args.len() < 2 {
        return Err("multiple-value-bind requires at least 2 arguments".to_string());
    }

    fn collect_var_names(node: &ASTNode, out: &mut Vec<String>) -> Result<(), String> {
        match node {
            ASTNode::Constant(crate::ir::ConstantValue::Nil) => Ok(()),
            ASTNode::Variable(name) => {
                out.push(name.clone());
                Ok(())
            }
            ASTNode::Call { function, args } => {
                collect_var_names(function, out)?;
                for arg in args {
                    collect_var_names(arg, out)?;
                }
                Ok(())
            }
            _ => Err("multiple-value-bind: invalid variable list".to_string()),
        }
    }

    // Parse variable list.
    let var_list = &args[0];
    let mut var_names = Vec::new();
    collect_var_names(var_list, &mut var_names)?;

    // Evaluate the values form
    let values_form = &args[1];
    let result = eval_with_env(values_form, env)?;

    // Extract multiple values
    let values = match result {
        EvalResult::MultipleValues(vals) => vals,
        other => vec![other], // Single value treated as (values single-val)
    };

    if std::env::var("RLASP_DEBUG_MVB").is_ok() {
        eprintln!(
            "[mv-bind] vars={:?} values={:?} form={:?}",
            var_names, values, values_form
        );
    }

    // Save old variable values
    let old_values: Vec<Option<EvalResult>> = var_names
        .iter()
        .map(|name| env.get(name).cloned())
        .collect();

    // Bind variables to values (or NIL if not enough values)
    for (i, var_name) in var_names.iter().enumerate() {
        let val = values.get(i).cloned().unwrap_or(EvalResult::Nil);
        env.insert(var_name.clone(), val);
    }

    // Execute body forms
    let mut body_result = EvalResult::Nil;
    for form in &args[2..] {
        body_result = eval_with_env(form, env)?;
    }

    // Restore old variable values
    for (var_name, old_val) in var_names.iter().zip(old_values.iter()) {
        match old_val {
            Some(val) => env.insert(var_name.clone(), val.clone()),
            None => env.remove(var_name),
        };
    }

    Ok(body_result)
}

pub(super) fn eval_destructuring_bind(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (destructuring-bind lambda-list expression body-forms...)
    // Binds variables in lambda-list to parts of the evaluated expression
    if args.len() < 2 {
        return Err("destructuring-bind requires at least 2 arguments".to_string());
    }

    let lambda_list = &args[0];
    let expression = &args[1];
    let body = &args[2..];

    // Evaluate the expression to get the data to destructure
    let data = eval_with_env(expression, env)?;

    // Convert data to a list for easier processing
    let data_list = result_to_list(&data);

    // Save only the bindings introduced by the destructuring lambda-list.
    let mut bound_names = Vec::new();
    collect_destructure_binding_names(lambda_list, &mut bound_names);
    let old_values: Vec<(String, Option<EvalResult>)> = bound_names
        .iter()
        .map(|name| (name.clone(), env.get(name).cloned()))
        .collect();

    // Parse lambda-list and bind variables
    destructure_bind(lambda_list, &data_list, env)?;

    // Execute body forms
    let mut result = EvalResult::Nil;
    for form in body {
        result = eval_with_env(form, env)?;
    }

    // Restore only the lexical bindings introduced by destructuring-bind.
    for (name, old_value) in old_values {
        match old_value {
            Some(value) => {
                env.insert(name, value);
            }
            None => {
                env.remove(&name);
            }
        }
    }

    Ok(result)
}

fn collect_destructure_binding_names(pattern: &ASTNode, out: &mut Vec<String>) {
    match pattern {
        ASTNode::Variable(name) => {
            if !name.starts_with('&') && !out.iter().any(|existing| existing == name) {
                out.push(name.clone());
            }
        }
        ASTNode::Call { function, args } => {
            if let ASTNode::Variable(name) = function.as_ref() {
                if name.eq_ignore_ascii_case("&optional")
                    || name.eq_ignore_ascii_case("&rest")
                    || name.eq_ignore_ascii_case("&body")
                    || name.eq_ignore_ascii_case("&key")
                    || name.eq_ignore_ascii_case("&allow-other-keys")
                    || name.eq_ignore_ascii_case("&aux")
                {
                    for arg in args {
                        collect_destructure_binding_names(arg, out);
                    }
                    return;
                }
            }
            collect_destructure_binding_names(function, out);
            for arg in args {
                collect_destructure_binding_names(arg, out);
            }
        }
        ASTNode::DottedPair { car, cdr } => {
            collect_destructure_binding_names(car, out);
            collect_destructure_binding_names(cdr, out);
        }
        _ => {}
    }
}

fn result_to_list(result: &EvalResult) -> Vec<EvalResult> {
    let mut list = Vec::new();
    let mut current = result.clone();
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                list.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            other => {
                // Non-list - treat as single element
                list.push(other);
                break;
            }
        }
    }
    list
}

fn bind_pattern_value(
    pattern: &ASTNode,
    value: EvalResult,
    env: &mut HashMap<String, EvalResult>,
) -> Result<(), String> {
    match pattern {
        ASTNode::Variable(name) => {
            env.insert(name.clone(), value);
            Ok(())
        }
        ASTNode::Constant(crate::ir::ConstantValue::Nil) => Ok(()),
        ASTNode::Call { .. } | ASTNode::DottedPair { .. } => {
            let nested = result_to_list(&value);
            destructure_bind(pattern, &nested, env)
        }
        _ => Ok(()),
    }
}

fn ensure_destructuring_key_map(
    key_map: &mut Option<HashMap<String, EvalResult>>,
    data: &[EvalResult],
    start_idx: usize,
) {
    if key_map.is_none() {
        let mut map = HashMap::new();
        let mut i = start_idx;
        while i + 1 < data.len() {
            if let EvalResult::Symbol(sym) = &data[i] {
                if sym.starts_with(':') {
                    map.insert(
                        sym.trim_start_matches(':').to_ascii_lowercase(),
                        data[i + 1].clone(),
                    );
                    i += 2;
                    continue;
                }
            }
            break;
        }
        *key_map = Some(map);
    }
}

fn destructure_bind(
    pattern: &ASTNode,
    data: &[EvalResult],
    env: &mut HashMap<String, EvalResult>,
) -> Result<(), String> {
    match pattern {
        ASTNode::Variable(name) => {
            // Single variable - bind to entire data as list
            if data.is_empty() {
                env.insert(name.clone(), EvalResult::Nil);
            } else if data.len() == 1 {
                env.insert(name.clone(), data[0].clone());
            } else {
                // Convert back to cons list
                let list = vec_to_cons(data);
                env.insert(name.clone(), list);
            }
            Ok(())
        }
        ASTNode::Constant(crate::ir::ConstantValue::Nil) => {
            // Empty pattern - nothing to bind
            Ok(())
        }
        ASTNode::Call {
            function,
            args: pattern_args,
        } => {
            // Pattern is a list like (var1 var2 &optional var3 ...)
            let mut data_idx = 0;
            let mut pattern_idx = 0;
            let mut mode = "required";
            let mut key_map: Option<HashMap<String, EvalResult>> = None;

            // First element of Call is the function (first pattern element)
            let mut all_patterns = Vec::new();
            all_patterns.push(function.as_ref().clone());
            all_patterns.extend(pattern_args.iter().cloned());

            while pattern_idx < all_patterns.len() {
                let pat = &all_patterns[pattern_idx];

                match pat {
                    ASTNode::Variable(name) if name == "&optional" => {
                        mode = "optional";
                        pattern_idx += 1;
                        continue;
                    }
                    ASTNode::Variable(name) if name == "&rest" || name == "&body" => {
                        // Bind rest parameter to remaining data
                        pattern_idx += 1;
                        if pattern_idx < all_patterns.len() {
                            if let ASTNode::Variable(rest_name) = &all_patterns[pattern_idx] {
                                let rest_data = if data_idx < data.len() {
                                    vec_to_cons(&data[data_idx..])
                                } else {
                                    EvalResult::Nil
                                };
                                env.insert(rest_name.clone(), rest_data);
                            }
                        }
                        pattern_idx += 1;
                        continue;
                    }
                    ASTNode::Variable(name)
                        if name == "&key" || name == "&allow-other-keys" || name == "&aux" =>
                    {
                        if name == "&key" {
                            mode = "key";
                        }
                        // Keep permissive behavior for &allow-other-keys / &aux in this binder.
                        pattern_idx += 1;
                        continue;
                    }
                    ASTNode::Variable(name) if name.starts_with('&') => {
                        // Other lambda-list keyword - skip
                        pattern_idx += 1;
                        continue;
                    }
                    ASTNode::Variable(name) => {
                        if mode == "key" {
                            ensure_destructuring_key_map(&mut key_map, data, data_idx);
                            let key_name = name.trim_start_matches(':').to_ascii_lowercase();
                            let value = key_map
                                .as_ref()
                                .and_then(|map| map.get(&key_name).cloned())
                                .unwrap_or(EvalResult::Nil);
                            env.insert(name.clone(), value);
                        } else if data_idx < data.len() {
                            env.insert(name.clone(), data[data_idx].clone());
                            data_idx += 1;
                        } else if mode == "optional" {
                            env.insert(name.clone(), EvalResult::Nil);
                        } else {
                            return Err(format!(
                                "destructuring-bind: not enough values for {}",
                                name
                            ));
                        }
                        pattern_idx += 1;
                    }
                    ASTNode::Call {
                        function: inner_fn,
                        args: inner_args,
                    } => {
                        // Could be (var default) for &optional, or nested destructuring
                        if mode == "key" {
                            ensure_destructuring_key_map(&mut key_map, data, data_idx);

                            let (key_name, var_name, default_ast, supplied_p) =
                                if let ASTNode::Variable(var) = inner_fn.as_ref() {
                                    if var.starts_with(':') {
                                        (
                                            var.trim_start_matches(':').to_ascii_lowercase(),
                                            inner_args
                                                .get(0)
                                                .and_then(|a| {
                                                    if let ASTNode::Variable(v) = a {
                                                        Some(v.clone())
                                                    } else {
                                                        None
                                                    }
                                                })
                                                .unwrap_or_else(|| {
                                                    var.trim_start_matches(':').to_string()
                                                }),
                                            inner_args.get(1).cloned(),
                                            inner_args.get(2).and_then(|a| {
                                                if let ASTNode::Variable(v) = a {
                                                    Some(v.clone())
                                                } else {
                                                    None
                                                }
                                            }),
                                        )
                                    } else {
                                        (
                                            var.to_ascii_lowercase(),
                                            var.clone(),
                                            inner_args.get(0).cloned(),
                                            inner_args.get(1).and_then(|a| {
                                                if let ASTNode::Variable(v) = a {
                                                    Some(v.clone())
                                                } else {
                                                    None
                                                }
                                            }),
                                        )
                                    }
                                } else {
                                    pattern_idx += 1;
                                    continue;
                                };

                            let (value, present) = if let Some(map) = key_map.as_ref() {
                                if let Some(v) = map.get(&key_name) {
                                    (v.clone(), true)
                                } else if let Some(def_ast) = default_ast {
                                    (eval_with_env(&def_ast, env)?, false)
                                } else {
                                    (EvalResult::Nil, false)
                                }
                            } else {
                                (EvalResult::Nil, false)
                            };

                            env.insert(var_name, value);
                            if let Some(supplied_p_var) = supplied_p {
                                env.insert(
                                    supplied_p_var,
                                    if present {
                                        EvalResult::Bool(true)
                                    } else {
                                        EvalResult::Nil
                                    },
                                );
                            }
                        } else if mode == "optional" {
                            // (var default-value) form
                            if let ASTNode::Variable(var_name) = inner_fn.as_ref() {
                                if data_idx < data.len() {
                                    env.insert(var_name.clone(), data[data_idx].clone());
                                    data_idx += 1;
                                } else if !inner_args.is_empty() {
                                    // Use default value
                                    let default = eval_with_env(&inner_args[0], env)?;
                                    env.insert(var_name.clone(), default);
                                } else {
                                    env.insert(var_name.clone(), EvalResult::Nil);
                                }
                            }
                        } else {
                            // Nested destructuring
                            if data_idx < data.len() {
                                let nested_data = result_to_list(&data[data_idx]);
                                destructure_bind(pat, &nested_data, env)?;
                                data_idx += 1;
                            }
                        }
                        pattern_idx += 1;
                    }
                    _ => {
                        pattern_idx += 1;
                    }
                }
            }
            Ok(())
        }
        ASTNode::DottedPair { car, cdr } => {
            if data.is_empty() {
                return Err("destructuring-bind: not enough values for dotted pattern".to_string());
            }
            let first = data[0].clone();
            let rest = if data.len() > 1 {
                vec_to_cons(&data[1..])
            } else {
                EvalResult::Nil
            };
            bind_pattern_value(car, first, env)?;
            bind_pattern_value(cdr, rest, env)?;
            Ok(())
        }
        _ => Ok(()),
    }
}

fn vec_to_cons(items: &[EvalResult]) -> EvalResult {
    use std::cell::RefCell;
    use std::rc::Rc;

    let mut result = EvalResult::Nil;
    for item in items.iter().rev() {
        result = EvalResult::Cons(
            Rc::new(RefCell::new(item.clone())),
            Rc::new(RefCell::new(result)),
        );
    }
    result
}

pub(super) fn eval_handler_case(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (handler-case protected-form (condition-type (var) handler-body)...)
    if args.is_empty() {
        return Err("handler-case requires at least 1 argument".to_string());
    }

    let protected_form = &args[0];
    let handlers = &args[1..];
    let trace_pkg = std::env::var("RLASP_DEBUG_AOT_PKG_HANDLER").is_ok();

    let run_handlers = |error_msg: String,
                        pending_condition: Option<EvalResult>,
                        env: &mut HashMap<String, EvalResult>|
     -> Result<EvalResult, String> {
        let mut pending_condition = pending_condition
            .or_else(|| Some(super::eval_conditions::make_error_condition_from_message(&error_msg)));
        if trace_pkg {
            eprintln!(
                "[aot-handler-case] run_handlers err={} handlers={} pending={:?}",
                error_msg,
                handlers.len(),
                pending_condition
            );
        }
        for handler in handlers {
            if let ASTNode::Call {
                function: _condition_type,
                args: handler_args,
            } = handler
            {
                if trace_pkg {
                    eprintln!("[aot-handler-case] handler_args={:?}", handler_args);
                }
                let mut handler_env = env.clone();
                let mut shadowed_handler_vars: Vec<String> = Vec::new();

                if let Some(var_list) = handler_args.get(0) {
                    match var_list {
                        ASTNode::Call { function, args: _ } => {
                            if let ASTNode::Variable(var_name) = &**function {
                                shadowed_handler_vars.push(var_name.clone());
                                if let Some(cond) = &pending_condition {
                                    handler_env.insert(var_name.clone(), cond.clone());
                                } else {
                                    handler_env.insert(
                                        var_name.clone(),
                                        EvalResult::String(error_msg.clone()),
                                    );
                                }
                            }
                        }
                        ASTNode::Variable(var_name) => {
                            shadowed_handler_vars.push(var_name.clone());
                            if let Some(cond) = &pending_condition {
                                handler_env.insert(var_name.clone(), cond.clone());
                            } else {
                                handler_env.insert(
                                    var_name.clone(),
                                    EvalResult::String(error_msg.clone()),
                                );
                            }
                        }
                        ASTNode::Constant(ConstantValue::Nil) => {}
                        _ => {}
                    }
                }

                let mut handler_result = EvalResult::Nil;
                for form in handler_args.iter().skip(1) {
                    if trace_pkg {
                        eprintln!("[aot-handler-case] eval handler form={:?}", form);
                    }
                    handler_result = eval_with_env(form, &mut handler_env)?;
                }
                if trace_pkg {
                    eprintln!("[aot-handler-case] handler_result={:?}", handler_result);
                }
                let original_keys: Vec<String> = env.keys().cloned().collect();
                for key in original_keys {
                    let key_base = key.rsplit(':').next().unwrap_or(key.as_str());
                    if shadowed_handler_vars.iter().any(|shadowed| {
                        shadowed
                            .rsplit(':')
                            .next()
                            .unwrap_or(shadowed.as_str())
                            .eq_ignore_ascii_case(key_base)
                    }) {
                        continue;
                    }
                    if let Some(updated) = handler_env.get(&key).cloned() {
                        env.insert(key, updated);
                    }
                }
                return Ok(handler_result);
            }
        }
        if error_msg == "__SIGNAL_CONDITION__" {
            if let Some(cond) = pending_condition.take() {
                super::eval_conditions::set_pending_signaled_condition(cond);
            }
        }
        Err(error_msg)
    };

    let prior_pending = super::eval_conditions::take_pending_signaled_condition();

    // Try to evaluate the protected form
    match eval_with_env(protected_form, env) {
        Ok(result) => {
            if trace_pkg {
                eprintln!("[aot-handler-case] protected ok result={:?}", result);
            }
            if let Some(cond) = super::eval_conditions::take_pending_signaled_condition() {
                if trace_pkg {
                    eprintln!("[aot-handler-case] protected ok pending={:?}", cond);
                }
                let handled = run_handlers("__SIGNAL_CONDITION__".to_string(), Some(cond), env);
                if let Some(cond) = prior_pending.clone() {
                    super::eval_conditions::set_pending_signaled_condition(cond);
                }
                return handled;
            }
            if let Some(cond) = prior_pending.clone() {
                super::eval_conditions::set_pending_signaled_condition(cond);
            }
            Ok(result)
        }
        Err(error_msg) => {
            if trace_pkg {
                eprintln!("[aot-handler-case] protected err={}", error_msg);
            }
            let pending_condition = if error_msg == "__SIGNAL_CONDITION__" {
                super::eval_conditions::take_pending_signaled_condition()
            } else {
                None
            };
            if trace_pkg {
                eprintln!(
                    "[aot-handler-case] pending_condition={:?}",
                    pending_condition
                );
            }
            let handled = run_handlers(error_msg, pending_condition, env);
            if let Ok(_) = handled {
                if let Some(cond) = prior_pending.clone() {
                    super::eval_conditions::set_pending_signaled_condition(cond);
                }
            }
            handled
        }
    }
}

pub(super) fn eval_tagbody(
    args: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (tagbody tag1 form1 form2 tag2 form3 ...)
    // Tags are symbols or integers, forms are expressions to evaluate
    // Returns Nil

    // First pass: identify tags and their positions
    let mut tags: HashMap<String, usize> = HashMap::new();
    for (i, arg) in args.iter().enumerate() {
        match arg {
            ASTNode::Variable(name) => {
                tags.insert(name.clone(), i);
            }
            ASTNode::Constant(ConstantValue::Fixnum(n)) => {
                tags.insert(n.to_string(), i);
            }
            _ => {} // Forms, not tags
        }
    }

    let mut pc = 0; // Program counter
    while pc < args.len() {
        let arg = &args[pc];

        // Skip tags, execute forms
        let is_tag = match arg {
            ASTNode::Variable(name) => tags.contains_key(name),
            ASTNode::Constant(ConstantValue::Fixnum(n)) => tags.contains_key(&n.to_string()),
            _ => false,
        };

        if !is_tag {
            // Execute the form
            match eval_with_env(arg, env) {
                Ok(_) => {} // Continue
                Err(e) if e.starts_with("GO:") => {
                    // Extract tag name
                    let tag_name = &e[3..];
                    if let Some(&pos) = tags.get(tag_name) {
                        pc = pos;
                        continue;
                    } else {
                        return Err(format!("Unknown tag: {}", tag_name));
                    }
                }
                Err(e) => return Err(e), // Other errors propagate
            }
        }

        pc += 1;
    }

    Ok(EvalResult::Nil)
}

pub(super) fn eval_go(
    args: &[ASTNode],
    _env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // (go tag)
    if args.len() != 1 {
        return Err("go requires exactly 1 argument".to_string());
    }

    let tag_name = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::Fixnum(n)) => n.to_string(),
        _ => return Err("go tag must be a symbol or integer".to_string()),
    };

    // Signal a GO via error
    Err(format!("GO:{}", tag_name))
}
