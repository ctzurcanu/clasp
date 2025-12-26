/// Types and data structures for the evaluator

use crate::ir::ASTNode;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

// Thread-local storage for complex return values and gensym counter
thread_local! {
    pub(super) static RETURN_VALUE: RefCell<Option<EvalResult>> = RefCell::new(None);
    pub(super) static GENSYM_COUNTER: RefCell<u64> = RefCell::new(0);
}

#[derive(Clone)]
pub enum EvalResult {
    Fixnum(i64),
    Float(f64),
    Bool(bool),
    Boolean(bool),  // CL boolean type
    Nil,
    String(String),
    Symbol(String),
    Character(char),  // CL character type
    Cons(Rc<RefCell<EvalResult>>, Rc<RefCell<EvalResult>>),
    Lambda {
        params: Vec<String>,
        defaults: HashMap<String, ASTNode>,  // Default values for params
        supplied_p_vars: HashMap<String, String>,  // Maps param -> supplied-p var
        body: Vec<ASTNode>,
        env: Rc<RefCell<HashMap<String, EvalResult>>>,
    },
    Macro {
        params: Vec<String>,
        body: Vec<ASTNode>,
    },
    HashTable(Rc<RefCell<HashMap<String, EvalResult>>>),
    Array(Rc<RefCell<Vec<EvalResult>>>),  // Simple 1D array/vector
    WasmBytes(Vec<u8>),
    BuiltinFunction(String),  // Name of builtin function
    MultipleValues(Vec<EvalResult>),  // Multiple return values
    ForeignLibrary(Rc<rlasp_ffi::Library>),  // FFI library (wrapped in Rc since Library may not be Clone)
    ForeignFunction(Rc<rlasp_ffi::ForeignFunction>),  // FFI function (wrapped in Rc)
}

// Special error type for non-local exits (return, return-from)
#[derive(Debug, Clone)]
pub(super) enum NonLocalExit {
    Return(EvalResult),
}

impl std::fmt::Display for EvalResult {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            EvalResult::Fixnum(n) => write!(f, "{}", n),
            EvalResult::Float(fl) => write!(f, "{}", fl),
            EvalResult::Bool(true) | EvalResult::Boolean(true) => write!(f, "T"),
            EvalResult::Bool(false) | EvalResult::Boolean(false) => write!(f, "NIL"),
            EvalResult::Nil => write!(f, "NIL"),
            EvalResult::String(s) => write!(f, "\"{}\"", s),
            EvalResult::Symbol(s) => write!(f, "{}", s),
            EvalResult::Character(c) => write!(f, "#\\{}", c),
            EvalResult::Cons(car, cdr) => {
                write!(f, "(")?;
                self.fmt_list(f)?;
                write!(f, ")")
            }
            EvalResult::Lambda { .. } => write!(f, "#<LAMBDA>"),
            EvalResult::Macro { .. } => write!(f, "#<MACRO>"),
            EvalResult::HashTable(_) => write!(f, "#<HASH-TABLE>"),
            EvalResult::Array(_) => write!(f, "#<ARRAY>"),
            EvalResult::WasmBytes(bytes) => write!(f, "#<WASM {} bytes>", bytes.len()),
            EvalResult::BuiltinFunction(name) => write!(f, "#<BUILTIN {}>", name),
            EvalResult::MultipleValues(vals) => {
                if vals.is_empty() {
                    write!(f, "NIL")
                } else {
                    // Display first value for REPL output
                    write!(f, "{}", vals[0])
                }
            }
            EvalResult::ForeignLibrary(_) => write!(f, "#<FOREIGN-LIBRARY>"),
            EvalResult::ForeignFunction(_) => write!(f, "#<FOREIGN-FUNCTION>"),
        }
    }
}

impl EvalResult {
    fn fmt_list(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            EvalResult::Cons(car, cdr) => {
                write!(f, "{}", car.borrow())?;
                let cdr_val = cdr.borrow();
                match &*cdr_val {
                    EvalResult::Nil => Ok(()),
                    EvalResult::Cons(_, _) => {
                        write!(f, " ")?;
                        cdr_val.fmt_list(f)
                    }
                    other => write!(f, " . {}", other),
                }
            }
            _ => write!(f, "{}", self),
        }
    }
}

impl std::fmt::Debug for EvalResult {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            EvalResult::Fixnum(n) => write!(f, "Fixnum({})", n),
            EvalResult::Float(fl) => write!(f, "Float({})", fl),
            EvalResult::Bool(b) => write!(f, "Bool({})", b),
            EvalResult::Boolean(b) => write!(f, "Boolean({})", b),
            EvalResult::Nil => write!(f, "Nil"),
            EvalResult::String(s) => write!(f, "String({:?})", s),
            EvalResult::Symbol(s) => write!(f, "Symbol({})", s),
            EvalResult::Character(c) => write!(f, "Character({:?})", c),
            EvalResult::Cons(_, _) => write!(f, "Cons(..)"),
            EvalResult::Lambda { .. } => write!(f, "Lambda {{ .. }}"),
            EvalResult::Macro { .. } => write!(f, "Macro {{ .. }}"),
            EvalResult::HashTable(_) => write!(f, "HashTable(..)"),
            EvalResult::Array(_) => write!(f, "Array(..)"),
            EvalResult::WasmBytes(bytes) => write!(f, "WasmBytes({} bytes)", bytes.len()),
            EvalResult::BuiltinFunction(name) => write!(f, "BuiltinFunction({})", name),
            EvalResult::MultipleValues(vals) => write!(f, "MultipleValues({} values)", vals.len()),
            EvalResult::ForeignLibrary(_) => write!(f, "ForeignLibrary(..)"),
            EvalResult::ForeignFunction(_) => write!(f, "ForeignFunction(..)"),
        }
    }
}

/// Helper function to check structural equality for values
pub(super) fn structural_equal(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a == b,
        (EvalResult::Float(a), EvalResult::Float(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::String(a), EvalResult::String(b)) => a == b,
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a == b,
        _ => false,
    }
}

/// Extract primary value from MultipleValues (for single-value contexts)
/// In Common Lisp, when multiple values are used in a single-value context,
/// only the first value is used
pub(super) fn primary_value(val: EvalResult) -> EvalResult {
    match val {
        EvalResult::MultipleValues(mut vals) => {
            if vals.is_empty() {
                EvalResult::Nil
            } else {
                vals.into_iter().next().unwrap()
            }
        }
        other => other,
    }
}
