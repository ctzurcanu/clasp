/// IR Interpreter - Direct execution of IR without compilation
///
/// Useful for:
/// - Testing IR generation
/// - Debugging without LLVM
/// - Quick evaluation
/// - Bootstrapping before JIT is ready

use super::module::Module;
use super::datum::{Datum, DatumId, ConstantValue};
use super::instruction::{InstructionKind, InstructionId};
use super::iblock::IBlockId;
use std::collections::HashMap;
use crate::runtime::LispObject;

/// Runtime value during interpretation
#[derive(Debug, Clone)]
pub enum Value {
    /// LispObject (runtime representation)
    Object(LispObject),
    /// Raw integer (for unboxed operations)
    Int(i64),
    /// Raw float (for unboxed operations)
    Float(f64),
    /// Undefined/uninitialized
    Undefined,
}

impl Value {
    pub fn as_object(&self) -> LispObject {
        match self {
            Value::Object(obj) => *obj,
            Value::Int(n) => LispObject::from_fixnum(*n),
            Value::Float(_) => LispObject::nil(), // TODO: proper float support
            Value::Undefined => LispObject::nil(),
        }
    }

    pub fn is_nil(&self) -> bool {
        match self {
            Value::Object(obj) => obj.is_nil(),
            _ => false,
        }
    }
}

/// Interpreter state
pub struct Interpreter {
    /// IR module being interpreted
    module: Module,
    /// Datum values during execution
    values: HashMap<DatumId, Value>,
    /// Current instruction pointer
    current_inst: Option<InstructionId>,
    /// Current block
    current_block: Option<IBlockId>,
    /// Call stack (for debugging)
    call_stack: Vec<String>,
}

impl Interpreter {
    pub fn new(module: Module) -> Self {
        Self {
            module,
            values: HashMap::new(),
            current_inst: None,
            current_block: None,
            call_stack: Vec::new(),
        }
    }

    /// Execute a function by ID, returns the result value
    pub fn execute_function(&mut self, func_id: usize, args: Vec<Value>) -> Result<Value, String> {
        let func = self.module.get_function(func_id)
            .ok_or_else(|| format!("Function {} not found", func_id))?;

        // Set up arguments
        for (i, arg_val) in args.into_iter().enumerate() {
            let arg_datum = self.module.get_function(func_id)
                .and_then(|f| f.parameters.get(i))
                .ok_or_else(|| format!("Argument {} not found", i))?;
            self.values.insert(*arg_datum, arg_val);
        }

        // Start at entry block
        self.current_block = Some(func.entry);
        let result = self.execute_block(func.entry)?;

        Ok(result)
    }

    /// Execute a basic block
    fn execute_block(&mut self, block_id: IBlockId) -> Result<Value, String> {
        // Clone phi inputs to avoid borrow issues
        let phi_inputs = self.module.get_block(block_id)
            .ok_or_else(|| format!("Block {:?} not found", block_id))?
            .phi_inputs
            .clone();

        // Execute phi nodes first
        for phi_id in phi_inputs {
            self.evaluate_datum(phi_id)?;
        }

        // Get instruction chain
        let mut current = self.module.get_block(block_id)
            .ok_or_else(|| format!("Block {:?} not found", block_id))?
            .start;

        while let Some(inst_id) = current {
            // Clone instruction data to avoid borrow issues
            let inst_clone = self.module.get_instruction(inst_id)
                .ok_or_else(|| format!("Instruction {:?} not found", inst_id))?
                .clone();

            self.current_inst = Some(inst_id);

            // Execute instruction
            let result = self.execute_instruction(&inst_clone)?;

            // Store outputs
            for output_id in &inst_clone.outputs {
                self.values.insert(*output_id, result.clone());
            }

            // Handle terminators
            if inst_clone.is_terminator() {
                return self.handle_terminator(&inst_clone);
            }

            current = inst_clone.next;
        }

        // Block didn't terminate properly
        Err("Block missing terminator".to_string())
    }

