/// irlasp - Interactive rlasp REPL and script runner
///
/// Usage:
///   irlasp              - Start REPL in interpreter mode
///   irlasp -m llvm      - Start REPL in LLVM ORC JIT mode
///   irlasp file.lisp    - Run file in interpreter mode
///   irlasp -m llvm file.lisp - Run file in LLVM ORC JIT mode

use clap::Parser;
use rustyline::error::ReadlineError;
use rustyline::{DefaultEditor, Result};
use std::ffi::CString;
use std::fs;
use std::os::raw::{c_char, c_int};
use inkwell::values::AnyValue;

extern crate rlasp_reader;

#[derive(Parser)]
#[command(name = "irlasp")]
#[command(about = "Interactive rlasp REPL and Lisp interpreter", long_about = None)]
struct Args {
    /// Execution mode: interpreter (default), llir (LLVM IR + ORC JIT), or mlir (MLIR + ORC JIT)
    #[arg(short, long, value_name = "MODE", default_value = "interpreter")]
    mode: String,

    /// Lisp file to execute
    file: Option<String>,

    /// Additional arguments passed to the Lisp program
    #[arg(trailing_var_arg = true, allow_hyphen_values = true)]
    script_args: Vec<String>,
}

#[derive(Debug, Clone, Copy, PartialEq)]
enum ExecutionMode {
    Interpreter,
    LlirJit,  // LLVM IR + ORC JIT
    MlirJit,  // MLIR + ORC JIT
}

// Declare external C functions from librlasp for interpreter mode
#[link(name = "rlasp")]
extern "C" {
    fn rlasp_init() -> *mut std::ffi::c_void;
    fn rlasp_eval(
        runtime: *mut std::ffi::c_void,
        expr: *const c_char,
        result_out: *mut *mut c_char,
    ) -> c_int;
    fn rlasp_eval_file(
        runtime: *mut std::ffi::c_void,
        source: *const c_char,
        result_out: *mut *mut c_char,
    ) -> c_int;
    fn rlasp_free_string(s: *mut c_char);
    fn rlasp_shutdown(runtime: *mut std::ffi::c_void);
}

fn main() -> Result<()> {
    // Use larger stack (64MB) for deep Lisp evaluation with trampoline
    let stack_size = 64 * 1024 * 1024;

    std::thread::Builder::new()
        .name("irlasp-main".to_string())
        .stack_size(stack_size)
        .spawn(|| {
            match run_main() {
                Ok(()) => {},
                Err(e) => {
                    eprintln!("Error: {}", e);
                    std::process::exit(1);
                }
            }
        })
        .expect("Failed to spawn main thread")
        .join()
        .expect("Main thread panicked");

    Ok(())
}

fn run_main() -> Result<()> {
    let args = Args::parse();

    let mode = match args.mode.as_str() {
        "interpreter" | "interp" | "i" => ExecutionMode::Interpreter,
        "llir" | "llvm" => ExecutionMode::LlirJit,
        "mlir" => ExecutionMode::MlirJit,
        _ => {
            eprintln!("Error: Unknown mode '{}'. Use 'interpreter', 'llir', or 'mlir'", args.mode);
            std::process::exit(1);
        }
    };

    if let Some(file_path) = args.file {
        // File execution mode
        run_file(&file_path, mode)
    } else {
        // REPL mode
        run_repl(mode)
    }
}

fn run_file(file_path: &str, mode: ExecutionMode) -> Result<()> {
    // Read file
    let source = match fs::read_to_string(file_path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading file {}: {}", file_path, e);
            std::process::exit(1);
        }
    };

    match mode {
        ExecutionMode::Interpreter => {
            unsafe {
                let runtime = rlasp_init();
                if runtime.is_null() {
                    eprintln!("Failed to initialize rlasp runtime");
                    std::process::exit(1);
                }

                eval_file_interp(runtime, &source);
                rlasp_shutdown(runtime);
            }
        }
        ExecutionMode::LlirJit => {
            if let Err(e) = eval_file_llvm(&source, file_path) {
                eprintln!("Error: {}", e);
                std::process::exit(1);
            }
        }
        ExecutionMode::MlirJit => {
            if let Err(e) = eval_file_mlir(&source, file_path, true) {
                eprintln!("Error: {}", e);
                std::process::exit(1);
            }
        }
    }

    Ok(())
}

fn run_repl(mode: ExecutionMode) -> Result<()> {
    println!("rlasp REPL v0.1.0 (mode: {})", match mode {
        ExecutionMode::Interpreter => "interpreter",
        ExecutionMode::LlirJit => "llir-jit",
        ExecutionMode::MlirJit => "mlir-jit",
    });
    println!("Type expressions to evaluate, or :quit to exit");
    println!();

    match mode {
        ExecutionMode::Interpreter => run_repl_interpreter(),
        ExecutionMode::LlirJit => run_repl_llvm(),
        ExecutionMode::MlirJit => run_repl_mlir(),
    }
}

fn run_repl_interpreter() -> Result<()> {
    let runtime = unsafe {
        let rt = rlasp_init();
        if rt.is_null() {
            eprintln!("Failed to initialize rlasp runtime");
            std::process::exit(1);
        }
        rt
    };

    let mut rl = DefaultEditor::new()?;

    // Load history from home directory
    if let Some(home) = std::env::var_os("HOME") {
        let mut history_path = std::path::PathBuf::from(home);
        history_path.push(".rlasp_history");
        let _ = rl.load_history(&history_path);
    }

    let mut accumulated_input = String::new();

    loop {
        let prompt = if accumulated_input.is_empty() {
            "rlasp> "
        } else {
            "    .. "
        };
        let readline = rl.readline(prompt);

        match readline {
            Ok(line) => {
                if line.trim().is_empty() {
                    continue;
                }

                if accumulated_input.is_empty() {
                    let trimmed = line.trim();
                    if trimmed == ":quit" || trimmed == ":q" {
                        println!("Goodbye!");
                        break;
                    }
                    if trimmed == ":help" || trimmed == ":h" {
                        print_help();
                        rl.add_history_entry(line.as_str())?;
                        continue;
                    }
                }

                accumulated_input.push_str(&line);
                accumulated_input.push('\n');

                if is_complete_expression(&accumulated_input) {
                    let input = accumulated_input.trim().to_string();
                    accumulated_input.clear();

                    if is_only_comments(&input) {
                        continue;
                    }

                    rl.add_history_entry(input.as_str())?;
                    unsafe { eval_expression_interp(runtime, &input) };
                }
            }
            Err(ReadlineError::Interrupted) => {
                println!("CTRL-C");
                break;
            }
            Err(ReadlineError::Eof) => {
                if !accumulated_input.trim().is_empty() {
                    unsafe { eval_expression_interp(runtime, accumulated_input.trim()) };
                }
                break;
            }
            Err(err) => {
                println!("Error: {:?}", err);
                break;
            }
        }
    }

    // Save history to home directory
    if let Some(home) = std::env::var_os("HOME") {
        let mut history_path = std::path::PathBuf::from(home);
        history_path.push(".rlasp_history");
        let _ = rl.save_history(&history_path);
    }

    unsafe {
        rlasp_shutdown(runtime);
    }
    Ok(())
}

fn run_repl_llvm() -> Result<()> {
    let mut rl = DefaultEditor::new()?;

    // Load history from home directory
    if let Some(home) = std::env::var_os("HOME") {
        let mut history_path = std::path::PathBuf::from(home);
        history_path.push(".rlasp_history_llvm");
        let _ = rl.load_history(&history_path);
    }

    let mut accumulated_input = String::new();

    loop {
        let prompt = if accumulated_input.is_empty() {
            "rlasp[llvm]> "
        } else {
            "         .. "
        };
        let readline = rl.readline(prompt);

        match readline {
            Ok(line) => {
                if line.trim().is_empty() {
                    continue;
                }

                if accumulated_input.is_empty() {
                    let trimmed = line.trim();
                    if trimmed == ":quit" || trimmed == ":q" {
                        println!("Goodbye!");
                        break;
                    }
                    if trimmed == ":help" || trimmed == ":h" {
                        print_help();
                        rl.add_history_entry(line.as_str())?;
                        continue;
                    }
                }

                accumulated_input.push_str(&line);
                accumulated_input.push('\n');

                if is_complete_expression(&accumulated_input) {
                    let input = accumulated_input.trim().to_string();
                    accumulated_input.clear();

                    if is_only_comments(&input) {
                        continue;
                    }

                    rl.add_history_entry(input.as_str())?;

                    if let Err(e) = eval_expression_llvm(&input) {
                        println!("Error: {}", e);
                    }
                }
            }
            Err(ReadlineError::Interrupted) => {
                println!("CTRL-C");
                break;
            }
            Err(ReadlineError::Eof) => {
                if !accumulated_input.trim().is_empty() {
                    if let Err(e) = eval_expression_llvm(accumulated_input.trim()) {
                        println!("Error: {}", e);
                    }
                }
                break;
            }
            Err(err) => {
                println!("Error: {:?}", err);
                break;
            }
        }
    }

    // Save history to home directory
    if let Some(home) = std::env::var_os("HOME") {
        let mut history_path = std::path::PathBuf::from(home);
        history_path.push(".rlasp_history_llvm");
        let _ = rl.save_history(&history_path);
    }
    Ok(())
}

unsafe fn eval_expression_interp(runtime: *mut std::ffi::c_void, expr: &str) {
    let c_expr = match CString::new(expr) {
        Ok(s) => s,
        Err(_) => {
            println!("Error: Invalid string");
            return;
        }
    };

    let mut result_ptr: *mut c_char = std::ptr::null_mut();
    let ret = rlasp_eval(runtime, c_expr.as_ptr(), &mut result_ptr);

    if ret == 0 {
        if !result_ptr.is_null() {
            let c_str = std::ffi::CStr::from_ptr(result_ptr);
            if let Ok(result) = c_str.to_str() {
                println!("=> {}", result);
            }
            rlasp_free_string(result_ptr);
        }
    } else {
        if !result_ptr.is_null() {
            let c_str = std::ffi::CStr::from_ptr(result_ptr);
            if let Ok(error_msg) = c_str.to_str() {
                println!("Error: {}", error_msg);
            }
            rlasp_free_string(result_ptr);
        } else {
            println!("Error evaluating expression (no details available)");
        }
    }
}

unsafe fn eval_file_interp(runtime: *mut std::ffi::c_void, source: &str) {
    let c_source = match CString::new(source) {
        Ok(s) => s,
        Err(_) => {
            eprintln!("Error: Invalid file contents");
            return;
        }
    };

    let mut result_ptr: *mut c_char = std::ptr::null_mut();
    let ret = rlasp_eval_file(runtime, c_source.as_ptr(), &mut result_ptr);

    if ret == 0 {
        if !result_ptr.is_null() {
            let c_str = std::ffi::CStr::from_ptr(result_ptr);
            if let Ok(result) = c_str.to_str() {
                println!("=> {}", result);
            }
            rlasp_free_string(result_ptr);
        }
    } else {
        if !result_ptr.is_null() {
            let c_str = std::ffi::CStr::from_ptr(result_ptr);
            if let Ok(error_msg) = c_str.to_str() {
                eprintln!("Error: {}", error_msg);
            }
            rlasp_free_string(result_ptr);
        } else {
            eprintln!("Error evaluating file (no details available)");
        }
    }
}

fn run_repl_mlir() -> Result<()> {
    // For now, MLIR mode uses the same implementation as LLIR
    // Future: Generate MLIR text, lower to LLVM IR, then execute
    run_repl_llvm()
}

fn macro_params_to_vec(params: &rlasp::ir::ASTNode) -> Vec<String> {
    use rlasp::ir::ASTNode;
    match params {
        ASTNode::Call { function, args } => {
            let mut result = Vec::with_capacity(args.len() + 1);
            if let ASTNode::Variable(name) = &**function {
                result.push(name.clone());
            }
            for arg in args {
                if let ASTNode::Variable(name) = arg {
                    result.push(name.clone());
                }
            }
            result
        }
        ASTNode::Variable(name) => vec![name.clone()],
        ASTNode::Constant(rlasp::ir::ConstantValue::Nil) => vec![],
        _ => vec![],
    }
}

/// Expand global macros in an AST node
fn expand_global_macros(
    ast: &rlasp::ir::ASTNode,
    macros: &std::collections::HashMap<String, (Vec<String>, rlasp::ir::ASTNode)>,
) -> rlasp::ir::ASTNode {
    use rlasp::ir::ASTNode;
    use std::collections::HashMap;

    match ast {
        ASTNode::Call { function, args } => {
            // Check if this is a macro call
            if let ASTNode::Variable(name) = &**function {
                if let Some((params, body)) = macros.get(name) {
                    // Expand this macro call
                    if args.len() == params.len() {
                        let mut substitutions = HashMap::new();
                        for (param, arg) in params.iter().zip(args.iter()) {
                            substitutions.insert(param.clone(), expand_global_macros(arg, macros));
                        }
                        let expanded = substitute_macro_body(body, &substitutions);
                        let expanded_backquote = expand_macro_backquote(&expanded);
                        let normalized = normalize_special_forms(&expanded_backquote);
                        return expand_global_macros(&normalized, macros);
                    }
                }
            }

            // Not a macro call, recursively expand in args and function
            let expanded_func = expand_global_macros(function, macros);
            let expanded_args: Vec<ASTNode> = args.iter()
                .map(|a| expand_global_macros(a, macros))
                .collect();
            ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args,
            }
        }
        ASTNode::If { test, then_branch, else_branch } => {
            ASTNode::If {
                test: Box::new(expand_global_macros(test, macros)),
                then_branch: Box::new(expand_global_macros(then_branch, macros)),
                else_branch: Box::new(expand_global_macros(else_branch, macros)),
            }
        }
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(|e| expand_global_macros(e, macros)).collect(),
            }
        }
        ASTNode::Let { bindings, body } => {
            let expanded_bindings: Vec<(String, ASTNode)> = bindings.iter()
                .map(|(name, val)| (name.clone(), expand_global_macros(val, macros)))
                .collect();
            let expanded_body: Vec<ASTNode> = body.iter()
                .map(|e| expand_global_macros(e, macros))
                .collect();
            ASTNode::Let {
                bindings: expanded_bindings,
                body: expanded_body,
            }
        }
        ASTNode::LetStar { bindings, body } => {
            let expanded_bindings: Vec<(String, ASTNode)> = bindings.iter()
                .map(|(name, val)| (name.clone(), expand_global_macros(val, macros)))
                .collect();
            let expanded_body: Vec<ASTNode> = body.iter()
                .map(|e| expand_global_macros(e, macros))
                .collect();
            ASTNode::LetStar {
                bindings: expanded_bindings,
                body: expanded_body,
            }
        }
        ASTNode::Lambda { params, defaults, supplied_p_vars, key_params, body } => {
            let expanded_defaults: HashMap<String, ASTNode> = defaults.iter()
                .map(|(name, val)| (name.clone(), expand_global_macros(val, macros)))
                .collect();
            let expanded_body: Vec<ASTNode> = body.iter()
                .map(|e| expand_global_macros(e, macros))
                .collect();
            ASTNode::Lambda {
                params: params.clone(),
                defaults: expanded_defaults,
                supplied_p_vars: supplied_p_vars.clone(),
                key_params: key_params.clone(),
                body: expanded_body,
            }
        }
        ASTNode::Setq { var, value } => {
            ASTNode::Setq {
                var: var.clone(),
                value: Box::new(expand_global_macros(value, macros)),
            }
        }
        ASTNode::Block { name, body } => {
            ASTNode::Block {
                name: name.clone(),
                body: body.iter().map(|e| expand_global_macros(e, macros)).collect(),
            }
        }
        ASTNode::Dotimes { var, count, result, body } => {
            ASTNode::Dotimes {
                var: var.clone(),
                count: Box::new(expand_global_macros(count, macros)),
                result: result.as_ref().map(|r| Box::new(expand_global_macros(r, macros))),
                body: body.iter().map(|e| expand_global_macros(e, macros)).collect(),
            }
        }
        ASTNode::Dolist { var, list, result, body } => {
            ASTNode::Dolist {
                var: var.clone(),
                list: Box::new(expand_global_macros(list, macros)),
                result: result.as_ref().map(|r| Box::new(expand_global_macros(r, macros))),
                body: body.iter().map(|e| expand_global_macros(e, macros)).collect(),
            }
        }
        ASTNode::Cond { clauses } => {
            ASTNode::Cond {
                clauses: clauses.iter()
                    .map(|(test, result)| {
                        (expand_global_macros(test, macros),
                         expand_global_macros(result, macros))
                    })
                    .collect(),
            }
        }
        _ => ast.clone(),
    }
}

fn substitute_macro_body(
    ast: &rlasp::ir::ASTNode,
    substitutions: &std::collections::HashMap<String, rlasp::ir::ASTNode>,
) -> rlasp::ir::ASTNode {
    use rlasp::ir::ASTNode;

    match ast {
        ASTNode::Variable(name) => {
            substitutions.get(name).cloned().unwrap_or_else(|| ast.clone())
        }
        ASTNode::Unquote(inner) => {
            ASTNode::Unquote(Box::new(substitute_macro_body(inner, substitutions)))
        }
        ASTNode::UnquoteSplicing(inner) => {
            ASTNode::UnquoteSplicing(Box::new(substitute_macro_body(inner, substitutions)))
        }
        ASTNode::Backquote(inner) => {
            ASTNode::Backquote(Box::new(substitute_macro_body(inner, substitutions)))
        }
        ASTNode::Call { function, args } => {
            ASTNode::Call {
                function: Box::new(substitute_macro_body(function, substitutions)),
                args: args.iter().map(|a| substitute_macro_body(a, substitutions)).collect(),
            }
        }
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(|e| substitute_macro_body(e, substitutions)).collect(),
            }
        }
        ASTNode::Quote(inner) => {
            ASTNode::Quote(Box::new(substitute_macro_body(inner, substitutions)))
        }
        ASTNode::Let { bindings, body } => {
            let sub_bindings: Vec<(String, rlasp::ir::ASTNode)> = bindings.iter()
                .map(|(name, val)| (name.clone(), substitute_macro_body(val, substitutions)))
                .collect();
            let sub_body: Vec<ASTNode> = body.iter()
                .map(|e| substitute_macro_body(e, substitutions))
                .collect();
            ASTNode::Let {
                bindings: sub_bindings,
                body: sub_body,
            }
        }
        ASTNode::LetStar { bindings, body } => {
            let sub_bindings: Vec<(String, rlasp::ir::ASTNode)> = bindings.iter()
                .map(|(name, val)| (name.clone(), substitute_macro_body(val, substitutions)))
                .collect();
            let sub_body: Vec<ASTNode> = body.iter()
                .map(|e| substitute_macro_body(e, substitutions))
                .collect();
            ASTNode::LetStar {
                bindings: sub_bindings,
                body: sub_body,
            }
        }
        ASTNode::If { test, then_branch, else_branch } => {
            ASTNode::If {
                test: Box::new(substitute_macro_body(test, substitutions)),
                then_branch: Box::new(substitute_macro_body(then_branch, substitutions)),
                else_branch: Box::new(substitute_macro_body(else_branch, substitutions)),
            }
        }
        _ => ast.clone(),
    }
}

fn expand_macro_backquote(ast: &rlasp::ir::ASTNode) -> rlasp::ir::ASTNode {
    use rlasp::ir::ASTNode;

    match ast {
        ASTNode::Backquote(inner) => expand_macro_backquote_inner(inner),
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(expand_macro_backquote).collect(),
            }
        }
        _ => ast.clone(),
    }
}

fn expand_macro_backquote_inner(ast: &rlasp::ir::ASTNode) -> rlasp::ir::ASTNode {
    use rlasp::ir::ASTNode;

    match ast {
        ASTNode::Unquote(inner) => (**inner).clone(),
        ASTNode::Quote(inner) => {
            // Handle ',expr pattern: Quote(Unquote(x)) becomes Quote(x)
            if let ASTNode::Unquote(unquoted) = &**inner {
                ASTNode::Quote(unquoted.clone())
            } else {
                // Recursively expand inside Quote
                ASTNode::Quote(Box::new(expand_macro_backquote_inner(inner)))
            }
        }
        ASTNode::Call { function, args } => {
            let expanded_args: Vec<ASTNode> = args.iter().map(|arg| {
                match arg {
                    ASTNode::Unquote(inner) => (**inner).clone(),
                    _ => expand_macro_backquote_inner(arg),
                }
            }).collect();

            let expanded_func = match &**function {
                ASTNode::Unquote(inner) => (**inner).clone(),
                _ => expand_macro_backquote_inner(function),
            };

            ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args,
            }
        }
        ASTNode::Progn { exprs } => {
            let expanded_exprs: Vec<ASTNode> = exprs.iter()
                .map(expand_macro_backquote_inner)
                .collect();
            ASTNode::Progn { exprs: expanded_exprs }
        }
        ASTNode::Let { bindings, body } => {
            let expanded_bindings: Vec<(String, ASTNode)> = bindings.iter()
                .map(|(name, val)| (name.clone(), expand_macro_backquote_inner(val)))
                .collect();
            let expanded_body: Vec<ASTNode> = body.iter()
                .map(expand_macro_backquote_inner)
                .collect();
            ASTNode::Let {
                bindings: expanded_bindings,
                body: expanded_body,
            }
        }
        ASTNode::LetStar { bindings, body } => {
            let expanded_bindings: Vec<(String, ASTNode)> = bindings.iter()
                .map(|(name, val)| (name.clone(), expand_macro_backquote_inner(val)))
                .collect();
            let expanded_body: Vec<ASTNode> = body.iter()
                .map(expand_macro_backquote_inner)
                .collect();
            ASTNode::LetStar {
                bindings: expanded_bindings,
                body: expanded_body,
            }
        }
        ASTNode::If { test, then_branch, else_branch } => {
            ASTNode::If {
                test: Box::new(expand_macro_backquote_inner(test)),
                then_branch: Box::new(expand_macro_backquote_inner(then_branch)),
                else_branch: Box::new(expand_macro_backquote_inner(else_branch)),
            }
        }
        _ => ast.clone(),
    }
}

/// Convert Call nodes representing special forms into proper ASTNode types
/// This is needed after backquote expansion, which creates Call nodes for everything
fn normalize_special_forms(ast: &rlasp::ir::ASTNode) -> rlasp::ir::ASTNode {
    use rlasp::ir::ASTNode;
    use std::collections::HashMap;

    match ast {
        ASTNode::Call { function, args } => {
            // First, recursively normalize all arguments and function
            let norm_args: Vec<ASTNode> = args.iter().map(normalize_special_forms).collect();
            let norm_func = normalize_special_forms(function);

            // Check if this is a call to a special form
            if let ASTNode::Variable(name) = &norm_func {
                match name.as_str() {
                    "let" | "let*" => {
                        // (let ((var val) ...) body...)
                        if norm_args.is_empty() {
                            return ASTNode::Let {
                                bindings: vec![],
                                body: vec![ASTNode::nil()],
                            };
                        }

                        // Extract bindings from first argument
                        // The binding list is represented as:
                        // Call { function: first_binding, args: [rest_bindings...] }
                        // Where each binding is Call { function: Variable(name), args: [value] }
                        fn extract_binding(node: &ASTNode) -> Option<(String, ASTNode)> {
                            if let ASTNode::Call { function, args } = node {
                                if let ASTNode::Variable(var_name) = &**function {
                                    if !args.is_empty() {
                                        return Some((var_name.clone(), args[0].clone()));
                                    }
                                }
                            }
                            None
                        }

                        fn extract_bindings(node: &ASTNode) -> Vec<(String, ASTNode)> {
                            let mut result = vec![];
                            match node {
                                ASTNode::Call { function, args } => {
                                    // First binding is in function
                                    if let Some(binding) = extract_binding(function) {
                                        result.push(binding);
                                    }
                                    // Remaining bindings are in args
                                    for arg in args {
                                        if let Some(binding) = extract_binding(arg) {
                                            result.push(binding);
                                        }
                                    }
                                }
                                _ => {}
                            }
                            result
                        }

                        let bindings = extract_bindings(&norm_args[0]);

                        let body = if norm_args.len() > 1 {
                            norm_args[1..].to_vec()
                        } else {
                            vec![ASTNode::nil()]
                        };

                        if name == "let*" {
                            return ASTNode::LetStar { bindings, body };
                        } else {
                            return ASTNode::Let { bindings, body };
                        }
                    }
                    "if" => {
                        // (if test then [else])
                        if norm_args.is_empty() {
                            return ASTNode::nil();
                        }
                        let test = norm_args.get(0).cloned().unwrap_or(ASTNode::nil());
                        let then_branch = norm_args.get(1).cloned().unwrap_or(ASTNode::nil());
                        let else_branch = norm_args.get(2).cloned().unwrap_or(ASTNode::nil());

                        return ASTNode::If {
                            test: Box::new(test),
                            then_branch: Box::new(then_branch),
                            else_branch: Box::new(else_branch),
                        };
                    }
                    "progn" => {
                        return ASTNode::Progn { exprs: norm_args };
                    }
                    _ => {}
                }
            }

            // Not a special form, keep as Call
            ASTNode::Call {
                function: Box::new(norm_func),
                args: norm_args,
            }
        }
        ASTNode::Let { bindings, body } => {
            let norm_bindings: Vec<(String, ASTNode)> = bindings.iter()
                .map(|(name, val)| (name.clone(), normalize_special_forms(val)))
                .collect();
            let norm_body: Vec<ASTNode> = body.iter().map(normalize_special_forms).collect();
            ASTNode::Let {
                bindings: norm_bindings,
                body: norm_body,
            }
        }
        ASTNode::If { test, then_branch, else_branch } => {
            ASTNode::If {
                test: Box::new(normalize_special_forms(test)),
                then_branch: Box::new(normalize_special_forms(then_branch)),
                else_branch: Box::new(normalize_special_forms(else_branch)),
            }
        }
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(normalize_special_forms).collect(),
            }
        }
        ASTNode::Quote(inner) => {
            ASTNode::Quote(Box::new(normalize_special_forms(inner)))
        }
        _ => ast.clone(),
    }
}

fn head_of_lisp_form(obj: rlasp_runtime::LispObject) -> String {
    fn format_atom(obj: rlasp_runtime::LispObject) -> String {
        if obj.is_nil() {
            return "NIL".to_string();
        }
        if let Some(n) = obj.as_fixnum() {
            return n.to_string();
        }
        if let Some(sym_ptr) = obj.as_general_ptr::<rlasp_runtime::Symbol>() {
            if !sym_ptr.is_null() {
                let sym = unsafe { &*sym_ptr };
                return sym.name().to_string();
            }
        }
        if let Some(str_ptr) = obj.as_general_ptr::<rlasp_runtime::RString>() {
            if !str_ptr.is_null() {
                let s = unsafe { &*str_ptr };
                return format!("\"{}\"", s.as_str());
            }
        }
        "#<OBJECT>".to_string()
    }

    if let Some(cons_ptr) = obj.as_cons_ptr() {
        if !cons_ptr.is_null() {
            let cons = unsafe { &*cons_ptr };
            return format_atom(cons.car());
        }
    }
    format_atom(obj)
}

