/// eval_package.rs - Common Lisp package system operations
use super::eval_types::EvalResult;
use std::collections::HashMap;

// Standard Common Lisp symbols that should be exported from the CL package
const CL_SYMBOLS: &[&str] = &[
    // Package functions
    "DEFPACKAGE",
    "IN-PACKAGE",
    "MAKE-PACKAGE",
    "DELETE-PACKAGE",
    "FIND-PACKAGE",
    "RENAME-PACKAGE",
    "PACKAGE-NAME",
    "PACKAGE-NICKNAMES",
    "PACKAGE-USE-LIST",
    "PACKAGE-USED-BY-LIST",
    "PACKAGE-SHADOWING-SYMBOLS",
    "USE-PACKAGE",
    "UNUSE-PACKAGE",
    "EXPORT",
    "UNEXPORT",
    "IMPORT",
    "SHADOWING-IMPORT",
    "SHADOW",
    "INTERN",
    "UNINTERN",
    "FIND-SYMBOL",
    "FIND-ALL-SYMBOLS",
    "DO-SYMBOLS",
    "DO-EXTERNAL-SYMBOLS",
    "DO-ALL-SYMBOLS",
    "STANDARD",
    "PACKAGEP",
    "LIST-ALL-PACKAGES",
    // Type functions
    "TYPE-OF",
    "TYPEP",
    "SUBTYPEP",
    "COERCE",
    "DEFTYPE",
    "CHECK-TYPE",
    "THE",
    // Arithmetic
    "+",
    "-",
    "*",
    "/",
    "1+",
    "1-",
    "ABS",
    "MOD",
    "REM",
    "FLOOR",
    "CEILING",
    "TRUNCATE",
    "ROUND",
    "MAX",
    "MIN",
    "GCD",
    "LCM",
    "EXPT",
    "EXP",
    "LOG",
    "SQRT",
    "ISQRT",
    "SIN",
    "COS",
    "TAN",
    "ASIN",
    "ACOS",
    "ATAN",
    "SINH",
    "COSH",
    "TANH",
    "RANDOM",
    "RANDOM-STATE-P",
    "MAKE-RANDOM-STATE",
    // Comparison
    "=",
    "/=",
    "<",
    ">",
    "<=",
    ">=",
    "ZEROP",
    "PLUSP",
    "MINUSP",
    "EVENP",
    "ODDP",
    "EQ",
    "EQL",
    "EQUAL",
    "EQUALP",
    // Logic
    "NOT",
    "AND",
    "OR",
    // List functions
    "CAR",
    "CDR",
    "CAAR",
    "CADR",
    "CDAR",
    "CDDR",
    "FIRST",
    "REST",
    "SECOND",
    "THIRD",
    "CONS",
    "LIST",
    "LIST*",
    "APPEND",
    "NCONC",
    "REVERSE",
    "NREVERSE",
    "LENGTH",
    "NTH",
    "NTHCDR",
    "LAST",
    "BUTLAST",
    "NBUTLAST",
    "COPY-LIST",
    "COPY-TREE",
    "MEMBER",
    "ASSOC",
    "RASSOC",
    "ACONS",
    "PAIRLIS",
    "SUBST",
    "SUBLIS",
    "MAPCAR",
    "MAPLIST",
    "MAPC",
    "MAPL",
    "MAPCAN",
    "MAPCON",
    "PUSH",
    "POP",
    "PUSHNEW",
    // Sequence functions
    "ELT",
    "SUBSEQ",
    "COPY-SEQ",
    "FILL",
    "REPLACE",
    "COUNT",
    "COUNT-IF",
    "COUNT-IF-NOT",
    "FIND",
    "FIND-IF",
    "FIND-IF-NOT",
    "POSITION",
    "POSITION-IF",
    "POSITION-IF-NOT",
    "SEARCH",
    "MISMATCH",
    "REMOVE",
    "REMOVE-IF",
    "REMOVE-IF-NOT",
    "DELETE",
    "DELETE-IF",
    "REMOVE-DUPLICATES",
    "DELETE-DUPLICATES",
    "SUBSTITUTE",
    "NSUBSTITUTE",
    "CONCATENATE",
    "MERGE",
    "SORT",
    "STABLE-SORT",
    "MAP",
    "REDUCE",
    "EVERY",
    "SOME",
    "NOTEVERY",
    "NOTANY",
    // String functions
    "STRING",
    "STRING=",
    "STRING/=",
    "STRING<",
    "STRING>",
    "STRING<=",
    "STRING>=",
    "STRING-EQUAL",
    "STRING-NOT-EQUAL",
    "STRING-LESSP",
    "STRING-GREATERP",
    "STRING-UPCASE",
    "STRING-DOWNCASE",
    "STRING-CAPITALIZE",
    "NSTRING-UPCASE",
    "STRING-TRIM",
    "STRING-LEFT-TRIM",
    "STRING-RIGHT-TRIM",
    "CHAR",
    "SCHAR",
    // Character functions
    "CHAR=",
    "CHAR/=",
    "CHAR<",
    "CHAR>",
    "CHAR<=",
    "CHAR>=",
    "CHAR-CODE",
    "CODE-CHAR",
    "CHAR-NAME",
    "NAME-CHAR",
    "CHARACTER",
    "ALPHA-CHAR-P",
    "DIGIT-CHAR-P",
    "ALPHANUMERICP",
    "UPPER-CASE-P",
    "LOWER-CASE-P",
    "CHAR-UPCASE",
    "CHAR-DOWNCASE",
    "DIGIT-CHAR",
    // Array/Vector functions
    "MAKE-ARRAY",
    "AREF",
    "ARRAY-RANK",
    "ARRAY-DIMENSION",
    "ARRAY-DIMENSIONS",
    "ARRAY-TOTAL-SIZE",
    "ARRAY-ELEMENT-TYPE",
    "ADJUSTABLE-ARRAY-P",
    "VECTOR",
    "SVREF",
    "VECTOR-PUSH",
    "VECTOR-PUSH-EXTEND",
    "VECTOR-POP",
    // Hash table functions
    "MAKE-HASH-TABLE",
    "GETHASH",
    "REMHASH",
    "MAPHASH",
    "CLRHASH",
    "HASH-TABLE-COUNT",
    "HASH-TABLE-P",
    // Control flow
    "IF",
    "WHEN",
    "UNLESS",
    "COND",
    "CASE",
    "ECASE",
    "TYPECASE",
    "ETYPECASE",
    "PROGN",
    "PROG1",
    "PROG2",
    "BLOCK",
    "RETURN",
    "RETURN-FROM",
    "TAGBODY",
    "GO",
    "CATCH",
    "THROW",
    "UNWIND-PROTECT",
    "LET",
    "LET*",
    "FLET",
    "LABELS",
    "MACROLET",
    "PROGV",
    "MULTIPLE-VALUE-BIND",
    "MULTIPLE-VALUE-CALL",
    "MULTIPLE-VALUE-LIST",
    "MULTIPLE-VALUE-PROG1",
    "MULTIPLE-VALUE-SETQ",
    "VALUES",
    "VALUES-LIST",
    "LOOP",
    "DO",
    "DO*",
    "DOLIST",
    "DOTIMES",
    // Function definition
    "DEFUN",
    "DEFMACRO",
    "DEFGENERIC",
    "DEFMETHOD",
    "DEFCLASS",
    "DEFSTRUCT",
    "LAMBDA",
    "FUNCTION",
    "FUNCALL",
    "APPLY",
    "COMPLEMENT",
    "CONSTANTLY",
    "IDENTITY",
    // Variable definition
    "DEFVAR",
    "DEFPARAMETER",
    "DEFCONSTANT",
    "SETQ",
    "SETF",
    "PSETQ",
    "PSETF",
    "INCF",
    "DECF",
    "ROTATEF",
    "SHIFTF",
    // Evaluation
    "EVAL",
    "EVAL-WHEN",
    "LOAD",
    "COMPILE",
    "COMPILE-FILE",
    // Predicates
    "NULL",
    "ATOM",
    "LISTP",
    "CONSP",
    "SYMBOLP",
    "NUMBERP",
    "INTEGERP",
    "FLOATP",
    "RATIONALP",
    "REALP",
    "COMPLEXP",
    "CHARACTERP",
    "STRINGP",
    "ARRAYP",
    "VECTORP",
    "FUNCTIONP",
    "COMPILED-FUNCTION-P",
    "BOUNDP",
    "FBOUNDP",
    "CONSTANTP",
    // Symbol functions
    "SYMBOL-NAME",
    "SYMBOL-VALUE",
    "SYMBOL-FUNCTION",
    "SYMBOL-PLIST",
    "SYMBOL-PACKAGE",
    "MAKE-SYMBOL",
    "GENSYM",
    "GENTEMP",
    "GET",
    "GETF",
    "REMPROP",
    "REMF",
    // I/O
    "READ",
    "READ-LINE",
    "READ-CHAR",
    "UNREAD-CHAR",
    "PEEK-CHAR",
    "READ-FROM-STRING",
    "PRINT",
    "PRIN1",
    "PRINC",
    "WRITE",
    "WRITE-LINE",
    "WRITE-CHAR",
    "WRITE-STRING",
    "TERPRI",
    "FRESH-LINE",
    "FORMAT",
    "PPRINT",
    "OPEN",
    "CLOSE",
    "WITH-OPEN-FILE",
    "WITH-INPUT-FROM-STRING",
    "WITH-OUTPUT-TO-STRING",
    // Conditions
    "ERROR",
    "CERROR",
    "WARN",
    "SIGNAL",
    "HANDLER-BIND",
    "HANDLER-CASE",
    "RESTART-CASE",
    "RESTART-BIND",
    "INVOKE-RESTART",
    "FIND-RESTART",
    "COMPUTE-RESTARTS",
    "DEFINE-CONDITION",
    "MAKE-CONDITION",
    "CONDITION",
    "ASSERT",
    "CHECK-TYPE",
    "IGNORE-ERRORS",
    // CLOS
    "DEFCLASS",
    "DEFGENERIC",
    "DEFMETHOD",
    "MAKE-INSTANCE",
    "INITIALIZE-INSTANCE",
    "SLOT-VALUE",
    "SLOT-BOUNDP",
    "SLOT-MAKUNBOUND",
    "WITH-SLOTS",
    "WITH-ACCESSORS",
    "CLASS-OF",
    "CLASS-NAME",
    "FIND-CLASS",
    "CHANGE-CLASS",
    // Misc
    "DECLARE",
    "DECLAIM",
    "PROCLAIM",
    "SPECIAL",
    "TYPE",
    "FTYPE",
    "INLINE",
    "NOTINLINE",
    "OPTIMIZE",
    "DYNAMIC-EXTENT",
    "IGNORABLE",
    "IGNORE",
    "DOCUMENTATION",
    "DESCRIBE",
    "INSPECT",
    "ROOM",
    "TRACE",
    "UNTRACE",
    "STEP",
    "TIME",
    "GET-INTERNAL-REAL-TIME",
    "GET-INTERNAL-RUN-TIME",
    "SLEEP",
    "REQUIRE",
    "PROVIDE",
    "FEATURES",
    // Constants
    "T",
    "NIL",
    "PI",
    "MOST-POSITIVE-FIXNUM",
    "MOST-NEGATIVE-FIXNUM",
];

