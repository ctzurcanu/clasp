/// System and utility functions for the evaluator

use super::eval_types::{EvalResult, GENSYM_COUNTER, structural_equal, primary_value};
use super::eval_core::{eval_with_env, ast_to_result};
use crate::ir::{ASTNode, ConstantValue};
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

thread_local! {
    static ARRAY_DIMS: RefCell<HashMap<usize, Vec<usize>>> = RefCell::new(HashMap::new());
}

fn array_key(arr: &Rc<RefCell<Vec<EvalResult>>>) -> usize {
    Rc::as_ptr(arr) as usize
}

fn set_array_dims(arr: &Rc<RefCell<Vec<EvalResult>>>, dims: Vec<usize>) {
    ARRAY_DIMS.with(|m| {
        m.borrow_mut().insert(array_key(arr), dims);
    });
}

pub(super) fn get_array_dims(arr: &Rc<RefCell<Vec<EvalResult>>>) -> Vec<usize> {
    ARRAY_DIMS.with(|m| {
        m.borrow().get(&array_key(arr)).cloned().unwrap_or_else(|| vec![arr.borrow().len()])
    })
}

/// Convert a JIT LispObject to an interpreter EvalResult
pub(super) fn jit_lisp_object_to_eval_result(obj: &rlasp_runtime::LispObject) -> EvalResult {
    use rlasp_runtime::{RString, Symbol, Cons};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    if obj.is_nil() {
        return EvalResult::Nil;
    }
    if obj.raw() == rlasp_runtime::LispObject::t().raw() {
        return EvalResult::Bool(true);
    }
    if let Some(n) = obj.as_fixnum() {
        return EvalResult::Fixnum(n);
    }
    if obj.is_general() {
        if let Some(ptr) = obj.as_general_ptr::<()>() {
            if !ptr.is_null() {
                if let Some(obj_type) = unsafe { TypeHeader::from_ptr(ptr) } {
                    match obj_type {
                        ObjectType::String => {
                            let s = unsafe { &*(ptr as *const RString) };
                            return EvalResult::String(s.as_str().to_string());
                        }
                        ObjectType::Symbol => {
                            let s = unsafe { &*(ptr as *const Symbol) };
                            return EvalResult::Symbol(s.name().to_string());
                        }
                        ObjectType::Cons => {
                            // For cons cells, return a string representation for now
                            return EvalResult::String(format!("{}", obj));
                        }
                        _ => {}
                    }
                }
            }
        }
    }
    // Fallback: string representation
    EvalResult::String(format!("{}", obj))
}

pub(super) fn eval_funcall(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("funcall requires at least 1 argument (function)".to_string());
    }

    // Evaluate the function
    let func = eval_with_env(&args[0], env)?;

    // Evaluate all other arguments
    let mut eval_args = Vec::new();
    for arg in &args[1..] {
        eval_args.push(eval_with_env(arg, env)?);
    }

    // Call the function
    match call_function_with_values(func, &eval_args, env) {
        Ok(result) => Ok(result),
        Err(err) => Err(format!("{} (callee ast: {:?})", err, args[0])),
    }
}

/// Helper to call a function value with pre-evaluated arguments
pub(super) fn call_function_with_values(
    func: EvalResult,
    eval_args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>
) -> Result<EvalResult, String> {
    match func {
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: closure_env, dynamic_env } => {
            eval_lambda_call_with_values(params, defaults, supplied_p_vars, key_params, body, dynamic_env, closure_env, eval_args, env)
        }
        EvalResult::GenericFunction(gf) => {
            // Dispatch generic function with pre-evaluated arguments
            dispatch_generic_function_with_values(&gf, eval_args, env)
        }
        EvalResult::BuiltinFunction(name) => {
            // Call built-in function
            call_built_in_with_values(&name, eval_args, env)
        }
        EvalResult::ForeignFunction(func) => {
            // Call foreign function
            use rlasp_ffi::types::ToLisp;
            let lisp_args: Result<Vec<_>, _> = eval_args.iter().map(|val| {
                match val {
                    EvalResult::Fixnum(n) => Ok((*n as i32).to_lisp()),
                    EvalResult::Float(f) => Ok(f.to_lisp()),
                    _ => Err(format!("FFI arguments must be numbers, got: {:?}", val)),
                }
            }).collect();
            let lisp_args = lisp_args?;
            let result = func.call(&lisp_args).map_err(|e| format!("FFI call failed: {:?}", e))?;
            // Convert LispObject result back to EvalResult
            if let Some(n) = result.as_fixnum() {
                Ok(EvalResult::Fixnum(n))
            } else if let Some(f) = result.as_float() {
                Ok(EvalResult::Float(f))
            } else {
                Ok(EvalResult::Nil)
            }
        }
        EvalResult::Symbol(name) => {
            // Look up the function by name in the function namespace (Lisp-2)
            let mut lookup_names = vec![
                name.clone(),
                name.to_lowercase(),
                name.to_uppercase(),
            ];
            if name.contains(':') {
                if let Some(base) = name.rsplit(':').next() {
                    lookup_names.push(base.to_string());
                    lookup_names.push(base.to_lowercase());
                    lookup_names.push(base.to_uppercase());
                }
            }

            for lookup_name in &lookup_names {
                let fn_name = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, lookup_name);
                if let Some(func_val) = env.get(&fn_name).cloned() {
                    match &func_val {
                        EvalResult::Lambda { .. } | EvalResult::GenericFunction(_) |
                        EvalResult::BuiltinFunction(_) | EvalResult::ForeignFunction(_) => {
                            return call_function_with_values(func_val, eval_args, env);
                        }
                        _ => {}
                    }
                }
            }

            // Try calling as a built-in function with pre-evaluated arguments
            call_built_in_with_values(&name, eval_args, env)
        }
        _ => Err(format!("funcall: first argument must be a function, got {:?}", func)),
    }
}

/// Dispatch a generic function with pre-evaluated arguments
fn dispatch_generic_function_with_values(
    gf: &Rc<RefCell<super::eval_types::GenericFunction>>,
    eval_args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>
) -> Result<EvalResult, String> {
    use super::eval_types::specializer_matches;

    let gf_ref = gf.borrow();
    let mut before_methods = Vec::new();
    let mut primary_methods = Vec::new();
    let mut after_methods = Vec::new();
    let mut _around_methods = Vec::new();

    for method in &gf_ref.methods {
        // Check if all specializers match
        let matches = method.specializers.iter()
            .zip(eval_args.iter())
            .all(|(spec, arg)| specializer_matches(spec, arg));

        if matches {
            match method.qualifier.as_ref().map(|s| s.to_uppercase()).as_deref() {
                Some(":BEFORE") => before_methods.push(method),
                Some(":AFTER") => after_methods.push(method),
                Some(":AROUND") => _around_methods.push(method),
                _ => primary_methods.push(method),
            }
        }
    }

    // Sort primary methods by specificity (most specific first)
    primary_methods.sort_by(|a, b| {
        let a_specificity: usize = a.specializers.iter()
            .zip(eval_args.iter())
            .map(|(spec, arg)| {
                let arg_class = super::eval_types::class_of(arg);
                if spec.eq_ignore_ascii_case(&arg_class) {
                    2  // Exact match = most specific
                } else if spec == "T" {
                    0  // T = least specific
                } else {
                    1  // Superclass match
                }
            })
            .sum();
        let b_specificity: usize = b.specializers.iter()
            .zip(eval_args.iter())
            .map(|(spec, arg)| {
                let arg_class = super::eval_types::class_of(arg);
                if spec.eq_ignore_ascii_case(&arg_class) {
                    2
                } else if spec == "T" {
                    0
                } else {
                    1
                }
            })
            .sum();
        b_specificity.cmp(&a_specificity)
    });

    // Execute :before methods
    for method in &before_methods {
        let mut method_env = method.env.borrow().clone();
        for (param, arg) in method.params.iter().zip(eval_args.iter()) {
            method_env.insert(param.clone(), arg.clone());
        }
        for expr in &method.body {
            eval_with_env(expr, &mut method_env)?;
        }
    }

    // Execute primary method
    let result = if let Some(method) = primary_methods.first() {
        let mut method_env = method.env.borrow().clone();
        for (param, arg) in method.params.iter().zip(eval_args.iter()) {
            method_env.insert(param.clone(), arg.clone());
        }
        let mut result = EvalResult::Nil;
        for expr in &method.body {
            result = eval_with_env(expr, &mut method_env)?;
        }
        result
    } else if before_methods.is_empty() && after_methods.is_empty() {
        return Err(format!("No applicable method for generic function {} with args {:?}",
            gf_ref.name, eval_args.iter().map(|a| super::eval_types::class_of(a)).collect::<Vec<_>>()));
    } else {
        EvalResult::Nil
    };

    // Execute :after methods (reverse order - least-specific-first)
    for method in after_methods.iter().rev() {
        let mut method_env = method.env.borrow().clone();
        for (param, arg) in method.params.iter().zip(eval_args.iter()) {
            method_env.insert(param.clone(), arg.clone());
        }
        for expr in &method.body {
            eval_with_env(expr, &mut method_env)?;
        }
    }

    Ok(result)
}


pub(super) fn eval_apply(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("apply requires at least 2 arguments (function arg-list)".to_string());
    }

    // Evaluate the function
    let func = eval_with_env(&args[0], env)?;

    // Evaluate all but the last argument
    let mut eval_args = Vec::new();
    for arg in &args[1..args.len()-1] {
        eval_args.push(eval_with_env(arg, env)?);
    }

    // Evaluate the last argument (should be a list)
    let last_arg = eval_with_env(&args[args.len()-1], env)?;

    // Convert the list to a vector of values
    let mut current = last_arg;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                eval_args.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return Err("apply: last argument must be a list".to_string()),
        }
    }

    // Call the function using the shared helper
    call_function_with_values(func, &eval_args, env)
}

pub(super) fn eval_apply_key(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("apply-key requires 2 arguments (key element)".to_string());
    }

    let key = eval_with_env(&args[0], env)?;
    let element = eval_with_env(&args[1], env)?;

    // If key is nil, return element unchanged
    // Otherwise, apply key function to element
    match key {
        EvalResult::Nil => Ok(element),
        _ => call_function_with_values(key, &[element], env),
    }
}

pub(super) fn eval_lambda_call_with_values(
    params: Vec<String>,
    defaults: HashMap<String, ASTNode>,
    supplied_p_vars: HashMap<String, String>,
    key_params: HashMap<String, String>,
    body: Vec<ASTNode>,
    dynamic_env: bool,
    closure_env: Rc<RefCell<HashMap<String, EvalResult>>>,
    args: &[EvalResult],
    call_env: &mut HashMap<String, EvalResult>
) -> Result<EvalResult, String> {
    fn is_global_binding_name(name: &str) -> bool {
        name.starts_with(super::eval_core::FUNCTION_NS_PREFIX)
            || name.starts_with('*')
            || name.contains("::")
            || name.contains(':')
    }
    // Merge environments (dynamic_env prefers caller bindings)
    let mut combined_env = closure_env.borrow().clone();
    if dynamic_env {
        for (k, v) in call_env.iter() {
            combined_env.insert(k.clone(), v.clone());
        }
    } else {
        let mut call_clone = call_env.clone();
        for (k, v) in combined_env.iter() {
            call_clone.insert(k.clone(), v.clone());
        }
        combined_env = call_clone;
    }
    let mut closure_env = combined_env;
    // Check for &optional, &rest, &key, and &aux parameters
    let mut optional_pos = None;
    let mut rest_pos = None;
    let mut key_pos = None;
    let mut aux_pos = None;
    for (i, param) in params.iter().enumerate() {
        if param == "&optional" {
            optional_pos = Some(i);
        } else if param == "&rest" {
            rest_pos = Some(i);
        } else if param == "&key" {
            key_pos = Some(i);
        } else if param == "&aux" {
            aux_pos = Some(i);
            break; // &aux is always last
        }
    }

    // Calculate the end of required params
    let end_of_required = optional_pos.or(rest_pos).or(key_pos).or(aux_pos).unwrap_or(params.len());
    let required_params = &params[..end_of_required];

    let (optional_params, key_params_slice) = if let Some(opt_idx) = optional_pos {
        let opt_end = rest_pos.or(key_pos).or(aux_pos).unwrap_or(params.len());
        let optional = &params[opt_idx + 1..opt_end];
        let keys = if let Some(key_idx) = key_pos {
            let key_end = aux_pos.unwrap_or(params.len());
            &params[key_idx + 1..key_end]
        } else {
            &params[0..0]
        };
        (optional, keys)
    } else if let Some(key_idx) = key_pos {
        let key_end = aux_pos.unwrap_or(params.len());
        (&params[0..0], &params[key_idx + 1..key_end])
    } else {
        (&params[0..0], &params[0..0])
    };

    let key_param_vars: Vec<&String> = key_params_slice.iter()
        .filter(|p| !p.starts_with('&'))
        .collect();
    let declared_key_names: Vec<String> = key_param_vars.iter()
        .map(|p| key_params.get(*p).cloned().unwrap_or_else(|| super::eval_core::trim_keyword(p)))
        .collect();

    let rest_param = rest_pos.and_then(|r| {
        let next = r + 1;
        if next < params.len() && params.get(next).map_or(false, |p| p != "&aux" && p != "&key") {
            Some(&params[next])
        } else {
            None
        }
    });

    // Count positional arguments (before keyword arguments)
    let mut positional_count = 0;
    for (i, arg) in args.iter().enumerate() {
        if let EvalResult::Symbol(name) = arg {
            if name.starts_with(':') && i + 1 < args.len() {
                let key_name = &name[1..];
                if declared_key_names.iter().any(|p| p.eq_ignore_ascii_case(key_name)) {
                    positional_count = i;
                    break;
                }
            }
        }
        positional_count = i + 1;
    }

    let min_args = required_params.len();
    if positional_count < min_args {
        return Err(format!("Expected at least {} arguments, got {}", min_args, positional_count));
    }

    let positional_args = &args[..positional_count];
    let keyword_args = &args[positional_count..];

    // Bind required parameters
    for (param, arg) in required_params.iter().zip(positional_args.iter()) {
        closure_env.insert(param.clone(), arg.clone());
    }

    // Bind optional parameters
    let optional_positional = &positional_args[required_params.len()..];
    let mut consumed_optional = 0;
    for (i, param) in optional_params.iter().enumerate() {
        if i < optional_positional.len() {
            closure_env.insert(param.clone(), optional_positional[i].clone());
            consumed_optional += 1;
            if let Some(supplied_p_var) = supplied_p_vars.get(param) {
                closure_env.insert(supplied_p_var.clone(), EvalResult::Boolean(true));
            }
        } else if let Some(default_expr) = defaults.get(param) {
            let default_value = eval_with_env(default_expr, &mut closure_env)?;
            closure_env.insert(param.clone(), default_value);
            if let Some(supplied_p_var) = supplied_p_vars.get(param) {
                closure_env.insert(supplied_p_var.clone(), EvalResult::Nil);
            }
        } else {
            closure_env.insert(param.clone(), EvalResult::Nil);
            if let Some(supplied_p_var) = supplied_p_vars.get(param) {
                closure_env.insert(supplied_p_var.clone(), EvalResult::Nil);
            }
        }
    }

    // Parse keyword arguments into a map
    let mut keyword_map = HashMap::new();
    let mut i = 0;
    while i < keyword_args.len() {
        if let EvalResult::Symbol(kw) = &keyword_args[i] {
            if kw.starts_with(':') {
                if i + 1 < keyword_args.len() {
                    let key_name = &kw[1..];
                    keyword_map.insert(key_name.to_string(), keyword_args[i + 1].clone());
                    i += 2;
                    continue;
                } else {
                    return Err(format!("Keyword {} requires a value", kw));
                }
            }
        }
        i += 1;
    }

    // Bind keyword parameters with defaults
    for key_param in key_param_vars.iter() {
        let key_name = key_params.get(*key_param)
            .cloned()
            .unwrap_or_else(|| super::eval_core::trim_keyword(key_param));
        if let Some(value) = keyword_map.get(&key_name) {
            closure_env.insert((*key_param).clone(), value.clone());
            if let Some(supplied_p_var) = supplied_p_vars.get(*key_param) {
                closure_env.insert(supplied_p_var.clone(), EvalResult::Boolean(true));
            }
        } else if let Some(default_expr) = defaults.get(*key_param) {
            let default_value = eval_with_env(default_expr, &mut closure_env)?;
            closure_env.insert((*key_param).clone(), default_value);
            if let Some(supplied_p_var) = supplied_p_vars.get(*key_param) {
                closure_env.insert(supplied_p_var.clone(), EvalResult::Nil);
            }
        } else {
            closure_env.insert((*key_param).clone(), EvalResult::Nil);
            if let Some(supplied_p_var) = supplied_p_vars.get(*key_param) {
                closure_env.insert(supplied_p_var.clone(), EvalResult::Nil);
            }
        }
    }

    // Bind rest parameter if present (including keyword args)
    if let Some(rest_p) = rest_param {
        let rest_start = required_params.len() + consumed_optional;
        let rest_args = &args[rest_start..];
        let mut rest_list = EvalResult::Nil;
        for arg in rest_args.iter().rev() {
            rest_list = EvalResult::Cons(
                Rc::new(RefCell::new(arg.clone())),
                Rc::new(RefCell::new(rest_list))
            );
        }
        closure_env.insert(rest_p.clone(), rest_list);
    }

    // Bind &aux parameters (local variables with optional initializers)
    if let Some(aux_idx) = aux_pos {
        let aux_params = &params[aux_idx + 1..];
        for aux_param in aux_params {
            if let Some(default_expr) = defaults.get(aux_param) {
                // Evaluate initializer in closure environment
                let aux_value = eval_with_env(default_expr, &mut closure_env)?;
                closure_env.insert(aux_param.clone(), aux_value);
            } else {
                // No initializer, bind to nil
                closure_env.insert(aux_param.clone(), EvalResult::Nil);
            }
        }
    }

    // Evaluate body
    let mut result = EvalResult::Nil;
    for expr in &body {
        result = eval_with_env(expr, &mut closure_env)?;
    }

    // Propagate global-like bindings back to the caller env
    for (k, v) in closure_env.iter() {
        if is_global_binding_name(k) {
            call_env.insert(k.clone(), v.clone());
        }
    }

    Ok(result)
}