fn eval_file_mlir(source: &str, file_path: &str, init_runtime: bool) -> std::result::Result<(), String> {
    use rlasp_mlir::lib_stack::StackMLIRCodegen;
    use rlasp::repl::{lisp_to_ast, eval_with_persistent_env, macroexpand_all_to_ast, EvalResult};
    use std::path::Path;
    use std::collections::HashMap;

    // Create MLIR codegen
    let module_name = Path::new(file_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("module");

    let mut codegen = StackMLIRCodegen::new(module_name);
    let mlir_verbose = std::env::var("RLASP_MLIR_VERBOSE").is_ok();
    let save_artifacts = std::env::var("RLASP_SAVE_ARTIFACTS").is_ok();

    // Read all forms from the file
    let lisp_objs = rlasp_reader::read_all_from_string(source)
        .map_err(|e| format!("Read error: {}", e))?;

    let mut form_count = 0;
    let mut compiled_any = false;
    let mut user_functions: HashMap<String, Vec<String>> = HashMap::new();
    let mut defuns: Vec<(
        String,
        Vec<String>,
        HashMap<String, rlasp::ir::ASTNode>,
        HashMap<String, String>,
        HashMap<String, String>,
        Vec<rlasp::ir::ASTNode>,
    )> = Vec::new();
    let mut toplevel_forms: Vec<rlasp::ir::ASTNode> = Vec::new();

    // Create an interpreter environment for macro expansion
    // This allows us to evaluate complex macros (like those using `loop`) at compile time
    let mut interp_env: HashMap<String, EvalResult> = HashMap::new();

    // ===== INCREMENTAL PROCESSING: Expand macros and evaluate each form before moving to next =====
    // This matches how the interpreter works - each form is fully processed (expanded + evaluated)
    // before the next, so definitions are available for subsequent macro expansions
    if mlir_verbose {
        println!("[MLIR] Incremental processing: expanding and evaluating forms...");
    }
    let trace_toplevel = std::env::var("RLASP_TRACE_TOPLEVEL").is_ok();

    // Helper function to check if an AST is a macro definition
    fn is_macro_definition(ast: &rlasp::ir::ASTNode) -> bool {
        match ast {
            rlasp::ir::ASTNode::Setq { value, .. } => {
                matches!(value.as_ref(), rlasp::ir::ASTNode::Macro { .. })
            }
            rlasp::ir::ASTNode::Call { function, args } => {
                if let rlasp::ir::ASTNode::Variable(name) = function.as_ref() {
                    if name == "defmacro" {
                        return true;
                    }
                    if name == "eval-when" || name == "progn" {
                        return args.iter().any(is_macro_definition);
                    }
                }
                false
            }
            rlasp::ir::ASTNode::Progn { exprs } => {
                exprs.iter().any(is_macro_definition)
            }
            _ => false,
        }
    }

    // Helper function to recursively extract defuns from expanded AST
    fn collect_definitions_expanded(
        ast: &rlasp::ir::ASTNode,
        defuns: &mut Vec<(
            String,
            Vec<String>,
            HashMap<String, rlasp::ir::ASTNode>,
            HashMap<String, String>,
            HashMap<String, String>,
            Vec<rlasp::ir::ASTNode>,
        )>,
        user_functions: &mut HashMap<String, Vec<String>>,
        toplevel_forms: &mut Vec<rlasp::ir::ASTNode>,
    ) {
        match ast {
            rlasp::ir::ASTNode::Setq { var, value } => {
                if let rlasp::ir::ASTNode::Lambda { params, defaults, supplied_p_vars, key_params, body } = value.as_ref() {
                    defuns.push((
                        var.clone(),
                        params.clone(),
                        defaults.clone(),
                        supplied_p_vars.clone(),
                        key_params.clone(),
                        body.clone(),
                    ));
                    user_functions.insert(var.clone(), params.clone());
                } else if matches!(value.as_ref(), rlasp::ir::ASTNode::Macro { .. }) {
                    // Skip macro definitions - they're handled by the interpreter
                } else {
                    toplevel_forms.push(ast.clone());
                }
            }
            rlasp::ir::ASTNode::Call { function, args } => {
                if let rlasp::ir::ASTNode::Variable(name) = function.as_ref() {
                    if name == "eval-when" {
                        // Recurse into eval-when body (skip first arg which is the situations)
                        for arg in args.iter().skip(1) {
                            collect_definitions_expanded(arg, defuns, user_functions, toplevel_forms);
                        }
                    } else if name == "with-upgradability" {
                        // ASDF macro: (with-upgradability (&optional) body...)
                        // Semantically equivalent to (eval-when (:compile-toplevel :load-toplevel :execute) body...)
                        // Skip first arg (options list), recurse into body forms
                        for arg in args.iter().skip(1) {
                            collect_definitions_expanded(arg, defuns, user_functions, toplevel_forms);
                        }
                    } else if name == "defpackage" || name == "in-package" {
                        // Skip package directives
                    } else if name == "progn" {
                        // Recurse into progn body
                        for arg in args {
                            collect_definitions_expanded(arg, defuns, user_functions, toplevel_forms);
                        }
                    } else if name == "defmacro" {
                        // Skip macro definitions - they're handled by the interpreter
                    } else if name == "defun" || name.ends_with(":defun") {
                        // Handle defun calls: (defun name (params...) body...)
                        // Extract function name, parameters, and body
                        if args.len() >= 2 {
                            let func_name = match &args[0] {
                                rlasp::ir::ASTNode::Variable(n) => n.clone(),
                                rlasp::ir::ASTNode::Call { function: setf_fn, args: setf_args } => {
                                    // Handle (setf name) form
                                    if let rlasp::ir::ASTNode::Variable(fn_name) = setf_fn.as_ref() {
                                        if fn_name.eq_ignore_ascii_case("setf") && !setf_args.is_empty() {
                                            if let rlasp::ir::ASTNode::Variable(setf_name) = &setf_args[0] {
                                                format!("(setf {})", setf_name)
                                            } else {
                                                toplevel_forms.push(ast.clone());
                                                return;
                                            }
                                        } else {
                                            toplevel_forms.push(ast.clone());
                                            return;
                                        }
                                    } else {
                                        toplevel_forms.push(ast.clone());
                                        return;
                                    }
                                }
                                _ => {
                                    toplevel_forms.push(ast.clone());
                                    return;
                                }
                            };

                            let (params, defaults, supplied_p_vars, key_params) =
                                rlasp::repl::extract_params_with_defaults(&args[1]);
                            let body: Vec<rlasp::ir::ASTNode> = args[2..].to_vec();

                            // Add %FN% prefix to function name
                            let fn_name = format!("%FN%{}", func_name);
                            defuns.push((fn_name.clone(), params.clone(), defaults, supplied_p_vars, key_params, body));
                            user_functions.insert(fn_name, params);
                        } else {
                            toplevel_forms.push(ast.clone());
                        }
                    } else {
                        toplevel_forms.push(ast.clone());
                    }
                } else {
                    toplevel_forms.push(ast.clone());
                }
            }
            rlasp::ir::ASTNode::Progn { exprs } => {
                for expr in exprs {
                    collect_definitions_expanded(expr, defuns, user_functions, toplevel_forms);
                }
            }
            _ => {
                toplevel_forms.push(ast.clone());
            }
        }
    }

    fn symbol_name_from_ast(ast: &rlasp::ir::ASTNode) -> Option<&str> {
        match ast {
            rlasp::ir::ASTNode::Variable(name) => Some(name.as_str()),
            rlasp::ir::ASTNode::Constant(rlasp::ir::ConstantValue::Symbol(name)) => Some(name.as_str()),
            _ => None,
        }
    }

    fn is_compile_situation_atom(name: &str) -> bool {
        let trimmed = name
            .trim_start_matches(':')
            .rsplit(':')
            .next()
            .unwrap_or(name)
            .to_ascii_lowercase();
        trimmed == "compile-toplevel" || trimmed == "compile"
    }

    fn eval_when_has_compile_situation(situations: &rlasp::ir::ASTNode) -> bool {
        match situations {
            rlasp::ir::ASTNode::Call { function, args } => {
                if symbol_name_from_ast(function)
                    .map(|n| is_compile_situation_atom(n))
                    .unwrap_or(false)
                {
                    return true;
                }
                args.iter().any(eval_when_has_compile_situation)
            }
            _ => symbol_name_from_ast(situations)
                .map(|n| is_compile_situation_atom(n))
                .unwrap_or(false),
        }
    }

    fn should_eval_for_compile_env(ast: &rlasp::ir::ASTNode) -> bool {
        match ast {
            rlasp::ir::ASTNode::Setq { .. } => true,
            rlasp::ir::ASTNode::Progn { exprs } => exprs.iter().any(should_eval_for_compile_env),
            rlasp::ir::ASTNode::Call { function, args } => {
                let head = symbol_name_from_ast(function).unwrap_or("");
                let head_lc = head.to_ascii_lowercase();
                match head_lc.as_str() {
                    "defmacro" | "defun" | "deftype" | "define-compiler-macro"
                    | "macrolet" | "symbol-macrolet"
                    | "defvar" | "defparameter" | "defconstant"
                    | "setq" | "setf"
                    | "in-package" | "defpackage" | "use-package" | "import" | "export"
                    | "shadow" | "shadowing-import" | "unintern" | "rename-package"
                    | "defclass" | "defgeneric" | "defmethod"
                    | "load" | "require" | "provide"
                    | "with-upgradability" => true,
                    "eval-when" => {
                        if let Some(situations) = args.first() {
                            eval_when_has_compile_situation(situations)
                        } else {
                            false
                        }
                    }
                    "progn" | "locally" | "when" | "unless" | "if" => {
                        args.iter().any(should_eval_for_compile_env)
                    }
                    _ => false,
                }
            }
            _ => false,
        }
    }

    // ===== INCREMENTAL: Expand forms with compile-time environment tracking =====
    for lisp_obj in &lisp_objs {
        form_count += 1;
        match lisp_to_ast::with_read_time_env(&mut interp_env, || {
            lisp_to_ast::lisp_to_ast(lisp_obj.clone())
        }) {
            Ok(ast) => {
                let head = if trace_toplevel {
                    Some(head_of_lisp_form(*lisp_obj))
                } else {
                    None
                };
                // Step 1: Evaluate forms in interpreter mode to preserve load-time behavior.
                // Selective mode is opt-in and intended for performance experiments.
                let selective_eval = std::env::var("RLASP_MLIR_SELECTIVE_EVAL")
                    .map(|v| {
                        let t = v.trim().to_ascii_lowercase();
                        !(t.is_empty() || t == "0" || t == "false" || t == "no" || t == "off")
                    })
                    .unwrap_or(false);
                if !selective_eval || should_eval_for_compile_env(&ast) {
                    let _ = eval_with_persistent_env(&ast, &mut interp_env);
                }

                // Step 2: Now try to expand macros for MLIR compilation
                // The environment should now have all definitions from this and previous forms
                let expanded = match macroexpand_all_to_ast(&ast, &mut interp_env) {
                    Ok(exp) => exp,
                    Err(e) => {
                        if std::env::var("RLASP_DEBUG_EXPAND").is_ok() {
                            eprintln!("[expand-fail] form {}: {}", form_count, e);
                        }
                        ast.clone()
                    }
                };

                // Debug: check if expanded form contains defgeneric
                if std::env::var("RLASP_DEBUG_DEFGENERIC").is_ok() {
                    fn contains_defgeneric(ast: &rlasp::ir::ASTNode) -> bool {
                        match ast {
                            rlasp::ir::ASTNode::Defgeneric { .. } => true,
                            rlasp::ir::ASTNode::Call { function, args } => {
                                if let rlasp::ir::ASTNode::Variable(n) = function.as_ref() {
                                    if n == "defgeneric" { return true; }
                                }
                                args.iter().any(contains_defgeneric)
                            }
                            rlasp::ir::ASTNode::Progn { exprs } => exprs.iter().any(contains_defgeneric),
                            _ => false,
                        }
                    }
                    if contains_defgeneric(&expanded) {
                        eprintln!("[defgeneric-trace] form {} expanded contains defgeneric: {:?}",
                            form_count, &expanded);
                    }
                    if contains_defgeneric(&ast) && !contains_defgeneric(&expanded) {
                        eprintln!("[defgeneric-LOST] form {} had defgeneric in AST but NOT in expanded!",
                            form_count);
                        eprintln!("  ast: {:?}", &ast);
                        eprintln!("  expanded: {:?}", &expanded);
                    }
                }

                // Step 3: Collect definitions for MLIR compilation
                let toplevel_before = toplevel_forms.len();
                collect_definitions_expanded(&expanded, &mut defuns, &mut user_functions, &mut toplevel_forms);
                if trace_toplevel {
                    let added = toplevel_forms.len().saturating_sub(toplevel_before);
                    if added > 0 {
                        let head_str = head.unwrap_or_else(|| "<unknown>".to_string());
                        for idx in 0..added {
                            let toplevel_idx = toplevel_before + idx + 1;
                            if mlir_verbose {
                                println!(
                                    "[MLIR] toplevel {} from form {} head={}",
                                    toplevel_idx, form_count, head_str
                                );
                            }
                        }
                    }
                }
            }
            Err(e) => {
                println!("[Warning: Could not parse form {}: {}]", form_count, e);
            }
        }
    }
    // Count defgeneric forms in toplevel
    let dg_count = toplevel_forms.iter().filter(|f| {
        matches!(f, rlasp::ir::ASTNode::Defgeneric { .. })
        || matches!(f, rlasp::ir::ASTNode::Call { function, .. }
            if matches!(function.as_ref(), rlasp::ir::ASTNode::Variable(n) if n == "defgeneric"))
    }).count();
    if mlir_verbose {
        println!("[MLIR] Processing complete: {} bindings, {} defuns, {} toplevel forms ({} defgeneric)",
                 interp_env.len(), defuns.len(), toplevel_forms.len(), dg_count);
    }

    // Macros have already been expanded by macroexpand_all_to_ast
    // Use defuns and toplevel_forms directly (with alias for compatibility)
    let expanded_defuns = &defuns;
    let expanded_toplevel = &toplevel_forms;

    // Pre-pass: register generic function names before compiling defuns
    // This ensures that when defuns call generic functions, they use runtime dispatch
    fn collect_generic_function_names(expr: &rlasp::ir::ASTNode, names: &mut Vec<String>) {
        match expr {
            rlasp::ir::ASTNode::Defgeneric { name, .. } => {
                names.push(name.clone());
            }
            rlasp::ir::ASTNode::Progn { exprs } => {
                for e in exprs {
                    collect_generic_function_names(e, names);
                }
            }
            _ => {}
        }
    }
    let mut generic_names = Vec::new();
    for form in expanded_toplevel {
        collect_generic_function_names(form, &mut generic_names);
    }
    for name in &generic_names {
        codegen.register_generic_function(name);
    }

    // Second pass: compile all expanded defuns to MLIR
    for (name, params, defaults, supplied_p_vars, key_params, body) in expanded_defuns {
        // Wrap multi-expression bodies in Progn
        let body_expr;
        let progn_node;
        if body.len() == 1 {
            body_expr = &body[0];
        } else {
            progn_node = rlasp::ir::ASTNode::Progn { exprs: body.clone() };
            body_expr = &progn_node;
        };

        // Save output state before compiling - restore on failure to avoid partial output
        let saved_output_len = codegen.output_len();
        match codegen.compile_function(name, params, defaults, supplied_p_vars, key_params, body_expr) {
            Ok(_) => {
                compiled_any = true;
            }
            Err(e) => {
                // Restore output to before this function's partial output
                codegen.truncate_output(saved_output_len);
                println!("[Warning: Could not compile defun {}: {}]", name, e);
            }
        }
    }

    // Compile expanded top-level forms as a special __main function
    // Split into batches to avoid stack overflow from huge functions
    if !expanded_toplevel.is_empty() {
        let batch_size = std::env::var("RLASP_BATCH_SIZE")
            .ok()
            .and_then(|s| s.parse::<usize>().ok())
            .filter(|&n| n > 0)
            .unwrap_or(200);
        let num_batches = (expanded_toplevel.len() + batch_size - 1) / batch_size;
        let mut batch_names = Vec::new();

        if num_batches <= 1 {
            // Small enough to compile as single function
            let main_body = if expanded_toplevel.len() == 1 {
                expanded_toplevel[0].clone()
            } else {
                rlasp::ir::ASTNode::Progn { exprs: expanded_toplevel.clone() }
            };

            let empty_defaults: HashMap<String, rlasp::ir::ASTNode> = HashMap::new();
            let empty_supplied: HashMap<String, String> = HashMap::new();
            let empty_key_params: HashMap<String, String> = HashMap::new();
            match codegen.compile_function("__main", &vec![], &empty_defaults, &empty_supplied, &empty_key_params, &main_body) {
                Ok(_) => {
                    if mlir_verbose {
                        println!("[MLIR] Compiled top-level forms as __main");
                    }
                    compiled_any = true;
                }
                Err(e) => {
                    println!("[Warning: Could not compile top-level forms: {}]", e);
                }
            }
        } else {
            // Split into multiple batch functions
            if mlir_verbose {
                println!("[MLIR] Splitting {} toplevel forms into {} batches", expanded_toplevel.len(), num_batches);
            }

            for (i, chunk) in expanded_toplevel.chunks(batch_size).enumerate() {
                let batch_name = format!("__main_batch_{}", i);
                let batch_body = rlasp::ir::ASTNode::Progn { exprs: chunk.to_vec() };

                let empty_defaults: HashMap<String, rlasp::ir::ASTNode> = HashMap::new();
                let empty_supplied: HashMap<String, String> = HashMap::new();
                let empty_key_params: HashMap<String, String> = HashMap::new();
                match codegen.compile_function(&batch_name, &vec![], &empty_defaults, &empty_supplied, &empty_key_params, &batch_body) {
                    Ok(_) => {
                        batch_names.push(batch_name.clone());
                        if mlir_verbose {
                            println!("[MLIR] Compiled batch {} ({} forms)", i, chunk.len());
                        }
                    }
                    Err(e) => {
                        println!("[Warning: Could not compile batch {}: {}]", i, e);
                    }
                }
            }

            // Create __main that calls all batches in sequence using direct func.call
            match codegen.compile_main_with_batches(&batch_names) {
                Ok(_) => {
                    if mlir_verbose {
                        println!("[MLIR] Compiled __main with {} batch calls", batch_names.len());
                    }
                    compiled_any = true;
                }
                Err(e) => {
                    println!("[Warning: Could not compile __main: {}]", e);
                }
            }
        }
    }

    // Finalize MLIR
    let mlir_text = codegen.finalize();

    // Save MLIR to file
    if save_artifacts {
        let mlir_path = format!("/tmp/{}.mlir", module_name);
        std::fs::write(&mlir_path, &mlir_text)
            .map_err(|e| format!("Failed to write MLIR file: {}", e))?;
        if mlir_verbose {
            println!("[Saved MLIR to: {}]", mlir_path);
        }

        // Save MLIR bytecode
        let mlirbc_path = format!("/tmp/{}.mlirbc", module_name);
        match rlasp_mlir::lowering::emit_mlir_bytecode(&mlir_text, &mlirbc_path) {
            Ok(()) => {
                if mlir_verbose {
                    println!("[Saved MLIR bytecode to: {}]", mlirbc_path);
                }
            }
            Err(e) => eprintln!("[Warning: Could not emit MLIR bytecode: {}]", e),
        }
    }

    // Lower MLIR to LLVM IR in memory
    let llvm_ir_text = rlasp_mlir::lowering::lower_mlir_to_llvm(&mlir_text)
        .map_err(|e| format!("Failed to lower MLIR: {}", e))?;

    // Save LLVM IR for debugging
    if save_artifacts {
        let ll_path = format!("/tmp/{}.ll", module_name);
        std::fs::write(&ll_path, &llvm_ir_text)
            .map_err(|e| format!("Failed to write LLVM IR: {}", e))?;
        if mlir_verbose {
            println!("[Saved LLVM IR to: {}]", ll_path);
        }
    }
    if mlir_verbose {
        println!("[Lowered MLIR → LLVM IR in memory]");
    }

    // Parse LLVM IR and execute with ORC JIT
    use inkwell::context::Context;
    use inkwell::memory_buffer::MemoryBuffer;

    let context = Context::create();
    let memory_buffer = MemoryBuffer::create_from_memory_range_copy(llvm_ir_text.as_bytes(), module_name);

    let module = context.create_module_from_ir(memory_buffer)
        .map_err(|e| format!("Failed to parse LLVM IR: {:?}", e))?;

    if mlir_verbose {
        println!("[Parsed LLVM IR into module]");
    }

    // Create ORC LLJIT execution engine using llvm-sys directly
    use llvm_sys::orc2::*;
    use llvm_sys::orc2::lljit::*;
    use llvm_sys::error::*;
    use std::ptr;

    // Initialize LLVM native target - required for LLJIT
    use inkwell::targets::{Target, InitializationConfig};
    Target::initialize_native(&InitializationConfig::default())
        .map_err(|e| format!("Failed to initialize native target: {}", e))?;
    if mlir_verbose {
        println!("[Initialized LLVM native target]");
    }

    // Force linker to keep critical runtime symbols by referencing them
    // This prevents the linker from stripping symbols needed at JIT runtime
    {
        use rlasp_jit::intrinsics::*;
        use rlasp_jit::intrinsics_clos::*;
        use rlasp_runtime::eval_stack::{
            stack_push_fixnum, stack_push_pointer, stack_push_nil,
            stack_pop_fixnum, stack_pop_pointer, stack_depth, stack_clear
        };
        let _keep_symbols = [
            // Stack operations - critical for JIT
            stack_push_fixnum as *const (),
            stack_push_pointer as *const (),
            stack_push_nil as *const (),
            stack_pop_fixnum as *const (),
            stack_pop_pointer as *const (),
            stack_depth as *const (),
            stack_clear as *const (),
            // Core intrinsics
            cc_funcall_stack as *const (),
            cc_tailcall_stack as *const (),
            cc_funcall as *const (),
            cc_nil as *const (),
            cc_t as *const (),
            cc_print as *const (),
            cc_format as *const (),
            cc_load as *const (),
            cc_cons as *const (),
            cc_car as *const (),
            cc_cdr as *const (),
            cc_nconc as *const (),
            cc_make_string as *const (),
            cc_make_symbol as *const (),
            cc_symbol_value as *const (),
            cc_set_symbol_value as *const (),
            cc_get_symbol_property as *const (),
            cc_set_symbol_property as *const (),
            cc_gensym as *const (),
            cc_symbol_name as *const (),
            cc_intern as *const (),
            cc_find_symbol as *const (),
            cc_find_package as *const (),
            cc_in_package as *const (),
            cc_package_name as *const (),
            cc_package_nicknames as *const (),
            cc_package_use_list as *const (),
            cc_package_used_by_list as *const (),
            cc_package_shadowing_symbols as *const (),
            cc_use_package as *const (),
            cc_unuse_package as *const (),
            cc_export as *const (),
            cc_unexport as *const (),
            cc_import as *const (),
            cc_shadow as *const (),
            cc_shadowing_import as *const (),
            cc_unintern as *const (),
            cc_delete_package as *const (),
            cc_rename_package as *const (),
            cc_list_all_packages as *const (),
            cc_symbol_function as *const (),
            cc_symbol_package as *const (),
            cc_symbol_plist as *const (),
            cc_get_property as *const (),
            cc_remprop as *const (),
            cc_make_symbol_from_name as *const (),
            cc_copy_symbol as *const (),
            cc_gentemp as *const (),
            cc_add as *const (),
            cc_sub as *const (),
            cc_mul as *const (),
            cc_div as *const (),
            cc_abs as *const (),
            cc_equal as *const (),
            cc_null as *const (),
            cc_apply as *const (),
            cc_eval as *const (),
            cc_pushnew as *const (),
            cc_box_fixnum as *const (),
            cc_unbox_fixnum as *const (),
            cc_box_character as *const (),
            // Additional intrinsics for ASDF
            cc_and as *const (),
            cc_or as *const (),
            cc_boundp as *const (),
            cc_functionp as *const (),
            cc_arg as *const (),
            cc_collect_args as *const (),
            cc_collect_rest_args as *const (),
            cc_make_closure as *const (),
            cc_make_lambda_ref_str as *const (),
            cc_make_string_repeat as *const (),
            cc_string_upcase as *const (),
            cc_string_downcase as *const (),
            cc_string_equal_full as *const (),
            cc_last as *const (),
            cc_acons as *const (),
            cc_getf as *const (),
            cc_read_from_string as *const (),
            cc_substitute as *const (),
            cc_substitute_if as *const (),
            cc_set_difference as *const (),
            cc_remove_duplicates as *const (),
            cc_remove_if as *const (),
            cc_remove_if_not as *const (),
            cc_find_if as *const (),
            cc_some as *const (),
            cc_every as *const (),
            cc_sort as *const (),
            cc_map_nil as *const (),
            cc_mapcar_stack as *const (),
            cc_maphash_stack as *const (),
            cc_reduce_stack as *const (),
            cc_make_array as *const (),
            cc_make_array_with_contents as *const (),
            cc_make_array_with_initial_element as *const (),
            cc_aref as *const (),
            cc_set_aref as *const (),
            cc_hash_table_keys as *const (),
            cc_hash_table_values as *const (),
            cc_remhash as *const (),
            cc_clrhash as *const (),
            cc_typep as *const (),
            cc_subtypep as *const (),
            cc_keywordp as *const (),
            cc_mapc_stack as *const (),
            cc_find_full as *const (),
            cc_load_mlir as *const (),
            cc_register_package as *const (),
            cc_string as *const (),
            cc_position_full as *const (),
            cc_position_if_full as *const (),
            cc_position_if_not as *const (),
            cc_position_if_not_full as *const (),
            cc_ceiling_2 as *const (),
            cc_floor_2 as *const (),
            cc_truncate_2 as *const (),
            cc_arg_present as *const (),
            // CLOS intrinsics
            cc_defclass as *const (),
            cc_defgeneric as *const (),
            cc_defmethod_qualified as *const (),
            cc_call_next_method as *const (),
            cc_call_next_method_with_args as *const (),
            cc_class_name as *const (),
        ];
        // Use volatile read to prevent optimizer from removing the references
        std::hint::black_box(_keep_symbols);
        if mlir_verbose {
            println!("[Forced linker to keep {} runtime symbols]", _keep_symbols.len());
        }
    }

    // Make the process's symbols available to LLVM for dynamic lookup
    inkwell::support::load_visible_symbols();
    if mlir_verbose {
        println!("[Loaded process symbols for ORC JIT]");
    }

    // Create LLJIT instance
    let lljit: LLVMOrcLLJITRef = unsafe {
        let builder = LLVMOrcCreateLLJITBuilder();
        let mut lljit: LLVMOrcLLJITRef = ptr::null_mut();
        let err = LLVMOrcCreateLLJIT(&mut lljit, builder);
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
            LLVMDisposeErrorMessage(err_msg);
            return Err(format!("Failed to create LLJIT: {}", msg));
        }
        lljit
    };
    if mlir_verbose {
        println!("[Created ORC LLJIT]");
    }

    // Get the main JITDylib
    let main_jd = unsafe { LLVMOrcLLJITGetMainJITDylib(lljit) };

    // Add a DynamicLibrarySearchGenerator to resolve process symbols
    unsafe {
        let mut gen: LLVMOrcDefinitionGeneratorRef = ptr::null_mut();
        let global_prefix = LLVMOrcLLJITGetGlobalPrefix(lljit);
        let err = LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(
            &mut gen,
            global_prefix,
            None, // No filter
            ptr::null_mut(),
        );
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
            LLVMDisposeErrorMessage(err_msg);
            return Err(format!("Failed to create DynamicLibrarySearchGenerator: {}", msg));
        }
        LLVMOrcJITDylibAddGenerator(main_jd, gen);
    }
    if mlir_verbose {
        println!("[Added DynamicLibrarySearchGenerator for process symbols]");
    }

    // Collect function names BEFORE transferring module to LLJIT
    // (After transfer, we can't iterate module.get_functions() anymore)
    let mut lambda_names: Vec<String> = Vec::new();
    let mut method_names: Vec<String> = Vec::new();
    let mut local_function_names: Vec<String> = Vec::new();
    for func_val in module.get_functions() {
        let func_name = func_val.get_name().to_str().unwrap_or("");
        if func_name.starts_with("__lambda_") {
            lambda_names.push(func_name.to_string());
        }
        if func_name.starts_with("local_") {
            local_function_names.push(func_name.to_string());
        }
        let is_method = func_name.ends_with("_primary")
            || func_name.ends_with("_before")
            || func_name.ends_with("_after")
            || func_name.ends_with("_around");
        if is_method {
            method_names.push(func_name.to_string());
        }
    }
    if mlir_verbose {
        println!(
            "[Collected {} lambdas, {} methods, {} local functions from module]",
            lambda_names.len(),
            method_names.len(),
            local_function_names.len()
        );
    }

    // Create a ThreadSafeContext and ThreadSafeModule
    let ts_ctx = unsafe { LLVMOrcCreateNewThreadSafeContext() };

    // We need to get the raw LLVMModuleRef from our inkwell module
    // and transfer ownership to the ThreadSafeModule
    let llvm_module_ref = module.as_mut_ptr();
    let ts_module = unsafe { LLVMOrcCreateNewThreadSafeModule(llvm_module_ref, ts_ctx) };

    // IMPORTANT: Prevent inkwell from freeing the module - ownership transferred to ORC JIT
    std::mem::forget(module);

    // Add the module to LLJIT
    unsafe {
        let err = LLVMOrcLLJITAddLLVMIRModule(lljit, main_jd, ts_module);
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
            LLVMDisposeErrorMessage(err_msg);
            return Err(format!("Failed to add module to LLJIT: {}", msg));
        }
    }
    if mlir_verbose {
        println!("[Added LLVM IR module to ORC LLJIT]");
    }

    // Helper function to look up symbols
    let lookup_symbol = |name: &str| -> std::result::Result<u64, String> {
        let c_name = std::ffi::CString::new(name).unwrap();
        let mut addr: LLVMOrcExecutorAddress = 0;
        unsafe {
            let err = LLVMOrcLLJITLookup(lljit, &mut addr, c_name.as_ptr());
            if !err.is_null() {
                let err_msg = LLVMGetErrorMessage(err);
                let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
                LLVMDisposeErrorMessage(err_msg);
                return Err(format!("Failed to lookup '{}': {}", name, msg));
            }
        }
        Ok(addr)
    };

    if mlir_verbose {
        println!("[Created ORC LLJIT execution engine]");
    }

    // Note: With ORC JIT's DynamicLibrarySearchGenerator, runtime intrinsics are resolved
    // automatically from the process symbols. No manual add_global_mapping needed.

    // Register builtin intrinsics in the function registry for funcall support
    rlasp_jit::intrinsics::register_builtin_intrinsics();

    if init_runtime {
        // Initialize standard Common Lisp variables
        rlasp_jit::intrinsics::init_standard_cl_variables();
        if mlir_verbose {
            println!("[Initialized standard CL variables]");
        }
    }

    // Auto-register all JIT-compiled user functions and lambdas in the function registry
    // This allows funcall to look them up and call them
    // Note: Using lookup_symbol since module ownership was transferred to LLJIT
    {
        use rlasp_jit::intrinsics::{cc_register_function_ptr, cc_register_function_with_args_list};
        use std::ffi::CString;

        let mut registered_functions = 0;
        let mut registered_lambdas = 0;
        let mut registered_methods = 0;
        let mut registered_local_functions = 0;

        // Register user-defined functions with uniform calling convention
        // All functions now take a single argument (args_and_env), so we use arity usize::MAX
        // to indicate uniform calling convention
        for (name, params, _, _, _, _) in &defuns {
            // Use lookup_symbol to get function address from LLJIT
            if let Ok(func_ptr) = lookup_symbol(name) {
                let name_cstr = CString::new(name.as_str()).unwrap();
                // Entry points like __main or __rlasp_* use direct params
                // All other user functions (including main) use uniform calling convention
                let is_entry = name == "__main" || name.starts_with("__rlasp_");
                let arity = if is_entry {
                    params.len()
                } else {
                    usize::MAX  // Indicates uniform calling convention
                };

                // Check if function has special params (&optional, &key, &rest)
                let has_special_params = params.iter().any(|p| p.starts_with('&'));

                unsafe {
                    if has_special_params && !is_entry {
                        cc_register_function_with_args_list(name_cstr.as_ptr(), func_ptr as usize, arity);
                    } else {
                        cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, arity);
                    }
                }
                registered_functions += 1;

                // Debug: count functions with special params
                if has_special_params && std::env::var("RLASP_TRACE_ARGS_LIST").is_ok() {
                    static mut SPECIAL_COUNT: usize = 0;
                    unsafe {
                        SPECIAL_COUNT += 1;
                        if SPECIAL_COUNT <= 5 {
                            eprintln!("[DEBUG] Registered with args_list: {} (params: {:?})", name, params);
                        }
                    }
                }
            }
        }

        // Register all lambda functions (using pre-collected names)
        for func_name in &lambda_names {
            // Lambdas use uniform calling convention (single args_and_env parameter)
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                unsafe {
                    cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                }
                registered_lambdas += 1;
            }
        }

        // Register method functions for CLOS dispatch (using pre-collected names)
        for func_name in &method_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                // Methods use uniform stack-based calling convention
                unsafe {
                    cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                }
                registered_methods += 1;
            }
        }

        // Register local flet/labels helper functions so MLIR tailcalls can dispatch them.
        for func_name in &local_function_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                unsafe {
                    cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX);
                }
                registered_local_functions += 1;
            }
        }
        if mlir_verbose {
            println!(
                "[Registered {} functions, {} lambdas, {} methods, {} local functions]",
                registered_functions,
                registered_lambdas,
                registered_methods,
                registered_local_functions
            );
        }
    }

    // Execute top-level forms if they exist, otherwise execute all functions
    let mut exec_count = 0;

    let trace_batches = std::env::var("RLASP_TRACE_BATCHES").is_ok();

    // Check if __main exists (top-level forms)
    // Try to look up __main - if it exists, execute it
    if let Ok(__main_addr) = lookup_symbol("__main") {
        // Execute only __main (top-level forms)
        unsafe {
            // Stack-based calling convention: __main returns void, result is on stack
            use rlasp_runtime::eval_stack::{stack_pop_pointer, stack_depth, stack_clear};

            // Force compilation of all batch functions before running
            let mut batch_count = 0;
            for i in 0..100 {
                let batch_name = format!("__main_batch_{}", i);
                match lookup_symbol(&batch_name) {
                    Ok(_) => batch_count += 1,
                    Err(_) => break,
                }
            }
            if batch_count > 0 {
                if mlir_verbose {
                    println!("[Pre-compiled {} batch functions]", batch_count);
                }
            }

            if trace_batches && batch_count > 0 {
                for i in 0..batch_count {
                    let batch_name = format!("__main_batch_{}", i);
                    if let Ok(batch_addr) = lookup_symbol(&batch_name) {
                        println!("[Executing {}]", batch_name);
                        stack_clear();
                        let jit_fn: extern "C" fn() = std::mem::transmute(batch_addr);
                        jit_fn();
                        if stack_depth() > 0 {
                            let _ = stack_pop_pointer();
                        }
                    }
                }
                exec_count += 1;
            } else {
                // Clear stack before execution
                stack_clear();

                // Cast address to function pointer and call directly
                let jit_fn: extern "C" fn() = std::mem::transmute(__main_addr);

                if mlir_verbose {
                    println!("[Executing __main]");
                }
                jit_fn();

                let depth = stack_depth();

                let result = if depth > 0 {
                    // Pop result as boxed pointer (all values are now boxed)
                    stack_pop_pointer()
                } else {
                    0
                };
                if mlir_verbose {
                    println!("=> {}", format_jit_result(result as i64));
                }
                exec_count += 1;
            }
        }
    } else {
        // Fall back to executing all defuns with uniform calling convention
        // Build args_and_env as a list of dummy arguments
        use rlasp_jit::intrinsics::{cc_box_fixnum, cc_nil_value, cc_cons};
        let nil = unsafe { cc_nil_value() as i64 };
        let boxed_zero = unsafe { cc_box_fixnum(0) as i64 };

        for (name, params, _, _, _, _) in &defuns {
            if let Ok(func_addr) = lookup_symbol(name) {
                unsafe {
                    // Build args_and_env list with dummy arguments (all zeros)
                    let mut args_and_env = nil as usize;
                    for _ in 0..params.len() {
                        args_and_env = cc_cons(boxed_zero as usize, args_and_env);
                    }

                    // Call with uniform calling convention: fn(args_and_env) -> i64
                    let jit_fn: extern "C" fn(i64) -> i64 = std::mem::transmute(func_addr);
                    let result = jit_fn(args_and_env as i64);

                    if mlir_verbose {
                        println!("=> {}", format_jit_result(result as i64));
                    }
                    exec_count += 1;
                }
            }
        }
    }

    if mlir_verbose {
        println!("[JIT execution: {} functions compiled, {} forms executed]", defuns.len(), exec_count);
    }

    // Keep LLJIT alive for process lifetime because function pointers from this
    // module are registered globally and may be called later.
    // unsafe { LLVMOrcDisposeLLJIT(lljit); }

    Ok(())
}

