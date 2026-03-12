//! Core object representation using tagged pointers
//!
//! Following Clasp's design:
//! - 2-bit tags in low bits of pointer
//! - Immediate values: Fixnum, Character
//! - Heap values: Cons, General objects

use std::fmt;

/// Tag values (2 low bits)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Tag {
    Fixnum = 0b00,      // Immediate 62-bit signed integer
    Cons = 0b01,        // Cons cell pointer (heap)
    Character = 0b10,   // Immediate 30-bit Unicode character
    General = 0b11,     // General heap object pointer
}

impl Tag {
    /// Extract tag from raw pointer value
    #[inline]
    pub fn from_raw(raw: usize) -> Self {
        match raw & 0b11 {
            0b00 => Tag::Fixnum,
            0b01 => Tag::Cons,
            0b10 => Tag::Character,
            0b11 => Tag::General,
            _ => unreachable!(),
        }
    }
}

/// LispObject - tagged pointer representation
///
/// This is the universal type for all Lisp values.
/// Small values (fixnums, characters) are stored directly.
/// Large values are heap-allocated and referenced by pointer.
#[derive(Clone, Copy)]
pub struct LispObject {
    pub(crate) raw: usize,
}

impl LispObject {
    #[inline]
    fn plausible_heap_addr(addr: usize) -> bool {
        if addr < 4096 {
            return false;
        }
        #[cfg(target_pointer_width = "64")]
        if (addr >> 48) != 0 {
            return false;
        }
        true
    }

    // === Constructors ===

    /// Create a fixnum (immediate integer)
    /// Uses 62-bit representation with 2-bit tag for LispObject
    /// Full 64-bit values use bignum representation
    #[inline]
    pub fn fixnum(n: i64) -> Self {
        // Note: Tag::Fixnum == 0b00, so no OR needed
        // Just shift left by 2 to make room for tag
        let raw = ((n as usize) << 2) | (Tag::Fixnum as usize);
        Self { raw }
    }

    /// Create a character (immediate Unicode char)
    #[inline]
    pub fn character(c: char) -> Self {
        // Shift left by 2 to make room for tag
        let raw = ((c as usize) << 2) | (Tag::Character as usize);
        Self { raw }
    }

    /// Create from a cons cell pointer
    #[inline]
    pub fn from_cons_ptr(ptr: *const super::cons::Cons) -> Self {
        debug_assert_eq!(ptr as usize & 0b11, 0, "Cons pointer must be aligned");
        let raw = (ptr as usize) | (Tag::Cons as usize);
        Self { raw }
    }

    /// Create from a general object pointer
    #[inline]
    pub fn from_general_ptr<T>(ptr: *const T) -> Self {
        debug_assert_eq!(ptr as usize & 0b11, 0, "General pointer must be aligned");
        let raw = (ptr as usize) | (Tag::General as usize);
        Self { raw }
    }

    /// Nil constant - returns the global NIL symbol
    /// This is NOT a const fn because it requires lazy initialization
    #[inline]
    pub fn nil() -> Self {
        // Return the global NIL symbol
        // We use fixnum 0 as a temporary placeholder until the symbol is initialized
        // The is_nil() function handles both cases
        *crate::symbol::NIL_SYMBOL
    }

    /// Temporary nil for const contexts where we can't use the global symbol yet
    /// This should only be used during initialization
    #[inline]
    pub(crate) const fn nil_placeholder() -> Self {
        Self { raw: 0b00 }
    }

    /// Boolean true (T in Common Lisp) - returns the global T symbol
    #[inline]
    pub fn t() -> Self {
        *crate::symbol::T_SYMBOL
    }

    // === Predicates ===

    /// Get the tag
    #[inline]
    pub fn tag(self) -> Tag {
        Tag::from_raw(self.raw)
    }

    /// Is this a fixnum?
    #[inline]
    pub fn is_fixnum(self) -> bool {
        self.tag() == Tag::Fixnum
    }

    /// Is this a character?
    #[inline]
    pub fn is_character(self) -> bool {
        self.tag() == Tag::Character
    }

    /// Is this a cons cell?
    #[inline]
    pub fn is_cons(self) -> bool {
        self.tag() == Tag::Cons
    }

    /// Is this a general object?
    #[inline]
    pub fn is_general(self) -> bool {
        self.tag() == Tag::General
    }

    /// Is this nil?
    #[inline]
    pub fn is_nil(self) -> bool {
        self.raw == crate::symbol::NIL_SYMBOL.raw
    }

    // === Accessors ===

    /// Extract fixnum value (unchecked)
    /// Shift right by 2 to remove tag bits
    #[inline]
    pub fn as_fixnum_unchecked(self) -> i64 {
        (self.raw as i64) >> 2
    }

