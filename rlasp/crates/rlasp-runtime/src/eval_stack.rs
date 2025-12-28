//! Thread-local evaluation stack for function calls
//! Two-stack architecture: type stack (4 bytes per entry) + value stack (variable bytes)
//!
//! Common Lisp Compatibility:
//! - Each thread has its own evaluation stack (per CL spec)
//! - No mutex contention for single-threaded evaluation
//! - Supports CL's dynamic extent and thread-local bindings

use std::cell::RefCell;

/// Type entry in the type stack (4 bytes)
#[repr(C, packed)]
#[derive(Debug, Clone, Copy)]
pub struct TypeEntry {
    /// Type tag (2 bytes)
    pub type_tag: u16,
    /// Length in value stack (2 bytes) - up to 64KB per value
    pub length: u16,
}

/// Type tags for stack values
#[repr(u16)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TypeTag {
    Nil = 0,
    Bool = 1,
    Fixnum = 2,
    Float = 3,
    Pointer = 4,      // General heap pointer (cons, symbol, string, etc.)
    Character = 5,
    Raw = 6,          // Raw bytes (no interpretation)
}

/// Global evaluation stack
pub struct EvalStack {
    /// Type stack: array of 4-byte type entries
    type_stack: Vec<TypeEntry>,

    /// Value stack: array of bytes
    value_stack: Vec<u8>,

    /// Current position in value stack (byte offset)
    value_sp: usize,
}

impl EvalStack {
    fn new() -> Self {
        Self {
            type_stack: Vec::with_capacity(4096),      // 16KB for 4096 entries
            value_stack: Vec::with_capacity(1048576),  // 1MB initial
            value_sp: 0,
        }
    }

    /// Push a value onto the stack
    pub fn push(&mut self, type_tag: TypeTag, data: &[u8]) {
        // Add type entry
        self.type_stack.push(TypeEntry {
            type_tag: type_tag as u16,
            length: data.len() as u16,
        });

        // Add value data at current stack pointer
        // Truncate or extend value_stack to value_sp
        self.value_stack.truncate(self.value_sp);
        self.value_stack.extend_from_slice(data);
        self.value_sp += data.len();
    }

    /// Push a fixnum (i64)
    pub fn push_fixnum(&mut self, value: i64) {
        self.push(TypeTag::Fixnum, &value.to_le_bytes());
    }

    /// Push a pointer (usize)
    pub fn push_pointer(&mut self, ptr: usize) {
        self.push(TypeTag::Pointer, &ptr.to_le_bytes());
    }

    /// Push nil
    pub fn push_nil(&mut self) {
        self.push(TypeTag::Nil, &[]);
    }

    /// Pop a value from the stack
    /// Returns (type_tag, data)
    pub fn pop(&mut self) -> Option<(TypeTag, Vec<u8>)> {
        if self.type_stack.is_empty() {
            return None;
        }

        let type_entry = self.type_stack.pop().unwrap();
        let len = type_entry.length as usize;

        // Get data from value stack
        if self.value_sp < len {
            return None;
        }

        self.value_sp -= len;
        let data = self.value_stack[self.value_sp..self.value_sp + len].to_vec();

        Some((Self::tag_from_u16(type_entry.type_tag), data))
    }

    /// Pop a fixnum
    pub fn pop_fixnum(&mut self) -> Option<i64> {
        let (tag, data) = self.pop()?;
        if tag != TypeTag::Fixnum || data.len() != 8 {
            return None;
        }
        Some(i64::from_le_bytes(data.try_into().ok()?))
    }

    /// Pop a pointer
    /// For fixnums: boxes the raw value into a LispObject pointer
    /// This bridges the two-stack architecture with functions expecting tagged pointers
    /// Values exceeding 62 bits are promoted to bignum
    pub fn pop_pointer(&mut self) -> Option<usize> {
        let (tag, data) = self.pop()?;

        match tag {
            TypeTag::Nil => Some(crate::symbol::NIL_SYMBOL.raw()),
            TypeTag::Fixnum if data.len() == 8 => {
                // Box the raw fixnum into a LispObject
                let val = i64::from_le_bytes(data.try_into().ok()?);
                // Check if value fits in 62-bit fixnum representation
                // 62 bits signed: -2^61 to 2^61-1
                const MAX_FIXNUM: i64 = (1 << 61) - 1;
                const MIN_FIXNUM: i64 = -(1 << 61);
                if val >= MIN_FIXNUM && val <= MAX_FIXNUM {
                    Some(crate::LispObject::fixnum(val).raw())
                } else {
                    // Overflow: promote to bignum
                    use malachite::Integer;
                    Some(crate::Number::allocate_bignum(Integer::from(val)).raw())
                }
            }
            TypeTag::Pointer if data.len() == 8 => {
                Some(usize::from_le_bytes(data.try_into().ok()?))
            }
            _ => None,
        }
    }