// Simple package registry (in real CL, this would be more sophisticated)
thread_local! {
    pub static PACKAGES: std::cell::RefCell<HashMap<String, Package>> = {
        let mut map = HashMap::new();
        // Initialize COMMON-LISP package with all standard symbols
        let mut cl_pkg = Package::new("COMMON-LISP", vec!["CL"]);
        for sym in rlasp_jit::intrinsics::CL_PACKAGE_EXPORTS {
            let identity = make_identity_for_package_symbol("COMMON-LISP", sym);
            cl_pkg.add_external_symbol_identity(sym, &identity);
        }
        map.insert("COMMON-LISP".to_string(), cl_pkg.clone());
        map.insert("CL".to_string(), cl_pkg);
        map.insert("KEYWORD".to_string(), Package::new("KEYWORD", vec![]));
        let mut core_pkg = Package::new("CORE", vec![]);
        core_pkg.use_package("COMMON-LISP");
        for sym in ["SIMPLE-PROGRAM-ERROR", "PACKAGE-LOCK-VIOLATION"] {
            let identity = make_identity_for_package_symbol("CORE", sym);
            core_pkg.add_external_symbol_identity(sym, &identity);
        }
        map.insert("CORE".to_string(), core_pkg);
        // CL-USER uses CL
        let mut cl_user = Package::new("COMMON-LISP-USER", vec!["CL-USER"]);
        cl_user.use_package("COMMON-LISP");
        map.insert("COMMON-LISP-USER".to_string(), cl_user.clone());
        map.insert("CL-USER".to_string(), cl_user);
        // Several regression tests expect this package to exist.
        let mut ast_tooling = Package::new("AST-TOOLING", vec![]);
        ast_tooling.use_package("COMMON-LISP");
        map.insert("AST-TOOLING".to_string(), ast_tooling);
        let mut gray_pkg = Package::new("GRAY", vec![]);
        gray_pkg.use_package("COMMON-LISP");
        for sym in [
            "FUNDAMENTAL-CHARACTER-INPUT-STREAM",
            "STREAM-READ-CHAR",
            "STREAM-UNREAD-CHAR",
        ] {
            let identity = make_identity_for_package_symbol("GRAY", sym);
            gray_pkg.add_external_symbol_identity(sym, &identity);
        }
        map.insert("GRAY".to_string(), gray_pkg);
        std::cell::RefCell::new(map)
    };
    pub static CURRENT_PACKAGE: std::cell::RefCell<String> =
        std::cell::RefCell::new("COMMON-LISP-USER".to_string());
}

#[derive(Debug, Clone)]
pub struct Package {
    name: String,
    nicknames: Vec<String>,
    legacy_aliases: Vec<String>,
    external_symbols: HashMap<String, String>,
    internal_symbols: HashMap<String, String>,
    use_list: Vec<String>, // Packages this package uses (inherits from)
    shadowing_symbols: Vec<String>, // Symbols that shadow inherited symbols
    locked: bool,
}

impl Package {
    pub fn new(name: &str, nicknames: Vec<&str>) -> Self {
        Package {
            name: name.to_string(),
            nicknames: nicknames.iter().map(|s| s.to_string()).collect(),
            legacy_aliases: Vec::new(),
            external_symbols: HashMap::new(),
            internal_symbols: HashMap::new(),
            use_list: Vec::new(),
            shadowing_symbols: Vec::new(),
            locked: false,
        }
    }

    /// Add a package to the use-list
    pub fn use_package(&mut self, pkg_name: &str) {
        let pkg_name = pkg_name.to_uppercase();
        if !self.use_list.contains(&pkg_name) {
            self.use_list.push(pkg_name);
        }
    }

    /// Get the use-list
    pub fn get_use_list(&self) -> &Vec<String> {
        &self.use_list
    }

    /// Get all external symbols
    pub fn get_external_symbols(&self) -> Vec<String> {
        self.external_symbols.keys().cloned().collect()
    }

    /// Get external symbol identities (values) as CL symbol designators.
    pub fn get_external_symbol_identities(&self) -> Vec<String> {
        self.external_symbols.values().cloned().collect()
    }

    /// Get all symbols (internal + external)
    pub fn get_all_symbols(&self) -> Vec<String> {
        let mut symbols: Vec<String> = self.external_symbols.keys().cloned().collect();
        symbols.extend(self.internal_symbols.keys().cloned());
        symbols
    }

    /// Get all present symbol identities (internal + external values).
    pub fn get_all_symbol_identities(&self) -> Vec<String> {
        let mut symbols: Vec<String> = self.external_symbols.values().cloned().collect();
        symbols.extend(self.internal_symbols.values().cloned());
        symbols
    }

    /// Add an internal symbol
    pub fn add_internal_symbol(&mut self, name: &str) {
        let upper = name.to_uppercase();
        self.internal_symbols.insert(upper.clone(), upper);
    }

    pub fn add_internal_symbol_identity(&mut self, base_name: &str, symbol_identity: &str) {
        self.internal_symbols
            .insert(base_name.to_uppercase(), symbol_identity.to_string());
    }

    /// Add an external symbol
    pub fn add_external_symbol(&mut self, name: &str) {
        let upper = name.to_uppercase();
        self.external_symbols.insert(upper.clone(), upper);
    }

    pub fn add_external_symbol_identity(&mut self, base_name: &str, symbol_identity: &str) {
        self.external_symbols
            .insert(base_name.to_uppercase(), symbol_identity.to_string());
    }

    /// Remove a symbol from the package (unintern)
    pub fn unintern(&mut self, name: &str) -> bool {
        let name_upper = name.to_uppercase();
        let was_external = self.external_symbols.remove(&name_upper).is_some();
        let was_internal = self.internal_symbols.remove(&name_upper).is_some();
        // Also remove from shadowing symbols if present
        self.shadowing_symbols.retain(|s| s != &name_upper);
        was_external || was_internal
    }

    /// Add a shadow symbol
    pub fn shadow(&mut self, name: &str) {
        let name_upper = name.to_uppercase();
        // Create an internal symbol with this name if it doesn't exist
        if !self.external_symbols.contains_key(&name_upper)
            && !self.internal_symbols.contains_key(&name_upper)
        {
            self.internal_symbols
                .insert(name_upper.clone(), name_upper.clone());
        }
        // Add to shadowing symbols if not already present
        if !self.shadowing_symbols.contains(&name_upper) {
            self.shadowing_symbols.push(name_upper);
        }
    }

    /// Import a symbol with shadowing (shadowing-import)
    pub fn shadowing_import(&mut self, name: &str) {
        let name_upper = name.to_uppercase();
        // Add as internal symbol
        self.internal_symbols
            .insert(name_upper.clone(), name_upper.clone());
        // Add to shadowing symbols if not already present
        if !self.shadowing_symbols.contains(&name_upper) {
            self.shadowing_symbols.push(name_upper);
        }
    }

    /// Remove a package from the use-list
    pub fn unuse_package(&mut self, pkg_name: &str) {
        let pkg_name = pkg_name.to_uppercase();
        self.use_list.retain(|p| p != &pkg_name);
    }

    /// Get the shadowing symbols
    pub fn get_shadowing_symbols(&self) -> &Vec<String> {
        &self.shadowing_symbols
    }

    /// Get package name
    pub fn get_name(&self) -> &str {
        &self.name
    }

    /// Check if a symbol exists in this package (internal or external)
    pub fn has_symbol(&self, name: &str) -> bool {
        let name_upper = name.to_uppercase();
        self.external_symbols.contains_key(&name_upper)
            || self.internal_symbols.contains_key(&name_upper)
    }
}

/// Get the current package name
pub fn get_current_package() -> String {
    CURRENT_PACKAGE.with(|p| p.borrow().clone())
}

pub fn set_current_package_runtime(pkg_name: &str) {
    let pkg_name = pkg_name.to_uppercase();
    CURRENT_PACKAGE.with(|p| {
        *p.borrow_mut() = pkg_name.clone();
    });
    let _ = rlasp_runtime::PACKAGE_MANAGER.set_current_package(&pkg_name);
}

pub fn is_package_locked(pkg_name: &str) -> bool {
    let key = pkg_name.to_uppercase();
    PACKAGES.with(|p| {
        let packages = p.borrow();
        if let Some(pkg) = packages.get(&key) {
            if pkg.locked {
                return true;
            }
            let canonical = pkg.get_name().to_string();
            return packages
                .values()
                .any(|candidate| candidate.get_name() == canonical && candidate.locked);
        }
        packages
            .values()
            .any(|pkg| pkg.get_name().eq_ignore_ascii_case(&key) && pkg.locked)
    })
}

pub fn is_current_package_locked() -> bool {
    is_package_locked(&get_current_package())
}

fn ensure_eval_package_registered(pkg_name: &str) {
    let upper = pkg_name.to_uppercase();
    let exists = PACKAGES.with(|p| p.borrow().contains_key(&upper));
    if exists {
        return;
    }
    if let Some(canon) = rlasp_jit::intrinsics::canonical_jit_package_name(&upper) {
        PACKAGES.with(|p| {
            let mut packages = p.borrow_mut();
            packages
                .entry(canon.clone())
                .or_insert_with(|| Package::new(&canon, vec![]));
        });
    }
}

fn ensure_package_unlocked(
    pkg_name: &str,
    env: &mut HashMap<String, EvalResult>,
) -> Result<(), String> {
    let locked = is_package_locked(pkg_name);
    if std::env::var("RLASP_DEBUG_PKGLOCK").is_ok() {
        eprintln!("[pkglock] ensure pkg={} locked={}", pkg_name, locked);
    }
    if locked {
        signal_package_lock_violation("Package is locked", env)?;
        Ok(())
    } else {
        Ok(())
    }
}

/// Check if a package uses CL/COMMON-LISP (directly or transitively)
/// This is used to determine if unqualified CL builtins should be accessible
pub fn package_uses_cl(pkg_name: &str) -> bool {
    let pkg_upper = pkg_name.to_uppercase();

    // CL and COMMON-LISP are the CL package
    if pkg_upper == "CL" || pkg_upper == "COMMON-LISP" {
        return true;
    }

    PACKAGES.with(|packages| {
        let packages = packages.borrow();
        if let Some(pkg) = packages.get(&pkg_upper) {
            // Check if this package directly uses CL
            for used in pkg.get_use_list() {
                let used_upper = used.to_uppercase();
                if used_upper == "CL"
                    || used_upper == "COMMON-LISP"
                    || used_upper == "UIOP/COMMON-LISP"
                    || used_upper == "UIOP"
                {
                    return true;
                }
            }
        }
        // Many ASDF/UIOP packages implicitly use CL through their package definitions
        // These packages are defined with (:use :uiop/common-lisp) or similar
        if pkg_upper.starts_with("UIOP") || pkg_upper.starts_with("ASDF") {
            return true;
        }
        false
    })
}

fn package_designator_key(arg: &EvalResult) -> Result<String, String> {
    let parse_printed_package = |raw: &str| -> Option<String> {
        let s = raw.trim();
        let upper = s.to_ascii_uppercase();
        if !upper.starts_with("#<PACKAGE \"") || !s.ends_with('>') {
            return None;
        }
        let first_quote = s.find('"')?;
        let last_quote = s.rfind('"')?;
        if last_quote <= first_quote {
            return None;
        }
        Some(s[first_quote + 1..last_quote].to_uppercase())
    };
    match arg {
        EvalResult::Package(name) => Ok(name.to_uppercase()),
        EvalResult::Character(c) => Ok(c.to_string().to_uppercase()),
        EvalResult::String(name) | EvalResult::Symbol(name) => {
            if let Some(pkg_name) = parse_printed_package(name) {
                Ok(pkg_name)
            } else if name.starts_with(':') {
                Ok(name[1..].to_uppercase())
            } else if let Some((_, tail)) = name.rsplit_once(':') {
                Ok(tail.to_uppercase())
            } else {
                Ok(name.to_uppercase())
            }
        }
        _ => {
            if std::env::var("RLASP_DEBUG_PACKAGE_DESIGNATOR").is_ok() {
                eprintln!(
                    "[package-designator-error] arg={:?} stack=[{}]",
                    arg,
                    super::eval_core::debug_call_stack_summary()
                );
            }
            Err("package designator must be a package, symbol, or string".to_string())
        }
    }
}

pub(crate) fn designator_to_package_name(arg: &EvalResult) -> Result<String, String> {
    let key = package_designator_key(arg)?;
    ensure_eval_package_registered(&key);
    let canonical = PACKAGES.with(|p| p.borrow().get(&key).map(|pkg| pkg.get_name().to_string()));
    let canonical = canonical.or_else(|| rlasp_jit::intrinsics::canonical_jit_package_name(&key));
    if std::env::var("RLASP_DEBUG_PACKAGE_OPS").is_ok() {
        eprintln!(
            "[pkg-op][designator->package] arg={:?} key={:?} canonical={:?}",
            arg, key, canonical
        );
    }
    Ok(canonical.unwrap_or(key))
}

fn canonical_package_name_for_registration(
    packages: &HashMap<String, Package>,
    package_key: &str,
) -> String {
    let upper = package_key.to_uppercase();
    packages
        .get(&upper)
        .map(|pkg| pkg.get_name().to_string())
        .unwrap_or(upper)
}