pub(super) fn eval_error(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("Error".to_string());
    }

    let msg = eval_with_env(&args[0], env)?;

    // If there are additional arguments, use them as format arguments
    if args.len() > 1 {
        let control_str = match &msg {
            EvalResult::String(s) => s.clone(),
            EvalResult::Symbol(s) => s.clone(),
            _ => format!("{}", msg),
        };

        // Evaluate format arguments
        let mut format_args = Vec::new();
        for i in 1..args.len() {
            format_args.push(eval_with_env(&args[i], env)?);
        }

        // Surface :datum in errors like (error 'no-such-package-error :datum X)
        if let EvalResult::Symbol(sym) = &msg {
            let mut i = 0;
            while i + 1 < format_args.len() {
                if let EvalResult::Symbol(key) = &format_args[i] {
                    if key.eq_ignore_ascii_case(":datum") {
                        let datum = &format_args[i + 1];
                        return Err(format!("{} (datum: {})", sym, format_value(datum)));
                    }
                }
                i += 2;
            }
        }

        // Process format string
        let mut output = String::new();
        let mut chars = control_str.chars().peekable();
        let mut arg_index = 0;

        while let Some(ch) = chars.next() {
            if ch == '~' {
                if let Some(&directive) = chars.peek() {
                    chars.next();
                    match directive {
                        '&' => {
                            if !output.is_empty() && !output.ends_with('\n') {
                                output.push('\n');
                            }
                        }
                        '%' => output.push('\n'),
                        'A' | 'a' | 'S' | 's' => {
                            if arg_index < format_args.len() {
                                output.push_str(&format_value(&format_args[arg_index]));
                                arg_index += 1;
                            }
                        }
                        '~' => output.push('~'),
                        _ => {
                            output.push('~');
                            output.push(directive);
                        }
                    }
                } else {
                    output.push('~');
                }
            } else {
                output.push(ch);
            }
        }

        return Err(output);
    }

    let error_msg = match msg {
        EvalResult::String(s) => s,
        EvalResult::Symbol(s) => s,
        _ => format!("{}", msg),
    };

    Err(error_msg)
}

pub(super) fn eval_eval(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("eval requires 1 argument".to_string());
    }

    let quoted = eval_with_env(&args[0], env)?;
    let ast = result_to_ast(&quoted)?;
    eval_with_env(&ast, env)
}

fn result_to_cons_ast(result: &EvalResult) -> Result<ASTNode, String> {
    match result {
        EvalResult::Nil => Ok(ASTNode::nil()),
        EvalResult::Cons(car, cdr) => {
            let car_ast = result_to_ast(&car.borrow())?;
            let cdr_ast = result_to_cons_ast(&cdr.borrow())?;
            Ok(ASTNode::Call {
                function: Box::new(car_ast),
                args: vec![cdr_ast],
            })
        }
        _ => result_to_ast(result),
    }
}

pub(crate) fn result_to_ast(result: &EvalResult) -> Result<ASTNode, String> {
    match result {
        EvalResult::Fixnum(n) => Ok(ASTNode::fixnum(*n)),
        EvalResult::Float(f) => Ok(ASTNode::float(*f)),
        EvalResult::Bool(true) => Ok(ASTNode::t()),
        EvalResult::Bool(false) | EvalResult::Nil => Ok(ASTNode::nil()),
        EvalResult::String(s) => Ok(ASTNode::Constant(crate::ir::ConstantValue::String(s.clone()))),
        EvalResult::Symbol(name) => Ok(ASTNode::variable(name.clone())),
        EvalResult::MultipleValues(vals) => {
            if vals.is_empty() {
                Ok(ASTNode::nil())
            } else {
                result_to_ast(&vals[0])
            }
        }
        EvalResult::Cons(car, cdr) => {
            // Convert list to AST as a function call
            // This is used for macro expansion where the result should be evaluated as code

            // Check if this is a dotted pair (cdr is not nil and not a cons)
            let cdr_val = cdr.borrow();
            if !matches!(&*cdr_val, EvalResult::Nil | EvalResult::Cons(_, _)) {
                // This is a dotted pair: (car . cdr) where cdr is an atom
                let car_ast = result_to_ast(&car.borrow())?;
                let cdr_ast = result_to_ast(&cdr_val)?;
                return Ok(ASTNode::DottedPair {
                    car: Box::new(car_ast),
                    cdr: Box::new(cdr_ast),
                });
            }
            drop(cdr_val);

            // Check if car is 'quote' - if so, handle specially to preserve data as data
            if let EvalResult::Symbol(sym) = &*car.borrow() {
                let base = sym.rsplit(':').next().unwrap_or(sym.as_str());
                if base.eq_ignore_ascii_case("quote") {
                    // For quote, convert the argument using result_to_data_ast
                    // to preserve list structure as data, not as code
                    let args = match &*cdr.borrow() {
                        EvalResult::Nil => vec![],
                        EvalResult::Cons(inner_car, _) => {
                            // (quote form) - form is the car of cdr
                            vec![result_to_data_ast(&inner_car.borrow())?]
                        }
                        _ => vec![],
                    };
                    if args.len() == 1 {
                        return Ok(ASTNode::Quote(Box::new(args[0].clone())));
                    }
                }
                if base.eq_ignore_ascii_case("unquote") {
                    let args = match &*cdr.borrow() {
                        EvalResult::Nil => vec![],
                        EvalResult::Cons(inner_car, _) => vec![result_to_ast(&inner_car.borrow())?],
                        _ => vec![],
                    };
                    if args.len() == 1 {
                        return Ok(ASTNode::Unquote(Box::new(args[0].clone())));
                    }
                }
                if base.eq_ignore_ascii_case("unquote-splicing") {
                    let args = match &*cdr.borrow() {
                        EvalResult::Nil => vec![],
                        EvalResult::Cons(inner_car, _) => vec![result_to_ast(&inner_car.borrow())?],
                        _ => vec![],
                    };
                    if args.len() == 1 {
                        return Ok(ASTNode::UnquoteSplicing(Box::new(args[0].clone())));
                    }
                }
                if base.eq_ignore_ascii_case("backquote") {
                    let args = match &*cdr.borrow() {
                        EvalResult::Nil => vec![],
                        EvalResult::Cons(inner_car, _) => vec![result_to_ast(&inner_car.borrow())?],
                        _ => vec![],
                    };
                    if args.len() == 1 {
                        return Ok(ASTNode::Backquote(Box::new(args[0].clone())));
                    }
                }
            }

            // Normal case: convert car and cdr normally
            let car_ast = result_to_ast(&car.borrow())?;

            // Convert cdr to a list of arguments
            let args = match &*cdr.borrow() {
                EvalResult::Nil => vec![],
                EvalResult::Cons(_, _) => {
                    // Convert the rest of the list to a vector of AST nodes
                    cons_to_list(&cdr.borrow())?
                }
                _ => unreachable!(), // We checked above that cdr is Nil or Cons
            };

            // Check if this is a special form and construct the appropriate ASTNode
            if let ASTNode::Variable(name) = &car_ast {
                let base = name.rsplit(':').next().unwrap_or(name.as_str());
                if base.eq_ignore_ascii_case("lambda") {
                    if args.is_empty() {
                        return Ok(ASTNode::Lambda {
                            params: Vec::new(),
                            defaults: std::collections::HashMap::new(),
                            supplied_p_vars: std::collections::HashMap::new(),
                            key_params: std::collections::HashMap::new(),
                            body: Vec::new(),
                        });
                    }
                    let (params, defaults, supplied_p_vars, key_params) = super::eval_core::extract_params_with_defaults(&args[0]);
                    let body = if args.len() > 1 { args[1..].to_vec() } else { vec![] };
                    return Ok(ASTNode::Lambda { params, defaults, supplied_p_vars, key_params, body });
                }
                match name.as_str() {
                    "let" => {
                        // (let ((var1 val1) (var2 val2) ...) body...)
                        if args.is_empty() {
                            return Err("let requires at least one argument (bindings)".to_string());
                        }

                        // If bindings is an Unquote or contains unquote (from backquote), keep as Call
                        let bindings_ast = &args[0];
                        if matches!(bindings_ast, ASTNode::Unquote(_) | ASTNode::UnquoteSplicing(_))
                            || contains_unquote_ast(bindings_ast) {
                            // Fall through to generic Call handling
                        } else {
                            let bindings = parse_let_bindings(bindings_ast)?;
                            let body = args[1..].to_vec();
                            return Ok(ASTNode::Let { bindings, body });
                        }
                    }
                    "let*" => {
                        // (let* ((var1 val1) (var2 val2) ...) body...)
                        if args.is_empty() {
                            return Err("let* requires at least one argument (bindings)".to_string());
                        }

                        // If bindings is an Unquote or contains unquote (from backquote), keep as Call
                        let bindings_ast = &args[0];
                        if matches!(bindings_ast, ASTNode::Unquote(_) | ASTNode::UnquoteSplicing(_))
                            || contains_unquote_ast(bindings_ast) {
                            // Fall through to generic Call handling
                        } else {
                            let bindings = parse_let_bindings(bindings_ast)?;
                            let body = args[1..].to_vec();
                            return Ok(ASTNode::LetStar { bindings, body });
                        }
                    }
                    "progn" => {
                        return Ok(ASTNode::Progn { exprs: args });
                    }
                    "if" => {
                        if args.len() < 2 {
                            return Err("if requires at least 2 arguments".to_string());
                        }
                        let test = Box::new(args[0].clone());
                        let then_branch = Box::new(args[1].clone());
                        let else_branch = if args.len() > 2 {
                            Box::new(args[2].clone())
                        } else {
                            Box::new(ASTNode::nil())
                        };
                        return Ok(ASTNode::If { test, then_branch, else_branch });
                    }
                    "dotimes" => {
                        // (dotimes (var count [result]) body...)
                        if args.is_empty() {
                            return Err("dotimes requires at least one argument".to_string());
                        }

                        let spec = &args[0];
                        let (var, count, result) = parse_dotimes_spec(spec)?;
                        let body = args[1..].to_vec();

                        return Ok(ASTNode::Dotimes { var, count: Box::new(count), result: result.map(Box::new), body });
                    }
                    "quote" => {
                        // (quote form) => Quote(form)
                        // Special handling: the argument should be converted as data, not code
                        if args.len() != 1 {
                            return Err("quote requires exactly one argument".to_string());
                        }
                        // Re-convert the argument as data using result_to_quoted_ast
                        // This requires getting the original result, not the already-converted AST
                        // For now, wrap what we have - if it's a Call node starting with a keyword,
                        // we should keep it as-is for quote to work correctly
                        return Ok(ASTNode::Quote(Box::new(args[0].clone())));
                    }
                    "backquote" => {
                        // (backquote form) => Backquote(form)
                        if args.len() != 1 {
                            return Err("backquote requires exactly one argument".to_string());
                        }
                        return Ok(ASTNode::Backquote(Box::new(args[0].clone())));
                    }
                    "unquote" => {
                        // (unquote form) => Unquote(form)
                        if args.len() != 1 {
                            return Err("unquote requires exactly one argument".to_string());
                        }
                        return Ok(ASTNode::Unquote(Box::new(args[0].clone())));
                    }
                    "unquote-splicing" => {
                        // (unquote-splicing form) => UnquoteSplicing(form)
                        if args.len() != 1 {
                            return Err("unquote-splicing requires exactly one argument".to_string());
                        }
                        return Ok(ASTNode::UnquoteSplicing(Box::new(args[0].clone())));
                    }
                    "setq" => {
                        // (setq var1 val1 [var2 val2 ...])
                        // Handle single pair: (setq var val) => Setq { var, value }
                        // Handle multiple pairs: (setq v1 e1 v2 e2) => Progn { Setq, Setq, ... }
                        if args.len() >= 2 && args.len() % 2 == 0 {
                            let mut setqs = Vec::new();
                            for pair in args.chunks(2) {
                                if let ASTNode::Variable(var) = &pair[0] {
                                    setqs.push(ASTNode::Setq {
                                        var: var.clone(),
                                        value: Box::new(pair[1].clone()),
                                    });
                                } else {
                                    // Not a simple variable — fall through to Call
                                    setqs.clear();
                                    break;
                                }
                            }
                            if !setqs.is_empty() {
                                if setqs.len() == 1 {
                                    return Ok(setqs.pop().unwrap());
                                } else {
                                    return Ok(ASTNode::Progn { exprs: setqs });
                                }
                            }
                        }
                    }
                    "setf" | "psetq" | "psetf" | "defun" | "defmacro" | "defvar" | "defparameter" |
                    "defconstant" | "defclass" | "defgeneric" | "defmethod" | "defstruct" |
                    "block" | "return-from" | "return" | "tagbody" | "go" |
                    "catch" | "throw" | "unwind-protect" | "handler-case" | "handler-bind" |
                    "multiple-value-bind" | "multiple-value-setq" | "multiple-value-call" |
                    "the" | "locally" | "declare" | "declaim" | "proclaim" |
                    "cond" | "case" | "ecase" | "typecase" | "etypecase" |
                    "when" | "unless" | "and" | "or" | "not" |
                    "do" | "do*" | "dolist" | "loop" |
                    "flet" | "labels" | "macrolet" | "symbol-macrolet" |
                    "ignore-errors" | "with-open-file" | "with-output-to-string" |
                    "with-input-from-string" | "prog1" | "prog2" | "progv" |
                    "multiple-value-list" | "multiple-value-prog1" |
                    "with-hash-table-iterator" | "destructuring-bind" |
                    "eval-when" | "load-time-value" | "in-package" => {
                        // These are all special forms/macros that eval_core handles as Call nodes
                        // Fall through to generic Call handling — eval_core recognizes them
                    }
                    // read-time-eval is handled as a call and evaluated in eval_core
                    // when the full environment is available
                    _ => {}
                }
            }

            Ok(ASTNode::Call {
                function: Box::new(car_ast),
                args,
            })
        }
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, .. } => {
            Ok(ASTNode::lambda_with_supplied_p(params.clone(), defaults.clone(), supplied_p_vars.clone(), key_params.clone(), body.clone()))
        }
        EvalResult::Macro { params, body } => {
            Ok(ASTNode::Macro {
                params: params.clone(),
                body: body.clone(),
            })
        }
        EvalResult::HashTable(_) => {
            // Convert hash table to AST - for now, return an empty hash table node
            Ok(ASTNode::HashTable {
                entries: vec![],
            })
        }
        EvalResult::Array(arr) => {
            // Convert array to AST as a vector literal
            let elements: Result<Vec<ASTNode>, String> = arr.borrow()
                .iter()
                .map(|el| result_to_ast(el))
                .collect();
            Ok(ASTNode::Call {
                function: Box::new(ASTNode::Variable("vector".to_string())),
                args: elements?,
            })
        }
        EvalResult::Character(c) => {
            Ok(ASTNode::Constant(ConstantValue::Character(*c)))
        }
        EvalResult::Boolean(b) => {
            if *b {
                Ok(ASTNode::t())
            } else {
                Ok(ASTNode::nil())
            }
        }
        EvalResult::Package(name) => {
            // Convert package to (find-package "name") so it evaluates back to the package
            Ok(ASTNode::Call {
                function: Box::new(ASTNode::Variable("find-package".to_string())),
                args: vec![ASTNode::Constant(ConstantValue::String(name.clone()))],
            })
        }
        EvalResult::Bignum(n) => {
            // Convert bignum: try to fit in fixnum, else use string representation
            if let Ok(val) = i64::try_from(n) {
                Ok(ASTNode::fixnum(val))
            } else {
                // Use parse-integer to reconstruct
                Ok(ASTNode::Call {
                    function: Box::new(ASTNode::Variable("parse-integer".to_string())),
                    args: vec![ASTNode::Constant(ConstantValue::String(n.to_string()))],
                })
            }
        }
        EvalResult::Ratio(r) => {
            // Represent as (/ numerator denominator)
            let num_str = r.numerator_ref().to_string();
            let den_str = r.denominator_ref().to_string();
            Ok(ASTNode::Call {
                function: Box::new(ASTNode::Variable("/".to_string())),
                args: vec![
                    ASTNode::Constant(ConstantValue::String(num_str)),
                    ASTNode::Constant(ConstantValue::String(den_str)),
                ],
            })
        }
        EvalResult::Complex(re, im) => {
            Ok(ASTNode::Call {
                function: Box::new(ASTNode::Variable("complex".to_string())),
                args: vec![ASTNode::float(*re), ASTNode::float(*im)],
            })
        }
        EvalResult::Condition(_) => Ok(ASTNode::nil()),
        EvalResult::HashTable(_) => Ok(ASTNode::nil()),
        EvalResult::Instance(_) => Ok(ASTNode::nil()),
        EvalResult::BuiltinFunction(name) => {
            Ok(ASTNode::Quote(Box::new(ASTNode::variable(name.clone()))))
        }
        EvalResult::GenericFunction(gf) => {
            Ok(ASTNode::Quote(Box::new(ASTNode::variable(gf.borrow().name.clone()))))
        }
        _ => Err(format!("Cannot convert {:?} to AST (variant {})", result, eval_result_variant(result))),
    }
}

fn eval_result_variant(result: &EvalResult) -> &'static str {
    match result {
        EvalResult::Fixnum(_) => "Fixnum",
        EvalResult::Bignum(_) => "Bignum",
        EvalResult::Ratio(_) => "Ratio",
        EvalResult::Float(_) => "Float",
        EvalResult::Complex(_, _) => "Complex",
        EvalResult::Bool(_) => "Bool",
        EvalResult::Boolean(_) => "Boolean",
        EvalResult::Nil => "Nil",
        EvalResult::String(_) => "String",
        EvalResult::Symbol(_) => "Symbol",
        EvalResult::Character(_) => "Character",
        EvalResult::Cons(_, _) => "Cons",
        EvalResult::Lambda { .. } => "Lambda",
        EvalResult::Macro { .. } => "Macro",
        EvalResult::ModifyMacro { .. } => "ModifyMacro",
        EvalResult::HashTable(_) => "HashTable",
        EvalResult::Array(_) => "Array",
        EvalResult::WasmBytes(_) => "WasmBytes",
        EvalResult::BuiltinFunction(_) => "BuiltinFunction",
        EvalResult::MultipleValues(_) => "MultipleValues",
        EvalResult::ForeignLibrary(_) => "ForeignLibrary",
        EvalResult::ForeignFunction(_) => "ForeignFunction",
        EvalResult::Instance(_) => "Instance",
        EvalResult::GenericFunction(_) => "GenericFunction",
        EvalResult::Condition(_) => "Condition",
        EvalResult::Package(_) => "Package",
    }
}

pub(super) fn cons_to_list(result: &EvalResult) -> Result<Vec<ASTNode>, String> {
    match result {
        EvalResult::Nil => Ok(vec![]),
        EvalResult::Cons(car, cdr) => {
            let mut list = vec![result_to_ast(&car.borrow())?];
            list.extend(cons_to_list(&cdr.borrow())?);
            Ok(list)
        }
        other => {
            Ok(vec![result_to_ast(other)?])
        }
    }
}

