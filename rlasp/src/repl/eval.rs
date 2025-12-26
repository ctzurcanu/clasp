/// Simple direct evaluator for REPL (bypasses IR for now)
///
/// This provides immediate working evaluation while the IR pipeline is being completed.

use crate::ir::{ASTNode, ConstantValue, Module, LowerContext, InstructionKind, WasmCodegen};
use std::collections::HashMap;

#[derive(Debug, Clone)]
pub enum EvalResult {
    Fixnum(i64),
    Float(f64),
    Bool(bool),
    Nil,
    Symbol(String),
    Cons(Box<EvalResult>, Box<EvalResult>),
    Lambda {
        params: Vec<String>,
        body: Vec<ASTNode>,
        env: HashMap<String, EvalResult>,
    },
    WasmBytes(Vec<u8>),
}

impl std::fmt::Display for EvalResult {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            EvalResult::Fixnum(n) => write!(f, "{}", n),
            EvalResult::Float(fl) => write!(f, "{}", fl),
            EvalResult::Bool(true) => write!(f, "T"),
            EvalResult::Bool(false) => write!(f, "NIL"),
            EvalResult::Nil => write!(f, "NIL"),
            EvalResult::Symbol(s) => write!(f, "{}", s),
            EvalResult::Cons(car, cdr) => {
                write!(f, "(")?;
                self.fmt_list(f)?;
                write!(f, ")")
            }
            EvalResult::Lambda { .. } => write!(f, "#<LAMBDA>"),
            EvalResult::WasmBytes(bytes) => write!(f, "#<WASM {} bytes>", bytes.len()),
        }
    }
}

impl EvalResult {
    fn fmt_list(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            EvalResult::Cons(car, cdr) => {
                write!(f, "{}", car)?;
                match **cdr {
                    EvalResult::Nil => Ok(()),
                    EvalResult::Cons(_, _) => {
                        write!(f, " ")?;
                        cdr.fmt_list(f)
                    }
                    ref other => write!(f, " . {}", other),
                }
            }
            _ => write!(f, "{}", self),
        }
    }
}

pub fn eval(ast: &ASTNode) -> Result<EvalResult, String> {
    eval_with_env(ast, &mut HashMap::new())
}

/// Evaluate with a persistent environment (for REPL)
pub fn eval_with_persistent_env(ast: &ASTNode, env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    eval_with_env(ast, env)
}

fn eval_with_env(ast: &ASTNode, env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    match ast {
        ASTNode::Constant(c) => eval_constant(c),
        ASTNode::Variable(name) => {
            env.get(name).cloned().ok_or_else(|| format!("Unbound variable: {}", name))
        }
        ASTNode::Quote(form) => ast_to_result(form),
        ASTNode::Call { function, args } => eval_call_with_env(function, args, env),
        ASTNode::If { test, then_branch, else_branch } => {
            let test_result = eval_with_env(test, env)?;
            let is_nil = matches!(test_result, EvalResult::Nil | EvalResult::Bool(false));
            if is_nil {
                eval_with_env(else_branch, env)
            } else {
                eval_with_env(then_branch, env)
            }
        }
        ASTNode::Progn { exprs } => {
            let mut result = EvalResult::Nil;
            for expr in exprs {
                result = eval_with_env(expr, env)?;
            }
            Ok(result)
        }
        ASTNode::Lambda { params, body } => {
            Ok(EvalResult::Lambda {
                params: params.clone(),
                body: body.clone(),
                env: env.clone(),
            })
        }
        ASTNode::Let { bindings, body } => {
            eval_let_star(bindings, body, env)
        }
        ASTNode::Setq { var, value } => {
            // Evaluate the value expression
            let val = eval_with_env(value, env)?;
            // Set or update the variable in the environment
            env.insert(var.clone(), val.clone());
            Ok(val)
        }
        _ => Ok(EvalResult::Nil), // Other forms not yet implemented
    }
}

fn eval_let_star(
    bindings: &[(String, ASTNode)],
    body: &[ASTNode],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    // Save old environment
    let old_env = env.clone();

    // Bind variables sequentially (let* semantics)
    for (var, value_expr) in bindings {
        let value = eval_with_env(value_expr, env)?;
        env.insert(var.clone(), value);
    }

    // Evaluate body
    let mut result = EvalResult::Nil;
    for expr in body {
        result = eval_with_env(expr, env)?;
    }

    // Restore environment
    *env = old_env;

    Ok(result)
}