pub fn register_symbol_presence(symbol_name: &str, default_pkg: &str) {
    let trimmed = symbol_name.trim();
    if trimmed.is_empty() || trimmed.starts_with('%') || trimmed.starts_with('(') {
        return;
    }

    let (package_key, raw_base_name, is_internal) =
        if let Some((pkg, tail)) = trimmed.split_once("::") {
            (pkg.to_string(), tail, true)
        } else if let Some((pkg, tail)) = trimmed.split_once(':') {
            (pkg.to_string(), tail, false)
        } else {
            (default_pkg.to_string(), trimmed, true)
        };

    if package_key.is_empty() || raw_base_name.is_empty() {
        return;
    }

    let base_name = symbol_base_name(raw_base_name);
    if base_name.is_empty() || base_name.starts_with('%') {
        return;
    }

    PACKAGES.with(|p| {
        let mut packages = p.borrow_mut();
        let canonical_pkg = canonical_package_name_for_registration(&packages, &package_key);
        let pkg = packages
            .entry(canonical_pkg.clone())
            .or_insert_with(|| Package::new(&canonical_pkg, vec![]));
        if !pkg.external_symbols.contains_key(&base_name)
            && !pkg.internal_symbols.contains_key(&base_name)
        {
            let identity = if is_internal {
                format!("{}::{}", canonical_pkg, base_name)
            } else {
                format!("{}:{}", canonical_pkg, base_name)
            };
            pkg.add_internal_symbol_identity(&base_name, &identity);
        }
    });
}

fn designator_to_nickname(arg: &EvalResult) -> Result<String, String> {
    match arg {
        EvalResult::Character(c) => Ok(c.to_string().to_uppercase()),
        EvalResult::String(name) | EvalResult::Symbol(name) => {
            if name.starts_with(':') {
                Ok(name[1..].to_uppercase())
            } else {
                Ok(name.to_uppercase())
            }
        }
        _ => Err("nickname designator must be a symbol or string".to_string()),
    }
}

fn symbol_base_name(symbol_name: &str) -> String {
    let stripped = if symbol_name.starts_with(':') {
        &symbol_name[1..]
    } else {
        symbol_name
    };
    stripped
        .rsplit(':')
        .next()
        .unwrap_or(stripped)
        .to_uppercase()
}

fn symbol_identity_of(arg: &EvalResult, default_pkg: Option<&str>) -> Result<String, String> {
    match arg {
        EvalResult::MultipleValues(vals) => {
            if let Some(first) = vals.first() {
                symbol_identity_of(first, default_pkg)
            } else {
                Ok("NIL".to_string())
            }
        }
        EvalResult::Symbol(s) => {
            let base = symbol_base_name(s);
            if s.contains(':')
                || default_pkg.is_none()
                || base.eq_ignore_ascii_case("NIL")
                || base.eq_ignore_ascii_case("T")
            {
                Ok(s.to_string())
            } else {
                Ok(format!("{}::{}", default_pkg.unwrap(), base))
            }
        }
        EvalResult::String(s) => {
            let base = symbol_base_name(s);
            if s.contains(':') || default_pkg.is_none() {
                Ok(s.to_string())
            } else {
                Ok(format!("{}::{}", default_pkg.unwrap(), base))
            }
        }
        EvalResult::Bool(true) | EvalResult::Boolean(true) => Ok("T".to_string()),
        EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false) => {
            Ok("NIL".to_string())
        }
        _ => Err("symbol designator must be a symbol or string".to_string()),
    }
}

fn canonical_symbol_designator_identity(
    arg: &EvalResult,
    default_pkg: &str,
) -> Result<String, String> {
    match arg {
        EvalResult::MultipleValues(vals) => {
            if let Some(first) = vals.first() {
                canonical_symbol_designator_identity(first, default_pkg)
            } else {
                Ok("NIL".to_string())
            }
        }
        EvalResult::Symbol(s) | EvalResult::String(s) => {
            Ok(canonicalize_symbol_literal(s, Some(default_pkg), false))
        }
        EvalResult::Bool(true) | EvalResult::Boolean(true) => Ok("T".to_string()),
        EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false) => {
            Ok("NIL".to_string())
        }
        _ => Err("symbol designator must be a symbol or string".to_string()),
    }
}

fn symbol_list_from_arg(
    arg: &EvalResult,
    default_pkg: Option<&str>,
) -> Result<Vec<String>, String> {
    match arg {
        EvalResult::Symbol(_)
        | EvalResult::String(_)
        | EvalResult::Bool(_)
        | EvalResult::Boolean(_)
        | EvalResult::Nil => Ok(vec![symbol_identity_of(arg, default_pkg)?]),
        EvalResult::Cons(_, _) => {
            let mut out = Vec::new();
            let mut cur = arg.clone();
            while let EvalResult::Cons(car, cdr) = cur {
                out.push(symbol_identity_of(&car.borrow(), default_pkg)?);
                cur = cdr.borrow().clone();
            }
            Ok(out)
        }
        _ => Err("expected symbol designator or list of symbol designators".to_string()),
    }
}

fn vec_to_list(mut values: Vec<EvalResult>) -> EvalResult {
    let mut result = EvalResult::Nil;
    while let Some(v) = values.pop() {
        result = EvalResult::Cons(
            std::rc::Rc::new(std::cell::RefCell::new(v)),
            std::rc::Rc::new(std::cell::RefCell::new(result)),
        );
    }
    result
}

fn make_condition(type_name: &str, slots: HashMap<String, EvalResult>) -> EvalResult {
    EvalResult::Condition(std::rc::Rc::new(std::cell::RefCell::new(
        super::eval_conditions::ConditionInstance {
            type_name: type_name.to_uppercase(),
            slots,
        },
    )))
}

fn signal_unhandled(condition: EvalResult) -> Result<EvalResult, String> {
    super::eval_conditions::set_pending_signaled_condition(condition);
    Err("__SIGNAL_CONDITION__".to_string())
}

fn package_exists(name: &str) -> bool {
    let upper = name.to_uppercase();
    PACKAGES.with(|p| p.borrow().contains_key(&upper))
}

fn make_identity_for_package_symbol(pkg_name: &str, sym_name: &str) -> String {
    format!(
        "{}::{}",
        pkg_name.to_uppercase(),
        symbol_base_name(sym_name)
    )
}

fn make_external_identity_for_package_symbol(pkg_name: &str, sym_name: &str) -> String {
    format!("{}:{}", pkg_name.to_uppercase(), symbol_base_name(sym_name))
}

fn normalize_symbol_identity_for_home_package(
    identity: &str,
    home_pkg: &str,
    base_name: &str,
) -> String {
    if identity.contains(':')
        || identity.eq_ignore_ascii_case("NIL")
        || identity.eq_ignore_ascii_case("T")
    {
        identity.to_string()
    } else {
        make_identity_for_package_symbol(home_pkg, base_name)
    }
}

pub(crate) fn canonicalize_symbol_literal(
    raw_name: &str,
    default_pkg: Option<&str>,
    create_if_missing: bool,
) -> String {
    let raw = raw_name.trim();
    if raw.eq_ignore_ascii_case("NIL") {
        return "NIL".to_string();
    }
    if raw.eq_ignore_ascii_case("T") {
        return "T".to_string();
    }
    if raw.starts_with("#:") {
        return raw.to_string();
    }
    if raw.starts_with(':') {
        return format!(":{}", symbol_base_name(raw));
    }

    let qualified = if let Some((pkg, tail)) = raw.split_once("::") {
        Some((pkg.to_uppercase(), symbol_base_name(tail), false))
    } else if let Some((pkg, tail)) = raw.split_once(':') {
        Some((pkg.to_uppercase(), symbol_base_name(tail), true))
    } else {
        None
    };

    if let Some((pkg_key, base, external_only)) = qualified {
        ensure_eval_package_registered(&pkg_key);
        let canonical_pkg = PACKAGES.with(|p| {
            p.borrow()
                .get(&pkg_key)
                .map(|pkg| pkg.get_name().to_string())
                .unwrap_or(pkg_key.clone())
        });
        let found = PACKAGES.with(|p| {
            let packages = p.borrow();
            packages.get(&canonical_pkg).and_then(|pkg| {
                if external_only {
                    pkg.external_symbols.get(&base).cloned()
                } else {
                    pkg.external_symbols
                        .get(&base)
                        .cloned()
                        .or_else(|| pkg.internal_symbols.get(&base).cloned())
                }
            })
        });
        if let Some(identity) = found {
            return identity;
        }
        if !external_only && create_if_missing {
            let identity = make_identity_for_package_symbol(&canonical_pkg, &base);
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&canonical_pkg) {
                    pkg.add_internal_symbol_identity(&base, &identity);
                }
            });
            return identity;
        }
        return if external_only {
            make_external_identity_for_package_symbol(&canonical_pkg, &base)
        } else {
            make_identity_for_package_symbol(&canonical_pkg, &base)
        };
    }

    let current_pkg = default_pkg
        .map(|pkg| pkg.to_uppercase())
        .unwrap_or_else(get_current_package);
    ensure_eval_package_registered(&current_pkg);
    let found = PACKAGES.with(|p| {
        let packages = p.borrow();
        packages.get(&current_pkg).and_then(|pkg| {
            pkg.internal_symbols
                .get(raw)
                .cloned()
                .or_else(|| pkg.external_symbols.get(raw).cloned())
                .or_else(|| {
                    let base = symbol_base_name(raw);
                    pkg.internal_symbols
                        .get(&base)
                        .cloned()
                        .or_else(|| pkg.external_symbols.get(&base).cloned())
                        .or_else(|| {
                            for used_pkg_name in pkg.get_use_list() {
                                if let Some(used_pkg) = packages.get(used_pkg_name) {
                                    if let Some(sym) = used_pkg.external_symbols.get(&base) {
                                        return Some(sym.clone());
                                    }
                                }
                            }
                            None
                        })
                })
        })
    });
    if let Some(identity) = found {
        return identity;
    }

    let base = symbol_base_name(raw);
    if create_if_missing {
        let identity = make_identity_for_package_symbol(&current_pkg, &base);
        PACKAGES.with(|p| {
            let mut packages = p.borrow_mut();
            if let Some(pkg) = packages.get_mut(&current_pkg) {
                pkg.add_internal_symbol_identity(&base, &identity);
            }
        });
        identity
    } else {
        raw.to_string()
    }
}

pub(crate) fn canonicalize_existing_qualified_symbol_literal(raw_name: &str) -> String {
    let raw = raw_name.trim();
    if raw.eq_ignore_ascii_case("NIL") || raw.eq_ignore_ascii_case("T") {
        return raw.to_ascii_uppercase();
    }
    if raw.starts_with("#:") || raw.starts_with(':') || !raw.contains(':') {
        return raw.to_string();
    }

    let (pkg_key, raw_base_name, external_only) = if let Some((pkg, tail)) = raw.split_once("::") {
        (pkg.to_uppercase(), tail, false)
    } else if let Some((pkg, tail)) = raw.split_once(':') {
        (pkg.to_uppercase(), tail, true)
    } else {
        return raw.to_string();
    };

    let base = symbol_base_name(raw_base_name);
    let found = PACKAGES.with(|p| {
        let packages = p.borrow();
        packages.get(&pkg_key).and_then(|pkg| {
            if external_only {
                pkg.external_symbols.get(&base).cloned()
            } else {
                pkg.external_symbols
                    .get(&base)
                    .cloned()
                    .or_else(|| pkg.internal_symbols.get(&base).cloned())
            }
        })
    });
    if let Some(identity) = found {
        return identity;
    }

    let canonical_pkg = PACKAGES.with(|p| {
        p.borrow()
            .get(&pkg_key)
            .map(|pkg| pkg.get_name().to_string())
    });
    if let Some(pkg_name) = canonical_pkg {
        if external_only {
            make_external_identity_for_package_symbol(&pkg_name, &base)
        } else {
            make_identity_for_package_symbol(&pkg_name, &base)
        }
    } else {
        raw.to_string()
    }
}