/// Convert EvalResult to AST as data (for quoted forms)
/// Unlike result_to_ast, this preserves lists as Call nodes that won't be evaluated
/// because they're wrapped in a Quote
pub(crate) fn result_to_data_ast(result: &EvalResult) -> Result<ASTNode, String> {
    match result {
        EvalResult::Fixnum(n) => Ok(ASTNode::fixnum(*n)),
        EvalResult::Float(f) => Ok(ASTNode::float(*f)),
        EvalResult::Bool(true) => Ok(ASTNode::t()),
        EvalResult::Bool(false) | EvalResult::Nil => Ok(ASTNode::nil()),
        EvalResult::String(s) => Ok(ASTNode::Constant(crate::ir::ConstantValue::String(s.clone()))),
        EvalResult::Symbol(name) => Ok(ASTNode::variable(name.clone())),
        EvalResult::Cons(car, cdr) => {
            // For data, convert list to a simple Call structure
            // This is ok because when inside Quote, it won't be evaluated
            let car_ast = result_to_data_ast(&car.borrow())?;

            if let EvalResult::Symbol(sym) = &*car.borrow() {
                let base = sym.rsplit(':').next().unwrap_or(sym.as_str());
                if let EvalResult::Cons(inner_car, _) = &*cdr.borrow() {
                    if base.eq_ignore_ascii_case("unquote") {
                        let inner_ast = result_to_ast(&inner_car.borrow())?;
                        return Ok(ASTNode::Unquote(Box::new(inner_ast)));
                    }
                    if base.eq_ignore_ascii_case("unquote-splicing") {
                        let inner_ast = result_to_ast(&inner_car.borrow())?;
                        return Ok(ASTNode::UnquoteSplicing(Box::new(inner_ast)));
                    }
                    if base.eq_ignore_ascii_case("backquote") {
                        let inner_ast = result_to_ast(&inner_car.borrow())?;
                        return Ok(ASTNode::Backquote(Box::new(inner_ast)));
                    }
                }
            }

            // Check if this is a dotted pair
            let cdr_val = cdr.borrow();
            if !matches!(&*cdr_val, EvalResult::Nil | EvalResult::Cons(_, _)) {
                let cdr_ast = result_to_data_ast(&cdr_val)?;
                return Ok(ASTNode::DottedPair {
                    car: Box::new(car_ast),
                    cdr: Box::new(cdr_ast),
                });
            }
            drop(cdr_val);

            // Convert cdr to list of args
            let args = cons_to_data_list(&cdr.borrow())?;

            Ok(ASTNode::Call {
                function: Box::new(car_ast),
                args,
            })
        }
        _ => result_to_ast(result),
    }
}

fn cons_to_data_list(result: &EvalResult) -> Result<Vec<ASTNode>, String> {
    match result {
        EvalResult::Nil => Ok(vec![]),
        EvalResult::Cons(car, cdr) => {
            let mut list = vec![result_to_data_ast(&car.borrow())?];
            list.extend(cons_to_data_list(&cdr.borrow())?);
            Ok(list)
        }
        other => {
            Ok(vec![result_to_data_ast(other)?])
        }
    }
}

/// Check if an ASTNode contains unquote/unquote-splicing
fn contains_unquote_ast(ast: &ASTNode) -> bool {
    match ast {
        ASTNode::Unquote(_) | ASTNode::UnquoteSplicing(_) => true,
        ASTNode::Call { function, args } => {
            contains_unquote_ast(function) || args.iter().any(|a| contains_unquote_ast(a))
        }
        ASTNode::Quote(inner) => contains_unquote_ast(inner),
        ASTNode::Backquote(_) => false, // Don't recurse into backquotes
        ASTNode::If { test, then_branch, else_branch } => {
            contains_unquote_ast(test) || contains_unquote_ast(then_branch) || contains_unquote_ast(else_branch)
        }
        ASTNode::Progn { exprs } => exprs.iter().any(|e| contains_unquote_ast(e)),
        ASTNode::Let { bindings, body } | ASTNode::LetStar { bindings, body } => {
            bindings.iter().any(|(_, v)| contains_unquote_ast(v)) || body.iter().any(|e| contains_unquote_ast(e))
        }
        _ => false,
    }
}

fn parse_let_bindings(bindings_ast: &ASTNode) -> Result<Vec<(String, ASTNode)>, String> {
    // Bindings are represented as a list of (var value) pairs
    // After result_to_ast, this becomes a Call structure
    // We need to extract the individual bindings

    match bindings_ast {
        ASTNode::Constant(crate::ir::ConstantValue::Nil) => Ok(vec![]),
        ASTNode::Call { function, args } => {
            // The bindings list has been converted to a Call.
            // Each element is either a variable symbol or a (var [init]) call.
            let mut elems = Vec::with_capacity(args.len() + 1);
            elems.push((**function).clone());
            elems.extend(args.iter().cloned());

            let mut bindings = Vec::with_capacity(elems.len());
            for elem in elems {
                match elem {
                    ASTNode::Variable(var) => {
                        bindings.push((var, ASTNode::nil()));
                    }
                    ASTNode::Call { function: bind_func, args: bind_args } => {
                        if let ASTNode::Variable(var) = *bind_func {
                            if bind_args.len() > 1 {
                                return Err(format!(
                                    "let binding must have at most one value, got {}",
                                    bind_args.len()
                                ));
                            }
                            let value = bind_args.get(0).cloned().unwrap_or_else(ASTNode::nil);
                            bindings.push((var, value));
                        } else {
                            return Err("let binding must start with a variable".to_string());
                        }
                    }
                    _ => {
                        return Err("Invalid let binding format".to_string());
                    }
                }
            }

            Ok(bindings)
        }
        _ => Err(format!("Invalid let bindings format: expected list, got {:?}", bindings_ast)),
    }
}

fn parse_dotimes_spec(spec: &ASTNode) -> Result<(String, ASTNode, Option<ASTNode>), String> {
    // Spec is (var count [result])
    // After result_to_ast, this is a Call
    match spec {
        ASTNode::Call { function, args } => {
            if let ASTNode::Variable(var) = &**function {
                if args.is_empty() {
                    return Err("dotimes spec must have a count".to_string());
                }
                let count = args[0].clone();
                let result = if args.len() > 1 {
                    Some(args[1].clone())
                } else {
                    None
                };
                Ok((var.clone(), count, result))
            } else {
                Err("dotimes spec must start with a variable".to_string())
            }
        }
        _ => Err("Invalid dotimes spec format".to_string()),
    }
}

pub(super) fn eval_eql(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("eql requires 2 arguments".to_string());
    }

    let first = eval_with_env(&args[0], env)?;
    let second = eval_with_env(&args[1], env)?;

    match (&first, &second) {
        (EvalResult::Cons(car1, cdr1), EvalResult::Cons(car2, cdr2)) => {
            if Rc::ptr_eq(car1, car2) && Rc::ptr_eq(cdr1, cdr2) {
                Ok(EvalResult::Bool(true))
            } else {
                Ok(EvalResult::Nil)
            }
        }
        _ => {
            if structural_equal(&first, &second) {
                Ok(EvalResult::Bool(true))
            } else {
                Ok(EvalResult::Nil)
            }
        }
    }
}

pub(super) fn eval_equal(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("equal requires 2 arguments".to_string());
    }

    let first = eval_with_env(&args[0], env)?;
    let second = eval_with_env(&args[1], env)?;

    if deep_equal(&first, &second) {
        Ok(EvalResult::Bool(true))
    } else {
        Ok(EvalResult::Nil)
    }
}

// Deep equality comparison for equal function
fn deep_equal(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a == b,
        (EvalResult::Float(a), EvalResult::Float(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Boolean(a), EvalResult::Boolean(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Boolean(b)) | (EvalResult::Boolean(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::String(a), EvalResult::String(b)) => a == b,
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a == b,
        (EvalResult::Character(a), EvalResult::Character(b)) => a == b,
        (EvalResult::Array(a), EvalResult::Array(b)) => {
            let a = a.borrow();
            let b = b.borrow();
            a.len() == b.len() && a.iter().zip(b.iter()).all(|(x, y)| deep_equal(x, y))
        }
        (EvalResult::Cons(car1, cdr1), EvalResult::Cons(car2, cdr2)) => {
            deep_equal(&car1.borrow(), &car2.borrow()) && deep_equal(&cdr1.borrow(), &cdr2.borrow())
        }
        _ => false,
    }
}

pub(super) fn eval_stringp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("stringp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::String(_) => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_symbolp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("symbolp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Symbol(_) => Ok(EvalResult::Bool(true)),
        EvalResult::Nil => Ok(EvalResult::Bool(true)),  // NIL is a symbol in CL
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_errorp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("errorp requires 1 argument".to_string());
    }
    // No error type in EvalResult yet, always return NIL
    let _ = eval_with_env(&args[0], env)?;
    Ok(EvalResult::Nil)
}

pub(super) fn eval_gensym(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() > 1 {
        return Err("gensym requires 0 or 1 arguments".to_string());
    }

    let (prefix, explicit_suffix) = if args.is_empty() {
        ("G".to_string(), None)
    } else {
        match eval_with_env(&args[0], env)? {
            EvalResult::String(s) => (s, None),
            EvalResult::Symbol(s) => (s, None),
            EvalResult::Fixnum(n) => ("G".to_string(), Some(n.to_string())),
            EvalResult::Bignum(b) => ("G".to_string(), Some(b.to_string())),
            _ => return Err("gensym argument must be a string, symbol, or integer".to_string()),
        }
    };

    let suffix = if let Some(s) = explicit_suffix {
        s
    } else {
        let counter = GENSYM_COUNTER.with(|c| {
            let mut counter = c.borrow_mut();
            *counter += 1;
            *counter
        });
        counter.to_string()
    };

    Ok(EvalResult::Symbol(format!("#:{}{}", prefix, suffix)))
}

pub(super) fn eval_compile(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use super::eval_core::eval_with_env;

    // Common Lisp compile has two forms:
    // (compile name) - compile a function by name
    // (compile name definition) - compile a lambda definition
    // For WASM compilation: (compile expr "wasm" "output-path")

    if args.is_empty() {
        return Err("compile requires at least 1 argument".to_string());
    }

    // If 3 arguments, assume WASM compilation mode
    if args.len() == 3 {
        // TODO: Fix compile function to work with updated IR API
        return Err("compile: WASM compilation temporarily disabled due to IR API changes".to_string());
    }

    // Otherwise, Common Lisp compile mode
    // For now, we just return the function as-is (interpreted mode)
    // In a real implementation, this would compile to bytecode or native code
    if args.len() == 1 || args.len() == 2 {
        // (compile nil lambda) or (compile name) or (compile name lambda)
        // Evaluate the lambda expression to create a function
        if args.len() == 2 {
            // (compile nil '(lambda ...))
            let lambda_expr = &args[1];

            // If it's a quoted form, unwrap the quote and evaluate
            let func = match lambda_expr {
                ASTNode::Quote(quoted) => {
                    // Unwrap the quote and evaluate the lambda
                    eval_with_env(quoted, env)?
                }
                _ => {
                    // Not quoted, just evaluate
                    eval_with_env(lambda_expr, env)?
                }
            };

            Ok(func) // Return the compiled (evaluated) function
        } else {
            // (compile name) - look up and return the function
            let name_expr = &args[0];
            eval_with_env(name_expr, env)
        }
    } else {
        Err("compile requires 1, 2, or 3 arguments".to_string())
    }
}

pub(super) fn eval_in_package(args: &[ASTNode]) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("in-package requires a package name".to_string());
    }

    let package_name = match &args[0] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::String(s)) => s.clone(),
        ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),  // Handle keyword symbols like :uiop/package
        ASTNode::Quote(quoted) => {
            match &**quoted {
                ASTNode::Variable(name) => name.clone(),
                ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
                _ => return Err("in-package argument must be a symbol or string".to_string()),
            }
        }
        _ => return Err("in-package argument must be a symbol or string".to_string()),
    };

    // Strip leading colon for keywords
    let pkg_name = if package_name.starts_with(':') {
        package_name[1..].to_uppercase()
    } else {
        package_name.to_uppercase()
    };

    // Also update the local package system
    use super::eval_package::PACKAGES;
    use super::eval_package::CURRENT_PACKAGE;

    // Ensure package exists
    let exists = PACKAGES.with(|p| p.borrow().contains_key(&pkg_name));
    if !exists {
        PACKAGES.with(|p| {
            use super::eval_package::Package;
            p.borrow_mut().insert(pkg_name.clone(), Package::new(&pkg_name, vec![]));
        });
    }

    // Set current package in both systems
    CURRENT_PACKAGE.with(|p| {
        *p.borrow_mut() = pkg_name.clone();
    });

    // Also update runtime package manager
    let _ = rlasp_runtime::PACKAGE_MANAGER.set_current_package(&pkg_name);

    Ok(EvalResult::Symbol(pkg_name))
}

pub(super) fn eval_boundp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("boundp requires a symbol argument".to_string());
    }

    let symbol_name = match &args[0] {
        ASTNode::Quote(quoted) => {
            match &**quoted {
                ASTNode::Variable(name) => name.clone(),
                _ => return Err("boundp argument must be a symbol".to_string()),
            }
        }
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("boundp argument must be a symbol".to_string()),
    };

    if env.contains_key(&symbol_name) {
        Ok(EvalResult::Bool(true))
    } else if rlasp_jit::intrinsics::is_dynamic_bound(&symbol_name) {
        Ok(EvalResult::Bool(true))
    } else {
        Ok(EvalResult::Nil)
    }
}

pub(super) fn eval_symbol_value(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("symbol-value requires a symbol argument".to_string());
    }

    let symbol = eval_with_env(&args[0], env)?;

    // Extract first value if multiple values (e.g., from find-symbol)
    let symbol = match symbol {
        EvalResult::MultipleValues(vals) if !vals.is_empty() => vals.into_iter().next().unwrap(),
        other => other,
    };

    // Handle NIL specially - (symbol-value nil) returns NIL
    if matches!(symbol, EvalResult::Nil) {
        return Ok(EvalResult::Nil);
    }

    let symbol_name = match symbol {
        EvalResult::Symbol(name) => name,
        _ => return Err("symbol-value argument must be a symbol".to_string()),
    };

    // Check for T
    if symbol_name.to_uppercase() == "T" {
        return Ok(EvalResult::Bool(true));
    }

    // Check IO syntax variables first
    if let Some(val) = super::eval_io_syntax::get_io_syntax_var(&symbol_name) {
        return Ok(val);
    }

    // Check environment with multiple lookup strategies
    // 1. Try exact name (as given)
    if let Some(val) = env.get(&symbol_name) {
        return Ok(val.clone());
    }

    // 2. Try uppercase version
    let upper_name = symbol_name.to_uppercase();
    if let Some(val) = env.get(&upper_name) {
        return Ok(val.clone());
    }

    // 2b. Try lowercase version
    let lower_name = symbol_name.to_lowercase();
    if let Some(val) = env.get(&lower_name) {
        return Ok(val.clone());
    }

    // 3. If qualified (pkg:sym), try just the symbol part (uppercase and lowercase)
    if let Some(colon_pos) = symbol_name.rfind(':') {
        let unqualified = &symbol_name[colon_pos + 1..];
        // Try exact case
        if let Some(val) = env.get(unqualified) {
            return Ok(val.clone());
        }
        // Try uppercase
        let upper_unqualified = unqualified.to_uppercase();
        if let Some(val) = env.get(&upper_unqualified) {
            return Ok(val.clone());
        }
        // Try lowercase
        let lower_unqualified = unqualified.to_lowercase();
        if let Some(val) = env.get(&lower_unqualified) {
            return Ok(val.clone());
        }
    }

    // 4. If unqualified, try with current package prefix
    if !symbol_name.contains(':') {
        let current_pkg = super::eval_package::get_current_package();
        let qualified = format!("{}:{}", current_pkg, upper_name);
        if let Some(val) = env.get(&qualified) {
            return Ok(val.clone());
        }
    }

    // 5. Check JIT dynamic bindings as fallback
    if let Some(raw) = rlasp_jit::intrinsics::get_dynamic_value(&symbol_name) {
        let obj = unsafe { rlasp_runtime::LispObject::from_raw(raw) };
        return Ok(jit_lisp_object_to_eval_result(&obj));
    }

    Err(format!("Unbound variable: {}", symbol_name))
}

pub(super) fn eval_set_symbol_value(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("set requires 2 arguments: symbol and value".to_string());
    }

    let symbol = eval_with_env(&args[0], env)?;
    let symbol_name = match symbol {
        EvalResult::Symbol(name) => name,
        _ => return Err("set first argument must be a symbol".to_string()),
    };

    let value = eval_with_env(&args[1], env)?;

    // Check IO syntax variables first
    if super::eval_io_syntax::is_io_syntax_var(&symbol_name) {
        super::eval_io_syntax::set_io_syntax_var(&symbol_name, value.clone());
        return Ok(value);
    }

    // Set in environment
    env.insert(symbol_name, value.clone());
    Ok(value)
}

pub(super) fn eval_fset(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("fset requires 2 arguments: symbol and function".to_string());
    }

    let symbol_name = match &args[0] {
        ASTNode::Quote(quoted) => {
            match &**quoted {
                ASTNode::Variable(name) => name.clone(),
                _ => return Err("fset first argument must be a symbol".to_string()),
            }
        }
        ASTNode::Variable(name) => name.clone(),
        _ => return Err("fset first argument must be a symbol".to_string()),
    };

    let mut func_val = eval_with_env(&args[1], env)?;

    // Check if third argument is present and true, indicating this should be a macro
    if args.len() >= 3 {
        let is_macro = eval_with_env(&args[2], env)?;
        if !matches!(is_macro, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)) {
            // Convert Lambda to Macro
            func_val = match func_val {
                EvalResult::Lambda { params, defaults: _, supplied_p_vars: _, body, env: _closure_env, .. } => {
                    let params_ast = params_vec_to_ast_list(&params);
                    EvalResult::Macro { params: Box::new(params_ast), body }
                }
                other => other, // If it's not a lambda, just use it as-is
            };
        }
    }

    env.insert(symbol_name.clone(), func_val.clone());

    Ok(func_val)
}

fn params_vec_to_ast_list(params: &[String]) -> ASTNode {
    if params.is_empty() {
        return ASTNode::nil();
    }
    let mut nodes: Vec<ASTNode> = params.iter().map(|p| ASTNode::Variable(p.clone())).collect();
    let first = nodes.remove(0);
    ASTNode::Call {
        function: Box::new(first),
        args: nodes,
    }
}

pub(super) fn eval_print(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("print requires at least 1 argument".to_string());
    }
    let mut eval_args = Vec::with_capacity(args.len());
    for arg in args {
        eval_args.push(eval_with_env(arg, env)?);
    }
    super::eval_io::call_io_builtin("print", &eval_args)
}

