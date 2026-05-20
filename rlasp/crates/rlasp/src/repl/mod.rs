pub mod eval;
pub mod lisp_to_ast;
/// REPL - Read-Eval-Print Loop
pub mod reader;

use reader::Reader;
use std::collections::HashMap;
use std::io::{self, Write};
use std::os::raw::c_int;
use std::sync::Arc;

pub use eval::*;
pub use reader::*;

use crate::semantic_executor::InterpreterExecutor;
use rlasp_compiler::{compile_unit_with_expander, CompilationMode, Expander, SemanticUnit};
use rlasp_ffi::{ForeignFunction, Library};
use rlasp_runtime::header::{ObjectType, TypeHeader};
use rlasp_runtime::{LispObject, RString, Symbol};

/// Type for Rust functions exposed to Lisp
pub type RustFn = fn(&[LispObject]) -> Result<LispObject, String>;
pub type RustCAbiFn =
    unsafe extern "C" fn(argc: usize, argv: *const usize, result_out: *mut usize) -> c_int;

type RustFnDyn = dyn Fn(&[LispObject]) -> Result<LispObject, String> + Send + Sync;

fn lisp_object_to_eval_result(obj: &LispObject) -> EvalResult {
    if obj.is_nil() {
        return EvalResult::Nil;
    }
    if obj.raw() == LispObject::t().raw() {
        return EvalResult::Bool(true);
    }
    if let Some(n) = obj.as_fixnum() {
        return EvalResult::Fixnum(n);
    }
    if let Some(f) = obj.as_float() {
        return EvalResult::Float(f);
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
                        _ => {}
                    }
                }
            }
        }
    }
    EvalResult::String(format!("{}", obj))
}

/// REPL state
pub struct Repl {
    env: HashMap<String, EvalResult>,
    libraries: HashMap<String, Library>,
    foreign_functions: HashMap<String, ForeignFunction>,
    rust_functions: HashMap<String, Arc<RustFnDyn>>,
    expander: Expander,
}

impl Repl {
    pub fn new() -> Self {
        Self {
            env: HashMap::new(),
            libraries: HashMap::new(),
            foreign_functions: HashMap::new(),
            rust_functions: HashMap::new(),
            expander: Expander::new(),
        }
    }

    /// Register a Rust function created with #[lisp_fn]
    pub fn register_rust_fn(&mut self, name: &str, func: RustFn) {
        self.rust_functions.insert(name.to_string(), Arc::new(func));
    }

    pub fn register_rust_fn_closure<F>(&mut self, name: &str, func: F)
    where
        F: Fn(&[LispObject]) -> Result<LispObject, String> + Send + Sync + 'static,
    {
        self.rust_functions.insert(name.to_string(), Arc::new(func));
    }

    pub fn register_rust_cabi_fn(&mut self, name: &str, func: RustCAbiFn) {
        let fn_name = name.to_string();
        self.register_rust_fn_closure(name, move |args| {
            let raw_args: Vec<usize> = args.iter().map(|arg| arg.raw()).collect();
            let mut raw_result = LispObject::nil().raw();
            let rc = unsafe {
                func(
                    raw_args.len(),
                    raw_args.as_ptr(),
                    &mut raw_result as *mut usize,
                )
            };
            if rc != 0 {
                return Err(format!(
                    "native rust callback '{}' returned {}",
                    fn_name, rc
                ));
            }
            Ok(unsafe { LispObject::from_raw(raw_result) })
        });
    }

    /// Evaluate one form
    pub fn eval(&mut self, input: &str) -> Result<EvalResult, String> {
        let unit = self.compile_input_unit(input, CompilationMode::Interpreter)?;
        self.eval_semantic_unit(&unit)
    }

    /// Evaluate all forms in a file
    pub fn eval_file(&mut self, input: &str) -> Result<EvalResult, String> {
        let unit = self.compile_input_unit(input, CompilationMode::Interpreter)?;
        self.eval_semantic_unit(&unit)
    }