fn ast_to_result(ast: &ASTNode) -> Result<EvalResult, String> {
    match ast {
        ASTNode::Constant(c) => eval_constant(c),
        ASTNode::Variable(name) => {
            // Quoted symbols - store as a special marker
            // For now, we'll use a cons of the symbol name and nil
            // This is a hack until we have proper symbol support
            Ok(EvalResult::Symbol(name.clone()))
        }
        ASTNode::Call { function, args } => {
            // Convert (f a b c) to (f . (a . (b . (c . nil))))
            let car = ast_to_result(function)?;
            let cdr = list_to_result(args)?;
            Ok(EvalResult::Cons(Box::new(car), Box::new(cdr)))
        }
        _ => Ok(EvalResult::Nil),
    }
}

fn list_to_result(list: &[ASTNode]) -> Result<EvalResult, String> {
    if list.is_empty() {
        return Ok(EvalResult::Nil);
    }
    let car = ast_to_result(&list[0])?;
    let cdr = list_to_result(&list[1..])?;
    Ok(EvalResult::Cons(Box::new(car), Box::new(cdr)))
}

fn eval_constant(c: &ConstantValue) -> Result<EvalResult, String> {
    match c {
        ConstantValue::Fixnum(n) => Ok(EvalResult::Fixnum(*n)),
        ConstantValue::Float(f) => Ok(EvalResult::Float(*f)),
        ConstantValue::Nil => Ok(EvalResult::Nil),
        ConstantValue::T => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

fn eval_call_with_env(function: &ASTNode, args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if let ASTNode::Variable(name) = function {
        match name.as_str() {
            "+" => eval_add_with_env(args, env),
            "-" => eval_sub_with_env(args, env),
            "*" => eval_mul_with_env(args, env),
            "/" => eval_div_with_env(args, env),
            "=" => eval_eq_with_env(args, env),
            "eq?" => eval_eq_with_env(args, env),
            "<" => eval_lt_with_env(args, env),
            ">" => eval_gt_with_env(args, env),
            "cons" => eval_cons(args, env),
            "car" => eval_car(args, env),
            "cdr" => eval_cdr(args, env),
            "pair?" => eval_pair_p(args, env),
            "not" => eval_not(args, env),
            "and" => eval_and(args, env),
            "or" => eval_or(args, env),
            "int" => eval_int(args, env),
            "eval" => eval_eval(args, env),
            "compile" => eval_compile(args),
            _ => {
                // Try to call user-defined lambda
                let func_val = eval_with_env(function, env)?;
                match func_val {
                    EvalResult::Lambda { params, body, env: closure_env } => {
                        eval_lambda_call(params, body, closure_env, args, env)
                    }
                    _ => Err(format!("Unknown function: {}", name)),
                }
            }
        }
    } else {
        // Evaluate function expression
        let func_val = eval_with_env(function, env)?;
        match func_val {
            EvalResult::Lambda { params, body, env: closure_env } => {
                eval_lambda_call(params, body, closure_env, args, env)
            }
            _ => Err("Not a function".to_string()),
        }
    }
}

fn eval_lambda_call(
    params: Vec<String>,
    body: Vec<ASTNode>,
    mut closure_env: HashMap<String, EvalResult>,
    args: &[ASTNode],
    call_env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    if params.len() != args.len() {
        return Err(format!("Expected {} arguments, got {}", params.len(), args.len()));
    }

    // Merge call environment into closure environment for recursive function support
    // This allows functions defined in the calling environment to be visible
    for (key, value) in call_env.iter() {
        if !closure_env.contains_key(key) {
            closure_env.insert(key.clone(), value.clone());
        }
    }

    // Evaluate arguments in caller's environment
    for (param, arg) in params.iter().zip(args.iter()) {
        let arg_val = eval_with_env(arg, call_env)?;
        closure_env.insert(param.clone(), arg_val);
    }

    // Evaluate body in extended closure environment
    let mut result = EvalResult::Nil;
    for expr in &body {
        result = eval_with_env(expr, &mut closure_env)?;
    }
    Ok(result)
}

fn eval_cons(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 2 {
        return Err("cons requires 2 arguments".to_string());
    }
    let car = eval_with_env(&args[0], env)?;
    let cdr = eval_with_env(&args[1], env)?;
    Ok(EvalResult::Cons(Box::new(car), Box::new(cdr)))
}

fn eval_car(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("car requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(car, _) => Ok(*car),
        _ => Err("car requires a cons cell".to_string()),
    }
}

fn eval_cdr(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("cdr requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(_, cdr) => Ok(*cdr),
        _ => Err("cdr requires a cons cell".to_string()),
    }
}

fn eval_pair_p(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("pair? requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Cons(_, _) => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

fn eval_not(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("not requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Nil | EvalResult::Bool(false) => Ok(EvalResult::Bool(true)),
        _ => Ok(EvalResult::Nil),
    }
}

fn eval_and(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    let mut result = EvalResult::Bool(true);
    for arg in args {
        result = eval_with_env(arg, env)?;
        if matches!(result, EvalResult::Nil | EvalResult::Bool(false)) {
            return Ok(EvalResult::Nil);
        }
    }
    Ok(result)
}

fn eval_or(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    for arg in args {
        let result = eval_with_env(arg, env)?;
        if !matches!(result, EvalResult::Nil | EvalResult::Bool(false)) {
            return Ok(result);
        }
    }
    Ok(EvalResult::Nil)
}

fn eval_int(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("int requires 1 argument".to_string());
    }
    match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => Ok(EvalResult::Fixnum(n)),
        EvalResult::Float(f) => {
            if f.is_finite() && f >= i64::MIN as f64 && f <= i64::MAX as f64 {
                Ok(EvalResult::Fixnum(f as i64))
            } else {
                Err("int: value out of range".to_string())
            }
        }
        _ => Err("int: not a number".to_string()),
    }
}

fn eval_eval(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() != 1 {
        return Err("eval requires 1 argument".to_string());
    }

    // First evaluate the argument to get a quoted expression
    let quoted = eval_with_env(&args[0], env)?;

    // Convert the result back to AST and evaluate it
    let ast = result_to_ast(&quoted)?;
    eval_with_env(&ast, env)
}

fn result_to_ast(result: &EvalResult) -> Result<ASTNode, String> {
    match result {
        EvalResult::Fixnum(n) => Ok(ASTNode::fixnum(*n)),
        EvalResult::Float(f) => Ok(ASTNode::float(*f)),
        EvalResult::Bool(true) => Ok(ASTNode::t()),
        EvalResult::Bool(false) | EvalResult::Nil => Ok(ASTNode::nil()),
        EvalResult::Symbol(name) => Ok(ASTNode::variable(name.clone())),
        EvalResult::Cons(car, cdr) => {
            // Convert cons back to list/call syntax
            let car_ast = result_to_ast(car)?;
            let cdr_list = cons_to_list(cdr)?;

            // If car is a variable, treat as function call
            if matches!(car_ast, ASTNode::Variable(_)) {
                Ok(ASTNode::Call {
                    function: Box::new(car_ast),
                    args: cdr_list,
                })
            } else {
                // Otherwise create nested cons
                Ok(ASTNode::Call {
                    function: Box::new(car_ast),
                    args: cdr_list,
                })
            }
        }
        _ => Err("Cannot convert to AST".to_string()),
    }
}

fn cons_to_list(result: &EvalResult) -> Result<Vec<ASTNode>, String> {
    match result {
        EvalResult::Nil => Ok(vec![]),
        EvalResult::Cons(car, cdr) => {
            let mut list = vec![result_to_ast(car)?];
            list.extend(cons_to_list(cdr)?);
            Ok(list)
        }
        other => {
            // Improper list - add as final element
            Ok(vec![result_to_ast(other)?])
        }
    }
}

fn eval_add_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    let mut sum = 0i64;
    for arg in args {
        match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => sum += n,
            _ => return Err("Type error: + expects numbers".to_string()),
        }
    }
    Ok(EvalResult::Fixnum(sum))
}

