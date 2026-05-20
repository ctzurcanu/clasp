/// Instructions - Operations in the IR (Cleavir2-style)
///
/// Modeled after Cleavir's instruction hierarchy with mixins for inputs/outputs
use super::datum::DatumId;

/// Unique ID for an instruction
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct InstructionId(pub usize);

/// Abstract base for all instructions
#[derive(Debug, Clone)]
pub struct Instruction {
    pub id: InstructionId,
    pub kind: InstructionKind,
    pub inputs: Vec<DatumId>,
    pub outputs: Vec<DatumId>,
    /// Basic block containing this instruction
    pub iblock: Option<usize>,
    /// Next instruction in block
    pub next: Option<InstructionId>,
    /// Previous instruction in block
    pub prev: Option<InstructionId>,
}

/// Instruction kinds
#[derive(Debug, Clone)]
pub enum InstructionKind {
    // === Terminators (control flow) ===
    /// Unconditional jump
    Jump { target: usize },
    /// Conditional branch: if input is NIL → false_target, else → true_target
    If {
        true_target: usize,
        false_target: usize,
    },
    /// Function return
    Return,
    /// Unreachable code
    Unreachable,
    /// Multi-way branch
    Case { targets: Vec<usize>, default: usize },
    /// Nonlocal exit
    Unwind { target: usize },

    // === Value operations ===
    /// Load constant
    ConstRef { value_id: DatumId },
    /// Read variable
    ReadVar { var_id: DatumId },
    /// Write variable
    WriteVar { var_id: DatumId },
    /// Phi node (SSA merge)
    PhiNode { phi_id: DatumId },

    // === Function calls ===
    /// Direct function call
    Call { callee: DatumId },
    /// Multiple-value call
    MvCall { callee: DatumId },
    /// Local function call (known target)
    LocalCall { function_id: usize },
    /// Multiple-value local call
    MvLocalCall { function_id: usize },

    // === Multiple values ===
    /// Save multiple return values
    ValuesSave,
    /// Collect multiple values into list
    ValuesCollect { count: Option<usize> },
    /// Restore saved multiple values
    ValuesRestore,

    // === Type operations ===
    /// Type test
    TypeTest { test_type: TypeTest },
    /// Type cast/coercion
    Cast { target_type: String },

    // === Memory operations ===
    /// Allocate object
    Alloc { obj_type: String },
    /// Load from memory
    Load { offset: usize },
    /// Store to memory
    Store { offset: usize },
    /// Compare-and-swap
    Cas,

    // === FFI operations ===
    /// Foreign function call
    ForeignCall { foreign_types: Vec<String> },
    /// C function call (from our FFI)
    CCall,
    /// C++ method call
    CppMethodCall,

    // === Exception handling ===
    /// Unwind protect
    UnwindProtect { cleanup_block: usize },
    /// Catch handler
    Catch { tag: DatumId },
    /// Throw operation
    Throw,
    /// Dynamic binding
    DynamicLet { var: DatumId },

    // === Primops (compiler intrinsics) ===
    /// Primop: car
    Car,
    /// Primop: cdr
    Cdr,
    /// Primop: cons
    Cons,
    /// Primop: +
    Add,
    /// Primop: -
    Sub,
    /// Primop: *
    Mul,
    /// Primop: /
    Div,
    /// Primop: = (numeric equality)
    NumEq,
    /// Primop: /= (numeric inequality)
    NumNe,
    /// Primop: < (less than)
    NumLt,
    /// Primop: <= (less than or equal)
    NumLe,
    /// Primop: > (greater than)
    NumGt,
    /// Primop: >= (greater than or equal)
    NumGe,
    /// Primop: eq (identity comparison)
    Eq,
    /// Primop: eql (value comparison)
    Eql,
    /// Primop: equal (structural comparison)
    Equal,
    /// Generic primop
    Primop { name: String },
}

/// Type tests
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum TypeTest {
    Fixnump,
    Consp,
    Symbolp,
    Functionp,
    Numberp,
}

impl Instruction {
    /// Check if this is a terminator (changes control flow)
    pub fn is_terminator(&self) -> bool {
        matches!(
            self.kind,
            InstructionKind::Jump { .. }
                | InstructionKind::If { .. }
                | InstructionKind::Return
                | InstructionKind::Unreachable
                | InstructionKind::Case { .. }
                | InstructionKind::Unwind { .. }
        )
    }

    /// Get successor blocks (for terminators)
    pub fn successors(&self) -> Vec<usize> {
        match &self.kind {
            InstructionKind::Jump { target } => vec![*target],
            InstructionKind::If {
                true_target,
                false_target,
            } => {
                vec![*true_target, *false_target]
            }
            InstructionKind::Case { targets, default } => {
                let mut succs = targets.clone();
                succs.push(*default);
                succs
            }
            InstructionKind::Unwind { target } => vec![*target],
            _ => vec![],
        }
    }

    /// Check if instruction has side effects
    pub fn has_side_effects(&self) -> bool {
        matches!(
            self.kind,
            InstructionKind::WriteVar { .. }
                | InstructionKind::Store { .. }
                | InstructionKind::Call { .. }
                | InstructionKind::MvCall { .. }
                | InstructionKind::LocalCall { .. }
                | InstructionKind::MvLocalCall { .. }
                | InstructionKind::ForeignCall { .. }
                | InstructionKind::CCall
                | InstructionKind::CppMethodCall
                | InstructionKind::Throw
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_terminator_detection() {
        let jump = Instruction {
            id: InstructionId(1),
            kind: InstructionKind::Jump { target: 2 },
            inputs: vec![],
            outputs: vec![],
            iblock: None,
            next: None,
            prev: None,
        };
        assert!(jump.is_terminator());
        assert_eq!(jump.successors(), vec![2]);

        let add = Instruction {
            id: InstructionId(2),
            kind: InstructionKind::Add,
            inputs: vec![DatumId(1), DatumId(2)],
            outputs: vec![DatumId(3)],
            iblock: None,
            next: None,
            prev: None,
        };
        assert!(!add.is_terminator());
        assert!(add.successors().is_empty());
    }

    #[test]
    fn test_conditional_successors() {
        let cond = Instruction {
            id: InstructionId(3),
            kind: InstructionKind::If {
                true_target: 10,
                false_target: 20,
            },
            inputs: vec![DatumId(5)],
            outputs: vec![],
            iblock: None,
            next: None,
            prev: None,
        };
        assert!(cond.is_terminator());
        assert_eq!(cond.successors(), vec![10, 20]);
    }

    #[test]
    fn test_side_effects() {
        let store = Instruction {
            id: InstructionId(4),
            kind: InstructionKind::Store { offset: 0 },
            inputs: vec![DatumId(1), DatumId(2)],
            outputs: vec![],
            iblock: None,
            next: None,
            prev: None,
        };
        assert!(store.has_side_effects());

        let add = Instruction {
            id: InstructionId(5),
            kind: InstructionKind::Add,
            inputs: vec![DatumId(1), DatumId(2)],
            outputs: vec![DatumId(3)],
            iblock: None,
            next: None,
            prev: None,
        };
        assert!(!add.has_side_effects());
    }
}
