//! Type headers for General objects
//!
//! All heap-allocated objects now have a TypeHeader as their first field
//! to enable reliable type checking.

/// Type discriminator for General objects
#[repr(u8)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ObjectType {
    Symbol = 1,
    Number = 2,
    Cons = 3,
    String = 4,
    Vector = 5,
    Package = 6,
}

/// Header placed at the start of every General object
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct TypeHeader {
    /// Type discriminator
    pub obj_type: ObjectType,
    /// Padding for alignment
    _padding: [u8; 7],
}

impl TypeHeader {
    pub fn new(obj_type: ObjectType) -> Self {
        TypeHeader {
            obj_type,
            _padding: [0; 7],
        }
    }

    /// Read the type header from a pointer
    pub unsafe fn from_ptr<T>(ptr: *const T) -> Option<ObjectType> {
        if ptr.is_null() {
            return None;
        }
        let header_ptr = ptr as *const TypeHeader;
        Some((*header_ptr).obj_type)
    }
}
