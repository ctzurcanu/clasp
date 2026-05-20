/// AST → IR lowering
///
/// Converts AST nodes to BIR (Basic IR) instructions and blocks
use super::ast::ASTNode;
use super::datum::{ConstantValue, DatumId};
use super::iblock::IBlockId;
use super::instruction::InstructionKind;
use super::module::Module;
use std::collections::HashMap;

/// Context for lowering AST to IR
pub struct LowerContext {
    /// IR module being built
    pub module: Module,
    /// Current function being lowered
    pub current_function: Option<usize>,
    /// Current block being built
    pub current_block: Option<IBlockId>,
    /// Variable environment (name → datum ID)
    pub env: HashMap<String, DatumId>,
}

impl LowerContext {
    pub fn new() -> Self {
        Self {
            module: Module::new(),
            current_function: None,
            current_block: None,
            env: HashMap::new(),
        }
    }

    /// Lower an AST node to IR, returning the datum representing its value
    pub fn lower_ast(&mut self, ast: &ASTNode) -> Result<DatumId, String> {
        match ast {
            ASTNode::Constant(c) => {
                // Create constant datum
                Ok(self.module.make_constant(c.clone()))
            }

            ASTNode::Variable(name) => {
                // Look up variable in environment
                self.env
                    .get(name)
                    .copied()
                    .ok_or_else(|| format!("Undefined variable: {}", name))
            }

            ASTNode::If {
                test,
                then_branch,
                else_branch,
            } => self.lower_if(test, then_branch, else_branch),

            ASTNode::Cond { clauses } => {
                // Lower cond to nested if expressions
                // (cond (test1 result1) (test2 result2) ...)
                // => (if test1 result1 (if test2 result2 ... nil))
                if clauses.is_empty() {
                    return Ok(self.module.make_constant(ConstantValue::Nil));
                }

                // Build nested ifs from the last clause to the first
                let mut current = ASTNode::nil(); // Default to nil if no clause matches

                for (test, result) in clauses.iter().rev() {
                    current = ASTNode::if_then_else(test.clone(), result.clone(), current);
                }

                self.lower_ast(&current)
            }

            ASTNode::Call { function, args } => self.lower_call(function, args),

            ASTNode::Lambda { params, body, .. } => self.lower_lambda(params, body),

            ASTNode::Macro { params, body } => {
                // For now, treat macros like lambdas in the IR
                // They should have been expanded before lowering, but if not, treat as lambda
                let param_vec = ast_params_to_vec(params);
                self.lower_lambda(&param_vec, body)
            }

            ASTNode::Dotimes { .. } => {
                // Dotimes not supported in BIR lowering yet
                // Return nil constant for now
                Ok(self.module.make_constant(ConstantValue::Nil))
            }

            ASTNode::Dolist { .. } => {
                // Dolist not supported in BIR lowering yet
                // Return nil constant for now
                Ok(self.module.make_constant(ConstantValue::Nil))
            }

            ASTNode::Loop { .. } => {
                // Loop not supported in BIR lowering yet
                // Return nil constant for now
                Ok(self.module.make_constant(ConstantValue::Nil))
            }

            ASTNode::Let { bindings, body } => self.lower_let(bindings, body),

            ASTNode::LetStar { bindings, body } => self.lower_let(bindings, body),

            ASTNode::Setq { var, value } => self.lower_setq(var, value),

            ASTNode::Progn { exprs } => self.lower_progn(exprs),

            ASTNode::Block { name, body } => self.lower_block(name, body),

            ASTNode::ReturnFrom { block_name, value } => self.lower_return_from(block_name, value),

            ASTNode::Quote(form) => {
                // For now, just return the form as a constant
                // In a real implementation, this would create a quoted data structure
                self.lower_ast(form)
            }

            ASTNode::DottedPair { .. } => {
                // Dotted pairs should only appear in quoted contexts
                // They are handled during evaluation, not during lowering
                Err("Dotted pairs should only appear in quoted contexts and are handled during evaluation".to_string())
            }

            ASTNode::Backquote(_) | ASTNode::Unquote(_) | ASTNode::UnquoteSplicing(_) => {
                // These should be expanded during evaluation, not during lowering
                // If we encounter them here, it's an error
                Err("Backquote forms should be expanded before lowering".to_string())
            }

            ASTNode::CCall {
                function: _,
                args: _,
            } => {
                // Create FFI call instruction
                let output = self.module.make_output();
                // TODO: lower args and create CCall instruction
                Ok(output)
            }

            ASTNode::CppMethodCall {
                object: _,
                method: _,
                args: _,
            } => {
                // Create C++ method call instruction
                let output = self.module.make_output();
                // TODO: lower object, args and create CppMethodCall instruction
                Ok(output)
            }

            ASTNode::HashTable { entries: _ } => {
                // Create hash table constant
                // For now, just create a nil constant
                // TODO: implement proper hash table lowering
                Ok(self.module.make_constant(ConstantValue::Nil))
            }

            ASTNode::Vector(elements) => {
                // For BIR lowering, vectors are not directly supported
                // The interpreter handles vectors via eval_core.rs
                // For JIT, they're handled via MLIR codegen
                // Here we just lower the elements and return a placeholder
                for elem in elements {
                    let _ = self.lower_ast(elem)?;
                }
                // Return nil as placeholder - actual vector creation happens at runtime
                Ok(self.module.make_constant(ConstantValue::Nil))
            }

            ASTNode::ArrayLiteral { elements, .. } => {
                for elem in elements {
                    let _ = self.lower_ast(elem)?;
                }
                Ok(self.module.make_constant(ConstantValue::Nil))
            }

            // CLOS nodes - handled by MLIR codegen, not interpreter
            ASTNode::Defclass { .. } | ASTNode::Defgeneric { .. } | ASTNode::Defmethod { .. } => {
                // CLOS forms are lowered directly to MLIR, not through the IR interpreter
                Ok(self.module.make_constant(ConstantValue::Nil))
            }
        }
    }

