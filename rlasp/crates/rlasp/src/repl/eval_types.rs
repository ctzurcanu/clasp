/// Types and data structures for the evaluator
use crate::ir::ASTNode;
use malachite::Integer;
use malachite::Rational;
use std::cell::{Cell, RefCell};
use std::collections::{HashMap, HashSet};
use std::rc::Rc;

// Thread-local storage for complex return values and gensym counter
thread_local! {
    pub(super) static RETURN_VALUE: RefCell<Option<EvalResult>> = RefCell::new(None);
    pub(super) static NONLOCAL_RETURN_VALUES: RefCell<HashMap<u64, EvalResult>> = RefCell::new(HashMap::new());
    pub(super) static NEXT_NONLOCAL_RETURN_ID: Cell<u64> = Cell::new(1);
    pub(super) static GENSYM_COUNTER: RefCell<u64> = RefCell::new(0);
    pub(super) static ACTIVE_BLOCK_STACK: RefCell<Vec<(String, u64)>> = RefCell::new(Vec::new());
    pub(super) static NEXT_BLOCK_ID: Cell<u64> = Cell::new(1);
    /// Class registry: maps class name -> list of superclass names
    pub static CLASS_HIERARCHY: RefCell<HashMap<String, Vec<String>>> = RefCell::new(HashMap::new());
    /// Global dynamic variable store for special variables (*earmuffs*)
    pub(super) static DYNAMIC_VARS: RefCell<HashMap<String, EvalResult>> = RefCell::new(HashMap::new());
    /// Additional globally special variables declared via DEFVAR/DEFPARAMETER/DEFCONSTANT/DECLARE.
    pub(super) static DECLARED_SPECIAL_VARS: RefCell<HashSet<String>> = RefCell::new(HashSet::new());
}

pub(super) fn stash_nonlocal_return_value(value: &EvalResult) -> String {
    let id = NEXT_NONLOCAL_RETURN_ID.with(|next| {
        let id = next.get();
        next.set(id.saturating_add(1));
        id
    });
    NONLOCAL_RETURN_VALUES.with(|values| {
        values.borrow_mut().insert(id, value.clone());
    });
    format!("COMPLEX:{}", id)
}

pub(super) fn take_nonlocal_return_value(encoded: &str) -> Option<EvalResult> {
    if let Some(id_str) = encoded.strip_prefix("COMPLEX:") {
        if let Ok(id) = id_str.parse::<u64>() {
            return NONLOCAL_RETURN_VALUES.with(|values| values.borrow_mut().remove(&id));
        }
    }
    RETURN_VALUE.with(|rv| rv.borrow_mut().take())
}

fn base_symbol_name(name: &str) -> &str {
    name.rsplit(':').next().unwrap_or(name)
}

/// Check if a variable name looks like a CL special/dynamic variable
pub fn is_special_variable(name: &str) -> bool {
    if name.len() >= 3 && name.starts_with('*') && name.ends_with('*') && name != "*" {
        return true;
    }
    let name_base = base_symbol_name(name);
    DECLARED_SPECIAL_VARS.with(|vars| {
        vars.borrow().iter().any(|declared| {
            declared.eq_ignore_ascii_case(name)
                || base_symbol_name(declared).eq_ignore_ascii_case(name)
                || declared.eq_ignore_ascii_case(name_base)
                || base_symbol_name(declared).eq_ignore_ascii_case(name_base)
        })
    })
}

pub fn register_special_variable(name: &str) {
    if std::env::var("RLASP_DEBUG_SPECIAL_SCOPE").is_ok() {
        eprintln!("[special-debug] register {}", name);
    }
    DECLARED_SPECIAL_VARS.with(|vars| {
        vars.borrow_mut().insert(name.to_string());
    });
}

pub fn unregister_special_variable(name: &str) {
    if std::env::var("RLASP_DEBUG_SPECIAL_SCOPE").is_ok() {
        eprintln!("[special-debug] unregister {}", name);
    }
    DECLARED_SPECIAL_VARS.with(|vars| {
        let target_base = base_symbol_name(name).to_ascii_lowercase();
        vars.borrow_mut().retain(|declared| {
            !declared.eq_ignore_ascii_case(name)
                && !base_symbol_name(declared).eq_ignore_ascii_case(name)
                && !declared.eq_ignore_ascii_case(&target_base)
                && !base_symbol_name(declared).eq_ignore_ascii_case(&target_base)
        });
    });
}