fn normalize_path_string(raw: &str) -> String {
    let mut normalized = if raw.starts_with("#P\"") && raw.ends_with('"') && raw.len() >= 4 {
        raw[3..raw.len() - 1].to_string()
    } else if raw.starts_with('"') && raw.ends_with('"') && raw.len() >= 2 {
        raw[1..raw.len() - 1].to_string()
    } else {
        raw.to_string()
    };

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

fn extract_pathname_string(obj: rlasp_runtime::LispObject) -> Option<String> {
    use rlasp_runtime::{Cons, RString, Symbol};

    if let Some(str_ptr) = obj.as_general_ptr::<RString>() {
        if !str_ptr.is_null() {
            let s = unsafe { &*str_ptr };
            return Some(s.as_str().to_string());
        }
    }

    if let Some(sym_ptr) = obj.as_general_ptr::<Symbol>() {
        if !sym_ptr.is_null() {
            let s = unsafe { &*sym_ptr };
            return Some(s.name().to_string());
        }
    }

    if let Some(cons_ptr) = obj.as_cons_ptr() {
        if cons_ptr.is_null() {
            return None;
        }
        let cons = unsafe { &*cons_ptr };
        let car = cons.car();
        if let Some(sym_ptr) = car.as_general_ptr::<Symbol>() {
            if !sym_ptr.is_null() {
                let sym = unsafe { &*sym_ptr };
                let name = sym.name();
                let base = name.rsplit(':').next().unwrap_or(name);
                if base.eq_ignore_ascii_case("pathname") {
                    let cdr = cons.cdr();
                    if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                        if !cdr_ptr.is_null() {
                            let cdr_cons = unsafe { &*cdr_ptr };
                            let path_obj = cdr_cons.car();
                            return extract_pathname_string(path_obj);
                        }
                    }
                }
            }
        }
    }

    None
}

#[no_mangle]
pub extern "C" fn cc_load(path_obj: usize) -> usize {
    use rlasp_runtime::LispObject;
    use std::path::Path;

    let obj = unsafe { LispObject::from_raw(path_obj) };
    let raw_path = match extract_pathname_string(obj) {
        Some(p) => p,
        None => {
            eprintln!("Warning: load requires a pathname or string");
            return unsafe { rlasp_jit::intrinsics::cc_nil_value() };
        }
    };

    let mut path = normalize_path_string(&raw_path);
    if path.starts_with("sys:") {
        path = path.replacen("sys:", "./", 1);
    }

    let resolved_path = if Path::new(&path).is_absolute() {
        path
    } else {
        std::env::current_dir()
            .map(|cwd| cwd.join(&path).to_string_lossy().to_string())
            .unwrap_or(path)
    };

    let contents = match std::fs::read_to_string(&resolved_path) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("load failed to read {}: {}", resolved_path, e);
            return unsafe { rlasp_jit::intrinsics::cc_nil_value() };
        }
    };

    match eval_file_mlir(&contents, &resolved_path, false) {
        Ok(_) => unsafe { rlasp_jit::intrinsics::cc_t_value() },
        Err(e) => {
            eprintln!("load failed: {}", e);
            unsafe { rlasp_jit::intrinsics::cc_nil_value() }
        }
    }
}

/// Load and execute an MLIR (.mlir) or MLIR bytecode (.mlirbc) file
/// (load-mlir path) - callable from Lisp
#[no_mangle]
pub extern "C" fn cc_load_mlir(path_obj: usize) -> usize {
    use rlasp_runtime::LispObject;
    use std::path::Path;

    let obj = unsafe { LispObject::from_raw(path_obj) };
    let raw_path = match extract_pathname_string(obj) {
        Some(p) => p,
        None => {
            eprintln!("load-mlir: requires a pathname or string (got 0x{:x})", path_obj);
            return unsafe { rlasp_jit::intrinsics::cc_nil_value() };
        }
    };

    let path = normalize_path_string(&raw_path);
    let resolved_path = if Path::new(&path).is_absolute() {
        path.clone()
    } else {
        std::env::current_dir()
            .map(|cwd| cwd.join(&path).to_string_lossy().to_string())
            .unwrap_or(path.clone())
    };

    if !Path::new(&resolved_path).exists() {
        eprintln!("load-mlir: file not found: {}", resolved_path);
        return unsafe { rlasp_jit::intrinsics::cc_nil_value() };
    }

    let is_bytecode = resolved_path.ends_with(".mlirbc");
    let is_text_mlir = resolved_path.ends_with(".mlir");

    if !is_bytecode && !is_text_mlir {
        eprintln!("load-mlir: expected .mlir or .mlirbc file, got: {}", resolved_path);
        return unsafe { rlasp_jit::intrinsics::cc_nil_value() };
    }

    // Lower to LLVM IR
    println!("[load-mlir: loading {}]", resolved_path);
    let llvm_ir_text = if is_bytecode {
        // .mlirbc already has runtime decls baked in
        rlasp_mlir::lowering::lower_mlir_file_to_llvm(&resolved_path)
    } else {
        // .mlir text - check if it has runtime decls by looking for cc_nil
        let mlir_text = match std::fs::read_to_string(&resolved_path) {
            Ok(t) => t,
            Err(e) => {
                eprintln!("load-mlir: failed to read {}: {}", resolved_path, e);
                return unsafe { rlasp_jit::intrinsics::cc_nil_value() };
            }
        };
        // Always merge runtime decls for .mlir text files
        rlasp_mlir::lowering::lower_mlir_to_llvm(&mlir_text)
    };

    let llvm_ir_text = match llvm_ir_text {
        Ok(ir) => ir,
        Err(e) => {
            eprintln!("load-mlir: lowering failed: {}", e);
            return unsafe { rlasp_jit::intrinsics::cc_nil_value() };
        }
    };

    // JIT compile and execute
    match jit_execute_llvm_ir(&llvm_ir_text, &resolved_path) {
        Ok(()) => unsafe { rlasp_jit::intrinsics::cc_t_value() },
        Err(e) => {
            eprintln!("load-mlir: JIT execution failed: {}", e);
            unsafe { rlasp_jit::intrinsics::cc_nil_value() }
        }
    }
}

/// JIT compile and execute LLVM IR text
fn jit_execute_llvm_ir(llvm_ir_text: &str, source_path: &str) -> std::result::Result<(), String> {
    use inkwell::context::Context;
    use inkwell::memory_buffer::MemoryBuffer;
    use llvm_sys::orc2::*;
    use llvm_sys::orc2::lljit::*;
    use llvm_sys::error::*;
    use std::ptr;
    use std::path::Path;

    // Ensure LLVM native target is initialized
    use inkwell::targets::{Target, InitializationConfig};
    Target::initialize_native(&InitializationConfig::default())
        .map_err(|e| format!("Failed to initialize native target: {}", e))?;

    let module_name = Path::new(source_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("loaded_module");

    let context = Context::create();
    let memory_buffer = MemoryBuffer::create_from_memory_range_copy(llvm_ir_text.as_bytes(), module_name);
    let module = context.create_module_from_ir(memory_buffer)
        .map_err(|e| format!("Failed to parse LLVM IR: {:?}", e))?;

    // Collect function names before transferring module
    let mut lambda_names: Vec<String> = Vec::new();
    let mut fn_names: Vec<String> = Vec::new();
    for func_val in module.get_functions() {
        let func_name = func_val.get_name().to_str().unwrap_or("");
        if func_name.starts_with("__lambda_") {
            lambda_names.push(func_name.to_string());
        }
        if func_name.starts_with("%FN%") {
            fn_names.push(func_name.to_string());
        }
    }

    // Create LLJIT
    let lljit: LLVMOrcLLJITRef = unsafe {
        let builder = LLVMOrcCreateLLJITBuilder();
        let mut lljit: LLVMOrcLLJITRef = ptr::null_mut();
        let err = LLVMOrcCreateLLJIT(&mut lljit, builder);
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
            LLVMDisposeErrorMessage(err_msg);
            return Err(format!("Failed to create LLJIT: {}", msg));
        }
        lljit
    };

    let main_jd = unsafe { LLVMOrcLLJITGetMainJITDylib(lljit) };

    // Add process symbol resolver
    unsafe {
        let mut gen: LLVMOrcDefinitionGeneratorRef = ptr::null_mut();
        let global_prefix = LLVMOrcLLJITGetGlobalPrefix(lljit);
        let err = LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(
            &mut gen, global_prefix, None, ptr::null_mut(),
        );
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
            LLVMDisposeErrorMessage(err_msg);
            LLVMOrcDisposeLLJIT(lljit);
            return Err(format!("Failed to create symbol resolver: {}", msg));
        }
        LLVMOrcJITDylibAddGenerator(main_jd, gen);
    }

    // Add module to LLJIT
    let ts_ctx = unsafe { LLVMOrcCreateNewThreadSafeContext() };
    let llvm_module_ref = module.as_mut_ptr();
    let ts_module = unsafe { LLVMOrcCreateNewThreadSafeModule(llvm_module_ref, ts_ctx) };
    std::mem::forget(module);

    unsafe {
        let err = LLVMOrcLLJITAddLLVMIRModule(lljit, main_jd, ts_module);
        if !err.is_null() {
            let err_msg = LLVMGetErrorMessage(err);
            let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
            LLVMDisposeErrorMessage(err_msg);
            LLVMOrcDisposeLLJIT(lljit);
            return Err(format!("Failed to add module: {}", msg));
        }
    }

    let lookup_symbol = |name: &str| -> std::result::Result<u64, String> {
        let c_name = std::ffi::CString::new(name).unwrap();
        let mut addr: LLVMOrcExecutorAddress = 0;
        unsafe {
            let err = LLVMOrcLLJITLookup(lljit, &mut addr, c_name.as_ptr());
            if !err.is_null() {
                let err_msg = LLVMGetErrorMessage(err);
                let msg = std::ffi::CStr::from_ptr(err_msg).to_string_lossy().into_owned();
                LLVMDisposeErrorMessage(err_msg);
                return Err(msg);
            }
        }
        Ok(addr)
    };

    // Read the __argslist_functions global to find which functions expect args_list
    let argslist_functions: std::collections::HashSet<String> = {
        let mut set = std::collections::HashSet::new();
        if let Ok(addr) = lookup_symbol("__argslist_functions") {
            if addr != 0 {
                let ptr = addr as *const u8;
                let mut offset = 0;
                loop {
                    let start = unsafe { ptr.add(offset) };
                    if unsafe { *start } == 0 { break; } // double null = end
                    let c_str = unsafe { std::ffi::CStr::from_ptr(start as *const i8) };
                    if let Ok(name) = c_str.to_str() {
                        if !name.is_empty() {
                            set.insert(name.to_string());
                        }
                        offset += name.len() + 1; // +1 for null
                    } else {
                        break;
                    }
                }
            }
        }
        set
    };

    // Register functions
    {
        use rlasp_jit::intrinsics::{cc_register_function_ptr, cc_register_function_with_args_list};
        use std::ffi::CString;

        for func_name in &fn_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                if argslist_functions.contains(func_name) {
                    unsafe { cc_register_function_with_args_list(name_cstr.as_ptr(), func_ptr as usize, usize::MAX); }
                } else {
                    unsafe { cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX); }
                }
            }
        }
        for func_name in &lambda_names {
            if let Ok(func_ptr) = lookup_symbol(func_name) {
                let name_cstr = CString::new(func_name.as_str()).unwrap();
                unsafe { cc_register_function_ptr(name_cstr.as_ptr(), func_ptr as usize, usize::MAX); }
            }
        }
    }

    // Ensure standard CL variables are initialized
    rlasp_jit::intrinsics::init_standard_cl_variables();

    // Execute __main or batch functions
    let trace_batches = std::env::var("RLASP_TRACE_BATCHES").is_ok();

    if let Ok(__main_addr) = lookup_symbol("__main") {
        unsafe {
            use rlasp_runtime::eval_stack::{stack_pop_pointer, stack_depth, stack_clear};

            // Pre-compile batch functions
            let mut batch_count = 0;
            for i in 0..100 {
                let batch_name = format!("__main_batch_{}", i);
                match lookup_symbol(&batch_name) {
                    Ok(_) => batch_count += 1,
                    Err(_) => break,
                }
            }

            println!("[load-mlir: {} batches, {} functions, {} lambdas]",
                batch_count, fn_names.len(), lambda_names.len());

            if batch_count > 0 {
                for i in 0..batch_count {
                    let batch_name = format!("__main_batch_{}", i);
                    if let Ok(batch_addr) = lookup_symbol(&batch_name) {
                        if trace_batches {
                            println!("[load-mlir: batch {}/{}]", i, batch_count);
                        }
                        stack_clear();
                        let jit_fn: extern "C" fn() = std::mem::transmute(batch_addr);
                        jit_fn();
                        if stack_depth() > 0 {
                            let _ = stack_pop_pointer();
                        }
                    }
                }
                println!("[load-mlir: {} batches executed]", batch_count);
            } else {
                stack_clear();
                let jit_fn: extern "C" fn() = std::mem::transmute(__main_addr);
                jit_fn();
                if stack_depth() > 0 {
                    let _ = stack_pop_pointer();
                }
            }
        }
    } else {
        return Err("No __main function found in module".to_string());
    }

    // IMPORTANT: Do NOT dispose the LLJIT - the compiled code must remain in memory
    // so that function pointers in the registry stay valid for later calls from the REPL.
    // The LLJIT will live for the process lifetime.
    // unsafe { LLVMOrcDisposeLLJIT(lljit); }
    Ok(())
}

/// Format a LispObject as a list string
fn format_list(obj: &rlasp_runtime::LispObject) -> String {
    if obj.is_nil() {
        return "NIL".to_string();
    }

    if !obj.is_cons() {
        return format!("{:?}", obj);
    }

    let mut result = String::from("(");
    let mut current = *obj;
    let mut first = true;

    loop {
        if current.is_nil() {
            result.push(')');
            break;
        }

        if !current.is_cons() {
            // Improper list (dotted pair)
            result.push_str(" . ");
            result.push_str(&format_element(&current));
            result.push(')');
            break;
        }

        if !first {
            result.push(' ');
        }
        first = false;

        // Get car and cdr
        if let Some(cons_ptr) = current.as_cons_ptr() {
            unsafe {
                let car = (*cons_ptr).car();
                result.push_str(&format_element(&car));
                current = (*cons_ptr).cdr();
            }
        } else {
            break;
        }
    }

    result
}

/// Format a single element
fn format_element(obj: &rlasp_runtime::LispObject) -> String {
    use rlasp_jit::intrinsics::cc_t_value;

    if let Some(val) = obj.as_fixnum() {
        val.to_string()
    } else if obj.is_nil() {
        "NIL".to_string()
    } else if obj.raw() == unsafe { cc_t_value() } {
        "T".to_string()
    } else if obj.is_cons() {
        format_list(obj)
    } else {
        format!("{:?}", obj)
    }
}

fn eval_expression_llvm(expr: &str) -> std::result::Result<(), String> {
    use rlasp::repl::reader::Reader;
    use rlasp::repl::expand_macros;
    use rlasp_jit::{CodeGenerator, JitEngine};
    use inkwell::context::Context;
    use inkwell::values::BasicValueEnum;

    // 1. Parse with reader
    let mut reader = Reader::new(expr);
    let ast = match reader.read() {
        Ok(ast) => ast,
        Err(e) => return Err(format!("Parse error: {}", e)),
    };

    // 2. Expand macros
    let expanded = expand_macros(&ast);

    // 3. Generate LLVM IR
    let context = Context::create();
    let codegen = CodeGenerator::new(&context, "repl");
    codegen.declare_intrinsics();

    // Add function that evaluates the expression
    let i64_type = context.i64_type();
    let eval_fn_type = i64_type.fn_type(&[], false);
    let eval_fn = codegen.module().add_function("__rlasp_eval", eval_fn_type, None);

    let entry_block = context.append_basic_block(eval_fn, "entry");
    codegen.builder().position_at_end(entry_block);

    // Compile the AST to LLVM IR
    let mut env = std::collections::HashMap::new();
    let empty_funcs = std::collections::HashMap::new();
    let result_val = compile_ast_to_llvm(&context, &codegen, &expanded, &mut env, &empty_funcs)?;
    codegen.builder().build_return(Some(&result_val)).unwrap();

    // 4. Create JIT and execute
    let jit = codegen.into_jit_engine()
        .map_err(|e| format!("Failed to create JIT: {}", e))?;

    unsafe {
        let func = jit.get_function_0("__rlasp_eval")
            .map_err(|e| format!("Failed to get function: {}", e))?;

        let result_raw = func.call();

        // Format result for display
        use rlasp_runtime::LispObject;
        use rlasp_jit::intrinsics::cc_t_value;

        let result_obj = LispObject::from_raw(result_raw);
        let t_val = cc_t_value();

        // Debug: print raw values
        // eprintln!("DEBUG: result_raw={:x}, t_val={:x}, nil={:x}", result_raw, t_val, LispObject::nil().raw());

        // Check for nil and T first, before checking for fixnum
        if result_obj.is_nil() {
            println!("=> NIL");
        } else if result_raw == t_val {
            println!("=> T");
        } else if let Some(val) = result_obj.as_fixnum() {
            println!("=> (fixnum {})", val);
        } else if result_obj.is_cons() {
            // Format as a list
            println!("=> {}", format_list(&result_obj));
        } else if result_obj.is_number() {
            // Format numbers with type info
            if let Some(ptr) = result_obj.as_general_ptr::<rlasp_runtime::Number>() {
                let num = unsafe { &*ptr };
                match &num.value {
                    rlasp_runtime::NumberValue::Bignum(b) => println!("=> (bignum {})", b),
                    rlasp_runtime::NumberValue::Ratio(r) => println!("=> (ratio {} {})", r.numerator_ref(), r.denominator_ref()),
                    rlasp_runtime::NumberValue::Float(f) => println!("=> (float {})", f),
                    rlasp_runtime::NumberValue::Complex(c) => println!("=> (complex {} {})", c.re, c.im),
                }
            } else {
                println!("=> {:?}", result_obj);
            }
        } else {
            println!("=> {:?}", result_obj);
        }
    }

    Ok(())
}

/// Collect free variables (variables used but not bound) in an AST node
fn collect_free_vars(
    ast: &rlasp::ir::ASTNode,
    bound_vars: &std::collections::HashSet<String>,
    free_vars: &mut std::collections::HashSet<String>,
) {
    use rlasp::ir::ASTNode;

    match ast {
        ASTNode::Variable(name) => {
            if !bound_vars.contains(name) {
                free_vars.insert(name.clone());
            }
        }
        ASTNode::Call { function, args } => {
            collect_free_vars(function, bound_vars, free_vars);
            for arg in args {
                collect_free_vars(arg, bound_vars, free_vars);
            }
        }
        ASTNode::If { test, then_branch, else_branch } => {
            collect_free_vars(test, bound_vars, free_vars);
            collect_free_vars(then_branch, bound_vars, free_vars);
            collect_free_vars(else_branch, bound_vars, free_vars);
        }
        ASTNode::Let { bindings, body } => {
            let mut new_bound = bound_vars.clone();
            for (var, val_expr) in bindings {
                collect_free_vars(val_expr, bound_vars, free_vars);
                new_bound.insert(var.clone());
            }
            for expr in body {
                collect_free_vars(expr, &new_bound, free_vars);
            }
        }
        ASTNode::Setq { var, value } => {
            collect_free_vars(value, bound_vars, free_vars);
            if !bound_vars.contains(var) {
                free_vars.insert(var.clone());
            }
        }
        ASTNode::Lambda { params, body, .. } => {
            let mut new_bound = bound_vars.clone();
            for param in params {
                new_bound.insert(param.clone());
            }
            for expr in body {
                collect_free_vars(expr, &new_bound, free_vars);
            }
        }
        ASTNode::Progn { exprs } => {
            for expr in exprs {
                collect_free_vars(expr, bound_vars, free_vars);
            }
        }
        ASTNode::Block { body, .. } => {
            for expr in body {
                collect_free_vars(expr, bound_vars, free_vars);
            }
        }
        ASTNode::Dotimes { var, count, result, body } => {
            collect_free_vars(count, bound_vars, free_vars);
            let mut new_bound = bound_vars.clone();
            new_bound.insert(var.clone());
            for expr in body {
                collect_free_vars(expr, &new_bound, free_vars);
            }
            if let Some(result_expr) = result {
                collect_free_vars(result_expr, &new_bound, free_vars);
            }
        }
        ASTNode::Dolist { var, list, result, body } => {
            collect_free_vars(list, bound_vars, free_vars);
            let mut new_bound = bound_vars.clone();
            new_bound.insert(var.clone());
            for expr in body {
                collect_free_vars(expr, &new_bound, free_vars);
            }
            if let Some(result_expr) = result {
                collect_free_vars(result_expr, &new_bound, free_vars);
            }
        }
        ASTNode::Loop { var, start, limit, when_condition, collect, sum, else_collect, else_sum } => {
            if let Some(start_expr) = start {
                collect_free_vars(start_expr, bound_vars, free_vars);
            }
            collect_free_vars(limit, bound_vars, free_vars);
            if let Some(when_cond) = when_condition {
                collect_free_vars(when_cond, bound_vars, free_vars);
            }
            let mut new_bound = bound_vars.clone();
            new_bound.insert(var.clone());
            if let Some(collect_expr) = collect {
                collect_free_vars(collect_expr, &new_bound, free_vars);
            }
            if let Some(sum_expr) = sum {
                collect_free_vars(sum_expr, &new_bound, free_vars);
            }
            if let Some(else_collect_expr) = else_collect {
                collect_free_vars(else_collect_expr, &new_bound, free_vars);
            }
            if let Some(else_sum_expr) = else_sum {
                collect_free_vars(else_sum_expr, &new_bound, free_vars);
            }
        }
        ASTNode::Cond { clauses } => {
            for (test, result) in clauses {
                collect_free_vars(test, bound_vars, free_vars);
                collect_free_vars(result, bound_vars, free_vars);
            }
        }
        ASTNode::Quote { .. } | ASTNode::Constant(_) => {
            // No free variables in literals
        }
        _ => {
            // For other node types, conservatively assume no free variables
        }
    }
}

