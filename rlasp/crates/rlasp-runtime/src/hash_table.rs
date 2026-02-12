//! Hash tables - Common Lisp hash table implementation

use crate::header::{ObjectType, TypeHeader};
use crate::object::LispObject;
use std::collections::HashMap;
use std::sync::{Arc, RwLock};

/// Hash table with Common Lisp semantics
#[repr(C)]
pub struct HashTable {
    header: TypeHeader,
    table: Arc<RwLock<HashMap<u64, (LispObject, LispObject)>>>,
}

impl HashTable {
    /// Create a new empty hash table
    pub fn new() -> Self {
        Self {
            header: TypeHeader::new(ObjectType::HashTable),
            table: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    /// Get a value from the hash table
    pub fn get(&self, key: LispObject) -> Option<LispObject> {
        let hash = Self::hash_object(key);
        let table = self.table.read().unwrap();
        if let Some((stored_key, value)) = table.get(&hash) {
            // Check if keys are actually equal (in case of hash collision)
            if Self::keys_equal(*stored_key, key) {
                Some(*value)
            } else {
                None
            }
        } else {
            None
        }
    }

    /// Put a value in the hash table
    pub fn put(&self, key: LispObject, value: LispObject) {
        let hash = Self::hash_object(key);
        let mut table = self.table.write().unwrap();
        table.insert(hash, (key, value));
    }

    /// Remove a value from the hash table
    pub fn remove(&self, key: LispObject) -> bool {
        let hash = Self::hash_object(key);
        let mut table = self.table.write().unwrap();
        table.remove(&hash).is_some()
    }

    /// Get all key-value pairs
    pub fn entries(&self) -> Vec<(LispObject, LispObject)> {
        let table = self.table.read().unwrap();
        table.iter().map(|(_, (k, v))| (*k, *v)).collect()
    }

    /// Allocate a hash table and return a LispObject pointer to it
    pub fn allocate() -> LispObject {
        let ht = Box::new(HashTable::new());
        let ptr = Box::into_raw(ht);
        LispObject::from_hash_table_ptr(ptr)
    }

    /// Check if two keys are equal (using EQUAL semantics)
    fn keys_equal(a: LispObject, b: LispObject) -> bool {
        // If pointers are the same, they're equal
        if a.raw() == b.raw() {
            return true;
        }

        // For strings, compare content. Guard by runtime type header first.
        if let (Some(a_ty), Some(b_ty)) = (object_type(a), object_type(b)) {
            if a_ty == ObjectType::String && b_ty == ObjectType::String {
                if let (Some(a_ptr), Some(b_ptr)) = (
                    a.as_general_ptr::<crate::string::RString>(),
                    b.as_general_ptr::<crate::string::RString>()
                ) {
                    let a_str = unsafe { &*a_ptr }.as_str();
                    let b_str = unsafe { &*b_ptr }.as_str();
                    return a_str == b_str;
                }
            }
            if a_ty == ObjectType::Symbol && b_ty == ObjectType::Symbol {
                if let (Some(a_ptr), Some(b_ptr)) = (
                    a.as_general_ptr::<crate::symbol::Symbol>(),
                    b.as_general_ptr::<crate::symbol::Symbol>()
                ) {
                    let a_name = unsafe { &*a_ptr }.name();
                    let b_name = unsafe { &*b_ptr }.name();
                    return a_name == b_name;
                }
            }
        }

        // For fixnums, compare values
        if let (Some(a_num), Some(b_num)) = (a.as_fixnum(), b.as_fixnum()) {
            return a_num == b_num;
        }

        // Otherwise, not equal
        false
    }

    /// Simple hash function for LispObject
    fn hash_object(obj: LispObject) -> u64 {
        fn hash_bytes(bytes: &[u8]) -> u64 {
            let mut hash = 0xcbf29ce484222325u64;
            for byte in bytes {
                hash ^= *byte as u64;
                hash = hash.wrapping_mul(0x100000001b3);
            }
            hash
        }

        // For strings, hash the content, not the pointer.
        if object_type(obj) == Some(ObjectType::String) {
            if let Some(str_ptr) = obj.as_general_ptr::<crate::string::RString>() {
                let rstring = unsafe { &*str_ptr };
                return hash_bytes(rstring.as_str().as_bytes());
            }
        }

        // In current JIT model, many symbol objects are freshly allocated.
        // Hash by symbol name to preserve gethash semantics across equivalent symbols.
        if object_type(obj) == Some(ObjectType::Symbol) {
            if let Some(sym_ptr) = obj.as_general_ptr::<crate::symbol::Symbol>() {
                let sym = unsafe { &*sym_ptr };
                return hash_bytes(sym.name().as_bytes());
            }
        }

        // For other objects, use raw value.
        obj.raw() as u64
    }
}

impl LispObject {
    /// Create a LispObject from a hash table pointer
    pub fn from_hash_table_ptr(ptr: *const HashTable) -> Self {
        Self::from_general_ptr(ptr)
    }

    /// Extract hash table pointer if this is a hash table
    pub fn as_hash_table_ptr(&self) -> Option<*const HashTable> {
        let ptr = self.as_general_ptr::<HashTable>()?;
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::HashTable) {
            Some(ptr)
        } else {
            None
        }
    }

    /// Check if this is a hash table
    pub fn is_hash_table(&self) -> bool {
        self.as_hash_table_ptr().is_some()
    }
}

fn object_type(obj: LispObject) -> Option<ObjectType> {
    if !obj.is_general() {
        return None;
    }
    let ptr = obj.as_general_ptr_unchecked::<u8>();
    unsafe { TypeHeader::from_ptr(ptr) }
}

impl Drop for HashTable {
    fn drop(&mut self) {
        // Arc will handle cleanup
    }
}
