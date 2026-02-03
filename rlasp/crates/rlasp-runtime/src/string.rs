//! String type for rlasp runtime

use std::fmt;
use super::object::LispObject;

#[repr(C)]
pub struct RString {
    header: crate::header::TypeHeader,
    data: String,
}

impl RString {
    pub fn new(s: String) -> Self {
        Self {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::String),
            data: s,
        }
    }

    pub fn as_str(&self) -> &str {
        &self.data
    }

    pub fn len_chars(&self) -> usize {
        self.data.chars().count()
    }

    pub fn char_at(&self, index: usize) -> Option<char> {
        self.data.chars().nth(index)
    }

    pub fn set_char(&mut self, index: usize, ch: char) -> bool {
        let mut chars: Vec<char> = self.data.chars().collect();
        if index >= chars.len() {
            return false;
        }
        chars[index] = ch;
        self.data = chars.into_iter().collect();
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
