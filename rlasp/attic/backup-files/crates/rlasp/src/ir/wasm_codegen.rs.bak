/// LLVM-based code generation from BIR
///
/// Uses LLVM backend to compile BIR → LLVM IR → WASM/Native

use super::module::Module;
use inkwell::context::Context;
use inkwell::targets::{InitializationConfig, Target, TargetMachine, RelocMode, CodeModel, FileType};
use inkwell::OptimizationLevel;
use std::path::Path;

/// Compilation target
pub enum CompileTarget {
    Wasm,
    Native,
}

/// Code generator using LLVM backend
pub struct WasmCodegen {
    _module: Module,
    target: CompileTarget,
}

impl WasmCodegen {
    pub fn new(module: Module) -> Self {
        Self {
            _module: module,
            target: CompileTarget::Wasm,
        }
    }

    pub fn new_with_target(module: Module, target: CompileTarget) -> Self {
        Self {
            _module: module,
            target,
        }
    }

    /// Generate code using LLVM backend
    ///
    /// Translates BIR → LLVM IR → WASM/Native using LLVM target
    pub fn generate(&mut self) -> Result<Vec<u8>, String> {
        let context = Context::create();
        let llvm_module = context.create_module("main");
        let builder = context.create_builder();

        // Translate each BIR function
        for (func_id, _func) in &self._module.functions {
            self.translate_function(*func_id, &context, &llvm_module, &builder)?;
        }

        // If no functions, create a dummy main that returns 0
        if self._module.functions.is_empty() {
            let i64_type = context.i64_type();
            let fn_type = i64_type.fn_type(&[], false);
            let function = llvm_module.add_function("main", fn_type, None);
            let basic_block = context.append_basic_block(function, "entry");
            builder.position_at_end(basic_block);
            let ret_val = i64_type.const_int(0, false);
            builder.build_return(Some(&ret_val)).unwrap();
        }

        // Initialize target
        match self.target {
            CompileTarget::Wasm => {
                Target::initialize_webassembly(&InitializationConfig::default());
            }
            CompileTarget::Native => {
                Target::initialize_native(&InitializationConfig::default())
                    .map_err(|e| format!("Failed to initialize native target: {}", e))?;
            }
        }

        let triple = match self.target {
            CompileTarget::Wasm => inkwell::targets::TargetTriple::create("wasm32-unknown-unknown"),
            CompileTarget::Native => TargetMachine::get_default_triple(),
        };

        let target = Target::from_triple(&triple)
            .map_err(|e| format!("Failed to create target: {}", e))?;

        let target_machine = target
            .create_target_machine(
                &triple,
                "",
                "",
                OptimizationLevel::None,  // Disable optimizations to see actual instructions
                RelocMode::Default,
                CodeModel::Default,
            )
            .ok_or("Failed to create target machine")?;

        // Compile to WASM object file
        let obj_bytes = target_machine
            .write_to_memory_buffer(&llvm_module, FileType::Object)
            .map_err(|e| format!("Failed to compile to object: {}", e))?;

        Ok(obj_bytes.as_slice().to_vec())
    }

    /// Generate file (WASM or native object)
    pub fn generate_to_file(&mut self, output_path: &Path) -> Result<(), String> {
        let obj_bytes = self.generate()?;

        match self.target {
            CompileTarget::Wasm => {
                // For WASM, write object file and link it to create proper WASM module
                let temp_obj = output_path.with_extension("o");
                std::fs::write(&temp_obj, &obj_bytes)
                    .map_err(|e| format!("Failed to write temp object: {}", e))?;

                // Link with wasm-ld to create executable WASM module with exports
                let status = std::process::Command::new("wasm-ld")
                    .arg("--no-entry")
                    .arg("--export=main")
                    .arg(&temp_obj)
                    .arg("-o")
                    .arg(output_path)
                    .status()
                    .map_err(|e| format!("Failed to run wasm-ld: {}", e))?;

                // Clean up temp file
                let _ = std::fs::remove_file(&temp_obj);

                if !status.success() {
                    return Err("wasm-ld failed".to_string());
                }

                Ok(())
            }
            CompileTarget::Native => {
                // For native, just write the object file
                std::fs::write(output_path, obj_bytes)
                    .map_err(|e| format!("Failed to write object file: {}", e))
            }
        }
    }

