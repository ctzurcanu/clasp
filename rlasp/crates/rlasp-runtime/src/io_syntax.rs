//! IO Syntax special variables for Common Lisp compatibility
//!
//! This module manages the IO-related special variables that are bound
//! by `with-standard-io-syntax`. It's in rlasp-runtime so both the
//! interpreter and JIT can access the same state.

use std::cell::RefCell;
use std::collections::HashMap;
use std::sync::Mutex;

/// IO syntax variable value - a simple enum that can be converted to/from usize for JIT
#[derive(Clone, Debug, PartialEq)]
pub enum IoSyntaxValue {
    Nil,
    True,
    False,
    Fixnum(i64),
    Symbol(String),
}

impl IoSyntaxValue {
    /// Convert to a usize representation for JIT
    /// Uses tagged pointer encoding:
    /// - NIL: 0
    /// - T/True: 1
    /// - Fixnum: (value << 3) | 2
    /// - Symbol: pointer to string | 4
    pub fn to_raw(&self) -> usize {
        match self {
            IoSyntaxValue::Nil | IoSyntaxValue::False => 0,
            IoSyntaxValue::True => 1,
            IoSyntaxValue::Fixnum(n) => ((*n as usize) << 3) | 2,
            IoSyntaxValue::Symbol(s) => {
                // For symbols, we allocate a string and return its pointer
                // This leaks memory but is acceptable for the small number of IO syntax vars
                let boxed = Box::new(s.clone());
                let ptr = Box::into_raw(boxed);
                (ptr as usize) | 4
            }
        }
    }

    /// Create from a raw usize value
    pub unsafe fn from_raw(raw: usize) -> Self {
        if raw == 0 {
            IoSyntaxValue::Nil
        } else if raw == 1 {
            IoSyntaxValue::True
        } else if (raw & 7) == 2 {
            IoSyntaxValue::Fixnum((raw >> 3) as i64)
        } else if (raw & 7) == 4 {
            let ptr = (raw & !7) as *const String;
            IoSyntaxValue::Symbol((*ptr).clone())
        } else {
            IoSyntaxValue::Nil
        }
    }
}

/// Global storage for IO syntax variables
/// Uses a Mutex for thread-safety in JIT context
lazy_static::lazy_static! {
    static ref IO_SYNTAX_VARS: Mutex<HashMap<String, IoSyntaxValue>> =
        Mutex::new(create_default_io_syntax());
}

/// Create the default (standard) IO syntax variable bindings
fn create_default_io_syntax() -> HashMap<String, IoSyntaxValue> {
    let mut vars = HashMap::new();

    // *package* - bound to COMMON-LISP-USER
    vars.insert("*package*".to_string(), IoSyntaxValue::Symbol("COMMON-LISP-USER".to_string()));

    // Print control variables
    vars.insert("*print-array*".to_string(), IoSyntaxValue::True);
    vars.insert("*print-base*".to_string(), IoSyntaxValue::Fixnum(10));
    vars.insert("*print-case*".to_string(), IoSyntaxValue::Symbol(":UPCASE".to_string()));
    vars.insert("*print-circle*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*print-escape*".to_string(), IoSyntaxValue::True);
    vars.insert("*print-gensym*".to_string(), IoSyntaxValue::True);
    vars.insert("*print-length*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*print-level*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*print-lines*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*print-miser-width*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*print-pprint-dispatch*".to_string(), IoSyntaxValue::Symbol("*standard-pprint-dispatch*".to_string()));
    vars.insert("*print-pretty*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*print-radix*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*print-readably*".to_string(), IoSyntaxValue::True);
    vars.insert("*print-right-margin*".to_string(), IoSyntaxValue::Nil);

    // Read control variables
    vars.insert("*read-base*".to_string(), IoSyntaxValue::Fixnum(10));
    vars.insert("*read-default-float-format*".to_string(), IoSyntaxValue::Symbol("SINGLE-FLOAT".to_string()));
    vars.insert("*read-eval*".to_string(), IoSyntaxValue::True);
    vars.insert("*read-suppress*".to_string(), IoSyntaxValue::Nil);
    vars.insert("*readtable*".to_string(), IoSyntaxValue::Symbol("*standard-readtable*".to_string()));

    vars
}

/// Get the standard (default) value for an IO syntax variable
pub fn get_standard_value(name: &str) -> Option<IoSyntaxValue> {
    let standard = create_default_io_syntax();
    standard.get(name).cloned()
}

/// Get the current value of an IO syntax variable
pub fn get_io_syntax_var(name: &str) -> Option<IoSyntaxValue> {
    let vars = IO_SYNTAX_VARS.lock().unwrap();
    vars.get(name).cloned()
}

/// Set the value of an IO syntax variable
pub fn set_io_syntax_var(name: &str, value: IoSyntaxValue) {
    let mut vars = IO_SYNTAX_VARS.lock().unwrap();
    vars.insert(name.to_string(), value);
}