/// Get a dynamic variable value from the global store
pub fn get_dynamic_var(name: &str) -> Option<EvalResult> {
    let candidates = [
        name.to_string(),
        name.to_ascii_uppercase(),
        name.to_ascii_lowercase(),
        base_symbol_name(name).to_string(),
        base_symbol_name(name).to_ascii_uppercase(),
        base_symbol_name(name).to_ascii_lowercase(),
    ];
    DYNAMIC_VARS.with(|dv| {
        let dv = dv.borrow();
        for candidate in candidates.iter() {
            if let Some(value) = dv.get(candidate).cloned() {
                return Some(value);
            }
        }
        None
    })
}

/// Set a dynamic variable value in the global store
pub fn set_dynamic_var(name: &str, value: EvalResult) {
    DYNAMIC_VARS.with(|dv| {
        let mut dv = dv.borrow_mut();
        for candidate in [
            name.to_string(),
            name.to_ascii_uppercase(),
            name.to_ascii_lowercase(),
            base_symbol_name(name).to_string(),
            base_symbol_name(name).to_ascii_uppercase(),
            base_symbol_name(name).to_ascii_lowercase(),
        ] {
            dv.insert(candidate, value.clone());
        }
    });
}

pub fn clear_dynamic_var(name: &str) {
    DYNAMIC_VARS.with(|dv| {
        let mut dv = dv.borrow_mut();
        for candidate in [
            name.to_string(),
            name.to_ascii_uppercase(),
            name.to_ascii_lowercase(),
            base_symbol_name(name).to_string(),
            base_symbol_name(name).to_ascii_uppercase(),
            base_symbol_name(name).to_ascii_lowercase(),
        ] {
            dv.remove(&candidate);
        }
    });
}

