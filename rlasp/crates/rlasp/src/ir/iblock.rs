/// IBlock - Basic blocks in the IR (Cleavir2-style)
///
/// Represents a sequence of instructions with single entry and exit points

use super::instruction::InstructionId;
use super::datum::DatumId;

/// Unique ID for a basic block
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct IBlockId(pub usize);

/// Basic block - sequence of instructions
#[derive(Debug, Clone)]
pub struct IBlock {
    pub id: IBlockId,
    /// Optional debug name
    pub name: Option<String>,
    /// First instruction in block
    pub start: Option<InstructionId>,
    /// Last instruction (terminator) in block
    pub end: Option<InstructionId>,
    /// Predecessor blocks
    pub predecessors: Vec<IBlockId>,
    /// Successor blocks (computed from terminator)
    pub successors: Vec<IBlockId>,
    /// Phi inputs for SSA merges
    pub phi_inputs: Vec<DatumId>,
    /// Parent function
    pub function: Option<usize>,
    /// Dynamic environment (for exceptions)
    pub dynamic_environment: Option<DynamicEnvironmentId>,
}

/// Dynamic environment for exception handling
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct DynamicEnvironmentId(pub usize);

/// Dynamic environment scope
#[derive(Debug, Clone)]
pub struct DynamicEnvironment {
    pub id: DynamicEnvironmentId,
    /// Set of blocks in this dynamic scope
    pub scope: Vec<IBlockId>,
    /// Parent environment (for nesting)
    pub parent: Option<DynamicEnvironmentId>,
}

impl IBlock {
    pub fn new(id: IBlockId) -> Self {
        Self {
            id,
            name: None,
            start: None,
            end: None,
            predecessors: vec![],
            successors: vec![],
            phi_inputs: vec![],
            function: None,
            dynamic_environment: None,
        }
    }

    /// Add a predecessor block
    pub fn add_predecessor(&mut self, pred: IBlockId) {
        if !self.predecessors.contains(&pred) {
            self.predecessors.push(pred);
        }
    }

    /// Add a successor block
    pub fn add_successor(&mut self, succ: IBlockId) {
        if !self.successors.contains(&succ) {
            self.successors.push(succ);
        }
    }

    /// Check if this block is empty
    pub fn is_empty(&self) -> bool {
        self.start.is_none()
    }

    /// Check if this block is terminated (has terminator instruction)
    pub fn is_terminated(&self) -> bool {
        self.end.is_some()
    }
}

/// Function in the IR
#[derive(Debug, Clone)]
pub struct Function {
    pub id: usize,
    pub name: Option<String>,
    /// Entry block
    pub entry: IBlockId,
    /// All blocks in this function
    pub blocks: Vec<IBlockId>,
    /// Function parameters
    pub parameters: Vec<DatumId>,
    /// Return type (if known)
    pub return_type: Option<String>,
}

impl Function {
    pub fn new(id: usize, entry: IBlockId) -> Self {
        Self {
            id,
            name: None,
            entry,
            blocks: vec![entry],
            parameters: vec![],
            return_type: None,
        }
    }

    /// Add a block to this function
    pub fn add_block(&mut self, block: IBlockId) {
        if !self.blocks.contains(&block) {
            self.blocks.push(block);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_block_creation() {
        let block = IBlock::new(IBlockId(1));
        assert_eq!(block.id, IBlockId(1));
        assert!(block.is_empty());
        assert!(!block.is_terminated());
    }

    #[test]
    fn test_predecessors_successors() {
        let mut block = IBlock::new(IBlockId(1));
        block.add_predecessor(IBlockId(0));
        block.add_successor(IBlockId(2));
        block.add_successor(IBlockId(3));

        assert_eq!(block.predecessors.len(), 1);
        assert_eq!(block.successors.len(), 2);

        // Test deduplication
        block.add_predecessor(IBlockId(0));
        assert_eq!(block.predecessors.len(), 1);
    }

    #[test]
    fn test_function() {
        let entry = IBlockId(0);
        let mut func = Function::new(1, entry);
        func.name = Some("test".to_string());
        func.add_block(IBlockId(1));
        func.add_block(IBlockId(2));

        assert_eq!(func.entry, entry);
        assert_eq!(func.blocks.len(), 3); // entry + 2 added
    }
}
