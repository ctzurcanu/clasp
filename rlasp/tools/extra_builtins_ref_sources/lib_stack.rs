/// Stack-based MLIR code generator
/// Complete rewrite using two-stack architecture
/// All expressions push results to stack instead of returning SSA values

use anyhow::Result;
use std::collections::{HashMap, HashSet};
use rlasp::ir::{ASTNode, ConstantValue};
use rlasp::repl::eval::eval_loop;

/// Debug print macro - only prints in debug builds
macro_rules! debug_println {
    ($($arg:tt)*) => {
        #[cfg(debug_assertions)]
        eprintln!($($arg)*);
    };
}

/// MLIR code generator with stack-based calling convention
pub struct StackMLIRCodegen {
    module_name: String,
    output: String,
    pending_functions: Vec<String>,
    pending_string_constants: Vec<(String, String)>,  // (name, value) for global string constants
    indent_level: usize,
    next_ssa_id: usize,
    symbol_table: HashMap<String, String>,  // Maps var names to SSA values
    local_function_map: HashMap<String, String>,  // Maps local function names to unique mangled names
    special_param_functions: HashSet<String>,  // Functions that use &optional, &key, or supplied-p
    generic_functions: HashSet<String>,  // Generic function names for runtime dispatch
    compiled_functions: HashSet<String>,  // Functions compiled via defun in this module
    function_counter: usize,
    loop_carried_vars: Option<Vec<String>>,  // Variables that must be threaded through loops (None when not in loop)
    scf_region_depth: usize,  // Depth of nested SCF regions (0 = not in region)
}

impl StackMLIRCodegen {
    pub fn new(module_name: &str) -> Self {
        debug_println!("[DEBUG] Using StackMLIRCodegen for module: {}", module_name);
        let mut codegen = Self {
            module_name: module_name.to_string(),
            output: String::new(),
            pending_functions: Vec::new(),
            pending_string_constants: Vec::new(),
            indent_level: 0,
            next_ssa_id: 0,
            symbol_table: HashMap::new(),
            local_function_map: HashMap::new(),
            special_param_functions: HashSet::new(),
            generic_functions: HashSet::new(),
            compiled_functions: HashSet::new(),
            function_counter: 0,
            loop_carried_vars: None,
            scf_region_depth: 0,
        };

        codegen.writeln("module {");
        codegen.indent();
        codegen
    }

    /// Register a generic function name for runtime dispatch
    /// This should be called before compiling functions that call the generic
    pub fn register_generic_function(&mut self, name: &str) {
        self.generic_functions.insert(name.to_string());
    }

    /// Get current output length (for save/restore on failure)
    pub fn output_len(&self) -> usize {
        self.output.len()
    }

    /// Truncate output to a previously saved length (to discard partial output on failure)
    pub fn truncate_output(&mut self, len: usize) {
        self.output.truncate(len);
    }

    fn writeln(&mut self, s: &str) {
        let indent = "  ".repeat(self.indent_level);
        self.output.push_str(&indent);
        self.output.push_str(s);
        self.output.push('\n');
    }

    fn indent(&mut self) {
        self.indent_level += 1;
    }

    fn dedent(&mut self) {
        if self.indent_level > 0 {
            self.indent_level -= 1;
        }
    }

    fn fresh_ssa(&mut self) -> String {
        let id = self.next_ssa_id;
        self.next_ssa_id += 1;
        format!("%{}", id)
    }

    fn fresh_id(&mut self) -> usize {
        let id = self.function_counter;
        self.function_counter += 1;
        id
    }

    /// Extract parameter name and specializer from a method parameter specification
    /// Handles both simple params (x) and specialized params ((x class))
    fn extract_method_param(node: &ASTNode, params: &mut Vec<String>, specializers: &mut Vec<String>) {
        match node {
            ASTNode::Variable(name) => {
                // Skip lambda-list keywords
                if !name.starts_with('&') {
                    params.push(name.clone());
                    specializers.push("t".to_string());
                }
            }
            ASTNode::Constant(ConstantValue::Symbol(name)) => {
                if !name.starts_with('&') {
                    params.push(name.clone());
                    specializers.push("t".to_string());
                }
            }
            ASTNode::Call { function, args } => {
                // Specialized parameter: ((param-name class-name) ...)
                // or nested list structure
                if let ASTNode::Variable(param_name) = function.as_ref() {
                    if !param_name.starts_with('&') {
                        params.push(param_name.clone());
                        if !args.is_empty() {
                            match &args[0] {
                                ASTNode::Variable(class_name) => specializers.push(class_name.clone()),
                                ASTNode::Constant(ConstantValue::Symbol(class_name)) => specializers.push(class_name.clone()),
                                _ => specializers.push("t".to_string()),
                            }
                        } else {
                            specializers.push("t".to_string());
                        }
                    }
                }
            }
            _ => {}
        }
    }

    /// Create a string constant and return its name (@strN)
    fn create_string_constant(&mut self, s: &str) -> String {
        // Add to pending string constants
        let const_name = format!("@str{}", self.pending_string_constants.len());
        self.pending_string_constants.push((const_name.clone(), s.to_string()));
        const_name
    }