/// Register a class with its superclasses
pub fn register_class_hierarchy(class_name: &str, superclasses: Vec<String>) {
    let class_upper_full = class_name.to_uppercase();
    let class_upper = class_name
        .rsplit(':')
        .next()
        .unwrap_or(class_name)
        .to_uppercase();
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

pub fn unregister_class_hierarchy(class_name: &str) {
    let class_upper_full = class_name.to_uppercase();
    let class_upper = class_name
        .rsplit(':')
        .next()
        .unwrap_or(class_name)
        .to_uppercase();
    CLASS_HIERARCHY.with(|h| {
        let mut h = h.borrow_mut();
        h.remove(&class_upper);
        h.remove(&class_upper_full);
    });
}

/// Check if a class is a subclass of another (including itself)
pub fn is_subclass(class_name: &str, superclass_name: &str) -> bool {
    let class_upper_full = class_name.to_uppercase();
    let class_upper = class_name
        .rsplit(':')
        .next()
        .unwrap_or(class_name)
        .to_uppercase();
    let super_upper = superclass_name
        .rsplit(':')
        .next()
        .unwrap_or(superclass_name)
        .to_uppercase();

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
        if matches!(
            super_upper.as_str(),
            "INTEGER" | "RATIONAL" | "REAL" | "NUMBER"
        ) {
            return true;
        }
    }
    if class_upper == "BIGNUM" {
        if matches!(
            super_upper.as_str(),
            "INTEGER" | "RATIONAL" | "REAL" | "NUMBER"
        ) {
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
    if matches!(
        class_upper.as_str(),
        "FLOAT" | "SINGLE-FLOAT" | "DOUBLE-FLOAT" | "SHORT-FLOAT" | "LONG-FLOAT"
    ) {
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
        if matches!(
            super_upper.as_str(),
            "STRING" | "VECTOR" | "SEQUENCE" | "ARRAY"
        ) {
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
    pub id: u64,
    pub class_name: String,
    pub slots: Rc<RefCell<HashMap<String, EvalResult>>>,
}

thread_local! {
    static INSTANCE_ID_COUNTER: RefCell<u64> = const { RefCell::new(1) };
}

pub fn next_instance_id() -> u64 {
    INSTANCE_ID_COUNTER.with(|counter| {
        let id = *counter.borrow();
        *counter.borrow_mut() = id + 1;
        id
    })
}

/// CLOS Method: function with specializers for dispatch
#[derive(Clone)]
pub struct Method {
    pub qualifier: Option<String>, // :before, :after, :around, or None for primary
    pub specializers: Vec<String>, // Class names for each parameter
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
    /// Preserves explicit `single-float` literals during macro data conversion.
    FloatSingle(f64),
    Complex(f64, f64), // Complex number (real, imaginary)
    Bool(bool),
    Boolean(bool), // CL boolean type
    Nil,
    String(String),
    Symbol(String),
    Character(char), // CL character type
    Cons(Rc<RefCell<EvalResult>>, Rc<RefCell<EvalResult>>),
    Lambda {
        params: Vec<String>,
        defaults: HashMap<String, ASTNode>, // Default values for params
        supplied_p_vars: HashMap<String, String>, // Maps param -> supplied-p var
        key_params: HashMap<String, String>, // Maps param -> keyword name (no leading :)
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
        params: Vec<String>, // place + lambda-list params
        function: String,    // The function to call
        has_rest: bool,      // Whether lambda-list has &rest
    },
    HashTable(Rc<RefCell<HashMap<String, EvalResult>>>),
    Array(Rc<RefCell<Vec<EvalResult>>>), // Simple 1D array/vector
    /// Deferred class slot initform AST (evaluated at instance initialization time).
    InitForm(ASTNode),
    WasmBytes(Vec<u8>),
    BuiltinFunction(String),                // Name of builtin function
    MultipleValues(Vec<EvalResult>),        // Multiple return values
    ForeignLibrary(Rc<rlasp_ffi::Library>), // FFI library (wrapped in Rc since Library may not be Clone)
    ForeignFunction(Rc<rlasp_ffi::ForeignFunction>), // FFI function (wrapped in Rc)
    Instance(Instance),                     // CLOS instance with class metadata
    GenericFunction(Rc<RefCell<GenericFunction>>), // CLOS generic function with methods
    Condition(Rc<RefCell<super::eval_conditions::ConditionInstance>>), // Condition instance
    Restart(String),                        // Condition system restart designator
    Package(String),                        // Package object (stores package name)
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
            EvalResult::FloatSingle(fl) => write!(f, "{}", fl),
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
            EvalResult::InitForm(_) => write!(f, "#<INITFORM>"),
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
            EvalResult::Instance(inst) => write!(
                f,
                "#<{} instance>",
                class_of(&EvalResult::Instance(inst.clone()))
            ),
            EvalResult::GenericFunction(gf) => {
                write!(f, "#<GENERIC-FUNCTION {}>", gf.borrow().name)
            }
            EvalResult::Condition(cond) => {
                let cond_ref = cond.borrow();
                if let Some(EvalResult::String(msg)) = cond_ref.slots.get("FORMAT-CONTROL") {
                    write!(f, "#<CONDITION {}: {}>", cond_ref.type_name, msg)
                } else {
                    write!(f, "#<CONDITION {}>", cond_ref.type_name)
                }
            }
            EvalResult::Restart(name) => write!(f, "#<RESTART {}>", name),
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
    fn array_items(arr: &Rc<RefCell<Vec<EvalResult>>>) -> Vec<EvalResult> {
        let cells = arr.borrow();
        let active_len = super::eval_system::get_array_fill_pointer(arr).unwrap_or(cells.len());
        cells.iter().take(active_len).cloned().collect()
    }

    match (a, b) {
        (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => a == b,
        (EvalResult::Bignum(a), EvalResult::Bignum(b)) => a == b,
        (EvalResult::Ratio(a), EvalResult::Ratio(b)) => a == b,
        (EvalResult::Float(a), EvalResult::Float(b)) => a == b,
        (EvalResult::FloatSingle(a), EvalResult::FloatSingle(b)) => a == b,
        (EvalResult::Float(a), EvalResult::FloatSingle(b))
        | (EvalResult::FloatSingle(a), EvalResult::Float(b)) => a == b,
        (EvalResult::Complex(a_re, a_im), EvalResult::Complex(b_re, b_im)) => {
            a_re == b_re && a_im == b_im
        }
        (EvalResult::Bool(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Boolean(a), EvalResult::Boolean(b)) => a == b,
        (EvalResult::Bool(a), EvalResult::Boolean(b))
        | (EvalResult::Boolean(a), EvalResult::Bool(b)) => a == b,
        (EvalResult::Bool(true), EvalResult::Symbol(s))
        | (EvalResult::Boolean(true), EvalResult::Symbol(s))
        | (EvalResult::Symbol(s), EvalResult::Bool(true))
        | (EvalResult::Symbol(s), EvalResult::Boolean(true)) => s.eq_ignore_ascii_case("T"),
        (EvalResult::Nil, EvalResult::Symbol(s))
        | (EvalResult::Symbol(s), EvalResult::Nil)
        | (EvalResult::Bool(false), EvalResult::Symbol(s))
        | (EvalResult::Boolean(false), EvalResult::Symbol(s))
        | (EvalResult::Symbol(s), EvalResult::Bool(false))
        | (EvalResult::Symbol(s), EvalResult::Boolean(false)) => s.eq_ignore_ascii_case("NIL"),
        (EvalResult::Nil, EvalResult::Nil) => true,
        (EvalResult::Character(a), EvalResult::Character(b)) => a == b,
        (EvalResult::String(a), EvalResult::String(b)) => a == b,
        (EvalResult::Symbol(a), EvalResult::Symbol(b)) => a.eq_ignore_ascii_case(b),
        (EvalResult::Restart(a), EvalResult::Restart(b)) => a.eq_ignore_ascii_case(b),
        (EvalResult::Cons(a_car, a_cdr), EvalResult::Cons(b_car, b_cdr)) => {
            structural_equal(&a_car.borrow(), &b_car.borrow())
                && structural_equal(&a_cdr.borrow(), &b_cdr.borrow())
        }
        (EvalResult::Array(a_arr), EvalResult::Array(b_arr)) => {
            let a_items = array_items(a_arr);
            let b_items = array_items(b_arr);
            a_items.len() == b_items.len()
                && a_items
                    .iter()
                    .zip(b_items.iter())
                    .all(|(lhs, rhs)| structural_equal(lhs, rhs))
        }
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
            if let Some(EvalResult::Symbol(name)) = inst
                .slots
                .borrow()
                .get(super::eval_clos::CLASS_NAME_OVERRIDE_SLOT_KEY)
            {
                name.clone()
            } else {
                inst.class_name.clone()
            }
        }
        EvalResult::Fixnum(n) => {
            const CL_FIXNUM_MIN: i64 = -(1i64 << 61);
            const CL_FIXNUM_MAX: i64 = (1i64 << 61) - 1;
            if (CL_FIXNUM_MIN..=CL_FIXNUM_MAX).contains(n) {
                "FIXNUM".to_string()
            } else {
                "BIGNUM".to_string()
            }
        }
        EvalResult::Bignum(_) => "BIGNUM".to_string(),
        EvalResult::Ratio(_) => "RATIO".to_string(),
        EvalResult::Float(_) => "FLOAT".to_string(),
        EvalResult::FloatSingle(_) => "FLOAT".to_string(),
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
        EvalResult::Array(arr) => {
            if super::eval_system::array_dims_for_bridge(arr).len() == 1 {
                "VECTOR".to_string()
            } else {
                "ARRAY".to_string()
            }
        }
        EvalResult::GenericFunction(_) => "GENERIC-FUNCTION".to_string(),
        EvalResult::Restart(_) => "RESTART".to_string(),
        EvalResult::InitForm(_) => "T".to_string(),
        _ => "T".to_string(),
    }
}

/// Check if a value matches a specializer for method dispatch
/// T matches everything, otherwise check class hierarchy
pub fn specializer_matches(specializer: &str, val: &EvalResult) -> bool {
    let specializer_upper = specializer.to_ascii_uppercase();
    if specializer_upper.starts_with("EQL::") {
        let payload = &specializer[5..];
        if let Some(sym_name) = payload.strip_prefix("SYM:") {
            return matches!(val, EvalResult::Symbol(s) if s.eq_ignore_ascii_case(sym_name));
        }
        if let Some(n_raw) = payload.strip_prefix("FIXNUM:") {
            if let Ok(n) = n_raw.parse::<i64>() {
                return matches!(val, EvalResult::Fixnum(v) if *v == n);
            }
            return false;
        }
        if let Some(s_raw) = payload.strip_prefix("STRING:") {
            return matches!(val, EvalResult::String(s) if s == s_raw);
        }
        if payload.eq_ignore_ascii_case("NIL") {
            return matches!(val, EvalResult::Nil);
        }
        if payload.eq_ignore_ascii_case("T") {
            return matches!(val, EvalResult::Symbol(s) if s.eq_ignore_ascii_case("t"))
                || matches!(val, EvalResult::Bool(true) | EvalResult::Boolean(true));
        }
        return false;
    }

    if specializer.eq_ignore_ascii_case("T") || specializer.is_empty() {
        return true;
    }
    let val_class = class_of(val);
    // Check if val's class is a subclass of specializer
    is_subclass(&val_class, specializer)
}