fn eval_sub_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("- requires at least one argument".to_string());
    }

    let first = match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => n,
        _ => return Err("Type error: - expects numbers".to_string()),
    };

    if args.len() == 1 {
        return Ok(EvalResult::Fixnum(-first));
    }

    let mut result = first;
    for arg in &args[1..] {
        match eval(arg)? {
            EvalResult::Fixnum(n) => result -= n,
            _ => return Err("Type error: - expects numbers".to_string()),
        }
    }
    Ok(EvalResult::Fixnum(result))
}

fn eval_mul_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    let mut product = 1i64;
    for arg in args {
        match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => product *= n,
            _ => return Err("Type error: * expects numbers".to_string()),
        }
    }
    Ok(EvalResult::Fixnum(product))
}

fn eval_div_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.is_empty() {
        return Err("/ requires at least one argument".to_string());
    }

    let first = match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => n,
        _ => return Err("Type error: / expects numbers".to_string()),
    };

    if args.len() == 1 {
        if first == 0 {
            return Err("Division by zero".to_string());
        }
        return Ok(EvalResult::Fixnum(1 / first));
    }

    let mut result = first;
    for arg in &args[1..] {
        match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => {
                if n == 0 {
                    return Err("Division by zero".to_string());
                }
                result /= n;
            }
            _ => return Err("Type error: / expects numbers".to_string()),
        }
    }
    Ok(EvalResult::Fixnum(result))
}

