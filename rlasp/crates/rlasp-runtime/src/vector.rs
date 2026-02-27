//! Vector type for rlasp runtime

use std::fmt;
use super::object::LispObject;

#[repr(C)]
pub struct RVector {
    header: crate::header::TypeHeader,
    data: Vec<LispObject>,
    dims: Vec<usize>,
    displacement: Option<(usize, usize)>,
    fill_pointer: Option<usize>,
}

impl RVector {
    pub fn new(elements: Vec<LispObject>) -> Self {
        let len = elements.len();
        Self {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::Vector),
            data: elements,
            dims: vec![len],
            displacement: None,
            fill_pointer: None,
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

    pub fn dims(&self) -> &[usize] {
        &self.dims
    }

    pub fn set_dims(&mut self, dims: Vec<usize>) {
        self.dims = dims;
    }

    pub fn displacement(&self) -> Option<(LispObject, usize)> {
        self.displacement
            .map(|(base_raw, offset)| (unsafe { LispObject::from_raw(base_raw) }, offset))
    }

    pub fn set_displacement(&mut self, base: LispObject, offset: usize) {
        self.displacement = Some((base.raw(), offset));
    }

    pub fn clear_displacement(&mut self) {
        self.displacement = None;
    }

    pub fn fill_pointer(&self) -> Option<usize> {
        self.fill_pointer
    }

    pub fn set_fill_pointer(&mut self, fill_pointer: Option<usize>) {
        self.fill_pointer = fill_pointer;
    }

    pub fn allocate(elements: Vec<LispObject>) -> LispObject {
        let ptr = unsafe { crate::gc::gc_allocate_value(RVector::new(elements)).as_ptr() };
        LispObject::from_general_ptr(ptr)
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