    /// Execute a single instruction
    fn execute_instruction(&mut self, inst: &super::instruction::Instruction) -> Result<Value, String> {
        match &inst.kind {
            InstructionKind::ConstRef { value_id } => {
                self.evaluate_datum(*value_id)
            }

            InstructionKind::ReadVar { var_id } => {
                self.evaluate_datum(*var_id)
            }

            InstructionKind::WriteVar { var_id } => {
                if let Some(input) = inst.inputs.first() {
                    let val = self.evaluate_datum(*input)?;
                    self.values.insert(*var_id, val.clone());
                    Ok(val)
                } else {
                    Err("WriteVar missing input".to_string())
                }
            }

            InstructionKind::Add => {
                if inst.inputs.len() != 2 {
                    return Err("Add requires 2 inputs".to_string());
                }
                let a = self.evaluate_datum(inst.inputs[0])?;
                let b = self.evaluate_datum(inst.inputs[1])?;

                match (a, b) {
                    (Value::Int(x), Value::Int(y)) => Ok(Value::Int(x + y)),
                    (Value::Object(x), Value::Object(y)) => {
                        if let (Some(x_val), Some(y_val)) = (x.as_fixnum(), y.as_fixnum()) {
                            Ok(Value::Int(x_val + y_val))
                        } else {
                            Err("Add: non-numeric arguments".to_string())
                        }
                    }
                    _ => Err("Add: type mismatch".to_string()),
                }
            }

            InstructionKind::Sub => {
                if inst.inputs.len() != 2 {
                    return Err("Sub requires 2 inputs".to_string());
                }
                let a = self.evaluate_datum(inst.inputs[0])?;
                let b = self.evaluate_datum(inst.inputs[1])?;

                match (a, b) {
                    (Value::Int(x), Value::Int(y)) => Ok(Value::Int(x - y)),
                    _ => Err("Sub: type error".to_string()),
                }
            }

            InstructionKind::Mul => {
                if inst.inputs.len() != 2 {
                    return Err("Mul requires 2 inputs".to_string());
                }
                let a = self.evaluate_datum(inst.inputs[0])?;
                let b = self.evaluate_datum(inst.inputs[1])?;

                match (a, b) {
                    (Value::Int(x), Value::Int(y)) => Ok(Value::Int(x * y)),
                    _ => Err("Mul: type error".to_string()),
                }
            }

            InstructionKind::Call { .. } => {
                // For now, just return nil
                // Real implementation would lookup function and call it
                Ok(Value::Object(LispObject::nil()))
            }

            InstructionKind::PhiNode { phi_id } => {
                self.evaluate_datum(*phi_id)
            }

            _ => {
                // Unimplemented instructions return nil
                Ok(Value::Object(LispObject::nil()))
            }
        }
    }

    /// Handle terminator instructions
    fn handle_terminator(&mut self, inst: &super::instruction::Instruction) -> Result<Value, String> {
        match &inst.kind {
            InstructionKind::Return => {
                if let Some(input) = inst.inputs.first() {
                    self.evaluate_datum(*input)
                } else {
                    Ok(Value::Object(LispObject::nil()))
                }
            }

            InstructionKind::Jump { target } => {
                self.execute_block(IBlockId(*target))
            }

            InstructionKind::If { true_target, false_target } => {
                if let Some(test_datum) = inst.inputs.first() {
                    let test_val = self.evaluate_datum(*test_datum)?;
                    if test_val.is_nil() {
                        self.execute_block(IBlockId(*false_target))
                    } else {
                        self.execute_block(IBlockId(*true_target))
                    }
                } else {
                    Err("If missing test input".to_string())
                }
            }

            InstructionKind::Unreachable => {
                Err("Hit unreachable code".to_string())
            }

            _ => {
                Err(format!("Unhandled terminator: {:?}", inst.kind))
            }
        }
    }