pub(super) fn eval_format(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (format destination control-string &rest format-arguments)
    // destination: t (stdout), nil (return string), or a stream
    // For simplicity, we only handle t and nil

    if args.len() < 2 {
        return Err("format requires at least 2 arguments (destination and control-string)".to_string());
    }

    // Evaluate destination
    let dest = eval_with_env(&args[0], env)?;
    let to_stdout = match &dest {
        EvalResult::Bool(true) => true,
        EvalResult::Symbol(s) if s == "t" || s == "T" => true,
        EvalResult::Nil => false,
        _ => return Err("format destination must be t or nil".to_string()),
    };

    // Get control string
    let control_str = match eval_with_env(&args[1], env)? {
        EvalResult::String(s) => s,
        EvalResult::Symbol(s) => {
            // Handle quoted strings like "foo"
            if s.starts_with('"') && s.ends_with('"') {
                s[1..s.len()-1].to_string()
            } else {
                return Err("format control-string must be a string".to_string());
            }
        }
        _ => return Err("format control-string must be a string".to_string()),
    };

    // Evaluate format arguments
    let mut format_args = Vec::new();
    for i in 2..args.len() {
        format_args.push(eval_with_env(&args[i], env)?);
    }

    // Simple format string processing
    let mut output = String::new();
    let mut chars = control_str.chars().peekable();
    let mut arg_index = 0;

    while let Some(ch) = chars.next() {
        if ch == '~' {
            if let Some(&directive) = chars.peek() {
                chars.next(); // consume directive
                match directive {
                    '&' => {
                        // Fresh line - for simplicity, just add newline if output is not empty
                        if !output.is_empty() && !output.ends_with('\n') {
                            output.push('\n');
                        }
                    }
                    '%' => {
                        // Newline
                        output.push('\n');
                    }
                    'A' | 'a' => {
                        // Aesthetic - print the argument
                        if arg_index < format_args.len() {
                            output.push_str(&format_value(&format_args[arg_index]));
                            arg_index += 1;
                        }
                    }
                    'S' | 's' => {
                        // Standard - same as aesthetic for our purposes
                        if arg_index < format_args.len() {
                            output.push_str(&format_value(&format_args[arg_index]));
                            arg_index += 1;
                        }
                    }
                    '~' => {
                        // Literal tilde
                        output.push('~');
                    }
                    _ => {
                        // Unknown directive - just output as-is
                        output.push('~');
                        output.push(directive);
                    }
                }
            } else {
                output.push('~');
            }
        } else {
            output.push(ch);
        }
    }

    if to_stdout {
        print!("{}", output);
        Ok(EvalResult::Nil)
    } else {
        Ok(EvalResult::String(output))
    }
}

fn format_value(val: &EvalResult) -> String {
    match val {
        EvalResult::Fixnum(n) => n.to_string(),
        EvalResult::Bignum(n) => n.to_string(),
        EvalResult::Ratio(r) => format!("{}/{}", r.numerator_ref(), r.denominator_ref()),
        EvalResult::Float(f) => f.to_string(),
        EvalResult::String(s) => s.clone(),
        EvalResult::Symbol(s) => s.clone(),
        EvalResult::Nil => "NIL".to_string(),
        EvalResult::Bool(true) | EvalResult::Boolean(true) => "T".to_string(),
        EvalResult::Bool(false) | EvalResult::Boolean(false) => "NIL".to_string(),
        other => format!("{}", other),
    }
}

/// Extract a pathname string from an EvalResult (string, symbol, or pathname object)
fn extract_pathname_from_eval(val: &EvalResult) -> Option<String> {
    match val {
        EvalResult::String(s) => Some(s.clone()),
        EvalResult::Symbol(s) => {
            // Strip quotes if present
            if s.starts_with('"') && s.ends_with('"') {
                Some(s[1..s.len()-1].to_string())
            } else {
                Some(s.clone())
            }
        }
        EvalResult::Cons(car, cdr) => {
            // Handle pathname objects: (pathname "...")
            if let EvalResult::Symbol(sym) = &*car.borrow() {
                let base_name = sym.rsplit(':').next().unwrap_or(sym);
                if base_name.eq_ignore_ascii_case("pathname") {
                    if let EvalResult::Cons(path_car, _) = &*cdr.borrow() {
                        if let EvalResult::String(path_str) = &*path_car.borrow() {
                            return Some(path_str.clone());
                        }
                    }
                }
            }
            None
        }
        _ => None,
    }
}

fn normalize_logical_pathname(path: &str) -> String {
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
        normalized = format!("./{}", rest);
    }

    normalized.replace(';', "/")
}

pub(super) fn eval_load(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("load requires a file path argument".to_string());
    }

    let evaluated = eval_with_env(&args[0], env)?;
    let file_path = extract_pathname_from_eval(&evaluated)
        .ok_or_else(|| "load argument must be a string or pathname".to_string())?;
    let file_path = normalize_logical_pathname(&file_path);

    // Resolve relative paths against current directory for *load-pathname*
    let resolved_path = if std::path::Path::new(&file_path).is_absolute() {
        file_path.clone()
    } else {
        std::env::current_dir()
            .map(|cwd| cwd.join(&file_path).to_string_lossy().to_string())
            .unwrap_or_else(|_| file_path.clone())
    };

    // Save old values of *load-pathname* and *load-truename*
    let old_load_pathname = env.get("*load-pathname*").cloned();
    let old_load_truename = env.get("*load-truename*").cloned();

    // Set *load-pathname* and *load-truename* during load
    env.insert("*load-pathname*".to_string(), EvalResult::String(resolved_path.clone()));
    let truename = std::fs::canonicalize(&resolved_path)
        .map(|p| p.to_string_lossy().to_string())
        .unwrap_or_else(|_| resolved_path.clone());
    env.insert("*load-truename*".to_string(), EvalResult::String(truename));

    let contents = std::fs::read_to_string(&resolved_path)
        .map_err(|e| format!("Failed to read file {}: {}", resolved_path, e))?;

    let objects = rlasp_reader::read_all_from_string(&contents)
        .map_err(|e| format!("Error parsing {}: {:?}", file_path, e))?;

    use crate::repl::lisp_to_ast::lisp_to_ast;

    let mut _result = EvalResult::Nil;
    for obj in objects {
        let ast = lisp_to_ast(obj)?;
        _result = eval_with_env(&ast, env)?;
    }

    // Restore old values
    match old_load_pathname {
        Some(v) => env.insert("*load-pathname*".to_string(), v),
        None => env.remove("*load-pathname*"),
    };
    match old_load_truename {
        Some(v) => env.insert("*load-truename*".to_string(), v),
        None => env.remove("*load-truename*"),
    };

    // Return t (true) on success, as per Common Lisp spec
    Ok(EvalResult::Bool(true))
}

pub(super) fn eval_load_mlir(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("load-mlir requires a file path argument".to_string());
    }

    let evaluated = eval_with_env(&args[0], env)?;
    let file_path = extract_pathname_from_eval(&evaluated)
        .ok_or_else(|| "load-mlir argument must be a string or pathname".to_string())?;
    let file_path = normalize_logical_pathname(&file_path);

    let resolved_path = if std::path::Path::new(&file_path).is_absolute() {
        file_path.clone()
    } else {
        std::env::current_dir()
            .map(|cwd| cwd.join(&file_path).to_string_lossy().to_string())
            .unwrap_or_else(|_| file_path.clone())
    };

    if !std::path::Path::new(&resolved_path).exists() {
        return Err(format!("load-mlir: file not found: {}", resolved_path));
    }

    // Look up cc_load_mlir at runtime (it's defined in irlasp main.rs)
    use rlasp_runtime::LispObject;
    use rlasp_jit::intrinsics::cc_make_string;

    let sym = std::ffi::CString::new("cc_load_mlir").unwrap();
    let fn_ptr = unsafe { libc::dlsym(libc::RTLD_DEFAULT, sym.as_ptr()) };
    if fn_ptr.is_null() {
        return Err("load-mlir: cc_load_mlir not available (run with irlasp binary)".to_string());
    }
    let cc_load_mlir: extern "C" fn(usize) -> usize = unsafe { std::mem::transmute(fn_ptr) };

    let path_raw = unsafe { cc_make_string(resolved_path.as_ptr(), resolved_path.len()) };
    let result = cc_load_mlir(path_raw);
    let result_obj = unsafe { LispObject::from_raw(result) };

    if result_obj.is_nil() {
        Err(format!("load-mlir: failed to load {}", resolved_path))
    } else {
        Ok(EvalResult::Bool(true))
    }
}

pub(super) fn eval_load_lib(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use rlasp_ffi::Library;
    use std::rc::Rc;

    if args.len() != 1 {
        return Err("Usage: (load-lib \"name\")".to_string());
    }

    let lib_name = match eval_with_env(&args[0], env)? {
        EvalResult::String(s) => s,
        EvalResult::Symbol(s) => s,
        _ => return Err("Library name must be a string".to_string()),
    };

    let lib = if lib_name == "libm" {
        Library::load_libm().map_err(|e| e.to_string())?
    } else {
        Library::load(&lib_name).map_err(|e| e.to_string())?
    };

    // Store library in environment with special key
    let key = format!("*ffi-lib-{}*", lib_name);
    env.insert(key, EvalResult::ForeignLibrary(Rc::new(lib)));

    Ok(EvalResult::Symbol(format!("Loaded {}", lib_name)))
}

pub(super) fn eval_defforeign(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use rlasp_ffi::{ForeignSignature, ForeignType};
    use std::rc::Rc;

    // (defforeign name "symbol" param-type... return-type)
    // Example: (defforeign sqrt "sqrt" double double)
    if args.len() < 3 {
        return Err("Usage: (defforeign name \"symbol\" param-types... return-type)".to_string());
    }

    let func_name = if let ASTNode::Variable(n) = &args[0] {
        n.clone()
    } else {
        return Err("Function name must be a symbol".to_string());
    };

    let symbol_name = match eval_with_env(&args[1], env)? {
        EvalResult::String(s) => s,
        EvalResult::Symbol(s) => s,
        _ => return Err("Symbol must be a string".to_string()),
    };

    // Helper function to parse type from AST
    fn parse_type(ast: &ASTNode) -> Result<ForeignType, String> {
        if let ASTNode::Variable(type_name) = ast {
            match type_name.as_str() {
                "void" => Ok(ForeignType::Void),
                "int8" => Ok(ForeignType::Int8),
                "uint8" => Ok(ForeignType::UInt8),
                "int16" => Ok(ForeignType::Int16),
                "uint16" => Ok(ForeignType::UInt16),
                "int32" => Ok(ForeignType::Int32),
                "uint32" => Ok(ForeignType::UInt32),
                "int64" => Ok(ForeignType::Int64),
                "uint64" => Ok(ForeignType::UInt64),
                "float" => Ok(ForeignType::Float),
                "double" => Ok(ForeignType::Double),
                "pointer" => Ok(ForeignType::Pointer),
                _ => Err(format!("Unknown FFI type: {}", type_name)),
            }
        } else {
            Err("Type must be a symbol".to_string())
        }
    }

    // All args except first two and last are param types
    let param_types: Result<Vec<_>, _> = args[2..args.len()-1].iter()
        .map(|arg| parse_type(arg))
        .collect();
    let param_types = param_types?;

    let return_type = parse_type(&args[args.len()-1])?;

    let signature = ForeignSignature { return_type, param_types };

    // Find function in loaded libraries
    for (key, val) in env.iter() {
        if key.starts_with("*ffi-lib-") {
            if let EvalResult::ForeignLibrary(lib) = val {
                if let Ok(func) = lib.get_function(&symbol_name, signature.clone()) {
                    env.insert(func_name.clone(), EvalResult::ForeignFunction(Rc::new(func)));
                    return Ok(EvalResult::Symbol(format!("Defined {}", func_name)));
                }
            }
        }
    }

    Err(format!("Symbol '{}' not found in any loaded library", symbol_name))
}

pub(super) fn eval_complement(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("complement requires 1 argument (a function)".to_string());
    }

    let func = eval_with_env(&args[0], env)?;

    // Create a lambda that negates the result of calling func
    // The complement lambda takes any number of arguments (&rest args)
    // and returns (not (apply func args))
    match func {
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: func_env, dynamic_env } => {
            // Create a new lambda that wraps the original and negates its result
            // We'll create a special "complement lambda" that stores the original function
            // For now, we'll use a simpler approach: create a lambda with &rest that calls the function and negates

            // Build the body: (not (funcall original-func &rest-args))
            let complement_body = vec![
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("not".to_string())),
                    args: vec![
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("__complement_inner__".to_string())),
                            args: vec![ASTNode::Variable("__complement_args__".to_string())],
                        }
                    ],
                }
            ];

            // Store the original function in a new environment
            let mut complement_env = func_env.borrow().clone();
            complement_env.insert("__complement_inner__".to_string(), EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: func_env, dynamic_env });

            Ok(EvalResult::Lambda {
                params: vec!["&rest".to_string(), "__complement_args__".to_string()],
                defaults: HashMap::new(),
                supplied_p_vars: HashMap::new(),
                key_params: HashMap::new(),
                body: complement_body,
                env: Rc::new(RefCell::new(complement_env)),
                dynamic_env: false,
            })
        }
        EvalResult::Symbol(name) => {
            // If it's a symbol, create a lambda that calls the named function and negates
            let complement_body = vec![
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("not".to_string())),
                    args: vec![
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable(name)),
                            args: vec![ASTNode::Variable("__complement_args__".to_string())],
                        }
                    ],
                }
            ];

            Ok(EvalResult::Lambda {
                params: vec!["&rest".to_string(), "__complement_args__".to_string()],
                defaults: HashMap::new(),
                supplied_p_vars: HashMap::new(),
                key_params: HashMap::new(),
                body: complement_body,
                env: Rc::new(RefCell::new(env.clone())),
                dynamic_env: false,
            })
        }
        _ => Err("complement requires a function argument".to_string()),
    }
}

pub(super) fn eval_coerce_fdesignator(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // coerce-fdesignator converts a function designator (symbol or lambda) to a function
    // In Common Lisp, a function designator is either:
    // - A symbol naming a function
    // - A lambda expression
    if args.len() != 1 {
        return Err("coerce-fdesignator requires 1 argument".to_string());
    }

    let arg = eval_with_env(&args[0], env)?;

    match arg {
        // If it's already a lambda, return it as-is
        EvalResult::Lambda { .. } => Ok(arg),

        // If it's a symbol, look up the function
        EvalResult::Symbol(name) => {
            // Try to look up the function in the environment
            if let Some(func) = env.get(&name).cloned() {
                match func {
                    EvalResult::Lambda { .. } => Ok(func),
                    _ => {
                        // The symbol exists but doesn't refer to a function
                        // In CL, this would try fdefinition, but for now return the symbol
                        Ok(EvalResult::Symbol(name))
                    }
                }
            } else {
                // Symbol not found, return it anyway (built-in functions handle this)
                Ok(EvalResult::Symbol(name))
            }
        }

        // Anything else is returned as-is (might be a built-in function reference)
        _ => Ok(arg),
    }
}

pub(super) fn eval_string_equal(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (string= string1 string2) - case-sensitive string equality
    if args.len() != 2 {
        return Err("string= requires 2 arguments".to_string());
    }

    let s1 = eval_with_env(&args[0], env)?;
    let s2 = eval_with_env(&args[1], env)?;

    match (s1, s2) {
        (EvalResult::String(a), EvalResult::String(b)) => {
            Ok(if a == b { EvalResult::Bool(true) } else { EvalResult::Nil })
        }
        _ => Err("string= requires string arguments".to_string()),
    }
}

pub(super) fn eval_string_lessp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (string< string1 string2) - case-sensitive string less-than
    if args.len() != 2 {
        return Err("string< requires 2 arguments".to_string());
    }

    let s1 = eval_with_env(&args[0], env)?;
    let s2 = eval_with_env(&args[1], env)?;

    match (s1, s2) {
        (EvalResult::String(a), EvalResult::String(b)) => {
            Ok(if a < b { EvalResult::Bool(true) } else { EvalResult::Nil })
        }
        _ => Err("string< requires string arguments".to_string()),
    }
}

pub(super) fn eval_string_equal_ci(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (string-equal string1 string2) - case-insensitive string equality
    if args.len() != 2 {
        return Err("string-equal requires 2 arguments".to_string());
    }

    let s1 = eval_with_env(&args[0], env)?;
    let s2 = eval_with_env(&args[1], env)?;

    match (s1, s2) {
        (EvalResult::String(a), EvalResult::String(b)) => {
            Ok(if a.to_lowercase() == b.to_lowercase() {
                EvalResult::Bool(true)
            } else {
                EvalResult::Nil
            })
        }
        _ => Err("string-equal requires string arguments".to_string()),
    }
}

pub(super) fn eval_string_upcase(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (string-upcase string-designator) - convert string to uppercase
    // String designators: string, symbol (uses symbol name), or character
    if args.len() != 1 {
        return Err("string-upcase requires 1 argument".to_string());
    }

    let s = eval_with_env(&args[0], env)?;

    match s {
        EvalResult::String(a) => Ok(EvalResult::String(a.to_uppercase())),
        EvalResult::Symbol(sym) => {
            // Extract symbol name without package prefix (e.g., ":foo" -> "FOO", "pkg:bar" -> "BAR")
            let name = if let Some(pos) = sym.rfind(':') {
                &sym[pos + 1..]
            } else {
                &sym
            };
            Ok(EvalResult::String(name.to_uppercase()))
        }
        EvalResult::Nil => Ok(EvalResult::String("NIL".to_string())),  // NIL symbol name is "NIL"
        EvalResult::Character(c) => Ok(EvalResult::String(c.to_uppercase().to_string())),
        _ => Err("string-upcase requires a string designator".to_string()),
    }
}

pub(super) fn eval_string_downcase(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (string-downcase string-designator) - convert string to lowercase
    // String designators: string, symbol (uses symbol name), or character
    if args.len() != 1 {
        return Err("string-downcase requires 1 argument".to_string());
    }

    let s = eval_with_env(&args[0], env)?;

    match s {
        EvalResult::String(a) => Ok(EvalResult::String(a.to_lowercase())),
        EvalResult::Symbol(sym) => {
            // Extract symbol name without package prefix (e.g., ":foo" -> "foo", "pkg:bar" -> "bar")
            let name = if let Some(pos) = sym.rfind(':') {
                &sym[pos + 1..]
            } else {
                &sym
            };
            Ok(EvalResult::String(name.to_lowercase()))
        }
        EvalResult::Nil => Ok(EvalResult::String("nil".to_string())),  // NIL symbol name is "NIL"
        EvalResult::Character(c) => Ok(EvalResult::String(c.to_lowercase().to_string())),
        _ => Err("string-downcase requires a string designator".to_string()),
    }
}

pub(super) fn eval_functionp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (functionp object) - test if object is a function
    if args.len() != 1 {
        return Err("functionp requires 1 argument".to_string());
    }

    let obj = eval_with_env(&args[0], env)?;

    fn is_function(val: &EvalResult) -> bool {
        matches!(val,
            EvalResult::Lambda { .. } |
            EvalResult::BuiltinFunction(_) |
            EvalResult::GenericFunction(_) |
            EvalResult::ForeignFunction(_)
        )
    }

    match &obj {
        _ if is_function(&obj) => Ok(EvalResult::Bool(true)),
        EvalResult::Symbol(name) => {
            // Check if symbol is bound to a function in %FN% namespace
            let fn_key = format!("%FN%{}", name);
            if let Some(val) = env.get(&fn_key).or_else(|| env.get(name.as_str())) {
                if is_function(val) {
                    return Ok(EvalResult::Bool(true));
                }
            }
            Ok(EvalResult::Nil)
        }
        _ => Ok(EvalResult::Nil),
    }
}

// Hash table functions
pub(super) fn eval_make_hash_table(_args: &[ASTNode], _env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // For now, ignore all keyword arguments like :test, :size, etc.
    Ok(EvalResult::HashTable(Rc::new(RefCell::new(HashMap::new()))))
}

pub(super) fn eval_hash_table_p(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("hash-table-p requires 1 argument".to_string());
    }
    let obj = eval_with_env(&args[0], env)?;
    match obj {
        EvalResult::HashTable(_) => Ok(EvalResult::Boolean(true)),
        _ => Ok(EvalResult::Nil),
    }
}

