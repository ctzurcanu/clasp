//! Lisp Error type for runtime errors

use crate::{LispObject, TypeHeader, ObjectType};
use std::alloc::{alloc, Layout};

/// Error types that can occur at runtime
#[repr(u8)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ErrorKind {
    TypeError = 1,
    DivisionByZero = 2,
    UnboundVariable = 3,
    UndefinedFunction = 4,
    InvalidArgument = 5,
    IndexOutOfBounds = 6,
}

/// A Lisp error object
#[repr(C)]
pub struct LispError {
    pub header: TypeHeader,
    pub kind: ErrorKind,
    pub message: Option<String>,
}

impl LispError {
    /// Allocate a new error on the heap
    pub fn allocate(kind: ErrorKind, message: Option<String>) -> LispObject {
        let layout = Layout::new::<LispError>();
        unsafe {
            let ptr = alloc(layout) as *mut LispError;
            // Use ptr::write for proper initialization of uninitialized memory
            std::ptr::write(ptr, LispError {
                header: TypeHeader::new(ObjectType::Error),
                kind,
                message,
            });
            LispObject::from_general_ptr(ptr)
        }
    }

    /// Create a type error
    pub fn type_error(msg: &str) -> LispObject {
        Self::allocate(ErrorKind::TypeError, Some(msg.to_string()))
    }

    /// Create a division by zero error
    pub fn division_by_zero() -> LispObject {
        Self::allocate(ErrorKind::DivisionByZero, Some("Division by zero".to_string()))
    }
}

impl LispObject {
    /// Check if this object is an error
    pub fn is_error(self) -> bool {
        if let Some(ptr) = self.as_general_ptr::<LispError>() {
            if ptr.is_null() {
                return false;
            }
            unsafe {
                TypeHeader::from_ptr(ptr) == Some(ObjectType::Error)
            }
        } else {
            false
        }
    }

    /// Get error kind if this is an error
    pub fn as_error_kind(self) -> Option<ErrorKind> {
        if let Some(ptr) = self.as_general_ptr::<LispError>() {
            unsafe {
                if TypeHeader::from_ptr(ptr) == Some(ObjectType::Error) {
                    Some((*ptr).kind)
                } else {
                    None
                }
            }
        } else {
            None
        }
    }
}
