/// C++ overload resolution
///
/// Supports calling the correct C++ method when multiple overloads exist.
/// Simplified version of C++ overload resolution rules.
use super::{CCallArg, CType};

/// Represents a C++ method overload
#[derive(Debug, Clone)]
pub struct Overload {
    pub name: String,
    pub params: Vec<CType>,
    pub return_type: CType,
    pub func_ptr: *const (),
}

/// Collection of overloaded methods
pub struct OverloadSet {
    pub name: String,
    pub overloads: Vec<Overload>,
}

impl OverloadSet {
    pub fn new(name: impl Into<String>) -> Self {
        Self {
            name: name.into(),
            overloads: Vec::new(),
        }
    }

    /// Add an overload to the set
    pub fn add_overload(&mut self, params: Vec<CType>, return_type: CType, func_ptr: *const ()) {
        self.overloads.push(Overload {
            name: self.name.clone(),
            params,
            return_type,
            func_ptr,
        });
    }

    /// Find the best matching overload for given arguments
    pub fn resolve(&self, args: &[CCallArg]) -> Option<&Overload> {
        // First pass: exact matches
        for overload in &self.overloads {
            if overload.params.len() != args.len() {
                continue;
            }
            if args
                .iter()
                .zip(&overload.params)
                .all(|(arg, param)| exact_match(arg, param))
            {
                return Some(overload);
            }
        }

        // Second pass: compatible matches with implicit conversions
        for overload in &self.overloads {
            if overload.params.len() != args.len() {
                continue;
            }
            if args
                .iter()
                .zip(&overload.params)
                .all(|(arg, param)| is_convertible(arg, param))
            {
                return Some(overload);
            }
        }

        None
    }
}

/// Check if argument exactly matches parameter type
fn exact_match(arg: &CCallArg, param: &CType) -> bool {
    match (arg, param) {
        (CCallArg::Int64(_), CType::Int64) => true,
        (CCallArg::Int64(_), CType::Int32) => false, // Not exact
        (CCallArg::UInt64(_), CType::UInt64) => true,
        (CCallArg::Double(_), CType::Double) => true,
        (CCallArg::Float(_), CType::Float) => true,
        (CCallArg::Pointer(_), CType::Pointer(_)) => true,
        _ => false,
    }
}

/// Check if argument can be implicitly converted to parameter type
fn is_convertible(arg: &CCallArg, param: &CType) -> bool {
    match (arg, param) {
        // Exact matches
        (CCallArg::Int64(_), CType::Int64) => true,
        (CCallArg::UInt64(_), CType::UInt64) => true,
        (CCallArg::Double(_), CType::Double) => true,
        (CCallArg::Float(_), CType::Float) => true,
        (CCallArg::Pointer(_), CType::Pointer(_)) => true,

        // Integer narrowing conversions
        (CCallArg::Int64(_), CType::Int32) => true,
        (CCallArg::Int64(_), CType::Int16) => true,
        (CCallArg::Int64(_), CType::Int8) => true,

        // Integer widening conversions
        (CCallArg::Int64(_), CType::UInt64) => true,

        // Floating point conversions
        (CCallArg::Float(_), CType::Double) => true,
        (CCallArg::Double(_), CType::Float) => true,

        // Integer to floating point
        (CCallArg::Int64(_), CType::Double) => true,
        (CCallArg::Int64(_), CType::Float) => true,

        _ => false,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_exact_match() {
        let mut set = OverloadSet::new("test");

        // Overload 1: test(int, int)
        set.add_overload(
            vec![CType::Int64, CType::Int64],
            CType::Int64,
            0x1000 as *const (),
        );

        // Overload 2: test(double, double)
        set.add_overload(
            vec![CType::Double, CType::Double],
            CType::Double,
            0x2000 as *const (),
        );

        // Call with (int, int) - should match overload 1
        let args = vec![CCallArg::Int64(1), CCallArg::Int64(2)];
        let resolved = set.resolve(&args).unwrap();
        assert_eq!(resolved.func_ptr, 0x1000 as *const ());

        // Call with (double, double) - should match overload 2
        let args = vec![CCallArg::Double(1.0), CCallArg::Double(2.0)];
        let resolved = set.resolve(&args).unwrap();
        assert_eq!(resolved.func_ptr, 0x2000 as *const ());
    }

    #[test]
    fn test_implicit_conversion() {
        let mut set = OverloadSet::new("test");

        // Only overload: test(double)
        set.add_overload(vec![CType::Double], CType::Double, 0x1000 as *const ());

        // Call with int - should convert to double
        let args = vec![CCallArg::Int64(42)];
        let resolved = set.resolve(&args).unwrap();
        assert_eq!(resolved.func_ptr, 0x1000 as *const ());

        // Call with float - should convert to double
        let args = vec![CCallArg::Float(3.14)];
        let resolved = set.resolve(&args).unwrap();
        assert_eq!(resolved.func_ptr, 0x1000 as *const ());
    }

    #[test]
    fn test_no_match() {
        let mut set = OverloadSet::new("test");

        // Only overload: test(int, int)
        set.add_overload(
            vec![CType::Int64, CType::Int64],
            CType::Int64,
            0x1000 as *const (),
        );

        // Call with wrong number of arguments
        let args = vec![CCallArg::Int64(1)];
        assert!(set.resolve(&args).is_none());

        // Call with 3 arguments
        let args = vec![CCallArg::Int64(1), CCallArg::Int64(2), CCallArg::Int64(3)];
        assert!(set.resolve(&args).is_none());
    }

    #[test]
    fn test_overload_priority() {
        let mut set = OverloadSet::new("test");

        // Overload 1: test(int) - exact match for int
        set.add_overload(vec![CType::Int64], CType::Int64, 0x1000 as *const ());

        // Overload 2: test(double) - conversion from int
        set.add_overload(vec![CType::Double], CType::Double, 0x2000 as *const ());

        // Call with int - should prefer exact match (overload 1)
        let args = vec![CCallArg::Int64(42)];
        let resolved = set.resolve(&args).unwrap();
        assert_eq!(resolved.func_ptr, 0x1000 as *const ());

        // Call with double - should match overload 2
        let args = vec![CCallArg::Double(3.14)];
        let resolved = set.resolve(&args).unwrap();
        assert_eq!(resolved.func_ptr, 0x2000 as *const ());
    }
}