    fn lower_if(
        &mut self,
        test: &ASTNode,
        then_branch: &ASTNode,
        else_branch: &ASTNode,
    ) -> Result<DatumId, String> {
        // Lower test expression
        let test_val = self.lower_ast(test)?;

        // Create blocks for then, else, and merge
        let then_block = self.module.make_block(Some("then".to_string()));
        let else_block = self.module.make_block(Some("else".to_string()));
        let merge_block = self.module.make_block(Some("merge".to_string()));

        // Emit conditional branch
        let current_block = self.current_block.ok_or("No current block")?;
        let branch_inst = self.module.make_instruction(
            InstructionKind::If {
                true_target: then_block.0,
                false_target: else_block.0,
            },
            vec![test_val],
            vec![],
        );
        self.module.get_block_mut(current_block).unwrap().end = Some(branch_inst);

        // Lower then branch
        self.current_block = Some(then_block);
        let then_val = self.lower_ast(then_branch)?;
        let then_jump = self.module.make_instruction(
            InstructionKind::Jump {
                target: merge_block.0,
            },
            vec![],
            vec![],
        );
        self.module.get_block_mut(then_block).unwrap().end = Some(then_jump);

        // Lower else branch
        self.current_block = Some(else_block);
        let else_val = self.lower_ast(else_branch)?;
        let else_jump = self.module.make_instruction(
            InstructionKind::Jump {
                target: merge_block.0,
            },
            vec![],
            vec![],
        );
        self.module.get_block_mut(else_block).unwrap().end = Some(else_jump);

        // Create phi node in merge block
        self.current_block = Some(merge_block);
        let phi_val = self.module.make_phi(vec![then_val, else_val]);

        Ok(phi_val)
    }

    fn lower_call(&mut self, function: &ASTNode, args: &[ASTNode]) -> Result<DatumId, String> {
        // Check for builtin operators
        if let ASTNode::Variable(name) = function {
            if let Some(result) = self.lower_builtin_call(name, args)? {
                return Ok(result);
            }
        }

        // Lower function expression
        // For variable references to unknown functions, create a runtime lookup
        let func_val = match function {
            ASTNode::Variable(name) => {
                if let Some(&existing) = self.env.get(name) {
                    existing
                } else {
                    // Unknown function - create a runtime symbol lookup
                    // For now, create a constant with the function name
                    self.module
                        .make_constant(ConstantValue::Symbol(name.clone()))
                }
            }
            other => self.lower_ast(other)?,
        };

        // Lower arguments
        let arg_vals: Result<Vec<_>, _> = args.iter().map(|arg| self.lower_ast(arg)).collect();
        let arg_vals = arg_vals?;

        // Create output for call result
        let output = self.module.make_output();

        // Create call instruction
        let mut inputs = vec![func_val];
        inputs.extend(arg_vals);

        let _call_inst = self.module.make_instruction(
            InstructionKind::Call { callee: func_val },
            inputs,
            vec![output],
        );

        Ok(output)
    }

