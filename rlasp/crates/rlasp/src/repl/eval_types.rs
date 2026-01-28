/// Types and data structures for the evaluator

use crate::ir::ASTNode;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;
use malachite::Integer;
use malachite::Rational;

// Thread-local storage for complex return values and gensym counter
thread_local! {
    pub(super) static RETURN_VALUE: RefCell<Option<EvalResult>> = RefCell::new(None);
    pub(super) static GENSYM_COUNTER: RefCell<u64> = RefCell::new(0);
    /// Class registry: maps class name -> list of superclass names
    pub static CLASS_HIERARCHY: RefCell<HashMap<String, Vec<String>>> = RefCell::new(HashMap::new());
}

/// Register a class with its superclasses
pub fn register_class_hierarchy(class_name: &str, superclasses: Vec<String>) {
    CLASS_HIERARCHY.with(|h| {
        h.borrow_mut().insert(class_name.to_uppercase(), superclasses);
    });
}

/// Check if a class is a subclass of another (including itself)
pub fn is_subclass(class_name: &str, superclass_name: &str) -> bool {
    let class_upper = class_name.to_uppercase();
    let super_upper = superclass_name.to_uppercase();

    // T matches everything
    if super_upper == "T" {
        return true;
    }

    // Same class
    if class_upper == super_upper {
        return true;
    }

    // Check hierarchy
    CLASS_HIERARCHY.with(|h| {
        let h = h.borrow();
        if let Some(supers) = h.get(&class_upper) {
            for s in supers {
                if is_subclass(s, &super_upper) {
                    return true;
                }
            }
        }
        false
    })
}

/// CLOS Instance: object with class metadata
#[derive(Clone)]
pub struct Instance {
    pub class_name: String,
    pub slots: Rc<RefCell<HashMap<String, EvalResult>>>,
}

/// CLOS Method: function with specializers for dispatch
#[derive(Clone)]
pub struct Method {
    pub qualifier: Option<String>,  // :before, :after, :around, or None for primary
    pub specializers: Vec<String>,  // Class names for each parameter
    pub params: Vec<String>,
    pub body: Vec<ASTNode>,
    pub env: Rc<RefCell<HashMap<String, EvalResult>>>,
}

/// CLOS Generic Function: collection of methods with dispatch
#[derive(Clone)]
pub struct GenericFunction {
    pub name: String,
    pub methods: Vec<Method>,
}

#[derive(Clone)]
pub enum EvalResult {
    Fixnum(i64),
    Bignum(Integer),
    Ratio(Rational),
    Float(f64),
    Complex(f64, f64),  // Complex number (real, imaginary)
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
        dynamic_env: bool, // If true, prefer caller env for bindings (flet/labels approximation)
    },
    Macro {
        params: Box<ASTNode>,
        body: Vec<ASTNode>,
    },
    /// Modify-macro created by define-modify-macro
    /// Expands to (setf place (function place args...))
    ModifyMacro {
        name: String,
        params: Vec<String>,  // place + lambda-list params
        function: String,     // The function to call
        has_rest: bool,       // Whether lambda-list has &rest
    },
    HashTable(Rc<RefCell<HashMap<String, EvalResult>>>),
    Array(Rc<RefCell<Vec<EvalResult>>>),  // Simple 1D array/vector
    WasmBytes(Vec<u8>),
    BuiltinFunction(String),  // Name of builtin function
    MultipleValues(Vec<EvalResult>),  // Multiple return values
    ForeignLibrary(Rc<rlasp_ffi::Library>),  // FFI library (wrapped in Rc since Library may not be Clone)
    ForeignFunction(Rc<rlasp_ffi::ForeignFunction>),  // FFI function (wrapped in Rc)
    Instance(Instance),  // CLOS instance with class metadata
    GenericFunction(Rc<RefCell<GenericFunction>>),  // CLOS generic function with methods
    Condition(Rc<RefCell<super::eval_conditions::ConditionInstance>>),  // Condition instance
    Package(String),  // Package object (stores package name)
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
            EvalResult::Bignum(n) => write!(f, "{}", n),
            EvalResult::Ratio(r) => write!(f, "{}/{}", r.numerator_ref(), r.denominator_ref()),
            EvalResult::Float(fl) => write!(f, "{}", fl),
            EvalResult::Complex(re, im) => write!(f, "#C({} {})", re, im),
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
            EvalResult::ModifyMacro { name, .. } => write!(f, "#<MODIFY-MACRO {}>", name),
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
            EvalResult::Instance(inst) => write!(f, "#<{} instance>", inst.class_name),
            EvalResult::GenericFunction(gf) => write!(f, "#<GENERIC-FUNCTION {}>", gf.borrow().name),
            EvalResult::Condition(cond) => write!(f, "#<CONDITION {}>", cond.borrow().type_name),
            EvalResult::Package(name) => write!(f, "#<PACKAGE \"{}\">", name),
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
        // Use the Display implementation for Debug as well
        write!(f, "{}", self)
    }
}

/// Helper function to check structural equality for values
pub(super) fn structural_equal(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a == b,
        (EvalResult::Float(a), EvalResult::Float(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Character(a), EvalResult::Character(b)) => a == b,
        (EvalResult::String(a), EvalResult::String(b)) => a == b,
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a.eq_ignore_ascii_case(b),
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

/// Get the class name of a value for CLOS method dispatch
pub fn class_of(val: &EvalResult) -> String {
    match val {
        EvalResult::Instance(inst) => inst.class_name.clone(),
        EvalResult::Fixnum(_) => "FIXNUM".to_string(),
        EvalResult::Bignum(_) => "BIGNUM".to_string(),
        EvalResult::Ratio(_) => "RATIO".to_string(),
        EvalResult::Float(_) => "FLOAT".to_string(),
        EvalResult::Complex(_, _) => "COMPLEX".to_string(),
        EvalResult::Nil => "NULL".to_string(),
        EvalResult::Bool(_) | EvalResult::Boolean(_) => "BOOLEAN".to_string(),
        EvalResult::String(_) => "STRING".to_string(),
        EvalResult::Symbol(_) => "SYMBOL".to_string(),
        EvalResult::Character(_) => "CHARACTER".to_string(),
        EvalResult::Cons(_, _) => "CONS".to_string(),
        EvalResult::Lambda { .. } => "FUNCTION".to_string(),
        EvalResult::Macro { .. } => "MACRO".to_string(),
        EvalResult::ModifyMacro { .. } => "MACRO".to_string(),
        EvalResult::HashTable(_) => "HASH-TABLE".to_string(),
        EvalResult::Array(_) => "ARRAY".to_string(),
        EvalResult::GenericFunction(_) => "GENERIC-FUNCTION".to_string(),
        _ => "T".to_string(),
    }
}

/// Check if a value matches a specializer for method dispatch
/// T matches everything, otherwise check class hierarchy
pub fn specializer_matches(specializer: &str, val: &EvalResult) -> bool {
    if specializer == "T" || specializer.is_empty() {
        return true;
    }
    let val_class = class_of(val);
    // Check if val's class is a subclass of specializer
    is_subclass(&val_class, specializer)
}
