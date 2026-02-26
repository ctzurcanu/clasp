//! String type for rlasp runtime

use std::fmt;
use super::object::LispObject;

#[repr(C)]
pub struct RString {
    header: crate::header::TypeHeader,
    data: String,
    ascii_only: bool,
}

impl RString {
    pub fn new(s: String) -> Self {
        let ascii_only = s.is_ascii();
        Self {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::String),
            data: s,
            ascii_only,
        }
    }

    pub fn as_str(&self) -> &str {
        &self.data
    }

    pub fn len_chars(&self) -> usize {
        if self.ascii_only {
            self.data.len()
        } else {
            self.data.chars().count()
        }
    }

    pub fn char_at(&self, index: usize) -> Option<char> {
        if self.ascii_only {
            self.data.as_bytes().get(index).map(|b| *b as char)
        } else {
            self.data.chars().nth(index)
        }
    }

    pub fn set_char(&mut self, index: usize, ch: char) -> bool {
        if self.ascii_only && ch.is_ascii() {
            // Fast-path ASCII string mutation for tight loops (e.g. character benchmarks).
            let bytes = unsafe { self.data.as_bytes_mut() };
            if index >= bytes.len() {
                return false;
            }
            bytes[index] = ch as u8;
            return true;
        }

        let start = match self.data.char_indices().nth(index) {
            Some((i, _)) => i,
            None => return false,
        };
        let end = match self.data.char_indices().nth(index + 1) {
            Some((i, _)) => i,
            None => self.data.len(),
        };
        self.data.replace_range(start..end, &ch.to_string());
        self.ascii_only = self.data.is_ascii();
        true
    }

    pub fn allocate(s: String) -> LispObject {
        let string = Box::new(RString::new(s));
        LispObject::from_general_ptr(Box::into_raw(string))
    }
}

impl fmt::Debug for RString {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "\"{}\"", self.data)
    }
}

impl fmt::Display for RString {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.data)
    }
}