/// Convert a key to a typed string representation for hash table storage
fn key_to_typed_string(key: &EvalResult) -> Result<String, String> {
    match key {
        EvalResult::Symbol(s) => {
            // Keywords (symbols starting with :) get special prefix
            if s.starts_with(':') {
                Ok(format!("key:{}", s))
            } else {
                Ok(format!("sym:{}", s))
            }
        }
        EvalResult::String(s) => Ok(format!("str:{}", s)),
        EvalResult::Fixnum(n) => Ok(format!("num:{}", n)),
        EvalResult::Character(c) => Ok(format!("chr:{}", *c as u32)),
        EvalResult::Float(f) => Ok(format!("flt:{}", f.to_bits())),
        EvalResult::Bignum(b) => Ok(format!("big:{}", b)),
        EvalResult::Nil => Ok("nil:".to_string()),
        EvalResult::Bool(b) => Ok(format!("bool:{}", b)),
        EvalResult::Cons(_, _) => {
            // Use debug representation for list keys (identity-based)
            Ok(format!("list:{:?}", key))
        }
        _ => Ok(format!("obj:{:?}", key)),
    }
}

/// Parse a typed key string back to EvalResult
fn typed_string_to_key(s: &str) -> EvalResult {
    if let Some(rest) = s.strip_prefix("sym:") {
        EvalResult::Symbol(rest.to_string())
    } else if let Some(rest) = s.strip_prefix("str:") {
        EvalResult::String(rest.to_string())
    } else if let Some(rest) = s.strip_prefix("num:") {
        EvalResult::Fixnum(rest.parse().unwrap_or(0))
    } else if let Some(rest) = s.strip_prefix("key:") {
        EvalResult::Symbol(rest.to_string())  // Keywords are stored as symbols
    } else {
        // Legacy: assume symbol for unprefixed keys
        EvalResult::Symbol(s.to_string())
    }
}

pub(super) fn eval_gethash(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 || args.len() > 3 {
        return Err("gethash requires 2 or 3 arguments (key hash-table [default])".to_string());
    }

    let key = eval_with_env(&args[0], env)?;
    let key_str = key_to_typed_string(&key)?;

    let ht = eval_with_env(&args[1], env)?;
    match ht {
        EvalResult::HashTable(map) => {
            let result = map.borrow().get(&key_str).cloned();
            match result {
                Some(val) => Ok(EvalResult::MultipleValues(vec![val, EvalResult::Bool(true)])),
                None => {
                    let default = if args.len() == 3 {
                        eval_with_env(&args[2], env)?
                    } else {
                        EvalResult::Nil
                    };
                    Ok(EvalResult::MultipleValues(vec![default, EvalResult::Nil]))
                }
            }
        }
        _ => Err("gethash second argument must be a hash table".to_string()),
    }
}

pub(super) fn eval_hash_set(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (si::hash-set key hash-table value)
    if args.len() != 3 {
        return Err("hash-set requires 3 arguments (key hash-table value)".to_string());
    }

    let key = eval_with_env(&args[0], env)?;
    let key_str = key_to_typed_string(&key)?;

    let ht = eval_with_env(&args[1], env)?;
    let value = eval_with_env(&args[2], env)?;

    match ht {
        EvalResult::HashTable(map) => {
            map.borrow_mut().insert(key_str, value.clone());
            Ok(value)
        }
        _ => Err("hash-set second argument must be a hash table".to_string()),
    }
}

pub(super) fn eval_remhash(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("remhash requires 2 arguments (key hash-table)".to_string());
    }

    let key = eval_with_env(&args[0], env)?;
    let key_str = key_to_typed_string(&key)?;

    let ht = eval_with_env(&args[1], env)?;
    match ht {
        EvalResult::HashTable(map) => {
            let removed = map.borrow_mut().remove(&key_str).is_some();
            Ok(if removed { EvalResult::Bool(true) } else { EvalResult::Nil })
        }
        _ => Err("remhash second argument must be a hash table".to_string()),
    }
}

pub(super) fn eval_clrhash(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("clrhash requires 1 argument (hash-table)".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;
    match ht {
        EvalResult::HashTable(map) => {
            map.borrow_mut().clear();
            Ok(EvalResult::HashTable(map))
        }
        _ => Err("clrhash requires a hash table".to_string()),
    }
}

pub(super) fn eval_copy_hash_table(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("copy-hash-table requires 1 argument (hash-table)".to_string());
    }
    let ht = eval_with_env(&args[0], env)?;
    match ht {
        EvalResult::HashTable(map) => {
            let new_map = map.borrow().clone();
            Ok(EvalResult::HashTable(std::rc::Rc::new(std::cell::RefCell::new(new_map))))
        }
        _ => Err("copy-hash-table requires a hash table".to_string()),
    }
}

pub(super) fn eval_copy_structure(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("copy-structure requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    match val {
        EvalResult::HashTable(map) => {
            let new_map = map.borrow().clone();
            Ok(EvalResult::HashTable(std::rc::Rc::new(std::cell::RefCell::new(new_map))))
        }
        _ => Err("copy-structure: argument is not a structure".to_string()),
    }
}

pub(super) fn eval_hash_table_count(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("hash-table-count requires 1 argument (hash-table)".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;
    match ht {
        EvalResult::HashTable(map) => {
            Ok(EvalResult::Fixnum(map.borrow().len() as i64))
        }
        _ => Err("hash-table-count requires a hash table".to_string()),
    }
}

pub(super) fn eval_hash_table_size(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("hash-table-size requires 1 argument (hash-table)".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;
    match ht {
        EvalResult::HashTable(map) => {
            // Return capacity (for HashMap, we approximate with len since capacity isn't exposed)
            Ok(EvalResult::Fixnum(map.borrow().len() as i64))
        }
        _ => Err("hash-table-size requires a hash table".to_string()),
    }
}

pub(super) fn eval_hash_table_test(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("hash-table-test requires 1 argument (hash-table)".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;
    match ht {
        EvalResult::HashTable(_) => {
            // Always use 'equal as the test function for now
            Ok(EvalResult::Symbol("EQUAL".to_string()))
        }
        _ => Err("hash-table-test requires a hash table".to_string()),
    }
}

pub(super) fn eval_hash_table_rehash_size(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("hash-table-rehash-size requires 1 argument".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;
    match ht {
        EvalResult::HashTable(_) => {
            // Return default rehash size
            Ok(EvalResult::Float(1.5))
        }
        _ => Err("hash-table-rehash-size requires a hash table".to_string()),
    }
}

pub(super) fn eval_hash_table_rehash_threshold(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("hash-table-rehash-threshold requires 1 argument".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;
    match ht {
        EvalResult::HashTable(_) => {
            // Return default rehash threshold
            Ok(EvalResult::Float(0.75))
        }
        _ => Err("hash-table-rehash-threshold requires a hash table".to_string()),
    }
}

pub(super) fn eval_maphash(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("maphash requires 2 arguments (function hash-table)".to_string());
    }

    // Evaluate the function
    let func = eval_with_env(&args[0], env)?;

    // Evaluate the hash table
    let ht = eval_with_env(&args[1], env)?;

    match ht {
        EvalResult::HashTable(hash_ref) => {
            let hash = hash_ref.borrow();

            // Iterate over all key-value pairs in the hash table
            for (key_str, value) in hash.iter() {
                // Convert typed key string back to proper EvalResult
                let key = typed_string_to_key(key_str);

                // Call the function with key and value
                match &func {
                    EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, env: closure_env, dynamic_env } => {
                        eval_lambda_call_with_values(
                            params.clone(),
                            defaults.clone(),
                            supplied_p_vars.clone(),
                            key_params.clone(),
                            body.clone(),
                            *dynamic_env,
                            closure_env.clone(),
                            &[key, value.clone()],
                            env
                        )?;
                    }
                    _ => return Err("maphash: first argument must be a function".to_string()),
                }
            }

            // maphash returns nil
            Ok(EvalResult::Nil)
        }
        _ => Err("maphash: second argument must be a hash table".to_string()),
    }
}

pub(super) fn eval_sethash(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // Alias for si::hash-set
    eval_hash_set(args, env)
}

pub(super) fn eval_hash_table_keys(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("hash-table-keys requires 1 argument (hash-table)".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;

    match ht {
        EvalResult::HashTable(hash_ref) => {
            let hash = hash_ref.borrow();
            let mut result = EvalResult::Nil;

            // Collect keys in reverse order (to match Common Lisp behavior when consing)
            let keys: Vec<_> = hash.keys().collect();
            for key_str in keys.into_iter().rev() {
                // Convert typed key string back to proper EvalResult
                let key = typed_string_to_key(key_str);
                result = EvalResult::Cons(
                    std::rc::Rc::new(std::cell::RefCell::new(key)),
                    std::rc::Rc::new(std::cell::RefCell::new(result)),
                );
            }

            Ok(result)
        }
        _ => Err("hash-table-keys: argument must be a hash table".to_string()),
    }
}

pub(super) fn eval_hash_table_values(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("hash-table-values requires 1 argument (hash-table)".to_string());
    }

    let ht = eval_with_env(&args[0], env)?;

    match ht {
        EvalResult::HashTable(hash_ref) => {
            let hash = hash_ref.borrow();
            let mut result = EvalResult::Nil;

            // Collect values in reverse order (to match Common Lisp behavior when consing)
            let values: Vec<_> = hash.values().collect();
            for value in values.into_iter().rev() {
                result = EvalResult::Cons(
                    std::rc::Rc::new(std::cell::RefCell::new(value.clone())),
                    std::rc::Rc::new(std::cell::RefCell::new(result)),
                );
            }

            Ok(result)
        }
        _ => Err("hash-table-values: argument must be a hash table".to_string()),
    }
}

pub(super) fn eval_parse_integer(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("parse-integer requires a string".to_string());
    }

    let s = match eval_with_env(&args[0], env)? {
        EvalResult::String(s) => s,
        _ => return Err("parse-integer requires a string".to_string()),
    };

    // Parse keyword args
    let mut radix: u32 = 10;
    let mut start: usize = 0;
    let mut end: usize = s.len();
    let mut junk_allowed = false;

    let mut i = 1;
    while i + 1 < args.len() {
        let key = match eval_with_env(&args[i], env)? {
            EvalResult::Symbol(k) => k.to_uppercase(),
            _ => { i += 1; continue; }
        };
        let val = eval_with_env(&args[i + 1], env)?;
        match key.as_str() {
            ":RADIX" => if let EvalResult::Fixnum(n) = val { radix = n as u32; },
            ":START" => if let EvalResult::Fixnum(n) = val { start = n as usize; },
            ":END" => match val {
                EvalResult::Fixnum(n) => end = n as usize,
                EvalResult::Nil => {} // nil means use string length
                _ => {}
            },
            ":JUNK-ALLOWED" => junk_allowed = !matches!(val, EvalResult::Nil),
            _ => {}
        }
        i += 2;
    }

    let substr = &s[start..end.min(s.len())];
    let trimmed = substr.trim();

    // Handle sign
    let (is_neg, digits) = if trimmed.starts_with('-') {
        (true, trimmed[1..].trim_start())
    } else if trimmed.starts_with('+') {
        (false, trimmed[1..].trim_start())
    } else {
        (false, trimmed)
    };

    // Parse digits with given radix
    let mut value: i64 = 0;
    let mut parsed_any = false;
    let mut end_pos = start;
    for (idx, ch) in substr.char_indices() {
        if ch.is_whitespace() {
            if parsed_any { end_pos = start + idx; break; }
            continue;
        }
        if ch == '+' || ch == '-' {
            if parsed_any {
                end_pos = start + idx;
                break;
            }
            continue;
        }
        if let Some(d) = ch.to_digit(radix) {
            value = value * radix as i64 + d as i64;
            parsed_any = true;
            end_pos = start + idx + ch.len_utf8();
        } else {
            if junk_allowed {
                end_pos = start + idx;
                break;
            }
            return Err(format!("Cannot parse '{}' as integer with radix {}", substr, radix));
        }
    }
    if !parsed_any && !junk_allowed {
        end_pos = start + substr.len();
    }
    if !parsed_any {
        if junk_allowed {
            return Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Fixnum(end_pos as i64)]));
        }
        return Err(format!("Cannot parse '{}' as integer", substr));
    }
    if is_neg { value = -value; }
    // If no early break, end_pos is end of substring
    if end_pos <= start && parsed_any {
        end_pos = end.min(s.len());
    }
    Ok(EvalResult::MultipleValues(vec![EvalResult::Fixnum(value), EvalResult::Fixnum(end_pos as i64)]))
}

pub(super) fn eval_sxhash(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("sxhash requires 1 argument".to_string());
    }

    let obj = eval_with_env(&args[0], env)?;
    let hash = match obj {
        EvalResult::Fixnum(n) => n.abs(),
        EvalResult::Float(n) => n.abs() as i64,
        EvalResult::String(s) => {
            let mut hash: i64 = 0;
            for ch in s.chars() {
                hash = hash.wrapping_mul(31).wrapping_add(ch as i64);
            }
            hash.abs()
        }
        EvalResult::Symbol(s) => {
            let mut hash: i64 = 0;
            for ch in s.chars() {
                hash = hash.wrapping_mul(31).wrapping_add(ch as i64);
            }
            hash.abs()
        }
        _ => 0,
    };
    Ok(EvalResult::Fixnum(hash))
}

pub(super) fn eval_values_list(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("values-list requires 1 argument".to_string());
    }

    let list = eval_with_env(&args[0], env)?;
    // Collect all elements of the list into a Vec
    let mut vals = Vec::new();
    let mut cur = list;
    loop {
        match cur {
            EvalResult::Nil => break,
            EvalResult::Cons(car, cdr) => {
                vals.push(car.borrow().clone());
                cur = cdr.borrow().clone();
            }
            _ => {
                vals.push(cur);
                break;
            }
        }
    }
    if vals.is_empty() {
        Ok(EvalResult::MultipleValues(vec![]))
    } else if vals.len() == 1 {
        Ok(vals.into_iter().next().unwrap())
    } else {
        Ok(EvalResult::MultipleValues(vals))
    }
}

pub(super) fn eval_macroexpand(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("macroexpand requires at least 1 argument".to_string());
    }
    Ok(eval_with_env(&args[0], env)?)
}

pub(super) fn eval_macroexpand_1(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("macroexpand-1 requires at least 1 argument".to_string());
    }

    // First evaluate the argument to get the form
    let form = eval_with_env(&args[0], env)?;

    // Check if the form is a list whose car is a macro name
    if let EvalResult::Cons(car, cdr) = &form {
        let car_val = car.borrow();
        if let EvalResult::Symbol(name) = &*car_val {
            // Check if this name is bound to a macro
            if let Some(EvalResult::Macro { params, body }) = env.get(name).cloned() {
                // It's a macro call - expand it once
                // Convert cdr to a list of ASTNodes for macro expansion
                let macro_args = cons_to_ast_args(&cdr.borrow())?;

                // Create a new environment for the macro expansion
                let mut macro_env = env.clone();
                super::eval_core::bind_macro_params(&params, &macro_args, Some(name), &mut macro_env)?;

                // Evaluate the macro body to get the expansion
                let mut result = EvalResult::Nil;
                for expr in &body {
                    result = eval_with_env(expr, &mut macro_env)?;
                }

                // Return the expanded form (as EvalResult, not evaluated)
                return Ok(result);
            }
        }
    }

    // Not a macro call - return the form unchanged
    Ok(form)
}

/// Convert EvalResult cons list to Vec<ASTNode> for macro expansion
fn cons_to_ast_args(result: &EvalResult) -> Result<Vec<ASTNode>, String> {
    match result {
        EvalResult::Nil => Ok(vec![]),
        EvalResult::Cons(car, cdr) => {
            let car_ast = result_to_ast(&car.borrow())?;
            let mut args = vec![car_ast];
            args.extend(cons_to_ast_args(&cdr.borrow())?);
            Ok(args)
        }
        other => {
            // Single element (dotted list tail)
            Ok(vec![result_to_ast(other)?])
        }
    }
}

pub(super) fn eval_macro_function(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("macro-function requires a symbol".to_string());
    }

    match eval_with_env(&args[0], env)? {
        EvalResult::Symbol(name) => {
            let mut candidates = vec![
                name.clone(),
                name.to_lowercase(),
                name.to_uppercase(),
            ];
            if let Some(base) = name.rsplit(':').next() {
                if base != name {
                    candidates.push(base.to_string());
                    candidates.push(base.to_lowercase());
                    candidates.push(base.to_uppercase());
                }
            }

            for cand in candidates {
                let fn_name = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, cand);
                if let Some(val) = env.get(&fn_name) {
                    if matches!(val, EvalResult::Macro { .. }) {
                        return Ok(val.clone());
                    }
                }
                if let Some(val) = env.get(&cand) {
                    if matches!(val, EvalResult::Macro { .. }) {
                        return Ok(val.clone());
                    }
                }
            }

            Ok(EvalResult::Nil)
        }
        other => {
            if std::env::var("RLASP_DEBUG_MACRO_FUNCTION").is_ok() {
                eprintln!("[macro-function] arg={:?} ast={:?}", other, args.get(0));
            }
            Err("macro-function requires a symbol".to_string())
        }
    }
}

pub(super) fn eval_compiled_function_p(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("compiled-function-p requires an argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Lambda { .. } | EvalResult::Macro { .. } | EvalResult::ModifyMacro { .. } => Ok(EvalResult::Boolean(true)),
        _ => Ok(EvalResult::Boolean(false)),
    }
}

