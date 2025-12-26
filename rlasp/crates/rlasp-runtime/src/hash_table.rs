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
        table.get(&hash).map(|(_, v)| *v)
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

    /// Simple hash function for LispObject
    fn hash_object(obj: LispObject) -> u64 {
        obj.raw() as u64
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
