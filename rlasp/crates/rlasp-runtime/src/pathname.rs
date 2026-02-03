//! Pathname representation for Common Lisp pathnames

use crate::header::{TypeHeader, ObjectType};
use crate::object::LispObject;

/// A pathname represents a file system path
#[repr(C)]
pub struct Pathname {
    pub header: TypeHeader,
    /// Host component (nil or string)
    pub host: LispObject,
    /// Device component (nil or string)
    pub device: LispObject,
    /// Directory component (nil or list)
    pub directory: LispObject,
    /// Name component (nil or string)
    pub name: LispObject,
    /// Type component (nil or string)
    pub type_: LispObject,
    /// Version component (nil, :newest, :wild, or integer)
    pub version: LispObject,
}

impl Pathname {
    /// Create a new pathname
    pub fn new(
        host: LispObject,
        device: LispObject,
        directory: LispObject,
        name: LispObject,
        type_: LispObject,
        version: LispObject,
    ) -> Self {
        Pathname {
            header: TypeHeader::new(ObjectType::Pathname),
            host,
            device,
            directory,
            name,
            type_,
            version,
        }
    }

    /// Create an empty pathname
    pub fn empty() -> Self {
        Pathname::new(
            LispObject::nil(),
            LispObject::nil(),
            LispObject::nil(),
            LispObject::nil(),
            LispObject::nil(),
            LispObject::nil(),
        )
    }
}

impl LispObject {
    /// Check if this object is a pathname
    pub fn is_pathname(self) -> bool {
        use crate::header::TypeHeader;
        if let Some(ptr) = self.as_general_ptr::<Pathname>() {
            if ptr.is_null() {
                return false;
            }
            unsafe {
                TypeHeader::from_ptr(ptr) == Some(ObjectType::Pathname)
            }
        } else {
            false
        }
    }

    /// Get as pathname pointer if this is a pathname
    pub fn as_pathname_ptr(self) -> Option<*const Pathname> {
        if self.is_pathname() {
            self.as_general_ptr::<Pathname>()
        } else {
            None
        }
    }
}
