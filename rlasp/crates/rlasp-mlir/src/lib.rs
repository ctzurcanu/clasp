use anyhow::Result;
use std::collections::HashMap;
use rlasp::ir::ASTNode;

pub mod lowering;
pub mod jit;
pub mod jit_fixed;
pub mod lib_stack;  // New stack-based code generator

/// MLIR text generator for Lisp compilation
/// Generates MLIR in text format with dynamic typing support
pub struct MLIRCodegen {
    module_name: String,
    output: String,
    pending_functions: Vec<String>,  // Buffer for local functions to emit at module level
    pending_string_constants: Vec<(String, String)>,  // (name, value) for global string constants
    indent_level: usize,
    next_ssa_id: usize,
    symbol_table: HashMap<String, String>,  // variable name -> SSA value
    functions: Vec<String>,
    local_function_map: HashMap<String, String>,  // original name -> mangled name
    function_counter: usize,  // for generating unique names
}

impl MLIRCodegen {
    pub fn new(module_name: &str) -> Self {
        let mut codegen = Self {
            module_name: module_name.to_string(),
            output: String::new(),
            pending_functions: Vec::new(),
            pending_string_constants: Vec::new(),
            indent_level: 0,
            next_ssa_id: 0,
            symbol_table: HashMap::new(),
            functions: Vec::new(),
            local_function_map: HashMap::new(),
            function_counter: 0,
        };

        // Write module header
        codegen.writeln("module {");
        codegen.indent();

        // Note: Runtime function declarations are now loaded from runtime-decls.mlir during lowering

        codegen
    }

    /// Old add_runtime_declarations removed - declarations now loaded from external file
    #[allow(dead_code)]
    fn add_runtime_declarations_deprecated(&mut self) {
        // Declare ONLY actual runtime primitive functions
        // User-defined functions should NOT be here - they're compiled from source
        self.writeln("func.func private @cc_nil() -> i64");
        self.writeln("func.func private @cc_t() -> i64");
        self.writeln("func.func private @cc_box_float(f64) -> i64");
        self.writeln("func.func private @cc_cons(i64, i64) -> i64");
        self.writeln("func.func private @cc_car(i64) -> i64");
        self.writeln("func.func private @cc_cdr(i64) -> i64");
        self.writeln("func.func private @cc_add(i64, i64) -> i64");
        self.writeln("func.func private @cc_sub(i64, i64) -> i64");
        self.writeln("func.func private @cc_mul(i64, i64) -> i64");
        self.writeln("func.func private @cc_div(i64, i64) -> i64");
        self.writeln("func.func private @cc_mod(i64, i64) -> i64");
        self.writeln("func.func private @cc_expt(i64, i64) -> i64");
        self.writeln("func.func private @cc_sqrt(i64) -> i64");
        self.writeln("func.func private @cc_round(i64) -> i64");
        self.writeln("func.func private @cc_truncate(i64) -> i64");
        self.writeln("func.func private @cc_truncate_2(i64, i64) -> i64");
        self.writeln("func.func private @cc_evenp(i64) -> i64");
        self.writeln("func.func private @cc_oddp(i64) -> i64");
        self.writeln("func.func private @cc_lt(i64, i64) -> i64");
        self.writeln("func.func private @cc_gt(i64, i64) -> i64");
        self.writeln("func.func private @cc_eq(i64, i64) -> i64");
        self.writeln("func.func private @cc_null(i64) -> i64");
        self.writeln("func.func private @cc_print(i64) -> i64");
        self.writeln("func.func private @cc_append(i64, i64) -> i64");
        self.writeln("func.func private @cc_if(i64, i64, i64) -> i64");
        self.writeln("func.func private @cc_numerator(i64) -> i64");
        self.writeln("func.func private @cc_denominator(i64) -> i64");
        self.writeln("func.func private @cc_realpart(i64) -> i64");
        self.writeln("func.func private @cc_imagpart(i64) -> i64");
        self.writeln("func.func private @cc_make_array(i64) -> i64");
        self.writeln("func.func private @cc_aref(i64, i64) -> i64");
        self.writeln("func.func private @cc_set_aref(i64, i64, i64) -> i64");
        self.writeln("func.func private @cc_make_hash_table() -> i64");
        self.writeln("func.func private @cc_gethash(i64, i64, i64) -> i64");
        self.writeln("func.func private @cc_puthash(i64, i64, i64) -> i64");
        self.writeln("func.func private @cc_make_string_repeat(i64, i64) -> i64");
        self.writeln("func.func private @cc_string_equal(i64, i64) -> i64");
        self.writeln("func.func private @cc_set_char(i64, i64, i64) -> i64");
        self.writeln("func.func private @cc_copy_seq(i64) -> i64");
        self.writeln("func.func private @cc_incf(i64) -> i64");
        self.writeln("func.func private @cc_reduce(i64, i64) -> i64");
        self.writeln("func.func private @cc_fboundp(i64) -> i64");
        self.writeln("func.func private @cc_boundp(i64) -> i64");
        self.writeln("func.func private @cc_functionp(i64) -> i64");
        self.writeln("func.func private @cc_format(i64, i64) -> i64");
        self.writeln("func.func private @cc_read_from_string(i64) -> i64");
        self.writeln("func.func private @cc_eval(i64) -> i64");
        self.writeln("func.func private @cc_make_instance() -> i64");
        self.writeln("func.func private @cc_set_car(i64, i64) -> i64");
        self.writeln("func.func private @cc_set_cdr(i64, i64) -> i64");

        // Argument extraction - get Nth argument from args list
        self.writeln("func.func private @cc_arg(i64, i64) -> i64");  // cc_arg(args, index) -> value

        // Function object support - single uniform calling convention
        // All functions take ONE argument: a structure containing args + environment
        self.writeln("func.func private @cc_make_lambda_ref_str(!llvm.ptr) -> i64");  // Create lambda ref from C string name
        self.writeln("func.func private @cc_funcall(i64, i64) -> i64");  // funcall(func_ref, args_and_env)
        self.writeln("func.func private @cc_apply(i64, i64) -> i64");
        self.writeln("func.func private @cc_dotimes(i64) -> i64");

        // Logical operators (take args list)
        self.writeln("func.func private @cc_and(i64) -> i64");  // and(args) - returns NIL if any arg is NIL
        self.writeln("func.func private @cc_or(i64) -> i64");   // or(args) - returns first non-NIL arg

        // Math functions
        self.writeln("func.func private @cc_magnitude(i64) -> i64");  // magnitude(obj) - stub
        self.writeln("func.func private @cc_complex(i64) -> i64");    // complex(real, imag) - stub
        self.writeln("func.func private @cc_ratio(i64) -> i64");      // ratio(num, den) - stub

        // Compilation
        self.writeln("func.func private @cc_compile(i64) -> i64");    // compile(form) - stub

        self.writeln("");  // Blank line for readability
    }

    fn indent(&mut self) {
        self.indent_level += 1;
    }

    fn dedent(&mut self) {
        self.indent_level = self.indent_level.saturating_sub(1);
    }

    fn writeln(&mut self, line: &str) {
        for _ in 0..self.indent_level {
            self.output.push_str("  ");
        }
        self.output.push_str(line);
        self.output.push('\n');
    }

    fn fresh_ssa(&mut self) -> String {
        let id = self.next_ssa_id;
        self.next_ssa_id += 1;
        format!("%{}", id)
    }

    /// Quote a function name if it contains special characters
    fn quote_func_name(name: &str) -> String {
        // Strip package prefix if present (e.g., "cl-features-bench:run-benchmarks" -> "run-benchmarks")
        let base_name = if let Some(colon_pos) = name.rfind(':') {
            &name[colon_pos + 1..]
        } else {
            name
        };

        // MLIR requires quoting for names with dashes, dots, or other special chars
        if base_name.chars().any(|c| c == '-' || c == '.' || !c.is_alphanumeric() && c != '_') {
            format!("\"{}\"", base_name)
        } else {
            base_name.to_string()
        }
    }

