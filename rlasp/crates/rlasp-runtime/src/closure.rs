//! Closure support for capturing lexical environments

use crate::{LispObject, TypeHeader, ObjectType};
use std::alloc::{alloc, Layout};

/// A closure captures a function reference and its lexical environment
#[repr(C)]
pub struct Closure {
    pub header: TypeHeader,
    pub function_id: i64,  // Lambda ID
    pub env_size: usize,   // Number of captured variables
    pub env: [LispObject; 0],  // Flexible array member - captured variables follow
}

impl Closure {
    /// Create a new closure with captured environment
    pub fn new(function_id: i64, captured_vars: &[LispObject]) -> *mut Self {
        let env_size = captured_vars.len();

        // Calculate layout: header + function_id + env_size + captured variables
        let base_size = std::mem::size_of::<TypeHeader>() +
                        std::mem::size_of::<i64>() +
                        std::mem::size_of::<usize>();
        let total_size = base_size + env_size * std::mem::size_of::<LispObject>();

        let layout = Layout::from_size_align(total_size, 8).unwrap();

        unsafe {
            let ptr = alloc(layout) as *mut Closure;

            // Initialize header
            (*ptr).header = TypeHeader::new(ObjectType::Closure);
            (*ptr).function_id = function_id;
            (*ptr).env_size = env_size;

            // Copy captured variables
            let env_ptr = (ptr as *mut u8).add(base_size) as *mut LispObject;
            for (i, var) in captured_vars.iter().enumerate() {
                *env_ptr.add(i) = *var;
            }

            ptr
        }
    }

    /// Get the function ID
    pub fn function_id(&self) -> i64 {
        self.function_id
    }

    /// Get the number of captured variables
    pub fn env_size(&self) -> usize {
        self.env_size
    }

    /// Get a captured variable by index
    pub fn get_captured(&self, index: usize) -> Option<LispObject> {
        if index >= self.env_size {
            return None;
        }

        unsafe {
            let base_size = std::mem::size_of::<TypeHeader>() +
                            std::mem::size_of::<i64>() +
                            std::mem::size_of::<usize>();
            let env_ptr = (self as *const Self as *const u8).add(base_size) as *const LispObject;
            Some(*env_ptr.add(index))
        }
    }

    /// Get all captured variables as a slice
    pub fn captured_vars(&self) -> &[LispObject] {
        unsafe {
            let base_size = std::mem::size_of::<TypeHeader>() +
                            std::mem::size_of::<i64>() +
                            std::mem::size_of::<usize>();
            let env_ptr = (self as *const Self as *const u8).add(base_size) as *const LispObject;
            std::slice::from_raw_parts(env_ptr, self.env_size)
        }
    }
}
