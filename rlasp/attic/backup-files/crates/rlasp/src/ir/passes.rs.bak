/// Optimization passes for IR
///
/// Based on Cleavir's BIR transformations

use super::module::Module;
use super::instruction::{Instruction, InstructionId};
use super::datum::DatumId;
use std::collections::{HashSet, HashMap};

/// Dead code elimination pass
pub struct DeadCodeElimination;

impl DeadCodeElimination {
    pub fn run(module: &mut Module) {
        let mut live_instructions = HashSet::new();
        let mut live_datums = HashSet::new();

        // Mark phase: find all live instructions
        Self::mark_live(module, &mut live_instructions, &mut live_datums);

        // Sweep phase: remove dead instructions
        let dead_instructions: Vec<_> = module
            .instructions
            .keys()
            .copied()
            .filter(|id| !live_instructions.contains(id))
            .collect();

        for id in dead_instructions {
            module.instructions.remove(&id);
        }
    }

    fn mark_live(
        module: &Module,
        live_instructions: &mut HashSet<InstructionId>,
        live_datums: &mut HashSet<DatumId>,
    ) {
        // Start with all instructions that have side effects or are terminators
        let mut worklist: Vec<InstructionId> = module
            .instructions
            .values()
            .filter(|inst| inst.has_side_effects() || inst.is_terminator())
            .map(|inst| inst.id)
            .collect();

        while let Some(inst_id) = worklist.pop() {
            if live_instructions.contains(&inst_id) {
                continue;
            }

            live_instructions.insert(inst_id);

            // Mark all input datums as live
            if let Some(inst) = module.get_instruction(inst_id) {
                for &input in &inst.inputs {
                    if live_datums.insert(input) {
                        // Find instruction that produces this datum
                        if let Some(producer_id) = Self::find_producer(module, input) {
                            worklist.push(producer_id);
                        }
                    }
                }
            }
        }
    }

    fn find_producer(module: &Module, datum_id: DatumId) -> Option<InstructionId> {
        // Find instruction that produces this datum
        for inst in module.instructions.values() {
            if inst.outputs.contains(&datum_id) {
                return Some(inst.id);
            }
        }
        None
    }
}

/// Constant folding pass
pub struct ConstantFolding;

impl ConstantFolding {
    pub fn run(module: &mut Module) {
        let mut replacements = HashMap::new();

        // Find instructions that can be folded
        for inst in module.instructions.values() {
            if let Some(folded) = Self::try_fold(module, inst) {
                if let Some(output) = inst.outputs.first() {
                    replacements.insert(*output, folded);
                }
            }
        }

        // Apply replacements
        for inst in module.instructions.values_mut() {
            for input in &mut inst.inputs {
                if let Some(&replacement) = replacements.get(input) {
                    *input = replacement;
                }
            }
        }
    }

    fn try_fold(module: &Module, _inst: &Instruction) -> Option<DatumId> {
        // For now, just a stub
        // Real implementation would:
        // - Check if all inputs are constants
        // - Evaluate the operation
        // - Create new constant datum
        // - Return the constant's ID

        // Example: (+ 1 2) → 3
        // if inst.kind == InstructionKind::Add && all inputs constant {
        //     let sum = input values summed;
        //     return Some(module.make_constant(sum));
        // }

        let _ = module; // suppress warning
        None
    }
}

/// Copy propagation pass
pub struct CopyPropagation;

impl CopyPropagation {
    pub fn run(module: &mut Module) {
        let mut copies = HashMap::new();

        // Find copy instructions (phi nodes with single input, assignments, etc.)
        // For now, just handle phi nodes with single input
        for datum in module.datums.values() {
            if let super::datum::Datum::Phi(phi) = datum {
                if phi.inputs.len() == 1 {
                    // This phi is a copy
                    copies.insert(phi.id, phi.inputs[0]);
                }
            }
        }

        // Replace uses
        for inst in module.instructions.values_mut() {
            for input in &mut inst.inputs {
                if let Some(&replacement) = copies.get(input) {
                    *input = replacement;
                }
            }
        }
    }
}

/// Pass manager - runs optimization passes in sequence
pub struct PassManager {
    passes: Vec<Box<dyn Fn(&mut Module)>>,
}

impl PassManager {
    pub fn new() -> Self {
        Self { passes: vec![] }
    }

    pub fn add_pass(mut self, pass: Box<dyn Fn(&mut Module)>) -> Self {
        self.passes.push(pass);
        self
    }

    pub fn run(&self, module: &mut Module) {
        for pass in &self.passes {
            pass(module);
        }
    }

    /// Standard optimization pipeline
    pub fn standard() -> Self {
        Self::new()
            .add_pass(Box::new(|m| ConstantFolding::run(m)))
            .add_pass(Box::new(|m| CopyPropagation::run(m)))
            .add_pass(Box::new(|m| DeadCodeElimination::run(m)))
    }
}

impl Default for PassManager {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ir::datum::ConstantValue;
    use crate::ir::instruction::InstructionKind;

    #[test]
    fn test_dead_code_elimination() {
        let mut module = Module::new();

        // Create function with entry block
        let func_id = module.make_function(Some("test".to_string()));
        let func = module.get_function(func_id).unwrap();
        let entry = func.entry;

        // Create some instructions
        let c1 = module.make_constant(ConstantValue::Fixnum(42));
        let out1 = module.make_output();

        // Dead instruction (output not used)
        let _dead_inst = module.make_instruction(
            InstructionKind::Add,
            vec![c1, c1],
            vec![out1],
        );

        // Live instruction (return)
        let c2 = module.make_constant(ConstantValue::Fixnum(100));
        let ret_inst = module.make_instruction(
            InstructionKind::Return,
            vec![c2],
            vec![],
        );

        module.get_block_mut(entry).unwrap().end = Some(ret_inst);

        // Before DCE: 2 instructions
        let before_count = module.instructions.len();

        DeadCodeElimination::run(&mut module);

        // After DCE: only return instruction should remain
        let after_count = module.instructions.len();
        assert!(after_count < before_count);
    }

    #[test]
    fn test_copy_propagation() {
        let mut module = Module::new();

        // Create phi with single input (copy)
        let c1 = module.make_constant(ConstantValue::Fixnum(42));
        let phi = module.make_phi(vec![c1]);

        // Create instruction using the phi
        let out = module.make_output();
        module.make_instruction(
            InstructionKind::Add,
            vec![phi, c1],
            vec![out],
        );

        CopyPropagation::run(&mut module);

        // The instruction should now use c1 directly instead of phi
        // (Check would require iterating instructions and checking inputs)
    }

    #[test]
    fn test_pass_manager() {
        let mut module = Module::new();
        let pm = PassManager::standard();

        // Should not crash
        pm.run(&mut module);
    }
}