fn rebind_package_aliases(packages: &mut HashMap<String, Package>, package: Package) {
    let canonical = package.get_name().to_uppercase();
    packages.retain(|_, existing| existing.get_name().to_uppercase() != canonical);
    packages.insert(canonical.clone(), package.clone());
    for nick in &package.nicknames {
        packages.insert(nick.to_uppercase(), package.clone());
    }
    for alias in &package.legacy_aliases {
        packages.insert(alias.to_uppercase(), package.clone());
    }
}

fn sync_jit_package_registry_from_eval() {
    let snapshots = PACKAGES.with(|p| {
        let packages = p.borrow();
        let mut unique = std::collections::BTreeMap::<String, Package>::new();
        for pkg in packages.values() {
            unique.insert(pkg.get_name().to_uppercase(), pkg.clone());
        }
        unique
            .into_values()
            .map(|pkg| rlasp_jit::intrinsics::ClPackage {
                name: pkg.get_name().to_uppercase(),
                nicknames: pkg.nicknames.clone(),
                use_list: pkg.use_list.clone(),
                used_by_list: Vec::new(),
                locked: pkg.locked,
                exported_symbols: pkg.external_symbols.clone(),
                shadowing_symbols: pkg.shadowing_symbols.iter().cloned().collect(),
                internal_symbols: pkg.internal_symbols.clone(),
            })
            .collect::<Vec<_>>()
    });
    rlasp_jit::intrinsics::reset_jit_package_registry_from_eval(snapshots);
    let current = get_current_package();
    rlasp_jit::intrinsics::set_jit_current_package(&current);
}

fn mutate_package_and_aliases<F>(
    packages: &mut HashMap<String, Package>,
    pkg_name: &str,
    mutator: F,
) -> bool
where
    F: FnOnce(&mut Package),
{
    let key = pkg_name.to_uppercase();
    let canonical = packages
        .get(&key)
        .map(|pkg| pkg.get_name().to_uppercase())
        .or_else(|| {
            packages
                .values()
                .find(|pkg| pkg.get_name().eq_ignore_ascii_case(&key))
                .map(|pkg| pkg.get_name().to_uppercase())
        });
    let Some(canonical) = canonical else {
        return false;
    };

    let mut pkg = packages.remove(&canonical).or_else(|| {
        packages
            .iter()
            .find(|(_, pkg)| pkg.get_name().eq_ignore_ascii_case(&canonical))
            .map(|(alias, _)| alias.clone())
            .and_then(|alias| packages.remove(&alias))
    });
    let Some(mut pkg) = pkg.take() else {
        return false;
    };

    for alias in pkg.nicknames.clone() {
        packages.remove(&alias.to_uppercase());
    }
    for alias in pkg.legacy_aliases.clone() {
        packages.remove(&alias.to_uppercase());
    }

    mutator(&mut pkg);
    rebind_package_aliases(packages, pkg);
    true
}

fn signal_condition_with_restart(
    condition: EvalResult,
    restart_name: Option<&str>,
    env: &mut HashMap<String, EvalResult>,
) -> Result<Option<EvalResult>, String> {
    use super::eval_conditions::{
        clear_last_restart_invocation, pop_restarts, push_restarts, signal_condition_value,
        take_last_restart_invocation, Restart,
    };
    use crate::ir::ASTNode;
    use std::cell::RefCell;
    use std::rc::Rc;

    clear_last_restart_invocation();
    let debug_restart = std::env::var("RLASP_DEBUG_NAME_CONFLICT")
        .map(|v| v != "0")
        .unwrap_or(false);

    if let Some(name) = restart_name {
        let (params, body) = if name.eq_ignore_ascii_case("CONTINUE") {
            (Vec::new(), vec![ASTNode::nil()])
        } else {
            (
                vec!["VALUE".to_string()],
                vec![ASTNode::Variable("VALUE".to_string())],
            )
        };
        let restart = Restart {
            name: name.to_uppercase(),
            function: ASTNode::Lambda {
                params,
                defaults: HashMap::new(),
                supplied_p_vars: HashMap::new(),
                key_params: HashMap::new(),
                body,
            },
            env: Rc::new(RefCell::new(env.clone())),
            interactive: None,
            report: None,
            test: None,
        };
        push_restarts(vec![restart]);
        let signaled = signal_condition_value(condition.clone(), env);
        pop_restarts();
        if debug_restart {
            eprintln!(
                "RLASP_DEBUG_RESTART after-signal name={} signaled={:?}",
                name, signaled
            );
        }
        match signaled {
            Ok(_) => {}
            Err(e) => {
                if super::eval_conditions::extract_restart_transfer_payload(&e, name).is_none() {
                    return Err(e);
                }
            }
        }
    } else {
        signal_condition_value(condition.clone(), env)?;
    }

    let taken = take_last_restart_invocation();
    if debug_restart {
        eprintln!("RLASP_DEBUG_RESTART taken={:?}", taken);
    }
    if let Some((_name, value)) = taken {
        Ok(Some(value))
    } else {
        Ok(None)
    }
}

fn signal_package_error(
    message: &str,
    env: &mut HashMap<String, EvalResult>,
    continuable: bool,
) -> Result<EvalResult, String> {
    let mut slots = HashMap::new();
    slots.insert(
        "FORMAT-CONTROL".to_string(),
        EvalResult::String(message.to_string()),
    );
    let condition = make_condition("PACKAGE-ERROR", slots);
    let restart = if continuable { Some("CONTINUE") } else { None };
    let restart_result = signal_condition_with_restart(condition.clone(), restart, env)?;
    if continuable && restart_result.is_some() {
        Ok(EvalResult::Nil)
    } else {
        signal_unhandled(condition)
    }
}

pub(crate) fn signal_package_lock_violation(
    message: &str,
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    let mut slots = HashMap::new();
    slots.insert(
        "FORMAT-CONTROL".to_string(),
        EvalResult::String(message.to_string()),
    );
    let condition = make_condition("PACKAGE-LOCK-VIOLATION", slots);
    let _ = signal_condition_with_restart(condition.clone(), None, env)?;
    signal_unhandled(condition)
}

fn signal_name_conflict(
    candidates: Vec<String>,
    env: &mut HashMap<String, EvalResult>,
) -> Result<Option<String>, String> {
    if std::env::var("RLASP_DEBUG_NAME_CONFLICT")
        .map(|v| v != "0")
        .unwrap_or(false)
    {
        let current_pkg = get_current_package();
        let use_list = PACKAGES.with(|p| {
            let packages = p.borrow();
            packages
                .get(&current_pkg)
                .map(|pkg| pkg.get_use_list().clone())
                .unwrap_or_default()
        });
        eprintln!(
            "RLASP_DEBUG_NAME_CONFLICT current_package={} use_list={:?} candidates={:?}",
            current_pkg, use_list, candidates
        );
    }
    let candidate_values = candidates
        .iter()
        .map(|s| EvalResult::Symbol(s.clone()))
        .collect::<Vec<_>>();
    let mut slots = HashMap::new();
    slots.insert("CANDIDATES".to_string(), vec_to_list(candidate_values));
    let condition = make_condition("NAME-CONFLICT", slots);
    let restart_value =
        signal_condition_with_restart(condition.clone(), Some("RESOLVE-CONFLICT"), env)?;
    if std::env::var("RLASP_DEBUG_NAME_CONFLICT")
        .map(|v| v != "0")
        .unwrap_or(false)
    {
        eprintln!(
            "RLASP_DEBUG_NAME_CONFLICT restart_value={:?} candidates={:?}",
            restart_value, candidates
        );
    }
    if let Some(v) = restart_value {
        let chosen = symbol_identity_of(&v, None)?;
        if std::env::var("RLASP_DEBUG_NAME_CONFLICT")
            .map(|v| v != "0")
            .unwrap_or(false)
        {
            eprintln!("RLASP_DEBUG_NAME_CONFLICT chosen={}", chosen);
        }
        if !candidates
            .iter()
            .any(|candidate| candidate.eq_ignore_ascii_case(&chosen))
        {
            return Err("Invalid RESOLVE-CONFLICT choice".to_string());
        }
        return Ok(Some(chosen));
    }
    signal_unhandled(condition)?;
    Ok(None)
}

fn debug_name_conflict_site(site: &str, pkg: &str, base: &str, candidates: &[String]) {
    if std::env::var("RLASP_DEBUG_NAME_CONFLICT")
        .map(|v| v != "0")
        .unwrap_or(false)
    {
        eprintln!(
            "RLASP_DEBUG_NAME_CONFLICT site={} package={} base={} candidates={:?}",
            site, pkg, base, candidates
        );
    }
}