pub(super) fn eval_fdefinition(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("fdefinition requires a function name".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Symbol(name) => {
            // Helper to try looking up a function name
            let try_lookup = |n: &str| -> Option<EvalResult> {
                // Try with function namespace prefix
                let fn_name = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, n);
                if let Some(func) = env.get(&fn_name).cloned() {
                    return Some(func);
                }
                // Try without prefix
                if let Some(func) = env.get(n).cloned() {
                    return Some(func);
                }
                None
            };

            // First try the exact name
            if let Some(func) = try_lookup(&name) {
                return Ok(func);
            }

            // Try uppercase
            if let Some(func) = try_lookup(&name.to_uppercase()) {
                return Ok(func);
            }

            // Try lowercase
            if let Some(func) = try_lookup(&name.to_lowercase()) {
                return Ok(func);
            }

            // If qualified (pkg:sym), try just the symbol part
            if let Some(colon_pos) = name.rfind(':') {
                let unqualified = &name[colon_pos + 1..];
                if let Some(func) = try_lookup(unqualified) {
                    return Ok(func);
                }
                if let Some(func) = try_lookup(&unqualified.to_uppercase()) {
                    return Ok(func);
                }
                if let Some(func) = try_lookup(&unqualified.to_lowercase()) {
                    return Ok(func);
                }
            }

            // Check for builtin functions - return a special marker
            // This list includes common CL builtins plus pathname functions
            let builtin_fns = [
                // Pathname functions
                "pathname-name", "pathname-type", "pathname-directory", "pathname-host",
                "pathname-device", "pathname-version", "pathname", "pathnamep", "make-pathname",
                "merge-pathnames", "namestring", "file-namestring", "directory-namestring",
                "host-namestring", "enough-namestring", "parse-namestring", "truename",
                "translate-pathname", "translate-logical-pathname", "probe-file", "directory",
                "ensure-directories-exist", "delete-file", "rename-file", "file-write-date",
                "file-author", "file-length", "file-position",
                // List functions
                "car", "cdr", "cons", "list", "list*", "append", "nconc", "reverse", "nreverse",
                "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth",
                "nth", "nthcdr", "last", "butlast", "nbutlast", "length", "copy-list", "copy-tree",
                "member", "assoc", "rassoc", "subst", "sublis", "acons", "pairlis",
                "mapcar", "mapc", "maplist", "mapl", "mapcan", "mapcon",
                // Sequence functions
                "elt", "subseq", "copy-seq", "fill", "replace", "count", "count-if", "count-if-not",
                "find", "find-if", "find-if-not", "position", "position-if", "position-if-not",
                "search", "mismatch", "remove", "remove-if", "remove-if-not", "delete", "delete-if", "delete-if-not",
                "substitute", "nsubstitute", "concatenate", "merge", "sort", "stable-sort",
                "reduce", "every", "some", "notevery", "notany", "map", "map-into",
                // String functions
                "string", "string-upcase", "string-downcase", "string-capitalize",
                "nstring-upcase", "nstring-downcase", "nstring-capitalize",
                "string=", "string/=", "string<", "string>", "string<=", "string>=",
                "string-equal", "string-not-equal", "string-lessp", "string-greaterp",
                "string-not-lessp", "string-not-greaterp", "string-trim", "string-left-trim", "string-right-trim",
                "char", "schar", "make-string",
                // Character functions
                "char-code", "code-char", "char-name", "name-char",
                "alpha-char-p", "digit-char-p", "alphanumericp", "graphic-char-p",
                "upper-case-p", "lower-case-p", "both-case-p", "char-upcase", "char-downcase",
                // Numeric functions
                "+", "-", "*", "/", "1+", "1-", "abs", "signum", "floor", "ceiling", "truncate", "round",
                "mod", "rem", "min", "max", "gcd", "lcm", "exp", "expt", "log", "sqrt", "isqrt",
                "sin", "cos", "tan", "asin", "acos", "atan", "sinh", "cosh", "tanh", "asinh", "acosh", "atanh",
                "=", "/=", "<", ">", "<=", ">=", "zerop", "plusp", "minusp", "evenp", "oddp",
                "numberp", "integerp", "rationalp", "floatp", "complexp", "realp",
                "random", "random-state-p", "make-random-state",
                // Symbol functions
                "symbol-name", "symbol-package", "symbol-value", "symbol-function", "symbol-plist",
                "get", "getf", "remprop", "boundp", "fboundp", "makunbound", "fmakunbound",
                "intern", "make-symbol", "gensym", "gentemp", "copy-symbol",
                // I/O functions
                "read", "read-char", "read-line", "read-from-string", "unread-char", "peek-char",
                "write", "write-char", "write-line", "write-string", "prin1", "princ", "print", "pprint",
                "format", "fresh-line", "terpri", "force-output", "finish-output", "clear-output",
                "open", "close", "with-open-file", "with-input-from-string", "with-output-to-string",
                // Type functions
                "type-of", "typep", "subtypep", "coerce",
                // Control functions
                "funcall", "apply", "eval", "values", "values-list", "multiple-value-list",
                "identity", "complement", "constantly", "not", "null", "eq", "eql", "equal", "equalp",
                // Other common builtins
                "error", "cerror", "warn", "signal", "make-condition",
                "make-hash-table", "gethash", "remhash", "maphash", "hash-table-count",
                "make-array", "aref", "array-dimensions", "array-dimension", "array-total-size",
                "vector", "make-sequence",
                // ASDF image hooks (no-ops in rlasp)
                "setup-stdin", "setup-stdout", "setup-stderr",
                "setup-command-line-arguments", "setup-temporary-directory",
                "register-image-restore-hook", "register-image-dump-hook",
                "call-image-restore-hook", "call-image-dump-hook",
            ];

            let name_lower = name.to_lowercase();

            // ASDF image hooks - return no-op lambdas so they can be funcalled
            let image_hooks = [
                "setup-stdin", "setup-stdout", "setup-stderr",
                "setup-command-line-arguments", "setup-temporary-directory",
                "register-image-restore-hook", "register-image-dump-hook",
                "call-image-restore-hook", "call-image-dump-hook",
            ];
            if image_hooks.iter().any(|&f| f == name_lower) {
                // Return a no-op lambda that accepts any arguments and returns NIL
                return Ok(EvalResult::Lambda {
                    params: vec!["&rest".to_string(), "args".to_string()],
                    defaults: std::collections::HashMap::new(),
                    supplied_p_vars: std::collections::HashMap::new(),
                    key_params: std::collections::HashMap::new(),
                    body: vec![crate::ir::ASTNode::nil()],
                    env: std::rc::Rc::new(std::cell::RefCell::new(std::collections::HashMap::new())),
                    dynamic_env: false,
                });
            }

            if builtin_fns.iter().any(|&f| f == name_lower) {
                // Return a symbol indicating this is a builtin function
                // This allows fdefinition to return something that can be funcalled
                return Ok(EvalResult::Symbol(format!("#<BUILTIN {}>", name)));
            }

            Err(format!("Undefined function: {}", name))
        }
        EvalResult::Cons(car, cdr) => {
            // Handle (setf name) function names
            let car_val = car.borrow();
            if let EvalResult::Symbol(s) = &*car_val {
                if s.eq_ignore_ascii_case("setf") {
                    // Extract the name from (setf name)
                    let cdr_val = cdr.borrow();
                    if let EvalResult::Cons(name_rc, _) = &*cdr_val {
                        let name_val = name_rc.borrow();
                        if let EvalResult::Symbol(setf_name) = &*name_val {
                            // Look up (setf name) as a function
                            let fn_key = format!("{}(setf {})", super::eval_core::FUNCTION_NS_PREFIX, setf_name.to_lowercase());
                            if let Some(func) = env.get(&fn_key).cloned() {
                                return Ok(func);
                            }
                            // Also try setf-name pattern
                            let setf_fn_key = format!("{}setf-{}", super::eval_core::FUNCTION_NS_PREFIX, setf_name.to_lowercase());
                            if let Some(func) = env.get(&setf_fn_key).cloned() {
                                return Ok(func);
                            }
                            // For defstruct setters, try the value namespace
                            let setter_key = format!("(setf {})", setf_name.to_lowercase());
                            if let Some(func) = env.get(&setter_key).cloned() {
                                return Ok(func);
                            }
                            // Clasp-compatible: return a generic setf function placeholder
                            return Ok(EvalResult::Symbol(format!("#<SETF {}>", setf_name)));
                        }
                    }
                }
            }
            Err("fdefinition requires a function name".to_string())
        }
        _ => Err("fdefinition requires a symbol or (setf name)".to_string()),
    }
}

pub(super) fn eval_class_of(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("class-of requires an argument".to_string());
    }
    let obj = eval_with_env(&args[0], env)?;
    // Use the proper class_of function from eval_types
    let class = super::eval_types::class_of(&obj);
    Ok(EvalResult::Symbol(class))
}

pub(super) fn eval_call_next_method(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // call-next-method calls the next method in the method combination chain
    // Since we don't have a proper method dispatch system yet, we signal an error
    let _ = env; // Suppress unused warning
    let _ = args; // Suppress unused warning
    Err("call-next-method can only be called from within a method, and method combination is not yet implemented".to_string())
}

pub(super) fn eval_find_class(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("find-class requires a symbol".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Symbol(name) => Ok(EvalResult::Symbol(format!("CLASS-{}", name))),
        _ => Err("find-class requires a symbol".to_string()),
    }
}

pub(super) fn eval_cerror(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("cerror requires at least 2 arguments".to_string());
    }
    let _continue_string = eval_with_env(&args[0], env)?;
    let error_string = eval_with_env(&args[1], env)?;
    match error_string {
        EvalResult::String(s) => Err(s),
        _ => Err("Error condition".to_string()),
    }
}

pub(super) fn eval_apropos(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("apropos requires a string".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::String(pattern) | EvalResult::Symbol(pattern) => {
            let pattern_lower = pattern.to_lowercase();
            let mut result = EvalResult::Nil;
            for key in env.keys() {
                if key.to_lowercase().contains(&pattern_lower) {
                    result = EvalResult::Cons(
                        std::rc::Rc::new(std::cell::RefCell::new(EvalResult::Symbol(key.clone()))),
                        std::rc::Rc::new(std::cell::RefCell::new(result))
                    );
                }
            }
            Ok(result)
        }
        _ => Err("apropos requires a string or symbol".to_string()),
    }
}

// Record field functions for documentation system
pub(super) fn eval_record_cons(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (record-cons record key sub-key)
    // Search for a cons cell (key . sub-key) in the record
    if args.len() != 3 {
        return Err("record-cons requires 3 arguments (record key sub-key)".to_string());
    }

    let record = eval_with_env(&args[0], env)?;
    let key = eval_with_env(&args[1], env)?;
    let sub_key = eval_with_env(&args[2], env)?;

    // Record is a list of (cons (cons key sub-key) value)
    let mut current = record;
    loop {
        match current {
            EvalResult::Nil => return Ok(EvalResult::Nil),
            EvalResult::Cons(car_rc, cdr_rc) => {
                let car = car_rc.borrow().clone();
                // car should be (cons (cons key sub-key) value)
                if let EvalResult::Cons(key_pair_rc, _value_rc) = car {
                    let key_pair = key_pair_rc.borrow().clone();
                    // key_pair should be (cons key sub-key)
                    if let EvalResult::Cons(k_rc, sk_rc) = key_pair {
                        let k = k_rc.borrow().clone();
                        let sk = sk_rc.borrow().clone();
                        // Check if key and sub-key match using equalp semantics
                        if eval_equalp_values(&k, &key) && eval_equalp_values(&sk, &sub_key) {
                            return Ok(EvalResult::Cons(car_rc.clone(), cdr_rc.clone()));
                        }
                    }
                }
                current = cdr_rc.borrow().clone();
            }
            _ => return Ok(EvalResult::Nil),
        }
    }
}

pub(super) fn eval_record_field(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (record-field record key sub-key)
    // Return the value associated with (key . sub-key) or nil
    if args.len() != 3 {
        return Err("record-field requires 3 arguments (record key sub-key)".to_string());
    }

    let record_cons_result = eval_record_cons(args, env)?;
    match record_cons_result {
        EvalResult::Nil => Ok(EvalResult::Nil),
        EvalResult::Cons(car_rc, _cdr_rc) => {
            let entry = car_rc.borrow().clone();
            // entry is ((key . sub-key) . value)
            match entry {
                EvalResult::Cons(_key_pair_rc, value_rc) => Ok(value_rc.borrow().clone()),
                _ => Ok(EvalResult::Nil),
            }
        }
        _ => Ok(EvalResult::Nil),
    }
}

pub(super) fn eval_rem_record_field(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (rem-record-field record key sub-key)
    // Remove the entry matching (key . sub-key) from the record
    if args.len() != 3 {
        return Err("rem-record-field requires 3 arguments (record key sub-key)".to_string());
    }

    let record = eval_with_env(&args[0], env)?;
    let key = eval_with_env(&args[1], env)?;
    let sub_key = eval_with_env(&args[2], env)?;

    // Find the matching cons
    let mut current = record.clone();
    let mut found_entry: Option<EvalResult> = None;
    loop {
        match current.clone() {
            EvalResult::Nil => break,
            EvalResult::Cons(car_rc, cdr_rc) => {
                let car = car_rc.borrow().clone();
                if let EvalResult::Cons(key_pair_rc, _value_rc) = &car {
                    let key_pair = key_pair_rc.borrow().clone();
                    if let EvalResult::Cons(k_rc, sk_rc) = key_pair {
                        let k = k_rc.borrow().clone();
                        let sk = sk_rc.borrow().clone();
                        if eval_equalp_values(&k, &key) && eval_equalp_values(&sk, &sub_key) {
                            found_entry = Some(car.clone());
                            break;
                        }
                    }
                }
                current = cdr_rc.borrow().clone();
            }
            _ => break,
        }
    }

    if found_entry.is_none() {
        return Ok(record);
    }

    // Build new list excluding the found entry
    let mut result = EvalResult::Nil;
    let mut current = record;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car_rc, cdr_rc) => {
                let car = car_rc.borrow().clone();
                // Check if this is the entry to skip
                let skip = if let Some(ref found) = found_entry {
                    match (found, &car) {
                        (EvalResult::Cons(f_kp, f_v), EvalResult::Cons(c_kp, c_v)) => {
                            std::ptr::eq(f_kp.as_ref() as *const _, c_kp.as_ref() as *const _) &&
                            std::ptr::eq(f_v.as_ref() as *const _, c_v.as_ref() as *const _)
                        }
                        _ => false,
                    }
                } else {
                    false
                };

                if !skip {
                    result = EvalResult::Cons(
                        Rc::new(RefCell::new(car)),
                        Rc::new(RefCell::new(result))
                    );
                }
                current = cdr_rc.borrow().clone();
            }
            _ => break,
        }
    }

    // Reverse the result since we built it backwards
    let mut reversed = EvalResult::Nil;
    current = result;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(car_rc, cdr_rc) => {
                reversed = EvalResult::Cons(car_rc.clone(), Rc::new(RefCell::new(reversed)));
                current = cdr_rc.borrow().clone();
            }
            _ => break,
        }
    }

    Ok(reversed)
}

// Helper function for equalp comparison
fn eval_equalp_values(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Boolean(a), EvalResult::Boolean(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Boolean(b)) | (EvalResult::Boolean(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a == b,
        (EvalResult::Float(a), EvalResult::Float(b)) => (a - b).abs() < f64::EPSILON,
        (EvalResult::String(a), EvalResult::String(b)) => a.eq_ignore_ascii_case(b),
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a.eq_ignore_ascii_case(b),
        (EvalResult::Character(a), EvalResult::Character(b)) => a == b,
        (EvalResult::Array(a_arr), EvalResult::Array(b_arr)) => {
            let a = a_arr.borrow();
            let b = b_arr.borrow();
            a.len() == b.len() && a.iter().zip(b.iter()).all(|(x, y)| eval_equalp_values(x, y))
        }
        (EvalResult::Cons(a_car, a_cdr), EvalResult::Cons(b_car, b_cdr)) => {
            eval_equalp_values(&a_car.borrow(), &b_car.borrow()) &&
            eval_equalp_values(&a_cdr.borrow(), &b_cdr.borrow())
        }
        _ => false,
    }
}

// Helper function to call built-in functions with pre-evaluated arguments
pub(super) fn eval_identity(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("identity requires 1 argument".to_string());
    }
    // Simply return the argument unchanged
    eval_with_env(&args[0], env)
}

pub(super) fn eval_equalp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("equalp requires 2 arguments".to_string());
    }
    let a = eval_with_env(&args[0], env)?;
    let b = eval_with_env(&args[1], env)?;
    Ok(EvalResult::Boolean(eval_equalp_values(&a, &b)))
}

pub(super) fn eval_fboundp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("fboundp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Symbol(name) => {
            // Check function namespace (Lisp-2 semantics) - macros and functions are stored with %FN% prefix
            let fn_name = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, name);
            // Also check uppercase version for case-insensitive lookup
            let fn_name_upper = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, name.to_uppercase());

            // Check function namespace first
            if let Some(val) = env.get(&fn_name).or_else(|| env.get(&fn_name_upper)) {
                match val {
                    EvalResult::Lambda { .. } | EvalResult::Macro { .. } |
                    EvalResult::ModifyMacro { .. } | EvalResult::GenericFunction(_) => {
                        return Ok(EvalResult::Boolean(true));
                    }
                    _ => {}
                }
            }

            // Also check without prefix for backwards compatibility
            if let Some(val) = env.get(&name) {
                match val {
                    EvalResult::Lambda { .. } | EvalResult::Macro { .. } |
                    EvalResult::ModifyMacro { .. } | EvalResult::GenericFunction(_) => {
                        return Ok(EvalResult::Boolean(true));
                    }
                    _ => {}
                }
            }

            // Check JIT function registry
            if rlasp_jit::intrinsics::is_jit_function(&name) {
                return Ok(EvalResult::Boolean(true));
            }

            // Check if it's a builtin by trying to look it up
            let is_builtin = matches!(name.to_lowercase().as_str(),
                "+" | "-" | "*" | "/" | "=" | "<" | ">" | "<=" | ">=" |
                "cons" | "car" | "cdr" | "list" | "append" | "mapcar" |
                "funcall" | "apply" | "identity" | "eq" | "eql" | "equal" |
                "defun" | "defmacro" | "lambda" | "let" | "let*" | "if" | "cond" |
                "progn" | "setq" | "quote" | "function" | "block" | "return-from" |
                "tagbody" | "go" | "catch" | "throw" | "unwind-protect" |
                "multiple-value-bind" | "values" | "nth-value" |
                "loop" | "dolist" | "dotimes" | "do" | "do*" |
                "format" | "print" | "princ" | "prin1" | "terpri" |
                "read" | "read-from-string" | "write" |
                "intern" | "string" | "symbol-name" | "gensym" |
                "type-of" | "typep" | "subtypep" | "coerce" |
                "error" | "warn" | "signal" | "handler-case" | "handler-bind" |
                "make-instance" | "slot-value" | "defclass" | "defgeneric" | "defmethod"
            );
            Ok(EvalResult::Boolean(is_builtin))
        }
        EvalResult::Cons(car, cdr) => {
            // Handle (setf name) function names
            let first = car.borrow().clone();
            if let EvalResult::Symbol(s) = &first {
                if s.eq_ignore_ascii_case("SETF") || s.eq_ignore_ascii_case(":SETF") {
                    let rest = cdr.borrow().clone();
                    if let EvalResult::Cons(name_rc, _) = rest {
                        let name = name_rc.borrow().clone();
                        if let EvalResult::Symbol(fname) = name {
                            let fn_key = format!("%FN%(SETF {})", fname.to_uppercase());
                            if env.contains_key(&fn_key) {
                                return Ok(EvalResult::Boolean(true));
                            }
                        }
                    }
                    return Ok(EvalResult::Nil);
                }
            }
            Ok(EvalResult::Nil)
        }
        _ => Ok(EvalResult::Nil), // CL spec: fboundp on non-valid-function-name returns NIL
    }
}

pub(super) fn eval_constantp(args: &[ASTNode], _env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() || args.len() > 2 {
        return Err("constantp requires 1 or 2 arguments".to_string());
    }
    // Simple check for constant expressions
    let is_const = match &args[0] {
        ASTNode::Constant(_) => true,
        ASTNode::Quote(_) => true,
        ASTNode::Variable(name) if name == "t" || name == "nil" || name.starts_with(':') => true,
        _ => false,
    };
    Ok(EvalResult::Boolean(is_const))
}

