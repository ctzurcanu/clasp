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
    /// Global dynamic variable store for special variables (*earmuffs*)
    pub(super) static DYNAMIC_VARS: RefCell<HashMap<String, EvalResult>> = RefCell::new(HashMap::new());
}

/// Check if a variable name looks like a CL special/dynamic variable
pub fn is_special_variable(name: &str) -> bool {
    name.len() >= 3 && name.starts_with('*') && name.ends_with('*') && name != "*"
}

/// Get a dynamic variable value from the global store
pub fn get_dynamic_var(name: &str) -> Option<EvalResult> {
    DYNAMIC_VARS.with(|dv| dv.borrow().get(name).cloned())
}

/// Set a dynamic variable value in the global store
pub fn set_dynamic_var(name: &str, value: EvalResult) {
    DYNAMIC_VARS.with(|dv| {
        dv.borrow_mut().insert(name.to_string(), value);
    });
}

/// Register a class with its superclasses
pub fn register_class_hierarchy(class_name: &str, superclasses: Vec<String>) {
    let class_upper_full = class_name.to_uppercase();
    let class_upper = class_name.rsplit(':').next().unwrap_or(class_name).to_uppercase();
    let normalized_supers: Vec<String> = superclasses
        .iter()
        .map(|s| s.rsplit(':').next().unwrap_or(s).to_uppercase())
        .collect();

    CLASS_HIERARCHY.with(|h| {
        let mut h = h.borrow_mut();
        h.insert(class_upper.clone(), normalized_supers.clone());
        if class_upper_full != class_upper {
            h.insert(class_upper_full, normalized_supers);
        }
    });
}

/// Check if a class is a subclass of another (including itself)
pub fn is_subclass(class_name: &str, superclass_name: &str) -> bool {
    let class_upper_full = class_name.to_uppercase();
    let class_upper = class_name.rsplit(':').next().unwrap_or(class_name).to_uppercase();
    let super_upper = superclass_name.rsplit(':').next().unwrap_or(superclass_name).to_uppercase();

    // T matches everything
    if super_upper == "T" {
        return true;
    }

    // Built-in type relationships needed for CL method dispatch.
    // In CL, NIL is both NULL and a SYMBOL/LIST/SEQUENCE/BOOLEAN.
    if class_upper == "NULL" {
        if matches!(
            super_upper.as_str(),
            "SYMBOL" | "LIST" | "SEQUENCE" | "BOOLEAN" | "ATOM"
        ) {
            return true;
        }
    }

    // CONS is a LIST and a SEQUENCE in CL.
    if class_upper == "CONS" {
        if matches!(super_upper.as_str(), "LIST" | "SEQUENCE") {
            return true;
        }
    }

    // Numeric tower relationships.
    if class_upper == "FIXNUM" {
        if matches!(super_upper.as_str(), "INTEGER" | "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if class_upper == "BIGNUM" {
        if matches!(super_upper.as_str(), "INTEGER" | "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if class_upper == "INTEGER" {
        if matches!(super_upper.as_str(), "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if class_upper == "RATIO" {
        if matches!(super_upper.as_str(), "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if class_upper == "RATIONAL" {
        if matches!(super_upper.as_str(), "REAL" | "NUMBER") {
            return true;
        }
    }
    if matches!(class_upper.as_str(), "FLOAT" | "SINGLE-FLOAT" | "DOUBLE-FLOAT" | "SHORT-FLOAT" | "LONG-FLOAT") {
        if matches!(super_upper.as_str(), "FLOAT" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if class_upper == "COMPLEX" {
        if super_upper == "NUMBER" {
            return true;
        }
    }

    // Common sequence/container relationships.
    if class_upper == "STRING" {
        if matches!(super_upper.as_str(), "VECTOR" | "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if class_upper == "SIMPLE-STRING" {
        if matches!(super_upper.as_str(), "STRING" | "VECTOR" | "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if class_upper == "VECTOR" {
        if matches!(super_upper.as_str(), "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if class_upper == "SIMPLE-VECTOR" {
        if matches!(super_upper.as_str(), "VECTOR" | "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if class_upper == "KEYWORD" && super_upper == "SYMBOL" {
        return true;
    }

    // Same class
    if class_upper == super_upper || class_upper_full == super_upper {
        return true;
    }

    // Check hierarchy
    CLASS_HIERARCHY.with(|h| {
        let h = h.borrow();
        for key in [&class_upper, &class_upper_full] {
            if let Some(supers) = h.get(key) {
                for s in supers {
                    if is_subclass(s, &super_upper) {
                        return true;
                    }
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
        key_params: HashMap<String, String>,  // Maps param -> keyword name (no leading :)
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
        EvalResult::Instance(inst) => {
            if let Some(EvalResult::Symbol(name)) = inst.slots.borrow().get(super::eval_clos::CLASS_NAME_OVERRIDE_SLOT_KEY) {
                name.clone()
            } else {
                inst.class_name.clone()
            }
        }
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
        // Runtime arrays are currently 1-D vector-backed, so dispatch as VECTOR.
        EvalResult::Array(_) => "VECTOR".to_string(),
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
