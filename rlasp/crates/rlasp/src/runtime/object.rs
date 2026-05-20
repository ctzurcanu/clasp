/// Lisp object representation (tagged pointer, like Clasp's gctools::smart_ptr)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct LispObject {
    ptr: usize,
}

/// Tag bits (2 low bits)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Tag {
    Fixnum = 0b00,    // Immediate 62-bit integer
    Cons = 0b01,      // Cons cell pointer
    Character = 0b10, // Immediate Unicode char
    General = 0b11,   // Heap object pointer
}

const TAG_MASK: usize = 0b11;
const TAG_SHIFT: usize = 2;

impl LispObject {
    /// Create from a tagged pointer value
    pub fn from_raw(ptr: usize) -> Self {
        Self { ptr }
    }

    /// Get the raw tagged pointer value
    pub fn as_raw(&self) -> usize {
        self.ptr
    }

    /// Get the tag
    pub fn tag(&self) -> Tag {
        match self.ptr & TAG_MASK {
            0b00 => Tag::Fixnum,
            0b01 => Tag::Cons,
            0b10 => Tag::Character,
            0b11 => Tag::General,
            _ => unreachable!(),
        }
    }

    /// Create a fixnum (immediate integer)
    pub fn from_fixnum(value: i64) -> Self {
        let tagged = ((value as usize) << TAG_SHIFT) | (Tag::Fixnum as usize);
        Self { ptr: tagged }
    }

    /// Extract fixnum value
    pub fn as_fixnum(&self) -> Option<i64> {
        if self.tag() == Tag::Fixnum {
            Some((self.ptr as i64) >> TAG_SHIFT)
        } else {
            None
        }
    }

    /// Create a character (immediate)
    pub fn from_char(c: char) -> Self {
        let tagged = ((c as usize) << TAG_SHIFT) | (Tag::Character as usize);
        Self { ptr: tagged }
    }

    /// Extract character value
    pub fn as_char(&self) -> Option<char> {
        if self.tag() == Tag::Character {
            let code = self.ptr >> TAG_SHIFT;
            char::from_u32(code as u32)
        } else {
            None
        }
    }

    /// NIL constant
    pub const NIL: LispObject = LispObject {
        ptr: Tag::General as usize,
    };

    /// Create NIL (for non-const contexts)
    pub fn nil() -> Self {
        Self::NIL
    }

    /// Check if this is NIL
    pub fn is_nil(&self) -> bool {
        self.ptr == Self::NIL.ptr
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fixnum() {
        let obj = LispObject::from_fixnum(42);
        assert_eq!(obj.tag(), Tag::Fixnum);
        assert_eq!(obj.as_fixnum(), Some(42));
    }

    #[test]
    fn test_char() {
        let obj = LispObject::from_char('A');
        assert_eq!(obj.tag(), Tag::Character);
        assert_eq!(obj.as_char(), Some('A'));
    }

    #[test]
    fn test_nil() {
        let nil = LispObject::NIL;
        assert!(nil.is_nil());
        assert_eq!(nil.tag(), Tag::General);
    }

    #[test]
    fn test_negative_fixnum() {
        let obj = LispObject::from_fixnum(-100);
        assert_eq!(obj.as_fixnum(), Some(-100));
    }
}
