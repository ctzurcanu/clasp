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
    Closure = 7,
    Error = 8,
    Pathname = 9,
    Stream = 10,
    HashTable = 11,
}

impl ObjectType {
    #[inline]
    pub const fn from_u8(tag: u8) -> Option<Self> {
        match tag {
            1 => Some(Self::Symbol),
            2 => Some(Self::Number),
            3 => Some(Self::Cons),
            4 => Some(Self::String),
            5 => Some(Self::Vector),
            6 => Some(Self::Package),
            7 => Some(Self::Closure),
            8 => Some(Self::Error),
            9 => Some(Self::Pathname),
            10 => Some(Self::Stream),
            11 => Some(Self::HashTable),
            _ => None,
        }
    }
}

/// Header placed at the start of every General object
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct TypeHeader {
    /// Raw type discriminator byte (validated on read)
    pub obj_type_tag: u8,
    /// Padding for alignment
    _padding: [u8; 7],
}

impl TypeHeader {
    pub fn new(obj_type: ObjectType) -> Self {
        TypeHeader {
            obj_type_tag: obj_type as u8,
            _padding: [0; 7],
        }
    }

    #[inline]
    pub fn object_type(&self) -> Option<ObjectType> {
        ObjectType::from_u8(self.obj_type_tag)
    }

    /// Read the type header from a pointer
    pub unsafe fn from_ptr<T>(ptr: *const T) -> Option<ObjectType> {
        if ptr.is_null() {
            return None;
        }
        let tag = *(ptr as *const u8);
        ObjectType::from_u8(tag)
    }
}