    /// Translate a BIR function to LLVM IR
    fn translate_function<'ctx>(
        &self,
        func_id: usize,
        context: &'ctx Context,
        llvm_module: &inkwell::module::Module<'ctx>,
        builder: &inkwell::builder::Builder<'ctx>,
    ) -> Result<(), String> {
        use inkwell::values::BasicValueEnum;
        use std::collections::HashMap;
        use super::instruction::InstructionKind;
        use super::datum::{Datum, ConstantValue};

        let func = self._module.get_function(func_id)
            .ok_or_else(|| format!("Function {} not found", func_id))?;

        // Create LLVM function with external linkage so it gets exported
        use inkwell::module::Linkage;
        let i64_type = context.i64_type();
        let fn_type = i64_type.fn_type(&[], false);
        let llvm_function = llvm_module.add_function("main", fn_type, Some(Linkage::External));
        let entry_block = context.append_basic_block(llvm_function, "entry");
        builder.position_at_end(entry_block);

        // Map from DatumId to LLVM value
        let mut values: HashMap<usize, BasicValueEnum<'ctx>> = HashMap::new();

        // Macro to get or load a value
        macro_rules! get_val {
            ($datum_id:expr) => {{
                if let Some(val) = values.get(&$datum_id.0) {
                    *val
                } else if let Some(Datum::Constant(c)) = self._module.get_datum($datum_id) {
                    let llvm_val: BasicValueEnum = match &c.value {
                        ConstantValue::Fixnum(n) => i64_type.const_int(*n as u64, true).into(),
                        _ => return Err(format!("Unsupported constant type")),
                    };
                    values.insert($datum_id.0, llvm_val);
                    llvm_val
                } else {
                    return Err(format!("Value for datum {:?} not found", $datum_id));
                }
            }}
        }

        // Get entry block
        let bir_block = self._module.get_block(func.entry)
            .ok_or_else(|| format!("Entry block not found"))?;

        // Walk through instructions
        let mut current_inst = bir_block.start;
        while let Some(inst_id) = current_inst {
            let inst = self._module.get_instruction(inst_id)
                .ok_or_else(|| format!("Instruction {:?} not found", inst_id))?;

            match &inst.kind {
                InstructionKind::ConstRef { value_id } => {
                    // Load constant value
                    if let Some(Datum::Constant(c)) = self._module.get_datum(*value_id) {
                        let llvm_val = match &c.value {
                            ConstantValue::Fixnum(n) => {
                                i64_type.const_int(*n as u64, true).into()
                            }
                            _ => return Err(format!("Unsupported constant type")),
                        };
                        // Store in outputs
                        if let Some(output_id) = inst.outputs.first() {
                            values.insert(output_id.0, llvm_val);
                        }
                    }
                }

                InstructionKind::Add => {
                    if inst.inputs.len() < 2 {
                        return Err("Add requires at least 2 operands".to_string());
                    }
                    let lhs = get_val!(inst.inputs[0]).into_int_value();
                    let rhs = get_val!(inst.inputs[1]).into_int_value();
                    let mut result = builder.build_int_add(lhs, rhs, "add").unwrap();

                    // Handle variadic +
                    for input in &inst.inputs[2..] {
                        let val = get_val!(*input).into_int_value();
                        result = builder.build_int_add(result, val, "add").unwrap();
                    }

                    if let Some(output_id) = inst.outputs.first() {
                        values.insert(output_id.0, result.into());
                    }
                }

                InstructionKind::Sub => {
                    if inst.inputs.is_empty() {
                        return Err("Sub requires operands".to_string());
                    }
                    let lhs = get_val!(inst.inputs[0]).into_int_value();

                    let result = if inst.inputs.len() == 1 {
                        let zero = i64_type.const_int(0, false);
                        builder.build_int_sub(zero, lhs, "neg").unwrap()
                    } else {
                        let rhs = get_val!(inst.inputs[1]).into_int_value();
                        let mut result = builder.build_int_sub(lhs, rhs, "sub").unwrap();
                        for input in &inst.inputs[2..] {
                            let val = get_val!(*input).into_int_value();
                            result = builder.build_int_sub(result, val, "sub").unwrap();
                        }
                        result
                    };

                    if let Some(output_id) = inst.outputs.first() {
                        values.insert(output_id.0, result.into());
                    }
                }

                InstructionKind::Mul => {
                    if inst.inputs.len() < 2 {
                        return Err("Mul requires at least 2 operands".to_string());
                    }
                    let lhs = get_val!(inst.inputs[0]).into_int_value();
                    let rhs = get_val!(inst.inputs[1]).into_int_value();
                    let mut result = builder.build_int_mul(lhs, rhs, "mul").unwrap();

                    for input in &inst.inputs[2..] {
                        let val = get_val!(*input).into_int_value();
                        result = builder.build_int_mul(result, val, "mul").unwrap();
                    }

                    if let Some(output_id) = inst.outputs.first() {
                        values.insert(output_id.0, result.into());
                    }
                }

                InstructionKind::Div => {
                    if inst.inputs.len() < 2 {
                        return Err("Div requires at least 2 operands".to_string());
                    }
                    let lhs = get_val!(inst.inputs[0]).into_int_value();
                    let rhs = get_val!(inst.inputs[1]).into_int_value();
                    let mut result = builder.build_int_signed_div(lhs, rhs, "div").unwrap();

                    for input in &inst.inputs[2..] {
                        let val = get_val!(*input).into_int_value();
                        result = builder.build_int_signed_div(result, val, "div").unwrap();
                    }

                    if let Some(output_id) = inst.outputs.first() {
                        values.insert(output_id.0, result.into());
                    }
                }

                InstructionKind::Return => {
                    if let Some(input) = inst.inputs.first() {
                        let val = get_val!(*input);
                        builder.build_return(Some(&val)).unwrap();
                    } else {
                        let zero = i64_type.const_int(0, false);
                        builder.build_return(Some(&zero)).unwrap();
                    }
                }

                _ => {
                    // Unhandled instruction - skip for now
                }
            }

            current_inst = inst.next;
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ir::*;

    #[test]
    fn test_wasm_llvm_generation() {
        let module = Module::new();

        // Generate WASM using LLVM
        let mut codegen = WasmCodegen::new(module);
        let obj_bytes = codegen.generate().unwrap();

        assert!(!obj_bytes.is_empty());
        // Should produce a valid WASM object file
    }
}