    fn compile_input_unit(
        &self,
        input: &str,
        mode: CompilationMode,
    ) -> Result<SemanticUnit, String> {
        let forms =
            rlasp_reader::read_all_from_string(input).map_err(|e| format!("Read error: {}", e))?;
        compile_unit_with_expander(forms, mode, &self.expander)
            .map_err(|e| format!("Compiler error: {}", e))
    }

    fn eval_semantic_unit(&mut self, unit: &SemanticUnit) -> Result<EvalResult, String> {
        let mut executor = InterpreterExecutor::with_env(std::mem::take(&mut self.env));
        let mut last_result = EvalResult::Nil;

        for form in unit.forms() {
            let ast = lisp_to_ast::with_read_time_env(executor.env_mut(), || {
                lisp_to_ast::lisp_to_ast(form.expanded_form)
            })?;

            if std::env::var("RLASP_DEBUG_LOAD").is_ok() {
                eprintln!("[load] ast={:?}", ast);
            }

            if let Some(result) = self.try_eval_ffi(&ast, executor.env_mut())? {
                last_result = result;
                continue;
            }

            match executor.run_ast(&ast) {
                Ok(val) => last_result = val,
                Err(e) => {
                    if std::env::var("RLASP_DEBUG_LOAD_ERROR").is_ok() {
                        eprintln!("[load-error] ast={:?}", ast);
                    }
                    self.env = executor.into_env();
                    return Err(e);
                }
            }
        }

        self.env = executor.into_env();
        Ok(last_result)
    }