fn compile_ast_to_llvm<'ctx>(
    context: &'ctx inkwell::context::Context,
    codegen: &rlasp_jit::CodeGenerator<'ctx>,
    ast: &rlasp::ir::ASTNode,
    env: &mut std::collections::HashMap<String, inkwell::values::PointerValue<'ctx>>,
    user_functions: &std::collections::HashMap<String, Vec<String>>,
) -> std::result::Result<inkwell::values::BasicValueEnum<'ctx>, String> {
    use rlasp::ir::ASTNode;
    use rlasp::ir::ConstantValue;

    match ast {
        ASTNode::Constant(ConstantValue::Fixnum(n)) => {
            // Box the fixnum
            let i64_type = context.i64_type();
            let box_fixnum_fn = codegen.module().get_function("cc_box_fixnum")
                .ok_or("cc_box_fixnum not found")?;

            let val = i64_type.const_int(*n as u64, true);
            let call_site = codegen.builder().build_call(box_fixnum_fn, &[val.into()], "boxed")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;

            let result = call_site.as_any_value_enum().into_int_value();
            Ok(result.into())
        }

        ASTNode::Constant(ConstantValue::Float(f)) => {
            // Box the float
            let f64_type = context.f64_type();
            let box_float_fn = codegen.module().get_function("cc_box_float")
                .ok_or("cc_box_float not found")?;

            let val = f64_type.const_float(*f);
            let call_site = codegen.builder().build_call(box_float_fn, &[val.into()], "boxed")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;

            let result = call_site.as_any_value_enum().into_int_value();
            Ok(result.into())
        }

        ASTNode::Constant(ConstantValue::String(s)) => {
            // Create a global string constant
            let i8_type = context.i8_type();
            let string_type = i8_type.array_type(s.len() as u32);

            let global = codegen.module().add_global(string_type, None, "str");
            global.set_initializer(&context.const_string(s.as_bytes(), false));
            global.set_constant(true);

            // Get pointer to the string data
            let ptr = codegen.builder().build_pointer_cast(
                global.as_pointer_value(),
                context.ptr_type(inkwell::AddressSpace::default()),
                "str_ptr"
            ).map_err(|e| format!("Failed to cast pointer: {:?}", e))?;

            // Call cc_make_string(ptr, len)
            let make_string_fn = codegen.module().get_function("cc_make_string")
                .ok_or("cc_make_string not found")?;

            let len_val = context.i64_type().const_int(s.len() as u64, false);
            let call_site = codegen.builder().build_call(
                make_string_fn,
                &[ptr.into(), len_val.into()],
                "string_obj"
            ).map_err(|e| format!("Failed to build call: {:?}", e))?;

            let result = call_site.as_any_value_enum().into_int_value();
            Ok(result.into())
        }

        ASTNode::Constant(ConstantValue::Nil) => {
            let nil_fn = codegen.module().get_function("cc_nil")
                .ok_or("cc_nil not found")?;
            let call_site = codegen.builder().build_call(nil_fn, &[], "nil")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let result = call_site.as_any_value_enum().into_int_value();
            Ok(result.into())
        }

        ASTNode::Constant(ConstantValue::T) => {
            let t_fn = codegen.module().get_function("cc_t")
                .ok_or("cc_t not found")?;
            let call_site = codegen.builder().build_call(t_fn, &[], "t")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let result = call_site.as_any_value_enum().into_int_value();
            Ok(result.into())
        }

        ASTNode::Variable(name) => {
            // Look up variable in environment
            if let Some(ptr) = env.get(name) {
                let loaded = codegen.builder().build_load(codegen.lisp_object_type(), *ptr, name)
                    .map_err(|e| format!("Failed to load variable: {:?}", e))?;
                Ok(loaded)
            } else {
                // Handle special variables
                let lookup_name = name.rsplit(':').next().unwrap_or(name.as_str());
                let lookup_name_lower = lookup_name.to_ascii_lowercase();
                match lookup_name_lower.as_str() {
                    "t" => {
                        let t_fn = codegen.module().get_function("cc_t")
                            .ok_or("cc_t not found")?;
                        let call_site = codegen.builder().build_call(t_fn, &[], "t")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "nil" | "null" => {
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "internal-time-units-per-second" => {
                        // Return constant 1_000_000_000 (nanoseconds per second)
                        let i64_type = context.i64_type();
                        let const_val = i64_type.const_int(1_000_000_000, false);
                        let box_fn = codegen.module().get_function("cc_box_fixnum")
                            .ok_or("cc_box_fixnum not found")?;
                        let call = codegen.builder().build_call(box_fn, &[const_val.into()], "box_ns")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call.as_any_value_enum().into_int_value().into())
                    }
                    "char-code-limit" => {
                        // Keep in sync with interpreter char model (Rust char excludes surrogates).
                        let i64_type = context.i64_type();
                        let const_val = i64_type.const_int(55_296, false);
                        let box_fn = codegen.module().get_function("cc_box_fixnum")
                            .ok_or("cc_box_fixnum not found")?;
                        let call = codegen.builder().build_call(box_fn, &[const_val.into()], "box_char_code_limit")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call.as_any_value_enum().into_int_value().into())
                    }
                    _ => {
                        // Check if this is a keyword (starts with :)
                        if name.starts_with(':') {
                            // Treat keywords as symbols
                            let make_symbol_fn = codegen.module().get_function("cc_make_symbol")
                                .ok_or("cc_make_symbol not found")?;

                            // Create string for keyword name
                            let i8_type = context.i8_type();
                            let string_type = i8_type.array_type(name.len() as u32);
                            let global = codegen.module().add_global(string_type, None, "keyword_name");
                            global.set_initializer(&context.const_string(name.as_bytes(), false));
                            global.set_constant(true);

                            let ptr = codegen.builder().build_pointer_cast(
                                global.as_pointer_value(),
                                context.ptr_type(inkwell::AddressSpace::default()),
                                "keyword_str_ptr"
                            ).map_err(|e| format!("Failed to cast pointer: {:?}", e))?;

                            let len_val = context.i64_type().const_int(name.len() as u64, false);
                            let call_site = codegen.builder().build_call(
                                make_symbol_fn, &[ptr.into(), len_val.into()], "keyword"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                            Ok(call_site.as_any_value_enum().into_int_value().into())
                        } else {
                            // Check if this is a supplied-p variable (ends with -p)
                            // For optional parameters like (a &optional (b 2 b-p)), b-p is the supplied-p indicator
                            if name.ends_with("-p") {
                                // Create the variable and initialize it to NIL
                                let i64_type = context.i64_type();
                                let alloca = codegen.builder().build_alloca(i64_type, name)
                                    .map_err(|e| format!("Failed to build alloca for supplied-p: {:?}", e))?;

                                let nil_fn = codegen.module().get_function("cc_nil")
                                    .ok_or("cc_nil not found")?;
                                let nil_val = codegen.builder().build_call(nil_fn, &[], "supplied_p_nil")
                                    .map_err(|e| format!("Failed to build call: {:?}", e))?
                                    .as_any_value_enum().into_int_value();

                                codegen.builder().build_store(alloca, nil_val)
                                    .map_err(|e| format!("Failed to store supplied-p: {:?}", e))?;

                                env.insert(name.clone(), alloca);

                                // Load and return the NIL value
                                let loaded = codegen.builder().build_load(i64_type, alloca, name)
                                    .map_err(|e| format!("Failed to load supplied-p: {:?}", e))?
                                    .into_int_value();

                                Ok(loaded.into())
                            } else {
                                Err(format!("Undefined variable: {}", name))
                            }
                        }
                    }
                }
            }
        }

        ASTNode::Progn { exprs } => {
            // Evaluate expressions in sequence, return the last one
            let mut result = None;
            for expr in exprs {
                result = Some(compile_ast_to_llvm(context, codegen, expr, env, user_functions)?);
            }
            result.ok_or_else(|| "Progn body cannot be empty".to_string())
        }

        ASTNode::Block { name, body } => {
            let block_name = name.as_deref().unwrap_or("anonymous");

            // Get the current function
            let current_fn = codegen.builder().get_insert_block()
                .and_then(|bb| bb.get_parent())
                .ok_or("No current function for block")?;

            // Create exit block and value slot
            let exit_bb = context.append_basic_block(current_fn, &format!("block_{}_exit", block_name));
            let value_slot = codegen.builder().build_alloca(context.i64_type(), &format!("block_{}_value", block_name))
                .map_err(|e| format!("Failed to build alloca: {:?}", e))?;

            // Store value slot in env with special name
            let value_key = format!("__block_value_{}", block_name);
            env.insert(value_key.clone(), value_slot);

            // Create body block
            let body_bb = context.append_basic_block(current_fn, &format!("block_{}_body", block_name));
            codegen.builder().build_unconditional_branch(body_bb)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;
            codegen.builder().position_at_end(body_bb);

            let mut result = None;
            for expr in body {
                result = Some(compile_ast_to_llvm(context, codegen, expr, env, user_functions)?);
            }

            let final_value = result.ok_or_else(|| "Block body cannot be empty".to_string())?;

            // Store the result in the value slot and branch to exit
            codegen.builder().build_store(value_slot, final_value)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;
            codegen.builder().build_unconditional_branch(exit_bb)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Position at exit block and load the value
            codegen.builder().position_at_end(exit_bb);
            let loaded_value = codegen.builder().build_load(context.i64_type(), value_slot, &format!("block_{}_result", block_name))
                .map_err(|e| format!("Failed to build load: {:?}", e))?;

            // Clean up env
            env.remove(&value_key);

            Ok(loaded_value.into_int_value().into())
        }

        ASTNode::ReturnFrom { block_name, value } => {
            let name_str = block_name.as_deref().unwrap_or("anonymous");

            // Look up the value slot for this block
            let value_key = format!("__block_value_{}", name_str);
            let value_slot = env.get(&value_key)
                .ok_or_else(|| format!("return-from: unknown block {:?}", block_name))?
                .clone();

            // Compile the return value
            let return_val = if let Some(val_expr) = value {
                compile_ast_to_llvm(context, codegen, val_expr, env, user_functions)?
            } else {
                let nil_fn = codegen.module().get_function("cc_nil")
                    .ok_or("cc_nil not found")?;
                let call_site = codegen.builder().build_call(nil_fn, &[], "return_nil")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                call_site.as_any_value_enum().into_int_value().into()
            };

            // Store the value in the slot
            codegen.builder().build_store(value_slot, return_val)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            // Get current function to find the exit block
            let current_fn = codegen.builder().get_insert_block()
                .and_then(|bb| bb.get_parent())
                .ok_or("No current function for return-from")?;

            // Find the exit block by name
            let exit_block_name = format!("block_{}_exit", name_str);
            let basic_blocks = current_fn.get_basic_blocks();
            let exit_bb = basic_blocks.iter()
                .find(|bb| bb.get_name().to_str() == Ok(exit_block_name.as_str()))
                .ok_or_else(|| format!("return-from: exit block not found for {:?}", block_name))?;

            // Branch to the exit block
            codegen.builder().build_unconditional_branch(*exit_bb)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Create a new unreachable block for any code after return-from
            let unreachable_bb = context.append_basic_block(current_fn, "after_return_from");
            codegen.builder().position_at_end(unreachable_bb);

            // Return the value (though this is unreachable)
            Ok(return_val)
        }

        ASTNode::If { test, then_branch, else_branch } => {
            // Compile the test expression
            let test_val = compile_ast_to_llvm(context, codegen, test, env, user_functions)?;

            // Check if test is nil (false)
            let is_nil_fn = codegen.module().get_function("cc_is_nil")
                .ok_or("cc_is_nil not found")?;
            let is_nil_call = codegen.builder().build_call(is_nil_fn, &[test_val.into()], "is_nil")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let is_nil_result = is_nil_call.as_any_value_enum().into_int_value();

            // Convert i32 to i1 for branch condition (0 = false/nil, non-zero = true)
            let cond = codegen.builder().build_int_compare(
                inkwell::IntPredicate::EQ,
                is_nil_result,
                context.i32_type().const_zero(),
                "is_false"
            ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

            // Get the current function
            let current_fn = codegen.builder().get_insert_block()
                .and_then(|bb| bb.get_parent())
                .ok_or("No current function")?;

            // Create basic blocks for then, else, and merge
            let then_bb = context.append_basic_block(current_fn, "then");
            let else_bb = context.append_basic_block(current_fn, "else");
            let merge_bb = context.append_basic_block(current_fn, "merge");

            // Build conditional branch (if cond is true (test is NOT nil), goto then, otherwise goto else)
            codegen.builder().build_conditional_branch(cond, then_bb, else_bb)
                .map_err(|e| format!("Failed to build conditional branch: {:?}", e))?;

            // Build then block
            codegen.builder().position_at_end(then_bb);
            let then_val = compile_ast_to_llvm(context, codegen, then_branch, env, user_functions)?;
            codegen.builder().build_unconditional_branch(merge_bb)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;
            let then_bb_end = codegen.builder().get_insert_block().unwrap();

            // Build else block
            codegen.builder().position_at_end(else_bb);
            let else_val = compile_ast_to_llvm(context, codegen, else_branch, env, user_functions)?;
            codegen.builder().build_unconditional_branch(merge_bb)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;
            let else_bb_end = codegen.builder().get_insert_block().unwrap();

            // Build merge block with phi node
            codegen.builder().position_at_end(merge_bb);
            let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "if_result")
                .map_err(|e| format!("Failed to build phi: {:?}", e))?;

            phi.add_incoming(&[
                (&then_val.into_int_value(), then_bb_end),
                (&else_val.into_int_value(), else_bb_end),
            ]);

            Ok(phi.as_basic_value())
        }

        ASTNode::Cond { clauses } => {
            // Get the current function
            let current_fn = codegen.builder().get_insert_block()
                .and_then(|bb| bb.get_parent())
                .ok_or("No current function")?;

            // Create merge block
            let merge_bb = context.append_basic_block(current_fn, "cond_merge");

            // Create a vector to store (value, basic_block) pairs for phi node
            let mut phi_incoming: Vec<(inkwell::values::IntValue, inkwell::basic_block::BasicBlock)> = Vec::new();

            // Handle each clause
            let mut current_test_bb = codegen.builder().get_insert_block().unwrap();

            for (i, (test, result)) in clauses.iter().enumerate() {
                // Position at current test block
                codegen.builder().position_at_end(current_test_bb);

                // Evaluate test
                let test_val = compile_ast_to_llvm(context, codegen, test, env, user_functions)?;

                // Check if test is nil (false)
                let is_nil_fn = codegen.module().get_function("cc_is_nil")
                    .ok_or("cc_is_nil not found")?;
                let is_nil_call = codegen.builder().build_call(is_nil_fn, &[test_val.into()], "is_nil")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                let is_nil_result = is_nil_call.as_any_value_enum().into_int_value();

                // Convert i32 to i1 for branch condition (0 = false/nil, non-zero = true)
                let cond = codegen.builder().build_int_compare(
                    inkwell::IntPredicate::EQ,
                    is_nil_result,
                    context.i32_type().const_zero(),
                    "is_not_nil"
                ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                // Create result block and next test block
                let result_bb = context.append_basic_block(current_fn, &format!("cond_result_{}", i));
                let next_test_bb = context.append_basic_block(current_fn, &format!("cond_test_{}", i + 1));

                // Branch: if test is NOT nil, goto result, else goto next test
                codegen.builder().build_conditional_branch(cond, result_bb, next_test_bb)
                    .map_err(|e| format!("Failed to build conditional branch: {:?}", e))?;

                // Build result block
                codegen.builder().position_at_end(result_bb);
                let result_val = compile_ast_to_llvm(context, codegen, result, env, user_functions)?;
                codegen.builder().build_unconditional_branch(merge_bb)
                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;
                let result_bb_end = codegen.builder().get_insert_block().unwrap();

                // Add to phi incoming
                phi_incoming.push((result_val.into_int_value(), result_bb_end));

                // Move to next test block for next iteration
                current_test_bb = next_test_bb;
            }

            // If no clause matched, return nil
            codegen.builder().position_at_end(current_test_bb);
            let nil_fn = codegen.module().get_function("cc_nil")
                .ok_or("cc_nil not found")?;
            let nil_call = codegen.builder().build_call(nil_fn, &[], "nil")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let nil_val = nil_call.as_any_value_enum().into_int_value();
            codegen.builder().build_unconditional_branch(merge_bb)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;
            let nil_bb = codegen.builder().get_insert_block().unwrap();

            // Add nil case to phi incoming
            phi_incoming.push((nil_val, nil_bb));

            // Build merge block with phi node
            codegen.builder().position_at_end(merge_bb);
            let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "cond_result")
                .map_err(|e| format!("Failed to build phi: {:?}", e))?;

            // Add all incoming values
            for (val, bb) in phi_incoming.iter() {
                phi.add_incoming(&[(val, *bb)]);
            }

            Ok(phi.as_basic_value())
        }

        ASTNode::Dotimes { var, count, result, body } => {
            let i64_type = context.i64_type();
            let current_fn = codegen.builder().get_insert_block()
                .and_then(|bb| bb.get_parent())
                .ok_or("No current function")?;

            // Evaluate count expression
            let count_val = compile_ast_to_llvm(context, codegen, count, env, user_functions)?;
            let unbox_fn = codegen.module().get_function("cc_unbox_fixnum")
                .ok_or("cc_unbox_fixnum not found")?;
            let box_fn = codegen.module().get_function("cc_box_fixnum")
                .ok_or("cc_box_fixnum not found")?;
            let count_call = codegen.builder().build_call(unbox_fn, &[count_val.into()], "unbox_count")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let count_unboxed = count_call.as_any_value_enum().into_int_value();

            // Create loop counter variable (stores boxed LispObject)
            let counter_alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), &format!("{}_counter", var))
                .map_err(|e| format!("Failed to build alloca: {:?}", e))?;

            // Initialize counter to boxed 0
            let zero_boxed_call = codegen.builder().build_call(box_fn, &[i64_type.const_zero().into()], "box_zero")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let zero_boxed = zero_boxed_call.as_any_value_enum().into_int_value();
            codegen.builder().build_store(counter_alloca, zero_boxed)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            // Create loop blocks
            let loop_header = context.append_basic_block(current_fn, "dotimes_header");
            let loop_body = context.append_basic_block(current_fn, "dotimes_body");
            let loop_exit = context.append_basic_block(current_fn, "dotimes_exit");

            // Jump to header
            codegen.builder().build_unconditional_branch(loop_header)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop header: check if counter < count
            codegen.builder().position_at_end(loop_header);
            let counter_boxed = codegen.builder().build_load(codegen.lisp_object_type(), counter_alloca, "counter_boxed")
                .map_err(|e| format!("Failed to build load: {:?}", e))?
                .into_int_value();
            let unbox_counter_call = codegen.builder().build_call(unbox_fn, &[counter_boxed.into()], "unbox_counter")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let counter_val = unbox_counter_call.as_any_value_enum().into_int_value();

            let cond = codegen.builder().build_int_compare(
                inkwell::IntPredicate::SLT,
                counter_val,
                count_unboxed,
                "loop_cond"
            ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;
            codegen.builder().build_conditional_branch(cond, loop_body, loop_exit)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop body: execute body expressions with counter variable in scope
            codegen.builder().position_at_end(loop_body);
            let mut body_env = env.clone();
            body_env.insert(var.clone(), counter_alloca);
            for expr in body {
                compile_ast_to_llvm(context, codegen, expr, &mut body_env, user_functions)?;
            }

            // Increment counter in body
            let counter_boxed_inc = codegen.builder().build_load(codegen.lisp_object_type(), counter_alloca, "counter_boxed_inc")
                .map_err(|e| format!("Failed to build load: {:?}", e))?
                .into_int_value();
            let unbox_counter_inc_call = codegen.builder().build_call(unbox_fn, &[counter_boxed_inc.into()], "unbox_counter_inc")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let counter_val_inc = unbox_counter_inc_call.as_any_value_enum().into_int_value();

            let incremented = codegen.builder().build_int_add(
                counter_val_inc,
                i64_type.const_int(1, false),
                "counter_inc"
            ).map_err(|e| format!("Failed to build add: {:?}", e))?;

            let box_incremented_call = codegen.builder().build_call(box_fn, &[incremented.into()], "box_incremented")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let incremented_boxed = box_incremented_call.as_any_value_enum().into_int_value();

            codegen.builder().build_store(counter_alloca, incremented_boxed)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;
            codegen.builder().build_unconditional_branch(loop_header)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop exit: evaluate result or return NIL
            codegen.builder().position_at_end(loop_exit);
            let mut result_env = env.clone();
            result_env.insert(var.clone(), counter_alloca);
            if let Some(result_expr) = result {
                compile_ast_to_llvm(context, codegen, result_expr, &mut result_env, user_functions)
            } else {
                let nil_fn = codegen.module().get_function("cc_nil")
                    .ok_or("cc_nil not found")?;
                let nil_call = codegen.builder().build_call(nil_fn, &[], "dotimes_result")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                Ok(nil_call.as_any_value_enum().into_int_value().into())
            }
        }

        ASTNode::Dolist { var, list, result, body } => {
            let current_fn = codegen.builder().get_insert_block()
                .and_then(|bb| bb.get_parent())
                .ok_or("No current function")?;

            // Evaluate list expression
            let list_val = compile_ast_to_llvm(context, codegen, list, env, user_functions)?;

            // Create variable for current list position
            let list_alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), &format!("{}_list", var))
                .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
            codegen.builder().build_store(list_alloca, list_val)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            // Create variable for loop variable
            let var_alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), var)
                .map_err(|e| format!("Failed to build alloca: {:?}", e))?;

            // Create loop blocks
            let loop_header = context.append_basic_block(current_fn, "dolist_header");
            let loop_body = context.append_basic_block(current_fn, "dolist_body");
            let loop_exit = context.append_basic_block(current_fn, "dolist_exit");

            // Jump to header
            codegen.builder().build_unconditional_branch(loop_header)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop header: check if list is not nil
            codegen.builder().position_at_end(loop_header);
            let current_list = codegen.builder().build_load(codegen.lisp_object_type(), list_alloca, "current_list")
                .map_err(|e| format!("Failed to build load: {:?}", e))?
                .into_int_value();

            let is_nil_fn = codegen.module().get_function("cc_is_nil")
                .ok_or("cc_is_nil not found")?;
            let is_nil_call = codegen.builder().build_call(is_nil_fn, &[current_list.into()], "is_nil")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let is_nil_result = is_nil_call.as_any_value_enum().into_int_value();

            let cond = codegen.builder().build_int_compare(
                inkwell::IntPredicate::NE,
                is_nil_result,
                context.i32_type().const_zero(),
                "is_not_nil"
            ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

            codegen.builder().build_conditional_branch(cond, loop_exit, loop_body)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop body: set var to car of list, execute body, advance to cdr
            codegen.builder().position_at_end(loop_body);

            // Get car
            let car_fn = codegen.module().get_function("cc_car")
                .ok_or("cc_car not found")?;
            let car_call = codegen.builder().build_call(car_fn, &[current_list.into()], "car")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let car_val = car_call.as_any_value_enum().into_int_value();

            // Store car in loop variable
            codegen.builder().build_store(var_alloca, car_val)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            // Execute body with var in scope
            let mut body_env = env.clone();
            body_env.insert(var.clone(), var_alloca);
            for expr in body {
                compile_ast_to_llvm(context, codegen, expr, &mut body_env, user_functions)?;
            }

            // Advance to cdr
            let cdr_fn = codegen.module().get_function("cc_cdr")
                .ok_or("cc_cdr not found")?;
            let cdr_call = codegen.builder().build_call(cdr_fn, &[current_list.into()], "cdr")
                .map_err(|e| format!("Failed to build call: {:?}", e))?;
            let cdr_val = cdr_call.as_any_value_enum().into_int_value();

            codegen.builder().build_store(list_alloca, cdr_val)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            codegen.builder().build_unconditional_branch(loop_header)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop exit: evaluate result or return NIL
            codegen.builder().position_at_end(loop_exit);
            if let Some(result_expr) = result {
                compile_ast_to_llvm(context, codegen, result_expr, env, user_functions)
            } else {
                let nil_fn = codegen.module().get_function("cc_nil")
                    .ok_or("cc_nil not found")?;
                let nil_call = codegen.builder().build_call(nil_fn, &[], "dolist_result")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                Ok(nil_call.as_any_value_enum().into_int_value().into())
            }
        }

        ASTNode::Loop { var, start, limit, when_condition, collect, sum, else_collect, else_sum } => {
            let current_fn = codegen.builder().get_insert_block()
                .and_then(|bb| bb.get_parent())
                .ok_or("No current function")?;

            // Evaluate limit expression
            let limit_val = compile_ast_to_llvm(context, codegen, limit, env, user_functions)?;
            let limit_unboxed = {
                let unbox_fn = codegen.module().get_function("cc_unbox_fixnum")
                    .ok_or("cc_unbox_fixnum not found")?;
                let call = codegen.builder().build_call(unbox_fn, &[limit_val.into()], "unbox_limit")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                call.as_any_value_enum().into_int_value()
            };

            // Create counter variable
            let start_val = if let Some(start_expr) = start {
                compile_ast_to_llvm(context, codegen, start_expr, env, user_functions)?
            } else {
                let box_fn = codegen.module().get_function("cc_box_fixnum")
                    .ok_or("cc_box_fixnum not found")?;
                let call = codegen.builder().build_call(box_fn, &[context.i64_type().const_zero().into()], "box_zero")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                call.as_any_value_enum().into_int_value().into()
            };

            let counter_alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), &format!("{}_counter", var))
                .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
            codegen.builder().build_store(counter_alloca, start_val)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            // Create accumulator for collect or sum
            let accum_alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), "loop_accum")
                .map_err(|e| format!("Failed to build alloca: {:?}", e))?;

            if collect.is_some() {
                // Initialize to nil for collect
                let nil_fn = codegen.module().get_function("cc_nil")
                    .ok_or("cc_nil not found")?;
                let nil_call = codegen.builder().build_call(nil_fn, &[], "nil_result")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                let nil_val = nil_call.as_any_value_enum().into_int_value();
                codegen.builder().build_store(accum_alloca, nil_val)
                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
            } else if sum.is_some() {
                // Initialize to 0 for sum
                let box_fn = codegen.module().get_function("cc_box_fixnum")
                    .ok_or("cc_box_fixnum not found")?;
                let call = codegen.builder().build_call(box_fn, &[context.i64_type().const_zero().into()], "box_zero")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                let zero_val = call.as_any_value_enum().into_int_value();
                codegen.builder().build_store(accum_alloca, zero_val)
                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
            }

            // Create loop blocks
            let loop_header = context.append_basic_block(current_fn, "loop_header");
            let loop_body = context.append_basic_block(current_fn, "loop_body");
            let loop_exit = context.append_basic_block(current_fn, "loop_exit");

            // Jump to header
            codegen.builder().build_unconditional_branch(loop_header)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop header: check if counter < limit
            codegen.builder().position_at_end(loop_header);
            let counter_boxed = codegen.builder().build_load(codegen.lisp_object_type(), counter_alloca, "counter_boxed")
                .map_err(|e| format!("Failed to build load: {:?}", e))?
                .into_int_value();

            let counter_unboxed = {
                let unbox_fn = codegen.module().get_function("cc_unbox_fixnum")
                    .ok_or("cc_unbox_fixnum not found")?;
                let call = codegen.builder().build_call(unbox_fn, &[counter_boxed.into()], "unbox_counter")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                call.as_any_value_enum().into_int_value()
            };

            let cond = codegen.builder().build_int_compare(
                inkwell::IntPredicate::SLT,
                counter_unboxed,
                limit_unboxed,
                "loop_cond"
            ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

            codegen.builder().build_conditional_branch(cond, loop_body, loop_exit)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop body
            codegen.builder().position_at_end(loop_body);

            // Bind loop variable to counter
            let mut loop_env = env.clone();
            loop_env.insert(var.clone(), counter_alloca);

            if let Some(collect_expr) = collect {
                // Evaluate collect expression
                let elem_val = compile_ast_to_llvm(context, codegen, collect_expr, &mut loop_env, user_functions)?;

                // Cons onto accumulator
                let accum_val = codegen.builder().build_load(codegen.lisp_object_type(), accum_alloca, "accum")
                    .map_err(|e| format!("Failed to build load: {:?}", e))?
                    .into_int_value();

                let cons_fn = codegen.module().get_function("cc_cons")
                    .ok_or("cc_cons not found")?;
                let cons_call = codegen.builder().build_call(cons_fn, &[elem_val.into(), accum_val.into()], "cons_result")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                let new_accum = cons_call.as_any_value_enum().into_int_value();

                codegen.builder().build_store(accum_alloca, new_accum)
                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
            } else if let Some(sum_expr) = sum {
                // Evaluate sum expression
                let elem_val = compile_ast_to_llvm(context, codegen, sum_expr, &mut loop_env, user_functions)?;

                // Add to accumulator
                let accum_val = codegen.builder().build_load(codegen.lisp_object_type(), accum_alloca, "accum")
                    .map_err(|e| format!("Failed to build load: {:?}", e))?
                    .into_int_value();

                let add_fn = codegen.module().get_function("cc_add")
                    .ok_or("cc_add not found")?;
                let add_call = codegen.builder().build_call(add_fn, &[accum_val.into(), elem_val.into()], "add_result")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                let new_accum = add_call.as_any_value_enum().into_int_value();

                codegen.builder().build_store(accum_alloca, new_accum)
                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
            }

            // Increment counter
            let counter_unboxed_inc = {
                let unbox_fn = codegen.module().get_function("cc_unbox_fixnum")
                    .ok_or("cc_unbox_fixnum not found")?;
                let counter_boxed = codegen.builder().build_load(codegen.lisp_object_type(), counter_alloca, "counter_boxed_inc")
                    .map_err(|e| format!("Failed to build load: {:?}", e))?
                    .into_int_value();
                let call = codegen.builder().build_call(unbox_fn, &[counter_boxed.into()], "unbox_counter_inc")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                call.as_any_value_enum().into_int_value()
            };

            let counter_inc = codegen.builder().build_int_add(counter_unboxed_inc, context.i64_type().const_int(1, false), "counter_inc")
                .map_err(|e| format!("Failed to build add: {:?}", e))?;

            let counter_boxed_new = {
                let box_fn = codegen.module().get_function("cc_box_fixnum")
                    .ok_or("cc_box_fixnum not found")?;
                let call = codegen.builder().build_call(box_fn, &[counter_inc.into()], "box_incremented")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                call.as_any_value_enum().into_int_value()
            };

            codegen.builder().build_store(counter_alloca, counter_boxed_new)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            codegen.builder().build_unconditional_branch(loop_header)
                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

            // Loop exit: return accumulated result
            codegen.builder().position_at_end(loop_exit);
            let result_val = codegen.builder().build_load(codegen.lisp_object_type(), accum_alloca, "loop_result")
                .map_err(|e| format!("Failed to build load: {:?}", e))?
                .into_int_value();

            // For collect, reverse the list
            if collect.is_some() {
                let reverse_fn = codegen.module().get_function("cc_reverse")
                    .ok_or("cc_reverse not found")?;
                let reverse_call = codegen.builder().build_call(reverse_fn, &[result_val.into()], "reversed_result")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                Ok(reverse_call.as_any_value_enum().into_int_value().into())
            } else {
                Ok(result_val.into())
            }
        }

        ASTNode::Let { bindings, body } => {
            // Create a new environment scope by cloning the current one
            let mut new_env = env.clone();

            // Process each binding
            for (name, value_ast) in bindings {
                // Compile the value expression
                let value = compile_ast_to_llvm(context, codegen, value_ast, env, user_functions)?;

                // Allocate stack space for the variable
                let alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), name)
                    .map_err(|e| format!("Failed to allocate variable: {:?}", e))?;

                // Store the value
                codegen.builder().build_store(alloca, value)
                    .map_err(|e| format!("Failed to store variable: {:?}", e))?;

                // Add to new environment
                new_env.insert(name.clone(), alloca);
            }

            // Evaluate body expressions in sequence with new environment
            let mut result = None;
            for expr in body {
                result = Some(compile_ast_to_llvm(context, codegen, expr, &mut new_env, user_functions)?);
            }

            result.ok_or_else(|| "Let body cannot be empty".to_string())
        }

        ASTNode::LetStar { bindings, body } => {
            // Let* - bindings are evaluated sequentially, each can use previous ones
            let mut new_env = env.clone();

            // Process each binding sequentially in the updated environment
            for (name, value_ast) in bindings {
                // Compile value expression with current environment (can reference earlier bindings)
                let value = compile_ast_to_llvm(context, codegen, value_ast, &mut new_env, user_functions)?;

                // Allocate stack space
                let alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), name)
                    .map_err(|e| format!("Failed to allocate variable: {:?}", e))?;

                // Store the value
                codegen.builder().build_store(alloca, value)
                    .map_err(|e| format!("Failed to store variable: {:?}", e))?;

                // Add to environment immediately (so next binding can use it)
                new_env.insert(name.clone(), alloca);
            }

            // Evaluate body
            let mut result = None;
            for expr in body {
                result = Some(compile_ast_to_llvm(context, codegen, expr, &mut new_env, user_functions)?);
            }

            result.ok_or_else(|| "Let* body cannot be empty".to_string())
        }

        ASTNode::Call { function, args } => {
            if let ASTNode::Variable(op) = &**function {
                match op.as_str() {
                    "+" => {
                        if args.is_empty() {
                            // (+) returns 0
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let zero = context.i64_type().const_int(0, false);
                            let call_site = codegen.builder().build_call(
                                box_fixnum, &[zero.into()], "zero"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let result = call_site.as_any_value_enum().into_int_value();
                            Ok(result.into())
                        } else if args.len() == 1 {
                            // (+ x) returns x
                            compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                        } else {
                            // (+ x y z ...) - sum all arguments
                            let add_fn = codegen.module().get_function("cc_add")
                                .ok_or("cc_add not found")?;

                            let mut result = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                            for arg in &args[1..] {
                                let next = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                let call_site = codegen.builder().build_call(
                                    add_fn, &[result.into(), next.into()], "add_result"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                result = call_site.as_any_value_enum().into_int_value().into();
                            }
                            Ok(result)
                        }
                    }
                    "-" => {
                        if args.is_empty() {
                            return Err("- requires at least one argument".to_string());
                        } else if args.len() == 1 {
                            // (- x) returns negation: 0 - x
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let zero = context.i64_type().const_int(0, false);
                            let zero_call = codegen.builder().build_call(
                                box_fixnum, &[zero.into()], "zero"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let zero_val = zero_call.as_any_value_enum().into_int_value();

                            let arg_val = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                            let sub_fn = codegen.module().get_function("cc_sub")
                                .ok_or("cc_sub not found")?;
                            let call_site = codegen.builder().build_call(
                                sub_fn, &[zero_val.into(), arg_val.into()], "neg_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let result = call_site.as_any_value_enum().into_int_value();
                            Ok(result.into())
                        } else {
                            // (- x y z ...) - subtract all from first
                            let sub_fn = codegen.module().get_function("cc_sub")
                                .ok_or("cc_sub not found")?;

                            let mut result = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                            for arg in &args[1..] {
                                let next = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                let call_site = codegen.builder().build_call(
                                    sub_fn, &[result.into(), next.into()], "sub_result"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                result = call_site.as_any_value_enum().into_int_value().into();
                            }
                            Ok(result)
                        }
                    }
                    "*" => {
                        if args.is_empty() {
                            // (*) returns 1
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let one = context.i64_type().const_int(1, false);
                            let call_site = codegen.builder().build_call(
                                box_fixnum, &[one.into()], "one"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let result = call_site.as_any_value_enum().into_int_value();
                            Ok(result.into())
                        } else if args.len() == 1 {
                            // (* x) returns x
                            compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                        } else {
                            // (* x y z ...) - multiply all arguments
                            let mul_fn = codegen.module().get_function("cc_mul")
                                .ok_or("cc_mul not found")?;

                            let mut result = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                            for arg in &args[1..] {
                                let next = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                let call_site = codegen.builder().build_call(
                                    mul_fn, &[result.into(), next.into()], "mul_result"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                result = call_site.as_any_value_enum().into_int_value().into();
                            }
                            Ok(result)
                        }
                    }
                    "/" => {
                        if args.is_empty() {
                            return Err("/ requires at least one argument".to_string());
                        } else if args.len() == 1 {
                            // (/ x) returns reciprocal: 1 / x
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let one = context.i64_type().const_int(1, false);
                            let one_call = codegen.builder().build_call(
                                box_fixnum, &[one.into()], "one"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let one_val = one_call.as_any_value_enum().into_int_value();

                            let arg_val = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                            let div_fn = codegen.module().get_function("cc_div")
                                .ok_or("cc_div not found")?;
                            let call_site = codegen.builder().build_call(
                                div_fn, &[one_val.into(), arg_val.into()], "recip_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let result = call_site.as_any_value_enum().into_int_value();
                            Ok(result.into())
                        } else {
                            // (/ x y z ...) - divide first by rest
                            let div_fn = codegen.module().get_function("cc_div")
                                .ok_or("cc_div not found")?;

                            let mut result = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                            for arg in &args[1..] {
                                let next = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                let call_site = codegen.builder().build_call(
                                    div_fn, &[result.into(), next.into()], "div_result"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                result = call_site.as_any_value_enum().into_int_value().into();
                            }
                            Ok(result)
                        }
                    }

                    "1+" if args.len() == 1 => {
                        // (1+ x) returns x + 1
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                            .ok_or("cc_box_fixnum not found")?;
                        let one = context.i64_type().const_int(1, false);
                        let one_call = codegen.builder().build_call(
                            box_fixnum, &[one.into()], "one"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let one_val = one_call.as_any_value_enum().into_int_value();

                        let add_fn = codegen.module().get_function("cc_add")
                            .ok_or("cc_add not found")?;
                        let call_site = codegen.builder().build_call(
                            add_fn, &[arg.into(), one_val.into()], "inc_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "1-" if args.len() == 1 => {
                        // (1- x) returns x - 1
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                            .ok_or("cc_box_fixnum not found")?;
                        let one = context.i64_type().const_int(1, false);
                        let one_call = codegen.builder().build_call(
                            box_fixnum, &[one.into()], "one"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let one_val = one_call.as_any_value_enum().into_int_value();

                        let sub_fn = codegen.module().get_function("cc_sub")
                            .ok_or("cc_sub not found")?;
                        let call_site = codegen.builder().build_call(
                            sub_fn, &[arg.into(), one_val.into()], "dec_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "incf" if args.len() >= 1 && args.len() <= 2 => {
                        // (incf place [delta]) - increment place by delta (default 1)
                        match &args[0] {
                            ASTNode::Variable(var_name) => {
                                let var_ptr = *env.get(var_name)
                                    .ok_or_else(|| format!("Undefined variable: {}", var_name))?;

                                // Load current value
                                let current = codegen.builder().build_load(codegen.lisp_object_type(), var_ptr, "current")
                                    .map_err(|e| format!("Failed to load: {:?}", e))?;

                                // Get delta (default 1)
                                let delta = if args.len() == 2 {
                                    compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?
                                } else {
                                    let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                        .ok_or("cc_box_fixnum not found")?;
                                    let one = context.i64_type().const_int(1, false);
                                    codegen.builder().build_call(box_fixnum, &[one.into()], "one")
                                        .map_err(|e| format!("Failed to build call: {:?}", e))?
                                        .as_any_value_enum().into_int_value().into()
                                };

                                // Add delta
                                let add_fn = codegen.module().get_function("cc_add")
                                    .ok_or("cc_add not found")?;
                                let new_val = codegen.builder().build_call(
                                    add_fn, &[current.into(), delta.into()], "incf_result"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                    .as_any_value_enum().into_int_value();

                                // Store back
                                codegen.builder().build_store(var_ptr, new_val)
                                    .map_err(|e| format!("Failed to store: {:?}", e))?;

                                Ok(new_val.into())
                            }
                            ASTNode::Call { function, args: place_args } => {
                                if let ASTNode::Variable(fname) = function.as_ref() {
                                    if fname == "gethash" && place_args.len() >= 2 {
                                        // (incf (gethash key table) [delta])
                                        let key = compile_ast_to_llvm(context, codegen, &place_args[0], env, user_functions)?;
                                        let table = compile_ast_to_llvm(context, codegen, &place_args[1], env, user_functions)?;

                                        // Get current value
                                        let gethash_fn = codegen.module().get_function("cc_gethash")
                                            .ok_or("cc_gethash not found")?;
                                        let nil_fn = codegen.module().get_function("cc_nil")
                                            .ok_or("cc_nil not found")?;
                                        let nil_val = codegen.builder().build_call(nil_fn, &[], "nil")
                                            .map_err(|e| format!("Failed to build call: {:?}", e))?
                                            .as_any_value_enum().into_int_value();
                                        let current = codegen.builder().build_call(
                                            gethash_fn, &[key.into(), table.into(), nil_val.into()], "current"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                            .as_any_value_enum().into_int_value();

                                        // Get delta
                                        let delta = if args.len() == 2 {
                                            compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?
                                        } else {
                                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                                .ok_or("cc_box_fixnum not found")?;
                                            let one = context.i64_type().const_int(1, false);
                                            codegen.builder().build_call(box_fixnum, &[one.into()], "one")
                                                .map_err(|e| format!("Failed to build call: {:?}", e))?
                                                .as_any_value_enum().into_int_value().into()
                                        };

                                        // Add delta
                                        let add_fn = codegen.module().get_function("cc_add")
                                            .ok_or("cc_add not found")?;
                                        let new_val = codegen.builder().build_call(
                                            add_fn, &[current.into(), delta.into()], "incf_result"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                            .as_any_value_enum().into_int_value();

                                        // Set new value
                                        let puthash_fn = codegen.module().get_function("cc_puthash")
                                            .ok_or("cc_puthash not found")?;
                                        codegen.builder().build_call(
                                            puthash_fn, &[key.into(), new_val.into(), table.into()], "puthash"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                                        Ok(new_val.into())
                                    } else if fname == "car" && place_args.len() == 1 {
                                        // (incf (car list) [delta])
                                        let list_val = compile_ast_to_llvm(context, codegen, &place_args[0], env, user_functions)?;

                                        // Get current value of car
                                        let car_fn = codegen.module().get_function("cc_car")
                                            .ok_or("cc_car not found")?;
                                        let current = codegen.builder().build_call(
                                            car_fn, &[list_val.into()], "current_car"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                            .as_any_value_enum().into_int_value();

                                        // Get delta
                                        let delta = if args.len() == 2 {
                                            compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?
                                        } else {
                                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                                .ok_or("cc_box_fixnum not found")?;
                                            let one = context.i64_type().const_int(1, false);
                                            codegen.builder().build_call(box_fixnum, &[one.into()], "one")
                                                .map_err(|e| format!("Failed to build call: {:?}", e))?
                                                .as_any_value_enum().into_int_value().into()
                                        };

                                        // Add delta
                                        let add_fn = codegen.module().get_function("cc_add")
                                            .ok_or("cc_add not found")?;
                                        let new_val = codegen.builder().build_call(
                                            add_fn, &[current.into(), delta.into()], "incf_result"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                            .as_any_value_enum().into_int_value();

                                        // Set new value with cc_set_car
                                        let set_car_fn = codegen.module().get_function("cc_set_car")
                                            .ok_or("cc_set_car not found")?;
                                        codegen.builder().build_call(
                                            set_car_fn, &[list_val.into(), new_val.into()], "set_car"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                                        Ok(new_val.into())
                                    } else {
                                        Err(format!("incf: unsupported place form {}", fname))
                                    }
                                } else {
                                    Err("incf: place must be a variable or function call".to_string())
                                }
                            }
                            _ => Err("incf requires a variable reference or place form as first argument".to_string())
                        }
                    }

                    "decf" if args.len() >= 1 && args.len() <= 2 => {
                        // (decf place [delta]) - decrement place by delta (default 1)
                        if let ASTNode::Variable(var_name) = &args[0] {
                            let var_ptr = *env.get(var_name)
                                .ok_or_else(|| format!("Undefined variable: {}", var_name))?;

                            // Load current value
                            let current = codegen.builder().build_load(codegen.lisp_object_type(), var_ptr, "current")
                                .map_err(|e| format!("Failed to load: {:?}", e))?;

                            // Get delta (default 1)
                            let delta = if args.len() == 2 {
                                compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?
                            } else {
                                let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                    .ok_or("cc_box_fixnum not found")?;
                                let one = context.i64_type().const_int(1, false);
                                codegen.builder().build_call(box_fixnum, &[one.into()], "one")
                                    .map_err(|e| format!("Failed to build call: {:?}", e))?
                                    .as_any_value_enum().into_int_value().into()
                            };

                            // Subtract delta
                            let sub_fn = codegen.module().get_function("cc_sub")
                                .ok_or("cc_sub not found")?;
                            let new_val = codegen.builder().build_call(
                                sub_fn, &[current.into(), delta.into()], "decf_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            // Store back
                            codegen.builder().build_store(var_ptr, new_val)
                                .map_err(|e| format!("Failed to store: {:?}", e))?;

                            Ok(new_val.into())
                        } else {
                            Err("decf requires a variable reference as first argument".to_string())
                        }
                    }

                    "setf" if args.len() == 2 => {
                        // (setf place value) - set place to value
                        match &args[0] {
                            ASTNode::Variable(var_name) => {
                                let var_ptr = *env.get(var_name)
                                    .ok_or_else(|| format!("Undefined variable: {}", var_name))?;

                                // Compile the value expression
                                let value = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                                // Store the value
                                codegen.builder().build_store(var_ptr, value)
                                    .map_err(|e| format!("Failed to store: {:?}", e))?;

                                // Return the value
                                Ok(value)
                            }
                            ASTNode::Call { function, args: call_args } => {
                                // Handle (setf (gethash key table) value)
                                if let ASTNode::Variable(fname) = function.as_ref() {
                                    if fname == "gethash" && call_args.len() >= 2 {
                                        let key = compile_ast_to_llvm(context, codegen, &call_args[0], env, user_functions)?;
                                        let table = compile_ast_to_llvm(context, codegen, &call_args[1], env, user_functions)?;
                                        let value = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                                        let puthash_fn = codegen.module().get_function("cc_puthash")
                                            .ok_or("cc_puthash not found")?;
                                        let call_site = codegen.builder().build_call(
                                            puthash_fn, &[key.into(), value.into(), table.into()], "puthash_result"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                        let result = call_site.as_any_value_enum().into_int_value();
                                        Ok(result.into())
                                    } else if fname == "cadr" && call_args.len() == 1 {
                                        // (setf (cadr list) value) - set second element
                                        let list_val = compile_ast_to_llvm(context, codegen, &call_args[0], env, user_functions)?;
                                        let new_value = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                                        // Get cdr of list (second cons cell)
                                        let cdr_fn = codegen.module().get_function("cc_cdr")
                                            .ok_or("cc_cdr not found")?;
                                        let cdr_call = codegen.builder().build_call(
                                            cdr_fn, &[list_val.into()], "cdr_for_setf"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                        let cdr_val = cdr_call.as_any_value_enum().into_int_value();

                                        // Set car of that cell
                                        let set_car_fn = codegen.module().get_function("cc_set_car")
                                            .ok_or("cc_set_car not found")?;
                                        let set_call = codegen.builder().build_call(
                                            set_car_fn, &[cdr_val.into(), new_value.into()], "setf_cadr"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                        Ok(set_call.as_any_value_enum().into_int_value().into())
                                    } else if fname == "car" && call_args.len() == 1 {
                                        // (setf (car list) value)
                                        let list_val = compile_ast_to_llvm(context, codegen, &call_args[0], env, user_functions)?;
                                        let new_value = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                                        let set_car_fn = codegen.module().get_function("cc_set_car")
                                            .ok_or("cc_set_car not found")?;
                                        let set_call = codegen.builder().build_call(
                                            set_car_fn, &[list_val.into(), new_value.into()], "setf_car"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                        Ok(set_call.as_any_value_enum().into_int_value().into())
                                    } else if fname == "char" && call_args.len() == 2 {
                                        // (setf (char string index) value)
                                        let string_val = compile_ast_to_llvm(context, codegen, &call_args[0], env, user_functions)?;
                                        let index_val = compile_ast_to_llvm(context, codegen, &call_args[1], env, user_functions)?;
                                        let char_val = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                                        let set_char_fn = codegen.module().get_function("cc_set_char")
                                            .ok_or("cc_set_char not found")?;
                                        let set_call = codegen.builder().build_call(
                                            set_char_fn, &[string_val.into(), index_val.into(), char_val.into()], "setf_char"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                        Ok(set_call.as_any_value_enum().into_int_value().into())
                                    } else if fname == "aref" && call_args.len() == 2 {
                                        // (setf (aref array index) value)
                                        let array_val = compile_ast_to_llvm(context, codegen, &call_args[0], env, user_functions)?;
                                        let index_val = compile_ast_to_llvm(context, codegen, &call_args[1], env, user_functions)?;
                                        let new_value = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                                        let set_aref_fn = codegen.module().get_function("cc_set_aref")
                                            .ok_or("cc_set_aref not found")?;
                                        let set_call = codegen.builder().build_call(
                                            set_aref_fn, &[array_val.into(), index_val.into(), new_value.into()], "setf_aref"
                                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                        Ok(set_call.as_any_value_enum().into_int_value().into())
                                    } else {
                                        Err(format!("setf: unsupported place form {}", fname))
                                    }
                                } else {
                                    Err("setf: place must be a variable or function call".to_string())
                                }
                            }
                            _ => Err("setf requires a variable reference or function call as first argument".to_string())
                        }
                    }

                    "push" if args.len() == 2 => {
                        // (push item place) - add item to front of list stored in place
                        // Equivalent to (setf place (cons item place))
                        if let ASTNode::Variable(var_name) = &args[1] {
                            let var_ptr = *env.get(var_name)
                                .ok_or_else(|| format!("Undefined variable: {}", var_name))?;

                            // Load current value
                            let current = codegen.builder().build_load(codegen.lisp_object_type(), var_ptr, "current")
                                .map_err(|e| format!("Failed to load: {:?}", e))?;

                            // Compile the item to push
                            let item = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                            // cons item onto current list
                            let cons_fn = codegen.module().get_function("cc_cons")
                                .ok_or("cc_cons not found")?;
                            let new_list = codegen.builder().build_call(
                                cons_fn, &[item.into(), current.into()], "push_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            // Store back
                            codegen.builder().build_store(var_ptr, new_list)
                                .map_err(|e| format!("Failed to store: {:?}", e))?;

                            // Return the new list
                            Ok(new_list.into())
                        } else {
                            Err("push requires a variable reference as second argument".to_string())
                        }
                    }

                    "reduce" if args.len() == 2 => {
                        // (reduce #'+ list) or (reduce function list)
                        // Get the function name from #'name or function
                        let func_name = match &args[0] {
                            ASTNode::Call { function, args: func_args } => {
                                // Handle #'+ which parses as (function +)
                                if let ASTNode::Variable(fname) = function.as_ref() {
                                    if fname == "function" && func_args.len() == 1 {
                                        if let ASTNode::Variable(op_name) = &func_args[0] {
                                            op_name.clone()
                                        } else {
                                            return Err("reduce: unsupported function form".to_string());
                                        }
                                    } else {
                                        return Err("reduce: unsupported function form".to_string());
                                    }
                                } else {
                                    return Err("reduce: unsupported function form".to_string());
                                }
                            }
                            _ => return Err("reduce requires #'function as first argument".to_string()),
                        };

                        // Compile the list
                        let list_val = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        // Get the operation function
                        let op_fn = match func_name.as_str() {
                            "+" => codegen.module().get_function("cc_add").ok_or("cc_add not found")?,
                            "*" => codegen.module().get_function("cc_mul").ok_or("cc_mul not found")?,
                            "-" => codegen.module().get_function("cc_sub").ok_or("cc_sub not found")?,
                            _ => return Err(format!("reduce: unsupported function {}", func_name)),
                        };

                        let current_fn = codegen.builder().get_insert_block()
                            .and_then(|bb| bb.get_parent())
                            .ok_or("No current function")?;

                        // Create blocks
                        let loop_header = context.append_basic_block(current_fn, "reduce_header");
                        let loop_body = context.append_basic_block(current_fn, "reduce_body");
                        let loop_exit = context.append_basic_block(current_fn, "reduce_exit");

                        // Allocate accumulator and list pointer
                        let acc_alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), "acc")
                            .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
                        let list_alloca = codegen.builder().build_alloca(codegen.lisp_object_type(), "reduce_list")
                            .map_err(|e| format!("Failed to build alloca: {:?}", e))?;

                        // Initialize - first element as accumulator, rest as list
                        let car_fn = codegen.module().get_function("cc_car").ok_or("cc_car not found")?;
                        let cdr_fn = codegen.module().get_function("cc_cdr").ok_or("cc_cdr not found")?;

                        let first_elem = codegen.builder().build_call(car_fn, &[list_val.into()], "first")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();
                        let rest_list = codegen.builder().build_call(cdr_fn, &[list_val.into()], "rest")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        codegen.builder().build_store(acc_alloca, first_elem)
                            .map_err(|e| format!("Failed to store: {:?}", e))?;
                        codegen.builder().build_store(list_alloca, rest_list)
                            .map_err(|e| format!("Failed to store: {:?}", e))?;

                        codegen.builder().build_unconditional_branch(loop_header)
                            .map_err(|e| format!("Failed to branch: {:?}", e))?;

                        // Loop header: check if list is nil
                        codegen.builder().position_at_end(loop_header);
                        let current_list = codegen.builder().build_load(codegen.lisp_object_type(), list_alloca, "current")
                            .map_err(|e| format!("Failed to load: {:?}", e))?
                            .into_int_value();

                        let is_nil_fn = codegen.module().get_function("cc_is_nil").ok_or("cc_is_nil not found")?;
                        let is_nil = codegen.builder().build_call(is_nil_fn, &[current_list.into()], "is_nil")
                            .map_err(|e| format!("Failed to call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        let cond = codegen.builder().build_int_compare(
                            inkwell::IntPredicate::NE,
                            is_nil,
                            context.i32_type().const_zero(),
                            "not_nil"
                        ).map_err(|e| format!("Failed to compare: {:?}", e))?;

                        codegen.builder().build_conditional_branch(cond, loop_exit, loop_body)
                            .map_err(|e| format!("Failed to branch: {:?}", e))?;

                        // Loop body: acc = op(acc, car(list)), list = cdr(list)
                        codegen.builder().position_at_end(loop_body);
                        let acc_val = codegen.builder().build_load(codegen.lisp_object_type(), acc_alloca, "acc_val")
                            .map_err(|e| format!("Failed to load: {:?}", e))?
                            .into_int_value();
                        let elem = codegen.builder().build_call(car_fn, &[current_list.into()], "elem")
                            .map_err(|e| format!("Failed to call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        let new_acc = codegen.builder().build_call(op_fn, &[acc_val.into(), elem.into()], "new_acc")
                            .map_err(|e| format!("Failed to call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        codegen.builder().build_store(acc_alloca, new_acc)
                            .map_err(|e| format!("Failed to store: {:?}", e))?;

                        let next_list = codegen.builder().build_call(cdr_fn, &[current_list.into()], "next")
                            .map_err(|e| format!("Failed to call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        codegen.builder().build_store(list_alloca, next_list)
                            .map_err(|e| format!("Failed to store: {:?}", e))?;

                        codegen.builder().build_unconditional_branch(loop_header)
                            .map_err(|e| format!("Failed to branch: {:?}", e))?;

                        // Exit: return accumulator
                        codegen.builder().position_at_end(loop_exit);
                        let result = codegen.builder().build_load(codegen.lisp_object_type(), acc_alloca, "result")
                            .map_err(|e| format!("Failed to load: {:?}", e))?;
                        Ok(result)
                    }

                    "mod" if args.len() == 2 => {
                        let left = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let right = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let mod_fn = codegen.module().get_function("cc_mod")
                            .ok_or("cc_mod not found")?;
                        let call_site = codegen.builder().build_call(
                            mod_fn, &[left.into(), right.into()], "mod_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "expt" if args.len() == 2 => {
                        let base = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let power = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let expt_fn = codegen.module().get_function("cc_expt")
                            .ok_or("cc_expt not found")?;
                        let call_site = codegen.builder().build_call(
                            expt_fn, &[base.into(), power.into()], "expt_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "sqrt" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let sqrt_fn = codegen.module().get_function("cc_sqrt")
                            .ok_or("cc_sqrt not found")?;
                        let call_site = codegen.builder().build_call(
                            sqrt_fn, &[arg.into()], "sqrt_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "system" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let system_fn = codegen.module().get_function("cc_system")
                            .ok_or("cc_system not found")?;
                        let call_site = codegen.builder().build_call(
                            system_fn, &[arg.into()], "system_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "declare" => {
                        // Declarations are compile-time only, return NIL at runtime
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(
                            nil_fn, &[], "declare_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "the" if args.len() == 2 => {
                        // (the type value) - type hint, ignore type and return value
                        compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)
                    }

                    "function" if args.len() == 1 => {
                        // (function name) or #'name - return function pointer
                        if let ASTNode::Variable(name) = &args[0] {
                            // Check if it's a user-defined function
                            if user_functions.contains_key(name) {
                                let func = codegen.module().get_function(name)
                                    .ok_or(format!("Function {} not found", name))?;
                                let fn_ptr = func.as_global_value().as_pointer_value();
                                let fn_ptr_int = codegen.builder().build_ptr_to_int(
                                    fn_ptr,
                                    context.i64_type(),
                                    "fn_ptr_int"
                                ).map_err(|e| format!("Failed to build ptr_to_int: {:?}", e))?;

                                // Box the function pointer
                                let box_fn = codegen.module().get_function("cc_box_function_ptr")
                                    .ok_or("cc_box_function_ptr not found")?;
                                let boxed_call = codegen.builder().build_call(
                                    box_fn, &[fn_ptr_int.into()], "boxed_fn"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                Ok(boxed_call.as_any_value_enum().into_int_value().into())
                            } else {
                                // For builtins and unknown functions, just return a symbol for now
                                let make_symbol_fn = codegen.module().get_function("cc_make_symbol")
                                    .ok_or("cc_make_symbol not found")?;

                                let i8_type = context.i8_type();
                                let string_type = i8_type.array_type(name.len() as u32);
                                let global = codegen.module().add_global(string_type, None, "fn_symbol");
                                global.set_initializer(&context.const_string(name.as_bytes(), false));
                                global.set_constant(true);

                                let ptr = codegen.builder().build_pointer_cast(
                                    global.as_pointer_value(),
                                    context.ptr_type(inkwell::AddressSpace::default()),
                                    "fn_symbol_ptr"
                                ).map_err(|e| format!("Failed to cast pointer: {:?}", e))?;

                                let len_val = context.i64_type().const_int(name.len() as u64, false);
                                let call_site = codegen.builder().build_call(
                                    make_symbol_fn, &[ptr.into(), len_val.into()], "fn_symbol"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                                Ok(call_site.as_any_value_enum().into_int_value().into())
                            }
                        } else {
                            Err("function: argument must be a symbol".to_string())
                        }
                    }

                    "multiple-value-bind" if args.len() >= 2 => {
                        // (multiple-value-bind (var1 var2 ...) values-form body...)
                        // Simplified: bind first var to result, others to NIL

                        // Extract variable names - handle both Call{list/quote} and direct call
                        let vars: Vec<String> = if let ASTNode::Call { function, args: var_list } = &args[0] {
                            // Check if it's a quoted or list call
                            if let ASTNode::Variable(list_name) = function.as_ref() {
                                if list_name == "list" || list_name == "quote" {
                                    var_list.iter().filter_map(|arg| {
                                        if let ASTNode::Variable(v) = arg {
                                            Some(v.clone())
                                        } else {
                                            None
                                        }
                                    }).collect()
                                } else {
                                    // It's a regular call, extract just function and args as vars
                                    let mut vars_vec = vec![list_name.clone()];
                                    vars_vec.extend(var_list.iter().filter_map(|arg| {
                                        if let ASTNode::Variable(v) = arg {
                                            Some(v.clone())
                                        } else {
                                            None
                                        }
                                    }));
                                    vars_vec
                                }
                            } else {
                                return Err("multiple-value-bind: first argument must be variables".to_string());
                            }
                        } else {
                            return Err("multiple-value-bind: first argument must be a list of variables".to_string());
                        };

                        // Compile the values form
                        let values_result = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        // Allocate variables: first gets the result, rest get NIL
                        let i64_type = context.i64_type();
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let nil_call = codegen.builder().build_call(nil_fn, &[], "nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let nil_val = nil_call.as_any_value_enum().into_int_value();

                        for (i, var) in vars.iter().enumerate() {
                            let alloca = codegen.builder().build_alloca(i64_type, var)
                                .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
                            if i == 0 {
                                codegen.builder().build_store(alloca, values_result)
                                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
                            } else {
                                codegen.builder().build_store(alloca, nil_val)
                                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
                            }
                            env.insert(var.clone(), alloca);
                        }

                        // Compile body
                        let mut result = nil_val.into();
                        for expr in &args[2..] {
                            result = compile_ast_to_llvm(context, codegen, expr, env, user_functions)?;
                        }

                        // Clean up environment
                        for var in vars {
                            env.remove(&var);
                        }

                        Ok(result)
                    }

                    "defpackage" => {
                        // Package system not implemented, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(
                            nil_fn, &[], "defpackage_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "ratio" if args.len() == 2 => {
                        // Ratio not fully supported, just divide numerator by denominator
                        let numerator = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let denominator = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;
                        let div_fn = codegen.module().get_function("cc_div")
                            .ok_or("cc_div not found")?;
                        let call_site = codegen.builder().build_call(
                            div_fn, &[numerator.into(), denominator.into()], "ratio_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "complex" if args.len() >= 1 => {
                        // Complex not fully supported, just return the real part
                        compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                    }

                    "round" if args.len() >= 1 => {
                        // Round to nearest integer
                        let val = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        // For now, just call the runtime round function
                        let round_fn = codegen.module().get_function("cc_round")
                            .ok_or("cc_round not found")?;
                        let call_site = codegen.builder().build_call(round_fn, &[val.into()], "round")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "x" | "y" if args.len() == 1 => {
                        // CLOS accessor functions (x p) or (y p)
                        // For now, just call a runtime accessor function
                        let obj = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let accessor_name = format!("cc_accessor_{}", op);
                        let accessor_fn = codegen.module().get_function(&accessor_name)
                            .ok_or_else(|| format!("{} not found", accessor_name))?;
                        let call_site = codegen.builder().build_call(accessor_fn, &[obj.into()], &format!("accessor_{}", op))
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "tagbody" => {
                        // Full tagbody implementation with labels and go support
                        let current_fn = codegen.builder().get_insert_block()
                            .and_then(|bb| bb.get_parent())
                            .ok_or("No current function for tagbody")?;

                        // First pass: identify labels and create basic blocks
                        let mut label_blocks = std::collections::HashMap::new();
                        let mut label_names = Vec::new();

                        for arg in args {
                            if let ASTNode::Variable(label) = arg {
                                let block = context.append_basic_block(current_fn, &format!("tagbody_{}", label));
                                label_blocks.insert(label.clone(), block);
                                label_names.push(label.clone());
                            }
                        }

                        let exit_block = context.append_basic_block(current_fn, "tagbody_exit");

                        // Store label blocks in env with special prefix for go statements
                        for (label, block_val) in &label_blocks {
                            // We can't store BasicBlock directly in env, so we'll handle go separately
                        }

                        // Second pass: compile statements and labels
                        let mut current_label: Option<String> = None;
                        let mut positioned = false;

                        for arg in args {
                            match arg {
                                ASTNode::Variable(label) => {
                                    // This is a label - branch to it and position builder
                                    if !positioned {
                                        // First label or after some code - branch to it
                                        let label_block = label_blocks.get(label)
                                            .ok_or(format!("Label {} not found", label))?;
                                        codegen.builder().build_unconditional_branch(*label_block)
                                            .map_err(|e| format!("Failed to branch: {:?}", e))?;
                                    }
                                    let label_block = label_blocks.get(label)
                                        .ok_or(format!("Label {} not found", label))?;
                                    codegen.builder().position_at_end(*label_block);
                                    current_label = Some(label.clone());
                                    positioned = true;
                                }
                                ASTNode::Call { function, args: call_args } => {
                                    // Check if this is a go statement
                                    if let ASTNode::Variable(fname) = function.as_ref() {
                                        if fname == "go" && call_args.len() == 1 {
                                            if let ASTNode::Variable(target_label) = &call_args[0] {
                                                let target_block = label_blocks.get(target_label)
                                                    .ok_or(format!("go: label {} not found", target_label))?;
                                                codegen.builder().build_unconditional_branch(*target_block)
                                                    .map_err(|e| format!("Failed to branch: {:?}", e))?;
                                                positioned = false;
                                                continue;
                                            }
                                        }
                                    }
                                    // Regular call
                                    if positioned {
                                        compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                    }
                                }
                                _ => {
                                    // Regular statement
                                    if positioned {
                                        compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                    }
                                }
                            }
                        }

                        // Branch to exit if we haven't already branched elsewhere
                        if positioned {
                            codegen.builder().build_unconditional_branch(exit_block)
                                .map_err(|e| format!("Failed to branch: {:?}", e))?;
                        }

                        // Position at exit and return nil
                        codegen.builder().position_at_end(exit_block);
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "tagbody_nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "go" if args.len() == 1 => {
                        // go is handled within tagbody context
                        // If we reach here, it's outside tagbody - return nil
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "go_nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "flet" | "labels" if args.len() >= 1 => {
                        // Full flet/labels implementation with local functions
                        let is_labels = op == "labels";

                        // args[0] contains function definitions as a list
                        // args[1..] is the body

                        // Extract function definitions
                        // The structure is: Call { function: <def>, args: [] }
                        // where <def> is Call { function: Variable(name), args: [params, body...] }
                        let mut func_defs_vec = Vec::new();
                        if let ASTNode::Call { function: def, args: empty_args } = &args[0] {
                            // Single definition or list of definitions
                            func_defs_vec.push(def.as_ref());
                        } else {
                            return Err("flet/labels: first argument must be function definitions".to_string());
                        }
                        let func_defs = &func_defs_vec;

                        // Save current insert point
                        let saved_bb = codegen.builder().get_insert_block();

                        // Create local functions
                        let mut local_funcs = std::collections::HashMap::new();

                        for def in func_defs {
                            // def is Call { function: Variable(name), args: [params_node, body...] }
                            if let ASTNode::Call { function: name_node, args: func_def_parts } = def {
                                if let ASTNode::Variable(func_name) = name_node.as_ref() {
                                    // func_def_parts should be [params, body...]
                                    if func_def_parts.len() >= 2 {
                                        // Extract parameters from first element
                                        // Parameter structure is Call { function: Variable(param_name), args: [] }
                                        let params = if let ASTNode::Call { function: param_var, args: _ } = &func_def_parts[0] {
                                            if let ASTNode::Variable(param_name) = param_var.as_ref() {
                                                vec![param_name.clone()]
                                            } else {
                                                Vec::new()
                                            }
                                        } else {
                                            Vec::new()
                                        };

                                        // Create function - always use the original Lisp name
                                        let i64_type = context.i64_type();
                                        let param_types: Vec<_> = params.iter().map(|_| i64_type.into()).collect();
                                        let fn_type = i64_type.fn_type(&param_types, false);

                                        // Always delete and recreate to ensure clean state
                                        if let Some(existing) = codegen.module().get_function(func_name) {
                                            unsafe { existing.delete(); }
                                        }

                                        // Create the function
                                        let local_func = codegen.module().add_function(func_name, fn_type, None);

                                        // Immediately create entry block to ensure function is valid
                                        let entry_bb = context.append_basic_block(local_func, "entry_placeholder");

                                        local_funcs.insert(func_name.clone(), (local_func, params.clone(), func_def_parts[1..].to_vec()));
                                    }
                                }
                            }
                        }

                        // For labels, functions can see each other
                        let mut local_user_functions = user_functions.clone();
                        if is_labels {
                            for (name, (_, params, _)) in &local_funcs {
                                local_user_functions.insert(name.clone(), params.clone());
                            }
                        }

                        // Compile function bodies
                        for (func_name, (local_func, params, body)) in &local_funcs {
                            // Use existing entry block or create new one
                            let entry_bb = if let Some(bb) = local_func.get_first_basic_block() {
                                bb
                            } else {
                                context.append_basic_block(*local_func, "entry")
                            };
                            codegen.builder().position_at_end(entry_bb);

                            // Create environment with parameters
                            let mut func_env = env.clone();
                            let i64_type = context.i64_type();
                            for (i, param_name) in params.iter().enumerate() {
                                let param_val = local_func.get_nth_param(i as u32)
                                    .ok_or(format!("Missing parameter {}", i))?
                                    .into_int_value();
                                let alloca = codegen.builder().build_alloca(i64_type, param_name)
                                    .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
                                codegen.builder().build_store(alloca, param_val)
                                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
                                func_env.insert(param_name.clone(), alloca);
                            }

                            // Compile body
                            let mut result = None;
                            for expr in body {
                                result = Some(compile_ast_to_llvm(context, codegen, expr, &mut func_env, &local_user_functions)?);
                            }

                            let return_val = result.ok_or("flet/labels: empty function body")?;
                            codegen.builder().build_return(Some(&return_val.into_int_value()))
                                .map_err(|e| format!("Failed to build return: {:?}", e))?;
                        }

                        // Restore insert point
                        if let Some(bb) = saved_bb {
                            codegen.builder().position_at_end(bb);
                        }

                        // For BOTH flet and labels, add functions to body_user_functions
                        // This ensures local functions can be called from the body
                        let mut body_user_functions = user_functions.clone();
                        for (name, (local_func, params, _)) in &local_funcs {
                            body_user_functions.insert(name.clone(), params.clone());
                            // Verify function exists in module
                            if codegen.module().get_function(name).is_none() {
                                // Function not in module yet, this is a problem
                                // Try to add it again
                                let i64_type = context.i64_type();
                                let param_types: Vec<_> = params.iter().map(|_| i64_type.into()).collect();
                                let fn_type = i64_type.fn_type(&param_types, false);
                                codegen.module().add_function(name, fn_type, None);
                            } else {
                            }
                        }

                        // Compile body
                        if args.len() >= 2 {
                            let mut result = None;
                            for expr in &args[1..] {
                                result = Some(compile_ast_to_llvm(context, codegen, expr, env, &body_user_functions)?);
                            }
                            result.ok_or_else(|| "flet/labels: no body".to_string())
                        } else {
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;
                            let call_site = codegen.builder().build_call(nil_fn, &[], "flet_nil")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            Ok(call_site.as_any_value_enum().into_int_value().into())
                        }
                    }

                    "defmacro" | "macrolet" | "symbol-macrolet" => {
                        // Macro system not implemented, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "macro_nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "eval" if args.len() == 1 => {
                        // eval not fully supported, just return the argument compiled
                        compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                    }

                    "compile" if args.len() >= 1 => {
                        // compile not supported, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "compile_nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "read-from-string" if args.len() >= 1 => {
                        // read-from-string not supported, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "read_nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "handler-case" if args.len() >= 1 => {
                        // Simplified handler-case: just execute body, ignore error handlers
                        compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                    }

                    "fboundp" if args.len() == 1 => {
                        // Check if function is bound
                        if let ASTNode::Quote(quoted) = &args[0] {
                            if let ASTNode::Variable(name) = quoted.as_ref() {
                                let t_fn = codegen.module().get_function("cc_t")
                                    .ok_or("cc_t not found")?;
                                let nil_fn = codegen.module().get_function("cc_nil")
                                    .ok_or("cc_nil not found")?;

                                if user_functions.contains_key(name) {
                                    let call_site = codegen.builder().build_call(t_fn, &[], "fboundp_t")
                                        .map_err(|e| format!("Failed to build call: {:?}", e))?;
                                    Ok(call_site.as_any_value_enum().into_int_value().into())
                                } else {
                                    let call_site = codegen.builder().build_call(nil_fn, &[], "fboundp_nil")
                                        .map_err(|e| format!("Failed to build call: {:?}", e))?;
                                    Ok(call_site.as_any_value_enum().into_int_value().into())
                                }
                            } else {
                                let nil_fn = codegen.module().get_function("cc_nil")
                                    .ok_or("cc_nil not found")?;
                                let call_site = codegen.builder().build_call(nil_fn, &[], "fboundp_nil")
                                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                                Ok(call_site.as_any_value_enum().into_int_value().into())
                            }
                        } else {
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;
                            let call_site = codegen.builder().build_call(nil_fn, &[], "fboundp_nil")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            Ok(call_site.as_any_value_enum().into_int_value().into())
                        }
                    }

                    "boundp" if args.len() == 1 => {
                        // boundp not fully supported, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "boundp_nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "functionp" if args.len() == 1 => {
                        // functionp not fully supported, return T for now
                        let t_fn = codegen.module().get_function("cc_t")
                            .ok_or("cc_t not found")?;
                        let call_site = codegen.builder().build_call(t_fn, &[], "functionp_t")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "defclass" => {
                        // CLOS classes not fully implemented, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(nil_fn, &[], "defclass_nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "defgeneric" if args.len() >= 1 => {
                        // defgeneric just declares a generic function
                        // Extract function name from (defgeneric name (params))
                        if let ASTNode::Variable(name) = &args[0] {
                            // Mark this as a generic function (will be implemented by defmethod)
                            // For now, just return NIL
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;
                            let call_site = codegen.builder().build_call(nil_fn, &[], "defgeneric_nil")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            Ok(call_site.as_any_value_enum().into_int_value().into())
                        } else {
                            Err("defgeneric: expected function name".to_string())
                        }
                    }

                    "defmethod" if args.len() >= 2 => {
                        // defmethod defines the implementation of a generic function
                        // (defmethod name ((param type)) body...)
                        if let ASTNode::Variable(name) = &args[0] {
                            // Extract parameters from ((param type))
                            let params = if let ASTNode::Call { args: param_list, .. } = &args[1] {
                                param_list.iter().filter_map(|p| {
                                    match p {
                                        // Handle (param type) form
                                        ASTNode::Call { args: type_spec, .. } => {
                                            if !type_spec.is_empty() {
                                                if let ASTNode::Variable(param_name) = &type_spec[0] {
                                                    Some(param_name.clone())
                                                } else {
                                                    None
                                                }
                                            } else {
                                                None
                                            }
                                        }
                                        // Handle plain param
                                        ASTNode::Variable(param_name) => Some(param_name.clone()),
                                        _ => None
                                    }
                                }).collect::<Vec<_>>()
                            } else {
                                Vec::new()
                            };

                            // Create or get the function
                            let i64_type = context.i64_type();
                            let param_types: Vec<_> = params.iter().map(|_| i64_type.into()).collect();
                            let fn_type = i64_type.fn_type(&param_types, false);

                            let func = if let Some(f) = codegen.module().get_function(name) {
                                f
                            } else {
                                codegen.module().add_function(name, fn_type, None)
                            };

                            // Compile the method body
                            let entry_bb = context.append_basic_block(func, "entry");
                            let saved_bb = codegen.builder().get_insert_block();
                            codegen.builder().position_at_end(entry_bb);

                            // Create environment with parameters
                            let mut method_env = env.clone();
                            for (i, param_name) in params.iter().enumerate() {
                                let param_val = func.get_nth_param(i as u32)
                                    .ok_or(format!("Missing parameter {}", i))?
                                    .into_int_value();
                                let alloca = codegen.builder().build_alloca(i64_type, param_name)
                                    .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
                                codegen.builder().build_store(alloca, param_val)
                                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
                                method_env.insert(param_name.clone(), alloca);
                            }

                            // Compile body
                            let mut result = None;
                            for expr in &args[2..] {
                                result = Some(compile_ast_to_llvm(context, codegen, expr, &mut method_env, user_functions)?);
                            }

                            let return_val = result.ok_or("defmethod: empty body")?;
                            codegen.builder().build_return(Some(&return_val.into_int_value()))
                                .map_err(|e| format!("Failed to build return: {:?}", e))?;

                            // Restore insert point
                            if let Some(bb) = saved_bb {
                                codegen.builder().position_at_end(bb);
                            }

                            // Return NIL
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;
                            let call_site = codegen.builder().build_call(nil_fn, &[], "defmethod_nil")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            Ok(call_site.as_any_value_enum().into_int_value().into())
                        } else {
                            Err("defmethod: expected function name".to_string())
                        }
                    }

                    "make-instance" if args.len() >= 1 => {
                        // (make-instance 'class-name :slot1 value1 :slot2 value2 ...)
                        // Create object as: (class-name . ((slot1 . value1) (slot2 . value2) ...))

                        // Get class name (quoted symbol)
                        let class_name_val = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        // Build property list from keyword arguments
                        let cons_fn = codegen.module().get_function("cc_cons")
                            .ok_or("cc_cons not found")?;
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;

                        let nil_call = codegen.builder().build_call(nil_fn, &[], "nil")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let mut plist = nil_call.as_any_value_enum().into_int_value();

                        // Process keyword arguments in pairs
                        let mut i = 1;
                        while i + 1 < args.len() {
                            // Get keyword and value
                            let keyword_val = compile_ast_to_llvm(context, codegen, &args[i], env, user_functions)?;
                            let value_val = compile_ast_to_llvm(context, codegen, &args[i + 1], env, user_functions)?;

                            // Create (keyword . value) pair
                            let pair = codegen.builder().build_call(
                                cons_fn,
                                &[keyword_val.into(), value_val.into()],
                                "slot_pair"
                            ).map_err(|e| format!("Failed to build cons: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            // Cons it onto the plist
                            plist = codegen.builder().build_call(
                                cons_fn,
                                &[pair.into(), plist.into()],
                                "plist_cons"
                            ).map_err(|e| format!("Failed to build cons: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            i += 2;
                        }

                        // Create final object: (class-name . plist)
                        let obj = codegen.builder().build_call(
                            cons_fn,
                            &[class_name_val.into(), plist.into()],
                            "make_instance_obj"
                        ).map_err(|e| format!("Failed to build cons: {:?}", e))?;

                        Ok(obj.as_any_value_enum().into_int_value().into())
                    }

                    "numerator" if args.len() == 1 => {
                        // For ratio, just return the argument (simplified)
                        compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                    }

                    "denominator" if args.len() == 1 => {
                        // For ratio, return 1 (simplified)
                        let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                            .ok_or("cc_box_fixnum not found")?;
                        let one = context.i64_type().const_int(1, false);
                        let call_site = codegen.builder().build_call(
                            box_fixnum, &[one.into()], "one"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "realpart" if args.len() == 1 => {
                        // For complex, just return the argument (simplified)
                        compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                    }

                    "imagpart" if args.len() == 1 => {
                        // For complex, return 0 (simplified)
                        let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                            .ok_or("cc_box_fixnum not found")?;
                        let zero = context.i64_type().const_int(0, false);
                        let call_site = codegen.builder().build_call(
                            box_fixnum, &[zero.into()], "zero"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call_site.as_any_value_enum().into_int_value().into())
                    }

                    "in-package" => {
                        // Package system not implemented, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(
                            nil_fn, &[], "in_package_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "defgeneric" => {
                        // Generic functions not fully implemented, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(
                            nil_fn, &[], "defgeneric_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "defmethod" => {
                        // Methods not fully implemented, return NIL
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;
                        let call_site = codegen.builder().build_call(
                            nil_fn, &[], "defmethod_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "print" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let print_fn = codegen.module().get_function("cc_print")
                            .ok_or("cc_print not found")?;
                        let call_site = codegen.builder().build_call(
                            print_fn, &[arg.into()], "print_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "format" if args.len() >= 2 => {
                        // (format dest control-string &rest args)
                        let dest = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let control = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        // Build list from rest args
                        let cons_fn = codegen.module().get_function("cc_cons")
                            .ok_or("cc_cons not found")?;
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;

                        let nil_call = codegen.builder().build_call(
                            nil_fn, &[], "nil_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let mut arg_list = nil_call.as_any_value_enum().into_int_value();

                        for arg in args[2..].iter().rev() {
                            let element = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                            let cons_call = codegen.builder().build_call(
                                cons_fn, &[element.into(), arg_list.into()], "cons_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            arg_list = cons_call.as_any_value_enum().into_int_value();
                        }

                        let format_fn = codegen.module().get_function("cc_format")
                            .ok_or("cc_format not found")?;
                        let call_site = codegen.builder().build_call(
                            format_fn, &[dest.into(), control.into(), arg_list.into()], "format_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "make-hash-table" => {
                        // Parse keyword arguments :test, :size, etc.
                        let mut test_val = context.i64_type().const_int(0, false).into(); // default eq
                        let mut size_val = context.i64_type().const_int(16, false).into(); // default size

                        let mut i = 0;
                        while i < args.len() {
                            if let ASTNode::Variable(kw) = &args[i] {
                                if kw == ":test" && i + 1 < args.len() {
                                    // Parse test function - compile the value
                                    test_val = compile_ast_to_llvm(context, codegen, &args[i + 1], env, user_functions)?;
                                    i += 2;
                                    continue;
                                } else if kw == ":size" && i + 1 < args.len() {
                                    size_val = compile_ast_to_llvm(context, codegen, &args[i + 1], env, user_functions)?;
                                    i += 2;
                                    continue;
                                }
                            }
                            i += 1;
                        }

                        let ht_fn = codegen.module().get_function("cc_make_hash_table_full")
                            .ok_or("cc_make_hash_table_full not found")?;
                        let call_site = codegen.builder().build_call(
                            ht_fn, &[test_val.into(), size_val.into()], "ht_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "gethash" if args.len() >= 2 => {
                        // (gethash key table &optional default)
                        let key = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let table = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let default = if args.len() >= 3 {
                            compile_ast_to_llvm(context, codegen, &args[2], env, user_functions)?
                        } else {
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;
                            let nil_call = codegen.builder().build_call(
                                nil_fn, &[], "nil_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            nil_call.as_any_value_enum().into_int_value().into()
                        };

                        let gethash_fn = codegen.module().get_function("cc_gethash")
                            .ok_or("cc_gethash not found")?;
                        let call_site = codegen.builder().build_call(
                            gethash_fn, &[key.into(), table.into(), default.into()], "gethash_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "maphash" if args.len() == 2 => {
                        // (maphash function table)
                        let function = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let table = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let maphash_fn = codegen.module().get_function("cc_maphash")
                            .ok_or("cc_maphash not found")?;
                        let call_site = codegen.builder().build_call(
                            maphash_fn, &[function.into(), table.into()], "maphash_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "make-instance" if args.len() >= 1 => {
                        // (make-instance class &rest initargs)
                        let class = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        // Build list from initargs
                        let cons_fn = codegen.module().get_function("cc_cons")
                            .ok_or("cc_cons not found")?;
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;

                        let nil_call = codegen.builder().build_call(
                            nil_fn, &[], "nil_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let mut initargs_list = nil_call.as_any_value_enum().into_int_value();

                        for arg in args[1..].iter().rev() {
                            let element = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                            let cons_call = codegen.builder().build_call(
                                cons_fn, &[element.into(), initargs_list.into()], "cons_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            initargs_list = cons_call.as_any_value_enum().into_int_value();
                        }

                        let make_instance_fn = codegen.module().get_function("cc_make_instance")
                            .ok_or("cc_make_instance not found")?;
                        let call_site = codegen.builder().build_call(
                            make_instance_fn, &[class.into(), initargs_list.into()], "instance_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "slot-value" if args.len() == 2 => {
                        let instance = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let slot_name = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let slot_value_fn = codegen.module().get_function("cc_slot_value")
                            .ok_or("cc_slot_value not found")?;
                        let call_site = codegen.builder().build_call(
                            slot_value_fn, &[instance.into(), slot_name.into()], "slot_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "echo" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let echo_fn = codegen.module().get_function("cc_echo")
                            .ok_or("cc_echo not found")?;
                        let call_site = codegen.builder().build_call(
                            echo_fn, &[arg.into()], "echo_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "ls" if args.is_empty() => {
                        let ls_fn = codegen.module().get_function("cc_ls")
                            .ok_or("cc_ls not found")?;
                        let call_site = codegen.builder().build_call(
                            ls_fn, &[], "ls_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "pwd" if args.is_empty() => {
                        let pwd_fn = codegen.module().get_function("cc_pwd")
                            .ok_or("cc_pwd not found")?;
                        let call_site = codegen.builder().build_call(
                            pwd_fn, &[], "pwd_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "shell" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let shell_fn = codegen.module().get_function("cc_shell")
                            .ok_or("cc_shell not found")?;
                        let call_site = codegen.builder().build_call(
                            shell_fn, &[arg.into()], "shell_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "argc" if args.is_empty() => {
                        let argc_fn = codegen.module().get_function("cc_argc")
                            .ok_or("cc_argc not found")?;
                        let call_site = codegen.builder().build_call(
                            argc_fn, &[], "argc_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "argv" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let argv_fn = codegen.module().get_function("cc_argv")
                            .ok_or("cc_argv not found")?;
                        let call_site = codegen.builder().build_call(
                            argv_fn, &[arg.into()], "argv_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "floor" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let floor_fn = codegen.module().get_function("cc_floor")
                            .ok_or("cc_floor not found")?;
                        let call_site = codegen.builder().build_call(
                            floor_fn, &[arg.into()], "floor_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "ceiling" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let ceiling_fn = codegen.module().get_function("cc_ceiling")
                            .ok_or("cc_ceiling not found")?;
                        let call_site = codegen.builder().build_call(
                            ceiling_fn, &[arg.into()], "ceiling_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "truncate" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let truncate_fn = codegen.module().get_function("cc_truncate")
                            .ok_or("cc_truncate not found")?;
                        let call_site = codegen.builder().build_call(
                            truncate_fn, &[arg.into()], "truncate_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "truncate" if args.len() == 2 => {
                        let dividend = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let divisor = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let truncate_2_fn = codegen.module().get_function("cc_truncate_2")
                            .ok_or("cc_truncate_2 not found")?;
                        let call_site = codegen.builder().build_call(
                            truncate_2_fn, &[dividend.into(), divisor.into()], "truncate_2_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "length" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let length_fn = codegen.module().get_function("cc_length")
                            .ok_or("cc_length not found")?;
                        let call_site = codegen.builder().build_call(
                            length_fn, &[arg.into()], "length_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "append" if args.len() == 2 => {
                        let list1 = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let list2 = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let append_fn = codegen.module().get_function("cc_append")
                            .ok_or("cc_append not found")?;
                        let call_site = codegen.builder().build_call(
                            append_fn, &[list1.into(), list2.into()], "append_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "copy-seq" if args.len() == 1 => {
                        // (copy-seq sequence) - copy a sequence (list or string)
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let copy_seq_fn = codegen.module().get_function("cc_copy_seq")
                            .ok_or("cc_copy_seq not found")?;
                        let call_site = codegen.builder().build_call(
                            copy_seq_fn, &[arg.into()], "copy_seq_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "reverse" if args.len() == 1 => {
                        let list = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let reverse_fn = codegen.module().get_function("cc_reverse")
                            .ok_or("cc_reverse not found")?;
                        let call_site = codegen.builder().build_call(
                            reverse_fn, &[list.into()], "reverse_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "nth" if args.len() == 2 => {
                        let n = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let list = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let nth_fn = codegen.module().get_function("cc_nth")
                            .ok_or("cc_nth not found")?;
                        let call_site = codegen.builder().build_call(
                            nth_fn, &[n.into(), list.into()], "nth_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "make-string" if args.len() >= 1 => {
                        let size = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        // Parse keyword arguments for :initial-element
                        let mut initial_char = context.i64_type().const_int(32, false).into(); // default to space
                        let mut i = 1;
                        while i < args.len() {
                            if let ASTNode::Variable(kw) = &args[i] {
                                if kw == ":initial-element" && i + 1 < args.len() {
                                    initial_char = compile_ast_to_llvm(context, codegen, &args[i + 1], env, user_functions)?;
                                    i += 2;
                                    continue;
                                }
                            }
                            i += 1;
                        }

                        let make_string_fn = codegen.module().get_function("cc_make_string_repeat")
                            .ok_or("cc_make_string_repeat not found")?;
                        let call_site = codegen.builder().build_call(
                            make_string_fn, &[size.into(), initial_char.into()], "make_string_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "make-array" if args.len() >= 1 => {
                        let size = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        // Parse keyword arguments for :initial-contents
                        let mut i = 1;
                        let mut has_contents = false;
                        let mut contents_val = None;
                        while i < args.len() {
                            if let ASTNode::Variable(kw) = &args[i] {
                                if kw == ":initial-contents" && i + 1 < args.len() {
                                    contents_val = Some(compile_ast_to_llvm(context, codegen, &args[i + 1], env, user_functions)?);
                                    has_contents = true;
                                    i += 2;
                                    continue;
                                }
                            }
                            i += 1;
                        }

                        if has_contents && contents_val.is_some() {
                            let make_array_fn = codegen.module().get_function("cc_make_array_with_contents")
                                .ok_or("cc_make_array_with_contents not found")?;
                            let call_site = codegen.builder().build_call(
                                make_array_fn, &[size.into(), contents_val.unwrap().into()], "make_array_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let result = call_site.as_any_value_enum().into_int_value();
                            Ok(result.into())
                        } else {
                            let make_array_fn = codegen.module().get_function("cc_make_array")
                                .ok_or("cc_make_array not found")?;
                            let call_site = codegen.builder().build_call(
                                make_array_fn, &[size.into()], "make_array_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let result = call_site.as_any_value_enum().into_int_value();
                            Ok(result.into())
                        }
                    }

                    "aref" if args.len() == 2 => {
                        let array = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let index = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let aref_fn = codegen.module().get_function("cc_aref")
                            .ok_or("cc_aref not found")?;
                        let call_site = codegen.builder().build_call(
                            aref_fn, &[array.into(), index.into()], "aref_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "<" if args.len() == 2 => {
                        let left = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let right = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let lt_fn = codegen.module().get_function("cc_lt")
                            .ok_or("cc_lt not found")?;
                        let call_site = codegen.builder().build_call(
                            lt_fn, &[left.into(), right.into()], "lt_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    ">" if args.len() == 2 => {
                        let left = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let right = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let gt_fn = codegen.module().get_function("cc_gt")
                            .ok_or("cc_gt not found")?;
                        let call_site = codegen.builder().build_call(
                            gt_fn, &[left.into(), right.into()], "gt_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "=" if args.len() == 2 => {
                        let left = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let right = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let eq_fn = codegen.module().get_function("cc_eq")
                            .ok_or("cc_eq not found")?;
                        let call_site = codegen.builder().build_call(
                            eq_fn, &[left.into(), right.into()], "eq_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "eql" if args.len() == 2 => {
                        let left = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let right = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let eq_fn = codegen.module().get_function("cc_eq")
                            .ok_or("cc_eq not found")?;
                        let call_site = codegen.builder().build_call(
                            eq_fn, &[left.into(), right.into()], "eql_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "<=" if args.len() == 2 => {
                        let left = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let right = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let le_fn = codegen.module().get_function("cc_le")
                            .ok_or("cc_le not found")?;
                        let call_site = codegen.builder().build_call(
                            le_fn, &[left.into(), right.into()], "le_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    ">=" if args.len() == 2 => {
                        let left = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let right = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let ge_fn = codegen.module().get_function("cc_ge")
                            .ok_or("cc_ge not found")?;
                        let call_site = codegen.builder().build_call(
                            ge_fn, &[left.into(), right.into()], "ge_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "cons" if args.len() == 2 => {
                        let car = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let cdr = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let cons_fn = codegen.module().get_function("cc_cons")
                            .ok_or("cc_cons not found")?;
                        let call_site = codegen.builder().build_call(
                            cons_fn, &[car.into(), cdr.into()], "cons_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "car" if args.len() == 1 => {
                        let cons = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let car_fn = codegen.module().get_function("cc_car")
                            .ok_or("cc_car not found")?;
                        let call_site = codegen.builder().build_call(
                            car_fn, &[cons.into()], "car_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "cdr" if args.len() == 1 => {
                        let cons = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let cdr_fn = codegen.module().get_function("cc_cdr")
                            .ok_or("cc_cdr not found")?;
                        let call_site = codegen.builder().build_call(
                            cdr_fn, &[cons.into()], "cdr_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "caar" if args.len() == 1 => {
                        // (caar x) = (car (car x))
                        let synthetic = ASTNode::call(
                            ASTNode::variable("car"),
                            vec![ASTNode::call(ASTNode::variable("car"), vec![args[0].clone()])]
                        );
                        compile_ast_to_llvm(context, codegen, &synthetic, env, user_functions)
                    }
                    "cadr" if args.len() == 1 => {
                        // (cadr x) = (car (cdr x))
                        let synthetic = ASTNode::call(
                            ASTNode::variable("car"),
                            vec![ASTNode::call(ASTNode::variable("cdr"), vec![args[0].clone()])]
                        );
                        compile_ast_to_llvm(context, codegen, &synthetic, env, user_functions)
                    }
                    "cdar" if args.len() == 1 => {
                        // (cdar x) = (cdr (car x))
                        let synthetic = ASTNode::call(
                            ASTNode::variable("cdr"),
                            vec![ASTNode::call(ASTNode::variable("car"), vec![args[0].clone()])]
                        );
                        compile_ast_to_llvm(context, codegen, &synthetic, env, user_functions)
                    }
                    "cddr" if args.len() == 1 => {
                        // (cddr x) = (cdr (cdr x))
                        let synthetic = ASTNode::call(
                            ASTNode::variable("cdr"),
                            vec![ASTNode::call(ASTNode::variable("cdr"), vec![args[0].clone()])]
                        );
                        compile_ast_to_llvm(context, codegen, &synthetic, env, user_functions)
                    }
                    "caddr" if args.len() == 1 => {
                        // (caddr x) = (car (cdr (cdr x)))
                        let synthetic = ASTNode::call(
                            ASTNode::variable("car"),
                            vec![ASTNode::call(
                                ASTNode::variable("cdr"),
                                vec![ASTNode::call(ASTNode::variable("cdr"), vec![args[0].clone()])]
                            )]
                        );
                        compile_ast_to_llvm(context, codegen, &synthetic, env, user_functions)
                    }
                    "cadddr" if args.len() == 1 => {
                        // (cadddr x) = (car (cdr (cdr (cdr x))))
                        let synthetic = ASTNode::call(
                            ASTNode::variable("car"),
                            vec![ASTNode::call(
                                ASTNode::variable("cdr"),
                                vec![ASTNode::call(
                                    ASTNode::variable("cdr"),
                                    vec![ASTNode::call(ASTNode::variable("cdr"), vec![args[0].clone()])]
                                )]
                            )]
                        );
                        compile_ast_to_llvm(context, codegen, &synthetic, env, user_functions)
                    }
                    "list" => {
                        // Build a list from right to left: (list 1 2 3) = (cons 1 (cons 2 (cons 3 nil)))
                        if args.is_empty() {
                            // Empty list is nil
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;
                            let call_site = codegen.builder().build_call(
                                nil_fn, &[], "nil_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let result = call_site.as_any_value_enum().into_int_value();
                            Ok(result.into())
                        } else {
                            let cons_fn = codegen.module().get_function("cc_cons")
                                .ok_or("cc_cons not found")?;
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;

                            // Start with nil
                            let nil_call = codegen.builder().build_call(
                                nil_fn, &[], "nil_result"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let mut current = nil_call.as_any_value_enum().into_int_value();

                            // Build list from right to left
                            for arg in args.iter().rev() {
                                let element = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                let cons_call = codegen.builder().build_call(
                                    cons_fn, &[element.into(), current.into()], "cons_result"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                current = cons_call.as_any_value_enum().into_int_value();
                            }

                            Ok(current.into())
                        }
                    }
                    "get-internal-real-time" if args.is_empty() => {
                        // (get-internal-real-time) returns current time in milliseconds
                        let time_fn = codegen.module().get_function("cc_get_internal_real_time")
                            .ok_or("cc_get_internal_real_time not found")?;
                        let call_site = codegen.builder().build_call(time_fn, &[], "time")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }
                    "funcall" if args.len() >= 1 => {
                        // (funcall function arg1 arg2 ...)
                        // For now, support calling user-defined functions by name
                        // The function can be: (function name) or 'name or just name as a variable

                        let func_name = match &args[0] {
                            // Handle (function name) or #'name
                            ASTNode::Call { function: f, args: call_args }
                                if matches!(&**f, ASTNode::Variable(s) if s == "function") && call_args.len() == 1 => {
                                if let ASTNode::Variable(name) = &call_args[0] {
                                    Some(name.as_str())
                                } else {
                                    None
                                }
                            }
                            // Handle direct variable reference
                            ASTNode::Variable(name) => {
                                // Check if it's a user function
                                if user_functions.contains_key(name) {
                                    Some(name.as_str())
                                } else {
                                    None
                                }
                            }
                            // Handle quoted symbol 'name
                            ASTNode::Quote(quoted) => {
                                if let ASTNode::Variable(name) = &**quoted {
                                    Some(name.as_str())
                                } else {
                                    None
                                }
                            }
                            _ => None
                        };

                        if let Some(name) = func_name {
                            // Check if it's a builtin function
                            let is_builtin = matches!(name, "+" | "-" | "*" | "/" | "=" | "<" | ">" | "<=" | ">="
                                | "cons" | "car" | "cdr" | "list" | "null" | "eq" | "mod" | "expt");

                            if user_functions.contains_key(name) {
                                let func = codegen.module().get_function(name)
                                    .ok_or(format!("User function {} not found", name))?;

                                // Compile function arguments (skip first arg which is the function itself)
                                let mut arg_vals = Vec::new();
                                for arg in &args[1..] {
                                    let val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                    arg_vals.push(val.into());
                                }

                                // Call the function
                                let call = codegen.builder().build_call(func, &arg_vals, "funcall_result")
                                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                                Ok(call.as_any_value_enum().into_int_value().into())
                            } else if is_builtin {
                                // Handle builtin functions by creating a synthetic Call node
                                let func_node = ASTNode::Variable(name.to_string());
                                let call_args: Vec<ASTNode> = args[1..].to_vec();
                                let synthetic_call = ASTNode::Call {
                                    function: Box::new(func_node),
                                    args: call_args,
                                };
                                compile_ast_to_llvm(context, codegen, &synthetic_call, env, user_functions)
                            } else {
                                Err(format!("funcall: function {} not found", name))
                            }
                        } else {
                            // Handle lambda or function pointer
                            // Compile the first argument to get the function pointer or closure
                            let fn_obj = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                            let i64_type = context.i64_type();
                            let ptr_type = context.ptr_type(inkwell::AddressSpace::default());

                            // Check if it's a cons (closure) or just a function pointer
                            let is_cons_fn = codegen.module().get_function("cc_is_cons")
                                .ok_or("cc_is_cons not found")?;
                            let is_cons_call = codegen.builder().build_call(
                                is_cons_fn, &[fn_obj.into()], "is_cons"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            let is_cons = is_cons_call.as_any_value_enum().into_int_value();

                            // Create blocks for closure vs simple function
                            let current_fn = codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?;
                            let closure_block = context.append_basic_block(current_fn, "funcall_closure");
                            let simple_block = context.append_basic_block(current_fn, "funcall_simple");
                            let merge_block = context.append_basic_block(current_fn, "funcall_merge");

                            let is_closure = codegen.builder().build_int_compare(
                                inkwell::IntPredicate::NE,
                                is_cons,
                                i64_type.const_zero(),
                                "is_closure"
                            ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                            codegen.builder().build_conditional_branch(is_closure, closure_block, simple_block)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            // Closure block: Extract function pointer and closure data
                            codegen.builder().position_at_end(closure_block);
                            let car_fn = codegen.module().get_function("cc_car")
                                .ok_or("cc_car not found")?;
                            let cdr_fn = codegen.module().get_function("cc_cdr")
                                .ok_or("cc_cdr not found")?;

                            let fn_obj_boxed = car_fn;
                            let closure_data = cdr_fn;

                            let fn_car_call = codegen.builder().build_call(
                                fn_obj_boxed, &[fn_obj.into()], "fn_car"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let closure_cdr_call = codegen.builder().build_call(
                                closure_data, &[fn_obj.into()], "closure_cdr"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            // Unbox both pointers
                            let unbox_fn = codegen.module().get_function("cc_unbox_function_ptr")
                                .ok_or("cc_unbox_function_ptr not found")?;
                            let fn_ptr_int_closure = codegen.builder().build_call(
                                unbox_fn, &[fn_car_call.into()], "fn_ptr_int"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let closure_ptr_int = codegen.builder().build_call(
                                unbox_fn, &[closure_cdr_call.into()], "closure_ptr_int"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let fn_ptr_closure = codegen.builder().build_int_to_ptr(
                                fn_ptr_int_closure,
                                ptr_type,
                                "fn_ptr"
                            ).map_err(|e| format!("Failed to build int_to_ptr: {:?}", e))?;

                            let closure_ptr = codegen.builder().build_int_to_ptr(
                                closure_ptr_int,
                                ptr_type,
                                "closure_ptr"
                            ).map_err(|e| format!("Failed to build int_to_ptr: {:?}", e))?;

                            // Compile function arguments
                            let mut arg_vals_closure = Vec::new();
                            for arg in &args[1..] {
                                let val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                arg_vals_closure.push(val.into());
                            }
                            // Add closure pointer as last argument
                            arg_vals_closure.push(closure_ptr.into());

                            // Call with closure
                            let num_args_closure = args.len() - 1;
                            let mut param_types_closure: Vec<_> = (0..num_args_closure).map(|_| i64_type.into()).collect();
                            param_types_closure.push(ptr_type.into());
                            let fn_type_closure = i64_type.fn_type(&param_types_closure, false);
                            let call_closure = codegen.builder().build_indirect_call(
                                fn_type_closure,
                                fn_ptr_closure,
                                &arg_vals_closure,
                                "funcall_result"
                            ).map_err(|e| format!("Failed to build indirect call: {:?}", e))?;
                            let result_closure = call_closure.as_any_value_enum().into_int_value();

                            codegen.builder().build_unconditional_branch(merge_block)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            // Simple block: Just a function pointer
                            codegen.builder().position_at_end(simple_block);
                            let fn_ptr_int_simple = codegen.builder().build_call(
                                unbox_fn, &[fn_obj.into()], "fn_ptr_int"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let fn_ptr_simple = codegen.builder().build_int_to_ptr(
                                fn_ptr_int_simple,
                                ptr_type,
                                "fn_ptr"
                            ).map_err(|e| format!("Failed to build int_to_ptr: {:?}", e))?;

                            // Compile function arguments
                            let mut arg_vals_simple = Vec::new();
                            for arg in &args[1..] {
                                let val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                arg_vals_simple.push(val.into());
                            }

                            // Call without closure
                            let num_args_simple = args.len() - 1;
                            let param_types_simple: Vec<_> = (0..num_args_simple).map(|_| i64_type.into()).collect();
                            let fn_type_simple = i64_type.fn_type(&param_types_simple, false);
                            let call_simple = codegen.builder().build_indirect_call(
                                fn_type_simple,
                                fn_ptr_simple,
                                &arg_vals_simple,
                                "funcall_result"
                            ).map_err(|e| format!("Failed to build indirect call: {:?}", e))?;
                            let result_simple = call_simple.as_any_value_enum().into_int_value();

                            codegen.builder().build_unconditional_branch(merge_block)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            // Merge block
                            codegen.builder().position_at_end(merge_block);
                            let phi = codegen.builder().build_phi(i64_type, "funcall_result")
                                .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                            phi.add_incoming(&[
                                (&result_closure, closure_block),
                                (&result_simple, simple_block),
                            ]);

                            Ok(phi.as_basic_value().into())
                        }
                    }

                    "apply" if args.len() >= 2 => {
                        // (apply function arg1 arg2 ... arglist)
                        // For simplicity, handle the common case: (apply #'fn list)

                        // Extract function name
                        let func_name = match &args[0] {
                            ASTNode::Call { function: f, args: call_args }
                                if matches!(&**f, ASTNode::Variable(s) if s == "function") && call_args.len() == 1 => {
                                if let ASTNode::Variable(name) = &call_args[0] {
                                    Some(name.as_str())
                                } else {
                                    None
                                }
                            }
                            ASTNode::Variable(name) => Some(name.as_str()),
                            ASTNode::Quote(quoted) => {
                                if let ASTNode::Variable(name) = &**quoted {
                                    Some(name.as_str())
                                } else {
                                    None
                                }
                            }
                            _ => None
                        };

                        if let Some(name) = func_name {
                            // Check if it's a builtin
                            let is_builtin = matches!(name, "+" | "-" | "*" | "/" | "=" | "<" | ">" | "<=" | ">="
                                | "cons" | "car" | "cdr" | "list" | "null" | "eq" | "mod" | "expt");

                            if is_builtin {
                                // For builtins with apply, call reduce if the list is the only arg
                                if args.len() == 2 {
                                    // (apply #'+ list) => (reduce #'+ list)
                                    let synthetic_call = ASTNode::Call {
                                        function: Box::new(ASTNode::Variable("reduce".to_string())),
                                        args: args.to_vec(),
                                    };
                                    compile_ast_to_llvm(context, codegen, &synthetic_call, env, user_functions)
                                } else {
                                    Err("apply: multiple arg lists not yet supported".to_string())
                                }
                            } else if user_functions.contains_key(name) {
                                Err("apply: user functions not yet supported".to_string())
                            } else {
                                Err(format!("apply: unknown function {}", name))
                            }
                        } else {
                            Err("apply: function must be a name or #'name".to_string())
                        }
                    }

                    "string=" if args.len() == 2 => {
                        // (string= a b) - string equality
                        let a = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let b = compile_ast_to_llvm(context, codegen, &args[1], env, user_functions)?;

                        let string_eq_fn = codegen.module().get_function("cc_string_equal")
                            .ok_or("cc_string_equal not found")?;
                        let call_site = codegen.builder().build_call(
                            string_eq_fn, &[a.into(), b.into()], "string_eq_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "null" if args.len() == 1 => {
                        // (null x) returns T if x is nil, NIL otherwise
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let is_nil_fn = codegen.module().get_function("cc_is_nil")
                            .ok_or("cc_is_nil not found")?;
                        let is_nil_call = codegen.builder().build_call(
                            is_nil_fn, &[arg.into()], "is_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let is_nil_result = is_nil_call.as_any_value_enum().into_int_value();

                        // Convert i32 to LispObject (T or NIL)
                        let t_fn = codegen.module().get_function("cc_t")
                            .ok_or("cc_t not found")?;
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;

                        let t_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_null_true"
                        );
                        let nil_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_null_false"
                        );
                        let merge_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_null_merge"
                        );

                        let cond = codegen.builder().build_int_compare(
                            inkwell::IntPredicate::NE,
                            is_nil_result,
                            context.i32_type().const_zero(),
                            "is_null_cond"
                        ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                        codegen.builder().build_conditional_branch(cond, t_bb, nil_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(t_bb);
                        let t_call = codegen.builder().build_call(t_fn, &[], "t_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let t_val = t_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(nil_bb);
                        let nil_call = codegen.builder().build_call(nil_fn, &[], "nil_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let nil_val = nil_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(merge_bb);
                        let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "null_result")
                            .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                        phi.add_incoming(&[(&t_val, t_bb), (&nil_val, nil_bb)]);

                        Ok(phi.as_basic_value())
                    }
                    "consp" if args.len() == 1 => {
                        // (consp x) returns T if x is a cons, NIL otherwise
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let is_cons_fn = codegen.module().get_function("cc_is_cons")
                            .ok_or("cc_is_cons not found")?;
                        let is_cons_call = codegen.builder().build_call(
                            is_cons_fn, &[arg.into()], "is_cons"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let is_cons_result = is_cons_call.as_any_value_enum().into_int_value();

                        // Convert i32 to LispObject (T or NIL)
                        let t_fn = codegen.module().get_function("cc_t")
                            .ok_or("cc_t not found")?;
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;

                        let t_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_cons_true"
                        );
                        let nil_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_cons_false"
                        );
                        let merge_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_cons_merge"
                        );

                        let cond = codegen.builder().build_int_compare(
                            inkwell::IntPredicate::NE,
                            is_cons_result,
                            context.i32_type().const_zero(),
                            "is_cons_cond"
                        ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                        codegen.builder().build_conditional_branch(cond, t_bb, nil_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(t_bb);
                        let t_call = codegen.builder().build_call(t_fn, &[], "t_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let t_val = t_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(nil_bb);
                        let nil_call = codegen.builder().build_call(nil_fn, &[], "nil_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let nil_val = nil_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(merge_bb);
                        let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "consp_result")
                            .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                        phi.add_incoming(&[(&t_val, t_bb), (&nil_val, nil_bb)]);

                        Ok(phi.as_basic_value())
                    }
                    "atom" if args.len() == 1 => {
                        // (atom x) returns T if x is not a cons, NIL otherwise (opposite of consp)
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let is_cons_fn = codegen.module().get_function("cc_is_cons")
                            .ok_or("cc_is_cons not found")?;
                        let is_cons_call = codegen.builder().build_call(
                            is_cons_fn, &[arg.into()], "is_cons"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let is_cons_result = is_cons_call.as_any_value_enum().into_int_value();

                        // Convert i32 to LispObject (T or NIL) - reversed logic
                        let t_fn = codegen.module().get_function("cc_t")
                            .ok_or("cc_t not found")?;
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;

                        let t_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_atom_true"
                        );
                        let nil_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_atom_false"
                        );
                        let merge_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "is_atom_merge"
                        );

                        // Reversed: EQ (is 0) means not a cons, so atom is true
                        let cond = codegen.builder().build_int_compare(
                            inkwell::IntPredicate::EQ,
                            is_cons_result,
                            context.i32_type().const_zero(),
                            "is_atom_cond"
                        ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                        codegen.builder().build_conditional_branch(cond, t_bb, nil_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(t_bb);
                        let t_call = codegen.builder().build_call(t_fn, &[], "t_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let t_val = t_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(nil_bb);
                        let nil_call = codegen.builder().build_call(nil_fn, &[], "nil_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let nil_val = nil_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(merge_bb);
                        let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "atom_result")
                            .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                        phi.add_incoming(&[(&t_val, t_bb), (&nil_val, nil_bb)]);

                        Ok(phi.as_basic_value())
                    }
                    "not" if args.len() == 1 => {
                        // (not x) returns T if x is nil, NIL otherwise (same as null)
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let is_nil_fn = codegen.module().get_function("cc_is_nil")
                            .ok_or("cc_is_nil not found")?;
                        let is_nil_call = codegen.builder().build_call(
                            is_nil_fn, &[arg.into()], "is_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let is_nil_result = is_nil_call.as_any_value_enum().into_int_value();

                        let t_fn = codegen.module().get_function("cc_t")
                            .ok_or("cc_t not found")?;
                        let nil_fn = codegen.module().get_function("cc_nil")
                            .ok_or("cc_nil not found")?;

                        let t_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "not_true"
                        );
                        let nil_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "not_false"
                        );
                        let merge_bb = context.append_basic_block(
                            codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?,
                            "not_merge"
                        );

                        let cond = codegen.builder().build_int_compare(
                            inkwell::IntPredicate::NE,
                            is_nil_result,
                            context.i32_type().const_zero(),
                            "not_cond"
                        ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                        codegen.builder().build_conditional_branch(cond, t_bb, nil_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(t_bb);
                        let t_call = codegen.builder().build_call(t_fn, &[], "t_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let t_val = t_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(nil_bb);
                        let nil_call = codegen.builder().build_call(nil_fn, &[], "nil_result")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let nil_val = nil_call.as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        codegen.builder().position_at_end(merge_bb);
                        let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "not_result")
                            .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                        phi.add_incoming(&[(&t_val, t_bb), (&nil_val, nil_bb)]);

                        Ok(phi.as_basic_value())
                    }
                    "and" => {
                        // (and) returns T
                        // (and x) returns x
                        // (and x y z...) evaluates left to right, short-circuits on first NIL
                        if args.is_empty() {
                            let t_fn = codegen.module().get_function("cc_t")
                                .ok_or("cc_t not found")?;
                            let call_site = codegen.builder().build_call(t_fn, &[], "and_empty")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            Ok(call_site.as_any_value_enum().into_int_value().into())
                        } else if args.len() == 1 {
                            compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                        } else {
                            let is_nil_fn = codegen.module().get_function("cc_is_nil")
                                .ok_or("cc_is_nil not found")?;
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;

                            let mut current_val = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                            for (i, arg) in args[1..].iter().enumerate() {
                                // Check if current value is nil
                                let is_nil_call = codegen.builder().build_call(
                                    is_nil_fn, &[current_val.into()], &format!("and_is_nil_{}", i)
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                let is_nil_result = is_nil_call.as_any_value_enum().into_int_value();

                                let cond = codegen.builder().build_int_compare(
                                    inkwell::IntPredicate::EQ,
                                    is_nil_result,
                                    context.i32_type().const_zero(),
                                    &format!("and_cond_{}", i)
                                ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                                // Create blocks
                                let continue_bb = context.append_basic_block(
                                    codegen.builder().get_insert_block()
                                        .and_then(|bb| bb.get_parent())
                                        .ok_or("No current function")?,
                                    &format!("and_continue_{}", i)
                                );
                                let short_circuit_bb = context.append_basic_block(
                                    codegen.builder().get_insert_block()
                                        .and_then(|bb| bb.get_parent())
                                        .ok_or("No current function")?,
                                    &format!("and_short_{}", i)
                                );
                                let merge_bb = context.append_basic_block(
                                    codegen.builder().get_insert_block()
                                        .and_then(|bb| bb.get_parent())
                                        .ok_or("No current function")?,
                                    &format!("and_merge_{}", i)
                                );

                                codegen.builder().build_conditional_branch(cond, continue_bb, short_circuit_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                                // Continue block: evaluate next arg
                                codegen.builder().position_at_end(continue_bb);
                                let next_val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                codegen.builder().build_unconditional_branch(merge_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;
                                let continue_bb_end = codegen.builder().get_insert_block().unwrap();

                                // Short-circuit block: return NIL
                                codegen.builder().position_at_end(short_circuit_bb);
                                let nil_call = codegen.builder().build_call(nil_fn, &[], &format!("and_nil_{}", i))
                                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                                let nil_val = nil_call.as_any_value_enum().into_int_value();
                                codegen.builder().build_unconditional_branch(merge_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;
                                let short_circuit_bb_end = codegen.builder().get_insert_block().unwrap();

                                // Merge
                                codegen.builder().position_at_end(merge_bb);
                                let phi = codegen.builder().build_phi(codegen.lisp_object_type(), &format!("and_phi_{}", i))
                                    .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                                phi.add_incoming(&[
                                    (&next_val.into_int_value(), continue_bb_end),
                                    (&nil_val, short_circuit_bb_end),
                                ]);

                                current_val = phi.as_basic_value();
                            }

                            Ok(current_val)
                        }
                    }
                    "or" => {
                        // (or) returns NIL
                        // (or x) returns x
                        // (or x y z...) evaluates left to right, short-circuits on first non-NIL
                        if args.is_empty() {
                            let nil_fn = codegen.module().get_function("cc_nil")
                                .ok_or("cc_nil not found")?;
                            let call_site = codegen.builder().build_call(nil_fn, &[], "or_empty")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            Ok(call_site.as_any_value_enum().into_int_value().into())
                        } else if args.len() == 1 {
                            compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)
                        } else {
                            let is_nil_fn = codegen.module().get_function("cc_is_nil")
                                .ok_or("cc_is_nil not found")?;

                            let mut current_val = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                            for (i, arg) in args[1..].iter().enumerate() {
                                // Check if current value IS nil
                                let is_nil_call = codegen.builder().build_call(
                                    is_nil_fn, &[current_val.into()], &format!("or_is_nil_{}", i)
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                                let is_nil_result = is_nil_call.as_any_value_enum().into_int_value();

                                // If is_nil_result == 0, it's NOT nil, so short-circuit with current value
                                // If is_nil_result != 0, it IS nil, so continue evaluating
                                let cond = codegen.builder().build_int_compare(
                                    inkwell::IntPredicate::EQ,
                                    is_nil_result,
                                    context.i32_type().const_zero(),
                                    &format!("or_cond_{}", i)
                                ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                                // Create blocks
                                let short_circuit_bb = context.append_basic_block(
                                    codegen.builder().get_insert_block()
                                        .and_then(|bb| bb.get_parent())
                                        .ok_or("No current function")?,
                                    &format!("or_short_{}", i)
                                );
                                let continue_bb = context.append_basic_block(
                                    codegen.builder().get_insert_block()
                                        .and_then(|bb| bb.get_parent())
                                        .ok_or("No current function")?,
                                    &format!("or_continue_{}", i)
                                );
                                let merge_bb = context.append_basic_block(
                                    codegen.builder().get_insert_block()
                                        .and_then(|bb| bb.get_parent())
                                        .ok_or("No current function")?,
                                    &format!("or_merge_{}", i)
                                );

                                // If cond is true (NOT nil), go to short_circuit_bb, otherwise continue_bb
                                codegen.builder().build_conditional_branch(cond, short_circuit_bb, continue_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                                // Short-circuit block: return current value
                                codegen.builder().position_at_end(short_circuit_bb);
                                codegen.builder().build_unconditional_branch(merge_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;
                                let short_circuit_bb_end = codegen.builder().get_insert_block().unwrap();

                                // Continue block: evaluate next arg
                                codegen.builder().position_at_end(continue_bb);
                                let next_val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                                codegen.builder().build_unconditional_branch(merge_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;
                                let continue_bb_end = codegen.builder().get_insert_block().unwrap();

                                // Merge
                                codegen.builder().position_at_end(merge_bb);
                                let phi = codegen.builder().build_phi(codegen.lisp_object_type(), &format!("or_phi_{}", i))
                                    .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                                phi.add_incoming(&[
                                    (&current_val.into_int_value(), short_circuit_bb_end),
                                    (&next_val.into_int_value(), continue_bb_end),
                                ]);

                                current_val = phi.as_basic_value();
                            }

                            Ok(current_val)
                        }
                    }

                    "zerop" if args.len() == 1 => {
                        // (zerop x) returns T if x is zero, NIL otherwise
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let zero_val = {
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let zero = context.i64_type().const_zero();
                            let call = codegen.builder().build_call(box_fixnum, &[zero.into()], "zero")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            call.as_any_value_enum().into_int_value()
                        };

                        let eq_fn = codegen.module().get_function("cc_eq")
                            .ok_or("cc_eq not found")?;
                        let eq_result = codegen.builder().build_call(
                            eq_fn, &[arg.into(), zero_val.into()], "is_zero"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        Ok(eq_result.into())
                    }

                    "plusp" if args.len() == 1 => {
                        // (plusp x) returns T if x > 0, NIL otherwise
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let zero_val = {
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let zero = context.i64_type().const_zero();
                            let call = codegen.builder().build_call(box_fixnum, &[zero.into()], "zero")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            call.as_any_value_enum().into_int_value()
                        };

                        let gt_fn = codegen.module().get_function("cc_gt")
                            .ok_or("cc_gt not found")?;
                        let gt_result = codegen.builder().build_call(
                            gt_fn, &[arg.into(), zero_val.into()], "is_positive"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        Ok(gt_result.into())
                    }

                    "minusp" if args.len() == 1 => {
                        // (minusp x) returns T if x < 0, NIL otherwise
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;
                        let zero_val = {
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let zero = context.i64_type().const_zero();
                            let call = codegen.builder().build_call(box_fixnum, &[zero.into()], "zero")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            call.as_any_value_enum().into_int_value()
                        };

                        let lt_fn = codegen.module().get_function("cc_lt")
                            .ok_or("cc_lt not found")?;
                        let lt_result = codegen.builder().build_call(
                            lt_fn, &[arg.into(), zero_val.into()], "is_negative"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        Ok(lt_result.into())
                    }

                    "evenp" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let evenp_fn = codegen.module().get_function("cc_evenp")
                            .ok_or("cc_evenp not found")?;
                        let call_site = codegen.builder().build_call(
                            evenp_fn, &[arg.into()], "evenp_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "oddp" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let oddp_fn = codegen.module().get_function("cc_oddp")
                            .ok_or("cc_oddp not found")?;
                        let call_site = codegen.builder().build_call(
                            oddp_fn, &[arg.into()], "oddp_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "not" if args.len() == 1 => {
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        let not_fn = codegen.module().get_function("cc_not")
                            .ok_or("cc_not not found")?;
                        let call_site = codegen.builder().build_call(
                            not_fn, &[arg.into()], "not_result"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                        let result = call_site.as_any_value_enum().into_int_value();
                        Ok(result.into())
                    }

                    "and" if args.len() >= 1 => {
                        // Short-circuit AND: evaluate args left-to-right, return first NIL or last value
                        let mut current_val = None;

                        for arg in args {
                            let val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                            current_val = Some(val);

                            // If this is not the last arg, check if it's nil and short-circuit
                            if arg as *const _ != args.last().unwrap() as *const _ {
                                let is_nil_fn = codegen.module().get_function("cc_is_nil")
                                    .ok_or("cc_is_nil not found")?;
                                let is_nil = codegen.builder().build_call(
                                    is_nil_fn, &[val.into()], "is_nil"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                    .as_any_value_enum().into_int_value();

                                // If nil, short-circuit and return nil
                                let is_false = codegen.builder().build_int_compare(
                                    inkwell::IntPredicate::NE,
                                    is_nil,
                                    context.i32_type().const_zero(),
                                    "is_false"
                                ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                                let current_fn = codegen.builder().get_insert_block()
                                    .and_then(|bb| bb.get_parent())
                                    .ok_or("No current function")?;

                                let continue_bb = context.append_basic_block(current_fn, "and_continue");
                                let short_circuit_bb = context.append_basic_block(current_fn, "and_short");

                                codegen.builder().build_conditional_branch(is_false, short_circuit_bb, continue_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                                // Short circuit returns nil
                                codegen.builder().position_at_end(short_circuit_bb);
                                let nil_fn = codegen.module().get_function("cc_nil")
                                    .ok_or("cc_nil not found")?;
                                let nil_val = codegen.builder().build_call(nil_fn, &[], "nil")
                                    .map_err(|e| format!("Failed to build call: {:?}", e))?
                                    .as_any_value_enum().into_int_value();

                                // Continue evaluation
                                codegen.builder().position_at_end(continue_bb);
                            }
                        }

                        Ok(current_val.unwrap())
                    }

                    "or" if args.len() >= 1 => {
                        // Short-circuit OR: evaluate args left-to-right, return first non-NIL or NIL
                        let mut current_val = None;

                        for arg in args {
                            let val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                            current_val = Some(val);

                            // If this is not the last arg, check if it's non-nil and short-circuit
                            if arg as *const _ != args.last().unwrap() as *const _ {
                                let is_nil_fn = codegen.module().get_function("cc_is_nil")
                                    .ok_or("cc_is_nil not found")?;
                                let is_nil = codegen.builder().build_call(
                                    is_nil_fn, &[val.into()], "is_nil"
                                ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                    .as_any_value_enum().into_int_value();

                                // If not nil, short-circuit and return value
                                let is_true = codegen.builder().build_int_compare(
                                    inkwell::IntPredicate::EQ,
                                    is_nil,
                                    context.i32_type().const_zero(),
                                    "is_true"
                                ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                                let current_fn = codegen.builder().get_insert_block()
                                    .and_then(|bb| bb.get_parent())
                                    .ok_or("No current function")?;

                                let continue_bb = context.append_basic_block(current_fn, "or_continue");
                                let short_circuit_bb = context.append_basic_block(current_fn, "or_short");

                                codegen.builder().build_conditional_branch(is_true, short_circuit_bb, continue_bb)
                                    .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                                // Short circuit returns the value
                                codegen.builder().position_at_end(short_circuit_bb);

                                // Continue evaluation
                                codegen.builder().position_at_end(continue_bb);
                            }
                        }

                        Ok(current_val.unwrap())
                    }

                    "abs" if args.len() == 1 => {
                        // (abs x) returns |x|
                        let arg = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        // Check if negative
                        let zero_val = {
                            let box_fixnum = codegen.module().get_function("cc_box_fixnum")
                                .ok_or("cc_box_fixnum not found")?;
                            let zero = context.i64_type().const_zero();
                            let call = codegen.builder().build_call(box_fixnum, &[zero.into()], "zero")
                                .map_err(|e| format!("Failed to build call: {:?}", e))?;
                            call.as_any_value_enum().into_int_value()
                        };

                        let is_nil_fn = codegen.module().get_function("cc_is_nil")
                            .ok_or("cc_is_nil not found")?;
                        let lt_fn = codegen.module().get_function("cc_lt")
                            .ok_or("cc_lt not found")?;
                        let sub_fn = codegen.module().get_function("cc_sub")
                            .ok_or("cc_sub not found")?;

                        let lt_result = codegen.builder().build_call(
                            lt_fn, &[arg.into(), zero_val.into()], "is_neg"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        let is_nil = codegen.builder().build_call(
                            is_nil_fn, &[lt_result.into()], "check_nil"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();

                        let cond = codegen.builder().build_int_compare(
                            inkwell::IntPredicate::EQ,
                            is_nil,
                            context.i32_type().const_zero(),
                            "is_negative"
                        ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                        let current_fn = codegen.builder().get_insert_block()
                            .and_then(|bb| bb.get_parent())
                            .ok_or("No current function")?;
                        let negate_bb = context.append_basic_block(current_fn, "negate");
                        let positive_bb = context.append_basic_block(current_fn, "positive");
                        let merge_bb = context.append_basic_block(current_fn, "abs_merge");

                        codegen.builder().build_conditional_branch(cond, negate_bb, positive_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        // Negate branch
                        codegen.builder().position_at_end(negate_bb);
                        let negated = codegen.builder().build_call(
                            sub_fn, &[zero_val.into(), arg.into()], "negated"
                        ).map_err(|e| format!("Failed to build call: {:?}", e))?
                            .as_any_value_enum().into_int_value();
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        // Positive branch
                        codegen.builder().position_at_end(positive_bb);
                        codegen.builder().build_unconditional_branch(merge_bb)
                            .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                        // Merge
                        codegen.builder().position_at_end(merge_bb);
                        let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "abs_result")
                            .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                        phi.add_incoming(&[(&negated, negate_bb), (&arg.into_int_value(), positive_bb)]);

                        Ok(phi.as_basic_value())
                    }

                    "max" if args.len() >= 2 => {
                        // (max x y ...) returns maximum
                        let gt_fn = codegen.module().get_function("cc_gt")
                            .ok_or("cc_gt not found")?;
                        let is_nil_fn = codegen.module().get_function("cc_is_nil")
                            .ok_or("cc_is_nil not found")?;

                        let mut current_max = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        for arg in &args[1..] {
                            let next = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;

                            // Check if next > current_max
                            let gt_result = codegen.builder().build_call(
                                gt_fn, &[next.into(), current_max.into()], "is_greater"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let is_nil = codegen.builder().build_call(
                                is_nil_fn, &[gt_result.into()], "check_nil"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let cond = codegen.builder().build_int_compare(
                                inkwell::IntPredicate::EQ,
                                is_nil,
                                context.i32_type().const_zero(),
                                "use_next"
                            ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                            let current_fn = codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?;
                            let use_next_bb = context.append_basic_block(current_fn, "use_next");
                            let use_current_bb = context.append_basic_block(current_fn, "use_current");
                            let max_merge_bb = context.append_basic_block(current_fn, "max_merge");

                            codegen.builder().build_conditional_branch(cond, use_next_bb, use_current_bb)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            codegen.builder().position_at_end(use_next_bb);
                            codegen.builder().build_unconditional_branch(max_merge_bb)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            codegen.builder().position_at_end(use_current_bb);
                            codegen.builder().build_unconditional_branch(max_merge_bb)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            codegen.builder().position_at_end(max_merge_bb);
                            let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "max_val")
                                .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                            phi.add_incoming(&[(&next.into_int_value(), use_next_bb), (&current_max.into_int_value(), use_current_bb)]);

                            current_max = phi.as_basic_value();
                        }

                        Ok(current_max)
                    }

                    "min" if args.len() >= 2 => {
                        // (min x y ...) returns minimum
                        let lt_fn = codegen.module().get_function("cc_lt")
                            .ok_or("cc_lt not found")?;
                        let is_nil_fn = codegen.module().get_function("cc_is_nil")
                            .ok_or("cc_is_nil not found")?;

                        let mut current_min = compile_ast_to_llvm(context, codegen, &args[0], env, user_functions)?;

                        for arg in &args[1..] {
                            let next = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;

                            // Check if next < current_min
                            let lt_result = codegen.builder().build_call(
                                lt_fn, &[next.into(), current_min.into()], "is_less"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let is_nil = codegen.builder().build_call(
                                is_nil_fn, &[lt_result.into()], "check_nil"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?
                                .as_any_value_enum().into_int_value();

                            let cond = codegen.builder().build_int_compare(
                                inkwell::IntPredicate::EQ,
                                is_nil,
                                context.i32_type().const_zero(),
                                "use_next"
                            ).map_err(|e| format!("Failed to build comparison: {:?}", e))?;

                            let current_fn = codegen.builder().get_insert_block()
                                .and_then(|bb| bb.get_parent())
                                .ok_or("No current function")?;
                            let use_next_bb = context.append_basic_block(current_fn, "use_next");
                            let use_current_bb = context.append_basic_block(current_fn, "use_current");
                            let min_merge_bb = context.append_basic_block(current_fn, "min_merge");

                            codegen.builder().build_conditional_branch(cond, use_next_bb, use_current_bb)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            codegen.builder().position_at_end(use_next_bb);
                            codegen.builder().build_unconditional_branch(min_merge_bb)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            codegen.builder().position_at_end(use_current_bb);
                            codegen.builder().build_unconditional_branch(min_merge_bb)
                                .map_err(|e| format!("Failed to build branch: {:?}", e))?;

                            codegen.builder().position_at_end(min_merge_bb);
                            let phi = codegen.builder().build_phi(codegen.lisp_object_type(), "min_val")
                                .map_err(|e| format!("Failed to build phi: {:?}", e))?;
                            phi.add_incoming(&[(&next.into_int_value(), use_next_bb), (&current_min.into_int_value(), use_current_bb)]);

                            current_min = phi.as_basic_value();
                        }

                        Ok(current_min)
                    }

                    "twice" if args.len() == 1 => {
                        // Macro expansion for (twice x) => (+ x x)
                        let arg = &args[0];
                        let expanded = rlasp::ir::ASTNode::Call {
                            function: Box::new(rlasp::ir::ASTNode::Variable("+".to_string())),
                            args: vec![arg.clone(), arg.clone()],
                        };
                        compile_ast_to_llvm(context, codegen, &expanded, env, user_functions)
                    }

                    _ => {
                        // Handle namespaced function calls (package:function)
                        let base_name = if op.contains(':') {
                            op.split(':').last().unwrap_or(op)
                        } else {
                            op
                        };

                        // Check module first (for local functions), then user_functions
                        let func_name = if codegen.module().get_function(op).is_some() {
                            op
                        } else if codegen.module().get_function(base_name).is_some() {
                            base_name
                        } else if user_functions.contains_key(op) {
                            op
                        } else if user_functions.contains_key(base_name) {
                            base_name
                        } else {
                            return Err(format!("Unsupported function: {}", op));
                        };

                        let func = codegen.module().get_function(func_name)
                            .ok_or(format!("User function {} not found", func_name))?;

                        // Compile arguments
                        let mut arg_vals = Vec::new();
                        for arg in args {
                            let val = compile_ast_to_llvm(context, codegen, arg, env, user_functions)?;
                            arg_vals.push(val.into());
                        }

                        // Call the function
                        let call = codegen.builder().build_call(func, &arg_vals, "user_call")
                            .map_err(|e| format!("Failed to build call: {:?}", e))?;
                        Ok(call.as_any_value_enum().into_int_value().into())
                    }
                }
            } else {
                Err("Function must be a variable".to_string())
            }
        }

        ASTNode::Setq { var, value } => {
            // Look up variable in environment and copy the pointer
            let var_ptr = *env.get(var)
                .ok_or_else(|| format!("Undefined variable: {}", var))?;

            // Compile the value expression
            let val = compile_ast_to_llvm(context, codegen, value, env, user_functions)?;

            // Store the value to the variable
            codegen.builder().build_store(var_ptr, val)
                .map_err(|e| format!("Failed to build store: {:?}", e))?;

            // Return the stored value
            Ok(val)
        }

        ASTNode::Quote(quoted) => {
            // For quoted symbols, create a symbol object
            if let ASTNode::Variable(name) = quoted.as_ref() {
                let make_symbol_fn = codegen.module().get_function("cc_make_symbol")
                    .ok_or("cc_make_symbol not found")?;

                // Create string for symbol name
                let i8_type = context.i8_type();
                let string_type = i8_type.array_type(name.len() as u32);
                let global = codegen.module().add_global(string_type, None, "symbol_name");
                global.set_initializer(&context.const_string(name.as_bytes(), false));
                global.set_constant(true);

                let ptr = codegen.builder().build_pointer_cast(
                    global.as_pointer_value(),
                    context.ptr_type(inkwell::AddressSpace::default()),
                    "symbol_str_ptr"
                ).map_err(|e| format!("Failed to cast pointer: {:?}", e))?;

                let len_val = context.i64_type().const_int(name.len() as u64, false);
                let call_site = codegen.builder().build_call(
                    make_symbol_fn, &[ptr.into(), len_val.into()], "symbol"
                ).map_err(|e| format!("Failed to build call: {:?}", e))?;

                Ok(call_site.as_any_value_enum().into_int_value().into())
            } else if let ASTNode::Call { function, args } = quoted.as_ref() {
                // Quoted list '(a b c) is represented as Call - always build as runtime list
                let cons_fn = codegen.module().get_function("cc_cons")
                    .ok_or("cc_cons not found")?;
                let nil_fn = codegen.module().get_function("cc_nil")
                    .ok_or("cc_nil not found")?;

                // Start with nil
                let nil_call = codegen.builder().build_call(nil_fn, &[], "nil_result")
                    .map_err(|e| format!("Failed to build call: {:?}", e))?;
                let mut list_val = nil_call.as_any_value_enum().into_int_value();

                // Build list in reverse order (cons from right to left)
                let mut all_elements = vec![function.as_ref()];
                all_elements.extend(args.iter());

                for elem in all_elements.iter().rev() {
                    // For each element, compile it as a quoted value
                    let elem_val = match elem {
                        ASTNode::Variable(v) => {
                            // Quote the variable to create a symbol
                            let make_symbol_fn = codegen.module().get_function("cc_make_symbol")
                                .ok_or("cc_make_symbol not found")?;
                            let i8_type = context.i8_type();
                            let string_type = i8_type.array_type(v.len() as u32);
                            let global = codegen.module().add_global(string_type, None, "quoted_sym");
                            global.set_initializer(&context.const_string(v.as_bytes(), false));
                            global.set_constant(true);
                            let ptr = codegen.builder().build_pointer_cast(
                                global.as_pointer_value(),
                                context.ptr_type(inkwell::AddressSpace::default()),
                                "quoted_sym_ptr"
                            ).map_err(|e| format!("Failed to cast pointer: {:?}", e))?;
                            let len_val = context.i64_type().const_int(v.len() as u64, false);
                            let call_site = codegen.builder().build_call(
                                make_symbol_fn, &[ptr.into(), len_val.into()], "quoted_symbol"
                            ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                            call_site.as_any_value_enum().into_int_value().into()
                        }
                        ASTNode::Constant(_) => {
                            compile_ast_to_llvm(context, codegen, elem, env, user_functions)?
                        }
                        ASTNode::Quote(inner) => {
                            compile_ast_to_llvm(context, codegen, elem, env, user_functions)?
                        }
                        ASTNode::Call { .. } => {
                            // Nested quoted list - recursively compile as quoted
                            compile_ast_to_llvm(context, codegen, &ASTNode::Quote(Box::new((*elem).clone())), env, user_functions)?
                        }
                        _ => {
                            compile_ast_to_llvm(context, codegen, elem, env, user_functions)?
                        }
                    };
                    let cons_call = codegen.builder().build_call(
                        cons_fn, &[elem_val.into(), list_val.into()], "cons_result"
                    ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                    list_val = cons_call.as_any_value_enum().into_int_value();
                }

                Ok(list_val.into())
            } else {
                // For other quoted forms (constants, etc.), compile recursively
                compile_ast_to_llvm(context, codegen, quoted, env, user_functions)
            }
        }

        ASTNode::Lambda { params, body, .. } => {
            // Generate unique name for lambda
            use std::sync::atomic::{AtomicUsize, Ordering};
            static LAMBDA_COUNTER: AtomicUsize = AtomicUsize::new(0);
            let lambda_id = LAMBDA_COUNTER.fetch_add(1, Ordering::SeqCst);
            let lambda_name = format!("__lambda_{}", lambda_id);

            // Save current insert point
            let current_bb = codegen.builder().get_insert_block();
            let current_fn = current_bb.and_then(|bb| bb.get_parent());

            // Find free variables (variables used in lambda but not in params)
            let mut free_vars = std::collections::HashSet::new();
            for expr in body {
                collect_free_vars(expr, &params.iter().cloned().collect(), &mut free_vars);
            }

            // Filter to only include variables that are actually in the environment
            let captured_vars: Vec<String> = free_vars.into_iter()
                .filter(|v| env.contains_key(v))
                .collect();

            // Create function signature for lambda (params + closure pointer if needed)
            let i64_type = context.i64_type();
            let mut all_param_types: Vec<_> = params.iter().map(|_| i64_type.into()).collect();

            // Add closure pointer parameter if there are captured variables
            if !captured_vars.is_empty() {
                all_param_types.push(context.ptr_type(inkwell::AddressSpace::default()).into());
            }

            let fn_type = i64_type.fn_type(&all_param_types, false);
            let lambda_func = codegen.module().add_function(&lambda_name, fn_type, None);

            // Create entry block for lambda
            let entry_bb = context.append_basic_block(lambda_func, "entry");
            codegen.builder().position_at_end(entry_bb);

            // Create new environment for lambda with parameters
            let mut lambda_env = std::collections::HashMap::new();
            for (i, param_name) in params.iter().enumerate() {
                let param_val = lambda_func.get_nth_param(i as u32).unwrap().into_int_value();
                // Allocate space for parameter
                let param_alloca = codegen.builder().build_alloca(i64_type, param_name)
                    .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
                codegen.builder().build_store(param_alloca, param_val)
                    .map_err(|e| format!("Failed to build store: {:?}", e))?;
                lambda_env.insert(param_name.clone(), param_alloca);
            }

            // If there are captured variables, unpack them from closure pointer
            if !captured_vars.is_empty() {
                let closure_ptr_param = lambda_func.get_nth_param(params.len() as u32).unwrap().into_pointer_value();

                for (idx, var_name) in captured_vars.iter().enumerate() {
                    // Load captured value from closure struct
                    let gep = codegen.builder().build_struct_gep(
                        context.struct_type(&vec![i64_type.into(); captured_vars.len()], false),
                        closure_ptr_param,
                        idx as u32,
                        &format!("closure_{}", var_name)
                    ).map_err(|e| format!("Failed to build GEP: {:?}", e))?;

                    let captured_val = codegen.builder().build_load(i64_type, gep, &format!("load_{}", var_name))
                        .map_err(|e| format!("Failed to build load: {:?}", e))?
                        .into_int_value();

                    // Allocate local storage for captured variable
                    let var_alloca = codegen.builder().build_alloca(i64_type, var_name)
                        .map_err(|e| format!("Failed to build alloca: {:?}", e))?;
                    codegen.builder().build_store(var_alloca, captured_val)
                        .map_err(|e| format!("Failed to build store: {:?}", e))?;

                    lambda_env.insert(var_name.clone(), var_alloca);
                }
            }

            // Compile lambda body
            let mut result = None;
            for expr in body {
                result = Some(compile_ast_to_llvm(context, codegen, expr, &mut lambda_env, user_functions)?);
            }
            let return_val = result.ok_or("Lambda body is empty")?;

            // Build return
            codegen.builder().build_return(Some(&return_val.into_int_value()))
                .map_err(|e| format!("Failed to build return: {:?}", e))?;

            // Restore insert point to original function
            if let Some(fn_val) = current_fn {
                if let Some(bb) = current_bb {
                    codegen.builder().position_at_end(bb);
                }
            }

            // If there are captured variables, create a closure struct
            let closure_val = if !captured_vars.is_empty() {
                // Allocate closure struct on heap using malloc
                let closure_struct_type = context.struct_type(&vec![i64_type.into(); captured_vars.len()], false);
                let closure_size = context.i64_type().const_int(
                    (captured_vars.len() * 8) as u64, // Each i64 is 8 bytes
                    false
                );

                // Declare malloc if not already declared
                let malloc_fn = codegen.module().get_function("malloc")
                    .unwrap_or_else(|| {
                        let malloc_type = context.ptr_type(inkwell::AddressSpace::default())
                            .fn_type(&[context.i64_type().into()], false);
                        codegen.module().add_function("malloc", malloc_type, None)
                    });

                // Call malloc to allocate closure
                let malloc_call = codegen.builder().build_call(
                    malloc_fn,
                    &[closure_size.into()],
                    "malloc_closure"
                ).map_err(|e| format!("Failed to build malloc call: {:?}", e))?;
                let closure_ptr = malloc_call.as_any_value_enum().into_pointer_value();

                // Store captured values into closure struct
                for (idx, var_name) in captured_vars.iter().enumerate() {
                    if let Some(var_ptr) = env.get(var_name) {
                        // Load current value of captured variable
                        let var_val = codegen.builder().build_load(i64_type, *var_ptr, &format!("load_{}", var_name))
                            .map_err(|e| format!("Failed to build load: {:?}", e))?
                            .into_int_value();

                        // Store into closure struct
                        let gep = codegen.builder().build_struct_gep(
                            closure_struct_type,
                            closure_ptr,
                            idx as u32,
                            &format!("closure_store_{}", var_name)
                        ).map_err(|e| format!("Failed to build GEP: {:?}", e))?;

                        codegen.builder().build_store(gep, var_val)
                            .map_err(|e| format!("Failed to build store: {:?}", e))?;
                    }
                }

                // Create a cons cell with (function-ptr . closure-ptr)
                let fn_as_value = lambda_func.as_global_value().as_pointer_value();
                let fn_ptr_int = codegen.builder().build_ptr_to_int(
                    fn_as_value,
                    context.i64_type(),
                    "lambda_ptr"
                ).map_err(|e| format!("Failed to build ptr_to_int: {:?}", e))?;

                let closure_ptr_int = codegen.builder().build_ptr_to_int(
                    closure_ptr,
                    context.i64_type(),
                    "closure_ptr_int"
                ).map_err(|e| format!("Failed to build ptr_to_int: {:?}", e))?;

                // Box both pointers
                let box_fn = codegen.module().get_function("cc_box_function_ptr")
                    .ok_or("cc_box_function_ptr not found")?;
                let boxed_fn = codegen.builder().build_call(
                    box_fn, &[fn_ptr_int.into()], "boxed_fn"
                ).map_err(|e| format!("Failed to build call: {:?}", e))?
                    .as_any_value_enum().into_int_value();

                let boxed_closure = codegen.builder().build_call(
                    box_fn, &[closure_ptr_int.into()], "boxed_closure_ptr"
                ).map_err(|e| format!("Failed to build call: {:?}", e))?
                    .as_any_value_enum().into_int_value();

                // Cons them together (fn-ptr . closure-ptr)
                let cons_fn = codegen.module().get_function("cc_cons")
                    .ok_or("cc_cons not found")?;
                let cons_call = codegen.builder().build_call(
                    cons_fn,
                    &[boxed_fn.into(), boxed_closure.into()],
                    "closure_cons"
                ).map_err(|e| format!("Failed to build cons: {:?}", e))?;
                cons_call.as_any_value_enum().into_int_value()
            } else {
                // No captured variables, just return function pointer
                let fn_as_value = lambda_func.as_global_value().as_pointer_value();
                let fn_ptr_int = codegen.builder().build_ptr_to_int(
                    fn_as_value,
                    context.i64_type(),
                    "lambda_ptr"
                ).map_err(|e| format!("Failed to build ptr_to_int: {:?}", e))?;

                let box_fn = codegen.module().get_function("cc_box_function_ptr")
                    .ok_or("cc_box_function_ptr not found")?;
                let boxed_fn = codegen.builder().build_call(
                    box_fn, &[fn_ptr_int.into()], "boxed_lambda"
                ).map_err(|e| format!("Failed to build call: {:?}", e))?;
                boxed_fn.as_any_value_enum().into_int_value()
            };

            Ok(closure_val.into())
        }

        _ => Err(format!("Unsupported AST node: {:?}", ast))
    }
}

fn compile_ast_to_llvm_with_funcs<'ctx>(
    context: &'ctx inkwell::context::Context,
    codegen: &rlasp_jit::CodeGenerator<'ctx>,
    ast: &rlasp::ir::ASTNode,
    env: &mut std::collections::HashMap<String, inkwell::values::PointerValue<'ctx>>,
    user_functions: &std::collections::HashMap<String, Vec<String>>,
) -> std::result::Result<inkwell::values::BasicValueEnum<'ctx>, String> {
    // Just delegate to compile_ast_to_llvm which now handles user functions
    compile_ast_to_llvm(context, codegen, ast, env, user_functions)
}

fn eval_file_llvm(source: &str, file_path: &str) -> std::result::Result<(), String> {
    use rlasp_jit::CodeGenerator;
    use inkwell::context::Context;
    use std::path::Path;
    use rlasp::repl::{lisp_to_ast, EvalResult};
    use std::collections::HashMap;

    // Create LLVM context and module
    let context = Context::create();
    let module_name = Path::new(file_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("module");

    let codegen = CodeGenerator::new(&context, module_name);
    codegen.declare_intrinsics();

    // Read all forms from the file
    let lisp_objs = rlasp_reader::read_all_from_string(source)
        .map_err(|e| format!("Read error: {}", e))?;

    let mut form_count = 0;
    let mut compiled_any = false;
    let mut user_functions: HashMap<String, Vec<String>> = HashMap::new();
    let mut defuns: Vec<(String, Vec<String>, Vec<rlasp::ir::ASTNode>)> = Vec::new();
    let mut generic_functions: HashMap<String, Vec<String>> = HashMap::new();
    let mut macros: HashMap<String, (Vec<String>, rlasp::ir::ASTNode)> = HashMap::new();
    let mut interp_env: HashMap<String, EvalResult> = HashMap::new();

    // First pass: collect and declare all defuns, defgenerics, and defmethods
    for lisp_obj in &lisp_objs {
        match lisp_to_ast::with_read_time_env(&mut interp_env, || {
            lisp_to_ast::lisp_to_ast(lisp_obj.clone())
        }) {
            Ok(ast) => {
                // Check if this is a defun (setq name (lambda ...))
                if let rlasp::ir::ASTNode::Setq { var, value } = &ast {
                    if let rlasp::ir::ASTNode::Lambda { params, body, .. } = value.as_ref() {
                        // Declare the function signature
                        let i64_type = context.i64_type();
                        let param_types: Vec<_> = params.iter().map(|_| i64_type.into()).collect();
                        let fn_type = i64_type.fn_type(&param_types, false);
                        codegen.module().add_function(var, fn_type, None);

                        // Save for later compilation
                        defuns.push((var.clone(), params.clone(), body.clone()));
                        user_functions.insert(var.clone(), params.clone());
                    }
                }
                // Check for defgeneric
                else if let rlasp::ir::ASTNode::Call { function, args } = &ast {
                    if let rlasp::ir::ASTNode::Variable(op) = function.as_ref() {
                        if op == "defgeneric" && !args.is_empty() {
                            if let rlasp::ir::ASTNode::Variable(name) = &args[0] {
                                // Extract parameters if present
                                let params = if args.len() > 1 {
                                    if let rlasp::ir::ASTNode::Call { args: param_list, .. } = &args[1] {
                                        param_list.iter().filter_map(|p| {
                                            if let rlasp::ir::ASTNode::Variable(v) = p {
                                                Some(v.clone())
                                            } else {
                                                None
                                            }
                                        }).collect()
                                    } else {
                                        Vec::new()
                                    }
                                } else {
                                    vec!["arg".to_string()] // default one parameter
                                };

                                // Declare the generic function
                                let i64_type = context.i64_type();
                                let param_types: Vec<_> = params.iter().map(|_| i64_type.into()).collect();
                                let fn_type = i64_type.fn_type(&param_types, false);
                                codegen.module().add_function(name, fn_type, None);

                                generic_functions.insert(name.clone(), params.clone());
                                user_functions.insert(name.clone(), params.clone());
                            }
                        }
                        // Check for defclass
                        else if op == "defclass" && !args.is_empty() {
                            // defclass just declares a class, no compilation needed
                            // Just mark it as processed, don't add to defuns
                        }
                        // Check for defmacro
                        else if op == "defmacro" && args.len() >= 2 {
                            if let rlasp::ir::ASTNode::Variable(name) = &args[0] {
                                // Extract parameters
                                let params = macro_params_to_vec(&args[1]);

                                // Store the macro body (should be a backquote template)
                                // For now, just store the first body expression
                                if args.len() > 2 {
                                    macros.insert(name.clone(), (params, args[2].clone()));
                                }
                            }
                        }
                        // Check for defmethod
                        else if op == "defmethod" && args.len() >= 2 {
                            if let rlasp::ir::ASTNode::Variable(name) = &args[0] {
                                // Use params from defgeneric if available, otherwise extract
                                let params: Vec<String> = if let Some(generic_params) = generic_functions.get(name) {
                                    // Use the generic function's parameters
                                    generic_params.clone()
                                } else {
                                    // Extract parameters from ((param type)) or similar formats
                                    // defmethod can have: (defmethod name ((p type)) body...)
                                    // where args[1] might be ((p type)) or just (p)
                                    if args.len() >= 2 {
                                        // Try multiple strategies to extract parameters
                                        let mut extracted_params = Vec::new();

                                        // Strategy 1: args[1] = Call { function: <param_def>, args: [] }
                                        // This is the same structure as flet/labels
                                        if let rlasp::ir::ASTNode::Call { function: param_def, args: empty_args } = &args[1] {
                                            if empty_args.is_empty() {
                                                // Extract from function field
                                                // param_def is Call { function: Variable(name), args: [type] }
                                                if let rlasp::ir::ASTNode::Call { function: param_name_node, args: type_spec } = param_def.as_ref() {
                                                    if let rlasp::ir::ASTNode::Variable(param_name) = param_name_node.as_ref() {
                                                        extracted_params.push(param_name.clone());
                                                    }
                                                }
                                            } else {
                                                // args[1] is a Call with non-empty args (list of param defs)
                                                for p in empty_args {
                                                    match p {
                                                        // (p type) - Call with param and type
                                                        rlasp::ir::ASTNode::Call { args: type_spec, .. } if !type_spec.is_empty() => {
                                                            if let rlasp::ir::ASTNode::Variable(param_name) = &type_spec[0] {
                                                                extracted_params.push(param_name.clone());
                                                            }
                                                        }
                                                        // p - just a variable
                                                        rlasp::ir::ASTNode::Variable(param_name) => {
                                                            extracted_params.push(param_name.clone());
                                                        }
                                                        _ => {}
                                                    }
                                                }
                                            }
                                        }
                                        // Strategy 2: args[1] is just a single variable
                                        else if let rlasp::ir::ASTNode::Variable(single_param) = &args[1] {
                                            extracted_params.push(single_param.clone());
                                        }

                                        // If we didn't extract any params, default to one parameter
                                        if extracted_params.is_empty() {
                                            vec!["arg0".to_string()]
                                        } else {
                                            extracted_params
                                        }
                                    } else {
                                        vec![]
                                    }
                                };

                                let body: Vec<_> = args[2..].to_vec();

                                // Declare or get the function
                                let i64_type = context.i64_type();
                                let param_types: Vec<_> = params.iter().map(|_| i64_type.into()).collect();
                                let fn_type = i64_type.fn_type(&param_types, false);

                                if codegen.module().get_function(name).is_none() {
                                    codegen.module().add_function(name, fn_type, None);
                                }

                                // Save for later compilation
                                defuns.push((name.clone(), params.clone(), body));
                                user_functions.insert(name.clone(), params.clone());
                            }
                        }
                    }
                }
            }
            Err(_) => {}
        }
    }

    // Second pass: compile all defun bodies (now all functions are declared)
    for (name, params, body) in &defuns {
        match compile_defun(&context, &codegen, name, params, body, &user_functions) {
            Ok(_) => {
                compiled_any = true;
            }
            Err(e) => {
                println!("[Warning: Could not compile defun {}: {}]", name, e);
            }
        }
    }

    // Second pass: compile other forms
    for lisp_obj in &lisp_objs {
        match lisp_to_ast::with_read_time_env(&mut interp_env, || {
            lisp_to_ast::lisp_to_ast(lisp_obj.clone())
        }) {
            Ok(ast) => {
                // Skip defuns (already compiled)
                if let rlasp::ir::ASTNode::Setq { value, .. } = &ast {
                    if matches!(value.as_ref(), rlasp::ir::ASTNode::Lambda { .. }) {
                        form_count += 1;
                        continue;
                    }
                }

                // Skip defgeneric, defmethod, defmacro, defclass (already handled in first pass)
                if let rlasp::ir::ASTNode::Call { function, .. } = &ast {
                    if let rlasp::ir::ASTNode::Variable(op) = function.as_ref() {
                        if op == "defgeneric" || op == "defmethod" || op == "defmacro" || op == "defclass" {
                            form_count += 1;
                            continue;
                        }
                    }
                }

                // Check if this is a compilable form
                if is_jit_compilable(&ast) {
                    let func_name = format!("__form_{}", form_count);
                    match compile_toplevel_form_with_funcs(&context, &codegen, &ast, &func_name, &user_functions) {
                        Ok(_) => {
                            compiled_any = true;
                        }
                        Err(e) => {
                            println!("[Warning: Could not compile form {}: {}]", form_count, e);
                        }
                    }
                }
            }
            Err(_) => {}
        }
        form_count += 1;
    }

    // Save IR to file
    let ir_path = format!("/tmp/{}.ll", module_name);
    println!("[Generating LLVM IR: {}]", ir_path);

    use std::fs::File;
    use std::io::Write;

    let ir_string = codegen.module().print_to_string().to_string();
    let mut file = File::create(&ir_path)
        .map_err(|e| format!("Failed to create IR file: {}", e))?;
    file.write_all(ir_string.as_bytes())
        .map_err(|e| format!("Failed to write IR file: {}", e))?;

    println!("[Saved LLVM IR to: {}]", ir_path);

    // Save bitcode to file
    let bc_path = format!("/tmp/{}.bc", module_name);
    codegen.module().write_bitcode_to_path(std::path::Path::new(&bc_path));
    println!("[Saved LLVM bitcode to: {}]", bc_path);

    println!("[Compiled {} forms total, {} defuns, {} other]", form_count, user_functions.len(), if compiled_any { "some" } else { "none" });

    // Create JIT engine for actual execution
    let jit_engine = codegen.into_jit_engine()
        .map_err(|e| format!("Failed to create JIT engine: {}", e))?;

    println!("[JIT engine created, executing compiled functions]");

    // Track if we successfully JIT-executed any top-level forms
    let mut jit_executed_count = 0;
    let mut form_idx = 0;

    // Execute top-level forms that aren't defuns via JIT
    for lisp_obj in lisp_objs.iter() {
        match lisp_to_ast::with_read_time_env(&mut interp_env, || {
            lisp_to_ast::lisp_to_ast(lisp_obj.clone())
        }) {
            Ok(ast) => {
                // Skip defuns (already compiled)
                if let rlasp::ir::ASTNode::Setq { var, value } = &ast {
                    if matches!(value.as_ref(), rlasp::ir::ASTNode::Lambda { .. }) {
                        form_idx += 1;
                        continue;
                    }
                }

                // Execute the compiled __form_N function if JIT-compilable
                if is_jit_compilable(&ast) {
                    let func_name = format!("__form_{}", form_idx);
                    match execute_jit_form(&jit_engine, &func_name) {
                        Ok(result) => {
                            println!("=> {}", format_jit_result(result));
                            jit_executed_count += 1;
                        }
                        Err(e) => {
                            println!("[Warning: JIT execution failed for {}: {}]", func_name, e);
                        }
                    }
                }
            }
            Err(_) => {}
        }
        form_idx += 1;
    }

    println!("[JIT execution: {} functions compiled, {} forms executed]", user_functions.len(), jit_executed_count);

    Ok(())
}

fn execute_jit_form(
    jit_engine: &rlasp_jit::JitEngine,
    func_name: &str,
) -> std::result::Result<i64, String> {
    unsafe {
        let func = jit_engine.get_function_0(func_name)
            .map_err(|e| format!("Function {} not found: {}", func_name, e))?;
        let result = func.call();
        Ok(result as i64)
    }
}

fn execute_jit_call(
    jit_engine: &rlasp_jit::JitEngine,
    func_name: &str,
    args: &[rlasp::ir::ASTNode],
    user_functions: &std::collections::HashMap<String, Vec<String>>,
) -> std::result::Result<i64, String> {
    use rlasp::ir::{ASTNode, ConstantValue};

    // Get function parameter count
    let param_count = user_functions.get(func_name)
        .map(|params| params.len())
        .unwrap_or(0);

    // Evaluate arguments (must be constants for now)
    let mut arg_values = Vec::new();
    for arg in args {
        match arg {
            ASTNode::Constant(ConstantValue::Fixnum(n)) => arg_values.push(*n as i64),
            _ => return Err("Only fixnum arguments supported for JIT calls".to_string()),
        }
    }

    if arg_values.len() != param_count {
        return Err(format!("Argument count mismatch: expected {}, got {}", param_count, arg_values.len()));
    }

    // Execute based on parameter count
    unsafe {
        match param_count {
            0 => {
                let func = jit_engine.get_function_0(func_name)?;
                let result_ptr = func.call();
                Ok(rlasp_jit::intrinsics::cc_unbox_fixnum(result_ptr))
            }
            1 => {
                let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn(usize) -> usize> =
                    jit_engine.execution_engine().get_function(func_name)
                    .map_err(|e| format!("Function '{}' not found: {}", func_name, e))?;
                let arg0_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[0]);
                let result_ptr = func.call(arg0_ptr);
                Ok(rlasp_jit::intrinsics::cc_unbox_fixnum(result_ptr))
            }
            2 => {
                let func = jit_engine.get_function_2(func_name)?;
                let arg0_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[0]);
                let arg1_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[1]);
                let result_ptr = func.call(arg0_ptr, arg1_ptr);
                Ok(rlasp_jit::intrinsics::cc_unbox_fixnum(result_ptr))
            }
            3 => {
                let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn(usize, usize, usize) -> usize> =
                    jit_engine.execution_engine().get_function(func_name)
                    .map_err(|e| format!("Function '{}' not found: {}", func_name, e))?;
                let arg0_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[0]);
                let arg1_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[1]);
                let arg2_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[2]);
                let result_ptr = func.call(arg0_ptr, arg1_ptr, arg2_ptr);
                Ok(rlasp_jit::intrinsics::cc_unbox_fixnum(result_ptr))
            }
            4 => {
                let func: inkwell::execution_engine::JitFunction<unsafe extern "C" fn(usize, usize, usize, usize) -> usize> =
                    jit_engine.execution_engine().get_function(func_name)
                    .map_err(|e| format!("Function '{}' not found: {}", func_name, e))?;
                let arg0_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[0]);
                let arg1_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[1]);
                let arg2_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[2]);
                let arg3_ptr = rlasp_jit::intrinsics::cc_box_fixnum(arg_values[3]);
                let result_ptr = func.call(arg0_ptr, arg1_ptr, arg2_ptr, arg3_ptr);
                Ok(rlasp_jit::intrinsics::cc_unbox_fixnum(result_ptr))
            }
            _ => Err(format!("Functions with {} parameters not yet supported for JIT execution", param_count))
        }
    }
}

fn format_jit_result(val: i64) -> String {
    use rlasp_runtime::LispObject;

    let val_usize = val as usize;
    let obj = unsafe { LispObject::from_raw(val_usize) };

    // Check for special values first
    if obj.is_nil() {
        "NIL".to_string()
    } else if let Some(fixnum) = obj.as_fixnum() {
        format!("(fixnum {})", fixnum)
    } else if obj.is_number() {
        // Format heap-allocated numbers
        if let Some(ptr) = obj.as_general_ptr::<rlasp_runtime::Number>() {
            if ptr.is_null() {
                return "#<NULL-NUMBER>".to_string();
            }
            let num = unsafe { &*ptr };
            match &num.value {
                rlasp_runtime::NumberValue::Bignum(b) => format!("(bignum {})", b),
                rlasp_runtime::NumberValue::Ratio(r) => format!("(ratio {} {})", r.numerator_ref(), r.denominator_ref()),
                rlasp_runtime::NumberValue::Float(f) => format!("(float {})", f),
                rlasp_runtime::NumberValue::Complex(c) => format!("(complex {} {})", c.re, c.im),
            }
        } else {
            format!("Value(0x{:x})", val_usize)
        }
    } else {
        // For debugging: print raw value
        format!("Value(0x{:x})", val_usize)
    }
}

fn is_jit_compilable(ast: &rlasp::ir::ASTNode) -> bool {
    use rlasp::ir::ASTNode;
    match ast {
        ASTNode::Constant(_) => true,
        ASTNode::Variable(_) => true,
        ASTNode::Let { .. } => true,
        ASTNode::LetStar { .. } => true,
        ASTNode::If { .. } => true,
        ASTNode::Cond { .. } => true,
        ASTNode::Progn { .. } => true,
        ASTNode::Block { .. } => true,
        ASTNode::Dotimes { .. } => true,
        ASTNode::Dolist { .. } => true,
        ASTNode::Loop { .. } => true,
        ASTNode::Setq { .. } => true,
        ASTNode::Call { .. } => true,
        _ => false, // defun, defpackage, etc. not supported
    }
}

fn compile_defun<'ctx>(
    context: &'ctx inkwell::context::Context,
    codegen: &rlasp_jit::CodeGenerator<'ctx>,
    name: &str,
    params: &[String],
    body: &[rlasp::ir::ASTNode],
    user_functions: &std::collections::HashMap<String, Vec<String>>,
) -> std::result::Result<(), String> {
    let i64_type = context.i64_type();

    // Get the function (should already be declared)
    let function = codegen.module().get_function(name)
        .ok_or(format!("Function {} not found", name))?;

    let entry_block = context.append_basic_block(function, "entry");
    codegen.builder().position_at_end(entry_block);

    // Create environment with parameters (allocate them on stack)
    let mut env = std::collections::HashMap::new();
    for (i, param_name) in params.iter().enumerate() {
        let param_val = function.get_nth_param(i as u32)
            .ok_or(format!("Missing parameter {}", i))?
            .into_int_value();

        // Allocate stack space for the parameter
        let alloca = codegen.builder().build_alloca(i64_type, param_name)
            .map_err(|e| format!("Failed to build alloca: {:?}", e))?;

        // Store parameter value
        codegen.builder().build_store(alloca, param_val)
            .map_err(|e| format!("Failed to build store: {:?}", e))?;

        env.insert(param_name.clone(), alloca);
    }

    // Compile body
    let mut last_result = None;
    for expr in body {
        last_result = Some(compile_ast_to_llvm_with_funcs(context, codegen, expr, &mut env, user_functions)?);
    }

    // Return last result or NIL
    let result = if let Some(val) = last_result {
        val
    } else {
        let nil_fn = codegen.module().get_function("cc_nil")
            .ok_or("cc_nil not found")?;
        let call = codegen.builder().build_call(nil_fn, &[], "nil")
            .map_err(|e| format!("Failed to build call: {:?}", e))?;
        call.as_any_value_enum().into_int_value().into()
    };

    codegen.builder().build_return(Some(&result.into_int_value()))
        .map_err(|e| format!("Failed to build return: {:?}", e))?;

    Ok(())
}

fn compile_toplevel_form_with_funcs<'ctx>(
    context: &'ctx inkwell::context::Context,
    codegen: &rlasp_jit::CodeGenerator<'ctx>,
    ast: &rlasp::ir::ASTNode,
    func_name: &str,
    user_functions: &std::collections::HashMap<String, Vec<String>>,
) -> std::result::Result<(), String> {
    let i64_type = context.i64_type();
    let fn_type = i64_type.fn_type(&[], false);
    let function = codegen.module().add_function(func_name, fn_type, None);

    let entry_block = context.append_basic_block(function, "entry");
    codegen.builder().position_at_end(entry_block);

    let mut env = std::collections::HashMap::new();
    let result_val = compile_ast_to_llvm_with_funcs(context, codegen, ast, &mut env, user_functions)?;
    codegen.builder().build_return(Some(&result_val))
        .map_err(|e| format!("Failed to build return: {:?}", e))?;

    Ok(())
}

fn compile_toplevel_form<'ctx>(
    context: &'ctx inkwell::context::Context,
    codegen: &rlasp_jit::CodeGenerator<'ctx>,
    ast: &rlasp::ir::ASTNode,
    func_name: &str,
) -> std::result::Result<(), String> {
    let empty_funcs = std::collections::HashMap::new();
    compile_toplevel_form_with_funcs(context, codegen, ast, func_name, &empty_funcs)
}

fn is_complete_expression(input: &str) -> bool {
    let mut depth = 0;
    let mut in_string = false;
    let mut in_comment = false;
    let mut chars = input.chars().peekable();

    while let Some(ch) = chars.next() {
        if in_comment {
            if ch == '\n' {
                in_comment = false;
            }
            continue;
        }

        if in_string {
            if ch == '\\' {
                chars.next();
            } else if ch == '"' {
                in_string = false;
            }
            continue;
        }

        match ch {
            ';' => in_comment = true,
            '"' => in_string = true,
            '(' => depth += 1,
            ')' => depth -= 1,
            _ => {}
        }
    }

    !in_string && depth == 0 && !input.trim().is_empty()
}

fn is_only_comments(input: &str) -> bool {
    let mut in_string = false;
    let mut in_comment = false;
    let mut chars = input.chars();

    while let Some(ch) = chars.next() {
        if in_comment {
            if ch == '\n' {
                in_comment = false;
            }
            continue;
        }

        if in_string {
            if ch == '\\' {
                chars.next();
            } else if ch == '"' {
                in_string = false;
            }
            return false;
        }

        match ch {
            ';' => in_comment = true,
            '"' => in_string = true,
            c if c.is_whitespace() => continue,
            _ => return false,
        }
    }

    true
}

fn print_help() {
    println!("Commands:");
    println!("  :help, :h    - Show this help");
    println!("  :quit, :q    - Exit REPL");
    println!();
    println!("Execution modes:");
    println!("  interpreter  - Use AST interpreter (default)");
    println!("  llvm         - Use LLVM ORC JIT compiler");
}