/// Check if a name is an IO syntax variable
pub fn is_io_syntax_var(name: &str) -> bool {
    let vars = IO_SYNTAX_VARS.lock().unwrap();
    vars.contains_key(name)
}

/// Save all current IO syntax variable values
pub fn save_io_syntax_state() -> HashMap<String, IoSyntaxValue> {
    let vars = IO_SYNTAX_VARS.lock().unwrap();
    vars.clone()
}

/// Restore all IO syntax variables from a saved state
pub fn restore_io_syntax_state(state: HashMap<String, IoSyntaxValue>) {
    let mut vars = IO_SYNTAX_VARS.lock().unwrap();
    *vars = state;
}

/// Set all IO syntax variables to their standard values
pub fn set_standard_io_syntax() {
    let mut vars = IO_SYNTAX_VARS.lock().unwrap();
    *vars = create_default_io_syntax();
}

/// List of all IO syntax variable names for iteration
pub const IO_SYNTAX_VAR_NAMES: &[&str] = &[
    "*package*",
    "*print-array*",
    "*print-base*",
    "*print-case*",
    "*print-circle*",
    "*print-escape*",
    "*print-gensym*",
    "*print-length*",
    "*print-level*",
    "*print-lines*",
    "*print-miser-width*",
    "*print-pprint-dispatch*",
    "*print-pretty*",
    "*print-radix*",
    "*print-readably*",
    "*print-right-margin*",
    "*read-base*",
    "*read-default-float-format*",
    "*read-eval*",
    "*read-suppress*",
    "*readtable*",
];

// ============================================================================
// C-compatible functions for JIT intrinsics
// ============================================================================

/// Get an IO syntax variable by name (for JIT)
/// Returns the raw value encoding
#[no_mangle]
pub extern "C" fn cc_get_io_syntax_var(name_ptr: *const i8) -> usize {
    if name_ptr.is_null() {
        return 0;
    }
    unsafe {
        let name = std::ffi::CStr::from_ptr(name_ptr).to_string_lossy();
        match get_io_syntax_var(&name) {
            Some(val) => val.to_raw(),
            None => 0,
        }
    }
}

/// Set an IO syntax variable by name (for JIT)
#[no_mangle]
pub extern "C" fn cc_set_io_syntax_var(name_ptr: *const i8, value: usize) {
    if name_ptr.is_null() {
        return;
    }
    unsafe {
        let name = std::ffi::CStr::from_ptr(name_ptr).to_string_lossy();
        let val = IoSyntaxValue::from_raw(value);
        set_io_syntax_var(&name, val);
    }
}

/// Check if a name is an IO syntax variable (for JIT)
#[no_mangle]
pub extern "C" fn cc_is_io_syntax_var(name_ptr: *const i8) -> usize {
    if name_ptr.is_null() {
        return 0;
    }
    unsafe {
        let name = std::ffi::CStr::from_ptr(name_ptr).to_string_lossy();
        if is_io_syntax_var(&name) { 1 } else { 0 }
    }
}

/// Save the current IO syntax state and return a handle (for JIT)
/// The handle is the memory address of the saved state
#[no_mangle]
pub extern "C" fn cc_save_io_syntax_state() -> usize {
    let state = save_io_syntax_state();
    let boxed = Box::new(state);
    Box::into_raw(boxed) as usize
}

/// Restore IO syntax state from a handle (for JIT)
#[no_mangle]
pub extern "C" fn cc_restore_io_syntax_state(handle: usize) {
    if handle == 0 {
        return;
    }
    unsafe {
        let state = Box::from_raw(handle as *mut HashMap<String, IoSyntaxValue>);
        restore_io_syntax_state(*state);
    }
}

/// Set all IO syntax variables to standard values (for JIT)
#[no_mangle]
pub extern "C" fn cc_set_standard_io_syntax() {
    set_standard_io_syntax();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_standard_io_syntax() {
        // Check that *print-base* is 10 by default
        let base = get_io_syntax_var("*print-base*");
        assert!(matches!(base, Some(IoSyntaxValue::Fixnum(10))));

        // Modify it
        set_io_syntax_var("*print-base*", IoSyntaxValue::Fixnum(16));
        let base = get_io_syntax_var("*print-base*");
        assert!(matches!(base, Some(IoSyntaxValue::Fixnum(16))));

        // Reset to standard
        set_standard_io_syntax();
        let base = get_io_syntax_var("*print-base*");
        assert!(matches!(base, Some(IoSyntaxValue::Fixnum(10))));
    }

    #[test]
    fn test_save_restore() {
        set_io_syntax_var("*print-base*", IoSyntaxValue::Fixnum(2));
        let saved = save_io_syntax_state();

        set_io_syntax_var("*print-base*", IoSyntaxValue::Fixnum(16));

        restore_io_syntax_state(saved);
        let base = get_io_syntax_var("*print-base*");
        assert!(matches!(base, Some(IoSyntaxValue::Fixnum(2))));
    }
}