fn eval_eq_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("= requires at least two arguments".to_string());
    }

    let first = eval_with_env(&args[0], env)?;
    for arg in &args[1..] {
        let val = eval_with_env(arg, env)?;
        if !values_equal(&first, &val) {
            return Ok(EvalResult::Nil);
        }
    }
    Ok(EvalResult::Bool(true))
}

fn eval_lt_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("< requires at least two arguments".to_string());
    }

    let mut prev = match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => n,
        _ => return Err("Type error: < expects numbers".to_string()),
    };

    for arg in &args[1..] {
        let current = match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => n,
            _ => return Err("Type error: < expects numbers".to_string()),
        };
        if prev >= current {
            return Ok(EvalResult::Nil);
        }
        prev = current;
    }
    Ok(EvalResult::Bool(true))
}

fn eval_gt_with_env(args: &[ASTNode], env: &mut HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    if args.len() < 2 {
        return Err("> requires at least two arguments".to_string());
    }

    let mut prev = match eval_with_env(&args[0], env)? {
        EvalResult::Fixnum(n) => n,
        _ => return Err("Type error: > expects numbers".to_string()),
    };

    for arg in &args[1..] {
        let current = match eval_with_env(arg, env)? {
            EvalResult::Fixnum(n) => n,
            _ => return Err("Type error: > expects numbers".to_string()),
        };
        if prev <= current {
            return Ok(EvalResult::Nil);
        }
        prev = current;
    }
    Ok(EvalResult::Bool(true))
}

fn values_equal(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Fixnum(x), EvalResult::Fixnum(y)) => x == y,
        (EvalResult::Float(x), EvalResult::Float(y)) => x == y,
        (EvalResult::Bool(x), EvalResult::Bool(y)) => x == y,
        (EvalResult::Nil, EvalResult::Nil) => true,
        _ => false,
    }
}

