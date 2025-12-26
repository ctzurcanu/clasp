//! Type translation between Lisp and C types
//!
//! Following Clasp's to_object/from_object pattern

use rlasp_runtime::{LispObject, Cons, Symbol, Number};
use std::ffi::{CString, CStr};
use std::os::raw::{c_char, c_int, c_long, c_double, c_void};

/// Error type for conversion failures
#[derive(Debug, thiserror::Error)]
pub enum TypeError {
    #[error("Expected {expected}, got {actual}")]
    TypeMismatch { expected: &'static str, actual: &'static str },

    #[error("Invalid UTF-8 in string")]
    InvalidUtf8,

    #[error("Null pointer")]
    NullPointer,

    #[error("Value out of range")]
    OutOfRange,
}

/// Convert from LispObject to Rust/C type
pub trait FromLisp: Sized {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError>;
}

/// Convert from Rust/C type to LispObject
pub trait ToLisp {
    fn to_lisp(&self) -> LispObject;
}

// === Primitive types ===

impl FromLisp for i64 {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        obj.as_fixnum().ok_or(TypeError::TypeMismatch {
            expected: "fixnum",
            actual: type_name(obj),
        })
    }
}

impl ToLisp for i64 {
    fn to_lisp(&self) -> LispObject {
        LispObject::fixnum(*self)
    }
}

impl FromLisp for i32 {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        let n = i64::from_lisp(obj)?;
        n.try_into().map_err(|_| TypeError::OutOfRange)
    }
}

impl ToLisp for i32 {
    fn to_lisp(&self) -> LispObject {
        LispObject::fixnum(*self as i64)
    }
}

impl FromLisp for f64 {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        obj.as_float().ok_or(TypeError::TypeMismatch {
            expected: "number",
            actual: type_name(obj),
        })
    }
}

impl ToLisp for f64 {
    fn to_lisp(&self) -> LispObject {
        Number::allocate_float(*self)
    }
}

impl FromLisp for bool {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        Ok(!obj.is_nil())
    }
}

impl ToLisp for bool {
    fn to_lisp(&self) -> LispObject {
        if *self {
            LispObject::t()
        } else {
            LispObject::nil()
        }
    }
}

impl FromLisp for char {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        obj.as_character().ok_or(TypeError::TypeMismatch {
            expected: "character",
            actual: type_name(obj),
        })
    }
}

impl ToLisp for char {
    fn to_lisp(&self) -> LispObject {
        LispObject::character(*self)
    }
}

// === C primitive types ===
// Note: c_int, c_long, c_double are type aliases and may conflict
// with i32, i64, f64 on some platforms. Users should use the Rust
// primitive types (i32, i64, f64) which are always available.

// === Pointers ===

impl FromLisp for *mut c_void {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        // For now, treat general objects as pointers
        // In a real implementation, we'd have a foreign pointer type
        if obj.is_general() {
            Ok(obj.as_general_ptr_unchecked::<c_void>() as *mut c_void)
        } else {
            Err(TypeError::TypeMismatch {
                expected: "pointer",
                actual: type_name(obj),
            })
        }
    }
}

impl ToLisp for *mut c_void {
    fn to_lisp(&self) -> LispObject {
        LispObject::from_general_ptr(*self)
    }
}

impl FromLisp for *const c_void {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        <*mut c_void>::from_lisp(obj).map(|p| p as *const c_void)
    }
}

impl ToLisp for *const c_void {
    fn to_lisp(&self) -> LispObject {
        (*self as *mut c_void).to_lisp()
    }
}

// === C strings ===

impl FromLisp for *const c_char {
    fn from_lisp(obj: LispObject) -> Result<Self, TypeError> {
        // In a real implementation, we'd have a string type
        // For now, just return null
        if obj.is_nil() {
            Ok(std::ptr::null())
        } else {
            // TODO: Implement string support
            Err(TypeError::TypeMismatch {
                expected: "string",
                actual: type_name(obj),
            })
        }
    }
}

impl ToLisp for *const c_char {
    fn to_lisp(&self) -> LispObject {
        if self.is_null() {
            LispObject::nil()
        } else {
            // TODO: Implement string conversion
            // For now, return nil
            LispObject::nil()
        }
    }
}

// === Helper functions ===

fn type_name(obj: LispObject) -> &'static str {
    if obj.is_fixnum() {
        "fixnum"
    } else if obj.is_character() {
        "character"
    } else if obj.is_cons() {
        "cons"
    } else if obj.is_general() {
        "general-object"
    } else {
        "unknown"
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fixnum_conversion() {
        let n: i64 = 42;
        let obj = n.to_lisp();
        assert_eq!(i64::from_lisp(obj).unwrap(), 42);
    }

    #[test]
    fn test_bool_conversion() {
        assert!(bool::from_lisp(LispObject::t()).unwrap());
        assert!(!bool::from_lisp(LispObject::nil()).unwrap());
    }

    #[test]
    fn test_char_conversion() {
        let c = 'A';
        let obj = c.to_lisp();
        assert_eq!(char::from_lisp(obj).unwrap(), 'A');
    }

    #[test]
    fn test_float_conversion() {
        let f = 3.14;
        let obj = f.to_lisp();
        let result = f64::from_lisp(obj).unwrap();
        assert!((result - 3.14).abs() < 0.0001);
    }
}
