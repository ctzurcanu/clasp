/// Datum - Runtime values in the IR (Cleavir2-style)
///
/// Represents data flow in the IR. Modeled after Cleavir's datum hierarchy:
/// - Value: Single-definition SSA values
/// - LinearDatum: Single-use constraint
/// - Variable: Mutable lexical variables
/// - Phi: SSA merge points

use std::fmt;

/// Unique ID for a datum
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct DatumId(pub usize);

impl fmt::Display for DatumId {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "%{}", self.0)
    }
}

/// Abstract base for all data in the IR
#[derive(Debug, Clone)]
pub enum Datum {
    /// Compile-time constant
    Constant(Constant),
    /// SSA output from an instruction
    Output(Output),
    /// Phi node for SSA merges
    Phi(Phi),
    /// Mutable lexical variable
    Variable(Variable),
    /// Function parameter
    Argument(Argument),
    /// Function cell (for redefinition)
    FunctionCell(FunctionCell),
    /// Load-time computed value
    LoadTimeValue(LoadTimeValue),
}

impl Datum {
    pub fn id(&self) -> DatumId {
        match self {
            Datum::Constant(c) => c.id,
            Datum::Output(o) => o.id,
            Datum::Phi(p) => p.id,
            Datum::Variable(v) => v.id,
            Datum::Argument(a) => a.id,
            Datum::FunctionCell(f) => f.id,
            Datum::LoadTimeValue(l) => l.id,
        }
    }

    /// Check if this datum is SSA (single-definition)
    pub fn is_ssa(&self) -> bool {
        matches!(self, Datum::Constant(_) | Datum::Output(_) | Datum::Phi(_))
    }

    /// Check if this datum is linear (single-use)
    pub fn is_linear(&self) -> bool {
        matches!(self, Datum::Output(_))
    }
}

/// Compile-time constant value
#[derive(Debug, Clone)]
pub struct Constant {
    pub id: DatumId,
    pub value: ConstantValue,
}

/// Constant value types
#[derive(Debug, Clone, PartialEq)]
pub enum ConstantValue {
    Fixnum(i64),
    Bignum(String), // String representation of large integer
    Float(f64),
    Character(char),
    String(String),
    Nil,
    T,
    Symbol(String),
}

/// SSA output from an instruction (single-def, single-use)
#[derive(Debug, Clone)]
pub struct Output {
    pub id: DatumId,
    /// Instruction that produces this output
    pub instruction: Option<usize>,
}

/// Phi node for SSA form (merges values from different control flow paths)
#[derive(Debug, Clone)]
pub struct Phi {
    pub id: DatumId,
    /// Basic block this phi belongs to
    pub iblock: Option<usize>,
    /// Input datums from predecessor blocks
    pub inputs: Vec<DatumId>,
}

/// Mutable lexical variable (not SSA)
#[derive(Debug, Clone)]
pub struct Variable {
    pub id: DatumId,
    pub name: Option<String>,
    /// Set of instructions that define this variable
    pub definitions: Vec<usize>,
    /// Set of instructions that use this variable
    pub uses: Vec<usize>,
}

/// Function parameter
#[derive(Debug, Clone)]
pub struct Argument {
    pub id: DatumId,
    pub position: usize,
    pub name: Option<String>,
}

/// Function cell for dynamic redefinition
#[derive(Debug, Clone)]
pub struct FunctionCell {
    pub id: DatumId,
    pub name: String,
}

/// Load-time computed value
#[derive(Debug, Clone)]
pub struct LoadTimeValue {
    pub id: DatumId,
    /// Form to evaluate at load time
    pub form: String,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_datum_ssa() {
        let const_datum = Datum::Constant(Constant {
            id: DatumId(1),
            value: ConstantValue::Fixnum(42),
        });
        assert!(const_datum.is_ssa());

        let var_datum = Datum::Variable(Variable {
            id: DatumId(2),
            name: Some("x".to_string()),
            definitions: vec![],
            uses: vec![],
        });
        assert!(!var_datum.is_ssa());
    }

    #[test]
    fn test_output_linear() {
        let output = Datum::Output(Output {
            id: DatumId(3),
            instruction: Some(10),
        });
        assert!(output.is_linear());
        assert!(output.is_ssa());
    }

    #[test]
    fn test_phi_merge() {
        let phi = Datum::Phi(Phi {
            id: DatumId(4),
            iblock: Some(5),
            inputs: vec![DatumId(1), DatumId(2)],
        });
        assert!(phi.is_ssa());
        assert!(!phi.is_linear());
    }
}