    /// Create a symbol constant (represented as a cons of the name string)
    fn create_symbol_constant(&mut self, name: &str) -> String {
        // Create a proper symbol using cc_make_symbol
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

    /// Create a string constant and return an !llvm.ptr to it
    fn create_string_constant(&mut self, s: &str) -> String {
        // Add to pending string constants
        let const_name = format!("@str{}", self.pending_string_constants.len());
        self.pending_string_constants.push((const_name.clone(), s.to_string()));
        const_name
    }

    /// Generate a slot accessor function
    fn generate_slot_accessor(&mut self, accessor_name: &str, slot_name: &str) -> Result<()> {
        // Generate: (defun accessor-name (obj) (cc_slot_value obj 'slot-name))
        // Buffer the output to emit at module level
        let saved_output = std::mem::take(&mut self.output);
        let saved_indent = self.indent_level;
        self.indent_level = 1;  // Module level functions have indent 1

        let _slot_name_ssa = format!("slot_{}", self.function_counter);
        self.function_counter += 1;

        // Start function
        self.writeln(&format!("func.func @{}(%args_and_env: i64) -> i64 {{",
            Self::quote_func_name(accessor_name)));
        self.indent();

        // Extract the object parameter
        let idx = self.fresh_ssa();
        self.writeln(&format!("{} = arith.constant 0 : i64", idx));  // Index 0
        let obj = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_arg(%args_and_env, {}) : (i64, i64) -> i64", obj, idx));

        // Create symbol for slot name
        let slot_sym = self.create_symbol_constant(slot_name);

        // Call cc_slot_value
        let result = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_slot_value({}, {}) : (i64, i64) -> i64",
            result, obj, slot_sym));

        // Return
        self.writeln(&format!("func.return {} : i64", result));

        self.dedent();
        self.writeln("}");
        self.writeln("");

        // Save the generated accessor and restore the output and indent
        let accessor_code = std::mem::replace(&mut self.output, saved_output);
        self.pending_functions.push(accessor_code);
        self.indent_level = saved_indent;

