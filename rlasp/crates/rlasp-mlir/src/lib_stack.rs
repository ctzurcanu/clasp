/// Stack-based MLIR code generator
/// Complete rewrite using two-stack architecture
/// All expressions push results to stack instead of returning SSA values

use anyhow::Result;
use std::collections::{HashMap, HashSet};
use rlasp::ir::{ASTNode, ConstantValue};

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
    function_counter: usize,
    loop_carried_vars: Option<Vec<String>>,  // Variables that must be threaded through loops (None when not in loop)
}

impl StackMLIRCodegen {
    pub fn new(module_name: &str) -> Self {
        eprintln!("[DEBUG] Using StackMLIRCodegen for module: {}", module_name);
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
            function_counter: 0,
            loop_carried_vars: None,
        };

        codegen.writeln("module {");
        codegen.indent();
        codegen
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
                eprintln!("DEBUG: Compiling variable: '{}'", name);
                // Special handling for T and NIL constants
                if name == "t" {
                    eprintln!("DEBUG: Recognized as T constant");
                    let t_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", t_val));
                    return Ok(());
                } else if name == "nil" {
                    eprintln!("DEBUG: Recognized as NIL constant");
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
                    eprintln!("DEBUG: Recognized as keyword: {}", name);
                    // Create a symbol for the keyword (without the ':' prefix)
                    let keyword_name = &name[1..];
                    let keyword_sym = self.create_symbol_constant(keyword_name);
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", keyword_sym));
                    return Ok(());
                }