pub(super) fn eval_type_of(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("type-of requires 1 argument".to_string());
    }
    let val = eval_with_env(&args[0], env)?;
    let type_name = match val {
        EvalResult::Nil => "NULL",
        EvalResult::Bool(_) | EvalResult::Boolean(_) => "BOOLEAN",
        EvalResult::Fixnum(_) => "FIXNUM",
        EvalResult::Bignum(_) => "BIGNUM",
        EvalResult::Ratio(_) => "RATIO",
        EvalResult::Float(_) => "FLOAT",
        EvalResult::Complex(_, _) => "COMPLEX",
        EvalResult::Character(_) => "CHARACTER",
        EvalResult::String(_) => "STRING",
        EvalResult::Symbol(_) => "SYMBOL",
        EvalResult::Cons(_, _) => "CONS",
        EvalResult::Lambda { .. } => "FUNCTION",
        EvalResult::Macro { .. } => "MACRO",
        EvalResult::ModifyMacro { .. } => "MACRO",
        EvalResult::HashTable(_) => "HASH-TABLE",
        EvalResult::Array(_) => "SIMPLE-ARRAY",
        EvalResult::WasmBytes(_) => "WASM-BYTES",
        EvalResult::BuiltinFunction(_) => "FUNCTION",
        EvalResult::ForeignLibrary(_) => "FOREIGN-LIBRARY",
        EvalResult::ForeignFunction(_) => "FOREIGN-FUNCTION",
        EvalResult::MultipleValues(ref vals) => {
            // Return type of first value
            if vals.is_empty() {
                "NULL"
            } else {
                return eval_type_of(&[result_to_ast_quoted(&vals[0])?], env);
            }
        }
        EvalResult::Instance(ref inst) => {
            // Return the class name for instances
            return Ok(EvalResult::Symbol(inst.class_name.clone()));
        }
        EvalResult::GenericFunction(_) => "GENERIC-FUNCTION",
        EvalResult::Condition(ref cond) => {
            // Return the condition type name
            return Ok(EvalResult::Symbol(cond.borrow().type_name.clone()));
        }
        EvalResult::Package(_) => "PACKAGE",
    };
    Ok(EvalResult::Symbol(type_name.to_string()))
}

/// Check if an object is of a given type
/// (typep object type-specifier)
pub fn eval_typep(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("typep requires 2 arguments".to_string());
    }

    let object = eval_with_env(&args[0], env)?;
    let type_spec = eval_with_env(&args[1], env)?;

    let normalize_type_name = |name: &str| -> String {
        name.rsplit(':').next().unwrap_or(name).to_uppercase()
    };

    // Get the type specifier name
    let type_name = match &type_spec {
        EvalResult::Symbol(name) => normalize_type_name(name),
        EvalResult::Cons(car, _) => {
            // Compound type specifier like (and ...) or (or ...)
            match &*car.borrow() {
                EvalResult::Symbol(name) => normalize_type_name(name),
                _ => return Ok(EvalResult::Boolean(false)),
            }
        }
        _ => return Ok(EvalResult::Boolean(false)),
    };

    let result = match type_name.as_str() {
        // Standard Common Lisp types
        "T" => true, // Everything is of type T
        "NIL" => false, // Nothing is of type NIL (except for compound specifiers)
        "NULL" => matches!(object, EvalResult::Nil),
        "ATOM" => !matches!(object, EvalResult::Cons(_, _)),
        "LIST" => matches!(object, EvalResult::Nil | EvalResult::Cons(_, _)),
        "CONS" => matches!(object, EvalResult::Cons(_, _)),
        "SYMBOL" => matches!(object, EvalResult::Symbol(_) | EvalResult::Nil),  // NIL is a symbol in CL
        "KEYWORD" => matches!(&object, EvalResult::Symbol(s) if s.starts_with(':')),
        "BOOLEAN" => matches!(object, EvalResult::Nil | EvalResult::Boolean(true) | EvalResult::Bool(true)) || matches!(&object, EvalResult::Symbol(s) if s.eq_ignore_ascii_case("t")),  // boolean is (member t nil)
        "NUMBER" | "REAL" => matches!(object, EvalResult::Fixnum(_) | EvalResult::Float(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_)),
        "INTEGER" => matches!(object, EvalResult::Fixnum(_) | EvalResult::Bignum(_)),
        "FIXNUM" => matches!(object, EvalResult::Fixnum(_)),
        "BIGNUM" => matches!(object, EvalResult::Bignum(_)),
        "FLOAT" | "SINGLE-FLOAT" | "DOUBLE-FLOAT" | "SHORT-FLOAT" | "LONG-FLOAT" => matches!(object, EvalResult::Float(_)),
        "RATIO" | "RATIONAL" => matches!(object, EvalResult::Ratio(_) | EvalResult::Fixnum(_) | EvalResult::Bignum(_)),
        "COMPLEX" => matches!(object, EvalResult::Complex(_, _)),
        "CHARACTER" | "CHAR" | "BASE-CHAR" | "STANDARD-CHAR" => matches!(object, EvalResult::Character(_)),
        "STRING" | "SIMPLE-STRING" | "BASE-STRING" | "SIMPLE-BASE-STRING" => matches!(object, EvalResult::String(_)),
        "VECTOR" | "SIMPLE-VECTOR" | "ARRAY" | "SIMPLE-ARRAY" => matches!(object, EvalResult::Array(_) | EvalResult::String(_)),
        "SEQUENCE" => matches!(object, EvalResult::Nil | EvalResult::Cons(_, _) | EvalResult::Array(_) | EvalResult::String(_)),
        "HASH-TABLE" => matches!(object, EvalResult::HashTable(_)),
        "FUNCTION" | "COMPILED-FUNCTION" => matches!(object, EvalResult::Lambda { .. } | EvalResult::BuiltinFunction(_) | EvalResult::GenericFunction(_)),
        "STANDARD-OBJECT" | "STRUCTURE-OBJECT" => matches!(object, EvalResult::Instance(_)),
        "CONDITION" | "ERROR" | "SIMPLE-ERROR" | "SIMPLE-CONDITION" | "WARNING" | "SIMPLE-WARNING" |
        "SERIOUS-CONDITION" | "STYLE-WARNING" | "TYPE-ERROR" | "UNDEFINED-FUNCTION" => {
            if let EvalResult::Condition(cond) = &object {
                let cond_type = cond.borrow().type_name.to_uppercase();
                cond_type == type_name || is_condition_subtype(&cond_type, &type_name)
            } else {
                false
            }
        }
        "PACKAGE" => matches!(object, EvalResult::Package(_)),
        "PATHNAME" | "LOGICAL-PATHNAME" => {
            match &object {
                EvalResult::Cons(car, cdr) => {
                    if let EvalResult::Symbol(sym) = &*car.borrow() {
                        sym.eq_ignore_ascii_case("pathname") && matches!(&*cdr.borrow(), EvalResult::Cons(_, _))
                    } else {
                        false
                    }
                }
                EvalResult::Symbol(s) => s.starts_with("#P\"") && s.ends_with('"'),
                _ => false,
            }
        }
        "STREAM" | "FILE-STREAM" | "BROADCAST-STREAM" | "CONCATENATED-STREAM" |
        "STRING-STREAM" | "SYNONYM-STREAM" | "TWO-WAY-STREAM" | "ECHO-STREAM" => false, // Streams not implemented
        "READTABLE" => false, // Readtable not implemented
        "AND" | "OR" | "NOT" | "MEMBER" | "EQL" | "SATISFIES" => {
            // Compound type specifiers - handle specially
            return eval_compound_typep(&object, &type_spec, env);
        }
        other => {
            // Check if it's a user-defined class
            if let EvalResult::Instance(inst) = &object {
                let inst_class = normalize_type_name(&inst.class_name);
                inst_class == other || super::eval_types::is_subclass(&inst.class_name, other)
                    || is_instance_of_class(inst, other)
            } else {
                false
            }
        }
    };

    Ok(EvalResult::Boolean(result))
}

/// Check compound type specifiers
fn eval_compound_typep(object: &EvalResult, type_spec: &EvalResult, env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if let EvalResult::Cons(car, cdr) = type_spec {
        let car_val = car.borrow();
        if let EvalResult::Symbol(type_name) = &*car_val {
            match type_name.to_uppercase().as_str() {
                "AND" => {
                    // (and type1 type2 ...) - object must be of all types
                    let subtypes = cons_to_vec(&cdr.borrow())?;
                    for subtype in subtypes {
                        let obj_ast = result_to_ast_quoted(object)?;
                        let type_ast = result_to_ast_quoted(&subtype)?;
                        let result = eval_typep(&[obj_ast, type_ast], &mut env.clone())?;
                        if !matches!(result, EvalResult::Boolean(true) | EvalResult::Bool(true)) {
                            return Ok(EvalResult::Boolean(false));
                        }
                    }
                    return Ok(EvalResult::Boolean(true));
                }
                "OR" => {
                    // (or type1 type2 ...) - object must be of at least one type
                    let subtypes = cons_to_vec(&cdr.borrow())?;
                    for subtype in subtypes {
                        let obj_ast = result_to_ast_quoted(object)?;
                        let type_ast = result_to_ast_quoted(&subtype)?;
                        let result = eval_typep(&[obj_ast, type_ast], &mut env.clone())?;
                        if matches!(result, EvalResult::Boolean(true) | EvalResult::Bool(true)) {
                            return Ok(EvalResult::Boolean(true));
                        }
                    }
                    return Ok(EvalResult::Boolean(false));
                }
                "NOT" => {
                    // (not type) - object must NOT be of the type
                    let subtypes = cons_to_vec(&cdr.borrow())?;
                    if let Some(subtype) = subtypes.first() {
                        let obj_ast = result_to_ast_quoted(object)?;
                        let type_ast = result_to_ast_quoted(subtype)?;
                        let result = eval_typep(&[obj_ast, type_ast], &mut env.clone())?;
                        return Ok(EvalResult::Boolean(!matches!(result, EvalResult::Boolean(true) | EvalResult::Bool(true))));
                    }
                }
                "MEMBER" => {
                    // (member obj1 obj2 ...) - object must be EQL to one of the listed objects
                    let members = cons_to_vec(&cdr.borrow())?;
                    for member in members {
                        if super::eval_types::structural_equal(object, &member) {
                            return Ok(EvalResult::Boolean(true));
                        }
                    }
                    return Ok(EvalResult::Boolean(false));
                }
                "EQL" => {
                    // (eql obj) - object must be EQL to obj
                    let subtypes = cons_to_vec(&cdr.borrow())?;
                    if let Some(eql_obj) = subtypes.first() {
                        return Ok(EvalResult::Boolean(super::eval_types::structural_equal(object, eql_obj)));
                    }
                }
                "SATISFIES" => {
                    // (satisfies predicate) - call predicate with object
                    let subtypes = cons_to_vec(&cdr.borrow())?;
                    if let Some(EvalResult::Symbol(pred_name)) = subtypes.first() {
                        let obj_ast = result_to_ast_quoted(object)?;
                        let result = eval_with_env(&crate::ir::ASTNode::Call {
                            function: Box::new(crate::ir::ASTNode::Variable(pred_name.clone())),
                            args: vec![obj_ast],
                        }, env)?;
                        return Ok(EvalResult::Boolean(!matches!(result, EvalResult::Nil | EvalResult::Boolean(false) | EvalResult::Bool(false))));
                    }
                }
                _ => {}
            }
        }
    }
    Ok(EvalResult::Boolean(false))
}

/// Check if a condition type is a subtype of another
fn is_condition_subtype(cond_type: &str, parent_type: &str) -> bool {
    // Simplified condition hierarchy
    match parent_type {
        "CONDITION" => true, // All conditions are of type CONDITION
        "SERIOUS-CONDITION" => matches!(cond_type, "ERROR" | "SIMPLE-ERROR" | "TYPE-ERROR" | "UNDEFINED-FUNCTION"),
        "ERROR" => matches!(cond_type, "SIMPLE-ERROR" | "TYPE-ERROR" | "UNDEFINED-FUNCTION"),
        "WARNING" => matches!(cond_type, "SIMPLE-WARNING" | "STYLE-WARNING"),
        _ => false,
    }
}

/// Check if an instance is of a given class (including superclasses)
fn is_instance_of_class(inst: &super::eval_types::Instance, class_name: &str) -> bool {
    // Check direct class
    if inst.class_name.to_uppercase() == class_name {
        return true;
    }
    // Standard-object is a superclass of all CLOS instances
    if class_name == "STANDARD-OBJECT" || class_name == "T" {
        return true;
    }
    // TODO: Implement proper class hierarchy checking when we have class definitions stored
    false
}

/// Convert cons list to Vec<EvalResult>
fn cons_to_vec(result: &EvalResult) -> Result<Vec<EvalResult>, String> {
    let mut vec = Vec::new();
    let mut current = result.clone();
    while let EvalResult::Cons(car, cdr) = current {
        vec.push(car.borrow().clone());
        current = cdr.borrow().clone();
    }
    Ok(vec)
}

pub(super) fn eval_keywordp(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("keywordp requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Symbol(s) if s.starts_with(':') => Ok(EvalResult::Boolean(true)),
        _ => Ok(EvalResult::Boolean(false)),
    }
}

pub(super) fn eval_special_operator_p(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("special-operator-p requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Symbol(name) => {
            let is_special = matches!(name.as_str(),
                "quote" | "if" | "lambda" | "defun" | "defmacro" | "let" | "let*" |
                "setq" | "progn" | "prog1" | "prog2" | "block" | "return-from" |
                "tagbody" | "go" | "catch" | "throw" | "unwind-protect" |
                "do" | "do*" | "dolist" | "dotimes" | "flet" | "labels" | "macrolet" |
                "and" | "or" | "cond" | "case" | "when" | "unless" | "loop"
            );
            Ok(EvalResult::Boolean(is_special))
        }
        _ => Ok(EvalResult::Boolean(false)),
    }
}

// This is used by funcall when the function is a symbol referring to a built-in
fn call_built_in_with_values(name: &str, args: &[EvalResult], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // Convert pre-evaluated results back to AST nodes
    // We must quote lists to prevent them from being re-evaluated as function calls
    let ast_args: Result<Vec<ASTNode>, String> = args.iter()
        .map(|arg| result_to_ast_quoted(arg))
        .collect();
    let ast_args = ast_args?;

    // Call the built-in function through eval_call_with_env
    super::eval_core::eval_call_with_env(&ASTNode::Variable(name.to_string()), &ast_args, env)
}

/// Convert an EvalResult to an AST node, quoting lists to preserve them as data
pub(super) fn result_to_ast_quoted(result: &EvalResult) -> Result<ASTNode, String> {
    match result {
        EvalResult::Fixnum(n) => Ok(ASTNode::fixnum(*n)),
        EvalResult::Float(f) => Ok(ASTNode::float(*f)),
        EvalResult::Bool(true) => Ok(ASTNode::t()),
        EvalResult::Bool(false) | EvalResult::Nil => Ok(ASTNode::nil()),
        EvalResult::String(s) => Ok(ASTNode::Constant(crate::ir::ConstantValue::String(s.clone()))),
        EvalResult::MultipleValues(vals) => {
            if vals.is_empty() {
                Ok(ASTNode::nil())
            } else {
                result_to_ast_quoted(&vals[0])
            }
        }
        EvalResult::Symbol(name) => {
            // Quote symbols to prevent them from being evaluated as variables
            Ok(ASTNode::Quote(Box::new(ASTNode::variable(name.clone()))))
        }
        EvalResult::Character(c) => Ok(ASTNode::Constant(crate::ir::ConstantValue::Character(*c))),
        EvalResult::Cons(_, _) => {
            // Quote the list to prevent it from being evaluated as a function call
            let unquoted = result_to_ast(result)?;
            Ok(ASTNode::Quote(Box::new(unquoted)))
        }
        EvalResult::Array(arr) => {
            let elements: Result<Vec<ASTNode>, String> = arr.borrow().iter()
                .map(|e| result_to_ast_quoted(e))
                .collect();
            Ok(ASTNode::Call {
                function: Box::new(ASTNode::Variable("vector".to_string())),
                args: elements?,
            })
        }
        EvalResult::Lambda { params, defaults, supplied_p_vars, key_params, body, .. } => {
            if defaults.is_empty() && supplied_p_vars.is_empty() && key_params.is_empty() {
                Ok(ASTNode::lambda(params.clone(), body.clone()))
            } else {
                Ok(ASTNode::lambda_with_supplied_p(params.clone(), defaults.clone(), supplied_p_vars.clone(), key_params.clone(), body.clone()))
            }
        }
        EvalResult::Macro { params, body } => {
            Ok(ASTNode::Macro { params: params.clone(), body: body.clone() })
        }
        EvalResult::Package(name) => {
            // Convert package to (find-package "name") so it evaluates back to the package
            Ok(ASTNode::Call {
                function: Box::new(ASTNode::Variable("find-package".to_string())),
                args: vec![ASTNode::Constant(crate::ir::ConstantValue::String(name.clone()))],
            })
        }
        EvalResult::Boolean(true) => Ok(ASTNode::t()),
        EvalResult::Boolean(false) => Ok(ASTNode::nil()),
        EvalResult::Bignum(n) => {
            // Convert bignum to string and parse back
            Ok(ASTNode::Constant(crate::ir::ConstantValue::String(n.to_string())))
        }
        EvalResult::Ratio(r) => {
            Ok(ASTNode::Constant(crate::ir::ConstantValue::String(format!("{}/{}", r.numerator_ref(), r.denominator_ref()))))
        }
        EvalResult::Complex(re, im) => {
            Ok(ASTNode::Constant(crate::ir::ConstantValue::String(format!("#C({} {})", re, im))))
        }
        EvalResult::BuiltinFunction(name) => {
            // Quote as a symbol so it round-trips through function lookup
            Ok(ASTNode::Quote(Box::new(ASTNode::variable(name.clone()))))
        }
        EvalResult::GenericFunction(gf) => {
            Ok(ASTNode::Quote(Box::new(ASTNode::variable(gf.borrow().name.clone()))))
        }
        EvalResult::HashTable(_) => {
            // Can't meaningfully convert hash tables to AST; use a quoted symbol placeholder
            Ok(ASTNode::Quote(Box::new(ASTNode::variable("#<HASH-TABLE>".to_string()))))
        }
        EvalResult::Condition(_) => {
            // Conditions can appear in ignore-errors results; represent as NIL in AST
            Ok(ASTNode::nil())
        }
        EvalResult::Instance(inst) => {
            Ok(ASTNode::Quote(Box::new(ASTNode::variable(format!("#<{}>", inst.class_name)))))
        }
        EvalResult::ModifyMacro { name, .. } => {
            Ok(ASTNode::Quote(Box::new(ASTNode::variable(name.clone()))))
        }
        _ => Err(format!("Cannot convert {:?} to AST for funcall", result)),
    }
}