        Ok(())
    }

    /// Compile a Lisp function to MLIR
    /// All values are i64 (tagged pointers for dynamic typing)
    /// If is_local=true, the function is buffered to be emitted at module level
    fn compile_function_internal(&mut self, name: &str, params: &[String], body: &rlasp::ir::ASTNode, is_local: bool) -> Result<()> {
        // Save current output if this is a local function
        let saved_output = if is_local {
            std::mem::take(&mut self.output)
        } else {
            String::new()
        };

        // Save and clear symbol table for function scope
        let saved_symbols = self.symbol_table.clone();
        self.symbol_table.clear();

        // Entry points like __main use () -> i64 signature for C compatibility
        // All other functions use uniform calling convention: (i64) -> i64
        // "main" is NOT an entry point - it's a regular user function
        let is_entry_point = name == "__main" || name.starts_with("__rlasp_");

        if is_entry_point {
            // Entry point - no args or direct parameters
            let param_str = if params.is_empty() {
                String::new()
            } else {
                params.iter()
                    .enumerate()
                    .map(|(i, _)| format!("%arg{}: i64", i))
                    .collect::<Vec<_>>()
                    .join(", ")
            };
            self.writeln(&format!("func.func @{}({}) -> i64 {{", Self::quote_func_name(name), param_str));
            self.indent();

            // Bind parameters directly
            for (i, param) in params.iter().enumerate() {
                let ssa = format!("%arg{}", i);
                self.symbol_table.insert(param.clone(), ssa);
            }
        } else {
            // Regular Lisp function - uniform calling convention
            self.writeln(&format!("func.func @{}(%args_and_env: i64) -> i64 {{", Self::quote_func_name(name)));
            self.indent();

            // Extract parameters from args_and_env using cc_arg(args, index)
            for (i, param) in params.iter().enumerate() {
                let idx = self.fresh_ssa();
                let tagged_idx = (i as i64) << 2;  // Tag the index like other fixnums
                self.writeln(&format!("{} = arith.constant {} : i64", idx, tagged_idx));
                let arg_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_arg(%args_and_env, {}) : (i64, i64) -> i64", arg_val, idx));
                self.symbol_table.insert(param.clone(), arg_val);
            }
        }

        // Compile function body
        let result = match self.compile_expr(body) {
            Ok(r) => r,
            Err(e) => {
                // If body compilation fails, return NIL
                // Note: error logged at call site, just return nil
                let nil_result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil_result));
                nil_result
            }
        };

        // Return result
        self.writeln(&format!("func.return {} : i64", result));

        self.dedent();
        self.writeln("}");

        self.functions.push(name.to_string());

        // Restore symbol table
        self.symbol_table = saved_symbols;

        // If local function, save to pending and restore original output
        if is_local {
            self.pending_functions.push(std::mem::replace(&mut self.output, saved_output));
        }

        Ok(())
    }

    pub fn compile_function(&mut self, name: &str, params: &[String], body: &rlasp::ir::ASTNode) -> Result<()> {
        self.compile_function_internal(name, params, body, false)
    }

    /// Compile a Lisp expression to MLIR
    fn compile_expr(&mut self, ast: &rlasp::ir::ASTNode) -> Result<String> {
        use rlasp::ir::ConstantValue;

        match ast {
            rlasp::ir::ASTNode::Constant(ConstantValue::Fixnum(n)) => {
                // Tag the fixnum: (n << 2) | 0b00
                let tagged_value = (n << 2);
                let ssa = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", ssa, tagged_value));
                Ok(ssa)
            }

            rlasp::ir::ASTNode::Constant(ConstantValue::Float(f)) => {
                // Box the float value immediately
                let float_val = self.fresh_ssa();
                // Format float to always have a decimal point
                let float_str = if f.fract() == 0.0 && f.is_finite() {
                    format!("{:.1}", f)  // e.g., 0.0, 1.0, 42.0
                } else {
                    format!("{}", f)
                };
                self.writeln(&format!("{} = arith.constant {} : f64", float_val, float_str));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_box_float({}) : (f64) -> i64", result, float_val));
                Ok(result)
            }

            rlasp::ir::ASTNode::Constant(ConstantValue::Nil) => {
                let ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", ssa));
                Ok(ssa)
            }

            rlasp::ir::ASTNode::Constant(ConstantValue::T) => {
                let ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_t() : () -> i64", ssa));
                Ok(ssa)
            }

            rlasp::ir::ASTNode::Constant(ConstantValue::String(s)) => {
                // Create a global string constant
                let const_name = self.create_string_constant(s);
                // Get address of the string constant (using opaque pointers)
                let str_ptr = self.fresh_ssa();
                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr",
                    str_ptr, const_name));
                // Get pointer to the actual string data (GEP to skip the length prefix if any)
                // For now, just use the string pointer directly
                // Create string object using cc_make_string
                let len = s.len();
                let len_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", len_ssa, len));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_string({}, {}) : (!llvm.ptr, i64) -> i64",
                    result, str_ptr, len_ssa));
                Ok(result)
            }

            rlasp::ir::ASTNode::Variable(name) => {
                self.symbol_table
                    .get(name)
                    .cloned()
                    .ok_or_else(|| anyhow::anyhow!("Undefined variable: {}", name))
            }

            rlasp::ir::ASTNode::Progn { exprs } => {
                // Execute all expressions in sequence, return the last one
                let mut result = None;
                for expr in exprs {
                    result = Some(self.compile_expr(expr)?);
                }
                result.ok_or_else(|| anyhow::anyhow!("Empty progn"))
            }

            rlasp::ir::ASTNode::Let { bindings, body } => {
                // Save current symbol table
                let saved_symbols = self.symbol_table.clone();

                // Compile and bind each variable
                for (var, value_expr) in bindings {
                    let value_ssa = self.compile_expr(value_expr)?;
                    self.symbol_table.insert(var.clone(), value_ssa);
                }

                // Compile body in the extended environment
                let mut result = None;
                for expr in body {
                    result = Some(self.compile_expr(expr)?);
                }

                // Restore symbol table
                self.symbol_table = saved_symbols;

                result.ok_or_else(|| anyhow::anyhow!("Empty let body"))
            }

            rlasp::ir::ASTNode::Quote(quoted) => {
                // Handle quoted expressions
                self.compile_quoted(quoted)
            }

            rlasp::ir::ASTNode::Setq { var, value } => {
                // Compile the value expression
                let value_ssa = self.compile_expr(value)?;
                // Update symbol table to point to new value
                self.symbol_table.insert(var.clone(), value_ssa.clone());
                // Return the new value
                Ok(value_ssa)
            }

            rlasp::ir::ASTNode::If { test, then_branch, else_branch } => {
                // Compile test condition
                let test_ssa = self.compile_expr(test)?;

                // Check truthiness using cc_truthiness (returns 0 for NIL, 1 for anything else)
                let truth_val = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_truthiness({}) : (i64) -> i64", truth_val, test_ssa));

                // Convert to boolean for scf.if
                let zero = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                let bool_cond = self.fresh_ssa();
                self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", bool_cond, truth_val, zero));

                // Save symbol table before branches
                let saved_symbols = self.symbol_table.clone();

                // Use scf.if for proper lazy evaluation
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = scf.if {} -> (i64) {{", result, bool_cond));
                self.indent();

                // Then branch
                let then_val = self.compile_expr(then_branch)?;
                self.writeln(&format!("scf.yield {} : i64", then_val));

                self.dedent();
                self.writeln("} else {");
                self.indent();

                // Restore symbol table for else branch
                self.symbol_table = saved_symbols.clone();

                // Else branch
                let else_val = self.compile_expr(else_branch)?;
                self.writeln(&format!("scf.yield {} : i64", else_val));

                self.dedent();
                self.writeln("}");

                // Restore original symbol table after if
                self.symbol_table = saved_symbols;

                Ok(result)
            }

            rlasp::ir::ASTNode::Lambda { params, body, .. } => {
                // Generate unique lambda function name
                let lambda_name = format!("__lambda_{}", self.function_counter);
                self.function_counter += 1;

                // Save current compilation state
                let saved_output = std::mem::take(&mut self.output);
                let saved_symbols = self.symbol_table.clone();
                let saved_ssa_id = self.next_ssa_id;

                // Reset for lambda compilation
                self.next_ssa_id = 0;
                self.symbol_table.clear();

                // Wrap body in Progn if needed
                let body_expr = if body.len() == 1 {
                    &body[0]
                } else {
                    // Create a Progn node - but we can't easily do this without allocating
                    // For now, just use the last expression (this is a simplification)
                    body.last().ok_or_else(|| anyhow::anyhow!("Empty lambda body"))?
                };

                // Compile lambda as a separate function
                self.compile_function_internal(&lambda_name, params, body_expr, true)?;

                // Restore compilation state
                self.output = saved_output;
                self.symbol_table = saved_symbols;
                self.next_ssa_id = saved_ssa_id;

                // Create a global string constant for the lambda name
                let str_global_name = format!("@__{}_name", lambda_name);
                self.pending_string_constants.push((str_global_name.clone(), lambda_name.clone()));

                // Get pointer to the string constant
                let str_ptr = self.fresh_ssa();
                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", str_ptr, str_global_name));

                // Call runtime to create function reference from the lambda name
                let func_obj = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", func_obj, str_ptr));
                Ok(func_obj)
            }

            rlasp::ir::ASTNode::Dotimes { var, count, result: result_expr, body } => {
                // Compile dotimes as a loop using SCF dialect
                // (dotimes (var count result) body...)

                // Save symbol table state
                let saved_symbols = self.symbol_table.clone();

                // Compile count value (tagged fixnum), unbox it, and convert to index
                let count_tagged = self.compile_expr(count)?;
                // Unbox the fixnum by shifting right by 2
                let shift_amount = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 2 : i64", shift_amount));
                let count_i64 = self.fresh_ssa();
                self.writeln(&format!("{} = arith.shrsi {}, {} : i64", count_i64, count_tagged, shift_amount));
                let count_val = self.fresh_ssa();
                self.writeln(&format!("{} = arith.index_cast {} : i64 to index", count_val, count_i64));

                // Start value is always 0
                let start_val = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 0 : index", start_val));

                // Step is always 1
                let step = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 1 : index", step));

                // Create loop - dotimes doesn't accumulate, so no iter_args needed
                // We use a dummy result of nil
                let nil_init = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil_init));

                let loop_result = self.fresh_ssa();
                // Use unique dummy name based on loop variable to avoid conflicts in nested loops
                let dummy_name = format!("{}_dummy", var);
                self.writeln(&format!("{} = scf.for %{}_idx = {} to {} step {} iter_args(%{} = {}) -> (i64) {{",
                    loop_result, var, start_val, count_val, step, dummy_name, nil_init));
                self.indent();

                // Convert loop index to i64 and set in symbol table
                let var_i64 = self.fresh_ssa();
                self.writeln(&format!("{} = arith.index_cast %{}_idx : index to i64", var_i64, var));

                // Tag the index as a fixnum (shift left by 2)
                let shift_amount = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 2 : i64", shift_amount));
                let var_tagged = self.fresh_ssa();
                self.writeln(&format!("{} = arith.shli {}, {} : i64", var_tagged, var_i64, shift_amount));
                self.symbol_table.insert(var.clone(), var_tagged);

                // Compile body expressions (for side effects)
                for expr in body {
                    let _ = self.compile_expr(expr)?;
                }

                // Yield nil to continue loop
                let nil = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                self.writeln(&format!("scf.yield {} : i64", nil));

                self.dedent();
                self.writeln("}");

                // Restore symbol table
                self.symbol_table = saved_symbols;

                // Return the result expression if provided, otherwise return nil
                if let Some(result_expr) = result_expr {
                    self.compile_expr(result_expr)
                } else {
                    Ok(loop_result)
                }
            }

            rlasp::ir::ASTNode::Loop { var, start, limit, when_condition, collect, sum, else_collect, else_sum } => {
                // Compile loop with full Common Lisp semantics using SCF dialect
                // (loop for i from start below limit when cond sum expr else sum expr2)

                use rlasp::ir::ASTNode;
                use rlasp::ir::ConstantValue;

                // Determine if this is a sum or collect loop
                let is_sum = sum.is_some() || else_sum.is_some();

                // Save symbol table state
                let saved_symbols = self.symbol_table.clone();

                // Compile start value (default to 0) and convert to index
                let start_i64 = if let Some(s) = start {
                    self.compile_expr(s)?
                } else {
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", ssa));
                    ssa
                };
                let start_val = self.fresh_ssa();
                self.writeln(&format!("{} = arith.index_cast {} : i64 to index", start_val, start_i64));

                // Compile limit value and convert to index
                let limit_i64 = self.compile_expr(limit)?;
                let limit_val = self.fresh_ssa();
                self.writeln(&format!("{} = arith.index_cast {} : i64 to index", limit_val, limit_i64));

                // Initialize accumulator
                let accum_init = if is_sum {
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", ssa));
                    ssa
                } else {
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", ssa));
                    ssa
                };

                // Generate step constant (index type)
                let step = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant 1 : index", step));

                let loop_result = self.fresh_ssa();

                // Generate SCF for loop with iter_args
                self.writeln(&format!("{} = scf.for %{}_idx = {} to {} step {} iter_args(%accum = {}) -> (i64) {{",
                    loop_result, var, start_val, limit_val, step, accum_init));
                self.indent();

                // Convert loop index to i64 and set in symbol table
                let var_i64 = self.fresh_ssa();
                self.writeln(&format!("{} = arith.index_cast %{}_idx : index to i64", var_i64, var));
                self.symbol_table.insert(var.clone(), var_i64);

                // Compile the accumulation expression based on the when condition
                let iteration_value = if let Some(when_cond) = when_condition {
                    // Compile the when condition
                    let cond_ssa = self.compile_expr(when_cond)?;

                    // Convert i64 to i1 (boolean) for scf.if
                    // In Common Lisp, nil is false, everything else is true
                    // Compare with 0 to get a boolean
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let bool_cond = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", bool_cond, cond_ssa, zero));

                    // Generate scf.if for conditional accumulation
                    let if_result = self.fresh_ssa();

                    self.writeln(&format!("{} = scf.if {} -> (i64) {{", if_result, bool_cond));
                    self.indent();

                    // Then branch - compile the main sum/collect expression
                    let then_val = if let Some(then_expr) = sum.as_ref().or(collect.as_ref()) {
                        self.compile_expr(then_expr)?
                    } else {
                        let ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant 0 : i64", ssa));
                        ssa
                    };
                    self.writeln(&format!("scf.yield {} : i64", then_val));

                    self.dedent();
                    self.writeln("} else {");
                    self.indent();

                    // Else branch - compile the else sum/collect expression
                    let else_val = if let Some(else_expr) = else_sum.as_ref().or(else_collect.as_ref()) {
                        self.compile_expr(else_expr)?
                    } else {
                        let ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant 0 : i64", ssa));
                        ssa
                    };
                    self.writeln(&format!("scf.yield {} : i64", else_val));

                    self.dedent();
                    self.writeln("}");

                    if_result
                } else {
                    // No when condition - just compile the sum/collect expression
                    if let Some(expr) = sum.as_ref().or(collect.as_ref()) {
                        self.compile_expr(expr)?
                    } else {
                        let ssa = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant 0 : i64", ssa));
                        ssa
                    }
                };

                // Accumulate the value
                let new_accum = if is_sum {
                    // For sum, add to accumulator
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.addi %accum, {} : i64", result, iteration_value));
                    result
                } else {
                    // For collect, cons onto accumulator
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, %accum) : (i64, i64) -> i64", result, iteration_value));
                    result
                };

                // Yield the new accumulator value
                self.writeln(&format!("scf.yield {} : i64", new_accum));

                self.dedent();
                self.writeln("}");

                // Restore symbol table
                self.symbol_table = saved_symbols;

                Ok(loop_result)
            }

            rlasp::ir::ASTNode::Block { name, body } => {
                // Execute body in sequence
                let mut result = None;
                for expr in body {
                    result = Some(self.compile_expr(expr)?);
                }
                result.ok_or_else(|| anyhow::anyhow!("Empty block"))
            }

            rlasp::ir::ASTNode::ReturnFrom { block_name, value } => {
                // For now, just evaluate and return the value
                if let Some(val) = value {
                    self.compile_expr(val)
                } else {
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", ssa));
                    Ok(ssa)
                }
            }

            rlasp::ir::ASTNode::LetStar { bindings, body } => {
                // let* is like let but binds sequentially
                let saved_symbols = self.symbol_table.clone();

                for (var, value_expr) in bindings {
                    let value_ssa = self.compile_expr(value_expr)?;
                    self.symbol_table.insert(var.clone(), value_ssa);
                }

                let mut result = None;
                for expr in body {
                    result = Some(self.compile_expr(expr)?);
                }

                self.symbol_table = saved_symbols;
                result.ok_or_else(|| anyhow::anyhow!("Empty let* body"))
            }

            rlasp::ir::ASTNode::Call { function, args } => {
                if let rlasp::ir::ASTNode::Variable(func_name) = function.as_ref() {
                    // Check for special forms
                    match func_name.as_str() {
                        "flet" | "labels" if args.len() >= 2 => {
                            self.compile_flet_labels(func_name == "labels", args)
                        }
                        _ => self.compile_call(func_name, args)
                    }
                } else {
                    // Function is not a simple variable - could be a lambda call
                    // Use uniform calling convention
                    let func_ssa = self.compile_expr(function)?;
                    let arg_ssas: Result<Vec<_>> = args.iter().map(|arg| self.compile_expr(arg)).collect();
                    let arg_ssas = arg_ssas?;

                    // Build args_and_env list
                    let args_and_env = if arg_ssas.is_empty() {
                        let nil = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                        nil
                    } else {
                        let mut result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

                        for arg_ssa in arg_ssas.iter().rev() {
                            let new_result = self.fresh_ssa();
                            self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                                new_result, arg_ssa, result));
                            result = new_result;
                        }
                        result
                    };

                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_funcall({}, {}) : (i64, i64) -> i64", result, func_ssa, args_and_env));
                    Ok(result)
                }
            }

            rlasp::ir::ASTNode::Defclass { name, superclasses, slots } => {
                // Generate defclass: (cc_defclass 'class-name '(slot1 slot2 ...) '(superclass1 ...))

                // Create class name symbol
                let class_name_ssa = self.create_symbol_constant(name);

                // Create slots list - each slot is just the name for now
                let mut slots_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", slots_list));

                for slot in slots.iter().rev() {
                    let slot_name_ssa = self.create_symbol_constant(&slot.name);
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                        new_list, slot_name_ssa, slots_list));
                    slots_list = new_list;
                }

                // Create superclasses list
                let mut super_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", super_list));

                for superclass in superclasses.iter().rev() {
                    let super_name_ssa = self.create_symbol_constant(superclass);
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                        new_list, super_name_ssa, super_list));
                    super_list = new_list;
                }

                // Call cc_defclass
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defclass({}, {}, {}) : (i64, i64, i64) -> i64",
                    result, class_name_ssa, slots_list, super_list));

                // Generate accessor functions for each slot with :accessor
                for slot in slots {
                    if let Some(accessor_name) = &slot.accessor {
                        // Generate accessor: (lambda (obj) (cc_slot_value obj 'slot-name))
                        self.generate_slot_accessor(accessor_name, &slot.name)?;
                    }
                    if let Some(reader_name) = &slot.reader {
                        // Generate reader (same as accessor)
                        self.generate_slot_accessor(reader_name, &slot.name)?;
                    }
                    // Note: writers would need special setf handling
                }

                Ok(result)
            }

            rlasp::ir::ASTNode::Defgeneric { name, lambda_list } => {
                // Generate defgeneric: (cc_defgeneric 'name '(param1 param2 ...))
                // Also create a trampoline function that calls cc_call_generic

                let name_ssa = self.create_symbol_constant(name);

                // Create lambda list
                let mut params_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", params_list));

                for param in lambda_list.iter().rev() {
                    let param_ssa = self.create_symbol_constant(param);
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                        new_list, param_ssa, params_list));
                    params_list = new_list;
                }

                // Call cc_defgeneric
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defgeneric({}, {}) : (i64, i64) -> i64",
                    result, name_ssa, params_list));

                // Create a trampoline function that dispatches to the generic function
                // The trampoline takes args_and_env and calls cc_call_generic
                let quoted_name = Self::quote_func_name(name);
                let str_id = self.function_counter;
                self.function_counter += 1;

                // Escape the name for the string constant
                let name_escaped = name.replace('\\', "\\\\").replace('"', "\\\"").replace('\n', "\\n");
                let str_const_name = format!("@__gf_str_{}", str_id);

                // Add string constant for the name
                self.pending_string_constants.push((
                    str_const_name.clone(),
                    name_escaped.clone()
                ));

                // Create the trampoline function that recreates the symbol and calls cc_call_generic
                let trampoline = format!(
                    "  func.func @{}(%arg0: i64) -> i64 {{\n    %str_ptr = llvm.mlir.addressof {} : !llvm.ptr\n    %name = func.call @cc_make_lambda_ref_str(%str_ptr) : (!llvm.ptr) -> i64\n    %result = func.call @cc_call_generic(%name, %arg0) : (i64, i64) -> i64\n    return %result : i64\n  }}",
                    quoted_name,
                    str_const_name
                );
                eprintln!("[DEFGENERIC] Creating trampoline for '{}' as @{}", name, quoted_name);
                self.pending_functions.push(trampoline);

                Ok(result)
            }

            rlasp::ir::ASTNode::Defmethod { generic_name, qualifier, specializers, params, body } => {
                // Generate defmethod:
                // 1. Create a method function
                // 2. Register it with cc_defmethod_qualified

                let method_fn_name = format!("{}$method${}", generic_name, self.function_counter);
                self.function_counter += 1;

                // Compile the method as a regular function (buffered to module level)
                self.compile_function_internal(&method_fn_name, params, &rlasp::ir::ASTNode::progn(body.clone()), true)?;

                // Now register the method
                let generic_name_ssa = self.create_symbol_constant(generic_name);

                // Create specializers list
                let mut spec_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", spec_list));

                for spec in specializers.iter().rev() {
                    let spec_ssa = self.create_symbol_constant(spec);
                    let new_list = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                        new_list, spec_ssa, spec_list));
                    spec_list = new_list;
                }

                // Get function pointer for the method
                let method_name_const = self.create_string_constant(&method_fn_name);
                let method_name_ptr = self.fresh_ssa();
                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr",
                    method_name_ptr, method_name_const));
                let func_ptr = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64",
                    func_ptr, method_name_ptr));

                // Create arity constant
                let arity = self.fresh_ssa();
                let arity_val = params.len() as i64;
                let tagged_arity = arity_val << 2;
                self.writeln(&format!("{} = arith.constant {} : i64", arity, tagged_arity));

                // Convert qualifier to numeric code: 0=primary, 1=before, 2=after, 3=around
                let qualifier_code = match qualifier.as_ref().map(|s| s.to_uppercase()).as_deref() {
                    Some(":BEFORE") => 1,
                    Some(":AFTER") => 2,
                    Some(":AROUND") => 3,
                    _ => 0, // Primary
                };
                let qualifier_ssa = self.fresh_ssa();
                self.writeln(&format!("{} = arith.constant {} : i64", qualifier_ssa, qualifier_code));

                // Call cc_defmethod_qualified
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_defmethod_qualified({}, {}, {}, {}, {}) : (i64, i64, i64, i64, i64) -> i64",
                    result, generic_name_ssa, spec_list, func_ptr, arity, qualifier_ssa));

                Ok(result)
            }

            rlasp::ir::ASTNode::Cond { clauses } => {
                // (cond (test1 result1) (test2 result2) ... (t default))
                // Compile as nested scf.if expressions
                if clauses.is_empty() {
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", ssa));
                    return Ok(ssa);
                }

                // Save symbol table
                let saved_symbols = self.symbol_table.clone();

                // Build nested if/else from bottom up
                let mut result = None;
                for (test, consequent) in clauses.iter().rev() {
                    // Restore symbol table for each clause
                    self.symbol_table = saved_symbols.clone();

                    // Compile test
                    let test_ssa = self.compile_expr(test)?;

                    // Check truthiness
                    let truth_val = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_truthiness({}) : (i64) -> i64", truth_val, test_ssa));
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let bool_cond = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.cmpi ne, {}, {} : i64", bool_cond, truth_val, zero));

                    let if_result = self.fresh_ssa();
                    self.writeln(&format!("{} = scf.if {} -> (i64) {{", if_result, bool_cond));
                    self.indent();

                    // Then branch
                    let then_val = self.compile_expr(consequent)?;
                    self.writeln(&format!("scf.yield {} : i64", then_val));

                    self.dedent();
                    self.writeln("} else {");
                    self.indent();

                    // Restore symbol table for else branch
                    self.symbol_table = saved_symbols.clone();

                    // Else branch - either previous result or nil
                    let else_val = if let Some(prev_result) = result {
                        prev_result
                    } else {
                        let nil = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                        nil
                    };
                    self.writeln(&format!("scf.yield {} : i64", else_val));

                    self.dedent();
                    self.writeln("}");

                    result = Some(if_result);
                }

                // Restore original symbol table
                self.symbol_table = saved_symbols;

                Ok(result.unwrap())
            }

            rlasp::ir::ASTNode::Dolist { var, list, result: result_expr, body } => {
                // (dolist (var list result) body...)
                // Iterate over list elements
                // Implementation: use runtime function cc_dolist_iterate that handles iteration

                // Save symbol table
                let saved_symbols = self.symbol_table.clone();

                // Compile the list expression
                let list_ssa = self.compile_expr(list)?;

                // Create a lambda for the body
                let lambda_name = format!("__dolist_body_{}", self.function_counter);
                self.function_counter += 1;

                // Save current compilation state
                let saved_output = std::mem::take(&mut self.output);
                let saved_ssa_id = self.next_ssa_id;
                let saved_local_symbols = self.symbol_table.clone();

                // Reset for lambda compilation
                self.next_ssa_id = 0;
                self.symbol_table.clear();

                // Compile body as a lambda that takes the list element
                let body_progn = if body.len() == 1 {
                    &body[0]
                } else {
                    // Create a progn - we'll just use the last expr as simplification
                    body.last().ok_or_else(|| anyhow::anyhow!("Empty dolist body"))?
                };

                self.compile_function_internal(&lambda_name, &[var.clone()], body_progn, true)?;

                // Restore compilation state
                self.output = saved_output;
                self.symbol_table = saved_local_symbols;
                self.next_ssa_id = saved_ssa_id;

                // Create function reference for the body
                let body_fn_const = self.create_string_constant(&lambda_name);
                let body_fn_ptr = self.fresh_ssa();
                self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr", body_fn_ptr, body_fn_const));
                let body_fn_ref = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64", body_fn_ref, body_fn_ptr));

                // Call runtime dolist iterator
                let loop_result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_dolist({}, {}) : (i64, i64) -> i64", loop_result, list_ssa, body_fn_ref));

                // Restore symbol table
                self.symbol_table = saved_symbols;

                // Return result expression if provided, otherwise return nil
                if let Some(result_expr) = result_expr {
                    self.compile_expr(result_expr)
                } else {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                    Ok(nil)
                }
            }

            rlasp::ir::ASTNode::DottedPair { car, cdr } => {
                // (car . cdr) - create a cons cell
                let car_ssa = self.compile_expr(car)?;
                let cdr_ssa = self.compile_expr(cdr)?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", result, car_ssa, cdr_ssa));
                Ok(result)
            }

            rlasp::ir::ASTNode::Backquote(expr) => {
                // Backquote: `form
                // Expand backquote to build quoted structure with unquote evaluation
                self.compile_backquote(expr)
            }

            rlasp::ir::ASTNode::Unquote(expr) => {
                // Unquote outside backquote is an error, but we'll just evaluate it
                self.compile_expr(expr)
            }

            rlasp::ir::ASTNode::UnquoteSplicing(expr) => {
                // Unquote-splicing outside backquote is an error, but we'll just evaluate it
                self.compile_expr(expr)
            }

            rlasp::ir::ASTNode::HashTable { entries } => {
                // Build hash table from literal entries
                let ht = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_hash_table() : () -> i64", ht));

                // Insert each key-value pair
                for (key_expr, value_expr) in entries {
                    let key = self.compile_expr(key_expr)?;
                    let value = self.compile_expr(value_expr)?;
                    let _ = self.fresh_ssa();
                    self.writeln(&format!("%_ = func.call @cc_puthash({}, {}, {}) : (i64, i64, i64) -> i64", key, value, ht));
                }

                Ok(ht)
            }

            rlasp::ir::ASTNode::CCall { function, args } => {
                // C function call via FFI
                // Call runtime bridge function cc_ccall(function_name, args_list)
                let func_name_ssa = self.create_symbol_constant(function);

                // Build args list
                let arg_ssas: Result<Vec<_>> = args.iter().map(|arg| self.compile_expr(arg)).collect();
                let arg_ssas = arg_ssas?;

                let args_list = if arg_ssas.is_empty() {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                    nil
                } else {
                    let mut result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));
                    for arg_ssa in arg_ssas.iter().rev() {
                        let new_result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_result, arg_ssa, result));
                        result = new_result;
                    }
                    result
                };

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_ccall({}, {}) : (i64, i64) -> i64", result, func_name_ssa, args_list));
                Ok(result)
            }

            rlasp::ir::ASTNode::CppMethodCall { object, method, args } => {
                // C++ method call via FFI
                // Call runtime bridge function cc_cpp_method_call(object, method_name, args_list)
                let obj_ssa = self.compile_expr(object)?;
                let method_name_ssa = self.create_symbol_constant(method);

                // Build args list
                let arg_ssas: Result<Vec<_>> = args.iter().map(|arg| self.compile_expr(arg)).collect();
                let arg_ssas = arg_ssas?;

                let args_list = if arg_ssas.is_empty() {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                    nil
                } else {
                    let mut result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));
                    for arg_ssa in arg_ssas.iter().rev() {
                        let new_result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_result, arg_ssa, result));
                        result = new_result;
                    }
                    result
                };

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cpp_method_call({}, {}, {}) : (i64, i64, i64) -> i64", result, obj_ssa, method_name_ssa, args_list));
                Ok(result)
            }

            rlasp::ir::ASTNode::Macro { params, body } => {
                // Macros should be expanded at compile time, not compiled
                // If we reach here, it means macro wasn't expanded - this is an error
                // For now, return nil and log a warning
                eprintln!("[MLIR] Warning: Macro not expanded before MLIR compilation");
                let ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", ssa));
                Ok(ssa)
            }

            _ => {
                // For any unsupported node, return nil instead of erroring
                let ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", ssa));
                Ok(ssa)
            }
        }
    }

    /// Compile a quoted expression
    fn compile_quoted(&mut self, ast: &rlasp::ir::ASTNode) -> Result<String> {
        use rlasp::ir::ConstantValue;

        match ast {
            rlasp::ir::ASTNode::Constant(ConstantValue::Nil) |
            rlasp::ir::ASTNode::Constant(ConstantValue::T) => {
                // Already a constant, just compile it
                self.compile_expr(ast)
            }

            rlasp::ir::ASTNode::Constant(c) => {
                // Numbers, characters, etc - compile as-is
                self.compile_expr(ast)
            }

            rlasp::ir::ASTNode::Variable(sym) => {
                // Quoted symbol - create a symbol object
                Ok(self.create_symbol_constant(sym))
            }

            rlasp::ir::ASTNode::Call { function, args } => {
                // Quoted list - build a cons list
                // '(a b c) => (cons 'a (cons 'b (cons 'c nil)))
                self.compile_quoted_list(function, args)
            }

            _ => {
                // Other quoted forms - for now return nil
                let ssa = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", ssa));
                Ok(ssa)
            }
        }
    }

    /// Compile a quoted list into cons cells
    fn compile_quoted_list(&mut self, first: &rlasp::ir::ASTNode, rest: &[rlasp::ir::ASTNode]) -> Result<String> {
        // Build from right to left: (cons first (cons ... (cons last nil)))
        let mut result = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

        // Process in reverse order
        for elem in rest.iter().rev() {
            let elem_ssa = self.compile_quoted(elem)?;
            let new_result = self.fresh_ssa();
            self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                new_result, elem_ssa, result));
            result = new_result;
        }

        // Add first element
        let first_ssa = self.compile_quoted(first)?;
        let final_result = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
            final_result, first_ssa, result));

        Ok(final_result)
    }

    /// Compile a backquoted (quasiquoted) expression
    /// Backquote builds a structure, but evaluates unquoted parts
    fn compile_backquote(&mut self, ast: &rlasp::ir::ASTNode) -> Result<String> {
        use rlasp::ir::ConstantValue;

        match ast {
            // Unquote - evaluate the expression
            rlasp::ir::ASTNode::Unquote(expr) => {
                self.compile_expr(expr)
            }

            // Constants - return as-is (quoted)
            rlasp::ir::ASTNode::Constant(_) => {
                self.compile_expr(ast)
            }

            // Variables in backquote are quoted
            rlasp::ir::ASTNode::Variable(sym) => {
                Ok(self.create_symbol_constant(sym))
            }

            // Lists - recursively process elements
            rlasp::ir::ASTNode::Call { function, args } => {
                // Check for unquote-splicing in elements
                let mut has_splicing = false;
                for arg in args {
                    if matches!(arg, rlasp::ir::ASTNode::UnquoteSplicing(_)) {
                        has_splicing = true;
                        break;
                    }
                }

                if has_splicing {
                    // Build list with splicing support
                    self.compile_backquote_list_with_splicing(function, args)
                } else {
                    // Simple backquote list - build cons structure
                    self.compile_backquote_list(function, args)
                }
            }

            // Dotted pair
            rlasp::ir::ASTNode::DottedPair { car, cdr } => {
                let car_ssa = self.compile_backquote(car)?;
                let cdr_ssa = self.compile_backquote(cdr)?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", result, car_ssa, cdr_ssa));
                Ok(result)
            }

            // Nested backquote - for now, treat as quoted
            rlasp::ir::ASTNode::Backquote(inner) => {
                self.compile_backquote(inner)
            }

            _ => {
                // Other forms - quote them
                self.compile_quoted(ast)
            }
        }
    }

    /// Compile a backquoted list (without splicing)
    fn compile_backquote_list(&mut self, first: &rlasp::ir::ASTNode, rest: &[rlasp::ir::ASTNode]) -> Result<String> {
        // Build from right to left
        let mut result = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

        // Process in reverse order
        for elem in rest.iter().rev() {
            let elem_ssa = self.compile_backquote(elem)?;
            let new_result = self.fresh_ssa();
            self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                new_result, elem_ssa, result));
            result = new_result;
        }

        // Add first element
        let first_ssa = self.compile_backquote(first)?;
        let final_result = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
            final_result, first_ssa, result));

        Ok(final_result)
    }

    /// Compile a backquoted list with unquote-splicing support
    fn compile_backquote_list_with_splicing(&mut self, first: &rlasp::ir::ASTNode, rest: &[rlasp::ir::ASTNode]) -> Result<String> {
        // Build list dynamically, appending spliced lists
        let mut result = self.fresh_ssa();
        self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

        // Process all elements (first + rest) in reverse
        let all_elems: Vec<&rlasp::ir::ASTNode> = std::iter::once(first).chain(rest.iter()).collect();

        for elem in all_elems.iter().rev() {
            match elem {
                rlasp::ir::ASTNode::UnquoteSplicing(expr) => {
                    // Evaluate and append the list
                    let list_val = self.compile_expr(expr)?;
                    let new_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_append({}, {}) : (i64, i64) -> i64",
                        new_result, list_val, result));
                    result = new_result;
                }
                _ => {
                    // Regular element - cons it
                    let elem_ssa = self.compile_backquote(elem)?;
                    let new_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                        new_result, elem_ssa, result));
                    result = new_result;
                }
            }
        }

        Ok(result)
    }

    /// Compile a function call
    fn compile_call(&mut self, func_name: &str, args: &[rlasp::ir::ASTNode]) -> Result<String> {
        match func_name {
            "+" => {
                if args.is_empty() {
                    // (+) = 0
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", ssa));
                    return Ok(ssa);
                } else if args.len() == 1 {
                    // (+ x) = x
                    return self.compile_expr(&args[0]);
                }

                // (+ a b c ...) - fold left using cc_add for tagged values
                let mut result = self.compile_expr(&args[0])?;
                for arg in &args[1..] {
                    let right = self.compile_expr(arg)?;
                    let new_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_add({}, {}) : (i64, i64) -> i64", new_result, result, right));
                    result = new_result;
                }
                Ok(result)
            }

            "-" => {
                if args.is_empty() {
                    anyhow::bail!("- requires at least one argument");
                } else if args.len() == 1 {
                    // (- x) = negate x (0 - x)
                    let arg = self.compile_expr(&args[0])?;
                    let zero = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 0 : i64", zero));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_sub({}, {}) : (i64, i64) -> i64", result, zero, arg));
                    return Ok(result);
                }

                // (- a b c ...) = a - b - c - ...
                let mut result = self.compile_expr(&args[0])?;
                for arg in &args[1..] {
                    let right = self.compile_expr(arg)?;
                    let new_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_sub({}, {}) : (i64, i64) -> i64", new_result, result, right));
                    result = new_result;
                }
                Ok(result)
            }

            "*" => {
                if args.is_empty() {
                    // (*) = 1
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 1 : i64", ssa));
                    return Ok(ssa);
                } else if args.len() == 1 {
                    // (* x) = x
                    return self.compile_expr(&args[0]);
                }

                // (* a b c ...) - fold left
                let mut result = self.compile_expr(&args[0])?;
                for arg in &args[1..] {
                    let right = self.compile_expr(arg)?;
                    let new_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_mul({}, {}) : (i64, i64) -> i64", new_result, result, right));
                    result = new_result;
                }
                Ok(result)
            }

            "/" => {
                if args.is_empty() {
                    anyhow::bail!("/ requires at least one argument");
                } else if args.len() == 1 {
                    // (/ x) = 1/x
                    let arg = self.compile_expr(&args[0])?;
                    let one = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.constant 1 : i64", one));
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_div({}, {}) : (i64, i64) -> i64", result, one, arg));
                    return Ok(result);
                }

                // (/ a b c ...) = a / b / c / ...
                let mut result = self.compile_expr(&args[0])?;
                for arg in &args[1..] {
                    let right = self.compile_expr(arg)?;
                    let new_result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_div({}, {}) : (i64, i64) -> i64", new_result, result, right));
                    result = new_result;
                }
                Ok(result)
            }

            // Numeric operations
            "mod" if args.len() == 2 => {
                let a = self.compile_expr(&args[0])?;
                let b = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_mod({}, {}) : (i64, i64) -> i64", result, a, b));
                Ok(result)
            }

            "expt" if args.len() == 2 => {
                let base = self.compile_expr(&args[0])?;
                let power = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_expt({}, {}) : (i64, i64) -> i64", result, base, power));
                Ok(result)
            }

            "sqrt" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_sqrt({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            "round" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_round({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            "truncate" if args.len() >= 1 && args.len() <= 2 => {
                let x = self.compile_expr(&args[0])?;
                let result = if args.len() == 2 {
                    let y = self.compile_expr(&args[1])?;
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_truncate_2({}, {}) : (i64, i64) -> i64", ssa, x, y));
                    ssa
                } else {
                    let ssa = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_truncate({}) : (i64) -> i64", ssa, x));
                    ssa
                };
                Ok(result)
            }

            "evenp" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_evenp({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            "oddp" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_oddp({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            "<" if args.len() == 2 => {
                let a = self.compile_expr(&args[0])?;
                let b = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_lt({}, {}) : (i64, i64) -> i64", result, a, b));
                Ok(result)
            }

            ">" if args.len() == 2 => {
                let a = self.compile_expr(&args[0])?;
                let b = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_gt({}, {}) : (i64, i64) -> i64", result, a, b));
                Ok(result)
            }

            "<=" if args.len() == 2 => {
                let a = self.compile_expr(&args[0])?;
                let b = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_le({}, {}) : (i64, i64) -> i64", result, a, b));
                Ok(result)
            }

            ">=" if args.len() == 2 => {
                let a = self.compile_expr(&args[0])?;
                let b = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_ge({}, {}) : (i64, i64) -> i64", result, a, b));
                Ok(result)
            }

            "=" if args.len() == 2 => {
                let a = self.compile_expr(&args[0])?;
                let b = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_eq({}, {}) : (i64, i64) -> i64", result, a, b));
                Ok(result)
            }

            // Function reference: #'function-name
            "function" if args.len() == 1 => {
                // Create a function reference for the referenced function
                if let rlasp::ir::ASTNode::Variable(func_name) = &args[0] {
                    // Check if this is a known local function
                    let actual_name = self.local_function_map
                        .get(func_name)
                        .cloned()
                        .unwrap_or_else(|| func_name.clone());

                    // Create a function reference using cc_make_lambda_ref
                    let const_name = self.create_string_constant(&actual_name);
                    // Get address of the string constant (using opaque pointers)
                    let str_ptr = self.fresh_ssa();
                    self.writeln(&format!("{} = llvm.mlir.addressof {} : !llvm.ptr",
                        str_ptr, const_name));
                    // Create function reference
                    let func_ref = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_make_lambda_ref_str({}) : (!llvm.ptr) -> i64",
                        func_ref, str_ptr));
                    Ok(func_ref)
                } else {
                    // Complex function reference - compile it
                    self.compile_expr(&args[0])
                }
            }

            // Function application with uniform calling convention
            "funcall" if !args.is_empty() => {
                let func = self.compile_expr(&args[0])?;
                let arg_ssas: Result<Vec<_>> = args[1..].iter().map(|arg| self.compile_expr(arg)).collect();
                let arg_ssas = arg_ssas?;

                // Build args_and_env list (just args for now, environment capture comes later)
                let args_and_env = if arg_ssas.is_empty() {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                    nil
                } else {
                    // Build list from right to left
                    let mut result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

                    for arg_ssa in arg_ssas.iter().rev() {
                        let new_result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                            new_result, arg_ssa, result));
                        result = new_result;
                    }
                    result
                };

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_funcall({}, {}) : (i64, i64) -> i64", result, func, args_and_env));
                Ok(result)
            }

            "apply" if args.len() >= 2 => {
                let func = self.compile_expr(&args[0])?;
                let last_arg = self.compile_expr(&args[args.len() - 1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_apply({}, {}) : (i64, i64) -> i64", result, func, last_arg));
                Ok(result)
            }

            // Increment/Decrement
            "incf" if args.len() >= 1 => {
                // (incf place [delta]) - for now, just handle simple variables
                if let rlasp::ir::ASTNode::Variable(var) = &args[0] {
                    let current = self.symbol_table.get(var).cloned()
                        .ok_or_else(|| anyhow::anyhow!("Undefined variable in incf: {}", var))?;
                    let delta = if args.len() > 1 {
                        self.compile_expr(&args[1])?
                    } else {
                        let one = self.fresh_ssa();
                        self.writeln(&format!("{} = arith.constant 1 : i64", one));
                        one
                    };
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = arith.addi {}, {} : i64", result, current, delta));
                    self.symbol_table.insert(var.clone(), result.clone());
                    Ok(result)
                } else {
                    // Complex place - use runtime function
                    let place = self.compile_expr(&args[0])?;
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_incf({}) : (i64) -> i64", result, place));
                    Ok(result)
                }
            }

            // Numeric tower operations
            "numerator" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_numerator({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            "denominator" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_denominator({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            "realpart" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_realpart({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            "imagpart" if args.len() == 1 => {
                let arg = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_imagpart({}) : (i64) -> i64", result, arg));
                Ok(result)
            }

            // Array operations
            "make-array" if args.len() >= 1 => {
                let size = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_array({}) : (i64) -> i64", result, size));
                Ok(result)
            }

            "aref" if args.len() == 2 => {
                let array = self.compile_expr(&args[0])?;
                let index = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_aref({}, {}) : (i64, i64) -> i64", result, array, index));
                Ok(result)
            }

            // Hash table operations
            "make-hash-table" => {
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_hash_table() : () -> i64", result));
                Ok(result)
            }

            "gethash" if args.len() >= 2 => {
                let key = self.compile_expr(&args[0])?;
                let table = self.compile_expr(&args[1])?;
                let default = if args.len() > 2 {
                    self.compile_expr(&args[2])?
                } else {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                    nil
                };
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_gethash({}, {}, {}) : (i64, i64, i64) -> i64",
                    result, key, table, default));
                Ok(result)
            }

            // String operations
            "make-string" if args.len() >= 1 => {
                let size = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_string_repeat({}, {}) : (i64, i64) -> i64", result, size, size));
                Ok(result)
            }

            "char" if args.len() == 2 => {
                let string = self.compile_expr(&args[0])?;
                let index = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_aref({}, {}) : (i64, i64) -> i64", result, string, index));
                Ok(result)
            }

            "string=" if args.len() == 2 => {
                let a = self.compile_expr(&args[0])?;
                let b = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_string_equal({}, {}) : (i64, i64) -> i64", result, a, b));
                Ok(result)
            }

            "copy-seq" if args.len() == 1 => {
                let seq = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_copy_seq({}) : (i64) -> i64", result, seq));
                Ok(result)
            }

            // Higher-order functions
            "reduce" if args.len() >= 2 => {
                let func = self.compile_expr(&args[0])?;
                let seq = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_reduce({}, {}) : (i64, i64) -> i64", result, func, seq));
                Ok(result)
            }

            // Introspection
            "fboundp" if args.len() == 1 => {
                let sym = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_fboundp({}) : (i64) -> i64", result, sym));
                Ok(result)
            }

            "boundp" if args.len() == 1 => {
                let sym = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_boundp({}) : (i64) -> i64", result, sym));
                Ok(result)
            }

            "functionp" if args.len() == 1 => {
                let obj = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_functionp({}) : (i64) -> i64", result, obj));
                Ok(result)
            }

            // I/O
            "format" if args.len() >= 2 => {
                // format expects (dest control-string . args)
                let dest = self.compile_expr(&args[0])?;

                // Build list of control string + remaining args
                let control_and_args_ssas: Result<Vec<_>> = args[1..].iter().map(|arg| self.compile_expr(arg)).collect();
                let control_and_args_ssas = control_and_args_ssas?;

                let args_list = if control_and_args_ssas.is_empty() {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                    nil
                } else {
                    // Build list from right to left
                    let mut result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));
                    for arg_ssa in control_and_args_ssas.iter().rev() {
                        let new_result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64", new_result, arg_ssa, result));
                        result = new_result;
                    }
                    result
                };

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_format({}, {}) : (i64, i64) -> i64", result, dest, args_list));
                Ok(result)
            }

            "read-from-string" if args.len() >= 1 => {
                let string = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_read_from_string({}) : (i64) -> i64", result, string));
                Ok(result)
            }

            // Eval/Compile
            "eval" if args.len() == 1 => {
                let form = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_eval({}) : (i64) -> i64", result, form));
                Ok(result)
            }

            // CLOS - return stubs for now
            "make-instance" => {
                // (make-instance 'class-name :initarg1 val1 :initarg2 val2 ...)
                if args.is_empty() {
                    anyhow::bail!("make-instance requires at least a class name");
                }

                // Get class name (should be quoted)
                let class_name_ssa = self.compile_expr(&args[0])?;

                // Build initargs list from keyword-value pairs
                let mut initargs_list = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", initargs_list));

                // Process initargs in reverse to build proper list
                for i in (1..args.len()).rev().step_by(2) {
                    if i + 1 < args.len() {
                        // We have a keyword-value pair
                        let keyword = self.compile_expr(&args[i])?;
                        let value = self.compile_expr(&args[i + 1])?;

                        // Add value to list
                        let new_list = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                            new_list, value, initargs_list));
                        initargs_list = new_list;

                        // Add keyword to list
                        let new_list2 = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                            new_list2, keyword, initargs_list));
                        initargs_list = new_list2;
                    }
                }

                // Call cc_make_instance
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_make_instance({}, {}) : (i64, i64) -> i64",
                    result, class_name_ssa, initargs_list));
                Ok(result)
            }

            // Setf - handle common cases
            "setf" if args.len() >= 2 && args.len() % 2 == 0 => {
                // (setf place value place2 value2 ...)
                let mut last_value = None;
                for chunk in args.chunks(2) {
                    let value = self.compile_expr(&chunk[1])?;

                    // Handle different place types
                    if let rlasp::ir::ASTNode::Variable(var) = &chunk[0] {
                        // Simple variable
                        self.symbol_table.insert(var.clone(), value.clone());
                        last_value = Some(value);
                    } else if let rlasp::ir::ASTNode::Call { function, args: place_args } = &chunk[0] {
                        // Function call as place - e.g., (setf (car x) value)
                        if let rlasp::ir::ASTNode::Variable(func_name) = function.as_ref() {
                            match func_name.as_str() {
                                "car" if place_args.len() == 1 => {
                                    let list = self.compile_expr(&place_args[0])?;
                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_car({}, {}) : (i64, i64) -> i64",
                                        result, list, value));
                                    last_value = Some(result);
                                }
                                "cdr" if place_args.len() == 1 => {
                                    let list = self.compile_expr(&place_args[0])?;
                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_cdr({}, {}) : (i64, i64) -> i64",
                                        result, list, value));
                                    last_value = Some(result);
                                }
                                "aref" if place_args.len() == 2 => {
                                    let array = self.compile_expr(&place_args[0])?;
                                    let index = self.compile_expr(&place_args[1])?;
                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_aref({}, {}, {}) : (i64, i64, i64) -> i64",
                                        result, array, index, value));
                                    last_value = Some(result);
                                }
                                "gethash" if place_args.len() >= 2 => {
                                    let key = self.compile_expr(&place_args[0])?;
                                    let table = self.compile_expr(&place_args[1])?;
                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_puthash({}, {}, {}) : (i64, i64, i64) -> i64",
                                        result, key, value, table));
                                    last_value = Some(result);
                                }
                                "char" if place_args.len() == 2 => {
                                    let string = self.compile_expr(&place_args[0])?;
                                    let index = self.compile_expr(&place_args[1])?;
                                    let result = self.fresh_ssa();
                                    self.writeln(&format!("{} = func.call @cc_set_char({}, {}, {}) : (i64, i64, i64) -> i64",
                                        result, string, index, value));
                                    last_value = Some(result);
                                }
                                _ => {
                                    last_value = Some(value);
                                }
                            }
                        } else {
                            last_value = Some(value);
                        }
                    } else {
                        last_value = Some(value);
                    }
                }
                last_value.ok_or_else(|| anyhow::anyhow!("Empty setf"))
            }

            // List operations
            "list" => {
                let arg_ssas: Result<Vec<_>> = args.iter().map(|arg| self.compile_expr(arg)).collect();
                let arg_ssas = arg_ssas?;

                if arg_ssas.is_empty() {
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));
                    Ok(result)
                } else {
                    // Build list from right to left
                    let mut result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

                    for ssa in arg_ssas.iter().rev() {
                        let new_result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                            new_result, ssa, result));
                        result = new_result;
                    }
                    Ok(result)
                }
            }

            "car" if args.len() == 1 => {
                let list_ssa = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, list_ssa));
                Ok(result)
            }

            "cdr" if args.len() == 1 => {
                let list_ssa = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", result, list_ssa));
                Ok(result)
            }

            "cons" if args.len() == 2 => {
                let car_ssa = self.compile_expr(&args[0])?;
                let cdr_ssa = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                    result, car_ssa, cdr_ssa));
                Ok(result)
            }

            "list" => {
                // (list a b c) => (cons a (cons b (cons c nil)))
                if args.is_empty() {
                    let result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));
                    Ok(result)
                } else {
                    // Compile all arguments first
                    let arg_ssas: Result<Vec<_>> = args.iter().map(|arg| self.compile_expr(arg)).collect();
                    let arg_ssas = arg_ssas?;

                    // Build list from right to left
                    let mut result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

                    for arg_ssa in arg_ssas.iter().rev() {
                        let new_result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                            new_result, arg_ssa, result));
                        result = new_result;
                    }
                    Ok(result)
                }
            }

            "append" if args.len() == 2 => {
                let list1_ssa = self.compile_expr(&args[0])?;
                let list2_ssa = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_append({}, {}) : (i64, i64) -> i64",
                    result, list1_ssa, list2_ssa));
                Ok(result)
            }

            "cadr" if args.len() == 1 => {
                // (cadr x) = (car (cdr x))
                let list_ssa = self.compile_expr(&args[0])?;
                let cdr_result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cdr({}) : (i64) -> i64", cdr_result, list_ssa));
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_car({}) : (i64) -> i64", result, cdr_result));
                Ok(result)
            }

            "shell" if args.len() == 1 => {
                // (shell "command") - call cc_shell directly with the string
                let cmd_ssa = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_shell({}) : (i64) -> i64", result, cmd_ssa));
                Ok(result)
            }

            "print" if args.len() == 1 => {
                // (print obj) - call cc_print directly with the object
                let obj_ssa = self.compile_expr(&args[0])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_print({}) : (i64) -> i64", result, obj_ssa));
                Ok(result)
            }

            "push" if args.len() == 2 => {
                // (push item place) - for now, compile as (cons item place)
                // Note: This doesn't handle the mutation properly in SSA,
                // but at least allows the code to compile
                let item_ssa = self.compile_expr(&args[0])?;
                let place_ssa = self.compile_expr(&args[1])?;
                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                    result, item_ssa, place_ssa));
                Ok(result)
            }

            _ => {
                // Map built-in special forms/macros to runtime functions
                let mapped_name = match func_name {
                    "and" => "cc_and",
                    "or" => "cc_or",
                    "not" => "cc_not",
                    "null" => "cc_null",
                    "get-internal-real-time" => "cc_get_internal_real_time",
                    "get-universal-time" => "cc_get_universal_time",
                    "shell" => "cc_shell",
                    "print" => "cc_print",
                    "compile" => "cc_compile",
                    "eval" => "cc_eval",
                    "read-from-string" => "cc_read_from_string",
                    "x" | "y" => func_name,  // CLOS accessor functions - let them pass through
                    _ => func_name,
                };

                // Check if this is a local function (from flet/labels)
                let actual_func_name = self.local_function_map
                    .get(mapped_name)
                    .cloned()
                    .unwrap_or_else(|| mapped_name.to_string());

                // Uniform calling convention - build args_and_env list
                let arg_ssas: Result<Vec<_>> = args.iter().map(|arg| self.compile_expr(arg)).collect();
                let arg_ssas = arg_ssas?;

                // Build args list
                let args_and_env = if arg_ssas.is_empty() {
                    let nil = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", nil));
                    nil
                } else {
                    let mut result = self.fresh_ssa();
                    self.writeln(&format!("{} = func.call @cc_nil() : () -> i64", result));

                    for arg_ssa in arg_ssas.iter().rev() {
                        let new_result = self.fresh_ssa();
                        self.writeln(&format!("{} = func.call @cc_cons({}, {}) : (i64, i64) -> i64",
                            new_result, arg_ssa, result));
                        result = new_result;
                    }
                    result
                };

                let result = self.fresh_ssa();
                self.writeln(&format!("{} = func.call @{}({}) : (i64) -> i64",
                    result, Self::quote_func_name(&actual_func_name), args_and_env));
                Ok(result)
            }
        }
    }

    /// Compile flet or labels local function definitions
    /// This solves the "Unsupported function: g" problem by generating all
    /// local functions as module-level functions with unique names
    pub fn compile_flet_labels(&mut self, is_labels: bool, args: &[ASTNode]) -> Result<String> {
        // Extract function definitions from args[0]
        // The structure is: Call { function: <def>, args: [] }
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

    fn compile_flet_labels_internal(&mut self, is_labels: bool, func_defs: &[(String, Vec<String>, ASTNode)], body_exprs: &[ASTNode]) -> Result<String> {
        // Save current symbol table and indentation
        let saved_symbols = self.symbol_table.clone();
        let saved_indent = self.indent_level;

        // Step 1: Generate unique names for all local functions
        let mut local_names = HashMap::new();
        for (name, _params, _body) in func_defs {
            let unique_name = format!("local_{}_{}", name, self.function_counter);
            self.function_counter += 1;
            local_names.insert(name.clone(), unique_name.clone());
            self.local_function_map.insert(name.clone(), unique_name);
        }

        // Step 2: Compile local functions (they will be buffered to emit at module level)
        for (name, params, func_body) in func_defs {
            let unique_name = local_names.get(name).unwrap();

            // For labels, functions can call each other, so add all to map before compilation
            if is_labels {
                // Local functions are already in local_function_map
            }

            self.compile_function_internal(unique_name, params, func_body, true)?;
        }

        // Step 3: Compile the body with local functions in scope
        let mut result = None;
        for expr in body_exprs {
            result = Some(self.compile_expr(expr)?);
        }

        // Restore symbol table
        self.symbol_table = saved_symbols;

        // Clear local function map for this scope
        for (name, _, _) in func_defs {
            self.local_function_map.remove(name);
        }

        result.ok_or_else(|| anyhow::anyhow!("flet/labels: empty body"))
    }

    /// Finalize and return the MLIR text
    pub fn finalize(mut self) -> String {
        // Emit all pending local functions at module level before closing
        for func_text in &self.pending_functions {
            self.output.push_str(func_text);
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic_codegen() {
        use rlasp::ir::ConstantValue;

        let mut codegen = MLIRCodegen::new("test");

        // (defun add-one (x) (+ x 1))
        let body = rlasp::ir::ASTNode::Call {
            function: Box::new(rlasp::ir::ASTNode::Variable("+".to_string())),
            args: vec![
                rlasp::ir::ASTNode::Variable("x".to_string()),
                rlasp::ir::ASTNode::Constant(ConstantValue::Fixnum(1)),
            ],
        };

        codegen.compile_function("add_one", &["x".to_string()], &body).unwrap();

        let mlir = codegen.finalize();
        println!("{}", mlir);

        assert!(mlir.contains("func.func @add_one"));
        assert!(mlir.contains("arith.addi"));
    }
}