    /// Extract fixnum value
    #[inline]
    pub fn as_fixnum(self) -> Option<i64> {
        if self.is_fixnum() {
            Some(self.as_fixnum_unchecked())
        } else {
            None
        }
    }

    /// Extract character value (unchecked)
    #[inline]
    pub fn as_character_unchecked(self) -> char {
        char::from_u32((self.raw >> 2) as u32).unwrap_or('\0')
    }

    /// Extract character value
    #[inline]
    pub fn as_character(self) -> Option<char> {
        if self.is_character() {
            Some(self.as_character_unchecked())
        } else {
            None
        }
    }

    /// Extract cons pointer (unchecked)
    #[inline]
    pub fn as_cons_ptr_unchecked(self) -> *const super::cons::Cons {
        (self.raw & !0b11) as *const super::cons::Cons
    }

    /// Extract cons pointer
    #[inline]
    pub fn as_cons_ptr(self) -> Option<*const super::cons::Cons> {
        if self.is_cons() {
            let ptr = self.as_cons_ptr_unchecked();
            if Self::plausible_heap_addr(ptr as usize) {
                Some(ptr)
            } else {
                None
            }
        } else {
            None
        }
    }

    /// Extract general object pointer (unchecked)
    #[inline]
    pub fn as_general_ptr_unchecked<T>(self) -> *const T {
        (self.raw & !0b11) as *const T
    }

    /// Extract general object pointer
    #[inline]
    pub fn as_general_ptr<T>(self) -> Option<*const T> {
        if self.is_general() {
            let ptr = self.as_general_ptr_unchecked();
            if Self::plausible_heap_addr(ptr as usize) {
                Some(ptr)
            } else {
                None
            }
        } else {
            None
        }
    }

    /// Get raw value (for debugging)
    #[inline]
    pub fn raw(self) -> usize {
        self.raw
    }
}

// === Equality ===

impl PartialEq for LispObject {
    fn eq(&self, other: &Self) -> bool {
        // For immediate values, compare raw bits
        // For pointers, this is pointer equality (eq in Lisp terms)
        self.raw == other.raw
    }
}

impl Eq for LispObject {}

// === Display ===

impl fmt::Debug for LispObject {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self.tag() {
            Tag::Fixnum => write!(f, "Fixnum({})", self.as_fixnum_unchecked()),
            Tag::Character => write!(f, "Char({:?})", self.as_character_unchecked()),
            Tag::Cons => write!(f, "Cons({:p})", self.as_cons_ptr_unchecked()),
            Tag::General => write!(f, "General({:p})", self.as_general_ptr_unchecked::<()>()),
        }
    }
}

impl fmt::Display for LispObject {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self.tag() {
            Tag::Fixnum => {
                if self.is_nil() {
                    write!(f, "NIL")
                } else {
                    write!(f, "{}", self.as_fixnum_unchecked())
                }
            }
            Tag::Character => write!(f, "#\\{}", self.as_character_unchecked()),
            Tag::Cons => write!(f, "(...)"),  // Will be handled by cons module
            Tag::General => write!(f, "#<OBJECT>"),
        }
    }
}

// === Safety ===
// LispObject can be safely sent between threads
unsafe impl Send for LispObject {}
unsafe impl Sync for LispObject {}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fixnum() {
        let obj = LispObject::fixnum(42);
        assert!(obj.is_fixnum());
        assert_eq!(obj.as_fixnum(), Some(42));

        // Test negative
        let neg = LispObject::fixnum(-100);
        assert_eq!(neg.as_fixnum(), Some(-100));
    }

    #[test]
    fn test_character() {
        let obj = LispObject::character('A');
        assert!(obj.is_character());
        assert_eq!(obj.as_character(), Some('A'));

        // Test Unicode
        let unicode = LispObject::character('λ');
        assert_eq!(unicode.as_character(), Some('λ'));
    }

    #[test]
    fn test_nil() {
        let nil = LispObject::nil();
        assert!(nil.is_nil());
        assert!(nil.is_fixnum());
        assert_eq!(nil.as_fixnum(), Some(0));
    }

    #[test]
    fn test_tag_extraction() {
        assert_eq!(LispObject::fixnum(42).tag(), Tag::Fixnum);
        assert_eq!(LispObject::character('x').tag(), Tag::Character);
        assert_eq!(LispObject::nil().tag(), Tag::Fixnum);
    }

    #[test]
    fn test_equality() {
        let a = LispObject::fixnum(42);
        let b = LispObject::fixnum(42);
        let c = LispObject::fixnum(43);

        assert_eq!(a, b);
        assert_ne!(a, c);
    }
}
