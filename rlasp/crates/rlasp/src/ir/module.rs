/// IR Module - Container for functions and global data
///
/// Top-level IR structure containing all functions, blocks, instructions, and data

use super::datum::*;
use super::instruction::*;
use super::iblock::*;
use std::collections::HashMap;

/// IR Module containing all IR entities
#[derive(Debug, Clone)]
pub struct Module {
    /// All datums (values, variables, etc.)
    pub datums: HashMap<DatumId, Datum>,
    /// All instructions
    pub instructions: HashMap<InstructionId, Instruction>,
    /// All basic blocks
    pub blocks: HashMap<IBlockId, IBlock>,
    /// All functions
    pub functions: HashMap<usize, Function>,
    /// Dynamic environments
    pub dynamic_environments: HashMap<DynamicEnvironmentId, DynamicEnvironment>,

    // ID generators
    next_datum_id: usize,
    next_instruction_id: usize,
    next_block_id: usize,
    next_function_id: usize,
    next_dynenv_id: usize,
}

impl Module {
    pub fn new() -> Self {
        Self {
            datums: HashMap::new(),
            instructions: HashMap::new(),
            blocks: HashMap::new(),
            functions: HashMap::new(),
            dynamic_environments: HashMap::new(),
            next_datum_id: 0,
            next_instruction_id: 0,
            next_block_id: 0,
            next_function_id: 0,
            next_dynenv_id: 0,
        }
    }

    // === Datum creation ===

    pub fn make_constant(&mut self, value: ConstantValue) -> DatumId {
        let id = DatumId(self.next_datum_id);
        self.next_datum_id += 1;
        let datum = Datum::Constant(Constant { id, value });
        self.datums.insert(id, datum);
        id
    }

    pub fn make_output(&mut self) -> DatumId {
        let id = DatumId(self.next_datum_id);
        self.next_datum_id += 1;
        let datum = Datum::Output(Output {
            id,
            instruction: None,
        });
        self.datums.insert(id, datum);
        id
    }

    pub fn make_phi(&mut self, inputs: Vec<DatumId>) -> DatumId {
        let id = DatumId(self.next_datum_id);
        self.next_datum_id += 1;
        let datum = Datum::Phi(Phi {
            id,
            iblock: None,
            inputs,
        });
        self.datums.insert(id, datum);
        id
    }

    pub fn make_variable(&mut self, name: Option<String>) -> DatumId {
        let id = DatumId(self.next_datum_id);
        self.next_datum_id += 1;
        let datum = Datum::Variable(Variable {
            id,
            name,
            definitions: vec![],
            uses: vec![],
        });
        self.datums.insert(id, datum);
        id
    }

    pub fn make_argument(&mut self, position: usize, name: Option<String>) -> DatumId {
        let id = DatumId(self.next_datum_id);
        self.next_datum_id += 1;
        let datum = Datum::Argument(Argument { id, position, name });
        self.datums.insert(id, datum);
        id
    }

    // === Instruction creation ===

    pub fn make_instruction(
        &mut self,
        kind: InstructionKind,
        inputs: Vec<DatumId>,
        outputs: Vec<DatumId>,
    ) -> InstructionId {
        let id = InstructionId(self.next_instruction_id);
        self.next_instruction_id += 1;
        let inst = Instruction {
            id,
            kind,
            inputs,
            outputs,
            iblock: None,
            next: None,
            prev: None,
        };
        self.instructions.insert(id, inst);
        id
    }

    // === Block creation ===

    pub fn make_block(&mut self, name: Option<String>) -> IBlockId {
        let id = IBlockId(self.next_block_id);
        self.next_block_id += 1;
        let mut block = IBlock::new(id);
        block.name = name;
        self.blocks.insert(id, block);
        id
    }

    // === Function creation ===

    pub fn make_function(&mut self, name: Option<String>) -> usize {
        let id = self.next_function_id;
        self.next_function_id += 1;
        let entry = self.make_block(Some(format!("entry_{}", id)));
        let mut func = Function::new(id, entry);
        func.name = name;
        self.functions.insert(id, func);
        id
    }

    // === Dynamic environment creation ===

    pub fn make_dynamic_environment(
        &mut self,
        scope: Vec<IBlockId>,
        parent: Option<DynamicEnvironmentId>,
    ) -> DynamicEnvironmentId {
        let id = DynamicEnvironmentId(self.next_dynenv_id);
        self.next_dynenv_id += 1;
        let dynenv = DynamicEnvironment { id, scope, parent };
        self.dynamic_environments.insert(id, dynenv);
        id
    }

    // === Helpers ===

    pub fn get_datum(&self, id: DatumId) -> Option<&Datum> {
        self.datums.get(&id)
    }

    pub fn get_datum_mut(&mut self, id: DatumId) -> Option<&mut Datum> {
        self.datums.get_mut(&id)
    }

    pub fn get_instruction(&self, id: InstructionId) -> Option<&Instruction> {
        self.instructions.get(&id)
    }

    pub fn get_instruction_mut(&mut self, id: InstructionId) -> Option<&mut Instruction> {
        self.instructions.get_mut(&id)
    }

    pub fn get_block(&self, id: IBlockId) -> Option<&IBlock> {
        self.blocks.get(&id)
    }

    pub fn get_block_mut(&mut self, id: IBlockId) -> Option<&mut IBlock> {
        self.blocks.get_mut(&id)
    }

    pub fn get_function(&self, id: usize) -> Option<&Function> {
        self.functions.get(&id)
    }

    pub fn get_function_mut(&mut self, id: usize) -> Option<&mut Function> {
        self.functions.get_mut(&id)
    }
}

impl Default for Module {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_module_creation() {
        let mut module = Module::new();

        // Create some datums
        let c1 = module.make_constant(ConstantValue::Fixnum(42));
        let v1 = module.make_variable(Some("x".to_string()));

        assert_eq!(module.datums.len(), 2);
        assert!(module.get_datum(c1).unwrap().is_ssa());
        assert!(!module.get_datum(v1).unwrap().is_ssa());
    }

    #[test]
    fn test_instruction_creation() {
        let mut module = Module::new();

        let in1 = module.make_constant(ConstantValue::Fixnum(1));
        let in2 = module.make_constant(ConstantValue::Fixnum(2));
        let out = module.make_output();

        let add_inst = module.make_instruction(
            InstructionKind::Add,
            vec![in1, in2],
            vec![out],
        );

        let inst = module.get_instruction(add_inst).unwrap();
        assert_eq!(inst.inputs.len(), 2);
        assert_eq!(inst.outputs.len(), 1);
        assert!(!inst.has_side_effects());
    }

    #[test]
    fn test_function_creation() {
        let mut module = Module::new();
        let func_id = module.make_function(Some("test".to_string()));

        let func = module.get_function(func_id).unwrap();
        assert_eq!(func.name, Some("test".to_string()));
        assert_eq!(func.blocks.len(), 1); // entry block
    }

    #[test]
    fn test_block_linking() {
        let mut module = Module::new();
        let b1 = module.make_block(Some("block1".to_string()));
        let b2 = module.make_block(Some("block2".to_string()));

        // Link blocks
        module.get_block_mut(b1).unwrap().add_successor(b2);
        module.get_block_mut(b2).unwrap().add_predecessor(b1);

        assert_eq!(module.get_block(b1).unwrap().successors.len(), 1);
        assert_eq!(module.get_block(b2).unwrap().predecessors.len(), 1);
    }
}
