//! Dynamic library loading
//!
//! Load and access symbols from shared libraries (.so, .dylib, .dll)

use crate::c_ffi::{ForeignFunction, ForeignSignature};
use libloading::{Library as DynLib, Symbol};
use std::ffi::c_void;
use std::path::Path;

/// Wrapper for dynamically loaded library
pub struct Library {
    lib: DynLib,
}

impl Library {
    /// Load a dynamic library
    ///
    /// # Examples
    /// ```ignore
    /// let libc = Library::load("libc.so.6")?;
    /// let strlen = libc.get_function("strlen", signature)?;
    /// ```
    pub fn load<P: AsRef<Path>>(path: P) -> Result<Self, String> {
        unsafe {
            let lib =
                DynLib::new(path.as_ref()).map_err(|e| format!("Failed to load library: {}", e))?;
            Ok(Self { lib })
        }
    }

    /// Get a function pointer by name
    pub fn get_function(
        &self,
        name: &str,
        signature: ForeignSignature,
    ) -> Result<ForeignFunction, String> {
        unsafe {
            let symbol: Symbol<*const c_void> = self
                .lib
                .get(name.as_bytes())
                .map_err(|e| format!("Symbol '{}' not found: {}", name, e))?;

            let ptr = *symbol;
            ForeignFunction::new(ptr, signature)
        }
    }

    /// Get a raw symbol pointer
    pub fn get_symbol(&self, name: &str) -> Result<*const c_void, String> {
        unsafe {
            let symbol: Symbol<*const c_void> = self
                .lib
                .get(name.as_bytes())
                .map_err(|e| format!("Symbol '{}' not found: {}", name, e))?;

            Ok(*symbol)
        }
    }

    /// Load the C standard library
    ///
    /// Platform-specific: uses appropriate libc path for the OS
    pub fn load_libc() -> Result<Self, String> {
        #[cfg(target_os = "linux")]
        let path = "libc.so.6";

        #[cfg(target_os = "macos")]
        let path = "libSystem.dylib";

        #[cfg(target_os = "windows")]
        let path = "msvcrt.dll";

        Self::load(path)
    }

    /// Load the math library
    pub fn load_libm() -> Result<Self, String> {
        #[cfg(target_os = "linux")]
        let path = "libm.so.6";

        #[cfg(target_os = "macos")]
        let path = "libSystem.dylib"; // Math is in libSystem on macOS

        #[cfg(target_os = "windows")]
        let path = "msvcrt.dll";

        Self::load(path)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::c_ffi::ForeignType;
    use crate::types::ToLisp;

    #[test]
    fn test_load_libc() {
        let libc = Library::load_libc();
        assert!(libc.is_ok(), "Failed to load libc: {:?}", libc.err());
    }

    #[test]
    fn test_get_symbol() {
        let libc = Library::load_libc().unwrap();

        // Try to get strlen symbol
        #[cfg(not(target_os = "windows"))]
        {
            let symbol = libc.get_symbol("strlen");
            assert!(symbol.is_ok(), "Failed to get strlen: {:?}", symbol.err());
        }
    }

    #[test]
    #[cfg(not(target_os = "windows"))] // Skip on Windows due to different calling conventions
    fn test_call_strlen() {
        use crate::types::FromLisp;
        use std::ffi::CString;

        let libc = Library::load_libc().unwrap();

        // strlen signature: size_t strlen(const char *s)
        let sig = ForeignSignature {
            return_type: ForeignType::Int64,         // size_t
            param_types: vec![ForeignType::Pointer], // const char*
        };

        let strlen = libc.get_function("strlen", sig).unwrap();

        // Create a test string
        let test_str = CString::new("Hello, World!").unwrap();
        let str_ptr = test_str.as_ptr() as *mut std::ffi::c_void;

        // Convert to LispObject
        let args = vec![str_ptr.to_lisp()];

        // Call strlen
        let result = strlen.call(&args).unwrap();

        // Verify result
        let len = i64::from_lisp(result).unwrap();
        assert_eq!(len, 13); // "Hello, World!" is 13 characters
    }

    #[test]
    fn test_load_libm() {
        let libm = Library::load_libm();
        assert!(libm.is_ok(), "Failed to load libm: {:?}", libm.err());
    }

    #[test]
    #[cfg(not(target_os = "windows"))]
    fn test_call_sqrt() {
        use crate::types::FromLisp;

        let libm = Library::load_libm().unwrap();

        // sqrt signature: double sqrt(double x)
        let sig = ForeignSignature {
            return_type: ForeignType::Double,
            param_types: vec![ForeignType::Double],
        };

        let sqrt_fn = libm.get_function("sqrt", sig).unwrap();

        // Call sqrt(16.0)
        let args = vec![16.0f64.to_lisp()];
        let result = sqrt_fn.call(&args).unwrap();

        let value = f64::from_lisp(result).unwrap();
        assert!((value - 4.0).abs() < 0.0001);
    }
}
