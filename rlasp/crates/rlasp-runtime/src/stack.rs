//! Two-stack architecture for type-safe runtime
//!
//! Stack 1 (Metadata): 4 bytes per entry (2 bytes length + 2 bytes type)
//! Stack 2 (Data): Variable-length raw data
//!
//! Common Lisp Compatibility:
//! - Each thread has its own stacks (per CL spec)
//! - No mutex contention for single-threaded evaluation
//! - Supports CL's dynamic extent and thread-local bindings

use std::cell::RefCell;

/// Type discriminant (2 bytes)
#[repr(u16)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TypeTag {
    Nil = 0,
    Fixnum = 1,
    Character = 2,
    Symbol = 3,
    Cons = 4,
    Float = 5,
    Bignum = 6,
    Ratio = 7,
    Complex = 8,
    String = 9,
    Error = 10,
}

/// Metadata entry: 4 bytes total
#[repr(C, packed)]
#[derive(Debug, Clone, Copy)]
pub struct MetadataEntry {
    /// Length in Stack 2 (in bytes, u16 = up to 65KB per object)
    pub length: u16,
    /// Type discriminant
    pub type_tag: u16,
}

/// Index into the stacks (32-bit for efficiency)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct StackIndex(u32);

impl StackIndex {
    pub fn new(index: u32) -> Self {
        StackIndex(index)
    }

    pub fn as_u32(self) -> u32 {
        self.0
    }

    pub fn is_null(self) -> bool {
        self.0 == 0
    }

    /// Null/nil index
    pub fn nil() -> Self {
        StackIndex(0)
    }
}

/// Global metadata stack
pub struct MetadataStack {
    entries: Vec<MetadataEntry>,
}

impl MetadataStack {
    fn new() -> Self {
        let mut stack = MetadataStack {
            entries: Vec::with_capacity(1024),
        };
        // Reserve index 0 for nil
        stack.entries.push(MetadataEntry {
            length: 0,
            type_tag: TypeTag::Nil as u16,
        });
        stack
    }

    pub fn allocate(&mut self, length: u16, type_tag: TypeTag) -> StackIndex {
        let index = self.entries.len() as u32;
        self.entries.push(MetadataEntry {
            length,
            type_tag: type_tag as u16,
        });
        StackIndex(index)
    }

    pub fn get(&self, index: StackIndex) -> Option<&MetadataEntry> {
        self.entries.get(index.0 as usize)
    }
}

/// Global data stack
pub struct DataStack {
    data: Vec<u8>,
}

impl DataStack {
    fn new() -> Self {
        DataStack {
            data: Vec::with_capacity(1024 * 1024), // 1MB initial
        }
    }

    pub fn allocate(&mut self, data: &[u8]) -> u32 {
        let offset = self.data.len() as u32;
        self.data.extend_from_slice(data);
        offset
    }

    pub fn get_slice(&self, offset: u32, length: u16) -> Option<&[u8]> {
        let start = offset as usize;
        let end = start + length as usize;
        self.data.get(start..end)
    }

    pub fn get_slice_mut(&mut self, offset: u32, length: u16) -> Option<&mut [u8]> {
        let start = offset as usize;
        let end = start + length as usize;
        self.data.get_mut(start..end)
    }
}

// Thread-local stacks - CL compatible (each thread has its own stacks)
thread_local! {
    /// Thread-local metadata stack
    static METADATA_STACK: RefCell<MetadataStack> = RefCell::new(MetadataStack::new());
    /// Thread-local data stack
    static DATA_STACK: RefCell<DataStack> = RefCell::new(DataStack::new());
}

/// Object handle combining metadata index and data offset
#[derive(Debug, Clone, Copy)]
pub struct ObjectHandle {
    /// Index into metadata stack
    metadata_index: StackIndex,
    /// Offset into data stack (0 if no data, e.g., nil, fixnum immediate)
    data_offset: u32,
}

impl ObjectHandle {
    pub fn new(metadata_index: StackIndex, data_offset: u32) -> Self {
        ObjectHandle {
            metadata_index,
            data_offset,
        }
    }

    pub fn nil() -> Self {
        ObjectHandle {
            metadata_index: StackIndex::nil(),
            data_offset: 0,
        }
    }

    pub fn metadata_index(&self) -> StackIndex {
        self.metadata_index
    }

    pub fn data_offset(&self) -> u32 {
        self.data_offset
    }

    pub fn get_type(&self) -> Option<TypeTag> {
        METADATA_STACK.with(|meta_stack| {
            meta_stack.borrow().get(self.metadata_index).map(|entry| {
                // Safe because TypeTag is repr(u16)
                unsafe { std::mem::transmute::<u16, TypeTag>(entry.type_tag) }
            })
        })
    }

    pub fn get_data(&self) -> Option<Vec<u8>> {
        METADATA_STACK.with(|meta_stack| {
            DATA_STACK.with(|data_stack| {
                let meta = meta_stack.borrow();
                let data = data_stack.borrow();

                if let Some(entry) = meta.get(self.metadata_index) {
                    if entry.length == 0 {
                        return Some(Vec::new());
                    }
                    data.get_slice(self.data_offset, entry.length)
                        .map(|slice| slice.to_vec())
                } else {
                    None
                }
            })
        })
    }
}

/// Allocate an object with metadata and data
pub fn allocate_object(type_tag: TypeTag, data: &[u8]) -> ObjectHandle {
    METADATA_STACK.with(|meta_stack| {
        DATA_STACK.with(|data_stack| {
            let data_offset = if data.is_empty() {
                0
            } else {
                data_stack.borrow_mut().allocate(data)
            };

            let metadata_index = meta_stack
                .borrow_mut()
                .allocate(data.len() as u16, type_tag);

            ObjectHandle::new(metadata_index, data_offset)
        })
    })
}

/// Access the current thread's metadata stack
pub fn with_metadata_stack<F, R>(f: F) -> R
where
    F: FnOnce(&mut MetadataStack) -> R,
{
    METADATA_STACK.with(|stack| f(&mut stack.borrow_mut()))
}

/// Access the current thread's data stack
pub fn with_data_stack<F, R>(f: F) -> R
where
    F: FnOnce(&mut DataStack) -> R,
{
    DATA_STACK.with(|stack| f(&mut stack.borrow_mut()))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_nil() {
        let nil = ObjectHandle::nil();
        assert_eq!(nil.get_type(), Some(TypeTag::Nil));
    }

    #[test]
    fn test_allocate_object() {
        let data = vec![1, 2, 3, 4];
        let handle = allocate_object(TypeTag::Fixnum, &data);
        assert_eq!(handle.get_type(), Some(TypeTag::Fixnum));
        assert_eq!(handle.get_data(), Some(data));
    }
}