fn eval_compile(args: &[ASTNode]) -> Result<EvalResult, String> {
    if args.len() != 3 {
        return Err("compile requires 3 arguments: expression, target, output-path\n  Example: (compile '(+ 1 2) \"wasm\" \"out/test.wasm\")".to_string());
    }

    // First arg is the expression to compile (usually quoted)
    let expr = &args[0];

    // Second arg should be target (wasm, native, etc.)
    let target = match &args[1] {
        ASTNode::Variable(name) => name.as_str(),
        ASTNode::Constant(ConstantValue::String(s)) => s.as_str(),
        _ => return Err("compile target must be a string (\"wasm\", \"native\")".to_string()),
    };

    if target != "wasm" && target != "native" {
        return Err(format!("Unsupported compile target: {}. Supported: wasm, native", target));
    }

    // Third arg is the output path
    let output_path = match &args[2] {
        ASTNode::Variable(name) => name.clone(),
        ASTNode::Constant(ConstantValue::String(s)) => s.clone(),
        _ => return Err("compile output path must be a string".to_string()),
    };

    // Create IR module
    let module = Module::new();

    // Create environment with builtins
    let mut env = HashMap::new();
    // TODO: Add builtin operators to environment
    // For now, builtins are recognized by name in lower_ast

    let mut ctx = LowerContext {
        module,
        current_function: None,
        current_block: None,
        env,
    };

    // Create function
    let func_id = ctx.module.make_function(Some("compiled".to_string()));
    let func = ctx.module.get_function(func_id).unwrap();
    let entry = func.entry;
    ctx.current_function = Some(func_id);
    ctx.current_block = Some(entry);

    // Lower AST to IR
    let result_datum = ctx.lower_ast(expr)?;

    // Add return instruction
    let ret_inst = ctx.module.make_instruction(
        InstructionKind::Return,
        vec![result_datum],
        vec![],
    );

    // Link return instruction in block
    if let Some(current_block) = ctx.current_block {
        let block = ctx.module.get_block(current_block).unwrap();
        let old_end = block.end;
        let needs_start = block.start.is_none();
        drop(block); // Release borrow

        if needs_start {
            ctx.module.get_block_mut(current_block).unwrap().start = Some(ret_inst);
        }

        // Link previous instruction to return
        if let Some(end_inst) = old_end {
            ctx.module.get_instruction_mut(end_inst).unwrap().next = Some(ret_inst);
        }

        ctx.module.get_block_mut(current_block).unwrap().end = Some(ret_inst);
    }

    // Generate code and write to file
    use crate::ir::wasm_codegen::CompileTarget;
    let compile_target = match target {
        "wasm" => CompileTarget::Wasm,
        "native" => CompileTarget::Native,
        _ => unreachable!(),
    };

    let mut codegen = WasmCodegen::new_with_target(ctx.module, compile_target);
    let output_path_buf = std::path::PathBuf::from(&output_path);
    codegen.generate_to_file(&output_path_buf)?;

    Ok(EvalResult::Fixnum(0)) // Success
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_eval_number() {
        let ast = ASTNode::fixnum(42);
        let result = eval(&ast).unwrap();
        match result {
            EvalResult::Fixnum(n) => assert_eq!(n, 42),
            _ => panic!("Expected fixnum"),
        }
    }

    #[test]
    fn test_eval_add() {
        let ast = ASTNode::call(
            ASTNode::variable("+"),
            vec![ASTNode::fixnum(1), ASTNode::fixnum(2), ASTNode::fixnum(3)],
        );
        let result = eval(&ast).unwrap();
        match result {
            EvalResult::Fixnum(n) => assert_eq!(n, 6),
            _ => panic!("Expected 6"),
        }
    }

    #[test]
    fn test_eval_mul() {
        let ast = ASTNode::call(
            ASTNode::variable("*"),
            vec![ASTNode::fixnum(3), ASTNode::fixnum(4)],
        );
        let result = eval(&ast).unwrap();
        match result {
            EvalResult::Fixnum(n) => assert_eq!(n, 12),
            _ => panic!("Expected 12"),
        }
    }

    #[test]
    fn test_eval_nested() {
        // (+ (* 3 4) 2) = 14
        let ast = ASTNode::call(
            ASTNode::variable("+"),
            vec![
                ASTNode::call(
                    ASTNode::variable("*"),
                    vec![ASTNode::fixnum(3), ASTNode::fixnum(4)],
                ),
                ASTNode::fixnum(2),
            ],
        );
        let result = eval(&ast).unwrap();
        match result {
            EvalResult::Fixnum(n) => assert_eq!(n, 14),
            _ => panic!("Expected 14"),
        }
    }

    #[test]
    fn test_eval_if() {
        let ast = ASTNode::if_then_else(
            ASTNode::t(),
            ASTNode::fixnum(100),
            ASTNode::fixnum(200),
        );
        let result = eval(&ast).unwrap();
        match result {
            EvalResult::Fixnum(n) => assert_eq!(n, 100),
            _ => panic!("Expected 100"),
        }
    }
}