pub fn call_package_builtin(
    name: &str,
    args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    let name_lower_full = name.to_ascii_lowercase();
    let name_lower = name_lower_full
        .rsplit(':')
        .next()
        .unwrap_or(name_lower_full.as_str());
    let debug_pkg_ops = std::env::var("RLASP_DEBUG_PACKAGE_OPS").is_ok();
    if debug_pkg_ops {
        eprintln!("[pkg-op] enter {} args={:?}", name_lower, args);
    }
    let result = match name_lower {
        "packagep" => {
            // Check if object is (or designates) a package.
            let is_pkg = match args.get(0) {
                Some(EvalResult::Package(name)) => {
                    let key = name.to_uppercase();
                    PACKAGES.with(|p| p.borrow().contains_key(&key))
                }
                Some(EvalResult::String(_))
                | Some(EvalResult::Symbol(_))
                | Some(EvalResult::Character(_)) => match package_designator_key(&args[0]) {
                    Ok(key) => PACKAGES.with(|p| p.borrow().contains_key(&key)),
                    Err(_) => false,
                },
                _ => false,
            };
            Ok(EvalResult::Boolean(is_pkg))
        }

        "find-package" => {
            // (find-package name)
            match args.get(0) {
                Some(EvalResult::Character(c)) => {
                    let pkg_name = c.to_string().to_uppercase();
                    ensure_eval_package_registered(&pkg_name);
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&pkg_name) {
                            Ok(EvalResult::Package(pkg.get_name().to_string()))
                        } else if let Some(canon) =
                            rlasp_jit::intrinsics::canonical_jit_package_name(&pkg_name)
                        {
                            Ok(EvalResult::Package(canon))
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    // Accept plain names, keyword symbols, and package-qualified symbols.
                    let raw = if name.starts_with('#') {
                        name.trim_start_matches('#').trim_start_matches(':')
                    } else if let Some((_, tail)) = name.rsplit_once(':') {
                        tail
                    } else if let Some(tail) = name.strip_prefix(':') {
                        tail
                    } else {
                        name.as_str()
                    };
                    let pkg_name = raw.to_uppercase();
                    ensure_eval_package_registered(&pkg_name);
                    // Look up the package and return its canonical name
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&pkg_name) {
                            // Return the package's canonical name, not the lookup key (which could be a nickname)
                            Ok(EvalResult::Package(pkg.get_name().to_string()))
                        } else {
                            // Check JIT package registry (populated during load-mlir)
                            if let Some(canon) =
                                rlasp_jit::intrinsics::canonical_jit_package_name(&pkg_name)
                            {
                                Ok(EvalResult::Package(canon))
                            } else {
                                Ok(EvalResult::Nil)
                            }
                        }
                    })
                }
                // Package object passed directly
                Some(EvalResult::Package(name)) => {
                    let key = name.to_uppercase();
                    ensure_eval_package_registered(&key);
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&key) {
                            Ok(EvalResult::Package(pkg.get_name().to_string()))
                        } else if let Some(canon) =
                            rlasp_jit::intrinsics::canonical_jit_package_name(&key)
                        {
                            Ok(EvalResult::Package(canon))
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                // NIL means no package - return NIL
                Some(EvalResult::Nil) | None => Ok(EvalResult::Nil),
                _ => Err("find-package requires a string or symbol".to_string()),
            }
        }

        "package-name" => {
            // (package-name package) - return the name of the given package
            match args.get(0) {
                Some(EvalResult::Package(name)) => {
                    let key = name.to_uppercase();
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&key) {
                            Ok(EvalResult::String(pkg.get_name().to_string()))
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    let pkg_key = package_designator_key(&args[0])?;
                    let canonical = PACKAGES.with(|p| {
                        p.borrow()
                            .get(&pkg_key)
                            .map(|pkg| pkg.get_name().to_string())
                    });
                    if let Some(pkg_name) = canonical {
                        Ok(EvalResult::String(pkg_name))
                    } else {
                        Err(format!("No package named {}", name))
                    }
                }
                Some(EvalResult::Nil) | None => {
                    // No argument - return current package name
                    let pkg_name = CURRENT_PACKAGE.with(|p| p.borrow().clone());
                    Ok(EvalResult::String(pkg_name))
                }
                _ => Err("package-name requires a package".to_string()),
            }
        }

        "package-nicknames" => {
            // Return list of package nicknames
            let pkg_name = match args.get(0) {
                Some(arg) => designator_to_package_name(arg)?,
                None => get_current_package(),
            };
            PACKAGES.with(|p| {
                if let Some(pkg) = p.borrow().get(&pkg_name) {
                    Ok(vec_to_list(
                        pkg.nicknames
                            .iter()
                            .map(|n| EvalResult::String(n.clone()))
                            .collect(),
                    ))
                } else {
                    Ok(EvalResult::Nil)
                }
            })
        }

        "package-add-nickname" => {
            if args.len() < 2 {
                return Err("package-add-nickname requires package and nickname".to_string());
            }
            let pkg_name = designator_to_package_name(&args[0])?;
            let nickname = designator_to_nickname(&args[1])?;
            let pkg = PACKAGES.with(|p| p.borrow().get(&pkg_name).cloned());
            let mut pkg = match pkg {
                Some(p) => p,
                None => {
                    return signal_package_error(
                        &format!("No package named {}", pkg_name),
                        env,
                        false,
                    )
                }
            };
            if pkg
                .nicknames
                .iter()
                .any(|n| n.eq_ignore_ascii_case(&nickname))
            {
                return signal_package_error(
                    &format!("Package {} already has nickname {}", pkg_name, nickname),
                    env,
                    false,
                );
            }
            let nickname_owner = PACKAGES.with(|p| {
                p.borrow()
                    .get(&nickname.to_uppercase())
                    .map(|owner| owner.get_name().to_string())
            });
            if let Some(owner) = nickname_owner {
                if owner != pkg_name {
                    return signal_package_error(
                        &format!("Nickname {} is already in use", nickname),
                        env,
                        false,
                    );
                }
            }

            ensure_package_unlocked(&pkg_name, env)?;
            pkg.nicknames.push(nickname.clone());
            PACKAGES.with(|p| {
                rebind_package_aliases(&mut p.borrow_mut(), pkg);
            });
            Ok(EvalResult::String(nickname))
        }

        "package-remove-nickname" => {
            if args.len() < 2 {
                return Err("package-remove-nickname requires package and nickname".to_string());
            }
            let pkg_name = designator_to_package_name(&args[0])?;
            let nickname = designator_to_nickname(&args[1])?;
            let pkg = PACKAGES.with(|p| p.borrow().get(&pkg_name).cloned());
            let mut pkg = match pkg {
                Some(p) => p,
                None => {
                    return signal_package_error(
                        &format!("No package named {}", pkg_name),
                        env,
                        false,
                    )
                }
            };
            let before = pkg.nicknames.len();
            pkg.nicknames.retain(|n| !n.eq_ignore_ascii_case(&nickname));
            if pkg.nicknames.len() == before {
                return Ok(EvalResult::Nil);
            }

            ensure_package_unlocked(&pkg_name, env)?;
            PACKAGES.with(|p| {
                rebind_package_aliases(&mut p.borrow_mut(), pkg);
            });
            Ok(EvalResult::String(nickname))
        }

        "lock-package" => {
            if args.is_empty() {
                return Err("lock-package requires a package designator".to_string());
            }
            let pkg_name = designator_to_package_name(&args[0])?;
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                for pkg in packages.values_mut() {
                    if pkg.get_name() == pkg_name {
                        pkg.locked = true;
                    }
                }
            });
            Ok(EvalResult::Boolean(true))
        }

        "unlock-package" => {
            if args.is_empty() {
                return Err("unlock-package requires a package designator".to_string());
            }
            let pkg_name = designator_to_package_name(&args[0])?;
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                for pkg in packages.values_mut() {
                    if pkg.get_name() == pkg_name {
                        pkg.locked = false;
                    }
                }
            });
            Ok(EvalResult::Boolean(true))
        }

        "package-locked-p" => {
            if args.is_empty() {
                return Err("package-locked-p requires a package designator".to_string());
            }
            let pkg_name = designator_to_package_name(&args[0])?;
            let locked = PACKAGES.with(|p| {
                p.borrow()
                    .values()
                    .find(|pkg| pkg.get_name() == pkg_name)
                    .map(|pkg| pkg.locked)
                    .unwrap_or(false)
            });
            Ok(EvalResult::Boolean(locked))
        }

        "list-all-packages" => {
            // Return list of all packages
            PACKAGES.with(|p| {
                let mut unique: std::collections::BTreeSet<String> =
                    std::collections::BTreeSet::new();
                for pkg in p.borrow().values() {
                    unique.insert(pkg.get_name().to_string());
                }
                Ok(vec_to_list(
                    unique.into_iter().map(EvalResult::Package).collect(),
                ))
            })
        }

        "make-package" => {
            // (make-package package-name &key nicknames use)
            let pkg_name = match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    if name.starts_with("#<PACKAGE \"") && name.ends_with('>') {
                        let first_quote = name.find('"').unwrap_or(0);
                        let last_quote = name.rfind('"').unwrap_or(name.len());
                        if last_quote > first_quote {
                            name[first_quote + 1..last_quote].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    } else if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else if let Some((_, tail)) = name.rsplit_once(':') {
                        tail.to_uppercase()
                    } else {
                        name.to_uppercase()
                    }
                }
                _ => return Err("make-package requires a package name".to_string()),
            };

            let mut nicknames: Vec<String> = Vec::new();
            let mut use_packages: Vec<String> = Vec::new();
            let mut i = 1usize;
            while i + 1 < args.len() {
                let key = match &args[i] {
                    EvalResult::Symbol(s) | EvalResult::String(s) => {
                        s.trim_start_matches(':').to_ascii_uppercase()
                    }
                    _ => {
                        i += 1;
                        continue;
                    }
                };
                match key.as_str() {
                    "NICKNAMES" => {
                        match &args[i + 1] {
                            EvalResult::Cons(_, _) => {
                                let mut cur = args[i + 1].clone();
                                while let EvalResult::Cons(car, cdr) = cur {
                                    nicknames.push(designator_to_nickname(&car.borrow())?);
                                    cur = cdr.borrow().clone();
                                }
                            }
                            EvalResult::Nil => {}
                            other => {
                                nicknames.push(designator_to_nickname(other)?);
                            }
                        }
                        i += 2;
                    }
                    "USE" => {
                        match &args[i + 1] {
                            EvalResult::Cons(_, _) => {
                                let mut cur = args[i + 1].clone();
                                while let EvalResult::Cons(car, cdr) = cur {
                                    use_packages.push(designator_to_package_name(&car.borrow())?);
                                    cur = cdr.borrow().clone();
                                }
                            }
                            EvalResult::Nil => {}
                            other => {
                                use_packages.push(designator_to_package_name(other)?);
                            }
                        }
                        i += 2;
                    }
                    _ => i += 2,
                }
            }

            if package_exists(&pkg_name) {
                return signal_package_error(
                    &format!("Package {} already exists", pkg_name),
                    env,
                    true,
                );
            }
            for nn in &nicknames {
                if package_exists(nn) {
                    return signal_package_error(
                        &format!("Package nickname {} already exists", nn),
                        env,
                        true,
                    );
                }
            }

            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                let mut pkg = Package::new(&pkg_name, vec![]);
                pkg.nicknames = nicknames.clone();
                for used in &use_packages {
                    pkg.use_package(used);
                }
                rebind_package_aliases(&mut packages, pkg);
            });
            Ok(EvalResult::Package(pkg_name))
        }

        "in-package" => {
            // (in-package package-name)
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    // Strip leading colon for keywords
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };

                    // Ensure package exists
                    let exists = PACKAGES.with(|p| p.borrow().contains_key(&pkg_name));
                    if !exists {
                        PACKAGES.with(|p| {
                            p.borrow_mut()
                                .insert(pkg_name.clone(), Package::new(&pkg_name, vec![]));
                        });
                    }

                    // Set current package
                    CURRENT_PACKAGE.with(|p| {
                        *p.borrow_mut() = pkg_name.clone();
                    });

                    Ok(EvalResult::Symbol(pkg_name))
                }
                _ => Err("in-package requires a package name".to_string()),
            }
        }

        "export" => {
            // (export symbols &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };

            let symbols = symbol_list_from_arg(&args[0], Some(&pkg_name))?;
            if debug_pkg_ops {
                eprintln!("[pkg-op][export] pkg={} symbols={:?}", pkg_name, symbols);
            }
            for sym in symbols {
                let base = symbol_base_name(&sym);
                let source_state = PACKAGES.with(|p| {
                    let packages = p.borrow();
                    packages.get(&pkg_name).map(|pkg| {
                        let mut inherited_sym: Option<String> = None;
                        let mut inherited_conflict = false;
                        for used in pkg.get_use_list() {
                            if let Some(used_pkg) = packages.get(used) {
                                if let Some(sym) = used_pkg.external_symbols.get(&base) {
                                    if let Some(prev) = &inherited_sym {
                                        if !prev.eq_ignore_ascii_case(sym) {
                                            inherited_conflict = true;
                                            break;
                                        }
                                    } else {
                                        inherited_sym = Some(sym.clone());
                                    }
                                }
                            }
                        }
                        (
                            pkg.internal_symbols.get(&base).cloned(),
                            pkg.external_symbols.get(&base).cloned(),
                            inherited_sym,
                            inherited_conflict,
                        )
                    })
                });
                if debug_pkg_ops {
                    eprintln!(
                        "[pkg-op][export] sym={} base={} source_state={:?}",
                        sym, base, source_state
                    );
                    if source_state.is_none() {
                        let keys = PACKAGES.with(|p| {
                            let packages = p.borrow();
                            let mut keys = packages.keys().cloned().collect::<Vec<_>>();
                            keys.sort();
                            keys
                        });
                        eprintln!(
                            "[pkg-op][export] missing-pkg pkg_name={:?} pkg_len={} pkg_bytes={:?} keys={:?}",
                            pkg_name,
                            pkg_name.len(),
                            pkg_name.as_bytes(),
                            keys
                        );
                    }
                }
                let (internal_sym, external_sym, inherited_sym, inherited_conflict) =
                    source_state.unwrap_or((None, None, None, false));

                let export_sym = if let Some(es) = &external_sym {
                    es.clone()
                } else if let Some(isym) = &internal_sym {
                    isym.clone()
                } else if inherited_conflict {
                    let continued = signal_package_error(
                        &format!("Symbol {} is inherited ambiguously in {}", sym, pkg_name),
                        env,
                        true,
                    );
                    if continued.is_err() {
                        return continued;
                    }
                    sym.clone()
                } else if let Some(inherited) = &inherited_sym {
                    inherited.clone()
                } else {
                    let continued = signal_package_error(
                        &format!("Symbol {} is not accessible in {}", sym, pkg_name),
                        env,
                        true,
                    );
                    if continued.is_err() {
                        return continued;
                    }
                    sym.clone()
                };
                if debug_pkg_ops {
                    eprintln!(
                        "[pkg-op][export] sym={} export_sym={} internal={:?} external={:?} inherited={:?} inherited_conflict={}",
                        sym, export_sym, internal_sym, external_sym, inherited_sym, inherited_conflict
                    );
                }

                // Resolve conflicts in packages using this package.
                let users = PACKAGES.with(|p| {
                    let packages = p.borrow();
                    packages
                        .values()
                        .filter(|pkg| {
                            pkg.get_name() != pkg_name
                                && pkg
                                    .get_use_list()
                                    .iter()
                                    .any(|u| u.eq_ignore_ascii_case(&pkg_name))
                        })
                        .map(|pkg| pkg.get_name().to_string())
                        .collect::<Vec<_>>()
                });
                if debug_pkg_ops {
                    eprintln!("[pkg-op][export] sym={} users={:?}", sym, users);
                }
                for user in users {
                    let (present, inherited_other, is_shadowing) = PACKAGES.with(|p| {
                        let packages = p.borrow();
                        let mut present: Option<String> = None;
                        let mut inherited: Option<String> = None;
                        let mut shadowing = false;
                        if let Some(pkg) = packages.get(&user) {
                            present = pkg
                                .internal_symbols
                                .get(&base)
                                .cloned()
                                .or_else(|| pkg.external_symbols.get(&base).cloned());
                            shadowing = pkg.shadowing_symbols.contains(&base);
                            for used in pkg.get_use_list() {
                                if used.eq_ignore_ascii_case(&pkg_name) {
                                    continue;
                                }
                                if let Some(other) = packages.get(used) {
                                    if let Some(sym) = other.external_symbols.get(&base) {
                                        inherited = Some(sym.clone());
                                        break;
                                    }
                                }
                            }
                        }
                        (present, inherited, shadowing)
                    });
                    if debug_pkg_ops {
                        eprintln!(
                            "[pkg-op][export] sym={} user={} present={:?} inherited_other={:?} shadowing={}",
                            sym, user, present, inherited_other, is_shadowing
                        );
                    }

                    if is_shadowing {
                        // A shadowing symbol suppresses inherited name conflicts.
                        continue;
                    }

                    if let Some(old_present) = present {
                        if !old_present.eq_ignore_ascii_case(&export_sym) {
                            let candidates = vec![old_present.clone(), export_sym.clone()];
                            debug_name_conflict_site("export/present", &user, &base, &candidates);
                            let chosen = signal_name_conflict(candidates, env)?;
                            let chosen = match chosen {
                                Some(c) => c,
                                None => continue,
                            };
                            PACKAGES.with(|p| {
                                let mut packages = p.borrow_mut();
                                let _ = mutate_package_and_aliases(&mut packages, &user, |pkg| {
                                    if chosen.eq_ignore_ascii_case(&old_present) {
                                        pkg.add_internal_symbol_identity(&base, &old_present);
                                        if !pkg.shadowing_symbols.contains(&base) {
                                            pkg.shadowing_symbols.push(base.clone());
                                        }
                                    } else {
                                        pkg.internal_symbols.remove(&base);
                                        pkg.external_symbols.remove(&base);
                                    }
                                });
                                if debug_pkg_ops {
                                    let state = packages.get(&user).map(|pkg| {
                                        (
                                            pkg.internal_symbols.get(&base).cloned(),
                                            pkg.external_symbols.get(&base).cloned(),
                                            pkg.shadowing_symbols.clone(),
                                        )
                                    });
                                    eprintln!(
                                        "[pkg-op][export] user={} chosen={} post-state={:?}",
                                        user, chosen, state
                                    );
                                }
                            });
                        }
                    } else if let Some(old_inherited) = inherited_other {
                        if !old_inherited.eq_ignore_ascii_case(&export_sym) {
                            let candidates = vec![old_inherited.clone(), export_sym.clone()];
                            debug_name_conflict_site("export/inherited", &user, &base, &candidates);
                            let chosen = signal_name_conflict(candidates, env)?;
                            let chosen = chosen.unwrap_or(old_inherited.clone());
                            PACKAGES.with(|p| {
                                let mut packages = p.borrow_mut();
                                let _ = mutate_package_and_aliases(&mut packages, &user, |pkg| {
                                    pkg.add_internal_symbol_identity(&base, &chosen);
                                    if !pkg.shadowing_symbols.contains(&base) {
                                        pkg.shadowing_symbols.push(base.clone());
                                    }
                                });
                                if debug_pkg_ops {
                                    let state = packages.get(&user).map(|pkg| {
                                        (
                                            pkg.internal_symbols.get(&base).cloned(),
                                            pkg.external_symbols.get(&base).cloned(),
                                            pkg.shadowing_symbols.clone(),
                                        )
                                    });
                                    eprintln!(
                                        "[pkg-op][export] inherited user={} chosen={} post-state={:?}",
                                        user, chosen, state
                                    );
                                }
                            });
                        }
                    }
                }

                if !matches!(external_sym, Some(ref e) if e.eq_ignore_ascii_case(&export_sym)) {
                    if debug_pkg_ops {
                        eprintln!(
                            "[pkg-op][export] sym={} finalizing pkg={} export_sym={}",
                            sym, pkg_name, export_sym
                        );
                    }
                    ensure_package_unlocked(&pkg_name, env)?;
                    PACKAGES.with(|p| {
                        let mut packages = p.borrow_mut();
                        if mutate_package_and_aliases(&mut packages, &pkg_name, |pkg| {
                            pkg.add_external_symbol_identity(&base, &export_sym);
                        }) {
                            // updated
                        }
                    });
                    if debug_pkg_ops {
                        let rebound = PACKAGES.with(|p| {
                            p.borrow()
                                .get(&pkg_name)
                                .and_then(|pkg| pkg.external_symbols.get(&base).cloned())
                        });
                        eprintln!(
                            "[pkg-op][export] sym={} rebound_external={:?}",
                            sym, rebound
                        );
                    }
                }
            }

            Ok(EvalResult::Boolean(true))
        }

        "unexport" => {
            // (unexport symbols &optional package)
            // Mark symbols as internal
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };
            ensure_package_unlocked(&pkg_name, env)?;
            Ok(EvalResult::Boolean(true))
        }

        "import" => {
            // (import symbols &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }
            let debug_import_eq = std::env::var("RLASP_DEBUG_IMPORT_EQ").is_ok();

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };
            let symbols = symbol_list_from_arg(&args[0], Some(&pkg_name))?;

            for sym in symbols {
                let base = symbol_base_name(&sym);
                let existing = PACKAGES.with(|p| {
                    let packages = p.borrow();
                    packages.get(&pkg_name).and_then(|pkg| {
                        pkg.internal_symbols
                            .get(&base)
                            .cloned()
                            .or_else(|| pkg.external_symbols.get(&base).cloned())
                    })
                });
                if debug_import_eq {
                    eprintln!(
                        "[pkg-import] pkg={} base={} sym={} existing={:?} current={}",
                        pkg_name,
                        base,
                        sym,
                        existing,
                        get_current_package()
                    );
                }

                if let Some(existing_sym) = existing {
                    if existing_sym.eq_ignore_ascii_case(&sym) {
                        if debug_import_eq {
                            eprintln!("[pkg-import] noop continue");
                        }
                        continue;
                    }
                    let candidates = vec![existing_sym.clone(), sym.clone()];
                    debug_name_conflict_site("import/present", &pkg_name, &base, &candidates);
                    let chosen =
                        signal_name_conflict(candidates, env)?.unwrap_or(existing_sym.clone());
                    if !chosen.eq_ignore_ascii_case(&sym) {
                        continue;
                    }
                    ensure_package_unlocked(&pkg_name, env)?;
                    PACKAGES.with(|p| {
                        let mut packages = p.borrow_mut();
                        if mutate_package_and_aliases(&mut packages, &pkg_name, |pkg| {
                            pkg.add_internal_symbol_identity(&base, &sym);
                            pkg.external_symbols.remove(&base);
                        }) {
                            // updated
                        }
                    });
                    continue;
                }

                ensure_package_unlocked(&pkg_name, env)?;
                PACKAGES.with(|p| {
                    let mut packages = p.borrow_mut();
                    if mutate_package_and_aliases(&mut packages, &pkg_name, |pkg| {
                        pkg.add_internal_symbol_identity(&base, &sym);
                    }) {
                        // updated
                    }
                });
                if sym.starts_with("#:") {
                    super::eval_symbol::set_uninterned_symbol_home(&sym, &pkg_name);
                }
            }

            Ok(EvalResult::Boolean(true))
        }

        "use-package" => {
            // (use-package packages-to-use &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get list of packages to use
            let pkgs_to_use: Vec<String> = match &args[0] {
                EvalResult::Package(_) | EvalResult::Symbol(_) | EvalResult::String(_) => {
                    vec![designator_to_package_name(&args[0])?]
                }
                EvalResult::Cons(_, _) => {
                    let mut pkgs = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        match designator_to_package_name(&car.borrow()) {
                            Ok(pkg_name) => pkgs.push(pkg_name),
                            Err(_) => {}
                        }
                        current = cdr.borrow().clone();
                    }
                    pkgs
                }
                _ => return Ok(EvalResult::Boolean(true)),
            };

            // Get target package (defaults to current package)
            let target_pkg = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };
            ensure_package_unlocked(&target_pkg, env)?;

            for used_pkg in &pkgs_to_use {
                let already_using = PACKAGES.with(|p| {
                    let packages = p.borrow();
                    packages
                        .get(&target_pkg)
                        .map(|pkg| {
                            pkg.get_use_list()
                                .iter()
                                .any(|u| u.eq_ignore_ascii_case(used_pkg))
                        })
                        .unwrap_or(false)
                });
                if already_using {
                    continue;
                }

                let exported = PACKAGES.with(|p| {
                    let packages = p.borrow();
                    packages
                        .get(used_pkg)
                        .map(|pkg| {
                            pkg.external_symbols
                                .iter()
                                .map(|(k, v)| (k.clone(), v.clone()))
                                .collect::<Vec<_>>()
                        })
                        .unwrap_or_default()
                });

                for (base, new_sym) in exported {
                    let (present, inherited_other, is_shadowing) = PACKAGES.with(|p| {
                        let packages = p.borrow();
                        let mut present: Option<String> = None;
                        let mut inherited: Option<String> = None;
                        let mut shadowing = false;
                        if let Some(pkg) = packages.get(&target_pkg) {
                            present = pkg
                                .internal_symbols
                                .get(&base)
                                .cloned()
                                .or_else(|| pkg.external_symbols.get(&base).cloned());
                            shadowing = pkg.shadowing_symbols.contains(&base);
                            for already_used in pkg.get_use_list() {
                                if already_used.eq_ignore_ascii_case(used_pkg) {
                                    continue;
                                }
                                if let Some(other) = packages.get(already_used) {
                                    if let Some(sym) = other.external_symbols.get(&base) {
                                        inherited = Some(sym.clone());
                                        break;
                                    }
                                }
                            }
                        }
                        (present, inherited, shadowing)
                    });

                    if is_shadowing {
                        // A shadowing symbol suppresses inherited name conflicts.
                        continue;
                    }

                    if let Some(old_present) = present {
                        if !old_present.eq_ignore_ascii_case(&new_sym) {
                            let candidates = vec![old_present.clone(), new_sym.clone()];
                            debug_name_conflict_site(
                                "use-package/present",
                                &target_pkg,
                                &base,
                                &candidates,
                            );
                            let chosen = signal_name_conflict(candidates, env)?
                                .unwrap_or(old_present.clone());
                            PACKAGES.with(|p| {
                                let mut packages = p.borrow_mut();
                                let _ =
                                    mutate_package_and_aliases(&mut packages, &target_pkg, |pkg| {
                                        if chosen.eq_ignore_ascii_case(&old_present) {
                                            pkg.add_internal_symbol_identity(&base, &old_present);
                                            if !pkg.shadowing_symbols.contains(&base) {
                                                pkg.shadowing_symbols.push(base.clone());
                                            }
                                        } else {
                                            pkg.internal_symbols.remove(&base);
                                            pkg.external_symbols.remove(&base);
                                        }
                                    });
                                if debug_pkg_ops {
                                    let state = packages.get(&target_pkg).map(|pkg| {
                                        (
                                            pkg.internal_symbols.get(&base).cloned(),
                                            pkg.external_symbols.get(&base).cloned(),
                                            pkg.shadowing_symbols.clone(),
                                        )
                                    });
                                    eprintln!(
                                        "[pkg-op][use-package] target={} chosen={} post-state={:?}",
                                        target_pkg, chosen, state
                                    );
                                }
                            });
                        }
                    } else if let Some(old_inherited) = inherited_other {
                        if !old_inherited.eq_ignore_ascii_case(&new_sym) {
                            let candidates = vec![old_inherited.clone(), new_sym.clone()];
                            debug_name_conflict_site(
                                "use-package/inherited",
                                &target_pkg,
                                &base,
                                &candidates,
                            );
                            let chosen = signal_name_conflict(candidates, env)?
                                .unwrap_or(old_inherited.clone());
                            PACKAGES.with(|p| {
                                let mut packages = p.borrow_mut();
                                let _ =
                                    mutate_package_and_aliases(&mut packages, &target_pkg, |pkg| {
                                        pkg.add_internal_symbol_identity(&base, &chosen);
                                        if !pkg.shadowing_symbols.contains(&base) {
                                            pkg.shadowing_symbols.push(base.clone());
                                        }
                                    });
                                if debug_pkg_ops {
                                    let state = packages.get(&target_pkg).map(|pkg| {
                                        (
                                            pkg.internal_symbols.get(&base).cloned(),
                                            pkg.external_symbols.get(&base).cloned(),
                                            pkg.shadowing_symbols.clone(),
                                        )
                                    });
                                    eprintln!(
                                        "[pkg-op][use-package] inherited target={} chosen={} post-state={:?}",
                                        target_pkg, chosen, state
                                    );
                                }
                            });
                        }
                    }
                }

                PACKAGES.with(|p| {
                    let mut packages = p.borrow_mut();
                    if mutate_package_and_aliases(&mut packages, &target_pkg, |pkg| {
                        pkg.use_package(used_pkg);
                    }) {
                        // updated
                    }
                });
            }

            Ok(EvalResult::Boolean(true))
        }

        "unuse-package" => {
            // (unuse-package packages-to-unuse &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get list of packages to unuse
            let pkgs_to_unuse: Vec<String> = match &args[0] {
                EvalResult::Package(_) | EvalResult::Symbol(_) | EvalResult::String(_) => {
                    vec![designator_to_package_name(&args[0])?]
                }
                EvalResult::Cons(_, _) => {
                    let mut pkgs = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        match designator_to_package_name(&car.borrow()) {
                            Ok(pkg_name) => pkgs.push(pkg_name),
                            Err(_) => {}
                        }
                        current = cdr.borrow().clone();
                    }
                    pkgs
                }
                _ => return Ok(EvalResult::Boolean(true)),
            };

            // Get target package (defaults to current package)
            let target_pkg = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };
            ensure_package_unlocked(&target_pkg, env)?;

            // Remove each package from the target's use-list
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&target_pkg) {
                    for unused_pkg in &pkgs_to_unuse {
                        pkg.unuse_package(unused_pkg);
                    }
                }
            });

            Ok(EvalResult::Boolean(true))
        }

        "rename-package" => {
            // (rename-package package new-name &optional new-nicknames)
            // Rename a package
            let old_pkg_name = match args.get(0) {
                Some(arg) => designator_to_package_name(arg)?,
                None => return Err("rename-package requires a package designator".to_string()),
            };
            ensure_package_unlocked(&old_pkg_name, env)?;

            // Get new name from second arg
            let new_name = match args.get(1) {
                Some(EvalResult::Package(n)) => n.clone(),
                Some(EvalResult::String(n)) | Some(EvalResult::Symbol(n)) => {
                    if n.starts_with(':') {
                        n[1..].to_uppercase()
                    } else {
                        n.to_uppercase()
                    }
                }
                _ => return Err("rename-package requires a new name".to_string()),
            };

            // Get new nicknames from third arg (optional)
            let new_nicknames: Vec<String> = if args.len() > 2 {
                match &args[2] {
                    EvalResult::Cons(_, _) => {
                        let mut nicks = Vec::new();
                        let mut current = args[2].clone();
                        while let EvalResult::Cons(car, cdr) = current {
                            if let EvalResult::Symbol(s) | EvalResult::String(s) = &*car.borrow() {
                                let nick = if s.starts_with(':') {
                                    s[1..].to_uppercase()
                                } else {
                                    s.to_uppercase()
                                };
                                nicks.push(nick);
                            }
                            current = cdr.borrow().clone();
                        }
                        nicks
                    }
                    EvalResult::Nil => Vec::new(),
                    EvalResult::Symbol(s) | EvalResult::String(s) => {
                        let nick = if s.starts_with(':') {
                            s[1..].to_uppercase()
                        } else {
                            s.to_uppercase()
                        };
                        vec![nick]
                    }
                    _ => Vec::new(),
                }
            } else {
                Vec::new()
            };

            // Update the package registry
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(mut pkg) = packages.get(&old_pkg_name).cloned() {
                    let old_canonical_name = pkg.get_name().to_string();
                    let mut compatibility_aliases: Vec<String> = packages
                        .iter()
                        .filter_map(|(key, existing_pkg)| {
                            if existing_pkg.get_name() == old_canonical_name {
                                Some(key.clone())
                            } else {
                                None
                            }
                        })
                        .collect();
                    if !compatibility_aliases.contains(&old_pkg_name) {
                        compatibility_aliases.push(old_pkg_name.clone());
                    }

                    // Remove all mappings for the old canonical package.
                    packages
                        .retain(|_, existing_pkg| existing_pkg.get_name() != old_canonical_name);

                    // Update package name and nicknames
                    pkg.name = new_name.clone();
                    pkg.nicknames = new_nicknames.clone();
                    for alias in compatibility_aliases {
                        if alias.eq_ignore_ascii_case(&new_name)
                            || new_nicknames
                                .iter()
                                .any(|nick| nick.eq_ignore_ascii_case(&alias))
                        {
                            continue;
                        }
                        if !pkg
                            .legacy_aliases
                            .iter()
                            .any(|existing| existing.eq_ignore_ascii_case(&alias))
                        {
                            pkg.legacy_aliases.push(alias);
                        }
                    }
                    rebind_package_aliases(&mut packages, pkg);
                }
            });

            Ok(EvalResult::Package(new_name))
        }

        "unintern" => {
            // (unintern symbol &optional package)
            if args.is_empty() {
                return Err("unintern requires a symbol".to_string());
            }

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };
            let sym_identity =
                canonical_symbol_designator_identity(&args[0], &get_current_package())?;
            let sym_name = symbol_base_name(&sym_identity);

            // These are never internal symbols in standard packages; unintern should return NIL.
            if sym_name == "T" || sym_name == "NIL" {
                return Ok(EvalResult::Nil);
            }

            let direct_match = PACKAGES.with(|p| {
                let packages = p.borrow();
                packages.get(&pkg_name).and_then(|pkg| {
                    if let Some(identity) = pkg.external_symbols.get(&sym_name) {
                        let normalized = canonicalize_existing_qualified_symbol_literal(identity);
                        if normalized.eq_ignore_ascii_case(&sym_identity) {
                            return Some(":EXTERNAL");
                        }
                    }
                    if let Some(identity) = pkg.internal_symbols.get(&sym_name) {
                        let normalized = canonicalize_existing_qualified_symbol_literal(identity);
                        if normalized.eq_ignore_ascii_case(&sym_identity) {
                            return Some(":INTERNAL");
                        }
                    }
                    None
                })
            });
            if direct_match.is_none() {
                return Ok(EvalResult::Nil);
            }

            let protected_pkg =
                matches!(pkg_name.as_str(), "COMMON-LISP" | "CL" | "KEYWORD" | "CORE");
            if protected_pkg {
                return signal_package_error(
                    &format!("Cannot unintern {} from {}", sym_name, pkg_name),
                    env,
                    false,
                );
            }
            ensure_package_unlocked(&pkg_name, env)?;

            let inherited_conflict_choice = {
                let candidates = PACKAGES.with(|p| {
                    let packages = p.borrow();
                    let mut out: Vec<String> = Vec::new();
                    if let Some(pkg) = packages.get(&pkg_name) {
                        for used in pkg.get_use_list() {
                            if let Some(other) = packages.get(used) {
                                if let Some(sym) = other.external_symbols.get(&sym_name) {
                                    if !out.iter().any(|v| v.eq_ignore_ascii_case(sym)) {
                                        out.push(sym.clone());
                                    }
                                }
                            }
                        }
                    }
                    out
                });
                if candidates.len() > 1 {
                    debug_name_conflict_site(
                        "unintern/inherited",
                        &pkg_name,
                        &sym_name,
                        &candidates,
                    );
                    Some(
                        signal_name_conflict(candidates.clone(), env)?
                            .unwrap_or_else(|| candidates[0].clone()),
                    )
                } else {
                    None
                }
            };

            // Remove symbol from package
            let removed = PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                let mut did_remove = false;
                let found = mutate_package_and_aliases(&mut packages, &pkg_name, |pkg| {
                    did_remove = pkg.unintern(&sym_name);
                });
                found && did_remove
            });

            if !removed {
                return Ok(EvalResult::Nil);
            }
            if sym_identity.starts_with("#:") {
                super::eval_symbol::clear_uninterned_symbol_home(&sym_identity);
            }

            if let Some(chosen) = inherited_conflict_choice {
                PACKAGES.with(|p| {
                    let mut packages = p.borrow_mut();
                    if mutate_package_and_aliases(&mut packages, &pkg_name, |pkg| {
                        pkg.add_internal_symbol_identity(&sym_name, &chosen);
                        if !pkg.shadowing_symbols.contains(&sym_name) {
                            pkg.shadowing_symbols.push(sym_name.clone());
                        }
                    }) {
                        // updated
                    }
                });
            }

            Ok(EvalResult::Boolean(true))
        }

        "find-symbol" => {
            // (find-symbol string &optional package)
            // Return symbol and status (:internal, :external, :inherited, or nil) as multiple values
            let name = match args.get(0) {
                Some(EvalResult::String(s)) => symbol_base_name(s),
                Some(EvalResult::Symbol(s)) => symbol_base_name(s),
                _ => return Err("find-symbol requires a string".to_string()),
            };

            // Get package name - resolve to canonical name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Package(n) => n.clone(),
                    EvalResult::Symbol(n) => {
                        let key = if n.starts_with(':') {
                            n[1..].to_uppercase()
                        } else {
                            n.to_uppercase()
                        };
                        // Resolve nickname to canonical name
                        PACKAGES.with(|p| {
                            p.borrow()
                                .get(&key)
                                .map(|pkg| pkg.get_name().to_string())
                                .unwrap_or(key)
                        })
                    }
                    EvalResult::String(n) => {
                        let key = n.to_uppercase();
                        // Resolve nickname to canonical name
                        PACKAGES.with(|p| {
                            p.borrow()
                                .get(&key)
                                .map(|pkg| pkg.get_name().to_string())
                                .unwrap_or(key)
                        })
                    }
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };
            // Look up symbol in package (including inherited symbols)
            let result = PACKAGES.with(|p| {
                let packages = p.borrow();
                if let Some(pkg) = packages.get(&pkg_name) {
                    // First check direct symbols
                    if let Some(sym) = pkg.external_symbols.get(&name) {
                        let identity =
                            normalize_symbol_identity_for_home_package(sym, pkg.get_name(), &name);
                        return Some((identity, ":EXTERNAL"));
                    }
                    if let Some(sym) = pkg.internal_symbols.get(&name) {
                        let identity =
                            normalize_symbol_identity_for_home_package(sym, pkg.get_name(), &name);
                        return Some((identity, ":INTERNAL"));
                    }

                    // Check inherited symbols from used packages
                    for used_pkg_name in pkg.get_use_list() {
                        if let Some(used_pkg) = packages.get(used_pkg_name) {
                            if let Some(sym) = used_pkg.external_symbols.get(&name) {
                                let identity = normalize_symbol_identity_for_home_package(
                                    sym,
                                    used_pkg.get_name(),
                                    &name,
                                );
                                return Some((identity, ":INHERITED"));
                            }
                        }
                    }

                    None
                } else {
                    None
                }
            });

            match result {
                Some((sym_name, status)) => {
                    // Return symbol and status as multiple values
                    Ok(EvalResult::MultipleValues(vec![
                        EvalResult::Symbol(sym_name),
                        EvalResult::Symbol(status.to_string()),
                    ]))
                }
                None => {
                    // Return (values nil nil) when symbol not found
                    Ok(EvalResult::MultipleValues(vec![
                        EvalResult::Nil,
                        EvalResult::Nil,
                    ]))
                }
            }
        }

        "find-all-symbols" => {
            // (find-all-symbols string-designator)
            if args.is_empty() {
                return Err("find-all-symbols requires a symbol or string".to_string());
            }
            let target = match &args[0] {
                EvalResult::String(s) => s.to_uppercase(),
                EvalResult::Symbol(s) => {
                    let base = s.rsplit(':').next().unwrap_or(s);
                    if base.starts_with(':') {
                        base[1..].to_uppercase()
                    } else {
                        base.to_uppercase()
                    }
                }
                EvalResult::Nil => "NIL".to_string(),
                _ => return Err("find-all-symbols requires a symbol or string".to_string()),
            };

            let mut found = false;
            let mut results: Vec<String> = Vec::new();
            PACKAGES.with(|p| {
                let packages = p.borrow();
                let mut seen_pkgs = std::collections::HashSet::new();
                for pkg in packages.values() {
                    if !seen_pkgs.insert(pkg.get_name().to_string()) {
                        continue;
                    }
                    if let Some(sym) = pkg.internal_symbols.get(&target) {
                        found = true;
                        if !results.iter().any(|v| v.eq_ignore_ascii_case(sym)) {
                            results.push(sym.clone());
                        }
                    }
                    if let Some(sym) = pkg.external_symbols.get(&target) {
                        found = true;
                        if !results.iter().any(|v| v.eq_ignore_ascii_case(sym)) {
                            results.push(sym.clone());
                        }
                    }
                }
            });

            if !found {
                return Ok(EvalResult::Nil);
            }

            Ok(vec_to_list(
                results.into_iter().map(EvalResult::Symbol).collect(),
            ))
        }

        "intern" => {
            // (intern string &optional package)
            // Returns symbol and status as multiple values
            let name = match args.get(0) {
                Some(EvalResult::String(s)) => s.to_uppercase(),
                Some(EvalResult::Symbol(s)) => {
                    // Symbol designator uses SYMBOL-NAME semantics (package prefix stripped).
                    symbol_base_name(s)
                }
                Some(EvalResult::Nil) => "NIL".to_string(),
                _ => return Err("intern requires a string".to_string()),
            };

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };

            // Check if symbol already exists, if not add as internal
            // First check if already exists (without mutable borrow)
            let existing_status = PACKAGES.with(|p| {
                let packages = p.borrow();
                if let Some(pkg) = packages.get(&pkg_name) {
                    if let Some(sym) = pkg.external_symbols.get(&name) {
                        let identity =
                            normalize_symbol_identity_for_home_package(sym, pkg.get_name(), &name);
                        Some((identity, ":EXTERNAL"))
                    } else if let Some(sym) = pkg.internal_symbols.get(&name) {
                        let identity =
                            normalize_symbol_identity_for_home_package(sym, pkg.get_name(), &name);
                        Some((identity, ":INTERNAL"))
                    } else {
                        // Check inherited from use-list
                        for used_pkg_name in pkg.get_use_list() {
                            if let Some(used_pkg) = packages.get(used_pkg_name) {
                                if let Some(sym) = used_pkg.external_symbols.get(&name) {
                                    let identity = normalize_symbol_identity_for_home_package(
                                        sym,
                                        used_pkg.get_name(),
                                        &name,
                                    );
                                    return Some((identity, ":INHERITED"));
                                }
                            }
                        }
                        None
                    }
                } else {
                    None
                }
            });

            let (symbol_name, status) = match existing_status {
                Some((s, status)) => (s, status),
                None => {
                    ensure_package_unlocked(&pkg_name, env)?;
                    // Need to intern - use mutable borrow
                    let symbol_name = make_identity_for_package_symbol(&pkg_name, &name);
                    PACKAGES.with(|p| {
                        let mut packages = p.borrow_mut();
                        if let Some(pkg) = packages.get_mut(&pkg_name) {
                            pkg.add_internal_symbol_identity(&name, &symbol_name);
                        }
                    });
                    (symbol_name, "NIL")
                }
            };

            // Return multiple values: symbol and status
            if status == "NIL" {
                Ok(EvalResult::MultipleValues(vec![
                    EvalResult::Symbol(symbol_name),
                    EvalResult::Nil,
                ]))
            } else {
                Ok(EvalResult::MultipleValues(vec![
                    EvalResult::Symbol(symbol_name),
                    EvalResult::Symbol(status.to_string()),
                ]))
            }
        }

        "delete-package" => {
            // (delete-package package)
            match args.get(0) {
                Some(
                    arg @ (EvalResult::String(_) | EvalResult::Symbol(_) | EvalResult::Package(_)),
                ) => {
                    let pkg_name = designator_to_package_name(arg)?;
                    let users = PACKAGES.with(|p| {
                        let packages = p.borrow();
                        packages
                            .values()
                            .filter(|pkg| {
                                pkg.get_name() != pkg_name
                                    && pkg
                                        .get_use_list()
                                        .iter()
                                        .any(|u| u.eq_ignore_ascii_case(&pkg_name))
                            })
                            .map(|pkg| pkg.get_name().to_string())
                            .collect::<Vec<_>>()
                    });
                    if !users.is_empty() {
                        signal_package_error(
                            &format!(
                                "Cannot delete package {}; it is used by {:?}",
                                pkg_name, users
                            ),
                            env,
                            true,
                        )?;
                    }
                    ensure_package_unlocked(&pkg_name, env)?;
                    PACKAGES.with(|p| {
                        let mut packages = p.borrow_mut();
                        // Remove references from use-lists first.
                        for pkg in packages.values_mut() {
                            pkg.unuse_package(&pkg_name);
                        }
                        packages.retain(|_, pkg| pkg.get_name() != pkg_name);
                    });
                    Ok(EvalResult::Boolean(true))
                }
                Some(EvalResult::Nil) => Ok(EvalResult::Nil),
                _ => Err("delete-package requires a package designator".to_string()),
            }
        }

        "package-shadowing-symbols" => {
            // Return list of shadowing symbols in package
            match args.get(0) {
                Some(arg) => {
                    let pkg_name = designator_to_package_name(arg)?;
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&pkg_name) {
                            if debug_pkg_ops {
                                eprintln!(
                                    "[pkg-op][package-shadowing-symbols] pkg={} shadowing={:?} internal={:?} external={:?}",
                                    pkg_name,
                                    pkg.shadowing_symbols,
                                    pkg.internal_symbols,
                                    pkg.external_symbols
                                );
                            }
                            let mut result = EvalResult::Nil;
                            for sym_name in pkg.get_shadowing_symbols().iter().rev() {
                                let identity = pkg
                                    .internal_symbols
                                    .get(sym_name)
                                    .cloned()
                                    .or_else(|| pkg.external_symbols.get(sym_name).cloned())
                                    .unwrap_or_else(|| sym_name.clone());
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(EvalResult::Symbol(
                                        identity,
                                    ))),
                                    std::rc::Rc::new(std::cell::RefCell::new(result)),
                                );
                            }
                            Ok(result)
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                None => Ok(EvalResult::Nil),
            }
        }

        "symbol-package" => super::eval_symbol::call_symbol_builtin("symbol-package", args, env),

        "package-use-list" => {
            // Return list of packages used by this package
            let pkg_name = match args.get(0) {
                Some(arg) => designator_to_package_name(arg)?,
                None => return Ok(EvalResult::Nil),
            };
            PACKAGES.with(|p| {
                let packages = p.borrow();
                if let Some(pkg) = packages.get(&pkg_name) {
                    Ok(vec_to_list(
                        pkg.get_use_list()
                            .iter()
                            .map(|used_name| EvalResult::Package(used_name.clone()))
                            .collect(),
                    ))
                } else {
                    Ok(EvalResult::Nil)
                }
            })
        }

        "package-used-by-list" => {
            // Return list of packages that use this package
            let target_pkg_name = match args.get(0) {
                Some(arg) => designator_to_package_name(arg)?,
                None => return Ok(EvalResult::Nil),
            };
            PACKAGES.with(|p| {
                let packages = p.borrow();
                let mut users: Vec<EvalResult> = Vec::new();
                // Find all canonical packages that have target_pkg_name in their use-list
                for pkg in packages.values() {
                    if pkg.get_use_list().iter().any(|u| u == &target_pkg_name) {
                        let canonical = pkg.get_name().to_string();
                        if !users
                            .iter()
                            .any(|v| matches!(v, EvalResult::Package(n) if n == &canonical))
                        {
                            users.push(EvalResult::Package(canonical));
                        }
                    }
                }
                Ok(vec_to_list(users))
            })
        }

        "shadow" => {
            // (shadow symbol-names &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get symbol name(s)
            let symbols = match &args[0] {
                EvalResult::Symbol(s) => vec![s.clone()],
                EvalResult::String(s) => vec![s.clone()],
                EvalResult::Cons(_, _) => {
                    let mut syms = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        if let EvalResult::Symbol(s) | EvalResult::String(s) = &*car.borrow() {
                            syms.push(s.clone());
                        }
                        current = cdr.borrow().clone();
                    }
                    syms
                }
                EvalResult::Nil => return Ok(EvalResult::Boolean(true)),
                _ => return Ok(EvalResult::Boolean(true)),
            };

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };
            ensure_package_unlocked(&pkg_name, env)?;

            // Add shadowing symbols
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&pkg_name) {
                    for sym in &symbols {
                        let sym_name = if sym.starts_with(':') {
                            sym[1..].to_uppercase()
                        } else {
                            sym.to_uppercase()
                        };
                        pkg.shadow(&sym_name);
                    }
                }
            });

            Ok(EvalResult::Boolean(true))
        }

        "shadowing-import" => {
            // (shadowing-import symbols &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get symbol name(s)
            let symbols = match &args[0] {
                EvalResult::Symbol(s) => vec![s.clone()],
                EvalResult::String(s) => vec![s.clone()],
                EvalResult::Cons(_, _) => {
                    let mut syms = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        if let EvalResult::Symbol(s) | EvalResult::String(s) = &*car.borrow() {
                            syms.push(s.clone());
                        }
                        current = cdr.borrow().clone();
                    }
                    syms
                }
                EvalResult::Nil => return Ok(EvalResult::Boolean(true)),
                _ => return Ok(EvalResult::Boolean(true)),
            };

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Nil => get_current_package(),
                    other => designator_to_package_name(other)?,
                }
            } else {
                get_current_package()
            };
            ensure_package_unlocked(&pkg_name, env)?;

            // Add symbols with shadowing
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&pkg_name) {
                    for sym in &symbols {
                        let sym_name = if sym.starts_with(':') {
                            sym[1..].to_uppercase()
                        } else {
                            sym.to_uppercase()
                        };
                        pkg.shadowing_import(&sym_name);
                    }
                }
            });

            Ok(EvalResult::Boolean(true))
        }

        "package-symbols" | "package-present-symbols" => {
            // Return all symbols directly in a package (internal + external)
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&pkg_name) {
                            let mut result = EvalResult::Nil;
                            // Add internal symbols
                            for sym_name in pkg.internal_symbols.values() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(EvalResult::Symbol(
                                        sym_name.clone(),
                                    ))),
                                    std::rc::Rc::new(std::cell::RefCell::new(result)),
                                );
                            }
                            // Add external symbols
                            for sym_name in pkg.external_symbols.values() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(EvalResult::Symbol(
                                        sym_name.clone(),
                                    ))),
                                    std::rc::Rc::new(std::cell::RefCell::new(result)),
                                );
                            }
                            Ok(result)
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                _ => Ok(EvalResult::Nil),
            }
        }

        "package-external-symbols" => {
            // Return only external symbols of a package
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&pkg_name) {
                            let mut result = EvalResult::Nil;
                            for sym_name in pkg.external_symbols.values() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(EvalResult::Symbol(
                                        sym_name.clone(),
                                    ))),
                                    std::rc::Rc::new(std::cell::RefCell::new(result)),
                                );
                            }
                            Ok(result)
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                _ => Ok(EvalResult::Nil),
            }
        }

        _ => Err(format!("Unknown package builtin: {}", name)),
    };
    if result.is_ok()
        && matches!(
            name_lower,
            "make-package"
                | "package-add-nickname"
                | "package-remove-nickname"
                | "lock-package"
                | "unlock-package"
                | "export"
                | "unexport"
                | "import"
                | "use-package"
                | "unuse-package"
                | "rename-package"
                | "unintern"
                | "intern"
                | "delete-package"
                | "shadow"
                | "shadowing-import"
                | "in-package"
        )
    {
        sync_jit_package_registry_from_eval();
    }
    if debug_pkg_ops {
        match &result {
            Ok(v) => eprintln!("[pkg-op] ok {} => {:?}", name_lower, v),
            Err(e) => eprintln!("[pkg-op] err {} => {}", name_lower, e),
        }
    }
    result
}