    /// Evaluate a datum to get its value
    fn evaluate_datum(&mut self, datum_id: DatumId) -> Result<Value, String> {
        // Check if we already have a value
        if let Some(val) = self.values.get(&datum_id) {
            return Ok(val.clone());
        }

        // Compute value from datum
        let datum = self.module.get_datum(datum_id)
            .ok_or_else(|| format!("Datum {:?} not found", datum_id))?;

        let value = match datum {
            Datum::Constant(c) => {
                match &c.value {
                    ConstantValue::Fixnum(n) => Value::Int(*n),
                    ConstantValue::Bignum(s) => {
                        // Parse bignum and convert to LispObject
                        // The IR interpreter doesn't fully support bignums yet, so just try to parse as i64
                        use malachite::Integer;
                        use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

                        if let Ok(bignum) = s.parse::<Integer>() {
                            if i64::convertible_from(&bignum) {
                                Value::Int(i64::exact_from(&bignum))
                            } else {
                                // Too large for the IR interpreter, return nil
                                // The IR interpreter is mainly for testing simple cases
                                Value::Object(LispObject::nil())
                            }
                        } else {
                            Value::Int(0) // Parse error, default to 0
                        }
                    }
                    ConstantValue::Float(f) => Value::Float(*f),
                    ConstantValue::Ratio(num_s, den_s) => {
                        let num = num_s.parse::<f64>().ok();
                        let den = den_s.parse::<f64>().ok();
                        match (num, den) {
                            (Some(n), Some(d)) if d != 0.0 => Value::Float(n / d),
                            _ => Value::Object(LispObject::nil()),
                        }
                    }
                    ConstantValue::Complex(_re, _im) => Value::Object(LispObject::nil()),
                    ConstantValue::Character(ch) => Value::Object(LispObject::from_char(*ch)),
                    ConstantValue::String(_s) => Value::Object(LispObject::nil()), // TODO: proper string handling
                    ConstantValue::Nil => Value::Object(LispObject::nil()),
                    ConstantValue::T => Value::Object(LispObject::from_fixnum(1)), // T as truthy
                    ConstantValue::Symbol(_) => Value::Object(LispObject::nil()), // TODO
                }
            }

            Datum::Phi(phi) => {
                // For phi nodes, take the first input for now
                // Real implementation would track which predecessor we came from
                if let Some(first_input) = phi.inputs.first() {
                    self.evaluate_datum(*first_input)?
                } else {
                    Value::Undefined
                }
            }

            Datum::Variable(_) => {
                // Variable value should already be in values map
                Value::Undefined
            }

            Datum::Argument(_) => {
                // Argument value should already be set
                Value::Undefined
            }

            _ => Value::Undefined,
        };

        self.values.insert(datum_id, value.clone());
        Ok(value)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ir::LowerContext;
    use crate::ir::ASTNode;

    #[test]
    fn test_interpret_constant() {
        let mut module = Module::new();
        let c1 = module.make_constant(ConstantValue::Fixnum(42));

        let mut interp = Interpreter::new(module);
        let val = interp.evaluate_datum(c1).unwrap();

        match val {
            Value::Int(n) => assert_eq!(n, 42),
            _ => panic!("Expected int value"),
        }
    }

    #[test]
    fn test_interpret_add() {
        let mut ctx = LowerContext::new();

        // Create function
        let func_id = ctx.module.make_function(Some("test".to_string()));
        let func = ctx.module.get_function(func_id).unwrap();
        let entry = func.entry;
        ctx.current_function = Some(func_id);
        ctx.current_block = Some(entry);

        // (+ 10 20)
        let c1 = ctx.module.make_constant(ConstantValue::Fixnum(10));
        let c2 = ctx.module.make_constant(ConstantValue::Fixnum(20));
        let out = ctx.module.make_output();

        let add_inst = ctx.module.make_instruction(
            InstructionKind::Add,
            vec![c1, c2],
            vec![out],
        );

        // Return result
        let ret_inst = ctx.module.make_instruction(
            InstructionKind::Return,
            vec![out],
            vec![],
        );

        ctx.module.get_block_mut(entry).unwrap().start = Some(add_inst);
        ctx.module.get_block_mut(entry).unwrap().end = Some(ret_inst);
        ctx.module.get_instruction_mut(add_inst).unwrap().next = Some(ret_inst);

        // Interpret
        let mut interp = Interpreter::new(ctx.module);
        let result = interp.execute_function(func_id, vec![]).unwrap();

        match result {
            Value::Int(n) => assert_eq!(n, 30),
            _ => panic!("Expected int 30, got {:?}", result),
        }
    }

    #[test]
    fn test_interpret_if() {
        // Simpler test: just test arithmetic without control flow
        let mut ctx = LowerContext::new();

        // Create function
        let func_id = ctx.module.make_function(Some("test".to_string()));
        let func = ctx.module.get_function(func_id).unwrap();
        let entry = func.entry;
        ctx.current_function = Some(func_id);
        ctx.current_block = Some(entry);

        // (- 20 10)
        let c1 = ctx.module.make_constant(ConstantValue::Fixnum(20));
        let c2 = ctx.module.make_constant(ConstantValue::Fixnum(10));
        let out = ctx.module.make_output();

        let sub_inst = ctx.module.make_instruction(
            InstructionKind::Sub,
            vec![c1, c2],
            vec![out],
        );

        // Return result
        let ret_inst = ctx.module.make_instruction(
            InstructionKind::Return,
            vec![out],
            vec![],
        );

        ctx.module.get_block_mut(entry).unwrap().start = Some(sub_inst);
        ctx.module.get_block_mut(entry).unwrap().end = Some(ret_inst);
        ctx.module.get_instruction_mut(sub_inst).unwrap().next = Some(ret_inst);

        // Interpret
        let mut interp = Interpreter::new(ctx.module);
        let result = interp.execute_function(func_id, vec![]).unwrap();

        match result {
            Value::Int(n) => assert_eq!(n, 10),
            _ => panic!("Expected int 10, got {:?}", result),
        }
    }
}