    fn try_eval_ffi(
        &mut self,
        ast: &crate::ir::ASTNode,
        env: &mut HashMap<String, EvalResult>,
    ) -> Result<Option<EvalResult>, String> {
        use crate::ir::ASTNode;
        use rlasp_ffi::{ForeignSignature, ForeignType};

        if let ASTNode::Call { function, args } = ast {
            if let ASTNode::Variable(name) = function.as_ref() {
                match name.as_str() {
                    "load-lib" => {
                        if args.len() != 1 {
                            return Err("Usage: (load-lib \"name\")".to_string());
                        }
                        if let ASTNode::Constant(crate::ir::ConstantValue::String(lib_name)) =
                            &args[0]
                        {
                            let lib = if lib_name == "libm" {
                                Library::load_libm().map_err(|e| e.to_string())?
                            } else {
                                Library::load(lib_name).map_err(|e| e.to_string())?
                            };
                            self.libraries.insert(lib_name.clone(), lib);
                            return Ok(Some(EvalResult::Symbol(format!("Loaded {}", lib_name))));
                        }
                        return Err("Library name must be a string".to_string());
                    }
                    "defforeign" => {
                        // (defforeign name "symbol" param-type... return-type)
                        // Example: (defforeign sqrt "sqrt" double double)
                        if args.len() < 3 {
                            return Err(
                                "Usage: (defforeign name \"symbol\" param-types... return-type)"
                                    .to_string(),
                            );
                        }

                        let func_name = if let ASTNode::Variable(n) = &args[0] {
                            n.clone()
                        } else {
                            return Err("Function name must be a symbol".to_string());
                        };

                        let symbol_name = if let ASTNode::Constant(
                            crate::ir::ConstantValue::String(s),
                        ) = &args[1]
                        {
                            s.clone()
                        } else {
                            return Err("Symbol must be a string".to_string());
                        };

                        // All args except first two and last are param types
                        let param_types: Result<Vec<_>, _> = args[2..args.len() - 1]
                            .iter()
                            .map(|arg| self.parse_type(arg))
                            .collect();
                        let param_types = param_types?;

                        let return_type = self.parse_type(&args[args.len() - 1])?;

                        let signature = ForeignSignature {
                            return_type,
                            param_types,
                        };

                        // Find function in loaded libraries
                        for (lib_name, lib) in &self.libraries {
                            if let Ok(func) = lib.get_function(&symbol_name, signature.clone()) {
                                self.foreign_functions.insert(func_name.clone(), func);
                                return Ok(Some(EvalResult::Symbol(format!(
                                    "Defined {}",
                                    func_name
                                ))));
                            }
                        }
                        return Err(format!(
                            "Symbol '{}' not found in any loaded library",
                            symbol_name
                        ));
                    }
                    _ => {
                        // Check if it's a Rust function call
                        if let Some(func) = self.rust_functions.get(name).cloned() {
                            // Evaluate arguments and convert to LispObjects
                            use rlasp_ffi::types::ToLisp;
                            let lisp_args: Result<Vec<LispObject>, String> = args
                                .iter()
                                .map(|arg| {
                                    let val = eval::eval_with_persistent_env(arg, env)?;
                                    Ok(match val {
                                        EvalResult::Fixnum(n) => n.to_lisp(),
                                        EvalResult::Float(f) => f.to_lisp(),
                                        _ => LispObject::nil(),
                                    })
                                })
                                .collect();
                            let lisp_args = lisp_args?;

                            // Call the Rust function
                            let result = func(&lisp_args)
                                .map_err(|e| format!("Rust function call failed: {}", e))?;

                            // Convert result back
                            return Ok(Some(lisp_object_to_eval_result(&result)));
                        }

                        // Check if it's a foreign function call
                        if let Some(func) = self.foreign_functions.get(name) {
                            // Evaluate arguments and convert to LispObjects
                            use rlasp_ffi::types::ToLisp;
                            let lisp_args: Result<Vec<_>, _> = args
                                .iter()
                                .map(|arg| {
                                    let val = eval::eval_with_persistent_env(arg, env)?;
                                    match val {
                                        EvalResult::Fixnum(n) => Ok((n as i32).to_lisp()),
                                        EvalResult::Float(f) => Ok(f.to_lisp()),
                                        _ => Err("FFI arguments must be numbers".to_string()),
                                    }
                                })
                                .collect();
                            let lisp_args = lisp_args?;

                            // Call the foreign function
                            let result = func
                                .call(&lisp_args)
                                .map_err(|e| format!("FFI call failed: {:?}", e))?;

                            // Convert result back
                            return Ok(Some(lisp_object_to_eval_result(&result)));
                        }

                        // Check for namespace syntax: libm:sqrt
                        if name.contains(':') {
                            let parts: Vec<&str> = name.splitn(2, ':').collect();
                            if parts.len() == 2 {
                                let lib_name = parts[0];
                                let symbol_name = parts[1];

                                if let Some(lib) = self.libraries.get(lib_name) {
                                    // Try to infer signature from arguments
                                    // For now, assume all doubles
                                    let param_types =
                                        vec![rlasp_ffi::ForeignType::Double; args.len()];
                                    let return_type = rlasp_ffi::ForeignType::Double;
                                    let signature = ForeignSignature {
                                        return_type,
                                        param_types,
                                    };

                                    if let Ok(func) = lib.get_function(symbol_name, signature) {
                                        // Evaluate and call
                                        use rlasp_ffi::types::ToLisp;
                                        let lisp_args: Result<Vec<_>, _> =
                                            args.iter()
                                                .map(|arg| {
                                                    let val =
                                                        eval::eval_with_persistent_env(arg, env)?;
                                                    match val {
                                                        EvalResult::Fixnum(n) => {
                                                            Ok((n as i32).to_lisp())
                                                        }
                                                        EvalResult::Float(f) => Ok(f.to_lisp()),
                                                        _ => Err("FFI arguments must be numbers"
                                                            .to_string()),
                                                    }
                                                })
                                                .collect();
                                        let lisp_args = lisp_args?;

                                        let result = func
                                            .call(&lisp_args)
                                            .map_err(|e| format!("FFI call failed: {:?}", e))?;

                                        return Ok(Some(lisp_object_to_eval_result(&result)));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        Ok(None)
    }

    fn parse_type(&self, ast: &crate::ir::ASTNode) -> Result<rlasp_ffi::ForeignType, String> {
        use crate::ir::ASTNode;
        use rlasp_ffi::ForeignType;

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

    fn parse_type_list(
        &self,
        ast: &crate::ir::ASTNode,
    ) -> Result<Vec<rlasp_ffi::ForeignType>, String> {
        use crate::ir::ASTNode;

        if let ASTNode::Quote(inner) = ast {
            if let ASTNode::Call { function: _, args } = inner.as_ref() {
                return args.iter().map(|arg| self.parse_type(arg)).collect();
            }
        }
        Err("Parameter types must be a quoted list".to_string())
    }

    /// Run the REPL
    pub fn run(&mut self) {
        println!("rlasp REPL v0.1.0");
        println!("Type expressions to evaluate, or :quit to exit");
        println!();

        let mut accumulated_input = String::new();

        loop {
            // Show appropriate prompt
            if accumulated_input.is_empty() {
                print!("rlasp> ");
            } else {
                print!("    .. ");
            }
            io::stdout().flush().unwrap();

            let mut line = String::new();
            match io::stdin().read_line(&mut line) {
                Ok(0) => {
                    // EOF reached - evaluate any accumulated input before exiting
                    if !accumulated_input.trim().is_empty()
                        && !self.is_only_comments(&accumulated_input)
                    {
                        match self.eval(accumulated_input.trim()) {
                            Ok(result) => println!("=> {}", result),
                            Err(e) => println!("Error: {}", e),
                        }
                    }
                    break;
                }
                Err(_) => break,
                Ok(_) => {}
            }

            // Echo input when stdin is not a terminal (piped input)
            if !line.trim().is_empty() && !atty::is(atty::Stream::Stdin) {
                println!("{}", line.trim());
            }

            // Check for empty line (but not EOF which was handled above)
            if line.trim().is_empty() {
                // For interactive, just skip empty lines
                continue;
            }

            // Check for commands (only if not accumulating)
            if accumulated_input.is_empty() {
                let trimmed = line.trim();
                if trimmed == ":quit" || trimmed == ":q" {
                    println!("Goodbye!");
                    break;
                }

                if trimmed == ":help" || trimmed == ":h" {
                    self.print_help();
                    continue;
                }
            }

            // Accumulate input
            accumulated_input.push_str(&line);

            // Check if we have a complete expression
            if self.is_complete_expression(&accumulated_input) {
                let input = accumulated_input.trim().to_string();
                accumulated_input.clear();

                // Skip comment-only lines or empty input
                if self.is_only_comments(&input) {
                    continue;
                }

                match self.eval(&input) {
                    Ok(result) => {
                        println!("=> {}", result);
                    }
                    Err(e) => {
                        println!("Error: {}", e);
                    }
                }
            }
        }
    }

    /// Check if input is only comments or whitespace
    fn is_only_comments(&self, input: &str) -> bool {
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
                    chars.next(); // Skip escaped character
                } else if ch == '"' {
                    in_string = false;
                }
                // If we're in a string, there's non-comment content
                return false;
            }

            match ch {
                ';' => in_comment = true,
                '"' => in_string = true,
                c if c.is_whitespace() => continue,
                _ => return false, // Found non-comment, non-whitespace
            }
        }

        true
    }

    /// Check if input has balanced parentheses (is a complete expression)
    fn is_complete_expression(&self, input: &str) -> bool {
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
                    chars.next(); // Skip escaped character
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

        // Expression is complete if:
        // - We're not in a string
        // - Parentheses are balanced (depth == 0)
        // - We have some non-whitespace content (or depth was > 0 at some point)
        !in_string && depth == 0 && !input.trim().is_empty()
    }

    fn print_help(&self) {
        println!("Commands:");
        println!("  :help, :h    - Show this help");
        println!("  :quit, :q    - Exit REPL");
        println!();
        println!("Examples:");
        println!("  42           - Number literal");
        println!("  (+ 1 2)      - Function call");
        println!("  (* 3 4)      - Multiplication");
        println!("  (if t 1 2)   - Conditional");
        println!();
        println!("FFI (Foreign Function Interface):");
        println!("  (load-lib \"libm\")");
        println!("  (defforeign sqrt \"sqrt\" double double)");
        println!("  (sqrt 16.0)         ; call it directly!");
        println!("  (libm:sqrt 144.0)   ; or use namespace syntax");
        println!();
        println!("Note: Full Lisp semantics are being implemented.");
        println!("      Currently supports basic arithmetic and FFI.");
    }
}

impl Default for Repl {
    fn default() -> Self {
        Self::new()
    }
}
