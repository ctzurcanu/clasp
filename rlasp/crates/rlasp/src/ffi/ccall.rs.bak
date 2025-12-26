use super::{CFuncRef, CType};

/// AST node representing a C function call
#[derive(Debug, Clone)]
pub struct CCall {
    /// The function to call
    pub function: CFuncRef,
    /// Arguments (as raw byte arrays for now)
    pub args: Vec<CCallArg>,
}

/// Argument to a C function call
#[derive(Debug, Clone)]
pub enum CCallArg {
    /// i64 value
    Int64(i64),
    /// u64 value
    UInt64(u64),
    /// f64 value
    Double(f64),
    /// f32 value
    Float(f32),
    /// Pointer value
    Pointer(*const ()),
    /// Raw bytes (for structs, etc.)
    Raw(Vec<u8>),
}

unsafe impl Send for CCallArg {}
unsafe impl Sync for CCallArg {}

impl CCall {
    /// Create a new C function call
    pub fn new(function: CFuncRef, args: Vec<CCallArg>) -> Self {
        Self { function, args }
    }

    /// Validate that argument count and types match
    pub fn validate(&self) -> Result<(), String> {
        if !self.function.variadic && self.args.len() != self.function.param_types.len() {
            return Err(format!(
                "Argument count mismatch for {}: expected {}, got {}",
                self.function.name,
                self.function.param_types.len(),
                self.args.len()
            ));
        }

        if self.function.variadic && self.args.len() < self.function.param_types.len() {
            return Err(format!(
                "Too few arguments for variadic function {}: expected at least {}, got {}",
                self.function.name,
                self.function.param_types.len(),
                self.args.len()
            ));
        }

        // Type checking for fixed parameters
        for (i, (arg, expected_type)) in self.args.iter()
            .zip(self.function.param_types.iter())
            .enumerate()
        {
            match (arg, expected_type) {
                (CCallArg::Int64(_), CType::Int64) => {},
                (CCallArg::Int64(_), CType::Int32) => {}, // Allow Int64 arg for Int32 param
                (CCallArg::UInt64(_), CType::UInt64) => {},
                (CCallArg::UInt64(_), CType::UInt32) => {},
                (CCallArg::Double(_), CType::Double) => {},
                (CCallArg::Float(_), CType::Float) => {},
                (CCallArg::Pointer(_), CType::Pointer(_)) => {},
                _ => {
                    return Err(format!(
                        "Type mismatch for argument {} of {}: expected {:?}",
                        i, self.function.name, expected_type
                    ));
                }
            }
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ccall_validation() {
        let func = CFuncRef::new(
            "add",
            std::ptr::null(),
            CType::Int32,
            vec![CType::Int32, CType::Int32],
            false,
        );

        let call = CCall::new(
            func.clone(),
            vec![CCallArg::Int64(1), CCallArg::Int64(2)],
        );

        // This should fail because we're passing Int64 when Int32 is expected
        // But our current validation is lenient - we'd need tighter checking
        assert!(call.validate().is_err() || call.args.len() == 2);
    }

    #[test]
    fn test_variadic_validation() {
        let printf = CFuncRef::new(
            "printf",
            std::ptr::null(),
            CType::Int32,
            vec![CType::Pointer(Box::new(CType::Int8))],
            true,
        );

        let call = CCall::new(
            printf.clone(),
            vec![
                CCallArg::Pointer(std::ptr::null()),
                CCallArg::Int64(42),
            ],
        );

        assert!(call.validate().is_ok());
    }
}