pub(super) fn eval_make_string(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (make-string size &key initial-element)
    if args.is_empty() {
        return Err("make-string requires at least 1 argument".to_string());
    }

    let size_val = eval_with_env(&args[0], env)?;
    let size = match size_val {
        EvalResult::Fixnum(n) if n >= 0 => n as usize,
        EvalResult::Float(f) if f >= 0.0 => f as usize,
        _ => return Err("make-string size must be a non-negative integer".to_string()),
    };

    // Get initial-element if provided (default is space character)
    let normalize_key = |raw: &str| -> String {
        raw.rsplit(':')
            .next()
            .unwrap_or(raw)
            .trim_start_matches(':')
            .to_ascii_lowercase()
    };
    let mut initial_char = ' ';
    if args.len() > 1 {
        let mut handled_keyword = false;
        let mut i = 1usize;
        while i + 1 < args.len() {
            let key = match &args[i] {
                ASTNode::Variable(s) => normalize_key(s),
                ASTNode::Constant(ConstantValue::Symbol(s)) => normalize_key(s),
                _ => {
                    i += 1;
                    continue;
                }
            };
            if key == "initial-element" {
                let init_val = eval_with_env(&args[i + 1], env)?;
                initial_char = match init_val {
                    EvalResult::Character(c) => c,
                    EvalResult::String(s) if s.chars().count() == 1 => s.chars().next().unwrap(),
                    _ => ' ',
                };
                handled_keyword = true;
            }
            i += 2;
        }

        // Backward-compatible non-keyword second argument
        if !handled_keyword && args.len() == 2 {
            let init_val = eval_with_env(&args[1], env)?;
            initial_char = match init_val {
                EvalResult::Character(c) => c,
                EvalResult::String(s) if s.chars().count() == 1 => s.chars().next().unwrap(),
                _ => ' ',
            };
        }
    }

    Ok(EvalResult::String(initial_char.to_string().repeat(size)))
}

pub(super) fn eval_make_array(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (make-array dimensions &key initial-element initial-contents displaced-to displaced-index-offset)
    if args.is_empty() {
        return Err("make-array requires at least 1 argument".to_string());
    }

    let size_val = eval_with_env(&args[0], env)?;
    let dims: Vec<usize> = match size_val {
        EvalResult::Fixnum(n) if n >= 0 => vec![n as usize],
        EvalResult::Nil => vec![1], // rank-0 arrays represented with one storage slot
        EvalResult::Cons(_, _) => {
            let mut dims = Vec::new();
            let mut current = size_val;
            loop {
                match current {
                    EvalResult::Cons(car, cdr) => {
                        match &*car.borrow() {
                            EvalResult::Fixnum(n) if *n >= 0 => dims.push(*n as usize),
                            _ => return Err("make-array dimensions must be non-negative integers".to_string()),
                        }
                        current = cdr.borrow().clone();
                    }
                    EvalResult::Nil => break,
                    _ => return Err("make-array dimensions must be a proper list".to_string()),
                }
            }
            if dims.is_empty() { vec![0] } else { dims }
        }
        _ => return Err("make-array size must be a non-negative integer or list of dimensions".to_string()),
    };
    let size = dims.iter().copied().product::<usize>();

    let mut initial_element: Option<EvalResult> = None;
    let mut initial_contents: Option<EvalResult> = None;
    let mut displaced_to: Option<EvalResult> = None;
    let mut displaced_offset: usize = 0;

    let mut i = 1usize;
    while i + 1 < args.len() {
        let key = match &args[i] {
            ASTNode::Variable(s) => s.rsplit(':').next().unwrap_or(s).trim_start_matches(':').to_ascii_lowercase(),
            ASTNode::Constant(ConstantValue::Symbol(s)) => s.rsplit(':').next().unwrap_or(s).trim_start_matches(':').to_ascii_lowercase(),
            _ => {
                i += 1;
                continue;
            }
        };
        match key.as_str() {
            "initial-element" => initial_element = Some(eval_with_env(&args[i + 1], env)?),
            "initial-contents" => initial_contents = Some(eval_with_env(&args[i + 1], env)?),
            "displaced-to" => displaced_to = Some(eval_with_env(&args[i + 1], env)?),
            "displaced-index-offset" => {
                displaced_offset = match eval_with_env(&args[i + 1], env)? {
                    EvalResult::Fixnum(n) if n >= 0 => n as usize,
                    _ => return Err("make-array :displaced-index-offset must be a non-negative integer".to_string()),
                };
            }
            _ => {}
        }
        i += 2;
    }

    fn flatten_contents(src: &EvalResult, out: &mut Vec<EvalResult>) {
        match src {
            EvalResult::Cons(car, cdr) => {
                flatten_contents(&car.borrow(), out);
                flatten_contents(&cdr.borrow(), out);
            }
            EvalResult::Array(arr) => {
                for elem in arr.borrow().iter() {
                    flatten_contents(elem, out);
                }
            }
            EvalResult::String(s) => {
                for ch in s.chars() {
                    out.push(EvalResult::Character(ch));
                }
            }
            EvalResult::Nil => {}
            other => out.push(other.clone()),
        }
    }

    let array = if let Some(displaced) = displaced_to {
        let source: Vec<EvalResult> = match displaced {
            EvalResult::Array(a) => a.borrow().clone(),
            EvalResult::String(s) => s.chars().map(EvalResult::Character).collect(),
            EvalResult::Cons(_, _) => {
                let mut flat = Vec::new();
                flatten_contents(&displaced, &mut flat);
                flat
            }
            _ => return Err("make-array :displaced-to requires an array, string, or list".to_string()),
        };

        let mut out = Vec::with_capacity(size);
        for j in 0..size {
            out.push(source.get(displaced_offset + j).cloned().unwrap_or(EvalResult::Nil));
        }
        out
    } else if let Some(contents) = initial_contents {
        let mut flat = Vec::new();
        flatten_contents(&contents, &mut flat);
        if flat.len() < size {
            flat.resize(size, EvalResult::Nil);
        } else if flat.len() > size {
            flat.truncate(size);
        }
        flat
    } else {
        vec![initial_element.unwrap_or(EvalResult::Nil); size]
    };

    let result = EvalResult::Array(Rc::new(RefCell::new(array)));
    if let EvalResult::Array(ref arr) = result {
        set_array_dims(arr, dims);
    }
    Ok(result)
}

pub(super) fn eval_aref(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (aref array &rest indices)
    if args.is_empty() {
        return Err("aref requires at least 1 argument".to_string());
    }

    let array = eval_with_env(&args[0], env)?;
    let mut indices = Vec::new();
    for arg in &args[1..] {
        let idx = match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) if n >= 0 => n as usize,
            _ => return Err("aref index must be a non-negative integer".to_string()),
        };
        indices.push(idx);
    }

    match array {
        EvalResult::Array(ref arr) => {
            let dims = get_array_dims(arr);
            let idx = if indices.is_empty() {
                if arr.borrow().len() == 1 {
                    0
                } else {
                    return Err("aref requires an index for non-rank-0 arrays".to_string());
                }
            } else if indices.len() == 1 {
                indices[0]
            } else {
                if dims.len() != indices.len() {
                    return Err("aref: wrong number of subscripts".to_string());
                }
                let mut linear = 0usize;
                for (i, sub) in indices.iter().copied().enumerate() {
                    let dim = dims[i];
                    if sub >= dim {
                        return Err(format!("aref: index {} out of bounds for axis {}", sub, i));
                    }
                    linear = linear * dim + sub;
                }
                linear
            };
            let array_ref = arr.borrow();
            array_ref.get(idx)
                .cloned()
                .ok_or_else(|| {
                    let len = array_ref.len();
                    let hi = len.saturating_sub(1);
                    format!(
                        "aref index {} out of bounds (expected 0-{}, type (INTEGER 0 ({})))",
                        idx, hi, len
                    )
                })
        }
        EvalResult::String(ref s) => {
            if indices.len() != 1 {
                return Err("aref on string requires exactly one index".to_string());
            }
            let idx = indices[0];
            // Support string as array of characters
            s.chars().nth(idx)
                .map(EvalResult::Character)
                .ok_or_else(|| {
                    let len = s.chars().count();
                    let hi = len.saturating_sub(1);
                    format!(
                        "aref index {} out of bounds (expected 0-{}, type (INTEGER 0 ({})))",
                        idx, hi, len
                    )
                })
        }
        _ => Err("aref: first argument must be an array or string".to_string()),
    }
}

pub(super) fn eval_array_dimension(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("array-dimension requires 2 arguments".to_string());
    }
    let arr = eval_with_env(&args[0], env)?;
    let axis = match eval_with_env(&args[1], env)? {
        EvalResult::Fixnum(n) if n >= 0 => n as usize,
        _ => return Err("array-dimension axis must be a non-negative integer".to_string()),
    };
    match arr {
        EvalResult::Array(a) => {
            let dims = get_array_dims(&a);
            dims.get(axis)
                .map(|d| EvalResult::Fixnum(*d as i64))
                .ok_or_else(|| "array-dimension axis out of bounds".to_string())
        }
        EvalResult::String(s) => {
            if axis == 0 {
                Ok(EvalResult::Fixnum(s.chars().count() as i64))
            } else {
                Err("array-dimension axis out of bounds".to_string())
            }
        }
        _ => Err("array-dimension requires an array".to_string()),
    }
}

pub(super) fn eval_array_dimensions(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("array-dimensions requires 1 argument".to_string());
    }
    let arr = eval_with_env(&args[0], env)?;
    let dims = match arr {
        EvalResult::Array(a) => get_array_dims(&a),
        EvalResult::String(s) => vec![s.chars().count()],
        _ => return Err("array-dimensions requires an array".to_string()),
    };
    let mut out = EvalResult::Nil;
    for d in dims.into_iter().rev() {
        out = EvalResult::Cons(
            Rc::new(RefCell::new(EvalResult::Fixnum(d as i64))),
            Rc::new(RefCell::new(out)),
        );
    }
    Ok(out)
}

pub(super) fn eval_array_total_size(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("array-total-size requires 1 argument".to_string());
    }
    let arr = eval_with_env(&args[0], env)?;
    match arr {
        EvalResult::Array(a) => Ok(EvalResult::Fixnum(a.borrow().len() as i64)),
        EvalResult::String(s) => Ok(EvalResult::Fixnum(s.chars().count() as i64)),
        _ => Err("array-total-size requires an array".to_string()),
    }
}

pub(super) fn eval_adjust_array(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("adjust-array requires at least 2 arguments".to_string());
    }
    let arr = eval_with_env(&args[0], env)?;
    let (old_vals, old_dims) = match arr {
        EvalResult::Array(a) => {
            let dims = get_array_dims(&a);
            (a.borrow().clone(), dims)
        }
        EvalResult::Cons(_, _) | EvalResult::Nil => {
            fn list_to_vec(mut cur: EvalResult) -> Result<Vec<EvalResult>, String> {
                let mut out = Vec::new();
                loop {
                    match cur {
                        EvalResult::Cons(car, cdr) => {
                            out.push(car.borrow().clone());
                            cur = cdr.borrow().clone();
                        }
                        EvalResult::Nil => break,
                        _ => return Err("adjust-array requires an array".to_string()),
                    }
                }
                Ok(out)
            }

            let top = list_to_vec(arr)?;
            if top.iter().all(|v| matches!(v, EvalResult::Cons(_, _) | EvalResult::Nil)) {
                let mut rows = Vec::new();
                let mut width: Option<usize> = None;
                for row in top {
                    let vals = list_to_vec(row)?;
                    if let Some(w) = width {
                        if vals.len() != w {
                            return Err("adjust-array requires rectangular nested list".to_string());
                        }
                    } else {
                        width = Some(vals.len());
                    }
                    rows.extend(vals);
                }
                let h = rows.len();
                let w = width.unwrap_or(0);
                let dims = if w == 0 { vec![0, 0] } else { vec![h / w, w] };
                (rows, dims)
            } else {
                let len = top.len();
                (top, vec![len])
            }
        }
        _ => return Err("adjust-array requires an array".to_string()),
    };

    let new_dims_val = eval_with_env(&args[1], env)?;
    let new_dims: Vec<usize> = match new_dims_val {
        EvalResult::Fixnum(n) if n >= 0 => vec![n as usize],
        EvalResult::Cons(_, _) => {
            let mut dims = Vec::new();
            let mut cur = new_dims_val;
            loop {
                match cur {
                    EvalResult::Cons(car, cdr) => {
                        match &*car.borrow() {
                            EvalResult::Fixnum(n) if *n >= 0 => dims.push(*n as usize),
                            _ => return Err("adjust-array dimensions must be non-negative integers".to_string()),
                        }
                        cur = cdr.borrow().clone();
                    }
                    EvalResult::Nil => break,
                    _ => return Err("adjust-array dimensions must be a proper list".to_string()),
                }
            }
            if dims.is_empty() { vec![0] } else { dims }
        }
        _ => return Err("adjust-array dimensions must be an integer or list".to_string()),
    };

    let mut initial_element = EvalResult::Nil;
    let mut i = 2usize;
    while i + 1 < args.len() {
        let is_initial_element = match &args[i] {
            ASTNode::Variable(k) => k.eq_ignore_ascii_case(":initial-element"),
            ASTNode::Constant(ConstantValue::Symbol(k)) => k.eq_ignore_ascii_case(":initial-element"),
            _ => false,
        };
        if is_initial_element {
            initial_element = eval_with_env(&args[i + 1], env)?;
        }
        i += 2;
    }

    let new_size = new_dims.iter().copied().product::<usize>();
    let mut out = vec![initial_element; new_size];

    fn row_major_index(coords: &[usize], dims: &[usize]) -> usize {
        let mut idx = 0usize;
        for (c, d) in coords.iter().zip(dims.iter()) {
            idx = idx * *d + *c;
        }
        idx
    }

    let rank = old_dims.len().min(new_dims.len());
    let overlap: Vec<usize> = (0..rank)
        .map(|ix| old_dims[ix].min(new_dims[ix]))
        .collect();
    if rank == 0 {
        if !old_vals.is_empty() && !out.is_empty() {
            out[0] = old_vals[0].clone();
        }
    } else if !overlap.contains(&0) {
        let mut coords = vec![0usize; rank];
        loop {
            let old_idx = row_major_index(&coords, &old_dims[..rank]);
            let new_idx = row_major_index(&coords, &new_dims[..rank]);
            if old_idx < old_vals.len() && new_idx < out.len() {
                out[new_idx] = old_vals[old_idx].clone();
            }

            let mut carry = true;
            for pos in (0..rank).rev() {
                coords[pos] += 1;
                if coords[pos] < overlap[pos] {
                    carry = false;
                    break;
                }
                coords[pos] = 0;
            }
            if carry {
                break;
            }
        }
    }

    let result = EvalResult::Array(Rc::new(RefCell::new(out)));
    if let EvalResult::Array(ref a) = result {
        set_array_dims(a, new_dims);
    }
    Ok(result)
}

pub(super) fn eval_truncate(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    use malachite::Integer;
    use malachite::num::conversion::traits::ExactFrom;

    // (truncate number &optional divisor)
    // Returns quotient and remainder as multiple values
    if args.is_empty() {
        return Err("truncate requires at least 1 argument".to_string());
    }

    let number = eval_with_env(&args[0], env)?;
    let divisor = if args.len() > 1 {
        eval_with_env(&args[1], env)?
    } else {
        EvalResult::Fixnum(1)
    };

    // Handle bignum division with malachite
    match (&number, &divisor) {
        // Bignum / Bignum
        (EvalResult::Bignum(n), EvalResult::Bignum(d)) => {
            if *d == Integer::from(0) {
                return Err("truncate: division by zero".to_string());
            }
            let quotient = n / d;
            let remainder = n - (&quotient * d);
            // Try to convert quotient to fixnum if it fits
            let q_result = if let Ok(q) = i64::try_from(&quotient) {
                EvalResult::Fixnum(q)
            } else {
                EvalResult::Bignum(quotient)
            };
            let r_result = if let Ok(r) = i64::try_from(&remainder) {
                EvalResult::Fixnum(r)
            } else {
                EvalResult::Bignum(remainder)
            };
            return Ok(EvalResult::MultipleValues(vec![q_result, r_result]));
        }
        // Bignum / Fixnum
        (EvalResult::Bignum(n), EvalResult::Fixnum(d)) if *d != 0 => {
            let d_big = Integer::from(*d);
            let quotient = n / &d_big;
            let remainder = n - (&quotient * &d_big);
            let q_result = if let Ok(q) = i64::try_from(&quotient) {
                EvalResult::Fixnum(q)
            } else {
                EvalResult::Bignum(quotient)
            };
            let r_result = if let Ok(r) = i64::try_from(&remainder) {
                EvalResult::Fixnum(r)
            } else {
                EvalResult::Bignum(remainder)
            };
            return Ok(EvalResult::MultipleValues(vec![q_result, r_result]));
        }
        // Fixnum / Bignum
        (EvalResult::Fixnum(n), EvalResult::Bignum(d)) => {
            if *d == Integer::from(0) {
                return Err("truncate: division by zero".to_string());
            }
            let n_big = Integer::from(*n);
            let quotient = &n_big / d;
            let remainder = &n_big - (&quotient * d);
            let q_result = if let Ok(q) = i64::try_from(&quotient) {
                EvalResult::Fixnum(q)
            } else {
                EvalResult::Bignum(quotient)
            };
            let r_result = if let Ok(r) = i64::try_from(&remainder) {
                EvalResult::Fixnum(r)
            } else {
                EvalResult::Bignum(remainder)
            };
            return Ok(EvalResult::MultipleValues(vec![q_result, r_result]));
        }
        // Ratio handling - convert to float for truncation
        (EvalResult::Ratio(r), EvalResult::Fixnum(d)) if *d != 0 => {
            let num_val = f64::exact_from(r);
            let div_val = *d as f64;
            let quotient = (num_val / div_val).trunc();
            let remainder = num_val - (quotient * div_val);
            return Ok(EvalResult::MultipleValues(vec![
                EvalResult::Fixnum(quotient as i64),
                if remainder.fract() == 0.0 {
                    EvalResult::Fixnum(remainder as i64)
                } else {
                    EvalResult::Float(remainder)
                }
            ]));
        }
        _ => {}
    }

    // Fallback to float-based truncation for other numeric types
    let (num_val, div_val) = match (&number, &divisor) {
        (EvalResult::Fixnum(n), EvalResult::Fixnum(d)) if *d != 0 => (*n as f64, *d as f64),
        (EvalResult::Float(n), EvalResult::Fixnum(d)) if *d != 0 => (*n, *d as f64),
        (EvalResult::Fixnum(n), EvalResult::Float(d)) if *d != 0.0 => (*n as f64, *d),
        (EvalResult::Float(n), EvalResult::Float(d)) if *d != 0.0 => (*n, *d),
        _ => return Err("truncate: invalid arguments (must be numbers, divisor non-zero)".to_string()),
    };

    // Calculate quotient (truncated towards zero) and remainder
    let quotient = (num_val / div_val).trunc();
    let remainder = num_val - (quotient * div_val);

    // Return as multiple values
    Ok(EvalResult::MultipleValues(vec![
        EvalResult::Fixnum(quotient as i64),
        if remainder.fract() == 0.0 {
            EvalResult::Fixnum(remainder as i64)
        } else {
            EvalResult::Float(remainder)
        }
    ]))
}

pub(super) fn eval_values(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    // (values &rest args)
    // Returns multiple values
    if args.is_empty() {
        return Ok(EvalResult::MultipleValues(vec![]));
    }

    let mut vals = Vec::new();
    for arg in args {
        vals.push(primary_value(eval_with_env(arg, env)?));
    }

    if vals.len() == 1 {
        Ok(vals.into_iter().next().unwrap())
    } else {
        Ok(EvalResult::MultipleValues(vals))
    }
}
