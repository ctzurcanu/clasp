//! Symbols - named objects with value and function cells
//!
//! Following Common Lisp semantics, symbols have:
//! - Name (immutable string)
//! - Package (where the symbol lives)
//! - Value cell (for variables)
//! - Function cell (for functions)
//! - Property list (for arbitrary properties)

use crate::object::LispObject;
use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::Arc;
use parking_lot::RwLock;
use std::collections::HashMap;

/// Symbol structure
///
/// Symbols are heap-allocated and accessed via General pointers
#[repr(C, align(4))]
pub struct Symbol {
    /// Type header (MUST be first field)
    header: crate::header::TypeHeader,

    /// Symbol name (immutable)
    name: Arc<str>,

    /// Package this symbol belongs to
    package: AtomicUsize,  // *const Package

    /// Value cell (for SYMBOL-VALUE)
    value: AtomicUsize,  // LispObject

    /// Function cell (for SYMBOL-FUNCTION)
    function: AtomicUsize,  // LispObject

    /// Property list
    plist: RwLock<HashMap<String, LispObject>>,
}

impl Symbol {
    /// Create a new symbol
    pub fn new(name: impl Into<Arc<str>>) -> Self {
        Self {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::Symbol),
            name: name.into(),
            package: AtomicUsize::new(0),  // Null package initially
            // Use nil_placeholder to avoid circular dependency during NIL_SYMBOL creation
            value: AtomicUsize::new(LispObject::nil_placeholder().raw()),
            function: AtomicUsize::new(LispObject::nil_placeholder().raw()),
            plist: RwLock::new(HashMap::new()),
        }
    }

    /// Get symbol name
    #[inline]
    pub fn name(&self) -> &str {
        &self.name
    }

    /// Get value cell
    #[inline]
    pub fn value(&self) -> LispObject {
        let raw = self.value.load(Ordering::Acquire);
        unsafe { LispObject::from_raw(raw) }
    }

    /// Set value cell
    #[inline]
    pub fn set_value(&self, value: LispObject) {
        self.value.store(value.raw(), Ordering::Release);
    }

    /// Get function cell
    #[inline]
    pub fn function(&self) -> LispObject {
        let raw = self.function.load(Ordering::Acquire);
        unsafe { LispObject::from_raw(raw) }
    }

    /// Set function cell
    #[inline]
    pub fn set_function(&self, func: LispObject) {
        self.function.store(func.raw(), Ordering::Release);
    }

    /// Get property from plist
    pub fn get_property(&self, key: &str) -> Option<LispObject> {
        self.plist.read().get(key).copied()
    }

    /// Set property in plist
    pub fn set_property(&self, key: String, value: LispObject) {
        self.plist.write().insert(key, value);
    }

    /// Allocate a symbol and return LispObject pointer
    pub fn allocate(name: impl Into<Arc<str>>) -> LispObject {
        let symbol = Box::new(Symbol::new(name));
        let ptr = Box::into_raw(symbol);
        LispObject::from_general_ptr(ptr)
    }
}

impl std::fmt::Debug for Symbol {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "Symbol({})", self.name)
    }
}

impl std::fmt::Display for Symbol {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "{}", self.name)
    }
}

/// Symbol interning table
///
/// Ensures symbol identity - two symbols with the same name in the same package
/// are the same object (eq in Lisp terms)
pub struct SymbolTable {
    symbols: RwLock<HashMap<String, LispObject>>,
}

impl SymbolTable {
    pub fn new() -> Self {
        Self {
            symbols: RwLock::new(HashMap::new()),
        }
    }

    /// Intern a symbol
    ///
    /// Returns existing symbol if already interned, otherwise creates new one
    pub fn intern(&self, name: &str) -> LispObject {
        // Fast path: check if already exists
        {
            let symbols = self.symbols.read();
            if let Some(&symbol) = symbols.get(name) {
                return symbol;
            }
        }

        // Slow path: create new symbol
        let mut symbols = self.symbols.write();

        // Check again in case another thread created it
        if let Some(&symbol) = symbols.get(name) {
            return symbol;
        }

        let symbol = Symbol::allocate(name);
        symbols.insert(name.to_string(), symbol);
        symbol
    }

    /// Find symbol without interning
    pub fn find(&self, name: &str) -> Option<LispObject> {
        self.symbols.read().get(name).copied()
    }

    /// Get all interned symbols
    pub fn all_symbols(&self) -> Vec<LispObject> {
        self.symbols.read().values().copied().collect()
    }
}

impl Default for SymbolTable {
    fn default() -> Self {
        Self::new()
    }
}

// Global NIL symbol - the unique empty list / false value
use lazy_static::lazy_static;

lazy_static! {
    /// The NIL symbol - represents both the empty list and the boolean false value
    pub static ref NIL_SYMBOL: LispObject = {
        Symbol::allocate("NIL")
    };

    /// The T symbol - represents the boolean true value
    pub static ref T_SYMBOL: LispObject = {
        Symbol::allocate("T")
    };
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_symbol_creation() {
        let sym = Symbol::new("FOO");
        assert_eq!(sym.name(), "FOO");
        assert!(sym.value().is_nil());
        assert!(sym.function().is_nil());
    }

    #[test]
    fn test_symbol_value() {
        let sym = Symbol::new("X");
        let val = LispObject::fixnum(42);

        sym.set_value(val);
        assert_eq!(sym.value(), val);
    }

    #[test]
    fn test_symbol_interning() {
        let table = SymbolTable::new();

        let sym1 = table.intern("FOO");
        let sym2 = table.intern("FOO");

        // Should be the same object
        assert_eq!(sym1, sym2);

        let sym3 = table.intern("BAR");
        assert_ne!(sym1, sym3);
    }

    #[test]
    fn test_symbol_properties() {
        let sym = Symbol::new("TEST");

        sym.set_property("key1".to_string(), LispObject::fixnum(100));
        assert_eq!(sym.get_property("key1").unwrap().as_fixnum(), Some(100));

        assert!(sym.get_property("nonexistent").is_none());
    }
}