    fn lower_builtin_call(
        &mut self,
        name: &str,
        args: &[ASTNode],
    ) -> Result<Option<DatumId>, String> {
        let kind = match name {
            // Arithmetic
            "+" => Some(InstructionKind::Add),
            "-" => Some(InstructionKind::Sub),
            "*" => Some(InstructionKind::Mul),
            "/" => Some(InstructionKind::Div),
            // Numeric comparisons
            "=" => Some(InstructionKind::NumEq),
            "/=" => Some(InstructionKind::NumNe),
            "<" => Some(InstructionKind::NumLt),
            "<=" => Some(InstructionKind::NumLe),
            ">" => Some(InstructionKind::NumGt),
            ">=" => Some(InstructionKind::NumGe),
            // Identity/equality comparisons
            "eq" => Some(InstructionKind::Eq),
            "eql" => Some(InstructionKind::Eql),
            "equal" => Some(InstructionKind::Equal),
            // List operations
            "car" => Some(InstructionKind::Car),
            "cdr" => Some(InstructionKind::Cdr),
            "cons" => Some(InstructionKind::Cons),
            _ => None,
        };

        if let Some(kind) = kind {
            // Lower arguments
            let arg_vals: Result<Vec<_>, _> = args.iter().map(|arg| self.lower_ast(arg)).collect();
            let arg_vals = arg_vals?;

            // Create output for result
            let output = self.module.make_output();

            // Create instruction
            let inst_id = self.module.make_instruction(kind, arg_vals, vec![output]);

            // Link instruction into current block
            if let Some(block_id) = self.current_block {
                let block = self.module.get_block(block_id).unwrap();
                let old_end = block.end;
                let needs_start = block.start.is_none();
                drop(block); // Release borrow

                if needs_start {
                    self.module.get_block_mut(block_id).unwrap().start = Some(inst_id);
                }

                // Link to previous instruction if there is one
                if let Some(end_inst) = old_end {
                    self.module.get_instruction_mut(end_inst).unwrap().next = Some(inst_id);
                }

                self.module.get_block_mut(block_id).unwrap().end = Some(inst_id);
            }

            Ok(Some(output))
        } else {
            Ok(None)
        }
    }

    fn lower_lambda(&mut self, params: &[String], body: &[ASTNode]) -> Result<DatumId, String> {
        // Create new function
        let func_id = self.module.make_function(Some("lambda".to_string()));
        let old_func = self.current_function.replace(func_id);
        let func = self.module.get_function(func_id).unwrap();
        let entry_block = func.entry;
        let old_block = self.current_block.replace(entry_block);

        // Save old environment
        let old_env = self.env.clone();

        // Create parameters
        for (i, param) in params.iter().enumerate() {
            let arg_datum = self.module.make_argument(i, Some(param.clone()));
            self.env.insert(param.clone(), arg_datum);
        }

        // Lower body
        let result = self.lower_progn(body)?;

        // Emit return
        let _ret_inst = self
            .module
            .make_instruction(InstructionKind::Return, vec![result], vec![]);

        // Restore context
        self.env = old_env;
        self.current_block = old_block;
        self.current_function = old_func;

        // Return function as a value
        // In a real implementation, this would create a closure object
        let func_datum = self
            .module
            .make_constant(ConstantValue::Fixnum(func_id as i64));
        Ok(func_datum)
    }

    fn lower_let(
        &mut self,
        bindings: &[(String, ASTNode)],
        body: &[ASTNode],
    ) -> Result<DatumId, String> {
        // Save old environment
        let old_env = self.env.clone();

        // Lower bindings
        for (name, value) in bindings {
            let val_datum = self.lower_ast(value)?;
            let var_datum = self.module.make_variable(Some(name.clone()));

            // Emit write instruction
            let _write_inst = self.module.make_instruction(
                InstructionKind::WriteVar { var_id: var_datum },
                vec![val_datum],
                vec![],
            );

            self.env.insert(name.clone(), var_datum);
        }

        // Lower body
        let result = self.lower_progn(body)?;

        // Restore environment
        self.env = old_env;

        Ok(result)
    }