    /// Peek at top value without popping
    pub fn peek(&self, offset: usize) -> Option<(TypeTag, &[u8])> {
        if offset >= self.type_stack.len() {
            return None;
        }

        let idx = self.type_stack.len() - 1 - offset;
        let type_entry = self.type_stack[idx];
        let len = type_entry.length as usize;

        // Calculate position in value stack
        let mut value_pos = self.value_sp;
        for i in (idx + 1)..self.type_stack.len() {
            value_pos -= self.type_stack[i].length as usize;
        }
        value_pos -= len;

        Some((
            Self::tag_from_u16(type_entry.type_tag),
            &self.value_stack[value_pos..value_pos + len]
        ))
    }

    /// Get current stack depth (number of items)
    pub fn depth(&self) -> usize {
        self.type_stack.len()
    }

    /// Clear the stack
    pub fn clear(&mut self) {
        self.type_stack.clear();
        self.value_sp = 0;
    }

    /// Get raw pointers for MLIR/FFI
    pub fn raw_pointers(&mut self) -> (*mut TypeEntry, *mut u8, usize) {
        (
            self.type_stack.as_mut_ptr(),
            self.value_stack.as_mut_ptr(),
            self.type_stack.len(),
        )
    }

    fn tag_from_u16(tag: u16) -> TypeTag {
        match tag {
            0 => TypeTag::Nil,
            1 => TypeTag::Bool,
            2 => TypeTag::Fixnum,
            3 => TypeTag::Float,
            4 => TypeTag::Pointer,
            5 => TypeTag::Character,
            6 => TypeTag::Raw,
            _ => TypeTag::Nil,
        }
    }
}

// Thread-local evaluation stack - CL compatible (each thread has its own stack)
thread_local! {
    /// Thread-local evaluation stack
    ///
    /// Per Common Lisp spec, each thread has its own dynamic environment.
    /// This eliminates mutex contention and provides proper isolation.
    static EVAL_STACK: RefCell<EvalStack> = RefCell::new(EvalStack::new());
}

/// Access the current thread's evaluation stack
///
/// This is the primary way to interact with the stack from Rust code.
/// For FFI, use the stack_* functions below.
pub fn with_stack<F, R>(f: F) -> R
where
    F: FnOnce(&mut EvalStack) -> R,
{
    EVAL_STACK.with(|stack| f(&mut stack.borrow_mut()))
}

/// Get current stack depth without borrowing
pub fn current_depth() -> usize {
    EVAL_STACK.with(|stack| stack.borrow().depth())
}

// === External C ABI functions for MLIR/JIT ===
// These access the current thread's stack

#[no_mangle]
pub extern "C" fn stack_push_fixnum(value: i64) {
    EVAL_STACK.with(|stack| stack.borrow_mut().push_fixnum(value));
}

#[no_mangle]
pub extern "C" fn stack_push_pointer(ptr: usize) {
    EVAL_STACK.with(|stack| stack.borrow_mut().push_pointer(ptr));
}

#[no_mangle]
pub extern "C" fn stack_push_nil() {
    EVAL_STACK.with(|stack| stack.borrow_mut().push_nil());
}

#[no_mangle]
pub extern "C" fn stack_pop_fixnum() -> i64 {
    EVAL_STACK.with(|stack| stack.borrow_mut().pop_fixnum().unwrap_or(0))
}

#[no_mangle]
pub extern "C" fn stack_pop_pointer() -> usize {
    EVAL_STACK.with(|stack| stack.borrow_mut().pop_pointer().unwrap_or(0))
}

#[no_mangle]
pub extern "C" fn stack_depth() -> i64 {
    EVAL_STACK.with(|stack| stack.borrow().depth() as i64)
}

#[no_mangle]
pub extern "C" fn stack_clear() {
    EVAL_STACK.with(|stack| stack.borrow_mut().clear());
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_push_pop_fixnum() {
        let mut stack = EvalStack::new();
        stack.push_fixnum(42);
        stack.push_fixnum(100);

        assert_eq!(stack.pop_fixnum(), Some(100));
        assert_eq!(stack.pop_fixnum(), Some(42));
        assert_eq!(stack.pop_fixnum(), None);
    }

    #[test]
    fn test_peek() {
        let mut stack = EvalStack::new();
        stack.push_fixnum(1);
        stack.push_fixnum(2);
        stack.push_fixnum(3);

        let (tag, data) = stack.peek(0).unwrap();
        assert_eq!(tag, TypeTag::Fixnum);
        assert_eq!(i64::from_le_bytes(data.try_into().unwrap()), 3);

        let (tag, data) = stack.peek(1).unwrap();
        assert_eq!(i64::from_le_bytes(data.try_into().unwrap()), 2);
    }
}