                // Check if variable is bound in symbol table
                if let Some(ssa_val) = self.symbol_table.get(name) {
                    // Push the bound SSA value to stack
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", ssa_val));
                } else {
                    // Unbound variable - push nil
                    eprintln!("DEBUG: Unbound variable, pushing nil");
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }
                Ok(())
            }

            // Function calls
            ASTNode::Call { function, args } => {
                // Check if it's a named function call
                if let ASTNode::Variable(func_name) = &**function {
                    self.compile_call(func_name, args)?;
                } else {
                    anyhow::bail!("Non-variable function calls not yet supported in stack mode");
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
                    self.symbol_table = saved_symbols_before_then;
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

                    // Update symbol table with returned values
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
                    self.writeln(&format!("scf.if {} {{", cond_bool));
                    self.indent();
                    self.compile_expr(then_branch)?;
                    self.dedent();
                    self.writeln("} else {");
                    self.indent();
                    self.compile_expr(else_branch)?;
                    self.dedent();
                    self.writeln("}");
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
                        // Pop all but the last result
                        if i < exprs.len() - 1 {
                            // TODO: Should we pop intermediate results or leave them?
                            // For now, assume they stay on stack (caller can clean up)
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
                        let sym = self.create_symbol_constant(name);
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

                // Compile as nested if expressions
                for (i, (test, result)) in clauses.iter().enumerate() {
                    // Evaluate test
                    self.compile_expr(test)?;

                    // Pop and check
                    let cond_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", cond_val));
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let cond_bool = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", cond_bool, cond_val, zero));

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

                Ok(())
            }

            // Setq - assignment
            ASTNode::Setq { var, value } => {
                // Evaluate value
                self.compile_expr(value)?;

                // Pop the value from stack
                let val_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));

                // Store in symbol table
                self.symbol_table.insert(var.clone(), val_ssa.clone());

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
                    self.symbol_table.insert(var.clone(), val_ssa);
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
                eprintln!("DEBUG Block: name={:?}, body.len()={}", name, body.len());
                // For now, blocks just evaluate body expressions
                // A proper implementation would need to handle return-from
                // by using exception-like control flow or continuation passing
                if body.is_empty() {
                    eprintln!("DEBUG Block: body is empty, pushing NIL");
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                } else {
                    for (i, expr) in body.iter().enumerate() {
                        eprintln!("DEBUG Block: compiling body expr {}: {:?}", i, expr);
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

                // Compile lambda body
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

                self.writeln("return");
                self.dedent();
                self.writeln("}");

                // Save the lambda function definition
                let lambda_func = std::mem::take(&mut self.output);
                self.pending_functions.push(lambda_func);

                // Restore context
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

                // Execute body
                for expr in body {
                    self.compile_expr(expr)?;
                    // Pop intermediate results
                    let _tmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                }

                // Clear loop context
                self.loop_carried_vars = None;

                // Collect updated values for all loop-carried variables
                let mut yield_values = vec![];

                // Increment loop variable
                let next_i = self.fresh_ssa();
                self.writeln(&format!("{} = arith.addi {}, {} : i64", next_i, loop_var, one));
                yield_values.push(next_i);

                // Get updated values for modified variables
                for var_name in &loop_carried_vars {
                    yield_values.push(self.symbol_table.get(var_name).unwrap().clone());
                }

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

                // Loop condition: current != nil (0)
                let zero = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                let cond = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi ne, %arg0, {} : i64", cond, zero));
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

                // Execute body
                for expr in body {
                    self.compile_expr(expr)?;
                    // Pop intermediate results
                    let _tmp = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                }

                // Get cdr for next iteration
                let next_cons = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", next_cons, current_cons));
                self.writeln(&format!("scf.yield {} : i64", next_cons));

                self.dedent();
                self.writeln("}");

                // Evaluate result form (or nil)
                if let Some(result_expr) = result {
                    self.compile_expr(result_expr)?;
                } else {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                }

                // Restore symbol table
                self.symbol_table = saved_symbols;
                Ok(())
            }

            // Loop - complex iteration with accumulation
            ASTNode::Loop { var, start, limit, when_condition, collect, sum, else_collect, else_sum } => {
                eprintln!("DEBUG: Compiling ASTNode::Loop");
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
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let cond_bool = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", cond_bool, cond_val, zero));
                    Some(cond_bool)
                } else {
                    None
                };

                // Determine new accumulator value
                let new_accum = if let Some(cond_bool) = should_process {
                    // Use scf.if to conditionally update accumulator
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
                // Build superclasses list
                self.writeln("func.call @stack_push_nil() : () -> ()");
                for super_name in superclasses.iter().rev() {
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

                // Build slots list (simplified - just count for now)
                let slot_count = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", slot_count, slots.len()));
                let slot_count_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", slot_count_boxed, slot_count));

                // Create a symbol for the class name
                let class_name_sym = self.create_symbol_constant(name);

                // Call runtime to create class
                let class_obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defclass({}, {}, {}) : (i64, i64, i64) -> i64", class_obj, class_name_sym, supers_list, slot_count_boxed));

                // Generate accessor functions for slots
                for (slot_idx, slot) in slots.iter().enumerate() {
                    if let Some(accessor_name) = &slot.accessor {
                        // Generate an accessor function
                        // (defun <accessor-name> (object) (slot-value object '<slot-name>))
                        let saved_state = self.save_state();

                        self.indent_level = 1;
                        self.writeln(&format!("func.func @\"{}\"() {{", accessor_name));
                        self.indent();

                        // Pop object parameter from stack
                        let obj = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", obj));

                        // Get slot index
                        let slot_idx_ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant {} : i64", slot_idx_ssa, slot_idx));
                        let slot_idx_boxed = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", slot_idx_boxed, slot_idx_ssa));

                        // Call runtime to get slot value
                        let slot_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_slot_value({}, {}) : (i64, i64) -> i64", slot_val, obj, slot_idx_boxed));

                        // Push result to stack
                        self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", slot_val));

                        self.writeln("return");
                        self.dedent();
                        self.writeln("}");

                        let accessor_func = std::mem::take(&mut self.output);
                        self.pending_functions.push(accessor_func);

                        self.restore_state(saved_state);
                    }
                }

                // Push class object to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", class_obj));
                Ok(())
            }

            // CLOS - Defgeneric
            ASTNode::Defgeneric { name, lambda_list } => {
                // Define a new generic function
                let param_count = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", param_count, lambda_list.len()));
                let param_count_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", param_count_boxed, param_count));

                // Call runtime to create generic function (pass nil for name)
                let name_nil = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i64", name_nil));
                let generic_obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defgeneric({}, {}) : (i64, i64) -> i64", generic_obj, name_nil, param_count_boxed));

                // Push generic function object to stack
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", generic_obj));
                Ok(())
            }

            // CLOS - Defmethod
            ASTNode::Defmethod { generic_name, specializers, params, body } => {
                // Simplified implementation: compile the method as a regular function
                // with the generic function's name. This won't support multiple methods
                // with different specializers, but works for single-method generics.

                // Save current state
                let saved_symbols = self.symbol_table.clone();
                let saved_indent = self.indent_level;
                let saved_output = std::mem::take(&mut self.output);

                // Generate method as a function
                self.indent_level = 1;
                self.writeln(&format!("func.func @\"{}\"() {{", generic_name));
                self.indent();

                self.symbol_table.clear();

                // Pop parameters from stack (in reverse order)
                for param in params.iter().rev() {
                    let param_ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", param_ssa));
                    self.symbol_table.insert(param.clone(), param_ssa);
                }

                // Compile method body
                if body.is_empty() {
                    self.writeln("func.call @stack_push_nil() : () -> ()");
                } else {
                    for (i, expr) in body.iter().enumerate() {
                        self.compile_expr(expr)?;
                        if i < body.len() - 1 {
                            let _tmp = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", _tmp));
                        }
                    }
                }

                self.writeln("return");
                self.dedent();
                self.writeln("}");

                // Add to pending functions
                let method_func = std::mem::take(&mut self.output);
                self.pending_functions.push(method_func);

                // Restore state
                self.output = saved_output;
                self.indent_level = saved_indent;
                self.symbol_table = saved_symbols;

                // Push method object to stack
                self.writeln("func.call @stack_push_nil() : () -> ()");
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
        match func_name {
            "flet" | "labels" => {
                if args.len() < 2 {
                    anyhow::bail!("{} requires at least function bindings and body", func_name);
                }
                return self.compile_flet_labels(func_name == "labels", args);
            }

            "function" => {
                // (function name) or #'name - create function reference
                if args.len() != 1 {
                    anyhow::bail!("function requires exactly 1 argument");
                }

                if let ASTNode::Variable(func_name) = &args[0] {
                    // Create a function reference using the function name as a string
                    let name_const = self.create_string_constant(func_name);
                    let name_ptr = self.fresh_ssa();
                    self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", name_ptr, name_const));
                    let func_ref = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_ref, name_ptr));
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", func_ref));
                    return Ok(());
                } else {
                    anyhow::bail!("function requires a symbol (variable name)");
                }
            }

            "funcall" => {
                // (funcall func arg1 arg2 ...) - call function with arguments
                if args.is_empty() {
                    anyhow::bail!("funcall requires at least 1 argument (the function)");
                }

                // Evaluate all arguments except the function and push to stack
                // Arguments should be pushed in forward order
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                }

                // Evaluate function expression and push to stack
                self.compile_expr(&args[0])?;

                // Pop function reference
                let func_ref = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", func_ref));

                // Call cc_funcall_stack - it will call the function which pops args and pushes result
                self.writeln(&format!("func.call @cc_funcall_stack({}) : (i64) -> ()", func_ref));

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
                if args.len() != 2 {
                    anyhow::bail!("< requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                // Pop as pointer
                let right_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                let left_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                // Unbox
                let right = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", right, right_boxed));
                let left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", left, left_boxed));

                // Compare and convert to Lisp boolean (nil or t)
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi slt, {}, {} : i64", cmp, left, right));

                // Convert i1 to Lisp boolean
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = scf.if {} -> i64 {{", result, cmp));
                self.indent();
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                self.writeln(&format!("scf.yield {} : i64", t_val));
                self.dedent();
                self.writeln("} else {");
                self.indent();
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                self.writeln(&format!("scf.yield {} : i64", nil_val));
                self.dedent();
                self.writeln("}");

                // Push result as pointer
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            ">" => {
                if args.len() != 2 {
                    anyhow::bail!("> requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                // Pop as pointer
                let right_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                let left_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                // Unbox
                let right = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", right, right_boxed));
                let left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", left, left_boxed));

                // Compare and convert to Lisp boolean (nil or t)
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi sgt, {}, {} : i64", cmp, left, right));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = scf.if {} -> i64 {{", result, cmp));
                self.indent();
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                self.writeln(&format!("scf.yield {} : i64", t_val));
                self.dedent();
                self.writeln("} else {");
                self.indent();
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                self.writeln(&format!("scf.yield {} : i64", nil_val));
                self.dedent();
                self.writeln("}");

                // Push result as pointer
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "=" => {
                if args.len() != 2 {
                    anyhow::bail!("= requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                // Pop as pointer
                let right_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                let left_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                // Unbox
                let right = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", right, right_boxed));
                let left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", left, left_boxed));

                // Compare and convert to Lisp boolean (nil or t)
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi eq, {}, {} : i64", cmp, left, right));

                // Convert i1 to Lisp boolean: use scf.if to select nil or t
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = scf.if {} -> i64 {{", result, cmp));
                self.indent();
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                self.writeln(&format!("scf.yield {} : i64", t_val));
                self.dedent();
                self.writeln("} else {");
                self.indent();
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                self.writeln(&format!("scf.yield {} : i64", nil_val));
                self.dedent();
                self.writeln("}");

                // Push result as pointer
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "<=" => {
                if args.len() != 2 {
                    anyhow::bail!("<= requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                // Pop as pointer
                let right_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                let left_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                // Unbox
                let right = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", right, right_boxed));
                let left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", left, left_boxed));

                // Compare and convert to Lisp boolean (nil or t)
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi sle, {}, {} : i64", cmp, left, right));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = scf.if {} -> i64 {{", result, cmp));
                self.indent();
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                self.writeln(&format!("scf.yield {} : i64", t_val));
                self.dedent();
                self.writeln("} else {");
                self.indent();
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                self.writeln(&format!("scf.yield {} : i64", nil_val));
                self.dedent();
                self.writeln("}");

                // Push result as pointer
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            ">=" => {
                if args.len() != 2 {
                    anyhow::bail!(">= requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                // Pop as pointer
                let right_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", right_boxed));
                let left_boxed = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", left_boxed));

                // Unbox
                let right = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", right, right_boxed));
                let left = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_unbox_fixnum({}) : (i64) -> i64", left, left_boxed));

                // Compare and convert to Lisp boolean (nil or t)
                let cmp = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi sge, {}, {} : i64", cmp, left, right));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = scf.if {} -> i64 {{", result, cmp));
                self.indent();
                let t_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t_value() : () -> i64", t_val));
                self.writeln(&format!("scf.yield {} : i64", t_val));
                self.dedent();
                self.writeln("} else {");
                self.indent();
                let nil_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                self.writeln(&format!("scf.yield {} : i64", nil_val));
                self.dedent();
                self.writeln("}");

                // Push result as pointer
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
                                _ => anyhow::bail!("{}: unsupported complex place", func_name)
                            }
                        } else {
                            anyhow::bail!("{}: unsupported place type", func_name)
                        }
                    }
                    _ => anyhow::bail!("{}: unsupported place type", func_name)
                }
            }

            "push" => {
                // (push item place) - simplified to (setf place (cons item place))
                if args.len() != 2 {
                    anyhow::bail!("push requires exactly 2 arguments");
                }

                // For simple variable case: (push item var)
                if let ASTNode::Variable(var) = &args[1] {
                    // Evaluate item
                    self.compile_expr(&args[0])?;
                    let item = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));

                    // Get current list value
                    let current = if let Some(current_ssa) = self.symbol_table.get(var).cloned() {
                        current_ssa
                    } else {
                        // If variable doesn't exist, treat as nil
                        let nil_val = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_nil_value() : () -> i64", nil_val));
                        nil_val
                    };

                    // Cons item onto list
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_list, item, current));

                    // Update symbol table
                    self.symbol_table.insert(var.clone(), new_list.clone());

                    // Push result
                    self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", new_list));
                    Ok(())
                } else {
                    anyhow::bail!("push: complex places not yet supported")
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
                        // Simple variable: (setf x value)
                        ASTNode::Variable(var) => {
                            // Evaluate value
                            self.compile_expr(value)?;
                            let val_ssa = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", val_ssa));

                            // Update symbol table
                            self.symbol_table.insert(var.clone(), val_ssa.clone());

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
                                anyhow::bail!("setf: unsupported place type");
                            }
                        }

                        _ => anyhow::bail!("setf: unsupported place type")
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
                if args.len() != 2 {
                    anyhow::bail!("append requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;
                let list2 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list2));
                let list1 = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", list1));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_append({}, {}) : (i64, i64) -> i64", result, list1, list2));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
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

                // Check for :initial-contents keyword
                let mut has_initial_contents = false;
                let mut contents_idx = 0;
                for i in (1..args.len()).step_by(2) {
                    if let ASTNode::Variable(kw) = &args[i] {
                        if kw == ":initial-contents" && i + 1 < args.len() {
                            has_initial_contents = true;
                            contents_idx = i + 1;
                            break;
                        }
                    }
                }

                if has_initial_contents {
                    // Evaluate initial contents
                    self.compile_expr(&args[contents_idx])?;

                    // Pop contents and size
                    let contents = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", contents));
                    let size = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", size));

                    // Call cc_make_array_with_contents
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_make_array_with_contents({}, {}) : (i64, i64) -> i64", result, size, contents));
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
                eprintln!("DEBUG: Compiling print function");
                if args.len() != 1 {
                    anyhow::bail!("print requires exactly 1 argument");
                }
                eprintln!("DEBUG: Compiling print argument");
                self.compile_expr(&args[0])?;
                eprintln!("DEBUG: Argument compiled");
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
                for arg in &args[1..] {
                    self.compile_expr(arg)?;
                }

                // Call function with stack convention
                self.writeln(&format!("func.call @cc_funcall_stack({}) : (i64) -> ()", func));
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
                        self.writeln("func.call @stack_push_nil() : () -> ()");
                    }
                } else {
                    // Not in a loop, use simple scf.if
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
                        ASTNode::Call { function: _, args: clause_args } if !clause_args.is_empty() => {
                            // Evaluate test
                            self.compile_expr(&clause_args[0])?;
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
                            if clause_args.len() > 1 {
                                for (j, expr) in clause_args[1..].iter().enumerate() {
                                    self.compile_expr(expr)?;
                                    if j < clause_args.len() - 2 {
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

            "loop" => {
                // Simplified: Transform (loop for i below N collect BODY)
                // Into: Build list using dotimes-style iteration

                // Parse
                let mut var_name: Option<String> = None;
                let mut start_val = 0i64;
                let mut limit_expr: Option<&ASTNode> = None;
                let mut below_mode = false;
                let mut body_expr: Option<&ASTNode> = None;

                let mut i = 0;
                while i < args.len() {
                    match &args[i] {
                        ASTNode::Variable(kw) if kw == "for" => {
                            i += 1;
                            if let Some(ASTNode::Variable(v)) = args.get(i) {
                                var_name = Some(v.clone());
                                i += 1;
                            }
                        }
                        ASTNode::Variable(kw) if kw == "from" => {
                            i += 1;
                            if let Some(ASTNode::Constant(ConstantValue::Fixnum(n))) = args.get(i) {
                                start_val = *n;
                                i += 1;
                            }
                        }
                        ASTNode::Variable(kw) if kw == "below" => {
                            i += 1;
                            limit_expr = args.get(i);
                            below_mode = true;
                            i += 1;
                        }
                        ASTNode::Variable(kw) if kw == "collect" => {
                            i += 1;
                            body_expr = args.get(i);
                            i += 1;
                        }
                        _ => i += 1,
                    }
                }

                let var = var_name.ok_or_else(|| anyhow::anyhow!("loop: missing variable"))?;
                let limit = limit_expr.ok_or_else(|| anyhow::anyhow!("loop: missing limit"))?;
                let body = body_expr.ok_or_else(|| anyhow::anyhow!("loop: missing body"))?;

                // Create a list from start to limit, then mapcar over it
                // (loop for i below 5 collect BODY) => (mapcar (lambda (i) BODY) '(0 1 2 3 4))

                // Build the range list directly
                self.compile_expr(limit)?;
                let limit_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", limit_ssa));

                // Use runtime helper to build range and map
                let start_boxed = self.fresh_ssa();
                let start_const = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", start_const, start_val));
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", start_boxed, start_const));

                let mode = self.fresh_ssa();
                let mode_const = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", mode_const, if below_mode { 1 } else { 0 }));
                self.writeln(&format!("{} = func.call @cc_box_fixnum({}) : (i64) -> i64", mode, mode_const));

                // Build range list
                let range_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_build_range({}, {}, {}) : (i64, i64, i64) -> i64",
                    range_list, start_boxed, limit_ssa, mode));

                // Create lambda for body
                let lambda_id = self.function_counter;
                self.function_counter += 1;

                let saved_output = std::mem::take(&mut self.output);
                let saved_indent = self.indent_level;
                let saved_symbols = self.symbol_table.clone();

                self.indent_level = 0;
                self.symbol_table.clear();

                let lambda_name = format!("__lambda_{}", lambda_id);
                self.writeln(&format!("func.func @\"{}\"() {{", lambda_name));
                self.indent();

                let var_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", var_ssa));
                self.symbol_table.insert(var.clone(), var_ssa);

                self.compile_expr(body)?;

                self.writeln("return");
                self.dedent();
                self.writeln("}");

                let lambda_func = std::mem::take(&mut self.output);
                self.pending_functions.push(lambda_func);

                self.output = saved_output;
                self.indent_level = saved_indent;
                self.symbol_table = saved_symbols;

                // Create lambda ref and mapcar
                let id_const = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", id_const, lambda_id));
                let lambda_ref = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_id({}) : (i64) -> i64", lambda_ref, id_const));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_mapcar_stack({}, {}) : (i64, i64) -> i64",
                    result, lambda_ref, range_list));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));

                Ok(())
            }

            // Type predicates
            "numberp" | "integerp" | "floatp" | "rationalp" | "complexp" | "realp" |
            "characterp" | "stringp" | "symbolp" | "arrayp" | "vectorp" | "hash-table-p" |
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

            // Comprehensive stub for remaining Common Lisp functions
            "typep" | "subtypep" | "arrayp" | "vectorp" | "simple-vector-p" | "bit-vector-p" |
            "simple-bit-vector-p" | "simple-string-p" | "keywordp" | "packagep" | "pathnamep" |
            "hash-table-p" | "streamp" | "readtablep" | "functionp" | "compiled-function-p" |
            // Hash tables (some implemented above, rest are stubs)
            "remhash" | "clrhash" | "hash-table-count" |
            "hash-table-size" | "hash-table-rehash-size" | "hash-table-rehash-threshold" |
            // Arrays and sequences
            "make-sequence" |
            "elt" | "subseq" | "sort" | "stable-sort" |
            "find" | "find-if" | "find-if-not" | "position" | "position-if" | "position-if-not" |
            "count" | "count-if" | "count-if-not" | "remove" | "remove-if" | "remove-if-not" |
            "delete" | "delete-if" | "delete-if-not" | "substitute" | "substitute-if" | "substitute-if-not" |
            "remove-duplicates" | "delete-duplicates" | "fill" | "replace" | "concatenate" | "merge" |
            // Lists and c[ad]+r accessors (most complex ones remain stubs)
            "caaar" | "caadr" | "cadar" |
            "cdaar" | "cdadr" | "cddar" | "cdddr" | "caaaar" | "caaadr" | "caadar" | "caaddr" |
            "cadaar" | "cadadr" | "caddar" | "cadddr" | "cdaaar" | "cdaadr" | "cdadar" | "cdaddr" |
            "cddaar" | "cddadr" | "cdddar" | "cddddr" | "fifth" | "sixth" | "seventh" | "eighth" | "ninth" | "tenth" |
            "nthcdr" |
            "nconc" | "revappend" | "nreconc" | "butlast" | "nbutlast" | "ldiff" |
            "rplaca" | "rplacd" | "nsubst" | "nsubst-if" | "nsubst-if-not" | "nsublis" |
            "member-if" | "member-if-not" | "tailp" | "adjoin" | "union" | "nunion" |
            "intersection" | "nintersection" | "set-difference" | "nset-difference" |
            "set-exclusive-or" | "nset-exclusive-or" | "subsetp" | "acons" | "pairlis" |
            "assoc-if" | "assoc-if-not" | "rassoc" | "rassoc-if" | "rassoc-if-not" |
            "get-properties" | "getf" | "remf" |
            // Mapping (stubbed for now)
            "maplist" | "mapc" | "mapl" | "mapcan" | "mapcon" |
            "map" | "map-into" | "some" | "every" | "notany" | "notevery" => {
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
            "find" | "position" => {
                if args.len() != 2 {
                    anyhow::bail!("{} requires exactly 2 arguments", func_name);
                }
                self.compile_expr(&args[0])?; // item
                self.compile_expr(&args[1])?; // sequence
                let seq = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", seq));
                let item = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", item));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_{}({}, {}) : (i64, i64) -> i64", result, func_name, item, seq));
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", result));
                Ok(())
            }

            "remove" | "delete" => {
                if args.len() != 2 {
                    anyhow::bail!("{} requires exactly 2 arguments", func_name);
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
                // String equality
                if args.len() != 2 {
                    anyhow::bail!("string= requires exactly 2 arguments");
                }
                self.compile_expr(&args[0])?;
                self.compile_expr(&args[1])?;

                let b = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", b));
                let a = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @stack_pop_pointer() : () -> i64", a));

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_string_equal({}, {}) : (i64, i64) -> i64", result, a, b));
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
            "catch" | "throw" | "unwind-protect" | "return" |
            "tagbody" | "go" | "prog" | "prog*" | "prog1" | "prog2" |
            // Evaluation and compilation
            "eval" | "compile" | "compile-file" | "load" | "require" | "provide" |
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
            "gensym" | "gentemp" | "symbol-name" | "symbol-package" | "symbol-value" |
            "symbol-function" | "symbol-plist" | "get" | "remprop" | "make-symbol" | "copy-symbol" |
            "keywordp" |

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
            "q" | "quote" | "cond" | "case" | "typecase" | "etypecase" | "ctypecase" |
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

                // Normal case: return protected result
                self.writeln(&format!("func.call @stack_push_pointer({}) : (i64) -> ()", protected_result));

                self.dedent();
                self.writeln("}");

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

            _ => {
                // User-defined function call
                // Strip package qualifier from function name (e.g., "pkg:func" -> "func")
                let unqualified_name = if let Some(colon_pos) = func_name.rfind(':') {
                    &func_name[colon_pos + 1..]
                } else {
                    func_name
                };

                // Check if this is a local function (from flet/labels)
                let actual_func_name = self.local_function_map
                    .get(unqualified_name)
                    .cloned()
                    .unwrap_or_else(|| unqualified_name.to_string());

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
                } else {
                    // Simple case: push all arguments to stack
                    for arg in args {
                        self.compile_expr(arg)?;
                    }
                }

                // Call the function (it will pop args and push result)
                self.writeln(&format!("func.call @\"{}\"() : () -> ()", actual_func_name));
                Ok(())
            }
        }
    }

    /// Compile a function definition - stack-based convention
    /// Fixed-arity functions take no parameters, access args from stack
    pub fn compile_function(&mut self, name: &str, params: &[String], body: &ASTNode) -> Result<()> {
        // Check if this function has special parameters (&optional, &key, supplied-p)
        let has_special_params = params.iter().any(|p|
            p.starts_with('&') || p.ends_with("-p") || p.ends_with("-supplied-p"));

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
                } else if param.ends_with("-p") || param.ends_with("-supplied-p") {
                    // Skip supplied-p parameters for now (they would need special handling)
                    continue;
                }

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
        println!("COMPILE_FUNCTION_DEBUG: name={}", name);
        let compile_result = self.compile_expr(body);

        // Always restore symbol table and close function properly
        self.symbol_table = saved_symbols;

        // If compilation failed, write a stub body
        if compile_result.is_err() {
            self.writeln("func.call @stack_push_nil() : () -> ()");
        }

        // Result is on stack, function returns nothing
        self.writeln("return");

        self.dedent();
        self.writeln("}");

        // Return the original error if there was one
        compile_result?;

        Ok(())
    }

    /// Compile flet or labels local function definitions
    /// Generates local functions as module-level functions with unique names
    fn compile_flet_labels(&mut self, is_labels: bool, args: &[ASTNode]) -> Result<()> {
        // Extract function definitions from args[0]
        let mut func_defs_vec = Vec::new();
        if let ASTNode::Call { function: def, args: empty_args } = &args[0] {
            // Single definition
            func_defs_vec.push((def.as_ref(), empty_args));
        } else {
            anyhow::bail!("flet/labels: first argument must be function definitions");
        }

        // Extract body expressions (args[1..])
        let body_exprs = &args[1..];

        // Parse function definitions
        let mut parsed_defs = Vec::new();
        for (def, _) in &func_defs_vec {
            // def is Call { function: Variable(name), args: [params_node, body...] }
            if let ASTNode::Call { function: name_node, args: func_def_parts } = def {
                if let ASTNode::Variable(func_name) = name_node.as_ref() {
                    if func_def_parts.len() >= 2 {
                        // Extract parameter from Call { function: Variable(param), args: [] }
                        let params = if let ASTNode::Call { function: param_var, args: _ } = &func_def_parts[0] {
                            if let ASTNode::Variable(param_name) = param_var.as_ref() {
                                vec![param_name.clone()]
                            } else {
                                Vec::new()
                            }
                        } else {
                            Vec::new()
                        };

                        // Body is func_def_parts[1]
                        let body = &func_def_parts[1];
                        parsed_defs.push((func_name.clone(), params, body.clone()));
                    }
                }
            }
        }

        self.compile_flet_labels_internal(is_labels, &parsed_defs, body_exprs)
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

            // Compile the function
            self.compile_function(unique_name, params, func_body)?;

            // Save the generated function code
            let func_code = std::mem::replace(&mut self.output, saved_output);
            self.pending_functions.push(func_code);

            // Restore indent level
            self.indent_level = saved_indent;
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
            // Create a null-terminated C string
            let c_str = format!("{}\\00", value);
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
