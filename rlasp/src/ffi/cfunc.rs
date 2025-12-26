use super::ctypes::CType;
use std::ffi::CString;

/// Reference to a C function
#[derive(Debug, Clone)]
pub struct CFuncRef {
    /// Function name (for debugging)
    pub name: String,
    /// Function pointer address
    pub address: *const (),
    /// Return type
    pub return_type: CType,
    /// Parameter types
    pub param_types: Vec<CType>,
    /// Is variadic (e.g., printf)
    pub variadic: bool,
}

unsafe impl Send for CFuncRef {}
unsafe impl Sync for CFuncRef {}

impl CFuncRef {
    /// Create a new C function reference
    pub fn new(
        name: impl Into<String>,
        address: *const (),
        return_type: CType,
        param_types: Vec<CType>,
        variadic: bool,
    ) -> Self {
        Self {
            name: name.into(),
            address,
            return_type,
            param_types,
            variadic,
        }
    }

    /// Load a function from a dynamic library by name
    pub fn from_library(
        library: &libloading::Library,
        name: &str,
        return_type: CType,
        param_types: Vec<CType>,
        variadic: bool,
    ) -> Result<Self, String> {
        unsafe {
            let symbol: libloading::Symbol<*const ()> = library
                .get(name.as_bytes())
                .map_err(|e| format!("Failed to load symbol {}: {}", name, e))?;

            Ok(Self::new(
                name,
                *symbol,
                return_type,
                param_types,
                variadic,
            ))
        }
    }

    /// Get function signature as a string
    pub fn signature(&self) -> String {
        let params = self.param_types
            .iter()
            .enumerate()
            .map(|(i, ty)| format!("arg{}: {:?}", i, ty))
            .collect::<Vec<_>>()
            .join(", ");

        format!(
            "{}({}{}) -> {:?}",
            self.name,
            params,
            if self.variadic { ", ..." } else { "" },
            self.return_type
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cfunc_creation() {
        let func = CFuncRef::new(
            "strlen",
            libc::strlen as *const (),
            CType::UInt64,
            vec![CType::Pointer(Box::new(CType::Int8))],
            false,
        );

        assert_eq!(func.name, "strlen");
        assert!(!func.variadic);
        assert_eq!(func.param_types.len(), 1);
    }

    #[test]
    fn test_signature() {
        let func = CFuncRef::new(
            "add",
            std::ptr::null(),
            CType::Int32,
            vec![CType::Int32, CType::Int32],
            false,
        );

        let sig = func.signature();
        assert!(sig.contains("add"));
        assert!(sig.contains("Int32"));
    }
}