    /// Create a symbol constant (calls cc_make_symbol with a string constant)
    fn create_symbol_constant(&mut self, name: &str) -> String {
        // Create a string constant for the symbol name
        let const_name = self.create_string_constant(name);
        // Get address of the string constant (using opaque pointers)
        let str_ptr = self.fresh_ssa();
        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr",
            str_ptr, const_name));
        // Get string length
        let len = name.len();
        let len_ssa = self.fresh_ssa();
        self.writeln(&format!("{} = arith.constant {} : i64", len_ssa, len));
        // Create symbol using cc_make_symbol
        let sym = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_make_symbol({}, {}) : (!llvm.ptr, i64) -> i64", sym, str_ptr, len_ssa));
        sym
    }

    /// Extract parameter names from an AST node representing a parameter list
    /// Handles both simple variables and keyword parameters (&optional, &key, &rest)
    fn extract_params_from_ast(&self, node: &ASTNode) -> Result<Vec<String>> {
        let mut params = Vec::new();

        match node {
            // Empty list - no params
            ASTNode::Constant(ConstantValue::Nil) => Ok(params),

            // List of params
            ASTNode::Call { function, args } => {
                // Check if this is a list constructor
                if let ASTNode::Variable(fn_name) = function.as_ref() {
                    if fn_name == "list" || fn_name == "" {
                        // Iterate over the args, extracting variable names
                        for arg in args {
                            match arg {
                                ASTNode::Variable(name) => {
                                    // Skip lambda list keywords
                                    if !name.starts_with('&') {
                                        params.push(name.clone());
                                    }
                                }
                                // Optional/key param with default: (name default)
                                ASTNode::Call { function: inner_fn, args: inner_args } => {
                                    if let ASTNode::Variable(name) = inner_fn.as_ref() {
                                        if !name.starts_with('&') {
                                            params.push(name.clone());
                                        }
                                    } else if !inner_args.is_empty() {
                                        if let ASTNode::Variable(name) = &inner_args[0] {
                                            if !name.starts_with('&') {
                                                params.push(name.clone());
                                            }
                                        }
                                    }
                                }
                                _ => {}
                            }
                        }
                        return Ok(params);
                    }
                }
                // If it's a call representing a single param, treat the function as a param
                if let ASTNode::Variable(name) = function.as_ref() {
                    if !name.starts_with('&') {
                        params.push(name.clone());
                    }
                }
                // Also include any args as params
                for arg in args {
                    if let ASTNode::Variable(name) = arg {
                        if !name.starts_with('&') {
                            params.push(name.clone());
                        }
                    }
                }
                Ok(params)
            }

            // Single variable as the only param
            ASTNode::Variable(name) => {
                if !name.starts_with('&') {
                    params.push(name.clone());
                }
                Ok(params)
            }

            // Quote wrapping a list
            ASTNode::Quote(inner) => self.extract_params_from_ast(inner),

            _ => {
                // Unknown format - return empty
                Ok(params)
            }
        }
    }

    /// Create a runtime string object from a string constant
    fn create_runtime_string(&mut self, s: &str) -> String {
        // Create a string constant
        let const_name = self.create_string_constant(s);
        // Get address of the string constant
        let str_ptr = self.fresh_ssa();
        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr",
            str_ptr, const_name));
        // Get string length
        let len = s.len();
        let len_ssa = self.fresh_ssa();
        self.writeln(&format!("{} = arith.constant {} : i64", len_ssa, len));
        // Create string using cc_make_string
        let str_obj = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_make_string({}, {}) : (!llvm.ptr, i64) -> i64", str_obj, str_ptr, len_ssa));
        str_obj
    }

    /// Extract parameter list from AST node
    /// Handles: (x y z), (&optional x), (&key name), etc.
    fn extract_param_list(&self, node: &ASTNode) -> Result<Vec<String>> {
        let mut params = Vec::new();

        match node {
            // Empty list () - no parameters
            ASTNode::Constant(ConstantValue::Nil) => {
                // Empty param list
            }

            // Single variable as param list (rare but possible)
            ASTNode::Variable(name) => {
                params.push(name.clone());
            }

            // Call node represents a list structure: (a b c) becomes Call { function: a, args: [b, c] }
            ASTNode::Call { function, args } => {
                // First element of the list
                if let ASTNode::Variable(name) = function.as_ref() {
                    params.push(name.clone());
                }

                // Rest of the list
                for arg in args {
                    match arg {
                        ASTNode::Variable(name) => params.push(name.clone()),
                        ASTNode::Constant(ConstantValue::Symbol(name)) => params.push(name.clone()),
                        // Handle nested structures for default values: (x default)
                        ASTNode::Call { function: inner_fn, args: _ } => {
                            if let ASTNode::Variable(name) = inner_fn.as_ref() {
                                params.push(name.clone());
                            }
                        }
                        _ => {}
                    }
                }
            }

            // Progn or other structures - unlikely for param lists
            _ => {}
        }

        Ok(params)
    }

    // Save current codegen state (for nested function generation)
    fn save_state(&mut self) -> (HashMap<String, String>, usize, String) {
        let saved_symbols = self.symbol_table.clone();
        let saved_indent = self.indent_level;
        let saved_output = std::mem::take(&mut self.output);
        (saved_symbols, saved_indent, saved_output)
    }

    // Restore codegen state
    fn restore_state(&mut self, state: (HashMap<String, String>, usize, String)) {
        let (saved_symbols, saved_indent, saved_output) = state;
        self.symbol_table = saved_symbols;
        self.indent_level = saved_indent;
        self.output = saved_output;
    }

    /// Find variables that are modified via setq in an expression
    fn find_setq_vars(&self, ast: &ASTNode) -> HashSet<String> {
        let mut setq_vars = HashSet::new();
        match ast {
            ASTNode::Setq { var, value } => {
                setq_vars.insert(var.clone());
                setq_vars.extend(self.find_setq_vars(value));
            }
            ASTNode::Call { function, args } => {
                // Check if this is a push call - push modifies its second argument
                if let ASTNode::Variable(name) = function.as_ref() {
                    if name == "push" && args.len() >= 2 {
                        if let ASTNode::Variable(var) = &args[1] {
                            setq_vars.insert(var.clone());
                        }
                    }
                }
                setq_vars.extend(self.find_setq_vars(function));
                for arg in args {
                    setq_vars.extend(self.find_setq_vars(arg));
                }
            }
            ASTNode::If { test, then_branch, else_branch } => {
                setq_vars.extend(self.find_setq_vars(test));
                setq_vars.extend(self.find_setq_vars(then_branch));
                setq_vars.extend(self.find_setq_vars(else_branch));
            }
            ASTNode::Progn { exprs } => {
                for expr in exprs {
                    setq_vars.extend(self.find_setq_vars(expr));
                }
            }
            ASTNode::Let { bindings, body } | ASTNode::LetStar { bindings, body } => {
                for (_, val) in bindings {
                    setq_vars.extend(self.find_setq_vars(val));
                }
                for expr in body {
                    setq_vars.extend(self.find_setq_vars(expr));
                }
            }
            ASTNode::Dotimes { body, .. } | ASTNode::Dolist { body, .. } => {
                for expr in body {
                    setq_vars.extend(self.find_setq_vars(expr));
                }
            }
            ASTNode::Lambda { body, .. } => {
                for expr in body {
                    setq_vars.extend(self.find_setq_vars(expr));
                }
            }
            _ => {}
        }
        setq_vars
    }

    /// Find all outer-scope variables referenced in an expression
    /// These are variables that exist in symbol_table and are used in the expression
    fn find_outer_scope_refs(&self, ast: &ASTNode, local_vars: &HashSet<String>) -> HashSet<String> {
        let mut refs = HashSet::new();
        self.collect_outer_refs(ast, local_vars, &mut refs);
        refs
    }

    fn collect_outer_refs(&self, ast: &ASTNode, local_vars: &HashSet<String>, refs: &mut HashSet<String>) {
        match ast {
            ASTNode::Variable(name) => {
                // Skip special constants and keywords
                if name == "t" || name == "nil" || name.starts_with(':') {
                    return;
                }
                // If variable is in symbol_table but not in local_vars, it's from outer scope
                if self.symbol_table.contains_key(name) && !local_vars.contains(name) {
                    refs.insert(name.clone());
                }
            }
            ASTNode::Setq { var, value } => {
                // The variable being set might be outer scope
                if self.symbol_table.contains_key(var) && !local_vars.contains(var) {
                    refs.insert(var.clone());
                }
                self.collect_outer_refs(value, local_vars, refs);
            }
            ASTNode::Call { function, args } => {
                self.collect_outer_refs(function, local_vars, refs);
                for arg in args {
                    self.collect_outer_refs(arg, local_vars, refs);
                }
            }
            ASTNode::If { test, then_branch, else_branch } => {
                self.collect_outer_refs(test, local_vars, refs);
                self.collect_outer_refs(then_branch, local_vars, refs);
                self.collect_outer_refs(else_branch, local_vars, refs);
            }
            ASTNode::Progn { exprs } => {
                for expr in exprs {
                    self.collect_outer_refs(expr, local_vars, refs);
                }
            }
            ASTNode::Let { bindings, body } => {
                let mut new_locals = local_vars.clone();
                for (var, val) in bindings {
                    self.collect_outer_refs(val, local_vars, refs);
                    new_locals.insert(var.clone());
                }
                for expr in body {
                    self.collect_outer_refs(expr, &new_locals, refs);
                }
            }
            ASTNode::LetStar { bindings, body } => {
                let mut new_locals = local_vars.clone();
                for (var, val) in bindings {
                    self.collect_outer_refs(val, &new_locals, refs);
                    new_locals.insert(var.clone());
                }
                for expr in body {
                    self.collect_outer_refs(expr, &new_locals, refs);
                }
            }
            ASTNode::Lambda { params, body, .. } => {
                let mut new_locals = local_vars.clone();
                for param in params {
                    new_locals.insert(param.clone());
                }
                for expr in body {
                    self.collect_outer_refs(expr, &new_locals, refs);
                }
            }
            ASTNode::Dotimes { var, count, body, .. } => {
                self.collect_outer_refs(count, local_vars, refs);
                let mut new_locals = local_vars.clone();
                new_locals.insert(var.clone());
                for expr in body {
                    self.collect_outer_refs(expr, &new_locals, refs);
                }
            }
            ASTNode::Dolist { var, list, body, .. } => {
                self.collect_outer_refs(list, local_vars, refs);
                let mut new_locals = local_vars.clone();
                new_locals.insert(var.clone());
                for expr in body {
                    self.collect_outer_refs(expr, &new_locals, refs);
                }
            }
            ASTNode::Quote(_) | ASTNode::Constant(_) => {}
            ASTNode::Block { body, .. } => {
                for expr in body {
                    self.collect_outer_refs(expr, local_vars, refs);
                }
            }
            ASTNode::ReturnFrom { value, .. } => {
                if let Some(val) = value {
                    self.collect_outer_refs(val, local_vars, refs);
                }
            }
            ASTNode::Cond { clauses } => {
                for (test, body) in clauses {
                    self.collect_outer_refs(test, local_vars, refs);
                    self.collect_outer_refs(body, local_vars, refs);
                }
            }
            ASTNode::Loop { var, start, limit, when_condition, collect, sum, else_collect, else_sum } => {
                // Loop introduces a variable
                let mut new_locals = local_vars.clone();
                new_locals.insert(var.clone());

                if let Some(s) = start {
                    self.collect_outer_refs(s, local_vars, refs);
                }
                self.collect_outer_refs(limit, local_vars, refs);
                if let Some(cond) = when_condition {
                    self.collect_outer_refs(cond, &new_locals, refs);
                }
                if let Some(c) = collect {
                    self.collect_outer_refs(c, &new_locals, refs);
                }
                if let Some(s) = sum {
                    self.collect_outer_refs(s, &new_locals, refs);
                }
                if let Some(ec) = else_collect {
                    self.collect_outer_refs(ec, &new_locals, refs);
                }
                if let Some(es) = else_sum {
                    self.collect_outer_refs(es, &new_locals, refs);
                }
            }
            ASTNode::Macro { body, .. } => {
                for expr in body {
                    self.collect_outer_refs(expr, local_vars, refs);
                }
            }
            ASTNode::Backquote(inner) | ASTNode::Unquote(inner) | ASTNode::UnquoteSplicing(inner) => {
                self.collect_outer_refs(inner, local_vars, refs);
            }
            ASTNode::CCall { args, .. } => {
                for arg in args {
                    self.collect_outer_refs(arg, local_vars, refs);
                }
            }
            ASTNode::CppMethodCall { object, args, .. } => {
                self.collect_outer_refs(object, local_vars, refs);
                for arg in args {
                    self.collect_outer_refs(arg, local_vars, refs);
                }
            }
            ASTNode::HashTable { entries } => {
                for (k, v) in entries {
                    self.collect_outer_refs(k, local_vars, refs);
                    self.collect_outer_refs(v, local_vars, refs);
                }
            }
            ASTNode::Vector(elems) => {
                for elem in elems {
                    self.collect_outer_refs(elem, local_vars, refs);
                }
            }
            ASTNode::DottedPair { car, cdr } => {
                self.collect_outer_refs(car, local_vars, refs);
                self.collect_outer_refs(cdr, local_vars, refs);
            }
            ASTNode::Defclass { slots, .. } => {
                // Check initforms
                for slot in slots {
                    if let Some(initform) = &slot.initform {
                        self.collect_outer_refs(initform, local_vars, refs);
                    }
                }
            }
            ASTNode::Defgeneric { .. } => {
                // No expressions to check
            }
            ASTNode::Defmethod { body, params, .. } => {
                let mut new_locals = local_vars.clone();
                for param in params {
                    new_locals.insert(param.clone());
                }
                for expr in body {
                    self.collect_outer_refs(expr, &new_locals, refs);
                }
            }
        }
    }

    /// Find free variables in an expression (variables used but not defined in bound_vars)
    fn find_free_vars(&self, ast: &ASTNode, bound_vars: &HashSet<String>) -> HashSet<String> {
        let mut free_vars = HashSet::new();
        match ast {
            ASTNode::Variable(name) => {
                if !bound_vars.contains(name) && self.symbol_table.contains_key(name) {
                    free_vars.insert(name.clone());
                }
            }
            ASTNode::Call { function, args } => {
                free_vars.extend(self.find_free_vars(function, bound_vars));
                for arg in args {
                    free_vars.extend(self.find_free_vars(arg, bound_vars));
                }
            }
            ASTNode::Lambda { params, body, .. } => {
                let mut lambda_bound = bound_vars.clone();
                for param in params {
                    lambda_bound.insert(param.clone());
                }
                for expr in body {
                    free_vars.extend(self.find_free_vars(expr, &lambda_bound));
                }
            }
            ASTNode::Let { bindings, body, .. } | ASTNode::LetStar { bindings, body } => {
                let mut let_bound = bound_vars.clone();
                for (var, _) in bindings {
                    let_bound.insert(var.clone());
                }
                for (_, expr) in bindings {
                    free_vars.extend(self.find_free_vars(expr, bound_vars));
                }
                for expr in body {
                    free_vars.extend(self.find_free_vars(expr, &let_bound));
                }
            }
            ASTNode::If { test, then_branch, else_branch } => {
                free_vars.extend(self.find_free_vars(test, bound_vars));
                free_vars.extend(self.find_free_vars(then_branch, bound_vars));
                free_vars.extend(self.find_free_vars(else_branch, bound_vars));
            }
            ASTNode::Quote(_) | ASTNode::Constant(_) => {}
            _ => {}
        }
        free_vars
    }

    /// Compile an expression - pushes result onto stack
    pub fn compile_expr(&mut self, ast: &ASTNode) -> Result<()> {
        match ast {
            // Constants
            ASTNode::Constant(val) => {
                match val {
                    rlasp::ir::ConstantValue::Fixnum(n) => {
                        // Push raw fixnum - type is tracked in type stack (two-stack architecture)
                        let value_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", value_ssa, n));
                        self.writeln(&format!("func.call @stack_push_fixnum({}) : (i64) -> ()", value_ssa));
                    }
                    rlasp::ir::ConstantValue::Bignum(s) => {
                        // Parse bignum from string at runtime
                        let str_const = self.create_string_constant(s);
                        let str_ptr = self.fresh_ssa();
                        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", str_ptr, str_const));
                        let len_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", len_ssa, s.len()));
                        let bignum_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_parse_bignum({}, {}) : (!llvm.ptr, i64) -> i64", bignum_ssa, str_ptr, len_ssa));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", bignum_ssa));
                    }
                    rlasp::ir::ConstantValue::Nil => {
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                    rlasp::ir::ConstantValue::T => {
                        // Push T symbol
                        let t_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    }
                    rlasp::ir::ConstantValue::String(s) => {
                        // Create runtime string object and push
                        let str_obj = self.create_runtime_string(s);
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", str_obj));
                    }
                    rlasp::ir::ConstantValue::Symbol(s) => {
                        // Create symbol constant and push
                        let sym_const = self.create_symbol_constant(s);
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", sym_const));
                    }
                    rlasp::ir::ConstantValue::Character(c) => {
                        // Box character and push
                        let char_code = *c as i64;
                        let code_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", code_ssa, char_code));
                        let boxed_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_box_character({}) : (i64) -> i64", boxed_ssa, code_ssa));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", boxed_ssa));
                    }
                    rlasp::ir::ConstantValue::Float(f) => {
                        // Box float and push
                        let float_ssa = self.fresh_ssa();
                        // Ensure float literal has decimal point for MLIR
                        let float_str = if f.fract() == 0.0 && f.is_finite() {
                            format!("{}.0", f)
                        } else {
                            format!("{}", f)
                        };
                        self.writeln(&format!("{} = arith.constant {} : f64", float_ssa, float_str));
                        let boxed_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_box_float({}) : (f64) -> i64", boxed_ssa, float_ssa));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", boxed_ssa));
                    }
                    _ => {
                        // TODO: other constants
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                }
                Ok(())
            }

            // Variables - look up value and push to stack
            ASTNode::Variable(name) => {
                debug_println!("DEBUG: Compiling variable: '{}'", name);
                // Special handling for T and NIL constants
                if name == "t" {
                    debug_println!("DEBUG: Recognized as T constant");
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    return Ok(());
                } else if name == "nil" {
                    debug_println!("DEBUG: Recognized as NIL constant");
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                } else if name == "internal-time-units-per-second" {
                    // Common Lisp constant: 1_000_000_000 (nanoseconds per second)
                    let val_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 1000000000 : i64", val_ssa));
                    let boxed_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed_ssa, val_ssa));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", boxed_ssa));
                    return Ok(());
                }

                // Handle keywords - they evaluate to themselves
                // Keywords are symbols in the KEYWORD package
                if name.starts_with(':') {
                    debug_println!("DEBUG: Recognized as keyword: {}", name);
                    // Create a symbol for the keyword (without the ':' prefix)
                    let keyword_name = &name[1..];
                    let keyword_sym = self.create_symbol_constant(keyword_name);
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", keyword_sym));
                    return Ok(());
                }

                // Check if variable is bound in symbol table (local variable)
                if let Some(ssa_val) = self.symbol_table.get(name) {
                    // Push the bound SSA value to stack
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", ssa_val));
                } else {
                    // Unbound local variable - look up as global/special variable
                    // Create a symbol for the variable name
                    let var_sym = self.create_symbol_constant(name);
                    // Look up its value at runtime
                    let val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", val, var_sym));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", val));
                }
                Ok(())
            }

            // Function calls
            ASTNode::Call { function, args } => {
                // Check if it's a named function call
                if let ASTNode::Variable(func_name) = &**function {
                    self.compile_call(func_name, args)?;
                } else if let ASTNode::Lambda { params, defaults: _, supplied_p_vars: _, body } = &**function {
                    // Inline lambda call: ((lambda (x) body) arg)
                    // Compile as a let binding
                    // For simplicity, we ignore defaults and supplied-p for inline calls
                    if params.len() != args.len() {
                        anyhow::bail!("Lambda call: wrong number of arguments, expected {}, got {}",
                            params.len(), args.len());
                    }

                    // Create bindings from params to args
                    let bindings: Vec<(String, ASTNode)> = params.iter().cloned()
                        .zip(args.iter().cloned())
                        .collect();

                    // Create the body as a progn of the lambda body expressions
                    let let_body = if body.len() == 1 {
                        body[0].clone()
                    } else {
                        ASTNode::progn(body.clone())
                    };

                    // Compile as let
                    let let_node = ASTNode::Let { bindings, body: vec![let_body] };
                    self.compile_expr(&let_node)?;
                } else if let ASTNode::Call { function: inner_fn, args: inner_args } = &**function {
                    // Could be a funcall-style call or nested structure
                    // Evaluate the function expression and use cc_funcall
                    // Push all arguments first
                    for arg in args {
                        self.compile_expr(arg)?;
                    }

                    // Compile the function expression
                    let fn_call = ASTNode::Call {
                        function: inner_fn.clone(),
                        args: inner_args.clone()
                    };
                    self.compile_expr(&fn_call)?;
                    let fn_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", fn_val));

                    // Collect arguments from stack
                    let argc = args.len();
                    let argc_ssa = self.fresh_ssa();
                    let tagged_argc = (argc as i64) << 2;
                    self.writeln(&format!("{} = arith.constant {} : i64", argc_ssa, tagged_argc));
                    let args_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_collect_args({}) : (i64) -> i64", args_list, argc_ssa));

                    // Call cc_funcall
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_funcall({}, {}) : (i64, i64) -> i64", result, fn_val, args_list));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                } else {
                    // Generic case: evaluate function expression, use cc_funcall
                    // Push all arguments first
                    for arg in args {
                        self.compile_expr(arg)?;
                    }

                    // Compile the function expression
                    self.compile_expr(function)?;
                    let fn_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", fn_val));

                    // Collect arguments from stack
                    let argc = args.len();
                    let argc_ssa = self.fresh_ssa();
                    let tagged_argc = (argc as i64) << 2;
                    self.writeln(&format!("{} = arith.constant {} : i64", argc_ssa, tagged_argc));
                    let args_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_collect_args({}) : (i64) -> i64", args_list, argc_ssa));

                    // Call cc_funcall
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_funcall({}, {}) : (i64, i64) -> i64", result, fn_val, args_list));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            // If expression - condition on stack, branches push result
            ASTNode::If { test, then_branch, else_branch } => {
                // Evaluate condition, push to stack
                self.compile_expr(test)?;

                // Pop condition and check if it's not nil
                let cond_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cond_val));

                // Convert to i1 for scf.if
                // In Lisp, NIL is false and everything else is true
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                let cond_bool = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", cond_bool, cond_val, nil_val));

                // Find which variables might be modified in either branch
                let mut modified_vars = self.find_setq_vars(then_branch);
                modified_vars.extend(self.find_setq_vars(else_branch));

                // Filter to only variables that exist in current scope
                let vars_to_return: Vec<String> = modified_vars.iter()
                    .filter(|v| self.symbol_table.contains_key(*v))
                    .cloned()
                    .collect();

                // If in loop context, only return loop-carried variables
                let vars_to_return: Vec<String> = if let Some(ref loop_vars) = self.loop_carried_vars {
                    vars_to_return.iter()
                        .filter(|v| loop_vars.contains(v))
                        .cloned()
                        .collect()
                } else {
                    vars_to_return
                };

                if !vars_to_return.is_empty() {
                    // scf.if needs to return the potentially modified variables
                    let result_ssa = self.fresh_ssa();
                    let num_results = vars_to_return.len();
                    let type_sig = vec!["i64"; num_results].join(", ");

                    self.writeln(&format!("{}:{} = scf.if {} -> ({}) {{",
                        result_ssa, num_results, cond_bool, type_sig));
                    self.indent();

                    // Then branch
                    let saved_symbols_before_then = self.symbol_table.clone();
                    self.compile_expr(then_branch)?;
                    let _discard = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));

                    // Yield all vars_to_return (get current values from symbol table after execution)
                    let then_yields: Vec<String> = vars_to_return.iter()
                        .map(|v| self.symbol_table.get(v).unwrap().clone())
                        .collect();
                    self.writeln(&format!("scf.yield {} : {}", then_yields.join(", "), type_sig));

                    self.dedent();
                    self.writeln("} else {");
                    self.indent();

                    // Restore symbol table to state before then branch, then execute else branch
                    self.symbol_table = saved_symbols_before_then.clone();
                    self.compile_expr(else_branch)?;
                    let _discard = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));

                    // Yield all vars_to_return (get current values from symbol table after execution)
                    let else_yields: Vec<String> = vars_to_return.iter()
                        .map(|v| self.symbol_table.get(v).unwrap().clone())
                        .collect();
                    self.writeln(&format!("scf.yield {} : {}", else_yields.join(", "), type_sig));

                    self.dedent();
                    self.writeln("}");

                    // CRITICAL: Restore symbol table to state before scf.if to invalidate
                    // any SSA values that were defined inside the scf.if regions
                    self.symbol_table = saved_symbols_before_then;

                    // Update symbol table with returned values (only for yielded variables)
                    for (i, var_name) in vars_to_return.iter().enumerate() {
                        let var_val = if num_results == 1 {
                            result_ssa.clone()
                        } else {
                            format!("{}#{}", result_ssa, i)
                        };
                        self.symbol_table.insert(var_name.clone(), var_val);
                    }

                    // Push nil to stack (if returns nil)
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                } else {
                    // No variables modified, use simple scf.if without returns
                    // CRITICAL: Save and restore symbol_table to prevent SSA scoping issues
                    // SSA values defined inside scf.if regions are not visible outside
                    let saved_symbols = self.symbol_table.clone();

                    self.writeln(&format!("scf.if {} {{", cond_bool));
                    self.indent();
                    self.compile_expr(then_branch)?;
                    self.dedent();
                    self.writeln("} else {");
                    self.indent();
                    // Restore symbol table before else branch (to avoid then-branch SSA values)
                    self.symbol_table = saved_symbols.clone();
                    self.compile_expr(else_branch)?;
                    self.dedent();
                    self.writeln("}");

                    // Restore symbol table to state before scf.if
                    // Any SSA values created inside were invalidated when the region closed
                    self.symbol_table = saved_symbols;
                }

                Ok(())
            }

            // Progn - evaluate all expressions, last one leaves result on stack
            ASTNode::Progn { exprs } => {
                if exprs.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                } else {
                    for (i, expr) in exprs.iter().enumerate() {
                        self.compile_expr(expr)?;
                        // Pop all but the last result to keep stack clean
                        if i < exprs.len() - 1 {
                            let discard = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", discard));
                        }
                    }
                }
                Ok(())
            }

            // Quoted expressions - return the literal structure
            ASTNode::Quote(inner) => {
                // Quote prevents evaluation and returns the literal form
                // This needs to build the quoted structure at runtime
                match &**inner {
                    ASTNode::Constant(_) => {
                        // Constants evaluate to themselves when quoted
                        self.compile_expr(inner)?;
                    }
                    ASTNode::Variable(name) => {
                        // Variables become symbols when quoted
                        // Handle keywords consistently - strip the colon prefix
                        let symbol_name = if name.starts_with(':') {
                            &name[1..]
                        } else {
                            name.as_str()
                        };
                        let sym = self.create_symbol_constant(symbol_name);
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", sym));
                    }
                    ASTNode::Call { function, args } => {
                        // Quoted list - build cons structure
                        // Build list from right to left, starting with nil
                        self.writeln("func.call @stack_push_nil() : () -> ()");

                        // Build list backwards (cons from right to left)
                        for arg in args.iter().rev() {
                            // Compile the quoted element
                            self.compile_expr(&ASTNode::Quote(Box::new(arg.clone())))?;

                            // Pop element and list
                            let elem = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", elem));
                            let list_so_far = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list_so_far));

                            // Cons them together
                            let new_list = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, elem, list_so_far));
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                        }

                        // Also cons the function if it's a proper list
                        let func_quoted = ASTNode::Quote(Box::new((**function).clone()));
                        self.compile_expr(&func_quoted)?;

                        let func_elem = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func_elem));
                        let list_so_far = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list_so_far));

                        let final_list = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", final_list, func_elem, list_so_far));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", final_list));
                    }
                    ASTNode::DottedPair { car, cdr } => {
                        // Dotted pair like (a . b) - compile car and cdr, cons them
                        // First compile the car
                        self.compile_expr(&ASTNode::Quote(Box::new((**car).clone())))?;
                        // Then compile the cdr
                        self.compile_expr(&ASTNode::Quote(Box::new((**cdr).clone())))?;
                        // Pop cdr and car
                        let cdr_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr_val));
                        let car_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car_val));
                        // Cons them together
                        let pair = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", pair, car_val, cdr_val));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", pair));
                    }
                    _ => {
                        // Other quoted forms need to be constructed as list structures
                        // For now, push nil
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                }
                Ok(())
            }

            // Cond - multi-clause conditional
            ASTNode::Cond { clauses } => {
                if clauses.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // CRITICAL: Save symbol_table to prevent SSA scoping issues
                // SSA values defined inside scf.if regions are not visible outside
                let saved_symbols = self.symbol_table.clone();

                // Compile as nested if expressions
                for (i, (test, result)) in clauses.iter().enumerate() {
                    // Restore symbol table before each test evaluation
                    // This ensures we don't use SSA values from previous branches
                    self.symbol_table = saved_symbols.clone();

                    // Evaluate test
                    self.compile_expr(test)?;

                    // Pop and check against NIL (not 0 - NIL has a distinct representation)
                    let cond_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cond_val));
                    let nil_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                    let cond_bool = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", cond_bool, cond_val, nil_val));

                    self.writeln(&format!("scf.if {} {{", cond_bool));
                    self.indent();

                    // Evaluate result
                    self.compile_expr(result)?;

                    self.dedent();
                    if i < clauses.len() - 1 {
                        self.writeln("} else {");
                        self.indent();
                    }
                }

                // Close all the else clauses
                for _ in 0..clauses.len()-1 {
                    self.dedent();
                    self.writeln("}");
                }
                self.writeln("}");

                // Restore symbol table after all scf.if blocks
                self.symbol_table = saved_symbols;

                Ok(())
            }

            // Setq - assignment
            ASTNode::Setq { var, value } => {
                // Evaluate value
                self.compile_expr(value)?;

                // Pop the value from stack
                let val_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));

                // Check if this is a local variable (in symbol table)
                if self.symbol_table.contains_key(var) {
                    // Update local symbol table
                    self.symbol_table.insert(var.clone(), val_ssa.clone());
                } else {
                    // Global/special variable - call cc_set_symbol_value
                    let var_sym = self.create_symbol_constant(var);
                    let _result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                        _result, var_sym, val_ssa));
                }

                // Push the value back (setq returns the value)
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", val_ssa));
                Ok(())
            }

            // Let bindings - all bindings evaluated in parallel (using outer scope)
            ASTNode::Let { bindings, body } => {
                // Save current symbol table
                let saved_symbols = self.symbol_table.clone();

                // Evaluate all binding values first (in outer scope)
                let mut binding_ssas = Vec::new();
                for (_var, value) in bindings {
                    self.compile_expr(value)?;
                    let val_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                    binding_ssas.push(val_ssa);
                }

                // Now bind all variables to their values
                for ((var, _), val_ssa) in bindings.iter().zip(binding_ssas.iter()) {
                    self.symbol_table.insert(var.clone(), val_ssa.clone());

                    // If this is a special variable (surrounded by *), also set dynamic binding
                    if var.starts_with('*') && var.ends_with('*') && var.len() > 2 {
                        // Create symbol for the variable name
                        let sym_const = self.create_string_constant(var);
                        let sym_ptr = self.fresh_ssa();
                        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", sym_ptr, sym_const));
                        let len_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", len_ssa, var.len()));
                        let sym_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_make_symbol({}, {}) : (!llvm.ptr, i64) -> i64",
                            sym_ssa, sym_ptr, len_ssa));
                        // Set the dynamic binding
                        let _result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                            _result, sym_ssa, val_ssa));
                    }
                }

                // Evaluate body
                if body.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                } else {
                    for (i, expr) in body.iter().enumerate() {
                        self.compile_expr(expr)?;
                        // Pop all but last result
                        if i < body.len() - 1 {
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                }

                // Restore symbol table, but preserve loop-carried variables
                if let Some(ref loop_vars) = self.loop_carried_vars {
                    // Save current values of loop-carried variables
                    let loop_carried_values: Vec<(String, String)> = loop_vars.iter()
                        .filter_map(|v| self.symbol_table.get(v).map(|val| (v.clone(), val.clone())))
                        .collect();

                    // Restore saved symbol table
                    self.symbol_table = saved_symbols;

                    // Restore loop-carried variables to their updated values
                    for (var, val) in loop_carried_values {
                        self.symbol_table.insert(var, val);
                    }
                } else {
                    // Not in a loop, just restore
                    self.symbol_table = saved_symbols;
                }
                Ok(())
            }

            // Let* bindings - sequential bindings (each can see previous ones)
            ASTNode::LetStar { bindings, body } => {
                // Save current symbol table
                let saved_symbols = self.symbol_table.clone();

                // Evaluate and bind each variable in sequence
                for (var, value) in bindings {
                    self.compile_expr(value)?;
                    let val_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                    self.symbol_table.insert(var.clone(), val_ssa.clone());

                    // If this is a special variable (surrounded by *), also set dynamic binding
                    if var.starts_with('*') && var.ends_with('*') && var.len() > 2 {
                        // Create symbol for the variable name
                        let sym_const = self.create_string_constant(var);
                        let sym_ptr = self.fresh_ssa();
                        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", sym_ptr, sym_const));
                        let len_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", len_ssa, var.len()));
                        let sym_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_make_symbol({}, {}) : (!llvm.ptr, i64) -> i64",
                            sym_ssa, sym_ptr, len_ssa));
                        // Set the dynamic binding
                        let _result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                            _result, sym_ssa, val_ssa));
                    }
                }

                // Evaluate body
                if body.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                } else {
                    for (i, expr) in body.iter().enumerate() {
                        self.compile_expr(expr)?;
                        // Pop all but last result
                        if i < body.len() - 1 {
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                }

                // Restore symbol table, but preserve loop-carried variables
                if let Some(ref loop_vars) = self.loop_carried_vars {
                    // Save current values of loop-carried variables
                    let loop_carried_values: Vec<(String, String)> = loop_vars.iter()
                        .filter_map(|v| self.symbol_table.get(v).map(|val| (v.clone(), val.clone())))
                        .collect();

                    // Restore saved symbol table
                    self.symbol_table = saved_symbols;

                    // Restore loop-carried variables to their updated values
                    for (var, val) in loop_carried_values {
                        self.symbol_table.insert(var, val);
                    }
                } else {
                    // Not in a loop, just restore
                    self.symbol_table = saved_symbols;
                }
                Ok(())
            }

            // Block - establishes a named exit point
            ASTNode::Block { name, body } => {
                // For now, blocks just evaluate body expressions
                // A proper implementation would need to handle return-from
                // by using exception-like control flow or continuation passing
                if body.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                } else {
                    for (i, expr) in body.iter().enumerate() {
                        self.compile_expr(expr)?;
                        // Pop all but last result
                        if i < body.len() - 1 {
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                }
                Ok(())
            }

            // Return-from - non-local exit from a block
            ASTNode::ReturnFrom { block_name, value } => {
                // Evaluate the return value
                if let Some(val) = value {
                    self.compile_expr(val)?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                // A proper implementation would need to perform a non-local exit
                // This would require either:
                // 1. Exception-like mechanism (not directly supported in MLIR SCF)
                // 2. Continuation passing style
                // 3. Transformation to use result values through scf.if/while
                // For now, we just evaluate the value and leave it on stack
                Ok(())
            }

            // Lambda - creates an anonymous function
            ASTNode::Lambda { params, defaults, supplied_p_vars, body } => {
                // Generate a unique function name for this lambda
                // Use __lambda_ prefix so it gets registered by the JIT
                let lambda_name = format!("__lambda_{}", self.function_counter);
                let lambda_id = self.function_counter;
                self.function_counter += 1;

                // Find free variables in the lambda body
                let mut bound_vars = HashSet::new();
                for param in params {
                    bound_vars.insert(param.clone());
                }
                let mut free_vars_set = HashSet::new();
                for expr in body {
                    free_vars_set.extend(self.find_free_vars(expr, &bound_vars));
                }
                // Convert to sorted vec for deterministic order
                let mut free_vars: Vec<String> = free_vars_set.into_iter().collect();
                free_vars.sort();

                // Save current context
                let saved_symbols = self.symbol_table.clone();
                let saved_indent = self.indent_level;
                let saved_output = std::mem::take(&mut self.output);

                // Generate the lambda function definition
                self.indent_level = 1;
                self.writeln(&format!("func.func @\"{}\"() {{", lambda_name));
                self.indent();

                // Clear symbol table for lambda scope
                self.symbol_table.clear();

                // Pop parameters from stack (in reverse order)
                for param in params.iter().rev() {
                    let param_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", param_ssa));
                    self.symbol_table.insert(param.clone(), param_ssa);
                }

                // Pop captured variables from stack (in reverse order since stack is LIFO)
                for var in free_vars.iter().rev() {
                    let var_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", var_ssa));
                    self.symbol_table.insert(var.clone(), var_ssa);
                }

                // Handle default values (if parameter was not supplied)
                // Note: This is simplified - proper implementation would need runtime checks
                for (param, default_expr) in defaults {
                    if !self.symbol_table.contains_key(param) {
                        self.compile_expr(default_expr)?;
                        let default_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", default_ssa));
                        self.symbol_table.insert(param.clone(), default_ssa);
                    }
                }

                // Handle supplied-p variables
                for (param, supplied_p_var) in supplied_p_vars {
                    // For now, assume all parameters are supplied
                    // Proper implementation would track this at runtime
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 1 : i64", t_val));
                    self.symbol_table.insert(supplied_p_var.clone(), t_val);
                }

                // Compile lambda body - catch errors to ensure state is always restored
                let compile_result = if body.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    Ok(())
                } else {
                    let mut result = Ok(());
                    for (i, expr) in body.iter().enumerate() {
                        if let Err(e) = self.compile_expr(expr) {
                            result = Err(e);
                            break;
                        }
                        // Pop all but last result
                        if i < body.len() - 1 {
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                    result
                };

                // Write stub if body compilation failed
                if compile_result.is_err() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                self.writeln("func.return");
                self.dedent();
                self.writeln("}");

                // Save the lambda function definition
                let lambda_func = std::mem::take(&mut self.output);
                self.pending_functions.push(lambda_func);

                // Always restore context (even on error)
                self.output = saved_output;
                self.indent_level = saved_indent;
                self.symbol_table = saved_symbols;

                // Push captured variables onto the stack (in order)
                for var in &free_vars {
                    if let Some(var_ssa) = self.symbol_table.get(var) {
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", var_ssa));
                    }
                }

                // Create closure with captured variables
                let id_const = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", id_const, lambda_id));
                let num_captured_const = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", num_captured_const, free_vars.len()));
                let closure = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_closure({}, {}) : (i64, i64) -> i64",
                    closure, id_const, num_captured_const));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", closure));
                Ok(())
            }

            // Dotted pair
            ASTNode::DottedPair { car, cdr } => {
                self.compile_expr(car)?;
                self.compile_expr(cdr)?;

                let cdr_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr_val));
                let car_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car_val));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", result, car_val, cdr_val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Backquote/quasiquote - like quote but allows unquote
            ASTNode::Backquote(inner) => {
                // Backquote needs to recursively process the structure,
                // evaluating unquoted parts and keeping quoted parts literal
                // This is complex and requires proper expansion
                // For now, we'll handle simple cases
                self.compile_backquote(inner)?;
                Ok(())
            }

            // Unquote
            ASTNode::Unquote(inner) => {
                // Should only appear inside backquote
                self.compile_expr(inner)?;
                Ok(())
            }

            // Unquote-splicing
            ASTNode::UnquoteSplicing(inner) => {
                // Should only appear inside backquote
                self.compile_expr(inner)?;
                Ok(())
            }

            // Dotimes - iterate from 0 to count-1
            ASTNode::Dotimes { var, count, result, body } => {
                // Save current symbol table
                let saved_symbols = self.symbol_table.clone();

                // Find variables that are modified via setq in the loop body
                let mut modified_vars = HashSet::new();
                for expr in body {
                    modified_vars.extend(self.find_setq_vars(expr));
                }
                // Only include variables that exist in outer scope
                let loop_carried_vars: Vec<String> = modified_vars.iter()
                    .filter(|v| saved_symbols.contains_key(*v))
                    .cloned()
                    .collect();

                // Evaluate count expression
                self.compile_expr(count)?;
                let count_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", count_boxed));
                let count_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", count_val, count_boxed));

                // Initialize loop variable to 0
                let zero = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                let one = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 1 : i64", one));

                // Build initial values for loop-carried variables
                let mut initial_values = vec![zero.clone()];
                for var_name in &loop_carried_vars {
                    initial_values.push(saved_symbols.get(var_name).unwrap().clone());
                }

                // Create loop using scf.while with loop-carried variables
                let num_results = 1 + loop_carried_vars.len();
                let final_results = self.fresh_ssa();

                // Build type signature
                let type_sig = format!("({}) -> ({})",
                    vec!["i64"; num_results].join(", "),
                    vec!["i64"; num_results].join(", "));

                self.writeln(&format!("{}:{} = scf.while ({}) : {} {{",
                    final_results, num_results,
                    (0..num_results).map(|i| format!("%arg{} = {}", i, initial_values[i])).collect::<Vec<_>>().join(", "),
                    type_sig));
                self.indent();

                // Loop condition: i < count
                let cond = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi slt, %arg0, {} : i64", cond, count_val));
                let condition_vals = (0..num_results).map(|i| format!("%arg{}", i)).collect::<Vec<_>>().join(", ");
                self.writeln(&format!("scf.condition({}) {} : {}", cond, condition_vals, vec!["i64"; num_results].join(", ")));

                self.dedent();
                self.writeln("} do {");
                self.indent();

                // Loop body - receive all loop-carried variables
                let block_args = (0..num_results).map(|i| format!("%{}", self.next_ssa_id + i)).collect::<Vec<_>>();
                for _ in 0..num_results {
                    self.next_ssa_id += 1;
                }
                self.writeln(&format!("^bb0({}):",
                    block_args.iter().enumerate().map(|(_, arg)| format!("{}: i64", arg)).collect::<Vec<_>>().join(", ")));

                let loop_var = block_args[0].clone();

                // Box the loop variable and bind it
                let loop_var_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", loop_var_boxed, loop_var));
                self.symbol_table.insert(var.clone(), loop_var_boxed);

                // Bind loop-carried variables
                for (i, var_name) in loop_carried_vars.iter().enumerate() {
                    self.symbol_table.insert(var_name.clone(), block_args[i + 1].clone());
                }

                // Set loop context for conditional compilation
                self.loop_carried_vars = Some(loop_carried_vars.clone());

                // Execute body - capture errors to ensure scf.yield is always written
                let mut body_error = None;
                for expr in body {
                    if body_error.is_none() {
                        if let Err(e) = self.compile_expr(expr) {
                            body_error = Some(e);
                        } else {
                            // Pop intermediate results
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                }

                // Clear loop context
                self.loop_carried_vars = None;

                // Collect updated values for all loop-carried variables
                let mut yield_values = vec![];

                // Increment loop variable
                let next_i = self.fresh_ssa();
                self.writeln(&format!("{} = arith.addi {}, {} : i64", next_i, loop_var, one));
                yield_values.push(next_i);

                // Get updated values for modified variables - use block args on error
                for (i, var_name) in loop_carried_vars.iter().enumerate() {
                    if body_error.is_none() {
                        yield_values.push(self.symbol_table.get(var_name).unwrap().clone());
                    } else {
                        yield_values.push(block_args[i + 1].clone());
                    }
                }

                // Always write scf.yield to close the loop properly
                self.writeln(&format!("scf.yield {} : {}",
                    yield_values.join(", "),
                    vec!["i64"; num_results].join(", ")));

                self.dedent();
                self.writeln("}");

                // Extract final values and update symbol table
                // In MLIR, multi-result values are accessed with #index syntax
                for (i, var_name) in loop_carried_vars.iter().enumerate() {
                    self.symbol_table.insert(var_name.clone(), format!("{}#{}", final_results, i + 1));
                }

                // Evaluate result form (or nil)
                if let Some(result_expr) = result {
                    self.compile_expr(result_expr)?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                // Only restore variables that weren't modified in the loop
                for (var_name, var_val) in &saved_symbols {
                    if !loop_carried_vars.contains(var_name) {
                        self.symbol_table.insert(var_name.clone(), var_val.clone());
                    }
                }
                Ok(())
            }

            // Dolist - iterate over a list
            ASTNode::Dolist { var, list, result, body } => {
                // Save current symbol table
                let saved_symbols = self.symbol_table.clone();

                // Evaluate list expression
                self.compile_expr(list)?;
                let list_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list_val));

                // Create loop using scf.while
                // Loop while current is not nil
                let final_list = self.fresh_ssa();
                self.writeln(&format!("{} = scf.while (%arg0 = {}) : (i64) -> (i64) {{", final_list, list_val));
                self.indent();

                // Loop condition: current != nil
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                let cond = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi ne, %arg0, {} : i64", cond, nil_val));
                self.writeln(&format!("scf.condition({}) %arg0 : i64", cond));

                self.dedent();
                self.writeln("} do {");
                self.indent();

                // Loop body
                let current_cons = self.fresh_ssa();
                self.writeln(&format!("^bb0({}: i64):", current_cons));

                // Get car of current cons cell and bind to loop variable
                let car_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", car_val, current_cons));
                self.symbol_table.insert(var.clone(), car_val);

                // Execute body - capture errors to ensure scf.yield is always written
                for expr in body {
                    if let Err(_) = self.compile_expr(expr) {
                        // On error, continue to ensure loop is closed properly
                    } else {
                        // Pop intermediate results
                        let _tmp = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                    }
                }

                // Get cdr for next iteration - always write scf.yield to close loop
                let next_cons = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", next_cons, current_cons));
                self.writeln(&format!("scf.yield {} : i64", next_cons));

                self.dedent();
                self.writeln("}");

                // IMPORTANT: Restore symbol table BEFORE evaluating result
                // because SSA values from inside the loop are out of scope
                self.symbol_table = saved_symbols;

                // Evaluate result form (or nil)
                if let Some(result_expr) = result {
                    self.compile_expr(result_expr)?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                Ok(())
            }

            // Loop - complex iteration with accumulation
            ASTNode::Loop { var, start, limit, when_condition, collect, sum, else_collect, else_sum } => {
                debug_println!("DEBUG: Compiling ASTNode::Loop");
                // Save current symbol table
                let saved_symbols = self.symbol_table.clone();

                // Determine starting value (default 0)
                let start_val = if let Some(start_expr) = start {
                    self.compile_expr(start_expr)?;
                    let start_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", start_boxed));
                    let start_unboxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", start_unboxed, start_boxed));
                    start_unboxed
                } else {
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    zero
                };

                // Evaluate limit expression
                self.compile_expr(limit)?;
                let limit_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", limit_boxed));
                let limit_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", limit_val, limit_boxed));

                // Initialize accumulator to nil (for collect) or 0 (for sum)
                let init_accum = if sum.is_some() || else_sum.is_some() {
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed, zero));
                    boxed
                } else {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil));
                    nil
                };

                let one = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 1 : i64", one));

                // Create loop with accumulator
                // Returns both loop var and accumulator, we'll extract accumulator after
                let loop_results = self.fresh_ssa();
                self.writeln(&format!("{}:2 = scf.while (%arg0 = {}, %arg1 = {}) : (i64, i64) -> (i64, i64) {{", loop_results, start_val, init_accum));
                self.indent();

                // Loop condition
                let cond = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi slt, %arg0, {} : i64", cond, limit_val));
                self.writeln(&format!("scf.condition({}) %arg0, %arg1 : i64, i64", cond));

                self.dedent();
                self.writeln("} do {");
                self.indent();

                // Loop body
                let loop_var = self.fresh_ssa();
                let loop_accum = self.fresh_ssa();
                self.writeln(&format!("^bb0({}: i64, {}: i64):", loop_var, loop_accum));

                // Box and bind loop variable
                let loop_var_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", loop_var_boxed, loop_var));
                self.symbol_table.insert(var.clone(), loop_var_boxed);

                // Evaluate condition (if present)
                let should_process = if let Some(cond_expr) = when_condition {
                    self.compile_expr(cond_expr)?;
                    let cond_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cond_val));
                    let nil_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                    let cond_bool = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", cond_bool, cond_val, nil_val));
                    Some(cond_bool)
                } else {
                    None
                };

                // Determine new accumulator value
                let new_accum = if let Some(cond_bool) = should_process {
                    // Use scf.if to conditionally update accumulator
                    // CRITICAL: Save symbol_table before scf.if
                    let saved_symbols = self.symbol_table.clone();
                    let result_accum = self.fresh_ssa();
                    self.writeln(&format!("{} = scf.if {} -> i64 {{", result_accum, cond_bool));
                    self.indent();

                    if let Some(collect_expr) = collect {
                        self.compile_expr(collect_expr)?;
                        let val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                        let new_list = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, val, loop_accum));
                        self.writeln(&format!("scf.yield {} : i64", new_list));
                    } else if let Some(sum_expr) = sum {
                        self.compile_expr(sum_expr)?;
                        let val_boxed = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_boxed));
                        let val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", val, val_boxed));
                        let accum_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", accum_val, loop_accum));
                        let new_sum = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.addi {}, {} : i64", new_sum, accum_val, val));
                        let boxed_sum = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed_sum, new_sum));
                        self.writeln(&format!("scf.yield {} : i64", boxed_sum));
                    } else {
                        self.writeln(&format!("scf.yield {} : i64", loop_accum));
                    }

                    self.dedent();
                    self.writeln("} else {");
                    self.indent();
                    // Restore symbol_table before else branch
                    self.symbol_table = saved_symbols.clone();

                    if let Some(else_collect_expr) = else_collect {
                        self.compile_expr(else_collect_expr)?;
                        let val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                        let new_list = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, val, loop_accum));
                        self.writeln(&format!("scf.yield {} : i64", new_list));
                    } else if let Some(else_sum_expr) = else_sum {
                        self.compile_expr(else_sum_expr)?;
                        let val_boxed = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_boxed));
                        let val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", val, val_boxed));
                        let accum_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", accum_val, loop_accum));
                        let new_sum = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.addi {}, {} : i64", new_sum, accum_val, val));
                        let boxed_sum = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed_sum, new_sum));
                        self.writeln(&format!("scf.yield {} : i64", boxed_sum));
                    } else {
                        self.writeln(&format!("scf.yield {} : i64", loop_accum));
                    }

                    self.dedent();
                    self.writeln("}");
                    // Restore symbol_table after scf.if closes
                    self.symbol_table = saved_symbols;
                    result_accum
                } else {
                    // No condition, always process
                    if let Some(collect_expr) = collect {
                        self.compile_expr(collect_expr)?;
                        let val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                        let new_list = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, val, loop_accum));
                        new_list
                    } else if let Some(sum_expr) = sum {
                        self.compile_expr(sum_expr)?;
                        let val_boxed = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_boxed));
                        let val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", val, val_boxed));
                        let accum_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", accum_val, loop_accum));
                        let new_sum = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.addi {}, {} : i64", new_sum, accum_val, val));
                        let boxed_sum = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed_sum, new_sum));
                        boxed_sum
                    } else {
                        loop_accum.clone()
                    }
                };

                // Increment loop variable
                let next_i = self.fresh_ssa();
                self.writeln(&format!("{} = arith.addi {}, {} : i64", next_i, loop_var, one));
                self.writeln(&format!("scf.yield {}, {} : i64, i64", next_i, new_accum));

                self.dedent();
                self.writeln("}");

                // Extract the accumulator (second result)
                // For collect loops, reverse the list (since we built in reverse)
                // For sum loops, just use the accumulator as-is
                if collect.is_some() || else_collect.is_some() {
                    let reversed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_reverse({}#1) : (i64) -> i64", reversed, loop_results));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", reversed));
                } else {
                    // For sum, just push the accumulator directly
                    self.writeln(&format!("func.call @stack_push_pointer({}#1) : (i64) -> ()", loop_results));
                }

                // Restore symbol table
                self.symbol_table = saved_symbols;
                Ok(())
            }

            // Hash table - create hash table with initial entries
            ASTNode::HashTable { entries } => {
                // Create empty hash table
                let ht = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_hash_table() : () -> i64", ht));

                // Add each entry
                for (key, value) in entries {
                    // Evaluate key
                    self.compile_expr(key)?;
                    let key_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key_val));

                    // Evaluate value
                    self.compile_expr(value)?;
                    let val_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_val));

                    // Insert into hash table
                    self.writeln(&format!("func.call @cc_hash_table_set({}, {}, {}) : (i64, i64, i64) -> ()", ht, key_val, val_val));
                }

                // Push hash table to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", ht));
                Ok(())
            }

            // Vector - create vector with elements
            ASTNode::Vector(elements) => {
                // First, evaluate all elements onto the stack
                for elem in elements.iter() {
                    self.compile_expr(elem)?;
                }

                // Create vector with the given size
                let len = elements.len();
                let len_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", len_ssa, len));

                let vec = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_vector({}) : (i64) -> i64", vec, len_ssa));

                // Pop elements from stack in reverse order and set them
                for i in (0..len).rev() {
                    let elem_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", elem_val));
                    let idx = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant {} : i64", idx, i));
                    let _discard = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_svset({}, {}, {}) : (i64, i64, i64) -> i64", _discard, vec, idx, elem_val));
                }

                // Push vector to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", vec));
                Ok(())
            }

            // C FFI call - call external C function
            ASTNode::CCall { function, args } => {
                // Evaluate all arguments
                for arg in args {
                    self.compile_expr(arg)?;
                }

                // Build arguments list by popping from stack
                let mut arg_ssas = Vec::new();
                for _ in 0..args.len() {
                    let arg_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg_ssa));
                    arg_ssas.push(arg_ssa);
                }
                arg_ssas.reverse(); // Restore original order

                // Call the C function through FFI wrapper
                // The C function should be declared externally
                let result = self.fresh_ssa();
                let args_str = arg_ssas.join(", ");
                let args_types = vec!["i64"; args.len()].join(", ");
                if args.is_empty() {
                    self.writeln(&format!("{} = func.call @c_ffi_{}() : () -> i64", result, function));
                } else {
                    self.writeln(&format!("{} = func.call @c_ffi_{}({}) : ({}) -> i64", result, function, args_str, args_types));
                }

                // Push result to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // C++ method call - call method on C++ object
            ASTNode::CppMethodCall { object, method, args } => {
                // Evaluate object
                self.compile_expr(object)?;
                let obj_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", obj_ssa));

                // Evaluate all arguments
                for arg in args {
                    self.compile_expr(arg)?;
                }

                // Build arguments list by popping from stack
                let mut arg_ssas = Vec::new();
                for _ in 0..args.len() {
                    let arg_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg_ssa));
                    arg_ssas.push(arg_ssa);
                }
                arg_ssas.reverse(); // Restore original order

                // Call the C++ method through FFI wrapper
                let result = self.fresh_ssa();
                let all_args = std::iter::once(obj_ssa.as_str())
                    .chain(arg_ssas.iter().map(|s| s.as_str()))
                    .collect::<Vec<_>>()
                    .join(", ");
                let all_types = vec!["i64"; args.len() + 1].join(", ");
                self.writeln(&format!("{} = func.call @cpp_method_{}({}) : ({}) -> i64", result, method, all_args, all_types));

                // Push result to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // CLOS - Defclass
            ASTNode::Defclass { name, superclasses, slots } => {
                // Define a new class using runtime system

                // Build slot names list (list of symbols for each slot name)
                self.writeln("func.call @stack_push_nil() : () -> ()");
                for slot in slots.iter().rev() {
                    // Create a symbol for the slot name
                    let slot_name_sym = self.create_symbol_constant(&slot.name);

                    let list_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list_val));
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, slot_name_sym, list_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                }
                let slots_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", slots_list));

                // Build superclasses list
                self.writeln("func.call @stack_push_nil() : () -> ()");
                for _super_name in superclasses.iter().rev() {
                    // TODO: look up superclass object
                    // For now, push nil for each superclass
                    self.writeln("func.call @stack_push_nil() : () -> ()");

                    let super_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", super_val));
                    let list_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list_val));
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, super_val, list_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                }
                let supers_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", supers_list));

                // Create a symbol for the class name
                let class_name_sym = self.create_symbol_constant(name);

                // Call runtime to create class: cc_defclass(class_name, slot_names, superclasses)
                let class_obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defclass({}, {}, {}) : (i64, i64, i64) -> i64", class_obj, class_name_sym, slots_list, supers_list));

                // Generate accessor functions for slots
                // Handle :accessor, :reader, and :writer
                for (_slot_idx, slot) in slots.iter().enumerate() {
                    // Collect all reader names (from :accessor or :reader)
                    let mut reader_names: Vec<String> = Vec::new();
                    if let Some(accessor_name) = &slot.accessor {
                        reader_names.push(accessor_name.clone());
                    }
                    if let Some(reader_name) = &slot.reader {
                        reader_names.push(reader_name.clone());
                    }

                    // Generate reader functions
                    for accessor_name in reader_names {
                        // Skip if already compiled (prevent duplicates)
                        if self.compiled_functions.contains(&accessor_name) {
                            continue;
                        }
                        self.compiled_functions.insert(accessor_name.clone());

                        // Generate a reader function
                        // (defun <reader-name> (object) (slot-value object '<slot-name>))
                        let saved_state = self.save_state();

                        self.indent_level = 1;
                        self.writeln(&format!("func.func @\"{}\"() {{", accessor_name));
                        self.indent();

                        // Pop object parameter from stack
                        let obj = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", obj));

                        // Create slot name symbol
                        let slot_name_sym = self.create_symbol_constant(&slot.name);

                        // Call runtime to get slot value
                        let slot_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_slot_value({}, {}) : (i64, i64) -> i64", slot_val, obj, slot_name_sym));

                        // Push result to stack
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", slot_val));

                        self.writeln("func.return");
                        self.dedent();
                        self.writeln("}");

                        let accessor_func = std::mem::take(&mut self.output);
                        self.pending_functions.push(accessor_func);

                        self.restore_state(saved_state);
                    }

                    // Generate writer function (from :accessor or :writer)
                    let mut writer_names: Vec<String> = Vec::new();
                    if let Some(accessor_name) = &slot.accessor {
                        // :accessor generates both reader and (setf accessor) writer
                        writer_names.push(format!("(setf {})", accessor_name));
                    }
                    if let Some(writer_name) = &slot.writer {
                        writer_names.push(writer_name.clone());
                    }

                    for writer_name in writer_names {
                        // Skip setf-style writers for now (complex)
                        if writer_name.starts_with("(setf") {
                            continue;
                        }

                        // Skip if already compiled
                        if self.compiled_functions.contains(&writer_name) {
                            continue;
                        }
                        self.compiled_functions.insert(writer_name.clone());

                        // Generate a writer function
                        // (defun <writer-name> (new-value object) (setf (slot-value object '<slot-name>) new-value))
                        let saved_state = self.save_state();

                        self.indent_level = 1;
                        self.writeln(&format!("func.func @\"{}\"() {{", writer_name));
                        self.indent();

                        // Pop object parameter from stack
                        let obj = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", obj));

                        // Pop new value from stack
                        let new_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", new_val));

                        // Create slot name symbol
                        let slot_name_sym = self.create_symbol_constant(&slot.name);

                        // Call runtime to set slot value
                        let result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_set_slot_value({}, {}, {}) : (i64, i64, i64) -> i64", result, obj, slot_name_sym, new_val));

                        // Push result to stack
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));

                        self.writeln("func.return");
                        self.dedent();
                        self.writeln("}");

                        let writer_func = std::mem::take(&mut self.output);
                        self.pending_functions.push(writer_func);

                        self.restore_state(saved_state);
                    }
                }

                // Push class object to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", class_obj));
                Ok(())
            }

            // CLOS - Defgeneric
            ASTNode::Defgeneric { name, lambda_list } => {
                // Register this as a generic function for runtime dispatch
                self.generic_functions.insert(name.to_string());

                // Define a new generic function
                let param_count = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", param_count, lambda_list.len()));
                let param_count_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", param_count_boxed, param_count));

                // Create the generic function name as a symbol
                let name_sym = self.create_symbol_constant(name);

                // Call runtime to create generic function with its name
                let generic_obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defgeneric({}, {}) : (i64, i64) -> i64", generic_obj, name_sym, param_count_boxed));

                // Push generic function object to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", generic_obj));
                Ok(())
            }

            // CLOS - Defmethod
            ASTNode::Defmethod { generic_name, qualifier, specializers, params, body } => {
                // Compile the method as a function and register with the generic function

                // Generate unique method function name
                let qualifier_suffix = match qualifier.as_ref().map(|s| s.to_uppercase()).as_deref() {
                    Some(":BEFORE") => "_before",
                    Some(":AFTER") => "_after",
                    Some(":AROUND") => "_around",
                    _ => "_primary",
                };
                let method_id = self.fresh_id();
                let method_name = format!("{}_{}{}", generic_name, method_id, qualifier_suffix);

                // Save current state
                let saved_symbols = self.symbol_table.clone();
                let saved_indent = self.indent_level;
                let saved_output = std::mem::take(&mut self.output);

                // Generate method as a function
                self.indent_level = 1;
                self.writeln(&format!("func.func @\"{}\"() {{", method_name));
                self.indent();

                self.symbol_table.clear();

                // Pop parameters from stack (in reverse order)
                for param in params.iter().rev() {
                    let param_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", param_ssa));
                    self.symbol_table.insert(param.clone(), param_ssa);
                }

                // Compile method body - catch errors to ensure state is always restored
                let compile_result = if body.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    Ok(())
                } else {
                    let mut result = Ok(());
                    for (i, expr) in body.iter().enumerate() {
                        if let Err(e) = self.compile_expr(expr) {
                            result = Err(e);
                            break;
                        }
                        if i < body.len() - 1 {
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                    result
                };

                // Write stub if body compilation failed
                if compile_result.is_err() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                self.writeln("func.return");
                self.dedent();
                self.writeln("}");

                // Add to pending functions
                let method_func = std::mem::take(&mut self.output);
                self.pending_functions.push(method_func);

                // Always restore state (even on error)
                self.output = saved_output;
                self.indent_level = saved_indent;
                self.symbol_table = saved_symbols;

                // Get a lambda reference for the method by name
                // Create a string constant with the method function name
                let str_name = format!("@method_name_{}", method_id);
                self.pending_string_constants.push((str_name.clone(), method_name.clone()));
                let name_ptr = self.fresh_ssa();
                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, str_name));
                let func_ptr_int = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ptr_int, name_ptr));

                // Create generic name as symbol
                let name_sym = self.create_symbol_constant(generic_name);

                // Create specializers list
                let specs_nil: String;
                if specializers.is_empty() {
                    let nil_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil_val));
                    specs_nil = nil_val;
                } else {
                    // Create list of specializer symbols
                    let mut current = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", current));
                    for spec in specializers.iter().rev() {
                        let spec_sym = self.create_symbol_constant(spec);
                        let new_cons = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_cons, spec_sym, current));
                        current = new_cons;
                    }
                    specs_nil = current;
                }

                // Arity (number of parameters)
                let arity = params.len();
                let arity_const = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", arity_const, arity));
                let arity_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", arity_boxed, arity_const));

                // Qualifier code: 0=primary, 1=before, 2=after, 3=around
                let qualifier_code = match qualifier.as_ref().map(|s| s.to_uppercase()).as_deref() {
                    Some(":BEFORE") => 1,
                    Some(":AFTER") => 2,
                    Some(":AROUND") => 3,
                    _ => 0,
                };
                let qualifier_const = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", qualifier_const, qualifier_code));
                let qualifier_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", qualifier_boxed, qualifier_const));

                // Register method with generic function
                // Signature: (generic_name, specializers, function_ptr, arity, qualifier)
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defmethod_qualified({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                    result, name_sym, specs_nil, func_ptr_int, arity_boxed, qualifier_boxed));

                // Push result to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Macro
            ASTNode::Macro { params, body } => {
                // Macros should be expanded before reaching codegen
                anyhow::bail!("Unexpanded macro in code generation");
            }
        }
    }

    /// Helper for compiling backquote expressions
    fn compile_backquote(&mut self, expr: &ASTNode) -> Result<()> {
        match expr {
            // Unquote evaluates the expression
            ASTNode::Unquote(inner) => {
                self.compile_expr(inner)?;
            }
            // Constants are literal
            ASTNode::Constant(_) => {
                self.compile_expr(expr)?;
            }
            // Variables become symbols (for now, push nil)
            ASTNode::Variable(_) => {
                self.writeln("func.call @stack_push_nil() : () -> ()");
            }
            // Lists need to be constructed recursively
            _ => {
                // For complex structures, we'd need to recursively process
                // For now, just push nil
                self.writeln("func.call @stack_push_nil() : () -> ()");
            }
        }
        Ok(())
    }

    /// Compile a function call - arguments pushed to stack, result on stack
    fn compile_call(&mut self, func_name: &str, args: &[ASTNode]) -> Result<()> {
        // Strip package qualifier from function name for matching special forms
        // e.g., "cl:defun" -> "defun", "pkg:func" -> "func"
        let base_name = if let Some(colon_pos) = func_name.rfind(':') {
            &func_name[colon_pos + 1..]
        } else {
            func_name
        };

        if !rlasp::is_cl_builtin(base_name) {
            return self.compile_user_function_call(base_name, args);
        }

        match base_name {
            // ==========================================================================
            // SPECIAL FORMS - These are NOT function calls, they modify the environment
            // ==========================================================================

            "defvar" | "defparameter" | "defconstant" => {
                // (defvar name [value [doc]])
                // (defparameter name value [doc])
                // (defconstant name value [doc])
                if args.is_empty() {
                    anyhow::bail!("{} requires at least a name", func_name);
                }

                // Get the symbol name
                let var_name = match &args[0] {
                    ASTNode::Variable(name) => name.clone(),
                    ASTNode::Constant(ConstantValue::Symbol(name)) => name.clone(),
                    _ => anyhow::bail!("{}: first argument must be a symbol", func_name),
                };

                // Create the symbol
                let name_sym = self.create_symbol_constant(&var_name);

                // If there's a value, evaluate and set it
                if args.len() >= 2 {
                    // For defvar, only set if unbound (we'll let runtime handle that)
                    // For defparameter/defconstant, always set
                    self.compile_expr(&args[1])?;
                    let value_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", value_ssa));

                    // Set the symbol's value
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                        result, name_sym, value_ssa));
                }

                // Push the symbol name as result
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", name_sym));
                return Ok(());
            }

            "defun" => {
                // (defun name params &rest body)
                if args.len() < 2 {
                    anyhow::bail!("defun requires at least name and params");
                }

                // Get function name and add %FN% prefix to match irlasp extraction
                let raw_fn_name = match &args[0] {
                    ASTNode::Variable(name) => name.clone(),
                    ASTNode::Constant(ConstantValue::Symbol(name)) => name.clone(),
                    ASTNode::Quote(inner) => {
                        // Handle quoted symbols like 'name
                        match inner.as_ref() {
                            ASTNode::Variable(name) => name.clone(),
                            ASTNode::Constant(ConstantValue::Symbol(name)) => name.clone(),
                            _ => {
                                eprintln!("[STUB] defun: skipping function with non-symbol name {:?}", args[0]);
                                self.writeln("func.call @stack_push_nil() : () -> ()");
                                return Ok(());
                            }
                        }
                    }
                    ASTNode::Call { function, args: call_args } => {
                        // Handle (setf name) style function names
                        if let ASTNode::Variable(func_name) = function.as_ref() {
                            if func_name == "setf" && call_args.len() == 1 {
                                if let ASTNode::Variable(name) = &call_args[0] {
                                    format!("(setf {})", name)
                                } else {
                                    eprintln!("[STUB] defun: skipping function with complex setf name {:?}", args[0]);
                                    self.writeln("func.call @stack_push_nil() : () -> ()");
                                    return Ok(());
                                }
                            } else {
                                eprintln!("[STUB] defun: skipping function with call-style name {:?}", args[0]);
                                self.writeln("func.call @stack_push_nil() : () -> ()");
                                return Ok(());
                            }
                        } else {
                            eprintln!("[STUB] defun: skipping function with non-symbol name {:?}", args[0]);
                            self.writeln("func.call @stack_push_nil() : () -> ()");
                            return Ok(());
                        }
                    }
                    _ => {
                        eprintln!("[STUB] defun: skipping function with non-symbol name {:?}", args[0]);
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                        return Ok(());
                    }
                };
                // Add %FN% prefix to match how irlasp extracts defuns
                let fn_name = format!("%FN%{}", raw_fn_name);

                // Skip if already compiled (prevent duplicates)
                if self.compiled_functions.contains(&fn_name) {
                    // Just push the function name as result (don't recompile)
                    let name_sym = self.create_symbol_constant(&raw_fn_name);
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", name_sym));
                    return Ok(());
                }

                // Parse parameters from args[1]
                let params = self.extract_param_list(&args[1])?;

                // Body is args[2..]
                let body = if args.len() > 2 {
                    if args.len() == 3 {
                        args[2].clone()
                    } else {
                        ASTNode::Progn { exprs: args[2..].to_vec() }
                    }
                } else {
                    // Empty body returns nil
                    ASTNode::Constant(ConstantValue::Nil)
                };

                // Save current output and indentation
                let saved_output = std::mem::take(&mut self.output);
                let saved_indent = self.indent_level;

                // Set indent to module level (1)
                self.indent_level = 1;

                // Compile the function (ensure state is restored on error)
                let compile_result = self.compile_function(&fn_name, &params, &body);

                // Get the generated function code and restore state
                let func_code = std::mem::replace(&mut self.output, saved_output);
                self.indent_level = saved_indent;

                // Handle compilation result
                match compile_result {
                    Ok(()) => {
                        self.pending_functions.push(func_code);
                        // Track this function so we can call it directly
                        self.compiled_functions.insert(fn_name.clone());
                    }
                    Err(e) => {
                        // Function failed to compile - just log and continue
                        // (the function will be available via interpreter fallback)
                        debug_println!("[defun] Failed to compile {}: {}", fn_name, e);
                    }
                }

                // Push the function name as a symbol (defun returns the function name)
                // Use raw_fn_name without prefix for the returned symbol
                let name_sym = self.create_symbol_constant(&raw_fn_name);
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", name_sym));
                return Ok(());
            }

            "defmacro" => {
                // Macros should be expanded at compile time, not runtime
                // For JIT, we just return the macro name as a symbol
                // The macro expansion happens in the Lisp frontend
                if args.is_empty() {
                    anyhow::bail!("defmacro requires at least a name");
                }

                let macro_name = match &args[0] {
                    ASTNode::Variable(name) => name.clone(),
                    ASTNode::Constant(ConstantValue::Symbol(name)) => name.clone(),
                    _ => anyhow::bail!("defmacro: macro name must be a symbol"),
                };

                // Push the macro name as result
                let name_sym = self.create_symbol_constant(&macro_name);
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", name_sym));
                return Ok(());
            }

            // defgeneric as Call node (when parser returns Call instead of Defgeneric)
            "defgeneric" => {
                // (defgeneric name lambda-list ...)
                // Handle when defgeneric comes in as a Call (e.g., from macro expansion)
                if args.is_empty() {
                    anyhow::bail!("defgeneric requires at least a name");
                }

                // Parse generic function name
                let name = match &args[0] {
                    ASTNode::Variable(n) => n.clone(),
                    ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
                    ASTNode::Call { function, args: setf_args } => {
                        if let ASTNode::Variable(fn_name) = function.as_ref() {
                            if fn_name.eq_ignore_ascii_case("setf") && !setf_args.is_empty() {
                                if let ASTNode::Variable(setf_name) = &setf_args[0] {
                                    format!("(setf {})", setf_name)
                                } else {
                                    return Err(anyhow::anyhow!("defgeneric (setf name) requires a symbol"));
                                }
                            } else {
                                return Err(anyhow::anyhow!("defgeneric name must be a symbol or (setf name)"));
                            }
                        } else {
                            return Err(anyhow::anyhow!("defgeneric name must be a symbol"));
                        }
                    }
                    _ => return Err(anyhow::anyhow!("defgeneric name must be a symbol")),
                };

                // Parse lambda list (just count parameters, don't evaluate them)
                let param_count = if args.len() > 1 {
                    match &args[1] {
                        ASTNode::Constant(ConstantValue::Nil) => 0,
                        ASTNode::Call { function: _, args: params } => params.len() + 1,
                        ASTNode::Variable(_) => 1, // Single parameter
                        _ => 0,
                    }
                } else {
                    0
                };

                // Register as generic function
                self.generic_functions.insert(name.clone());

                // Compile: call cc_defgeneric(name_symbol, param_count)
                let param_count_raw = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", param_count_raw, param_count));
                let param_count_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", param_count_boxed, param_count_raw));

                let name_sym = self.create_symbol_constant(&name);
                let generic_obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defgeneric({}, {}) : (i64, i64) -> i64", generic_obj, name_sym, param_count_boxed));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", generic_obj));
                return Ok(());
            }

            // defmethod as Call node (when parser returns Call instead of Defmethod)
            "defmethod" => {
                // (defmethod name [qualifier] specialized-lambda-list body...)
                // Handle when defmethod comes in as a Call
                if args.is_empty() {
                    anyhow::bail!("defmethod requires at least a name");
                }

                // Parse generic function name
                let generic_name = match &args[0] {
                    ASTNode::Variable(n) => n.clone(),
                    ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
                    _ => return Err(anyhow::anyhow!("defmethod name must be a symbol")),
                };

                // Find the lambda-list (first list after the name, possibly after a qualifier)
                let mut idx = 1;
                let mut qualifier: Option<String> = None;

                // Check if there's a qualifier (keyword like :before, :after, :around)
                if idx < args.len() {
                    if let ASTNode::Constant(ConstantValue::Symbol(s)) = &args[idx] {
                        if s.starts_with(':') {
                            qualifier = Some(s.clone());
                            idx += 1;
                        }
                    }
                }

                // Parse specialized lambda-list and extract param names
                let mut params = Vec::new();
                let mut specializers = Vec::new();
                if idx < args.len() {
                    match &args[idx] {
                        ASTNode::Constant(ConstantValue::Nil) => {}
                        ASTNode::Call { function, args: param_list } => {
                            // Process first param
                            Self::extract_method_param(function, &mut params, &mut specializers);
                            // Process rest of params
                            for p in param_list {
                                Self::extract_method_param(p, &mut params, &mut specializers);
                            }
                        }
                        ASTNode::Variable(p) => {
                            params.push(p.clone());
                            specializers.push("t".to_string());
                        }
                        _ => {}
                    }
                    idx += 1;
                }

                // Body is rest of args
                let body: Vec<ASTNode> = args[idx..].to_vec();

                // Generate method function name
                let qualifier_suffix = match qualifier.as_ref().map(|s| s.to_uppercase()).as_deref() {
                    Some(":BEFORE") => "_before",
                    Some(":AFTER") => "_after",
                    Some(":AROUND") => "_around",
                    _ => "_primary",
                };
                let method_id = self.fresh_id();
                let method_name = format!("{}_{}{}", generic_name, method_id, qualifier_suffix);

                // Save current state
                let saved_symbols = self.symbol_table.clone();
                let saved_indent = self.indent_level;
                let saved_output = std::mem::take(&mut self.output);

                // Generate method as a function
                self.indent_level = 1;
                self.writeln(&format!("func.func @\"{}\"() {{", method_name));
                self.indent();

                self.symbol_table.clear();

                // Pop parameters from stack (in reverse order)
                for param in params.iter().rev() {
                    let param_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", param_ssa));
                    self.symbol_table.insert(param.clone(), param_ssa);
                }

                // Compile method body
                let compile_result = if body.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    Ok(())
                } else {
                    let mut result = Ok(());
                    for (i, expr) in body.iter().enumerate() {
                        if let Err(e) = self.compile_expr(expr) {
                            result = Err(e);
                            break;
                        }
                        if i < body.len() - 1 {
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                    result
                };

                if compile_result.is_err() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                self.writeln("func.return");
                self.dedent();
                self.writeln("}");

                // Save method function
                let method_func = std::mem::take(&mut self.output);
                self.pending_functions.push(method_func);

                // Restore state
                self.output = saved_output;
                self.indent_level = saved_indent;
                self.symbol_table = saved_symbols;

                // Register method with generic function
                // Create a string constant with the method function name
                let str_name = format!("@method_name_call_{}", method_id);
                self.pending_string_constants.push((str_name.clone(), method_name.clone()));
                let name_ptr = self.fresh_ssa();
                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, str_name));
                let method_ref = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", method_ref, name_ptr));

                // Build specializers list
                self.writeln("func.call @stack_push_nil() : () -> ()");
                for spec in specializers.iter().rev() {
                    let spec_sym = self.create_symbol_constant(spec);
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", spec_sym));
                    let tail = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", tail));
                    let head = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", head));
                    let cons_cell = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons_cell, tail, head));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", cons_cell));
                }
                let specializers_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", specializers_list));

                // Build qualifier if present
                let qualifier_val = if let Some(q) = &qualifier {
                    let q_sym = self.create_symbol_constant(q);
                    q_sym
                } else {
                    let nil_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                    nil_val
                };

                // Call cc_defmethod or cc_defmethod_qualified
                let name_sym = self.create_symbol_constant(&generic_name);
                let result = self.fresh_ssa();
                if qualifier.is_some() {
                    self.writeln(&format!("{} = func.call @cc_defmethod_qualified({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                        result, name_sym, qualifier_val, specializers_list, method_ref, method_ref));
                } else {
                    self.writeln(&format!("{} = func.call @cc_defmethod({}, {}, {}, {}) : (i64, i64, i64, i64) -> i64",
                        result, name_sym, specializers_list, method_ref, method_ref));
                }
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                return Ok(());
            }

            // ASDF macros that may not be expanded - handle them gracefully
            // These macros should be expanded at macro-expansion time, not compiled as function calls
            "define-convenience-action-methods" => {
                // (define-convenience-action-methods function formals &key ...)
                // This ASDF macro generates defmethod forms. Since the macro isn't expanded,
                // just return nil to avoid evaluating arguments as expressions.
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            // defparameter* - ASDF's version of defparameter with upgrade support
            "defparameter*" => {
                // (defparameter* var value &optional docstring version)
                // Extract the variable name and value, and treat as defparameter
                if args.len() >= 2 {
                    let var_name = match &args[0] {
                        ASTNode::Variable(name) => name.clone(),
                        ASTNode::Constant(ConstantValue::Symbol(name)) => name.clone(),
                        _ => {
                            self.writeln("func.call @stack_push_nil() : () -> ()");
                            return Ok(());
                        }
                    };

                    // Create the symbol
                    let name_sym = self.create_symbol_constant(&var_name);

                    // Evaluate and set the value
                    self.compile_expr(&args[1])?;
                    let value_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", value_ssa));

                    // Set the symbol's value
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                        result, name_sym, value_ssa));

                    // Push the symbol name as result
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", name_sym));
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                return Ok(());
            }

            // defvar* - similar to defparameter*
            "defvar*" => {
                if args.len() >= 2 {
                    let var_name = match &args[0] {
                        ASTNode::Variable(name) => name.clone(),
                        ASTNode::Constant(ConstantValue::Symbol(name)) => name.clone(),
                        _ => {
                            self.writeln("func.call @stack_push_nil() : () -> ()");
                            return Ok(());
                        }
                    };

                    let name_sym = self.create_symbol_constant(&var_name);
                    self.compile_expr(&args[1])?;
                    let value_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", value_ssa));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                        result, name_sym, value_ssa));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", name_sym));
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                return Ok(());
            }

            // Package system directives - these are no-ops at runtime (processed at load time)
            "in-package" | "defpackage" | "use-package" | "export" | "import" |
            "shadow" | "shadowing-import" | "unexport" | "unintern" | "use" => {
                // Package operations are handled at read/load time
                // Just push T to indicate success
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                return Ok(());
            }

            // eval-when - compile/load time directive
            "eval-when" => {
                // For now, just evaluate the body at runtime
                // A proper implementation would check the situation specifiers
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // Skip the situations argument (first arg), evaluate the rest as progn
                for (i, expr) in args[1..].iter().enumerate() {
                    if i > 0 {
                        // Pop previous result
                        let _tmp = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                    }
                    self.compile_expr(expr)?;
                }

                if args.len() == 1 {
                    // Only situations, no body - return nil
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                return Ok(());
            }

            // Common CL macros/special forms that need special handling
            "assert" => {
                // (assert test-form [places] [datum arguments])
                // For JIT, just evaluate the test and ignore if true
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                // Evaluate test form (for side effects), push nil
                self.compile_expr(&args[0])?;
                let _test = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _test));
                // Assert returns nil
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "check-type" => {
                // (check-type place type [string])
                // For JIT, just return nil (type checking is runtime)
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "read-time-eval" => {
                // #. reader macro - the form was already evaluated at read time
                // The result is passed as the argument, just compile it directly
                // (compile_expr will evaluate function calls like (list 1 2 3) to build the result)
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                // Just compile the argument - it will produce the read-time result
                self.compile_expr(&args[0])?;
                return Ok(());
            }

            "declaim" | "proclaim" | "declare" => {
                // Declarations are compile-time hints, ignore at runtime
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "the" => {
                // (the type form) - type assertion, just evaluate form
                if args.len() >= 2 {
                    self.compile_expr(&args[1])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                return Ok(());
            }

            "locally" => {
                // (locally declarations* forms*) - evaluate forms
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                // Skip declarations, evaluate forms
                for (i, expr) in args.iter().enumerate() {
                    // Skip declaration forms
                    if let ASTNode::Call { function, .. } = expr {
                        if let ASTNode::Variable(name) = function.as_ref() {
                            if name == "declare" {
                                continue;
                            }
                        }
                    }
                    if i > 0 {
                        let _tmp = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                    }
                    self.compile_expr(expr)?;
                }
                return Ok(());
            }

            "with-standard-io-syntax" | "with-compilation-unit" => {
                // Execute body with standard IO syntax
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                for (i, expr) in args.iter().enumerate() {
                    if i > 0 {
                        let _tmp = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                    }
                    self.compile_expr(expr)?;
                }
                return Ok(());
            }

            "multiple-value-bind" | "multiple-value-call" | "multiple-value-list" |
            "multiple-value-prog1" | "multiple-value-setq" | "nth-value" | "values" => {
                // Multiple values - for now, just handle first value or nil
                if base_name == "values" {
                    if args.is_empty() {
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    } else {
                        // Return first value
                        self.compile_expr(&args[0])?;
                    }
                } else if base_name == "multiple-value-bind" && args.len() >= 3 {
                    // (multiple-value-bind (vars...) values-form body...)
                    // Save current symbol table
                    let saved_symbols = self.symbol_table.clone();

                    // Extract variable names from the vars list (args[0])
                    let mut var_names: Vec<String> = Vec::new();
                    match &args[0] {
                        ASTNode::Call { function, args: var_list } => {
                            // vars is a list like (var1 var2 var3)
                            if let ASTNode::Variable(first_var) = function.as_ref() {
                                var_names.push(first_var.clone());
                            }
                            for var in var_list {
                                if let ASTNode::Variable(v) = var {
                                    var_names.push(v.clone());
                                }
                            }
                        }
                        ASTNode::Variable(single_var) => {
                            var_names.push(single_var.clone());
                        }
                        ASTNode::Constant(ConstantValue::Nil) => {
                            // No variables to bind
                        }
                        _ => {}
                    }

                    // Evaluate the values-form
                    self.compile_expr(&args[1])?;
                    let first_value = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", first_value));

                    // Bind first variable to the value, rest to NIL
                    // (Since we don't have true multiple values yet, only first gets the actual value)
                    for (i, var_name) in var_names.iter().enumerate() {
                        if i == 0 {
                            self.symbol_table.insert(var_name.clone(), first_value.clone());
                        } else {
                            // Bind to NIL
                            let nil_val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                            self.symbol_table.insert(var_name.clone(), nil_val);
                        }
                    }

                    // Execute body
                    if args.len() > 2 {
                        for (i, expr) in args[2..].iter().enumerate() {
                            if i > 0 {
                                let _tmp = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                            }
                            self.compile_expr(expr)?;
                        }
                    } else {
                        // No body - push NIL
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }

                    // Restore symbol table
                    self.symbol_table = saved_symbols;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                return Ok(());
            }

            "handler-case" | "handler-bind" | "restart-case" | "restart-bind" |
            "with-simple-restart" | "ignore-errors" => {
                // Error handling - for now, just execute the body
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                // Execute first form (the protected form)
                self.compile_expr(&args[0])?;
                return Ok(());
            }

            "unwind-protect" => {
                // (unwind-protect protected-form cleanup-forms...)
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                // Execute protected form
                self.compile_expr(&args[0])?;
                // Execute cleanup forms
                for expr in &args[1..] {
                    let _tmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                    self.compile_expr(expr)?;
                }
                return Ok(());
            }

            // CLOS and type-related forms
            "deftype" | "defsetf" | "define-setf-expander" | "define-symbol-macro" |
            "define-compiler-macro" | "define-modify-macro" | "define-method-combination" => {
                // Definition forms - return the name
                if !args.is_empty() {
                    if let ASTNode::Variable(name) = &args[0] {
                        let name_sym = self.create_symbol_constant(name);
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", name_sym));
                        return Ok(());
                    }
                }
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "class" | "find-class" | "class-of" => {
                // Class-related forms - push nil for now (CLOS support limited)
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "slot-value" | "with-slots" | "with-accessors" => {
                // CLOS slot access - push nil for now
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "reexport-from" | "import-from" | "export-from" => {
                // Package utility macros - no-op, return nil
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "pushnew" | "pop" => {
                if base_name == "pop" {
                    // (pop place) - return car, set place to cdr
                    if args.len() != 1 {
                        anyhow::bail!("pop requires exactly 1 argument (place)");
                    }

                    match &args[0] {
                        // Simple variable place
                        ASTNode::Variable(var) => {
                            let current = if let Some(current_ssa) = self.symbol_table.get(var).cloned() {
                                current_ssa
                            } else {
                                let var_sym = self.create_symbol_constant(var);
                                let current = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", current, var_sym));
                                current
                            };

                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, current));
                            let new_list = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", new_list, current));

                            if self.symbol_table.contains_key(var) {
                                self.symbol_table.insert(var.clone(), new_list.clone());
                            } else {
                                let var_sym = self.create_symbol_constant(var);
                                let _set = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                                    _set, var_sym, new_list));
                            }

                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                            return Ok(());
                        }

                        // Complex place form
                        ASTNode::Call { function, args: place_args } => {
                            if let ASTNode::Variable(func_name) = function.as_ref() {
                                if func_name == "gethash" && place_args.len() >= 2 {
                                    // (pop (gethash key ht))
                                    self.compile_expr(&place_args[0])?;
                                    self.compile_expr(&place_args[1])?;
                                    let table_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", table_ssa));
                                    let key_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key_ssa));

                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    let current = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_gethash({}, {}, {}) : (i64, i64, i64) -> i64",
                                        current, key_ssa, table_ssa, nil_val));

                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, current));
                                    let new_list = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", new_list, current));

                                    let _set = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_puthash({}, {}, {}) : (i64, i64, i64) -> i64",
                                        _set, key_ssa, new_list, table_ssa));

                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                                    return Ok(());
                                }

                                if func_name == "symbol-value" && place_args.len() == 1 {
                                    // (pop (symbol-value sym))
                                    self.compile_expr(&place_args[0])?;
                                    let sym_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", sym_ssa));
                                    let current = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", current, sym_ssa));

                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, current));
                                    let new_list = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", new_list, current));

                                    let _set = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                                        _set, sym_ssa, new_list));

                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                                    return Ok(());
                                }

                                if (func_name == "car" || func_name == "cdr") && place_args.len() == 1 {
                                    // (pop (car cell)) or (pop (cdr cell))
                                    self.compile_expr(&place_args[0])?;
                                    let cons_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons_ssa));
                                    let current = self.fresh_ssa();
                                    let accessor = if func_name == "car" { "@cc_car" } else { "@cc_cdr" };
                                    self.writeln(&format!("{} = func.call {}({}) : (i64) -> i64", current, accessor, cons_ssa));

                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, current));
                                    let new_list = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", new_list, current));

                                    let setter = if func_name == "car" { "@cc_set_car" } else { "@cc_set_cdr" };
                                    let _set = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call {}({}, {}) : (i64, i64) -> i64", _set, setter, cons_ssa, new_list));

                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                                    return Ok(());
                                }

                                // Generic accessor case
                                // Evaluate args for getter
                                for arg in place_args {
                                    self.compile_expr(arg)?;
                                }

                                let mut arg_ssas = Vec::new();
                                for _ in 0..place_args.len() {
                                    let arg = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                                    arg_ssas.push(arg);
                                }
                                arg_ssas.reverse();

                                // Call getter to get current value
                                for arg_ssa in &arg_ssas {
                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", arg_ssa));
                                }
                                let getter_const = self.create_string_constant(func_name);
                                let getter_ptr = self.fresh_ssa();
                                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", getter_ptr, getter_const));
                                let getter_ref = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", getter_ref, getter_ptr));
                                let num_getter_args = place_args.len() as i64;
                                let num_getter_args_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = arith.constant {} : i64", num_getter_args_ssa, num_getter_args));
                                self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", getter_ref, num_getter_args_ssa));

                                let current = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", current));

                                let result = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, current));
                                let new_list = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", new_list, current));

                                // Call setter: (setf (accessor args...) new_list)
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                                for arg_ssa in &arg_ssas {
                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", arg_ssa));
                                }
                                let setf_fn_name = format!("(setf {})", func_name);
                                let setter_const = self.create_string_constant(&setf_fn_name);
                                let setter_ptr = self.fresh_ssa();
                                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", setter_ptr, setter_const));
                                let setter_ref = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", setter_ref, setter_ptr));
                                let num_setter_args = (place_args.len() + 1) as i64;
                                let num_setter_args_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = arith.constant {} : i64", num_setter_args_ssa, num_setter_args));
                                self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", setter_ref, num_setter_args_ssa));

                                // Discard setter result, return popped item
                                let _setter_result = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _setter_result));
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                                return Ok(());
                            }

                            // No accessor function in place - return nil
                            self.writeln("func.call @stack_push_nil() : () -> ()");
                            return Ok(());
                        }

                        _ => {
                            self.writeln("func.call @stack_push_nil() : () -> ()");
                            return Ok(());
                        }
                    }
                }

                // pushnew
                if args.len() < 2 {
                    anyhow::bail!("pushnew requires at least 2 arguments (item place)");
                }

                // Parse keyword arguments in order
                let mut kw_pairs: Vec<(String, ASTNode)> = Vec::new();
                let mut i = 2;
                while i < args.len() {
                    if let ASTNode::Variable(kw) = &args[i] {
                        if i + 1 >= args.len() {
                            anyhow::bail!("pushnew: keyword {} requires a value", kw);
                        }
                        match kw.as_str() {
                            ":test" | ":test-not" | ":key" => {
                                kw_pairs.push((kw.clone(), args[i + 1].clone()));
                                i += 2;
                                continue;
                            }
                            _ => {
                                anyhow::bail!("pushnew: unknown keyword {}", kw);
                            }
                        }
                    }
                    anyhow::bail!("pushnew: unexpected argument");
                }

                // Evaluate item first
                self.compile_expr(&args[0])?;
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));

                match &args[1] {
                    // Simple variable place
                    ASTNode::Variable(var) => {
                        let current = if let Some(current_ssa) = self.symbol_table.get(var).cloned() {
                            current_ssa
                        } else {
                            let var_sym = self.create_symbol_constant(var);
                            let current = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", current, var_sym));
                            current
                        };

                        // Evaluate keyword args now
                        let mut test_val: Option<String> = None;
                        let mut test_not_val: Option<String> = None;
                        let mut key_val: Option<String> = None;
                        for (kw, expr) in &kw_pairs {
                            self.compile_expr(expr)?;
                            let val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                            match kw.as_str() {
                                ":test" => test_val = Some(val),
                                ":test-not" => test_not_val = Some(val),
                                ":key" => key_val = Some(val),
                                _ => {}
                            }
                        }

                        let test = if let Some(v) = test_val {
                            v
                        } else {
                            let nil_val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                            nil_val
                        };
                        let test_not = if let Some(v) = test_not_val {
                            v
                        } else {
                            let nil_val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                            nil_val
                        };
                        let key = if let Some(v) = key_val {
                            v
                        } else {
                            let nil_val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                            nil_val
                        };

                        let new_list = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_pushnew({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                            new_list, item, current, test, test_not, key));

                        if self.symbol_table.contains_key(var) {
                            self.symbol_table.insert(var.clone(), new_list.clone());
                        } else {
                            let var_sym = self.create_symbol_constant(var);
                            let _set = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                                _set, var_sym, new_list));
                        }

                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                        return Ok(());
                    }

                    // Complex place
                    ASTNode::Call { function, args: place_args } => {
                        if let ASTNode::Variable(func_name) = function.as_ref() {
                            if func_name == "gethash" && place_args.len() >= 2 {
                                self.compile_expr(&place_args[0])?;
                                self.compile_expr(&place_args[1])?;
                                let table_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", table_ssa));
                                let key_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key_ssa));

                                let nil_val = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                let current = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_gethash({}, {}, {}) : (i64, i64, i64) -> i64",
                                    current, key_ssa, table_ssa, nil_val));

                                let mut test_val: Option<String> = None;
                                let mut test_not_val: Option<String> = None;
                                let mut key_val: Option<String> = None;
                                for (kw, expr) in &kw_pairs {
                                    self.compile_expr(expr)?;
                                    let val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                                    match kw.as_str() {
                                        ":test" => test_val = Some(val),
                                        ":test-not" => test_not_val = Some(val),
                                        ":key" => key_val = Some(val),
                                        _ => {}
                                    }
                                }

                                let test = if let Some(v) = test_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };
                                let test_not = if let Some(v) = test_not_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };
                                let key = if let Some(v) = key_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };

                                let new_list = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_pushnew({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                                    new_list, item, current, test, test_not, key));

                                let _set = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_puthash({}, {}, {}) : (i64, i64, i64) -> i64",
                                    _set, key_ssa, new_list, table_ssa));

                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                                return Ok(());
                            }

                            if func_name == "symbol-value" && place_args.len() == 1 {
                                self.compile_expr(&place_args[0])?;
                                let sym_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", sym_ssa));

                                let current = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", current, sym_ssa));

                                let mut test_val: Option<String> = None;
                                let mut test_not_val: Option<String> = None;
                                let mut key_val: Option<String> = None;
                                for (kw, expr) in &kw_pairs {
                                    self.compile_expr(expr)?;
                                    let val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                                    match kw.as_str() {
                                        ":test" => test_val = Some(val),
                                        ":test-not" => test_not_val = Some(val),
                                        ":key" => key_val = Some(val),
                                        _ => {}
                                    }
                                }

                                let test = if let Some(v) = test_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };
                                let test_not = if let Some(v) = test_not_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };
                                let key = if let Some(v) = key_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };

                                let new_list = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_pushnew({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                                    new_list, item, current, test, test_not, key));

                                let _set = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                                    _set, sym_ssa, new_list));

                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                                return Ok(());
                            }

                            if (func_name == "car" || func_name == "cdr") && place_args.len() == 1 {
                                self.compile_expr(&place_args[0])?;
                                let cons_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons_ssa));
                                let current = self.fresh_ssa();
                                let accessor = if func_name == "car" { "@cc_car" } else { "@cc_cdr" };
                                self.writeln(&format!("{} = func.call {}({}) : (i64) -> i64", current, accessor, cons_ssa));

                                let mut test_val: Option<String> = None;
                                let mut test_not_val: Option<String> = None;
                                let mut key_val: Option<String> = None;
                                for (kw, expr) in &kw_pairs {
                                    self.compile_expr(expr)?;
                                    let val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                                    match kw.as_str() {
                                        ":test" => test_val = Some(val),
                                        ":test-not" => test_not_val = Some(val),
                                        ":key" => key_val = Some(val),
                                        _ => {}
                                    }
                                }

                                let test = if let Some(v) = test_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };
                                let test_not = if let Some(v) = test_not_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };
                                let key = if let Some(v) = key_val {
                                    v
                                } else {
                                    let nil_val = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                    nil_val
                                };

                                let new_list = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_pushnew({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                                    new_list, item, current, test, test_not, key));

                                let setter = if func_name == "car" { "@cc_set_car" } else { "@cc_set_cdr" };
                                let _set = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call {}({}, {}) : (i64, i64) -> i64",
                                    _set, setter, cons_ssa, new_list));

                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                                return Ok(());
                            }

                            // Generic accessor case
                            for arg in place_args {
                                self.compile_expr(arg)?;
                            }

                            let mut arg_ssas = Vec::new();
                            for _ in 0..place_args.len() {
                                let arg = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                                arg_ssas.push(arg);
                            }
                            arg_ssas.reverse();

                            // Call getter
                            for arg_ssa in &arg_ssas {
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", arg_ssa));
                            }
                            let getter_const = self.create_string_constant(func_name);
                            let getter_ptr = self.fresh_ssa();
                            self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", getter_ptr, getter_const));
                            let getter_ref = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", getter_ref, getter_ptr));
                            let num_getter_args = place_args.len() as i64;
                            let num_getter_args_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = arith.constant {} : i64", num_getter_args_ssa, num_getter_args));
                            self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", getter_ref, num_getter_args_ssa));

                            let current = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", current));

                            let mut test_val: Option<String> = None;
                            let mut test_not_val: Option<String> = None;
                            let mut key_val: Option<String> = None;
                            for (kw, expr) in &kw_pairs {
                                self.compile_expr(expr)?;
                                let val = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                                match kw.as_str() {
                                    ":test" => test_val = Some(val),
                                    ":test-not" => test_not_val = Some(val),
                                    ":key" => key_val = Some(val),
                                    _ => {}
                                }
                            }

                            let test = if let Some(v) = test_val {
                                v
                            } else {
                                let nil_val = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                nil_val
                            };
                            let test_not = if let Some(v) = test_not_val {
                                v
                            } else {
                                let nil_val = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                nil_val
                            };
                            let key = if let Some(v) = key_val {
                                v
                            } else {
                                let nil_val = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                nil_val
                            };

                            let new_list = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_pushnew({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                                new_list, item, current, test, test_not, key));

                            // Call setter: (setf (accessor args...) new_list)
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                            for arg_ssa in &arg_ssas {
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", arg_ssa));
                            }
                            let setf_fn_name = format!("(setf {})", func_name);
                            let setter_const = self.create_string_constant(&setf_fn_name);
                            let setter_ptr = self.fresh_ssa();
                            self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", setter_ptr, setter_const));
                            let setter_ref = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", setter_ref, setter_ptr));
                            let num_setter_args = (place_args.len() + 1) as i64;
                            let num_setter_args_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = arith.constant {} : i64", num_setter_args_ssa, num_setter_args));
                            self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", setter_ref, num_setter_args_ssa));

                            return Ok(());
                        }

                        self.writeln("func.call @stack_push_nil() : () -> ()");
                        return Ok(());
                    }

                    _ => {
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                        return Ok(());
                    }
                }
            }

            "prog1" | "prog2" => {
                // (prog1 first rest...) - evaluate all, return first
                // (prog2 first second rest...) - evaluate all, return second
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                let return_idx = if base_name == "prog1" { 0 } else { 1 };
                for (i, expr) in args.iter().enumerate() {
                    if i > 0 && i != return_idx {
                        let _tmp = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                    }
                    self.compile_expr(expr)?;
                    if i == return_idx && i < args.len() - 1 {
                        // Save the return value
                        let saved = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", saved));
                        // Compile rest
                        for expr in &args[i+1..] {
                            self.compile_expr(expr)?;
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                        // Push saved value
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", saved));
                        return Ok(());
                    }
                }
                return Ok(());
            }

            "etypecase" | "ctypecase" | "ecase" | "ccase" => {
                // Type/case with error on no match - for now just return nil
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "pprint-logical-block" | "pprint-exit-if-list-exhausted" |
            "pprint-newline" | "pprint-indent" | "pprint-tab" | "pprint-fill" |
            "pprint-linear" | "pprint-tabular" | "pprint-pop" => {
                // Pretty printing - just return nil
                self.writeln("func.call @stack_push_nil() : () -> ()");
                return Ok(());
            }

            "flet" | "labels" => {
                if args.is_empty() {
                    // No bindings - just return nil
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                if args.len() == 1 {
                    // Only bindings, no body - treat as implicit nil body
                    // Just compile the bindings (for side effects) and return nil
                    let mut augmented_args = args.to_vec();
                    augmented_args.push(ASTNode::Constant(ConstantValue::Nil));
                    return self.compile_flet_labels(func_name == "labels", &augmented_args);
                }
                return self.compile_flet_labels(func_name == "labels", args);
            }

            "function" => {
                // (function name) or #'name - create function reference
                if args.len() != 1 {
                    anyhow::bail!("function requires exactly 1 argument");
                }

                match &args[0] {
                    ASTNode::Variable(func_name) => {
                        // Create a function reference using the function name as a string
                        let name_const = self.create_string_constant(func_name);
                        let name_ptr = self.fresh_ssa();
                        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, name_const));
                        let func_ref = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ref, name_ptr));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", func_ref));
                    }
                    ASTNode::Lambda { params, defaults: _, supplied_p_vars: _, body } => {
                        // #'(lambda (args) body) - compile as closure
                        // For now, we'll generate a unique function name and compile it
                        let lambda_id = self.function_counter;
                        self.function_counter += 1;
                        let lambda_name = format!("__lambda_{}", lambda_id);

                        // Save current output
                        let saved_output = std::mem::take(&mut self.output);
                        let saved_indent = self.indent_level;
                        self.indent_level = 1;

                        // Compile the lambda as a function
                        let body_expr = if body.len() == 1 {
                            body[0].clone()
                        } else {
                            ASTNode::progn(body.clone())
                        };

                        if let Err(e) = self.compile_function(&lambda_name, params, &body_expr) {
                            eprintln!("[STUB] function: failed to compile lambda: {}", e);
                            self.output = saved_output;
                            self.indent_level = saved_indent;
                            self.writeln("func.call @stack_push_nil() : () -> ()");
                            return Ok(());
                        }

                        // Get the generated function definition and add to pending functions
                        let func_def = std::mem::replace(&mut self.output, saved_output);
                        self.indent_level = saved_indent;
                        self.pending_functions.push(func_def);

                        // Create a reference to the compiled function
                        let name_const = self.create_string_constant(&lambda_name);
                        let name_ptr = self.fresh_ssa();
                        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, name_const));
                        let func_ref = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ref, name_ptr));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", func_ref));
                    }
                    ASTNode::Call { function, args: call_args } => {
                        // Handle #'(setf name)
                        if let ASTNode::Variable(fn_name) = function.as_ref() {
                            if fn_name == "setf" && call_args.len() == 1 {
                                if let ASTNode::Variable(name) = &call_args[0] {
                                    let setf_name = format!("(setf {})", name);
                                    let name_const = self.create_string_constant(&setf_name);
                                    let name_ptr = self.fresh_ssa();
                                    self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, name_const));
                                    let func_ref = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ref, name_ptr));
                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", func_ref));
                                    return Ok(());
                                }
                            }
                            // Handle #'(lambda (args) body) - lambda appearing as a call
                            if fn_name == "lambda" && !call_args.is_empty() {
                                // First arg should be the parameter list, rest is the body
                                let params = self.extract_params_from_ast(&call_args[0])?;
                                let body = if call_args.len() > 1 {
                                    call_args[1..].to_vec()
                                } else {
                                    vec![ASTNode::Constant(ConstantValue::Nil)]
                                };

                                let lambda_id = self.function_counter;
                                self.function_counter += 1;
                                let lambda_name = format!("__lambda_{}", lambda_id);

                                // Save current output
                                let saved_output = std::mem::take(&mut self.output);
                                let saved_indent = self.indent_level;
                                self.indent_level = 1;

                                // Compile the lambda as a function
                                let body_expr = if body.len() == 1 {
                                    body[0].clone()
                                } else {
                                    ASTNode::progn(body)
                                };

                                if let Err(e) = self.compile_function(&lambda_name, &params, &body_expr) {
                                    // Lambda compilation failed - skip with warning
                                    eprintln!("[Warning: Could not compile lambda: {}]", e);
                                    self.output = saved_output;
                                    self.indent_level = saved_indent;
                                    self.writeln("func.call @stack_push_nil() : () -> ()");
                                    return Ok(());
                                }

                                // Get the generated function definition and add to pending functions
                                let func_def = std::mem::replace(&mut self.output, saved_output);
                                self.indent_level = saved_indent;
                                self.pending_functions.push(func_def);

                                // Create a reference to the compiled function
                                let name_const = self.create_string_constant(&lambda_name);
                                let name_ptr = self.fresh_ssa();
                                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, name_const));
                                let func_ref = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ref, name_ptr));
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", func_ref));
                                return Ok(());
                            }
                        }
                        eprintln!("[STUB] function: complex call expression {:?}", args[0]);
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                    _ => {
                        eprintln!("[STUB] function: unsupported argument {:?}", args[0]);
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                }
                return Ok(());
            }

            "funcall" => {
                // (funcall func arg1 arg2 ...) - call function with arguments
                if args.is_empty() {
                    anyhow::bail!("funcall requires at least 1 argument (the function)");
                }

                // Evaluate all arguments except the function and push to stack
                // Arguments should be pushed in forward order
                let num_args = args.len() - 1;  // Exclude the function itself
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                }

                // Evaluate function expression and push to stack
                self.compile_expr(&args[0])?;

                // Pop function reference
                let func_ref = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func_ref));

                // Generate argument count constant
                let num_args_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", num_args_ssa, num_args));

                // Call cc_funcall_stack - it will call the function which pops args and pushes result
                self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", func_ref, num_args_ssa));

                Ok(())
            }

            "+" => {
                if args.is_empty() {
                    // (+) = 0
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed, zero));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", boxed));
                    return Ok(());
                }

                // Evaluate first arg, push to stack
                self.compile_expr(&args[0])?;

                // For each additional arg: evaluate, add to top of stack
                for arg in &args[1..] {
                    self.compile_expr(arg)?;

                    // Pop both operands
                    let right_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                    let left_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                    // Use cc_add which handles type coercion (fixnum, float, bignum, etc.)
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_add({}, {}) : (i64, i64) -> i64", result, left_boxed, right_boxed));

                    // Push result
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            "-" => {
                if args.is_empty() {
                    anyhow::bail!("- requires at least one argument");
                } else if args.len() == 1 {
                    // (- x) = negate = (0 - x)
                    self.compile_expr(&args[0])?;

                    // Pop as pointer
                    let val_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_boxed));

                    // Create boxed zero
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let zero_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", zero_boxed, zero));

                    // Use cc_sub which handles type coercion
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_sub({}, {}) : (i64, i64) -> i64", result, zero_boxed, val_boxed));

                    // Push result
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                    return Ok(());
                }

                // First arg
                self.compile_expr(&args[0])?;

                // Subtract each additional arg
                for arg in &args[1..] {
                    self.compile_expr(arg)?;

                    // Pop both operands
                    let right_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                    let left_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                    // Use cc_sub which handles type coercion (fixnum, float, bignum, etc.)
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_sub({}, {}) : (i64, i64) -> i64", result, left_boxed, right_boxed));

                    // Push result
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            "*" => {
                if args.is_empty() {
                    // (*) = 1
                    let one = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 1 : i64", one));
                    let boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed, one));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", boxed));
                    return Ok(());
                }

                self.compile_expr(&args[0])?;
                for arg in &args[1..] {
                    self.compile_expr(arg)?;

                    // Pop both operands
                    let right_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                    let left_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                    // Use cc_mul which handles type coercion (fixnum, float, bignum, etc.)
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_mul({}, {}) : (i64, i64) -> i64", result, left_boxed, right_boxed));

                    // Push result
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            "/" => {
                if args.is_empty() {
                    anyhow::bail!("/ requires at least one argument");
                } else if args.len() == 1 {
                    // (/ x) = 1/x (reciprocal)
                    self.compile_expr(&args[0])?;

                    // Pop as pointer
                    let val_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_boxed));

                    // Call cc_div with boxed values (1 / val)
                    let one = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 1 : i64", one));
                    let one_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", one_boxed, one));

                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_div({}, {}) : (i64, i64) -> i64", result, one_boxed, val_boxed));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                    return Ok(());
                }

                // First arg
                self.compile_expr(&args[0])?;

                // Divide by each additional arg
                for arg in &args[1..] {
                    self.compile_expr(arg)?;

                    // Pop as pointer
                    let right_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                    let left_boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                    // Call cc_div with boxed values (result is already boxed)
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_div({}, {}) : (i64, i64) -> i64", result, left_boxed, right_boxed));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            // Comparison operators - push boolean (as pointer) to stack
            "<" => {
                if args.len() < 2 {
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    return Ok(());
                }
                self.compile_expr(&args[0])?;
                let mut left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left));

                let mut list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", list));

                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let right = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right));
                    let cmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_lt({}, {}) : (i64, i64) -> i64", cmp, left, right));
                    let cons = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons, cmp, list));
                    list = cons;
                    left = right;
                }

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_and({}) : (i64) -> i64", result, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            ">" => {
                if args.len() < 2 {
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    return Ok(());
                }
                self.compile_expr(&args[0])?;
                let mut left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left));

                let mut list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", list));

                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let right = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right));
                    let cmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_gt({}, {}) : (i64, i64) -> i64", cmp, left, right));
                    let cons = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons, cmp, list));
                    list = cons;
                    left = right;
                }

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_and({}) : (i64) -> i64", result, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "=" => {
                if args.len() < 2 {
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    return Ok(());
                }
                self.compile_expr(&args[0])?;
                let mut left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left));

                let mut list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", list));

                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let right = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right));
                    let cmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_eq({}, {}) : (i64, i64) -> i64", cmp, left, right));
                    let cons = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons, cmp, list));
                    list = cons;
                    left = right;
                }

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_and({}) : (i64) -> i64", result, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "<=" => {
                if args.len() < 2 {
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    return Ok(());
                }
                self.compile_expr(&args[0])?;
                let mut left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left));

                let mut list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", list));

                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let right = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right));
                    let cmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_le({}, {}) : (i64, i64) -> i64", cmp, left, right));
                    let cons = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons, cmp, list));
                    list = cons;
                    left = right;
                }

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_and({}) : (i64) -> i64", result, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            ">=" => {
                if args.len() < 2 {
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    return Ok(());
                }
                self.compile_expr(&args[0])?;
                let mut left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left));

                let mut list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", list));

                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let right = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right));
                    let cmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_ge({}, {}) : (i64, i64) -> i64", cmp, left, right));
                    let cons = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons, cmp, list));
                    list = cons;
                    left = right;
                }

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_and({}) : (i64) -> i64", result, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // List operations
            "cons" => {
                if args.len() != 2 {
                    anyhow::bail!("cons requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                // Pop car and cdr
                let cdr = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr));
                let car = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car));

                // Call cc_cons and push result
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", result, car, cdr));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "car" => {
                if args.len() != 1 {
                    anyhow::bail!("car requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;

                let cons = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, cons));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "cdr" => {
                if args.len() != 1 {
                    anyhow::bail!("cdr requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;

                let cons = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", result, cons));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "sqrt" => {
                if args.len() != 1 {
                    anyhow::bail!("sqrt requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;

                let arg = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_sqrt({}) : (i64) -> i64", result, arg));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Hash table operations
            "make-hash-table" => {
                // (make-hash-table &key test size ...) - for now ignore keyword args
                // Pop any arguments (keywords)
                for arg in args {
                    self.compile_expr(arg)?;
                    let _tmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                }

                let ht = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_hash_table() : () -> i64", ht));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", ht));
                Ok(())
            }

            "gethash" => {
                // (gethash key hash-table &optional default)
                if args.len() < 2 {
                    anyhow::bail!("gethash requires at least 2 arguments");
                }

                // Evaluate key and hash-table
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                // Get default if provided, otherwise nil
                if args.len() >= 3 {
                    self.compile_expr(&args[2])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                // Pop in reverse: default, table, key
                let default = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", default));
                let table = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", table));
                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_gethash({}, {}, {}) : (i64, i64, i64) -> i64",
                    result, key, table, default));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "maphash" => {
                // (maphash function hash-table)
                if args.len() != 2 {
                    anyhow::bail!("maphash requires exactly 2 arguments");
                }

                self.compile_expr(&args[0])?; // function
                self.compile_expr(&args[1])?; // hash-table

                let table = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", table));
                let func = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func));

                // Call cc_maphash_stack which will use stack-based funcall
                self.writeln(&format!("func.call @cc_maphash_stack({}, {}) : (i64, i64) -> ()", func, table));
                // maphash returns nil
                self.writeln("func.call @stack_push_nil() : () -> ()");
                Ok(())
            }

            "reduce" => {
                // (reduce function sequence &key ...) - simplified, ignore keywords
                if args.len() < 2 {
                    anyhow::bail!("reduce requires at least 2 arguments");
                }

                self.compile_expr(&args[0])?; // function
                self.compile_expr(&args[1])?; // sequence

                // Pop extra keyword args if any
                for arg in &args[2..] {
                    self.compile_expr(arg)?;
                    let _tmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                }

                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let func = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_reduce_stack({}, {}) : (i64, i64) -> i64", result, func, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "search" => {
                // (search seq1 seq2 &key :from-end :test :start1 :end1 :start2 :end2)
                // For now, simplified: (search seq1 seq2) -> cc_search(seq1, seq2)
                if args.len() < 2 {
                    anyhow::bail!("search requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?; // seq1
                self.compile_expr(&args[1])?; // seq2
                let seq2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq2));
                let seq1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq1));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_search({}, {}) : (i64, i64) -> i64", result, seq1, seq2));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "length" => {
                // (length sequence)
                if args.is_empty() {
                    anyhow::bail!("length requires 1 argument");
                }
                self.compile_expr(&args[0])?;
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_length({}) : (i64) -> i64", result, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "reverse" | "nreverse" => {
                // (reverse sequence) or (nreverse sequence)
                if args.is_empty() {
                    anyhow::bail!("{} requires 1 argument", func_name);
                }
                self.compile_expr(&args[0])?;
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_reverse({}) : (i64) -> i64", result, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "subseq" => {
                // (subseq sequence start &optional end)
                if args.len() < 2 {
                    anyhow::bail!("subseq requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?; // sequence
                self.compile_expr(&args[1])?; // start
                if args.len() >= 3 {
                    self.compile_expr(&args[2])?; // end
                } else {
                    // end = nil means to end of sequence
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", nil));
                }
                let end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", end));
                let start = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", start));
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_subseq({}, {}, {}) : (i64, i64, i64) -> i64", result, seq, start, end));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "elt" => {
                // (elt sequence index)
                if args.len() < 2 {
                    anyhow::bail!("elt requires 2 arguments");
                }
                self.compile_expr(&args[0])?; // sequence
                self.compile_expr(&args[1])?; // index
                let index = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", index));
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_elt({}, {}) : (i64, i64) -> i64", result, seq, index));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "concatenate" => {
                // (concatenate result-type &rest sequences)
                // We simplify: (concatenate 'list seq1 seq2 ...) builds a combined list
                if args.len() < 2 {
                    anyhow::bail!("concatenate requires at least 2 arguments (type and one sequence)");
                }
                // Compile result-type (typically 'list or 'string)
                self.compile_expr(&args[0])?;
                let result_type = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", result_type));

                // Build a list of all the sequences
                let nil = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil));

                // Compile sequences and build args list
                let mut last_list = nil.clone();
                for seq_arg in args[1..].iter().rev() {
                    self.compile_expr(seq_arg)?;
                    let seq_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq_val));
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, seq_val, last_list));
                    last_list = new_list;
                }

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_concatenate({}, {}) : (i64, i64) -> i64", result, result_type, last_list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "remove-duplicates" | "delete-duplicates" => {
                // (remove-duplicates sequence &key test from-end start end key)
                // Simplified: (remove-duplicates seq) -> cc_remove_duplicates(seq)
                if args.is_empty() {
                    anyhow::bail!("{} requires at least 1 argument", func_name);
                }
                self.compile_expr(&args[0])?;
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_remove_duplicates({}) : (i64) -> i64", result, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "remhash" => {
                // (remhash key hash-table) - remove key from hash table
                if args.len() < 2 {
                    anyhow::bail!("remhash requires 2 arguments");
                }
                self.compile_expr(&args[0])?; // key
                self.compile_expr(&args[1])?; // hash-table
                let ht = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", ht));
                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_remhash({}, {}) : (i64, i64) -> i64", result, key, ht));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "hash-table-keys" => {
                // (hash-table-keys hash-table) - return list of all keys
                if args.is_empty() {
                    anyhow::bail!("hash-table-keys requires 1 argument");
                }
                self.compile_expr(&args[0])?;
                let ht = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", ht));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_hash_table_keys({}) : (i64) -> i64", result, ht));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "hash-table-values" => {
                // (hash-table-values hash-table) - return list of all values
                if args.is_empty() {
                    anyhow::bail!("hash-table-values requires 1 argument");
                }
                self.compile_expr(&args[0])?;
                let ht = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", ht));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_hash_table_values({}) : (i64) -> i64", result, ht));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "read-from-string" => {
                // (read-from-string string) - parse string and return Lisp object
                if args.is_empty() {
                    anyhow::bail!("read-from-string requires 1 argument");
                }

                self.compile_expr(&args[0])?; // string

                let string_obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", string_obj));

                // Build args_and_env as a cons cell (string_obj . nil)
                let nil = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil));
                let args_and_env = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", args_and_env, string_obj, nil));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_read_from_string({}) : (i64) -> i64", result, args_and_env));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "incf" | "decf" => {
                // (incf place &optional delta) or (decf place &optional delta)
                // Expands to: (setf place (+ place delta)) or (setf place (- place delta))
                if args.is_empty() {
                    anyhow::bail!("{} requires at least 1 argument", func_name);
                }

                let place = &args[0];

                // Read current value from place
                self.compile_expr(place)?;
                let current = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", current));

                // Compile delta (default 1)
                if args.len() >= 2 {
                    self.compile_expr(&args[1])?;
                } else {
                    // Default delta = 1
                    let one = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 1 : i64", one));
                    let boxed_one = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed_one, one));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", boxed_one));
                }
                let delta_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", delta_val));

                // Compute new value: current + delta or current - delta
                let result = self.fresh_ssa();
                if func_name == "incf" {
                    self.writeln(&format!("{} = func.call @cc_add({}, {}) : (i64, i64) -> i64", result, current, delta_val));
                } else {
                    self.writeln(&format!("{} = func.call @cc_sub({}, {}) : (i64, i64) -> i64", result, current, delta_val));
                }

                // Now we need to do (setf place result)
                // We'll build a setf call node
                match place {
                    ASTNode::Variable(var) => {
                        // Simple variable case
                        self.symbol_table.insert(var.clone(), result.clone());
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        Ok(())
                    }
                    ASTNode::Call { function, args: place_args } => {
                        // Complex place - delegate to setf logic
                        if let ASTNode::Variable(accessor) = function.as_ref() {
                            match accessor.as_str() {
                                "gethash" => {
                                    // (incf (gethash key table)) -> (setf (gethash key table) (+ (gethash key table) 1))
                                    if place_args.len() < 2 {
                                        anyhow::bail!("{}: gethash requires key and table", func_name);
                                    }

                                    // Evaluate key and table
                                    self.compile_expr(&place_args[0])?; // key
                                    self.compile_expr(&place_args[1])?; // table

                                    let table_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", table_ssa));
                                    let key_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key_ssa));

                                    // Call cc_puthash(key, result, table)
                                    let puthash_result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_puthash({}, {}, {}) : (i64, i64, i64) -> i64",
                                        puthash_result, key_ssa, result, table_ssa));

                                    // Push result
                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", puthash_result));
                                    Ok(())
                                }
                                "aref" => {
                                    // (incf (aref array index))
                                    if place_args.len() < 2 {
                                        anyhow::bail!("{}: aref requires array and index", func_name);
                                    }

                                    self.compile_expr(&place_args[0])?; // array
                                    self.compile_expr(&place_args[1])?; // index

                                    let idx_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", idx_ssa));
                                    let arr_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arr_ssa));

                                    let set_result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_aref({}, {}, {}) : (i64, i64, i64) -> i64",
                                        set_result, arr_ssa, idx_ssa, result));

                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", set_result));
                                    Ok(())
                                }
                                "car" => {
                                    // (incf (car cons))
                                    if place_args.is_empty() {
                                        anyhow::bail!("{}: car requires a cons cell", func_name);
                                    }

                                    self.compile_expr(&place_args[0])?; // cons
                                    let cons_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons_ssa));

                                    let set_result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_car({}, {}) : (i64, i64) -> i64",
                                        set_result, cons_ssa, result));

                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", set_result));
                                    Ok(())
                                }
                                "cdr" => {
                                    // (incf (cdr cons))
                                    if place_args.is_empty() {
                                        anyhow::bail!("{}: cdr requires a cons cell", func_name);
                                    }

                                    self.compile_expr(&place_args[0])?; // cons
                                    let cons_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons_ssa));

                                    let set_result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_cdr({}, {}) : (i64, i64) -> i64",
                                        set_result, cons_ssa, result));

                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", set_result));
                                    Ok(())
                                }
                                accessor_name if accessor_name.starts_with('c') && accessor_name.ends_with('r') && accessor_name.len() >= 4 => {
                                    // (incf (cadr list)) and other c[ad]+ combinations
                                    if place_args.is_empty() {
                                        anyhow::bail!("{}: {} requires an argument", func_name, accessor_name);
                                    }

                                    // Parse accessor (e.g., "cadr" -> ['a', 'd'])
                                    let ops: Vec<char> = accessor_name[1..accessor_name.len()-1].chars().collect();

                                    // Validate all operations are 'a' or 'd'
                                    for &op in &ops {
                                        if op != 'a' && op != 'd' {
                                            anyhow::bail!("{}: invalid accessor character in {}", func_name, accessor_name);
                                        }
                                    }

                                    // Evaluate the list/cons argument
                                    self.compile_expr(&place_args[0])?;
                                    let mut current = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", current));

                                    // Apply all but the last operation to navigate to the cons cell
                                    for &op in &ops[0..ops.len()-1] {
                                        let next = self.fresh_ssa();
                                        match op {
                                            'a' => self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", next, current)),
                                            'd' => self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", next, current)),
                                            _ => unreachable!()
                                        }
                                        current = next;
                                    }

                                    // Apply the final operation as a setter with the computed result
                                    let set_result = self.fresh_ssa();
                                    match ops.last().unwrap() {
                                        'a' => self.writeln(&format!("{} = func.call @cc_set_car({}, {}) : (i64, i64) -> i64", set_result, current, result)),
                                        'd' => self.writeln(&format!("{} = func.call @cc_set_cdr({}, {}) : (i64, i64) -> i64", set_result, current, result)),
                                        _ => unreachable!()
                                    }

                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", set_result));
                                    Ok(())
                                }
                                // Generic accessor: (incf (accessor args...))
                                // Call setter: (setf (accessor args...) result)
                                _ => {
                                    // Push args for setter, then result value
                                    for arg in place_args.iter().rev() {
                                        self.compile_expr(arg)?;
                                    }
                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));

                                    // Create setf function reference
                                    let setf_fn_name = format!("(setf {})", accessor);
                                    let name_const = self.create_string_constant(&setf_fn_name);
                                    let name_ptr = self.fresh_ssa();
                                    self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, name_const));
                                    let func_ref = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ref, name_ptr));

                                    // Call with (value . args)
                                    let num_args = (place_args.len() + 1) as i64;
                                    let num_args_ssa = self.fresh_ssa();
                                    self.writeln(&format!("{} = arith.constant {} : i64", num_args_ssa, num_args));
                                    self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", func_ref, num_args_ssa));
                                    Ok(())
                                }
                            }
                        } else {
                            // Non-variable function - just return the result
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                            Ok(())
                        }
                    }
                    // Fallback for truly unsupported place types - just return result
                    _ => {
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        Ok(())
                    }
                }
            }

            "push" => {
                // (push item place) - simplified to (setf place (cons item place))
                if args.len() != 2 {
                    anyhow::bail!("push requires exactly 2 arguments");
                }

                // Evaluate item first
                self.compile_expr(&args[0])?;
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));

                // For simple variable case: (push item var)
                if let ASTNode::Variable(var) = &args[1] {
                    // Get current list value
                    let current = if let Some(current_ssa) = self.symbol_table.get(var).cloned() {
                        current_ssa
                    } else {
                        let var_sym = self.create_symbol_constant(var);
                        let current = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", current, var_sym));
                        current
                    };

                    // Cons item onto list
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, item, current));

                    // Update variable
                    if self.symbol_table.contains_key(var) {
                        self.symbol_table.insert(var.clone(), new_list.clone());
                    } else {
                        let var_sym = self.create_symbol_constant(var);
                        let _set = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                            _set, var_sym, new_list));
                    }

                    // Push result
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                    Ok(())
                } else if let ASTNode::Call { function, args: place_args } = &args[1] {
                    // Complex place - handle gethash case
                    if let ASTNode::Variable(func_name) = function.as_ref() {
                        if func_name == "gethash" && place_args.len() >= 2 {
                            // (push item (gethash key ht))
                            // = (setf (gethash key ht) (cons item (gethash key ht)))

                            // Evaluate key and table
                            self.compile_expr(&place_args[0])?; // key
                            self.compile_expr(&place_args[1])?; // table

                            // Pop them to save
                            let table_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", table_ssa));
                            let key_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key_ssa));

                            // Get current value from hash table (with nil default)
                            let nil_val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                            let current = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_gethash({}, {}, {}) : (i64, i64, i64) -> i64",
                                current, key_ssa, table_ssa, nil_val));

                            // Cons item onto current list
                            let new_list = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                                new_list, item, current));

                            // Put new list back in hash table
                            let _result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_puthash({}, {}, {}) : (i64, i64, i64) -> i64",
                                _result, key_ssa, new_list, table_ssa));

                            // Push new list as result
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                            return Ok(());
                        }

                        if func_name == "symbol-value" && place_args.len() == 1 {
                            self.compile_expr(&place_args[0])?;
                            let sym_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", sym_ssa));
                            let current = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", current, sym_ssa));

                            let new_list = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, item, current));

                            let _set = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                                _set, sym_ssa, new_list));

                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                            return Ok(());
                        }

                        if (func_name == "car" || func_name == "cdr") && place_args.len() == 1 {
                            self.compile_expr(&place_args[0])?;
                            let cons_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons_ssa));
                            let current = self.fresh_ssa();
                            let accessor = if func_name == "car" { "@cc_car" } else { "@cc_cdr" };
                            self.writeln(&format!("{} = func.call {}({}) : (i64) -> i64", current, accessor, cons_ssa));

                            let new_list = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, item, current));

                            let setter = if func_name == "car" { "@cc_set_car" } else { "@cc_set_cdr" };
                            let _set = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call {}({}, {}) : (i64, i64) -> i64", _set, setter, cons_ssa, new_list));

                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                            return Ok(());
                        }

                        // Generic accessor case: (push item (accessor args...))
                        // = (setf (accessor args...) (cons item (accessor args...)))

                        // Evaluate place args for getter
                        for arg in place_args {
                            self.compile_expr(arg)?;
                        }

                        // Pop args
                        let mut arg_ssas = Vec::new();
                        for _ in 0..place_args.len() {
                            let arg = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                            arg_ssas.push(arg);
                        }
                        arg_ssas.reverse();

                        // Call getter to get current value
                        // Push args back for getter call
                        for arg_ssa in &arg_ssas {
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", arg_ssa));
                        }
                        let getter_const = self.create_string_constant(func_name);
                        let getter_ptr = self.fresh_ssa();
                        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", getter_ptr, getter_const));
                        let getter_ref = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", getter_ref, getter_ptr));
                        let num_getter_args = place_args.len() as i64;
                        let num_getter_args_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", num_getter_args_ssa, num_getter_args));
                        self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", getter_ref, num_getter_args_ssa));

                        // Pop current value
                        let current = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", current));

                        // Cons item onto current
                        let new_list = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, item, current));

                        // Call setter: (setf (accessor args...) new_list)
                        // Push new_list, then args
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                        for arg_ssa in &arg_ssas {
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", arg_ssa));
                        }

                        let setf_fn_name = format!("(setf {})", func_name);
                        let setter_const = self.create_string_constant(&setf_fn_name);
                        let setter_ptr = self.fresh_ssa();
                        self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", setter_ptr, setter_const));
                        let setter_ref = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", setter_ref, setter_ptr));
                        let num_setter_args = (place_args.len() + 1) as i64;
                        let num_setter_args_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", num_setter_args_ssa, num_setter_args));
                        self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", setter_ref, num_setter_args_ssa));

                        return Ok(());
                    }
                    // No accessor function in place - just evaluate and return item
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", item));
                    Ok(())
                } else {
                    // Non-call place - just evaluate and return item
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", item));
                    Ok(())
                }
            }

            "setf" | "setq" => {
                // (setf place value ...) - can have multiple place/value pairs
                // For now, handle single pair
                if args.len() < 2 {
                    anyhow::bail!("setf requires at least 2 arguments (place value)");
                }

                // Process pairs of (place value)
                for chunk in args.chunks(2) {
                    if chunk.len() != 2 {
                        anyhow::bail!("setf requires an even number of arguments");
                    }

                    let place = &chunk[0];
                    let value = &chunk[1];

                    match place {
                        // Simple variable: (setf x value) or (setq x value)
                        ASTNode::Variable(var) => {
                            // Evaluate value
                            self.compile_expr(value)?;
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));

                            // Check if this is a local variable (in symbol table)
                            if self.symbol_table.contains_key(var) {
                                // Update local symbol table
                                self.symbol_table.insert(var.clone(), val_ssa.clone());
                            } else {
                                // Global/special variable - call cc_set_symbol_value
                                let var_sym = self.create_symbol_constant(var);
                                let _result = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                                    _result, var_sym, val_ssa));
                            }

                            // Push value back (setf returns the value)
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", val_ssa));
                        }

                        // Hash table: (setf (gethash key ht) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "gethash") => {
                            if place_args.len() < 2 {
                                anyhow::bail!("setf gethash requires key and table");
                            }

                            // Evaluate key, table, and value
                            self.compile_expr(&place_args[0])?; // key
                            self.compile_expr(&place_args[1])?; // table
                            self.compile_expr(value)?;           // value

                            // Pop in reverse: value, table, key
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let table_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", table_ssa));
                            let key_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key_ssa));

                            // Call cc_puthash
                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_puthash({}, {}, {}) : (i64, i64, i64) -> i64",
                                result, key_ssa, val_ssa, table_ssa));

                            // Push result (setf returns the value)
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // Symbol value: (setf (symbol-value sym) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "symbol-value") => {
                            if place_args.len() != 1 {
                                anyhow::bail!("setf symbol-value requires exactly one argument");
                            }

                            // Evaluate symbol and value
                            self.compile_expr(&place_args[0])?;
                            self.compile_expr(value)?;

                            // Pop in reverse: value, symbol
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let sym_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", sym_ssa));

                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_symbol_value({}, {}) : (i64, i64) -> i64",
                                result, sym_ssa, val_ssa));

                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // Array: (setf (aref array index) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "aref") => {
                            if place_args.len() < 2 {
                                anyhow::bail!("setf aref requires array and index");
                            }

                            // Evaluate array, index, and value
                            self.compile_expr(&place_args[0])?; // array
                            self.compile_expr(&place_args[1])?; // index
                            self.compile_expr(value)?;           // value

                            // Pop in reverse: value, index, array
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let idx_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", idx_ssa));
                            let arr_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arr_ssa));

                            // Call cc_set_aref
                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_aref({}, {}, {}) : (i64, i64, i64) -> i64",
                                result, arr_ssa, idx_ssa, val_ssa));

                            // Push result
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // CAR: (setf (car cons) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "car") => {
                            if place_args.len() != 1 {
                                anyhow::bail!("setf car requires exactly one argument");
                            }

                            // Evaluate cons and value
                            self.compile_expr(&place_args[0])?; // cons
                            self.compile_expr(value)?;           // value

                            // Pop in reverse: value, cons
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let cons_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons_ssa));

                            // Call cc_set_car
                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_car({}, {}) : (i64, i64) -> i64",
                                result, cons_ssa, val_ssa));

                            // Push result
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // CDR: (setf (cdr cons) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "cdr") => {
                            if place_args.len() != 1 {
                                anyhow::bail!("setf cdr requires exactly one argument");
                            }

                            // Evaluate cons and value
                            self.compile_expr(&place_args[0])?; // cons
                            self.compile_expr(value)?;           // value

                            // Pop in reverse: value, cons
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let cons_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cons_ssa));

                            // Call cc_set_cdr
                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_cdr({}, {}) : (i64, i64) -> i64",
                                result, cons_ssa, val_ssa));

                            // Push result
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // CHAR: (setf (char string index) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "char") => {
                            if place_args.len() != 2 {
                                anyhow::bail!("setf char requires string and index");
                            }

                            // Evaluate string, index, and value
                            self.compile_expr(&place_args[0])?; // string
                            self.compile_expr(&place_args[1])?; // index
                            self.compile_expr(value)?;           // value

                            // Pop in reverse: value, index, string
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let idx_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", idx_ssa));
                            let str_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", str_ssa));

                            // Call cc_set_char
                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_char({}, {}, {}) : (i64, i64, i64) -> i64",
                                result, str_ssa, idx_ssa, val_ssa));

                            // Push result
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // CADR and other c[ad]+ combinations: (setf (cadr list) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name.starts_with('c') && name.ends_with('r') && name.len() >= 4) => {
                            if let ASTNode::Variable(accessor_name) = function.as_ref() {
                                if place_args.len() != 1 {
                                    anyhow::bail!("setf {} requires exactly one argument", accessor_name);
                                }

                                // For (setf (cadr x) value), we need to do (setf (car (cdr x)) value)
                                // which is (set-car (cdr x) value)

                                // Parse the accessor (e.g., "cadr" -> ['a', 'd'])
                                // Note: operations are in reverse order - "cadr" means (car (cdr x))
                                let ops: Vec<char> = accessor_name[1..accessor_name.len()-1].chars().collect();

                                if ops.is_empty() || ops.len() > 4 {
                                    anyhow::bail!("setf: unsupported accessor {}", accessor_name);
                                }

                                // Evaluate the list argument
                                self.compile_expr(&place_args[0])?;
                                let mut current = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", current));

                                // Apply operations right-to-left (all but the first) to get to the cons cell
                                // For "cadr" ['a','d'], skip first 'a', then process 'd' in reverse order (which is just 'd')
                                for &op in ops[1..].iter().rev() {
                                    let next = self.fresh_ssa();
                                    match op {
                                        'a' => self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", next, current)),
                                        'd' => self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", next, current)),
                                        _ => anyhow::bail!("Invalid accessor character: {}", op)
                                    }
                                    current = next;
                                }

                                // Evaluate the value to set
                                self.compile_expr(value)?;
                                let val_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));

                                // Apply the first (leftmost) operation as a setter
                                // For "cadr", the first op is 'a', so we do set_car
                                let result = self.fresh_ssa();
                                match ops.first().unwrap() {
                                    'a' => self.writeln(&format!("{} = func.call @cc_set_car({}, {}) : (i64, i64) -> i64", result, current, val_ssa)),
                                    'd' => self.writeln(&format!("{} = func.call @cc_set_cdr({}, {}) : (i64, i64) -> i64", result, current, val_ssa)),
                                    _ => anyhow::bail!("Invalid accessor character")
                                }

                                // Push result
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                            } else {
                                // Unsupported c[ad]+r setf
                                eprintln!("[STUB] setf: unsupported c[ad]+r place");
                                self.compile_expr(value)?;
                                let _discard = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                                self.writeln("func.call @stack_push_nil() : () -> ()");
                            }
                        }

                        // SLOT-VALUE: (setf (slot-value instance slot-name) value)
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "slot-value") => {
                            if place_args.len() != 2 {
                                anyhow::bail!("setf slot-value requires instance and slot-name");
                            }

                            // Evaluate instance, slot-name, and value
                            self.compile_expr(&place_args[0])?; // instance
                            self.compile_expr(&place_args[1])?; // slot-name (usually quoted symbol)
                            self.compile_expr(value)?;           // value

                            // Pop in reverse: value, slot-name, instance
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let slot_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", slot_ssa));
                            let inst_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", inst_ssa));

                            // Call cc_set_slot_value
                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_slot_value({}, {}, {}) : (i64, i64, i64) -> i64",
                                result, inst_ssa, slot_ssa, val_ssa));

                            // Push result (setf returns the value)
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // GET: (setf (get symbol key) value) - symbol property list
                        ASTNode::Call { function, args: place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "get") => {
                            if place_args.len() < 2 {
                                anyhow::bail!("setf get requires symbol and key");
                            }

                            // Evaluate symbol, key, and value
                            self.compile_expr(&place_args[0])?; // symbol
                            self.compile_expr(&place_args[1])?; // key
                            self.compile_expr(value)?;           // value

                            // Pop in reverse: value, key, symbol
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));
                            let key_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key_ssa));
                            let sym_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", sym_ssa));

                            // Call cc_set_symbol_property
                            let result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_set_symbol_property({}, {}, {}) : (i64, i64, i64) -> i64",
                                result, sym_ssa, key_ssa, val_ssa));

                            // Push result (setf returns the value)
                            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                        }

                        // DOCUMENTATION: (setf (documentation obj type) value) - no-op, just return value
                        ASTNode::Call { function, args: _place_args } if matches!(function.as_ref(), ASTNode::Variable(name) if name == "documentation") => {
                            // Documentation is a no-op in this runtime
                            // Just evaluate and return the value
                            self.compile_expr(value)?;
                            // Value is already on stack, nothing more to do
                        }

                        // Generic accessor: (setf (accessor-name args...) value)
                        // Call the corresponding (setf accessor-name) function
                        ASTNode::Call { function, args: place_args } => {
                            if let ASTNode::Variable(accessor_name) = function.as_ref() {
                                // Build setf function name: (setf accessor-name)
                                let setf_fn_name = format!("(setf {})", accessor_name);

                                // Evaluate all place args, then value
                                for arg in place_args {
                                    self.compile_expr(arg)?;
                                }
                                self.compile_expr(value)?;

                                // Pop value
                                let val_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));

                                // Pop place args in reverse order
                                let mut arg_ssas = Vec::new();
                                for _ in 0..place_args.len() {
                                    let arg = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                                    arg_ssas.push(arg);
                                }
                                arg_ssas.reverse();

                                // Push value first, then the args (setf functions take value as first arg after the object)
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", val_ssa));
                                for arg_ssa in &arg_ssas {
                                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", arg_ssa));
                                }

                                // Create function reference and call
                                let name_const = self.create_string_constant(&setf_fn_name);
                                let name_ptr = self.fresh_ssa();
                                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, name_const));
                                let func_ref = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ref, name_ptr));

                                // Call with num_args = place_args + 1 (for value)
                                let num_args = (place_args.len() + 1) as i64;
                                let num_args_ssa = self.fresh_ssa();
                                self.writeln(&format!("{} = arith.constant {} : i64", num_args_ssa, num_args));
                                self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", func_ref, num_args_ssa));
                            } else {
                                // Non-variable function call in place - still fallback
                                self.compile_expr(value)?;
                                let _discard = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                                self.writeln("func.call @stack_push_nil() : () -> ()");
                            }
                        }

                        // Truly unsupported place types
                        _ => {
                            // Evaluate and return value anyway
                            self.compile_expr(value)?;
                        }
                    }
                }

                Ok(())
            }

            // Core predicates - implemented
            "null" => {
                if args.len() != 1 {
                    anyhow::bail!("null requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));

                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));

                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i64", cmp, val, nil_val));

                let result = self.fresh_ssa();
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                self.writeln(&format!("{} = arith.select {}, {}, {} : i64", result, cmp, t_val, nil_val));

                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "atom" => {
                if args.len() != 1 {
                    anyhow::bail!("atom requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));

                // Check if it's a cons (not an atom)
                let is_cons = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_is_cons({}) : (i64) -> i32", is_cons, val));

                // Convert i32 to i1
                let zero_i32 = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i32", zero_i32));
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i32", cmp, is_cons, zero_i32));

                // Select t or nil
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = arith.select {}, {}, {} : i64", result, cmp, t_val, nil_val));

                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // List accessors
            "first" | "car" => {
                if args.len() != 1 {
                    anyhow::bail!("car/first requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "rest" | "cdr" => {
                if args.len() != 1 {
                    anyhow::bail!("cdr/rest requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "cons" => {
                if args.len() != 2 {
                    anyhow::bail!("cons requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let cdr = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr));
                let car = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", result, car, cdr));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "cadr" | "second" => {
                // (cadr x) = (car (cdr x))
                if args.len() != 1 {
                    anyhow::bail!("cadr/second requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let cdr = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr, val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, cdr));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "caddr" | "third" => {
                // (caddr x) = (car (cdr (cdr x)))
                if args.len() != 1 {
                    anyhow::bail!("caddr/third requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let cdr1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr1, val));
                let cdr2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr2, cdr1));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, cdr2));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "cadddr" | "fourth" => {
                // (cadddr x) = (car (cdr (cdr (cdr x))))
                if args.len() != 1 {
                    anyhow::bail!("cadddr/fourth requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let cdr1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr1, val));
                let cdr2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr2, cdr1));
                let cdr3 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr3, cdr2));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, cdr3));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "fifth" => {
                // (fifth x) = (car (cddddr x))
                if args.len() != 1 {
                    anyhow::bail!("fifth requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let cdr1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr1, val));
                let cdr2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr2, cdr1));
                let cdr3 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr3, cdr2));
                let cdr4 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr4, cdr3));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, cdr4));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "nthcdr" => {
                if args.len() != 2 {
                    anyhow::bail!("nthcdr requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?; // n
                self.compile_expr(&args[1])?; // list
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let n = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", n));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nthcdr({}, {}) : (i64, i64) -> i64", result, n, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "last" => {
                if args.len() != 1 {
                    anyhow::bail!("last requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_last({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "butlast" => {
                if args.len() != 1 {
                    anyhow::bail!("butlast requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_butlast({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "length" => {
                if args.len() != 1 {
                    anyhow::bail!("length requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_length({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "append" => {
                // (append) → nil
                // (append list) → list
                // (append list1 list2 ... listN) → append all lists
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // Evaluate first argument
                self.compile_expr(&args[0])?;

                // For each subsequent argument, pop both and append
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let list2 = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list2));
                    let list1 = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list1));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_append({}, {}) : (i64, i64) -> i64", result, list1, list2));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            "reverse" => {
                if args.len() != 1 {
                    anyhow::bail!("reverse requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_reverse({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "nth" => {
                if args.len() != 2 {
                    anyhow::bail!("nth requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let n = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", n));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nth({}, {}) : (i64, i64) -> i64", result, n, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // More predicates
            "consp" => {
                if args.len() != 1 {
                    anyhow::bail!("consp requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let is_cons = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_is_cons({}) : (i64) -> i32", is_cons, val));

                let zero = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i32", zero));
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i32", cmp, is_cons, zero));

                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = arith.select {}, {}, {} : i64", result, cmp, t_val, nil_val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "listp" => {
                if args.len() != 1 {
                    anyhow::bail!("listp requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));

                // A list is either nil or a cons
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                let is_nil = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i64", is_nil, val, nil_val));

                let is_cons = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_is_cons({}) : (i64) -> i32", is_cons, val));
                let zero = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i32", zero));
                let is_cons_bool = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i32", is_cons_bool, is_cons, zero));

                let is_list = self.fresh_ssa();
                self.writeln(&format!("{} = arith.ori {}, {} : i1", is_list, is_nil, is_cons_bool));

                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = arith.select {}, {}, {} : i64", result, is_list, t_val, nil_val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "evenp" => {
                if args.len() != 1 {
                    anyhow::bail!("evenp requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_evenp({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "oddp" => {
                if args.len() != 1 {
                    anyhow::bail!("oddp requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_oddp({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "zerop" => {
                if args.len() != 1 {
                    anyhow::bail!("zerop requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let val_unboxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", val_unboxed, val));
                let zero = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i64", cmp, val_unboxed, zero));
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = arith.select {}, {}, {} : i64", result, cmp, t_val, nil_val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "not" => {
                if args.len() != 1 {
                    anyhow::bail!("not requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                let is_nil = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i64", is_nil, val, nil_val));
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = arith.select {}, {}, {} : i64", result, is_nil, t_val, nil_val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "mapcar" => {
                if args.len() < 2 {
                    anyhow::bail!("mapcar requires at least 2 arguments");
                }
                // (mapcar func list) - apply func to each element
                self.compile_expr(&args[0])?; // function
                self.compile_expr(&args[1])?; // list

                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let func = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func));

                // Call runtime mapcar_stack helper
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_mapcar_stack({}, {}) : (i64, i64) -> i64", result, func, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "mapc" => {
                if args.len() < 2 {
                    anyhow::bail!("mapc requires at least 2 arguments");
                }
                // (mapc func list1 list2 ...) - apply func for side effects, return first list
                self.compile_expr(&args[0])?; // function
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                }

                let mut list_acc = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", list_acc));
                for _ in 0..(args.len() - 1) {
                    let list_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list_val));
                    let cons = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons, list_val, list_acc));
                    list_acc = cons;
                }

                let func = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_mapc_stack({}, {}) : (i64, i64) -> i64", result, func, list_acc));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "eq" => {
                if args.len() != 2 {
                    anyhow::bail!("eq requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let b = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", b));
                let a = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", a));

                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i64", cmp, a, b));

                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = arith.select {}, {}, {} : i64", result, cmp, t_val, nil_val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "eql" => {
                // For now, same as eq (identity comparison)
                if args.len() != 2 {
                    anyhow::bail!("eql requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let b = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", b));
                let a = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", a));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_eq({}, {}) : (i64, i64) -> i64", result, a, b));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "list" => {
                // Build a list from arguments
                self.writeln("func.call @stack_push_nil() : () -> ()");

                for arg in args.iter().rev() {
                    self.compile_expr(arg)?;
                    let elem = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", elem));
                    let tail = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", tail));
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, elem, tail));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                }

                Ok(())
            }

            "make-list" => {
                if args.is_empty() {
                    anyhow::bail!("make-list requires at least 1 argument");
                }

                // Evaluate size
                self.compile_expr(&args[0])?;
                let size = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", size));
                let size_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", size_val, size));

                // Build list of nils
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));

                // Use a simple approach: create list with runtime helper
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_list({}) : (i64) -> i64", result, size));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "nreverse" => {
                if args.len() != 1 {
                    anyhow::bail!("nreverse requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_reverse({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "make-array" => {
                // (make-array size :initial-contents list)
                if args.is_empty() {
                    anyhow::bail!("make-array requires at least a size argument");
                }

                // Evaluate size
                self.compile_expr(&args[0])?;

                // Check for :initial-contents or :initial-element keyword
                let mut contents_idx: Option<usize> = None;
                let mut initial_element_idx: Option<usize> = None;
                for i in (1..args.len()).step_by(2) {
                    if let ASTNode::Variable(kw) = &args[i] {
                        if kw == ":initial-contents" && i + 1 < args.len() {
                            contents_idx = Some(i + 1);
                        } else if kw == ":initial-element" && i + 1 < args.len() {
                            initial_element_idx = Some(i + 1);
                        }
                    }
                }

                if let Some(idx) = contents_idx {
                    // Evaluate initial contents
                    self.compile_expr(&args[idx])?;

                    // Pop contents and size
                    let contents = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", contents));
                    let size = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", size));

                    // Call cc_make_array_with_contents
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_make_array_with_contents({}, {}) : (i64, i64) -> i64", result, size, contents));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                } else if let Some(idx) = initial_element_idx {
                    // Evaluate initial element
                    self.compile_expr(&args[idx])?;

                    // Pop element and size
                    let element = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", element));
                    let size = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", size));

                    // Call cc_make_array_with_initial_element
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_make_array_with_initial_element({}, {}) : (i64, i64) -> i64", result, size, element));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                } else {
                    // Just size, no initial contents
                    let size = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", size));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_make_array({}) : (i64) -> i64", result, size));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            "aref" => {
                // (aref array index)
                if args.len() != 2 {
                    anyhow::bail!("aref requires exactly 2 arguments");
                }

                self.compile_expr(&args[0])?; // array
                self.compile_expr(&args[1])?; // index

                let idx = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", idx));
                let array = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", array));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_aref({}, {}) : (i64, i64) -> i64", result, array, idx));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "copy-seq" => {
                if args.len() != 1 {
                    anyhow::bail!("copy-seq requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_copy_seq({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "make-string" => {
                // (make-string size [:initial-element char])
                if args.is_empty() {
                    anyhow::bail!("make-string requires at least a size argument");
                }

                // Compile size
                self.compile_expr(&args[0])?;
                let size_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", size_ssa));

                // Check for :initial-element keyword
                let mut char_ssa = None;
                let mut i = 1;
                while i < args.len() {
                    if let ASTNode::Variable(kw) = &args[i] {
                        if kw == ":initial-element" && i + 1 < args.len() {
                            // Compile the character value
                            self.compile_expr(&args[i + 1])?;
                            let ch = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", ch));
                            char_ssa = Some(ch);
                            i += 2;
                            continue;
                        }
                    }
                    i += 1;
                }

                // Create the string
                let result = self.fresh_ssa();
                if let Some(ch) = char_ssa {
                    // Use cc_make_string_repeat(size, char)
                    self.writeln(&format!("{} = func.call @cc_make_string_repeat({}, {}) : (i64, i64) -> i64",
                        result, size_ssa, ch));
                } else {
                    // No initial element specified - create with spaces (character code 32)
                    let space = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 32 : i64", space));
                    let boxed_space = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed_space, space));
                    self.writeln(&format!("{} = func.call @cc_make_string_repeat({}, {}) : (i64, i64) -> i64",
                        result, size_ssa, boxed_space));
                }

                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "char" => {
                // (char string index) - read a character from a string
                if args.len() != 2 {
                    anyhow::bail!("char requires exactly 2 arguments");
                }

                self.compile_expr(&args[0])?; // string
                self.compile_expr(&args[1])?; // index

                let idx_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", idx_ssa));
                let str_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", str_ssa));

                // Use cc_aref for character access
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_aref({}, {}) : (i64, i64) -> i64", result, str_ssa, idx_ssa));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "fourth" => {
                if args.len() != 1 {
                    anyhow::bail!("fourth requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));

                let three = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 3 : i64", three));
                let boxed_three = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed_three, three));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nth({}, {}) : (i64, i64) -> i64", result, boxed_three, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "last" => {
                if args.len() != 1 {
                    anyhow::bail!("last requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_last({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "member" => {
                if args.len() < 2 {
                    anyhow::bail!("member requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_member({}, {}) : (i64, i64) -> i64", result, item, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "assoc" => {
                if args.len() < 2 {
                    anyhow::bail!("assoc requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let alist = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", alist));
                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_assoc({}, {}) : (i64, i64) -> i64", result, key, alist));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "print" => {
                debug_println!("DEBUG: Compiling print function");
                if args.len() != 1 {
                    anyhow::bail!("print requires exactly 1 argument");
                }
                debug_println!("DEBUG: Compiling print argument");
                self.compile_expr(&args[0])?;
                debug_println!("DEBUG: Argument compiled");
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_print({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "funcall" => {
                if args.is_empty() {
                    anyhow::bail!("funcall requires at least 1 argument");
                }

                // Evaluate function
                self.compile_expr(&args[0])?;
                let func = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func));

                // Evaluate arguments and push to stack
                let num_args = args.len() - 1;
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                }

                // Generate argument count constant
                let num_args_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", num_args_ssa, num_args));

                // Call function with stack convention
                self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", func, num_args_ssa));
                Ok(())
            }

            "apply" => {
                if args.len() < 2 {
                    anyhow::bail!("apply requires at least 2 arguments");
                }

                // Evaluate function
                self.compile_expr(&args[0])?;
                let func = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func));

                // Last arg is a list of arguments
                // For now, simple version: evaluate all args, last should be a list
                for arg in &args[1..args.len()-1] {
                    self.compile_expr(arg)?;
                }

                // Last arg is the argument list
                self.compile_expr(&args[args.len()-1])?;
                let arg_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg_list));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_apply({}, {}) : (i64, i64) -> i64", result, func, arg_list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "caar" => {
                if args.len() != 1 { anyhow::bail!("caar requires exactly 1 argument"); }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let car1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", car1, val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, car1));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "cdar" => {
                if args.len() != 1 { anyhow::bail!("cdar requires exactly 1 argument"); }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let car1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", car1, val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", result, car1));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "cddr" => {
                if args.len() != 1 { anyhow::bail!("cddr requires exactly 1 argument"); }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let cdr1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr1, val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", result, cdr1));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "when" | "unless" => {
                // (when/unless test body...)
                if args.is_empty() {
                    anyhow::bail!("{} requires at least 1 argument", func_name);
                }

                let is_when = func_name == "when";

                // Evaluate test
                self.compile_expr(&args[0])?;
                let test_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", test_val));

                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                let cond_bool = self.fresh_ssa();
                let cmp_op = if is_when { "ne" } else { "eq" };
                self.writeln(&format!("{} = arith.cmpi {}, {}, {} : i64", cond_bool, cmp_op, test_val, nil_val));

                // Check if we're in a loop and need to return loop-carried variables
                if let Some(ref loop_vars) = self.loop_carried_vars {
                    // Find which loop-carried variables might be modified in the body
                    let mut modified_vars = HashSet::new();
                    for body_expr in &args[1..] {
                        modified_vars.extend(self.find_setq_vars(body_expr));
                    }

                    // Only care about variables that are loop-carried
                    let vars_to_return: Vec<String> = loop_vars.iter()
                        .filter(|v| modified_vars.contains(*v))
                        .cloned()
                        .collect();

                    if !vars_to_return.is_empty() {
                        // Capture current values of variables BEFORE the scf.if
                        let saved_values: Vec<String> = vars_to_return.iter()
                            .map(|v| self.symbol_table.get(v).unwrap().clone())
                            .collect();

                        // scf.if needs to return the potentially modified variables
                        let result_ssa = self.fresh_ssa();
                        let num_results = vars_to_return.len();
                        let type_sig = vec!["i64"; num_results].join(", ");

                        self.writeln(&format!("{}:{} = scf.if {} -> ({}) {{",
                            result_ssa, num_results, cond_bool, type_sig));
                        self.indent();

                        // Then block - execute body
                        for (i, body_expr) in args[1..].iter().enumerate() {
                            self.compile_expr(body_expr)?;
                            if i < args.len() - 2 {
                                let _discard = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                            }
                        }
                        // Discard the result of the last expression
                        let _discard = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));

                        // Yield all vars_to_return (get current values from symbol table after execution)
                        let then_yields: Vec<String> = vars_to_return.iter()
                            .map(|v| self.symbol_table.get(v).unwrap().clone())
                            .collect();
                        self.writeln(&format!("scf.yield {} : {}", then_yields.join(", "), type_sig));

                        self.dedent();
                        self.writeln("} else {");
                        self.indent();

                        // Else block - yield the saved values (unchanged)
                        self.writeln(&format!("scf.yield {} : {}", saved_values.join(", "), type_sig));

                        self.dedent();
                        self.writeln("}");

                        // Update symbol table with returned values
                        for (i, var_name) in vars_to_return.iter().enumerate() {
                            let var_val = if num_results == 1 {
                                result_ssa.clone()
                            } else {
                                format!("{}#{}", result_ssa, i)
                            };
                            self.symbol_table.insert(var_name.clone(), var_val);
                        }

                        // Push nil to stack (when/unless returns nil)
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    } else {
                        // No loop-carried variables modified, use simple scf.if
                        // CRITICAL: Save and restore symbol_table to prevent SSA scoping issues
                        let saved_symbols = self.symbol_table.clone();
                        self.writeln(&format!("scf.if {} {{", cond_bool));
                        self.indent();
                        for (i, body_expr) in args[1..].iter().enumerate() {
                            self.compile_expr(body_expr)?;
                            if i < args.len() - 2 {
                                let _discard = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                            }
                        }
                        self.dedent();
                        self.writeln("}");
                        self.symbol_table = saved_symbols;
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                } else {
                    // Not in a loop, use simple scf.if
                    // CRITICAL: Save and restore symbol_table to prevent SSA scoping issues
                    let saved_symbols = self.symbol_table.clone();
                    self.writeln(&format!("scf.if {} {{", cond_bool));
                    self.indent();
                    for (i, body_expr) in args[1..].iter().enumerate() {
                        self.compile_expr(body_expr)?;
                        if i < args.len() - 2 {
                            let _discard = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                        }
                    }
                    self.dedent();
                    self.writeln("}");
                    self.symbol_table = saved_symbols;
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                Ok(())
            }

            "min" => {
                if args.len() < 2 {
                    anyhow::bail!("min requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let b = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", b));
                    let a = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", a));

                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_min({}, {}) : (i64, i64) -> i64", result, a, b));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            "max" => {
                if args.len() < 2 {
                    anyhow::bail!("max requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let b = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", b));
                    let a = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", a));

                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_max({}, {}) : (i64, i64) -> i64", result, a, b));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            "abs" => {
                if args.len() != 1 {
                    anyhow::bail!("abs requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_abs({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "cond" => {
                // (cond (test1 result1...) (test2 result2...) ...)
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                let cond_id = self.function_counter;
                self.function_counter += 1;

                for (i, clause) in args.iter().enumerate() {
                    match clause {
                        ASTNode::Call { function: _, args: clause_body } if !clause_body.is_empty() => {
                            // Evaluate test
                            self.compile_expr(&clause_body[0])?;
                            let test_val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", test_val));

                            let nil_val = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                            let is_true = self.fresh_ssa();
                            self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", is_true, test_val, nil_val));

                            let then_block = format!("cond_then_{}_{}", cond_id, i);
                            let next_block = if i < args.len() - 1 {
                                format!("cond_next_{}_{}", cond_id, i + 1)
                            } else {
                                format!("cond_end_{}", cond_id)
                            };

                            self.writeln(&format!("cf.cond_br {}, ^{}, ^{}", is_true, then_block, next_block));

                            // Then block
                            self.writeln(&format!("^{}:", then_block));
                            if clause_body.len() > 1 {
                                for (j, expr) in clause_body[1..].iter().enumerate() {
                                    self.compile_expr(expr)?;
                                    if j < clause_body.len() - 2 {
                                        let _discard = self.fresh_ssa();
                                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                                    }
                                }
                            } else {
                                // No body, push test result
                                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", test_val));
                            }
                            self.writeln(&format!("cf.br ^cond_end_{}", cond_id));

                            // Next test block
                            if i < args.len() - 1 {
                                self.writeln(&format!("^{}:", next_block));
                            }
                        }
                        _ => anyhow::bail!("cond clause must be a list"),
                    }
                }

                // End block
                self.writeln(&format!("^cond_end_{}:", cond_id));
                Ok(())
            }

            "typecase" => {
                // (typecase keyform (type1 body1...) (type2 body2...) ... [(otherwise body...)])
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // Evaluate keyform once
                self.compile_expr(&args[0])?;
                let keyform_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", keyform_val));

                let typecase_id = self.function_counter;
                self.function_counter += 1;

                let mut found_otherwise = false;

                // Process each type clause
                for (i, clause) in args[1..].iter().enumerate() {
                    // If we already saw otherwise/t, skip remaining clauses (unreachable)
                    if found_otherwise {
                        continue;
                    }

                    match clause {
                        ASTNode::Call { function: type_node, args: clause_body } => {
                            // The function field is the type specifier, args is the body
                            let type_spec = match type_node.as_ref() {
                                ASTNode::Variable(s) => s.as_str(),
                                _ => "otherwise",
                            };

                            let then_block = format!("typecase_then_{}_{}", typecase_id, i);
                            let next_block = if i < args.len() - 2 && type_spec != "otherwise" && type_spec != "t" {
                                format!("typecase_next_{}_{}", typecase_id, i + 1)
                            } else {
                                format!("typecase_end_{}", typecase_id)
                            };

                            if type_spec == "otherwise" || type_spec == "t" {
                                // Default case - always matches
                                found_otherwise = true;
                                self.writeln(&format!("cf.br ^{}", then_block));
                            } else {
                                // Call the appropriate type predicate
                                let predicate = match type_spec {
                                    "error" => "cc_errorp",
                                    "number" => "cc_numberp",
                                    "integer" => "cc_integerp",
                                    "float" => "cc_floatp",
                                    "rational" => "cc_rationalp",
                                    "complex" => "cc_complexp",
                                    "real" => "cc_realp",
                                    "character" => "cc_characterp",
                                    "string" => "cc_stringp",
                                    "symbol" => "cc_symbolp",
                                    "array" => "cc_arrayp",
                                    "vector" => "cc_vectorp",
                                    "hash-table" => "cc_hash_table_p",
                                    "function" => "cc_functionp",
                                    "null" | "nil" => "cc_null",
                                    "cons" | "list" => "cc_is_cons",
                                    "pathname" => "cc_pathnamep",
                                    "stream" => "cc_streamp",
                                    "package" => "cc_packagep",
                                    _ => {
                                        // Unknown type - use cc_typep runtime check
                                        // Create symbol for the type name using proper string constant
                                        let type_sym = self.create_symbol_constant(type_spec);
                                        let type_result = self.fresh_ssa();
                                        self.writeln(&format!("{} = func.call @cc_typep({}, {}) : (i64, i64) -> i64", type_result, keyform_val, type_sym));
                                        let nil_val = self.fresh_ssa();
                                        self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                        let is_match = self.fresh_ssa();
                                        self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", is_match, type_result, nil_val));
                                        self.writeln(&format!("cf.cond_br {}, ^{}, ^{}", is_match, then_block, next_block));

                                        // Then block - execute body
                                        self.writeln(&format!("^{}:", then_block));
                                        if !clause_body.is_empty() {
                                            for (j, expr) in clause_body.iter().enumerate() {
                                                self.compile_expr(expr)?;
                                                if j < clause_body.len() - 1 {
                                                    let _discard = self.fresh_ssa();
                                                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                                                }
                                            }
                                        } else {
                                            self.writeln("func.call @stack_push_nil() : () -> ()");
                                        }
                                        self.writeln(&format!("cf.br ^typecase_end_{}", typecase_id));

                                        // Next block for continuing type checks
                                        if i < args.len() - 2 {
                                            self.writeln(&format!("^{}:", next_block));
                                        }
                                        continue;
                                    }
                                };

                                let type_result = self.fresh_ssa();
                                if predicate == "cc_is_cons" {
                                    // cc_is_cons returns i32, need to extend to i64
                                    let i32_result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @{}({}) : (i64) -> i32", i32_result, predicate, keyform_val));
                                    self.writeln(&format!("{} = arith.extsi {} : i32 to i64", type_result, i32_result));
                                } else {
                                    self.writeln(&format!("{} = func.call @{}({}) : (i64) -> i64", type_result, predicate, keyform_val));
                                }

                                let nil_val = self.fresh_ssa();
                                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                                let is_match = self.fresh_ssa();
                                self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", is_match, type_result, nil_val));

                                self.writeln(&format!("cf.cond_br {}, ^{}, ^{}", is_match, then_block, next_block));
                            }

                            // Then block - execute body
                            self.writeln(&format!("^{}:", then_block));
                            if !clause_body.is_empty() {
                                for (j, expr) in clause_body.iter().enumerate() {
                                    self.compile_expr(expr)?;
                                    if j < clause_body.len() - 1 {
                                        let _discard = self.fresh_ssa();
                                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                                    }
                                }
                            } else {
                                // No body, push nil
                                self.writeln("func.call @stack_push_nil() : () -> ()");
                            }
                            self.writeln(&format!("cf.br ^typecase_end_{}", typecase_id));

                            // Next test block (only if not otherwise/t and not last clause)
                            if i < args.len() - 2 && type_spec != "otherwise" && type_spec != "t" {
                                self.writeln(&format!("^{}:", next_block));
                            }
                        }
                        _ => anyhow::bail!("typecase clause must be a list"),
                    }
                }

                // End block
                self.writeln(&format!("^typecase_end_{}:", typecase_id));
                Ok(())
            }

            "dotimes" => {
                // (dotimes (var count [result]) body...)
                if args.is_empty() {
                    anyhow::bail!("dotimes requires at least 1 argument");
                }

                let spec = match &args[0] {
                    ASTNode::Call { function: _, args: spec_args } => spec_args,
                    _ => anyhow::bail!("dotimes requires a spec list"),
                };

                if spec.len() < 2 {
                    anyhow::bail!("dotimes spec requires var and count");
                }

                let var = match &spec[0] {
                    ASTNode::Variable(v) => v.clone(),
                    _ => anyhow::bail!("dotimes var must be a variable"),
                };

                // Evaluate count
                self.compile_expr(&spec[1])?;
                let count = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", count));
                let count_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", count_val, count));

                // Initialize counter to 0
                let zero = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                let zero_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", zero_boxed, zero));

                let dotimes_id = self.function_counter;
                self.function_counter += 1;

                // Store in symbol table
                self.symbol_table.insert(var.clone(), zero_boxed.clone());

                self.writeln(&format!("cf.br ^dotimes_header_{}", dotimes_id));
                self.writeln(&format!("^dotimes_header_{}:", dotimes_id));

                // Get current value from symbol table
                let current = self.symbol_table.get(&var).unwrap().clone();
                let current_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", current_val, current));

                // Compare with count
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi slt, {}, {} : i64", cmp, current_val, count_val));

                self.writeln(&format!("cf.cond_br {}, ^dotimes_body_{}, ^dotimes_end_{}", cmp, dotimes_id, dotimes_id));

                // Body
                self.writeln(&format!("^dotimes_body_{}:", dotimes_id));
                for body_expr in &args[1..] {
                    self.compile_expr(body_expr)?;
                    let _discard = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                }

                // Increment
                let one = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 1 : i64", one));
                let next_val = self.fresh_ssa();
                self.writeln(&format!("{} = arith.addi {}, {} : i64", next_val, current_val, one));
                let next_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", next_boxed, next_val));
                self.symbol_table.insert(var.clone(), next_boxed);

                self.writeln(&format!("cf.br ^dotimes_header_{}", dotimes_id));

                // End
                self.writeln(&format!("^dotimes_end_{}:", dotimes_id));

                // Evaluate result form if present
                if spec.len() >= 3 {
                    self.compile_expr(&spec[2])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                Ok(())
            }

            "while" => {
                // (while test body...)
                // Use scf.while with loop-carried variables for proper SSA handling
                if args.is_empty() {
                    anyhow::bail!("while requires at least a test expression");
                }

                // Collect all variables that might be modified in test or body
                // by scanning for setq/setf targets
                let mut modified_vars: Vec<String> = Vec::new();
                fn collect_modified_vars(expr: &ASTNode, vars: &mut Vec<String>) {
                    match expr {
                        // Handle ASTNode::Setq variant (from ASTNode::setq() helper)
                        ASTNode::Setq { var, value } => {
                            if !vars.contains(var) {
                                vars.push(var.clone());
                            }
                            collect_modified_vars(value, vars);
                        }
                        ASTNode::Call { function, args } => {
                            if let ASTNode::Variable(name) = function.as_ref() {
                                if name == "setq" || name == "setf" {
                                    // Collect variable names from place/value pairs
                                    for chunk in args.chunks(2) {
                                        if let Some(ASTNode::Variable(var)) = chunk.first() {
                                            if !vars.contains(var) {
                                                vars.push(var.clone());
                                            }
                                        }
                                    }
                                } else if name == "push" {
                                    // push modifies its second argument
                                    if args.len() >= 2 {
                                        if let ASTNode::Variable(var) = &args[1] {
                                            if !vars.contains(var) {
                                                vars.push(var.clone());
                                            }
                                        }
                                    }
                                } else if name == "incf" || name == "decf" {
                                    // incf/decf modify their first argument
                                    if !args.is_empty() {
                                        if let ASTNode::Variable(var) = &args[0] {
                                            if !vars.contains(var) {
                                                vars.push(var.clone());
                                            }
                                        }
                                    }
                                }
                            }
                            // Recurse into arguments
                            for arg in args {
                                collect_modified_vars(arg, vars);
                            }
                        }
                        ASTNode::If { test, then_branch, else_branch } => {
                            collect_modified_vars(test, vars);
                            collect_modified_vars(then_branch, vars);
                            collect_modified_vars(else_branch, vars);
                        }
                        ASTNode::Progn { exprs } => {
                            for e in exprs {
                                collect_modified_vars(e, vars);
                            }
                        }
                        ASTNode::Let { body, .. } | ASTNode::LetStar { body, .. } => {
                            for e in body {
                                collect_modified_vars(e, vars);
                            }
                        }
                        _ => {}
                    }
                }

                // Scan test and body for modified variables
                collect_modified_vars(&args[0], &mut modified_vars);
                for body_expr in &args[1..] {
                    collect_modified_vars(body_expr, &mut modified_vars);
                }

                // Filter to only include variables in current scope
                let loop_carried_vars: Vec<String> = modified_vars
                    .into_iter()
                    .filter(|v| self.symbol_table.contains_key(v))
                    .collect();

                // Save initial values for loop-carried variables
                let initial_values: Vec<String> = loop_carried_vars
                    .iter()
                    .map(|v| self.symbol_table.get(v).unwrap().clone())
                    .collect();

                // Handle case with no loop-carried variables using scf.while
                // (cf.br doesn't work inside scf regions)
                if loop_carried_vars.is_empty() {
                    // scf.while with no carried values
                    self.writeln("scf.while : () -> () {");
                    self.indent();

                    // Evaluate condition
                    self.compile_expr(&args[0])?;
                    let test_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", test_val));

                    let nil_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                    let cond = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", cond, test_val, nil_val));
                    self.writeln(&format!("scf.condition({})", cond));

                    self.dedent();
                    self.writeln("} do {");
                    self.indent();

                    // Execute body - capture errors to ensure scf.yield is always written
                    for body_expr in &args[1..] {
                        if let Err(_) = self.compile_expr(body_expr) {
                            // On error, continue to ensure loop is closed properly
                        } else {
                            let _discard = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                        }
                    }

                    // Always write scf.yield to close the loop properly
                    self.writeln("scf.yield");
                    self.dedent();
                    self.writeln("}");
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // Use scf.while with loop-carried variables
                let num_vars = loop_carried_vars.len();
                let type_sig = format!("({}) -> ({})",
                    vec!["i64"; num_vars].join(", "),
                    vec!["i64"; num_vars].join(", "));

                let while_results = self.fresh_ssa();
                let initial_args: Vec<String> = (0..num_vars)
                    .map(|i| format!("%arg{} = {}", i, initial_values[i]))
                    .collect();

                self.writeln(&format!("{}:{} = scf.while ({}) : {} {{",
                    while_results, num_vars, initial_args.join(", "), type_sig));
                self.indent();

                // Map loop arg names to symbol table for condition evaluation
                for (i, var) in loop_carried_vars.iter().enumerate() {
                    self.symbol_table.insert(var.clone(), format!("%arg{}", i));
                }

                // Evaluate condition
                self.compile_expr(&args[0])?;
                let test_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", test_val));

                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                let cond = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", cond, test_val, nil_val));

                let condition_args: Vec<String> = (0..num_vars).map(|i| format!("%arg{}", i)).collect();
                self.writeln(&format!("scf.condition({}) {} : {}",
                    cond, condition_args.join(", "), vec!["i64"; num_vars].join(", ")));

                self.dedent();
                self.writeln("} do {");
                self.indent();

                // Generate block args for body
                let block_args: Vec<String> = (0..num_vars)
                    .map(|i| format!("%{}", self.next_ssa_id + i))
                    .collect();
                for _ in 0..num_vars {
                    self.next_ssa_id += 1;
                }

                self.writeln(&format!("^bb0({}):",
                    block_args.iter().enumerate()
                        .map(|(_, arg)| format!("{}: i64", arg))
                        .collect::<Vec<_>>().join(", ")));

                // Bind loop-carried variables
                for (i, var) in loop_carried_vars.iter().enumerate() {
                    self.symbol_table.insert(var.clone(), block_args[i].clone());
                }

                // Set loop context so nested constructs preserve loop-carried variables
                let saved_loop_vars = self.loop_carried_vars.take();
                self.loop_carried_vars = Some(loop_carried_vars.clone());

                // Compile body expressions - capture errors to ensure scf.yield is always written
                for body_expr in args[1..].iter() {
                    if let Err(_) = self.compile_expr(body_expr) {
                        // On error, continue to ensure loop is closed properly
                    } else {
                        let _discard = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                    }
                }

                // Clear loop context
                self.loop_carried_vars = saved_loop_vars;

                // Yield updated values - use block_args as fallback if body failed
                let yield_values: Vec<String> = loop_carried_vars
                    .iter()
                    .enumerate()
                    .map(|(i, v)| self.symbol_table.get(v).unwrap_or(&block_args[i]).clone())
                    .collect();
                self.writeln(&format!("scf.yield {} : {}", yield_values.join(", "), vec!["i64"; num_vars].join(", ")));

                self.dedent();
                self.writeln("}");

                // Update symbol table with final values
                for (i, var) in loop_carried_vars.iter().enumerate() {
                    self.symbol_table.insert(var.clone(), format!("{}#{}", while_results, i));
                }

                // while returns nil
                self.writeln("func.call @stack_push_nil() : () -> ()");
                Ok(())
            }

            "block" => {
                // (block name body...)
                // For now, just evaluate body and ignore the name
                // A full implementation would track return points for return-from
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // Skip the block name (first arg)
                if args.len() == 1 {
                    // Just the name, no body
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // Evaluate body expressions
                for (i, body_expr) in args[1..].iter().enumerate() {
                    self.compile_expr(body_expr)?;
                    // Discard all but last result
                    if i < args.len() - 2 {
                        let _discard = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _discard));
                    }
                }
                Ok(())
            }

            "return" | "return-from" => {
                // (return [value]) or (return-from name [value])
                // For now, just evaluate the value and leave it on stack
                // A proper implementation would need non-local control flow

                // For return, value is the first argument
                // For return-from, skip the block name (first arg), value is second
                let value_idx = if func_name == "return-from" { 1 } else { 0 };

                if args.len() > value_idx {
                    self.compile_expr(&args[value_idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                Ok(())
            }

            "loop" => {
                // Use the interpreter's expand_loop to transform loop into simpler constructs
                // Then compile the expanded form
                let expanded = eval_loop::expand_loop(args);
                self.compile_expr(&expanded)
            }

            // Type predicates
            "numberp" | "integerp" | "floatp" | "rationalp" | "complexp" | "realp" |
            "characterp" | "stringp" | "symbolp" | "keywordp" | "arrayp" | "vectorp" | "hash-table-p" |
            "pathnamep" | "streamp" | "packagep" | "errorp" | "functionp" |
            "plusp" | "minusp" => {
                if args.len() != 1 {
                    anyhow::bail!("{} requires exactly 1 argument", func_name);
                }
                self.compile_expr(&args[0])?;
                let arg = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}) : (i64) -> i64", result, func_name.replace('-', "_"), arg));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "equal" | "equalp" => {
                if args.len() != 2 {
                    anyhow::bail!("{} requires exactly 2 arguments", func_name);
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let arg2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg2));
                let arg1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg1));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}, {}) : (i64, i64) -> i64", result, func_name, arg1, arg2));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Higher-order functions with intrinsics
            "some" => {
                if args.len() < 2 {
                    anyhow::bail!("some requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;  // predicate
                self.compile_expr(&args[1])?;  // list
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_some({}, {}) : (i64, i64) -> i64", result, pred, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "every" => {
                if args.len() < 2 {
                    anyhow::bail!("every requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_every({}, {}) : (i64, i64) -> i64", result, pred, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "find-if" => {
                if args.len() < 2 {
                    anyhow::bail!("find-if requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_find_if({}, {}) : (i64, i64) -> i64", result, pred, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "find-if-not" => {
                if args.len() < 2 {
                    anyhow::bail!("find-if-not requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_find_if_not({}, {}) : (i64, i64) -> i64", result, pred, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "remove-if" => {
                if args.len() < 2 {
                    anyhow::bail!("remove-if requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_remove_if({}, {}) : (i64, i64) -> i64", result, pred, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "remove-if-not" => {
                if args.len() < 2 {
                    anyhow::bail!("remove-if-not requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_remove_if_not({}, {}) : (i64, i64) -> i64", result, pred, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "substitute-if" => {
                if args.len() < 3 {
                    anyhow::bail!("substitute-if requires at least 3 arguments");
                }
                self.compile_expr(&args[0])?;  // new-item
                self.compile_expr(&args[1])?;  // predicate
                self.compile_expr(&args[2])?;  // list
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let new_item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", new_item));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_substitute_if({}, {}, {}) : (i64, i64, i64) -> i64", result, new_item, pred, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "position-if" => {
                if args.len() < 2 {
                    anyhow::bail!("position-if requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let mut start_idx: Option<usize> = None;
                let mut end_idx: Option<usize> = None;
                let mut from_end_idx: Option<usize> = None;
                let mut key_idx: Option<usize> = None;

                let mut i = 2;
                while i + 1 < args.len() {
                    if let ASTNode::Variable(kw) = &args[i] {
                        match kw.as_str() {
                            ":start" => start_idx = Some(i + 1),
                            ":end" => end_idx = Some(i + 1),
                            ":from-end" => from_end_idx = Some(i + 1),
                            ":key" => key_idx = Some(i + 1),
                            _ => {}
                        }
                        i += 2;
                        continue;
                    }
                    break;
                }

                if let Some(idx) = start_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = end_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = from_end_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = key_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let from_end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", from_end));
                let end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", end));
                let start = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", start));
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));

                let result = self.fresh_ssa();
                self.writeln(&format!(
                    "{} = func.call @cc_position_if_full({}, {}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64, i64) -> i64",
                    result, pred, seq, start, end, from_end, key
                ));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "position-if-not" => {
                if args.len() < 2 {
                    anyhow::bail!("position-if-not requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let mut start_idx: Option<usize> = None;
                let mut end_idx: Option<usize> = None;
                let mut from_end_idx: Option<usize> = None;
                let mut key_idx: Option<usize> = None;

                let mut i = 2;
                while i + 1 < args.len() {
                    if let ASTNode::Variable(kw) = &args[i] {
                        match kw.as_str() {
                            ":start" => start_idx = Some(i + 1),
                            ":end" => end_idx = Some(i + 1),
                            ":from-end" => from_end_idx = Some(i + 1),
                            ":key" => key_idx = Some(i + 1),
                            _ => {}
                        }
                        i += 2;
                        continue;
                    }
                    break;
                }

                if let Some(idx) = start_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = end_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = from_end_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = key_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let from_end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", from_end));
                let end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", end));
                let start = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", start));
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));

                let result = self.fresh_ssa();
                self.writeln(&format!(
                    "{} = func.call @cc_position_if_not_full({}, {}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64, i64) -> i64",
                    result, pred, seq, start, end, from_end, key
                ));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "sort" | "stable-sort" => {
                if args.len() < 2 {
                    anyhow::bail!("{} requires at least 2 arguments", func_name);
                }
                self.compile_expr(&args[0])?;  // sequence
                self.compile_expr(&args[1])?;  // predicate
                let pred = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", pred));
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_sort({}, {}) : (i64, i64) -> i64", result, seq, pred));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "nconc" => {
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                if args.len() == 1 {
                    self.compile_expr(&args[0])?;
                    return Ok(());
                }
                // Compile first two args
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list2));
                let list1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list1));
                let mut result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nconc({}, {}) : (i64, i64) -> i64", result, list1, list2));
                // Chain remaining args
                for arg in &args[2..] {
                    self.compile_expr(arg)?;
                    let next = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", next));
                    let new_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nconc({}, {}) : (i64, i64) -> i64", new_result, result, next));
                    result = new_result;
                }
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "acons" => {
                if args.len() != 3 {
                    anyhow::bail!("acons requires exactly 3 arguments");
                }
                self.compile_expr(&args[0])?;  // key
                self.compile_expr(&args[1])?;  // value
                self.compile_expr(&args[2])?;  // alist
                let alist = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", alist));
                let value = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", value));
                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_acons({}, {}, {}) : (i64, i64, i64) -> i64", result, key, value, alist));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "getf" => {
                if args.len() < 2 {
                    anyhow::bail!("getf requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;  // plist
                self.compile_expr(&args[1])?;  // key
                if args.len() > 2 {
                    self.compile_expr(&args[2])?;  // default
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                let default = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", default));
                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let plist = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", plist));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_getf({}, {}, {}) : (i64, i64, i64) -> i64", result, plist, key, default));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "get" => {
                // (get symbol key &optional default)
                // Returns property from symbol's property list
                if args.len() < 2 {
                    anyhow::bail!("get requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;  // symbol
                self.compile_expr(&args[1])?;  // key
                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let sym = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", sym));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_get_symbol_property({}, {}) : (i64, i64) -> i64", result, sym, key));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "clrhash" => {
                if args.len() != 1 {
                    anyhow::bail!("clrhash requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let ht = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", ht));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_clrhash({}) : (i64) -> i64", result, ht));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "map" => {
                // (map result-type function &rest sequences)
                if args.len() < 3 {
                    anyhow::bail!("map requires at least 3 arguments");
                }
                // For now, only support nil result-type (side effects only)
                self.compile_expr(&args[1])?;  // function
                self.compile_expr(&args[2])?;  // first sequence
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let func = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_map_nil({}, {}) : (i64, i64) -> i64", result, func, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Set operations
            "set-difference" => {
                if args.len() < 2 {
                    anyhow::bail!("set-difference requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?;  // list1
                self.compile_expr(&args[1])?;  // list2
                let list2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list2));
                let list1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list1));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_set_difference({}, {}) : (i64, i64) -> i64", result, list1, list2));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Sequence substitution
            "substitute" => {
                if args.len() < 3 {
                    anyhow::bail!("substitute requires at least 3 arguments");
                }
                self.compile_expr(&args[0])?;  // new item
                self.compile_expr(&args[1])?;  // old item
                self.compile_expr(&args[2])?;  // sequence
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let old = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", old));
                let new = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", new));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_substitute({}, {}, {}) : (i64, i64, i64) -> i64", result, new, old, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Remaining stubs for less common functions
            // Note: typep, subtypep, arrayp, vectorp, hash-table-p are implemented later
            "simple-vector-p" | "bit-vector-p" |
            "simple-bit-vector-p" | "simple-string-p" |
            "readtablep" | "compiled-function-p" |
            "hash-table-count" |
            "hash-table-size" | "hash-table-rehash-size" | "hash-table-rehash-threshold" |
            "make-sequence" |
            "count-if" | "count-if-not" |
            "delete-if" | "delete-if-not" | "substitute-if-not" |
            "fill" | "replace" | "merge" |
            "caaar" | "caadr" | "cadar" |
            "cdaar" | "cdadr" | "cddar" | "cdddr" | "caaaar" | "caaadr" | "caadar" | "caaddr" |
            "cadaar" | "cadadr" | "caddar" | "cadddr" | "cdaaar" | "cdaadr" | "cdadar" | "cdaddr" |
            "cddaar" | "cddadr" | "cdddar" | "cddddr" | "fifth" | "sixth" | "seventh" | "eighth" | "ninth" | "tenth" |
            "nthcdr" |
            "revappend" | "nreconc" | "butlast" | "nbutlast" | "ldiff" |
            "rplaca" | "rplacd" | "nsubst" | "nsubst-if" | "nsubst-if-not" | "nsublis" |
            "member-if" | "member-if-not" | "tailp" | "adjoin" | "union" | "nunion" |
            "intersection" | "nintersection" | "nset-difference" |
            "set-exclusive-or" | "nset-exclusive-or" | "subsetp" | "pairlis" |
            "assoc-if" | "assoc-if-not" | "rassoc" | "rassoc-if" | "rassoc-if-not" |
            "get-properties" | "remf" |
            "maplist" | "mapl" | "mapcan" | "mapcon" |
            "map-into" | "notany" | "notevery" => {
                eprintln!("[STUB] {} not yet implemented", func_name);
                self.writeln("func.call @stack_push_nil() : () -> ()");
                Ok(())
            }

            "mod" => {
                if args.len() != 2 {
                    anyhow::bail!("mod requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let divisor = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", divisor));
                let dividend = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", dividend));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_mod({}, {}) : (i64, i64) -> i64", result, dividend, divisor));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "expt" => {
                if args.len() != 2 {
                    anyhow::bail!("expt requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let power = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", power));
                let base = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", base));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_expt({}, {}) : (i64, i64) -> i64", result, base, power));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Rounding functions
            "floor" | "ceiling" | "truncate" | "round" => {
                if args.is_empty() || args.len() > 2 {
                    anyhow::bail!("{} requires 1 or 2 arguments", func_name);
                }
                self.compile_expr(&args[0])?;
                if args.len() == 2 {
                    self.compile_expr(&args[1])?;
                    let divisor = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", divisor));
                    let number = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", number));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_{}_2({}, {}) : (i64, i64) -> i64", result, func_name, number, divisor));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                } else {
                    let number = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", number));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_{}({}) : (i64) -> i64", result, func_name, number));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            // Math with variadic arguments
            "gcd" | "lcm" => {
                if args.is_empty() {
                    // GCD of nothing is 0, LCM of nothing is 1
                    let val = if func_name == "gcd" { 0 } else { 1 };
                    let const_val = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant {} : i64", const_val, val));
                    let boxed = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", boxed, const_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", boxed));
                    return Ok(());
                }

                // Evaluate first argument
                self.compile_expr(&args[0])?;

                // Fold remaining arguments
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                    let arg2 = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg2));
                    let arg1 = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg1));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_{}({}, {}) : (i64, i64) -> i64", result, func_name, arg1, arg2));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            // Single argument math functions
            "sqrt" | "isqrt" | "abs" | "signum" | "numerator" | "denominator" |
            "realpart" | "imagpart" => {
                if args.len() != 1 {
                    anyhow::bail!("{} requires exactly 1 argument", func_name);
                }
                self.compile_expr(&args[0])?;
                let arg = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}) : (i64) -> i64", result, func_name, arg));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Two argument number constructors
            "ratio" | "complex" => {
                if args.len() != 2 {
                    anyhow::bail!("{} requires exactly 2 arguments", func_name);
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let arg2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg2));
                let arg1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg1));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}, {}) : (i64, i64) -> i64", result, func_name, arg1, arg2));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Sequence functions - find, position, remove
            "find" => {
                if args.len() != 2 {
                    anyhow::bail!("find requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?; // item
                self.compile_expr(&args[1])?; // sequence
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_find({}, {}) : (i64, i64) -> i64", result, item, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "position" => {
                if args.len() < 2 {
                    anyhow::bail!("position requires at least 2 arguments");
                }
                self.compile_expr(&args[0])?; // item
                self.compile_expr(&args[1])?; // sequence

                let mut start_idx: Option<usize> = None;
                let mut end_idx: Option<usize> = None;
                let mut from_end_idx: Option<usize> = None;
                let mut test_idx: Option<usize> = None;
                let mut test_not_idx: Option<usize> = None;
                let mut key_idx: Option<usize> = None;

                let mut i = 2;
                while i + 1 < args.len() {
                    if let ASTNode::Variable(kw) = &args[i] {
                        match kw.as_str() {
                            ":start" => start_idx = Some(i + 1),
                            ":end" => end_idx = Some(i + 1),
                            ":from-end" => from_end_idx = Some(i + 1),
                            ":test" => test_idx = Some(i + 1),
                            ":test-not" => test_not_idx = Some(i + 1),
                            ":key" => key_idx = Some(i + 1),
                            _ => {}
                        }
                        i += 2;
                        continue;
                    }
                    break;
                }

                if let Some(idx) = start_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = end_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = from_end_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = test_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = test_not_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                if let Some(idx) = key_idx {
                    self.compile_expr(&args[idx])?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let test_not = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", test_not));
                let test = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", test));
                let from_end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", from_end));
                let end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", end));
                let start = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", start));
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));

                let result = self.fresh_ssa();
                self.writeln(&format!(
                    "{} = func.call @cc_position_full({}, {}, {}, {}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64, i64, i64, i64) -> i64",
                    result, item, seq, start, end, from_end, test, test_not, key
                ));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "remove" | "delete" => {
                // (remove item sequence &key test from-end start end key count)
                // We only use the first two args, ignoring keywords for now
                if args.len() < 2 {
                    anyhow::bail!("{} requires at least 2 arguments", func_name);
                }
                self.compile_expr(&args[0])?; // item
                self.compile_expr(&args[1])?; // sequence
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_remove({}, {}) : (i64, i64) -> i64", result, item, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "subseq" => {
                if args.len() < 2 || args.len() > 3 {
                    anyhow::bail!("subseq requires 2 or 3 arguments");
                }
                self.compile_expr(&args[0])?; // sequence
                self.compile_expr(&args[1])?; // start
                if args.len() == 3 {
                    self.compile_expr(&args[2])?; // end
                } else {
                    // No end - use nil to indicate full sequence
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                let end = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", end));
                let start = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", start));
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_subseq({}, {}, {}) : (i64, i64, i64) -> i64", result, seq, start, end));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // String functions
            "string-upcase" | "string-downcase" | "string-capitalize" => {
                if args.len() != 1 {
                    anyhow::bail!("{} requires exactly 1 argument", func_name);
                }
                self.compile_expr(&args[0])?;
                let arg = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}) : (i64) -> i64", result, func_name.replace('-', "_"), arg));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "concatenate" => {
                if args.len() < 2 {
                    anyhow::bail!("concatenate requires at least 2 arguments");
                }
                // First arg is result type (we'll ignore for now, assume list)
                self.compile_expr(&args[0])?;
                let _type = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _type));

                // Concatenate remaining sequences
                if args.len() == 2 {
                    // Just return the single sequence
                    self.compile_expr(&args[1])?;
                } else {
                    // Concatenate multiple sequences
                    self.compile_expr(&args[1])?;
                    for arg in &args[2..] {
                        self.compile_expr(arg)?;
                        let seq2 = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq2));
                        let seq1 = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq1));
                        let result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_append({}, {}) : (i64, i64) -> i64", result, seq1, seq2));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                    }
                }
                Ok(())
            }

            // More sequence functions - count, member, assoc
            "count" => {
                if args.len() != 2 {
                    anyhow::bail!("count requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?; // item
                self.compile_expr(&args[1])?; // sequence
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_count({}, {}) : (i64, i64) -> i64", result, item, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "member" => {
                if args.len() != 2 {
                    anyhow::bail!("member requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?; // item
                self.compile_expr(&args[1])?; // list
                let list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list));
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_member({}, {}) : (i64, i64) -> i64", result, item, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "assoc" => {
                if args.len() != 2 {
                    anyhow::bail!("assoc requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?; // key
                self.compile_expr(&args[1])?; // alist
                let alist = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", alist));
                let key = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", key));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_assoc({}, {}) : (i64, i64) -> i64", result, key, alist));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Sequence predicates - every, some, notevery, notany (for now, stub implementations)
            "every" | "some" | "notevery" | "notany" => {
                if args.len() < 2 {
                    anyhow::bail!("{} requires at least 2 arguments", func_name);
                }
                // For now, just push nil as a stub
                // Full implementation would require evaluating predicate on each element
                self.writeln("func.call @stack_push_nil() : () -> ()");
                Ok(())
            }

            "string=" | "string-equal" => {
                // String equality - supports keyword args :start1 :end1 :start2 :end2
                if args.len() < 2 {
                    anyhow::bail!("string= requires at least 2 arguments");
                }

                // Compile all arguments (strings + keyword args) into a list
                self.writeln("func.call @stack_push_nil() : () -> ()");
                for arg in args.iter().rev() {
                    self.compile_expr(arg)?;
                    let car = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car));
                    let cdr = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr));
                    let cons_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons_result, car, cdr));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", cons_result));
                }

                let args_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", args_list));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_string_equal_full({}) : (i64) -> i64", result, args_list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Math
            "rem" |
            "sin" | "cos" | "tan" | "asin" | "acos" | "atan" | "sinh" | "cosh" | "tanh" |
            "asinh" | "acosh" | "atanh" | "exp" | "log" | "conjugate" | "phase" |
            "cis" | "complex" | "rational" | "rationalize" | "ratio" |
            "random" | "random-state-p" | "make-random-state" |
            // Assignment and mutation (incf/decf, push, and setf implemented above)
            "psetf" | "psetq" | "shiftf" | "rotatef" |
            "pop" | "pushnew" |
            // Control flow
            "function" | "apply" | "values" | "values-list" | "multiple-value-list" |
            "multiple-value-bind" | "multiple-value-call" | "multiple-value-prog1" | "multiple-value-setq" |
            "catch" | "throw" | "unwind-protect" |
            "tagbody" | "go" | "prog" | "prog*" | "prog1" | "prog2" |
            // Evaluation and compilation stubs (eval handled separately below)
            "compile" | "compile-file" | "load" | "require" | "provide" |
            "constantp" | "macro-function" | "macroexpand" | "macroexpand-1" |
            // Declarations (typically ignored at runtime)
            "declare" | "ignore" | "ignorable" | "type" | "ftype" | "inline" | "notinline" |
            "optimize" | "special" | "dynamic-extent" |
            // Packages
            "in-package" | "use-package" | "unuse-package" | "export" | "unexport" |
            "import" | "shadowing-import" | "shadow" | "find-package" | "find-symbol" |
            "intern" | "unintern" | "make-package" | "delete-package" | "rename-package" |
            "package-name" | "package-nicknames" | "package-use-list" | "package-used-by-list" |
            "package-shadowing-symbols" | "list-all-packages" |
            // Symbols
            "gensym" | "gentemp" | "symbol-name" | "symbol-package" |
            "symbol-function" | "symbol-plist" | "get" | "remprop" | "make-symbol" | "copy-symbol" => {
                // Stub: push NIL for unimplemented functions
                self.writeln("func.call @stack_push_nil() : () -> ()");
                Ok(())
            }

            "symbol-value" => {
                // (symbol-value 'symbol) - get the value of a dynamic/special variable
                if args.len() != 1 {
                    anyhow::bail!("symbol-value requires exactly 1 argument");
                }
                // Compile the symbol argument
                self.compile_expr(&args[0])?;
                let sym_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", sym_ssa));
                // Call cc_symbol_value
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_symbol_value({}) : (i64) -> i64", result, sym_ssa));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Eval - evaluate a form at runtime
            "eval" => {
                if args.len() != 1 {
                    anyhow::bail!("eval requires exactly 1 argument");
                }
                // Compile the argument (the form to evaluate)
                self.compile_expr(&args[0])?;
                let form = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", form));

                // Build args list: (form . nil)
                self.writeln("func.call @stack_push_nil() : () -> ()");
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", nil_val));
                let args_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", args_list, form, nil_val));

                // Call cc_eval with the args list
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_eval({}) : (i64) -> i64", result, args_list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Time functions
            "get-internal-real-time" => {
                // Call runtime function to get current time in internal units
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_get_internal_real_time() : () -> i64", result));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Strings
            "string" | "string/=" | "string<" | "string>" | "string<=" | "string>=" |
            "string-upcase" | "string-downcase" | "string-capitalize" | "nstring-upcase" |
            "nstring-downcase" | "nstring-capitalize" | "string-trim" | "string-left-trim" |
            "string-right-trim" | "schar" | "string-not-equal" |
            "string-lessp" | "string-greaterp" | "string-not-greaterp" | "string-not-lessp" |
            // Characters
            "character" | "char-code" | "char-int" | "code-char" | "char-name" | "name-char" |
            "char=" | "char/=" | "char<" | "char>" | "char<=" | "char>=" |
            "char-equal" | "char-not-equal" | "char-lessp" | "char-greaterp" |
            "char-not-greaterp" | "char-not-lessp" | "char-upcase" | "char-downcase" |
            "upper-case-p" | "lower-case-p" | "both-case-p" | "alpha-char-p" | "alphanumericp" |
            "digit-char" | "digit-char-p" | "graphic-char-p" | "standard-char-p" |
            // I/O
            "get-universal-time" | "get-decoded-time" |
            "encode-universal-time" | "decode-universal-time" | "sleep" |
            "read" | "read-line" | "read-char" | "read-char-no-hang" | "peek-char" | "unread-char" |
            "write" | "write-char" | "write-string" | "write-line" |
            "prin1" | "print" | "pprint" | "princ" | "terpri" | "fresh-line" |
            "with-output-to-string" | "with-input-from-string" |
            "write-to-string" | "prin1-to-string" | "princ-to-string" |
            "listen" | "clear-input" | "clear-output" | "finish-output" | "force-output" |
            "y-or-n-p" | "yes-or-no-p" |
            // Files and pathnames
            "pathname" | "make-pathname" | "pathnamep" | "pathname-host" | "pathname-device" |
            "pathname-directory" | "pathname-name" | "pathname-type" | "pathname-version" |
            "namestring" | "file-namestring" | "directory-namestring" | "host-namestring" |
            "enough-namestring" | "parse-namestring" | "merge-pathnames" |
            "truename" | "probe-file" | "directory" | "ensure-directories-exist" |
            "file-write-date" | "file-author" | "file-length" | "file-position" |
            "rename-file" | "delete-file" |
            // Streams
            "make-string-input-stream" | "make-string-output-stream" | "get-output-stream-string" |
            "make-broadcast-stream" | "make-concatenated-stream" | "make-echo-stream" |
            "make-synonym-stream" | "make-two-way-stream" | "input-stream-p" | "output-stream-p" |
            "stream-element-type" | "open-stream-p" | "interactive-stream-p" |
            "stream-external-format" | "close" | "open" | "with-open-file" |
            // Conditions and errors
            "error" | "cerror" | "warn" | "signal" | "simple-error" | "simple-warning" |
            "division-by-zero" | "floating-point-overflow" | "floating-point-underflow" |
            "arithmetic-error" | "type-error" | "program-error" | "control-error" |
            "package-error" | "stream-error" | "end-of-file" | "file-error" |
            "cell-error" | "unbound-variable" | "undefined-function" | "unbound-slot" |
            "handler-bind" | "ignore-errors" | "restart-case" | "restart-bind" |
            "with-simple-restart" | "invoke-restart" | "find-restart" | "compute-restarts" |
            "restart-name" | "abort" | "continue" | "muffle-warning" | "store-value" | "use-value" |
            // Misc
            "q" | "quote" | "cond" | "case" | "etypecase" | "ctypecase" |
            "identity" | "complement" | "constantly" |
            "special-operator-p" | "trace" | "untrace" | "step" | "time" | "describe" |
            "inspect" | "room" | "ed" | "apropos" | "apropos-list" | "dribble" |
            "documentation" | "disassemble" | "lisp-implementation-type" |
            "lisp-implementation-version" | "short-site-name" | "long-site-name" |
            "machine-instance" | "machine-type" | "machine-version" | "software-type" |
            "software-version" | "user-homedir-pathname" => {
                // Comprehensive stub for Common Lisp functions
                // Evaluate and discard all arguments, then push nil
                for arg in args {
                    self.compile_expr(arg)?;
                    let _tmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                }
                self.writeln("func.call @stack_push_nil() : () -> ()");
                Ok(())
            }

            "fboundp" | "boundp" | "functionp" => {
                // Introspection functions - check if a symbol is bound as a function/variable
                if args.len() != 1 {
                    anyhow::bail!("{} requires exactly 1 argument", func_name);
                }
                // Evaluate the argument
                self.compile_expr(&args[0])?;
                let arg = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", arg));
                // Call the introspection function
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}) : (i64) -> i64", result, func_name, arg));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Condition types and error handling - just return nil for now
            "error" | "warn" | "division-by-zero" | "type-error" | "simple-error" |
            "unbound-variable" | "undefined-function" | "arithmetic-error" |
            "handler-bind" | "ignore-errors" => {
                // These are condition constructors/signaling functions
                // For now, just consume arguments and push nil
                for arg in args {
                    self.compile_expr(arg)?;
                    let _tmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                }
                self.writeln("func.call @stack_push_nil() : () -> ()");
                Ok(())
            }

            "handler-case" => {
                // Simplified handler-case: evaluate protected form, if NIL run handler
                // (handler-case protected-form (condition-type (var) handler-body...))
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }

                // Evaluate the protected form
                self.compile_expr(&args[0])?;

                // Get the result
                let protected_result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", protected_result));

                // Check if result is NIL (indicates error)
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));

                let is_nil = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i64", is_nil, protected_result, nil_val));

                // CRITICAL: Save symbol_table before scf.if
                let saved_symbols = self.symbol_table.clone();

                // If NIL, run handler; otherwise return result
                self.writeln(&format!("scf.if {} {{", is_nil));
                self.indent();

                // Handler case: evaluate handler body
                if args.len() > 1 {
                    // args[1] is (condition-type (var) handler-body...)
                    if let ASTNode::Call { function: _, args: handler_args } = &args[1] {
                        // handler_args[0] is (var), handler_args[1..] is handler body
                        // For simplicity, just evaluate the last handler expression
                        if handler_args.len() > 1 {
                            self.compile_expr(&handler_args[handler_args.len() - 1])?;
                        } else {
                            self.writeln("func.call @stack_push_nil() : () -> ()");
                        }
                    } else {
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                self.dedent();
                self.writeln("} else {");
                self.indent();
                // Restore before else branch
                self.symbol_table = saved_symbols.clone();

                // Normal case: return protected result
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", protected_result));

                self.dedent();
                self.writeln("}");

                // Restore after scf.if
                self.symbol_table = saved_symbols;

                Ok(())
            }

            "and" | "or" => {
                // Logical operators
                if args.is_empty() {
                    // (and) => t, (or) => nil
                    if func_name == "and" {
                        let t_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    } else {
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                    return Ok(());
                }

                // Use cc_and/cc_or runtime functions that handle short-circuiting
                // Build arguments into a list
                let nil = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil));
                let mut list = nil;

                // Build list in reverse order
                for arg in args.iter().rev() {
                    self.compile_expr(arg)?;
                    let val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, val, list));
                    list = new_list;
                }

                // Call cc_and or cc_or with the list
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}) : (i64) -> i64", result, func_name, list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "list" => {
                // Build list from right to left, starting with nil
                self.writeln("func.call @stack_push_nil() : () -> ()");

                for arg in args.iter().rev() {
                    self.compile_expr(arg)?;

                    // Pop car and cdr
                    let car = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car));
                    let cdr = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr));

                    // Cons them
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", result, car, cdr));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                }
                Ok(())
            }

            // Print
            "print" => {
                if args.len() != 1 {
                    anyhow::bail!("print requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;

                let val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_print({}) : (i64) -> i64", result, val));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Format (variadic)
            "format" => {
                if args.len() < 2 {
                    anyhow::bail!("format requires at least 2 arguments");
                }

                // Evaluate destination
                self.compile_expr(&args[0])?;

                // Build list of control string + remaining args
                // Start with nil
                self.writeln("func.call @stack_push_nil() : () -> ()");

                for arg in args[1..].iter().rev() {
                    self.compile_expr(arg)?;

                    let car = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car));
                    let cdr = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr));

                    let cons_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons_result, car, cdr));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", cons_result));
                }

                // Now we have args list on stack, pop it and destination
                let args_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", args_list));
                let dest = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", dest));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_format({}, {}) : (i64, i64) -> i64", result, dest, args_list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // CLOS operations
            "make-instance" => {
                if args.len() < 1 {
                    anyhow::bail!("make-instance requires at least 1 argument (class name)");
                }

                // Evaluate class name
                self.compile_expr(&args[0])?;

                // Build initargs list from remaining args
                self.writeln("func.call @stack_push_nil() : () -> ()");

                for arg in args[1..].iter().rev() {
                    self.compile_expr(arg)?;

                    let car = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", car));
                    let cdr = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cdr));

                    let cons_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", cons_result, car, cdr));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", cons_result));
                }

                // Pop initargs and class name
                let initargs = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", initargs));
                let class_name = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", class_name));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_instance({}, {}) : (i64, i64) -> i64", result, class_name, initargs));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "slot-value" => {
                if args.len() != 2 {
                    anyhow::bail!("slot-value requires exactly 2 arguments");
                }

                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                let slot_name = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", slot_name));
                let instance = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", instance));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_slot_value({}, {}) : (i64, i64) -> i64", result, instance, slot_name));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // MOP Introspection functions
            "find-class" => {
                if args.len() != 1 {
                    anyhow::bail!("find-class requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let class_name = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", class_name));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_find_class({}) : (i64) -> i64", result, class_name));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "class-of" => {
                if args.len() != 1 {
                    anyhow::bail!("class-of requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", obj));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_class_of({}) : (i64) -> i64", result, obj));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "class-name" => {
                if args.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                    return Ok(());
                }
                self.compile_expr(&args[0])?;
                let class = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", class));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_class_name({}) : (i64) -> i64", result, class));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "class-slots" => {
                if args.len() != 1 {
                    anyhow::bail!("class-slots requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let class = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", class));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_class_slots({}) : (i64) -> i64", result, class));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "class-direct-slots" => {
                if args.len() != 1 {
                    anyhow::bail!("class-direct-slots requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let class = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", class));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_class_direct_slots({}) : (i64) -> i64", result, class));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "class-direct-superclasses" => {
                if args.len() != 1 {
                    anyhow::bail!("class-direct-superclasses requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let class = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", class));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_class_direct_superclasses({}) : (i64) -> i64", result, class));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "class-precedence-list" => {
                if args.len() != 1 {
                    anyhow::bail!("class-precedence-list requires exactly 1 argument");
                }
                self.compile_expr(&args[0])?;
                let class = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", class));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_class_precedence_list({}) : (i64) -> i64", result, class));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "typep" => {
                if args.len() != 2 {
                    anyhow::bail!("typep requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let type_name = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", type_name));
                let obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", obj));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_typep({}, {}) : (i64, i64) -> i64", result, obj, type_name));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "subtypep" => {
                if args.len() != 2 {
                    anyhow::bail!("subtypep requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let type2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", type2));
                let type1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", type1));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_subtypep({}, {}) : (i64, i64) -> i64", result, type1, type2));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            // Method combination support
            "call-next-method" => {
                // call-next-method with no arguments uses original args
                let result = self.fresh_ssa();
                if args.is_empty() {
                    self.writeln(&format!("{} = func.call @cc_call_next_method() : () -> i64", result));
                } else {
                    // call-next-method with new arguments
                    // First collect the new arguments into a list
                    for arg in args {
                        self.compile_expr(arg)?;
                    }
                    let argc = args.len();
                    let argc_ssa = self.fresh_ssa();
                    let tagged_argc = (argc as i64) << 2;
                    self.writeln(&format!("{} = arith.constant {} : i64", argc_ssa, tagged_argc));
                    let new_args = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_collect_args({}) : (i64) -> i64", new_args, argc_ssa));
                    self.writeln(&format!("{} = func.call @cc_call_next_method_with_args({}) : (i64) -> i64", result, new_args));
                }
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "next-method-p" => {
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_next_method_p() : () -> i64", result));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            _ => self.compile_user_function_call(base_name, args),
        }
    }

    fn compile_user_function_call(&mut self, base_name: &str, args: &[ASTNode]) -> Result<()> {
        // User-defined function call
        // base_name already has package qualifier stripped from the beginning of compile_call

        // Check if this is a local function (from flet/labels)
        let is_local_function = self.local_function_map.contains_key(base_name);
        let actual_func_name = self.local_function_map
            .get(base_name)
            .cloned()
            .unwrap_or_else(|| base_name.to_string());

        // Check if this is a generic function - use runtime dispatch
        if self.generic_functions.contains(&actual_func_name) {
            // Push all arguments to stack
            let num_args = args.len();
            for arg in args {
                self.compile_expr(arg)?;
            }

            // Create the generic function name symbol
            let gf_name_sym = self.create_symbol_constant(&actual_func_name);

            // Generate argument count constant
            let num_args_ssa = self.fresh_ssa();
            self.writeln(&format!("{} = arith.constant {} : i64", num_args_ssa, num_args));

            // Call cc_funcall_stack with the generic function name
            // It will pop args from stack, dispatch to the correct method, and push result
            self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", gf_name_sym, num_args_ssa));
            return Ok(());
        }

        // Track the effective number of arguments on stack for cleanup
        let effective_num_args;

        // Check if the function has special parameters
        if self.special_param_functions.contains(&actual_func_name) {
            // Collect arguments into a list for cc_arg extraction
            // Push all arguments to stack first
            for arg in args {
                self.compile_expr(arg)?;
            }

            // Create a list from the arguments on the stack
            let argc = args.len();
            let argc_ssa = self.fresh_ssa();
            let tagged_argc = (argc as i64) << 2;  // Tag as fixnum
            self.writeln(&format!("{} = arith.constant {} : i64", argc_ssa, tagged_argc));

            let args_list = self.fresh_ssa();
            self.writeln(&format!("{} = func.call @cc_collect_args({}) : (i64) -> i64", args_list, argc_ssa));

            // Push the args list to stack
            self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", args_list));
            effective_num_args = 1;  // Single list argument on stack
        } else {
            // Simple case: push all arguments to stack
            for arg in args {
                self.compile_expr(arg)?;
            }
            effective_num_args = args.len();
        }

        if is_local_function || self.compiled_functions.contains(&actual_func_name) {
            // Local functions (from flet/labels) or defun-compiled functions
            // are defined in this module - call them directly with func.call
            self.writeln(&format!("func.call @\"{}\"() : () -> ()", actual_func_name));
        } else {
            // Use cc_funcall_stack for dynamic dispatch to user-defined functions
            // This handles functions that are defined at runtime or in other modules
            let func_sym = self.create_symbol_constant(&actual_func_name);

            // Generate argument count constant for stack cleanup if function not found
            let num_args_ssa = self.fresh_ssa();
            self.writeln(&format!("{} = arith.constant {} : i64", num_args_ssa, effective_num_args));

            self.writeln(&format!("func.call @cc_funcall_stack({}, {}) : (i64, i64) -> ()", func_sym, num_args_ssa));
        }
        Ok(())
    }

    /// Emit a direct call to an internal function (no stack args, void return)
    /// Used for batch execution of __main_batch_N functions
    pub fn emit_internal_call(&mut self, fn_name: &str) {
        self.writeln(&format!("func.call @\"{}\"() : () -> ()", fn_name));
    }

    /// Mark a function as compiled so it can be called directly
    pub fn mark_function_compiled(&mut self, name: &str) {
        self.compiled_functions.insert(name.to_string());
    }

    /// Compile __main that calls a sequence of batch functions directly
    /// Each batch function has already been compiled with compile_function
    pub fn compile_main_with_batches(&mut self, batch_names: &[String]) -> Result<()> {
        self.writeln("func.func @\"__main\"() {");
        self.indent();

        // Simple __main without tracing - just call batches
        for name in batch_names.iter() {
            self.emit_internal_call(name);
        }

        // Push nil as the final result (standard for void-returning functions)
        self.writeln("func.call @stack_push_nil() : () -> ()");
        self.writeln("func.return");
        self.dedent();
        self.writeln("}");

        self.compiled_functions.insert("__main".to_string());
        Ok(())
    }

    /// Compile a function definition - stack-based convention
    /// Fixed-arity functions take no parameters, access args from stack
    pub fn compile_function(&mut self, name: &str, params: &[String], body: &ASTNode) -> Result<()> {
        // Skip if already compiled (prevent duplicates)
        if self.compiled_functions.contains(name) {
            return Ok(());
        }
        // Note: We add to compiled_functions at the END of this function, only on success

        // Check if this function has special parameters (&optional, &key, &rest)
        // Only lambda-list keywords starting with & trigger the cc_arg calling convention
        let has_special_params = params.iter().any(|p| p.starts_with('&'));

        // Track functions with special parameters for call site handling
        if has_special_params {
            self.special_param_functions.insert(name.to_string());
        }

        // Generate function - stack-based calling convention, no SSA parameters/results
        // Quote function name to handle special characters like dashes
        self.writeln(&format!("func.func @\"{}\"() {{", name));
        self.indent();

        // Save and clear symbol table for this function scope
        let saved_symbols = self.symbol_table.clone();
        self.symbol_table.clear();

        if has_special_params {
            // For functions with &optional, &key, or supplied-p parameters:
            // Pop the args list from stack and use cc_arg to extract parameters
            let args_list = self.fresh_ssa();
            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", args_list));

            // Track which mode we're in
            let mut mode = "required"; // can be "required", "optional", "rest", or "key"
            let mut param_index = 0; // For positional parameters

            // Extract each parameter using cc_arg(args_list, param_info)
            for param in params.iter() {
                // Check for &optional, &rest, &key, or &allow-other-keys markers
                if param == "&optional" {
                    mode = "optional";
                    continue;
                } else if param == "&rest" {
                    mode = "rest";
                    continue;
                } else if param == "&key" {
                    mode = "key";
                    continue;
                } else if param == "&allow-other-keys" {
                    // Just a marker, no variable binding
                    continue;
                }
                // Note: Don't skip parameters ending in "-p" - these are valid param names
                // (e.g., call-now-p, null-p). Supplied-p vars like (x nil x-supplied-p)
                // are handled separately in the param extraction from AST.

                let arg_val = self.fresh_ssa();

                if mode == "rest" {
                    // For &rest parameter, collect all remaining args into a list
                    // Use cc_collect_rest_args(args_list, start_index)
                    let idx_raw = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant {} : i64", idx_raw, param_index));
                    let idx = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", idx, idx_raw));
                    self.writeln(&format!("{} = func.call @cc_collect_rest_args({}, {}) : (i64, i64) -> i64", arg_val, args_list, idx));
                    self.symbol_table.insert(param.clone(), arg_val);
                    // Don't increment param_index after rest - rest consumes all remaining positional args
                } else if mode == "key" {
                    // For keyword parameters, pass the parameter name as a symbol
                    let param_sym = self.create_symbol_constant(param);
                    self.writeln(&format!("{} = func.call @cc_arg({}, {}) : (i64, i64) -> i64", arg_val, args_list, param_sym));
                    self.symbol_table.insert(param.clone(), arg_val);
                } else {
                    // For required and optional parameters, pass the positional index
                    let idx = self.fresh_ssa();
                    let tagged_idx = (param_index as i64) << 2;  // Tag the index like other fixnums
                    self.writeln(&format!("{} = arith.constant {} : i64", idx, tagged_idx));
                    self.writeln(&format!("{} = func.call @cc_arg({}, {}) : (i64, i64) -> i64", arg_val, args_list, idx));
                    param_index += 1;
                    self.symbol_table.insert(param.clone(), arg_val);
                }
            }
        } else {
            // Simple case: fixed-arity function, pop parameters directly from stack
            // Pop parameters from stack into local SSA values (in reverse order)
            // Caller pushes args in order, so we pop in reverse to get them correctly
            for param in params.iter().rev() {
                let ssa_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", ssa_val));
                self.symbol_table.insert(param.clone(), ssa_val);
            }
        }

        // Compile function body - catch errors to ensure proper cleanup
        debug_println!("COMPILE_FUNCTION_DEBUG: name={}", name);
        let compile_result = self.compile_expr(body);

        // Always restore symbol table and close function properly
        self.symbol_table = saved_symbols;

        // If compilation failed, write a stub body
        if compile_result.is_err() {
            self.writeln("func.call @stack_push_nil() : () -> ()");
        }

        // Result is on stack, function returns nothing
        self.writeln("func.return");

        self.dedent();
        self.writeln("}");

        // Return the original error if there was one
        compile_result?;

        // Only mark as compiled if successful
        self.compiled_functions.insert(name.to_string());
        Ok(())
    }

    /// Compile flet or labels local function definitions
    /// Generates local functions as module-level functions with unique names
    fn compile_flet_labels(&mut self, is_labels: bool, args: &[ASTNode]) -> Result<()> {
        // Extract function definitions from args[0]
        // For multiple definitions: ((f1 (params) body) (f2 (params) body) ...)
        // The AST structure is: Call { function: first_def, args: [second_def, third_def, ...] }
        let mut func_defs_nodes = Vec::new();

        if let ASTNode::Call { function: first_def, args: rest_defs } = &args[0] {
            // First function definition
            func_defs_nodes.push(first_def.as_ref());
            // Remaining function definitions
            for def in rest_defs {
                func_defs_nodes.push(def);
            }
        } else {
            anyhow::bail!("flet/labels: first argument must be function definitions");
        }

        // Extract body expressions (args[1..])
        let body_exprs = &args[1..];

        // Parse function definitions
        let mut parsed_defs = Vec::new();
        for def in &func_defs_nodes {
            // def is Call { function: Variable(name), args: [params_node, body...] }
            if let ASTNode::Call { function: name_node, args: func_def_parts } = def {
                if let ASTNode::Variable(func_name) = name_node.as_ref() {
                    if !func_def_parts.is_empty() {
                        // Extract parameters from func_def_parts[0]
                        // params can be: (x), (x y z), or ()
                        let params = self.extract_params(&func_def_parts[0]);

                        // Body is func_def_parts[1..] wrapped in progn if multiple expressions
                        let body = if func_def_parts.len() == 2 {
                            func_def_parts[1].clone()
                        } else if func_def_parts.len() > 2 {
                            ASTNode::Progn { exprs: func_def_parts[1..].to_vec() }
                        } else {
                            ASTNode::Constant(rlasp::ir::ConstantValue::Nil)
                        };
                        parsed_defs.push((func_name.clone(), params, body));
                    }
                }
            }
        }

        self.compile_flet_labels_internal(is_labels, &parsed_defs, body_exprs)
    }

    /// Extract parameter names from a parameter list AST node
    fn extract_params(&self, params_node: &ASTNode) -> Vec<String> {
        let mut params = Vec::new();
        match params_node {
            // Single parameter: (x) -> Call { function: Variable(x), args: [] }
            ASTNode::Call { function: first, args: rest } => {
                if let ASTNode::Variable(name) = first.as_ref() {
                    params.push(name.clone());
                }
                for arg in rest {
                    if let ASTNode::Variable(name) = arg {
                        params.push(name.clone());
                    }
                }
            }
            // Single variable (rare case)
            ASTNode::Variable(name) => {
                params.push(name.clone());
            }
            // Empty list / nil
            ASTNode::Constant(rlasp::ir::ConstantValue::Nil) => {}
            _ => {}
        }
        params
    }

    fn compile_flet_labels_internal(&mut self, is_labels: bool, func_defs: &[(String, Vec<String>, ASTNode)], body_exprs: &[ASTNode]) -> Result<()> {
        // Save current symbol table
        let saved_symbols = self.symbol_table.clone();

        // Step 1: Generate unique names for all local functions
        let mut local_names = HashMap::new();
        for (name, _params, _body) in func_defs {
            let unique_name = format!("local_{}_{}", name, self.function_counter);
            self.function_counter += 1;
            local_names.insert(name.clone(), unique_name.clone());
            self.local_function_map.insert(name.clone(), unique_name);
        }

        // Step 2: Compile local functions (buffer them to emit at module level)
        for (name, params, func_body) in func_defs {
            let unique_name = local_names.get(name).unwrap();

            // Save current output and indentation
            let saved_output = std::mem::take(&mut self.output);
            let saved_indent = self.indent_level;

            // Set indent to module level (1)
            self.indent_level = 1;

            // Compile the function (ensure state is restored on error)
            let compile_result = self.compile_function(unique_name, params, func_body);

            // Get the generated function code and restore state
            let func_code = std::mem::replace(&mut self.output, saved_output);
            self.indent_level = saved_indent;

            // Handle compilation result - propagate errors instead of silently ignoring
            match compile_result {
                Ok(_) => self.pending_functions.push(func_code),
                Err(e) => {
                    eprintln!("DEBUG labels: Failed to compile local function '{}': {}", name, e);
                    // Still add the function code even if incomplete, to maintain MLIR structure
                    self.pending_functions.push(func_code);
                }
            }
        }

        // Step 3: Compile the body with local functions in scope
        for expr in body_exprs {
            self.compile_expr(expr)?;
        }

        // Restore symbol table
        self.symbol_table = saved_symbols;

        // Clear local function map for this scope
        for (name, _, _) in func_defs {
            self.local_function_map.remove(name);
        }

        Ok(())
    }

    /// Finalize and return the complete MLIR module
    pub fn finalize(mut self) -> String {
        // Emit pending functions
        for func in &self.pending_functions {
            self.output.push_str(func);
        }

        // Emit all pending string constants as global LLVM constants
        let string_constants = self.pending_string_constants.clone();
        for (name, value) in string_constants {
            // Escape special characters for MLIR string literals
            let mut escaped = String::new();
            for c in value.chars() {
                match c {
                    '"' => escaped.push_str("\\22"),   // Double quote
                    '\\' => escaped.push_str("\\5C"),  // Backslash
                    '\n' => escaped.push_str("\\0A"),  // Newline
                    '\r' => escaped.push_str("\\0D"),  // Carriage return
                    '\t' => escaped.push_str("\\09"),  // Tab
                    c if c.is_ascii() && !c.is_ascii_control() => escaped.push(c),
                    c => {
                        // Escape non-ASCII and control chars as hex
                        for byte in c.to_string().as_bytes() {
                            escaped.push_str(&format!("\\{:02X}", byte));
                        }
                    }
                }
            }
            // Create a null-terminated C string
            let c_str = format!("{}\\00", escaped);
            let len = value.len() + 1;
            // name already includes @, so don't add another one
            self.writeln(&format!("llvm.mlir.global private constant {}(\"{}\") : !llvm.array<{} x i8>",
                name, c_str, len));
        }

        self.dedent();
        self.writeln("}");

        self.output
    }
}
