//! Vector type for rlasp runtime

use std::fmt;
use super::object::LispObject;

#[repr(C)]
pub struct RVector {
    header: crate::header::TypeHeader,
    data: Vec<LispObject>,
}

impl RVector {
    pub fn new(elements: Vec<LispObject>) -> Self {
        Self {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::Vector),
            data: elements,
        }
    }

    pub fn len(&self) -> usize {
        self.data.len()
    }

    pub fn is_empty(&self) -> bool {
        self.data.is_empty()
    }

    pub fn get(&self, index: usize) -> Option<LispObject> {
        self.data.get(index).copied()
    }

    pub fn set(&mut self, index: usize, value: LispObject) {
        if index < self.data.len() {
            self.data[index] = value;
        }
    }

    pub fn as_slice(&self) -> &[LispObject] {
        &self.data
    }

    pub fn allocate(elements: Vec<LispObject>) -> LispObject {
        let vector = Box::new(RVector::new(elements));
        LispObject::from_general_ptr(Box::into_raw(vector))
    }
}

impl fmt::Debug for RVector {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "#(")?;
        for (i, elem) in self.data.iter().enumerate() {
            if i > 0 {
                write!(f, " ")?;
            }
            write!(f, "{:?}", elem)?;
        }
        write!(f, ")")
    }
}

impl fmt::Display for RVector {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "#(")?;
        for (i, elem) in self.data.iter().enumerate() {
            if i > 0 {
                write!(f, " ")?;
            }
            write!(f, "{}", elem)?;
        }
        write!(f, ")")
    }
}
