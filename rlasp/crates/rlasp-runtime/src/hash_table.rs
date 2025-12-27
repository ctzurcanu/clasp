//! Hash tables - Common Lisp hash table implementation

use crate::object::LispObject;
use std::collections::HashMap;
use std::sync::{Arc, RwLock};

/// Hash table with Common Lisp semantics
#[repr(C)]
pub struct HashTable {
    table: Arc<RwLock<HashMap<u64, (LispObject, LispObject)>>>,
}

impl HashTable {
    /// Create a new empty hash table
    pub fn new() -> Self {
        Self {
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

        // For strings, compare content
        if let (Some(a_ptr), Some(b_ptr)) = (
            a.as_general_ptr::<crate::string::RString>(),
            b.as_general_ptr::<crate::string::RString>()
        ) {
            let a_str = unsafe { &*a_ptr }.as_str();
            let b_str = unsafe { &*b_ptr }.as_str();
            return a_str == b_str;
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
        // For strings, hash the content, not the pointer
        if let Some(str_ptr) = obj.as_general_ptr::<crate::string::RString>() {
            let rstring = unsafe { &*str_ptr };
            let s = rstring.as_str();
            // Simple hash function for strings (FNV-1a)
            let mut hash = 0xcbf29ce484222325u64;
            for byte in s.bytes() {
                hash ^= byte as u64;
                hash = hash.wrapping_mul(0x100000001b3);
            }
            hash
        } else {
            // For other objects, use raw value
            obj.raw() as u64
        }
    }
}

impl LispObject {
    /// Create a LispObject from a hash table pointer
    pub fn from_hash_table_ptr(ptr: *const HashTable) -> Self {
        let raw = (ptr as usize) | 0b01; // Use tag 01 for hash tables
        unsafe { Self::from_raw(raw) }
    }

    /// Extract hash table pointer if this is a hash table
    pub fn as_hash_table_ptr(&self) -> Option<*const HashTable> {
        if (self.raw & 0b11) == 0b01 {
            Some((self.raw & !0b11) as *const HashTable)
        } else {
            None
        }
    }

    /// Check if this is a hash table
    pub fn is_hash_table(&self) -> bool {
        self.as_hash_table_ptr().is_some()
    }
}

impl Drop for HashTable {
    fn drop(&mut self) {
        // Arc will handle cleanup
    }
}