    fn lower_setq(&mut self, var: &str, value: &ASTNode) -> Result<DatumId, String> {
        let val_datum = self.lower_ast(value)?;

        // Get or create variable datum
        let var_datum = if let Some(&existing) = self.env.get(var) {
            existing
        } else {
            // Create new variable (for top-level definitions like defun)
            let new_var = self.module.make_variable(Some(var.to_string()));
            self.env.insert(var.to_string(), new_var);
            new_var
        };

        // Emit write instruction
        let _write_inst = self.module.make_instruction(
            InstructionKind::WriteVar { var_id: var_datum },
            vec![val_datum],
            vec![],
        );

        Ok(val_datum)
    }

    fn lower_progn(&mut self, exprs: &[ASTNode]) -> Result<DatumId, String> {
        if exprs.is_empty() {
            return Ok(self.module.make_constant(ConstantValue::Nil));
        }

        let mut result = None;
        for expr in exprs {
            result = Some(self.lower_ast(expr)?);
        }

        Ok(result.unwrap())
    }

    fn lower_block(&mut self, _name: &Option<String>, body: &[ASTNode]) -> Result<DatumId, String> {
        // For now, just lower as progn
        // In a real implementation, this would set up a return-from target
        self.lower_progn(body)
    }

    fn lower_return_from(
        &mut self,
        _block_name: &Option<String>,
        value: &Option<Box<ASTNode>>,
    ) -> Result<DatumId, String> {
        // Lower value if present
        let val_datum = if let Some(val) = value {
            self.lower_ast(val)?
        } else {
            self.module.make_constant(ConstantValue::Nil)
        };

        // Emit return instruction
        let _ret_inst =
            self.module
                .make_instruction(InstructionKind::Return, vec![val_datum], vec![]);

        Ok(val_datum)
    }
}

fn ast_params_to_vec(params: &ASTNode) -> Vec<String> {
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
        ASTNode::Constant(ConstantValue::Nil) => vec![],
        _ => vec![],
    }
}

impl Default for LowerContext {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_lower_constant() {
        let mut ctx = LowerContext::new();
        let ast = ASTNode::fixnum(42);
        let datum_id = ctx.lower_ast(&ast).unwrap();

        let datum = ctx.module.get_datum(datum_id).unwrap();
        assert!(datum.is_ssa());
    }

    #[test]
    fn test_lower_if() {
        let mut ctx = LowerContext::new();

        // Set up initial block
        let func_id = ctx.module.make_function(Some("test".to_string()));
        let func = ctx.module.get_function(func_id).unwrap();
        let entry = func.entry;
        ctx.current_function = Some(func_id);
        ctx.current_block = Some(entry);

        // (if t 1 2)
        let ast = ASTNode::if_then_else(ASTNode::t(), ASTNode::fixnum(1), ASTNode::fixnum(2));

        let result = ctx.lower_ast(&ast).unwrap();
        let datum = ctx.module.get_datum(result).unwrap();

        // Result should be a phi node
        match datum {
            super::super::Datum::Phi(_) => {}
            _ => panic!("Expected phi node"),
        }
    }

    #[test]
    fn test_lower_call() {
        let mut ctx = LowerContext::new();

        // Set up initial block
        let func_id = ctx.module.make_function(Some("test".to_string()));
        let func = ctx.module.get_function(func_id).unwrap();
        let entry = func.entry;
        ctx.current_function = Some(func_id);
        ctx.current_block = Some(entry);

        // Add "+" to environment
        let plus_fn = ctx
            .module
            .make_constant(ConstantValue::Symbol("+".to_string()));
        ctx.env.insert("+".to_string(), plus_fn);

        // (+ 1 2)
        let ast = ASTNode::call(
            ASTNode::variable("+"),
            vec![ASTNode::fixnum(1), ASTNode::fixnum(2)],
        );

        let result = ctx.lower_ast(&ast).unwrap();
        let datum = ctx.module.get_datum(result).unwrap();

        // Result should be an output
        match datum {
            super::super::Datum::Output(_) => {}
            _ => panic!("Expected output"),
        }
    }
}
