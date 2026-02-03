/// eval_package.rs - Common Lisp package system operations
use super::eval_types::EvalResult;
use std::collections::HashMap;

// Standard Common Lisp symbols that should be exported from the CL package
const CL_SYMBOLS: &[&str] = &[
    // Package functions
    "DEFPACKAGE", "IN-PACKAGE", "MAKE-PACKAGE", "DELETE-PACKAGE", "FIND-PACKAGE",
    "RENAME-PACKAGE", "PACKAGE-NAME", "PACKAGE-NICKNAMES", "PACKAGE-USE-LIST",
    "PACKAGE-USED-BY-LIST", "PACKAGE-SHADOWING-SYMBOLS", "USE-PACKAGE", "UNUSE-PACKAGE",
    "EXPORT", "UNEXPORT", "IMPORT", "SHADOWING-IMPORT", "SHADOW", "INTERN", "UNINTERN",
    "FIND-SYMBOL", "FIND-ALL-SYMBOLS", "DO-SYMBOLS", "DO-EXTERNAL-SYMBOLS", "DO-ALL-SYMBOLS",
    "PACKAGEP", "LIST-ALL-PACKAGES",
    // Type functions
    "TYPE-OF", "TYPEP", "SUBTYPEP", "COERCE", "DEFTYPE", "CHECK-TYPE", "THE",
    // Arithmetic
    "+", "-", "*", "/", "1+", "1-", "ABS", "MOD", "REM", "FLOOR", "CEILING", "TRUNCATE",
    "ROUND", "MAX", "MIN", "GCD", "LCM", "EXPT", "EXP", "LOG", "SQRT", "ISQRT",
    "SIN", "COS", "TAN", "ASIN", "ACOS", "ATAN", "SINH", "COSH", "TANH",
    "RANDOM", "RANDOM-STATE-P", "MAKE-RANDOM-STATE",
    // Comparison
    "=", "/=", "<", ">", "<=", ">=", "ZEROP", "PLUSP", "MINUSP", "EVENP", "ODDP",
    "EQ", "EQL", "EQUAL", "EQUALP",
    // Logic
    "NOT", "AND", "OR",
    // List functions
    "CAR", "CDR", "CAAR", "CADR", "CDAR", "CDDR", "FIRST", "REST", "SECOND", "THIRD",
    "CONS", "LIST", "LIST*", "APPEND", "NCONC", "REVERSE", "NREVERSE", "LENGTH",
    "NTH", "NTHCDR", "LAST", "BUTLAST", "NBUTLAST", "COPY-LIST", "COPY-TREE",
    "MEMBER", "ASSOC", "RASSOC", "ACONS", "PAIRLIS", "SUBST", "SUBLIS",
    "MAPCAR", "MAPLIST", "MAPC", "MAPL", "MAPCAN", "MAPCON",
    "PUSH", "POP", "PUSHNEW",
    // Sequence functions
    "ELT", "SUBSEQ", "COPY-SEQ", "FILL", "REPLACE", "COUNT", "COUNT-IF", "COUNT-IF-NOT",
    "FIND", "FIND-IF", "FIND-IF-NOT", "POSITION", "POSITION-IF", "POSITION-IF-NOT",
    "SEARCH", "MISMATCH", "REMOVE", "REMOVE-IF", "REMOVE-IF-NOT", "DELETE", "DELETE-IF",
    "REMOVE-DUPLICATES", "DELETE-DUPLICATES", "SUBSTITUTE", "NSUBSTITUTE",
    "CONCATENATE", "MERGE", "SORT", "STABLE-SORT", "MAP", "REDUCE", "EVERY", "SOME",
    "NOTEVERY", "NOTANY",
    // String functions
    "STRING", "STRING=", "STRING/=", "STRING<", "STRING>", "STRING<=", "STRING>=",
    "STRING-EQUAL", "STRING-NOT-EQUAL", "STRING-LESSP", "STRING-GREATERP",
    "STRING-UPCASE", "STRING-DOWNCASE", "STRING-CAPITALIZE", "NSTRING-UPCASE",
    "STRING-TRIM", "STRING-LEFT-TRIM", "STRING-RIGHT-TRIM", "CHAR", "SCHAR",
    // Character functions
    "CHAR=", "CHAR/=", "CHAR<", "CHAR>", "CHAR<=", "CHAR>=",
    "CHAR-CODE", "CODE-CHAR", "CHAR-NAME", "NAME-CHAR", "CHARACTER",
    "ALPHA-CHAR-P", "DIGIT-CHAR-P", "ALPHANUMERICP", "UPPER-CASE-P", "LOWER-CASE-P",
    "CHAR-UPCASE", "CHAR-DOWNCASE", "DIGIT-CHAR",
    // Array/Vector functions
    "MAKE-ARRAY", "AREF", "ARRAY-RANK", "ARRAY-DIMENSION", "ARRAY-DIMENSIONS",
    "ARRAY-TOTAL-SIZE", "ARRAY-ELEMENT-TYPE", "ADJUSTABLE-ARRAY-P",
    "VECTOR", "SVREF", "VECTOR-PUSH", "VECTOR-PUSH-EXTEND", "VECTOR-POP",
    // Hash table functions
    "MAKE-HASH-TABLE", "GETHASH", "REMHASH", "MAPHASH", "CLRHASH",
    "HASH-TABLE-COUNT", "HASH-TABLE-P",
    // Control flow
    "IF", "WHEN", "UNLESS", "COND", "CASE", "ECASE", "TYPECASE", "ETYPECASE",
    "PROGN", "PROG1", "PROG2", "BLOCK", "RETURN", "RETURN-FROM", "TAGBODY", "GO",
    "CATCH", "THROW", "UNWIND-PROTECT", "LET", "LET*", "FLET", "LABELS", "MACROLET",
    "PROGV", "MULTIPLE-VALUE-BIND", "MULTIPLE-VALUE-CALL", "MULTIPLE-VALUE-LIST",
    "MULTIPLE-VALUE-PROG1", "MULTIPLE-VALUE-SETQ", "VALUES", "VALUES-LIST",
    "LOOP", "DO", "DO*", "DOLIST", "DOTIMES",
    // Function definition
    "DEFUN", "DEFMACRO", "DEFGENERIC", "DEFMETHOD", "DEFCLASS", "DEFSTRUCT",
    "LAMBDA", "FUNCTION", "FUNCALL", "APPLY", "COMPLEMENT", "CONSTANTLY", "IDENTITY",
    // Variable definition
    "DEFVAR", "DEFPARAMETER", "DEFCONSTANT", "SETQ", "SETF", "PSETQ", "PSETF",
    "INCF", "DECF", "ROTATEF", "SHIFTF",
    // Evaluation
    "EVAL", "EVAL-WHEN", "LOAD", "COMPILE", "COMPILE-FILE",
    // Predicates
    "NULL", "ATOM", "LISTP", "CONSP", "SYMBOLP", "NUMBERP", "INTEGERP", "FLOATP",
    "RATIONALP", "REALP", "COMPLEXP", "CHARACTERP", "STRINGP", "ARRAYP", "VECTORP",
    "FUNCTIONP", "COMPILED-FUNCTION-P", "BOUNDP", "FBOUNDP", "CONSTANTP",
    // Symbol functions
    "SYMBOL-NAME", "SYMBOL-VALUE", "SYMBOL-FUNCTION", "SYMBOL-PLIST", "SYMBOL-PACKAGE",
    "MAKE-SYMBOL", "GENSYM", "GENTEMP", "GET", "GETF", "REMPROP", "REMF",
    // I/O
    "READ", "READ-LINE", "READ-CHAR", "UNREAD-CHAR", "PEEK-CHAR", "READ-FROM-STRING",
    "PRINT", "PRIN1", "PRINC", "WRITE", "WRITE-LINE", "WRITE-CHAR", "WRITE-STRING",
    "TERPRI", "FRESH-LINE", "FORMAT", "PPRINT",
    "OPEN", "CLOSE", "WITH-OPEN-FILE", "WITH-INPUT-FROM-STRING", "WITH-OUTPUT-TO-STRING",
    // Conditions
    "ERROR", "CERROR", "WARN", "SIGNAL", "HANDLER-BIND", "HANDLER-CASE",
    "RESTART-CASE", "RESTART-BIND", "INVOKE-RESTART", "FIND-RESTART", "COMPUTE-RESTARTS",
    "DEFINE-CONDITION", "MAKE-CONDITION", "CONDITION",
    "ASSERT", "CHECK-TYPE", "IGNORE-ERRORS",
    // CLOS
    "DEFCLASS", "DEFGENERIC", "DEFMETHOD", "MAKE-INSTANCE", "INITIALIZE-INSTANCE",
    "SLOT-VALUE", "SLOT-BOUNDP", "SLOT-MAKUNBOUND", "WITH-SLOTS", "WITH-ACCESSORS",
    "CLASS-OF", "CLASS-NAME", "FIND-CLASS", "CHANGE-CLASS",
    // Misc
    "DECLARE", "DECLAIM", "PROCLAIM", "SPECIAL", "TYPE", "FTYPE", "INLINE", "NOTINLINE",
    "OPTIMIZE", "DYNAMIC-EXTENT", "IGNORABLE", "IGNORE",
    "DOCUMENTATION", "DESCRIBE", "INSPECT", "ROOM", "TRACE", "UNTRACE", "STEP",
    "TIME", "GET-INTERNAL-REAL-TIME", "GET-INTERNAL-RUN-TIME", "SLEEP",
    "REQUIRE", "PROVIDE", "FEATURES",
    // Constants
    "T", "NIL", "PI", "MOST-POSITIVE-FIXNUM", "MOST-NEGATIVE-FIXNUM",
];

// Simple package registry (in real CL, this would be more sophisticated)
thread_local! {
    pub static PACKAGES: std::cell::RefCell<HashMap<String, Package>> = {
        let mut map = HashMap::new();
        // Initialize COMMON-LISP package with all standard symbols
        let mut cl_pkg = Package::new("COMMON-LISP", vec!["CL"]);
        for sym in CL_SYMBOLS {
            cl_pkg.add_external_symbol(sym);
        }
        map.insert("COMMON-LISP".to_string(), cl_pkg.clone());
        map.insert("CL".to_string(), cl_pkg);
        map.insert("KEYWORD".to_string(), Package::new("KEYWORD", vec![]));
        // CL-USER uses CL
        let mut cl_user = Package::new("COMMON-LISP-USER", vec!["CL-USER"]);
        cl_user.use_package("COMMON-LISP");
        map.insert("COMMON-LISP-USER".to_string(), cl_user.clone());
        map.insert("CL-USER".to_string(), cl_user);
        std::cell::RefCell::new(map)
    };
    pub static CURRENT_PACKAGE: std::cell::RefCell<String> =
        std::cell::RefCell::new("COMMON-LISP-USER".to_string());
}

#[derive(Debug, Clone)]
pub struct Package {
    name: String,
    nicknames: Vec<String>,
    external_symbols: HashMap<String, bool>,
    internal_symbols: HashMap<String, bool>,
    use_list: Vec<String>,  // Packages this package uses (inherits from)
    shadowing_symbols: Vec<String>,  // Symbols that shadow inherited symbols
}

impl Package {
    pub fn new(name: &str, nicknames: Vec<&str>) -> Self {
        Package {
            name: name.to_string(),
            nicknames: nicknames.iter().map(|s| s.to_string()).collect(),
            external_symbols: HashMap::new(),
            internal_symbols: HashMap::new(),
            use_list: Vec::new(),
            shadowing_symbols: Vec::new(),
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

    /// Get all symbols (internal + external)
    pub fn get_all_symbols(&self) -> Vec<String> {
        let mut symbols: Vec<String> = self.external_symbols.keys().cloned().collect();
        symbols.extend(self.internal_symbols.keys().cloned());
        symbols
    }

    /// Add an internal symbol
    pub fn add_internal_symbol(&mut self, name: &str) {
        self.internal_symbols.insert(name.to_string(), true);
    }

    /// Add an external symbol
    pub fn add_external_symbol(&mut self, name: &str) {
        self.external_symbols.insert(name.to_string(), true);
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
        if !self.external_symbols.contains_key(&name_upper) &&
           !self.internal_symbols.contains_key(&name_upper) {
            self.internal_symbols.insert(name_upper.clone(), true);
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
        self.internal_symbols.insert(name_upper.clone(), true);
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
        self.external_symbols.contains_key(&name_upper) ||
        self.internal_symbols.contains_key(&name_upper)
    }
}

/// Get the current package name
pub fn get_current_package() -> String {
    CURRENT_PACKAGE.with(|p| p.borrow().clone())
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
                if used_upper == "CL" || used_upper == "COMMON-LISP"
                   || used_upper == "UIOP/COMMON-LISP" || used_upper == "UIOP" {
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

pub fn call_package_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "packagep" => {
            // Check if object is a package
            // For simplicity, we don't have package objects, so always false
            Ok(EvalResult::Boolean(false))
        }

        "find-package" => {
            // (find-package name)
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    // Strip leading colon for keywords and # for uninterned symbols
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else if name.starts_with('#') {
                        // Uninterned symbol like #:uiop
                        name.trim_start_matches('#').trim_start_matches(':').to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    // Look up the package and return its canonical name
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        if let Some(pkg) = packages.get(&pkg_name) {
                            // Return the package's canonical name, not the lookup key (which could be a nickname)
                            Ok(EvalResult::Package(pkg.get_name().to_string()))
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                // Package object passed directly
                Some(EvalResult::Package(name)) => Ok(EvalResult::Package(name.clone())),
                // NIL means no package - return NIL
                Some(EvalResult::Nil) | None => Ok(EvalResult::Nil),
                _ => Err("find-package requires a string or symbol".to_string()),
            }
        }

        "package-name" => {
            // (package-name package) - return the name of the given package
            match args.get(0) {
                Some(EvalResult::Package(name)) => Ok(EvalResult::String(name.clone())),
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    // If given a string/symbol, look up the package first
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    let found = PACKAGES.with(|p| p.borrow().contains_key(&pkg_name));
                    if found {
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
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    PACKAGES.with(|p| {
                        if let Some(pkg) = p.borrow().get(&name.to_uppercase()) {
                            let mut result = EvalResult::Nil;
                            for nn in pkg.nicknames.iter().rev() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(
                                        EvalResult::String(nn.clone())
                                    )),
                                    std::rc::Rc::new(std::cell::RefCell::new(result))
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

        "list-all-packages" => {
            // Return list of all packages
            PACKAGES.with(|p| {
                let mut result = EvalResult::Nil;
                for name in p.borrow().keys() {
                    result = EvalResult::Cons(
                        std::rc::Rc::new(std::cell::RefCell::new(
                            EvalResult::Symbol(name.clone())
                        )),
                        std::rc::Rc::new(std::cell::RefCell::new(result))
                    );
                }
                Ok(result)
            })
        }

        "make-package" => {
            // (make-package package-name &key nicknames use)
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    // Strip leading colon for keywords
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    PACKAGES.with(|p| {
                        let mut packages = p.borrow_mut();
                        packages.insert(pkg_name.clone(), Package::new(&pkg_name, vec![]));
                    });
                    Ok(EvalResult::Symbol(pkg_name))
                }
                _ => Err("make-package requires a package name".to_string()),
            }
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
                            p.borrow_mut().insert(pkg_name.clone(), Package::new(&pkg_name, vec![]));
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
            // Mark symbols as external
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get symbol name(s)
            let symbols = match &args[0] {
                EvalResult::Symbol(s) => vec![s.clone()],
                EvalResult::String(s) => vec![s.clone()],
                EvalResult::Cons(_, _) => {
                    // List of symbols
                    let mut syms = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        if let EvalResult::Symbol(s) = &*car.borrow() {
                            syms.push(s.clone());
                        }
                        current = cdr.borrow().clone();
                    }
                    syms
                }
                _ => return Ok(EvalResult::Boolean(true)),
            };

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Symbol(name) => {
                        if name.starts_with(':') {
                            name[1..].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    }
                    EvalResult::String(name) => name.to_uppercase(),
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

            // Add symbols to package's external symbols
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&pkg_name) {
                    for sym in &symbols {
                        let sym_name = if sym.starts_with(':') {
                            sym[1..].to_uppercase()
                        } else {
                            sym.to_uppercase()
                        };
                        pkg.add_external_symbol(&sym_name);
                    }
                }
            });

            Ok(EvalResult::Boolean(true))
        }

        "unexport" => {
            // (unexport symbols &optional package)
            // Mark symbols as internal
            Ok(EvalResult::Boolean(true))
        }

        "import" => {
            // (import symbols &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get symbol name(s)
            let symbols = match &args[0] {
                EvalResult::Symbol(s) => vec![s.clone()],
                EvalResult::String(s) => vec![s.clone()],
                EvalResult::Cons(_, _) => {
                    // List of symbols
                    let mut syms = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        if let EvalResult::Symbol(s) = &*car.borrow() {
                            syms.push(s.clone());
                        } else if let EvalResult::String(s) = &*car.borrow() {
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
                    EvalResult::Symbol(name) => {
                        if name.starts_with(':') {
                            name[1..].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    }
                    EvalResult::String(name) => name.to_uppercase(),
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

            // Add symbols to package's internal symbols
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&pkg_name) {
                    for sym in &symbols {
                        let sym_name = if sym.starts_with(':') {
                            sym[1..].to_uppercase()
                        } else {
                            sym.to_uppercase()
                        };
                        pkg.add_internal_symbol(&sym_name);
                    }
                }
            });

            Ok(EvalResult::Boolean(true))
        }

        "use-package" => {
            // (use-package packages-to-use &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get list of packages to use
            let pkgs_to_use: Vec<String> = match &args[0] {
                EvalResult::Symbol(name) | EvalResult::String(name) => {
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    vec![pkg_name]
                }
                EvalResult::Cons(_, _) => {
                    let mut pkgs = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        if let EvalResult::Symbol(s) | EvalResult::String(s) = &*car.borrow() {
                            let pkg_name = if s.starts_with(':') {
                                s[1..].to_uppercase()
                            } else {
                                s.to_uppercase()
                            };
                            pkgs.push(pkg_name);
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
                    EvalResult::Package(name) => name.clone(),
                    EvalResult::Symbol(name) | EvalResult::String(name) => {
                        if name.starts_with(':') {
                            name[1..].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    }
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

            // Add each package to the target's use-list
            PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&target_pkg) {
                    for used_pkg in &pkgs_to_use {
                        pkg.use_package(used_pkg);
                    }
                }
            });

            Ok(EvalResult::Boolean(true))
        }

        "unuse-package" => {
            // (unuse-package packages-to-unuse &optional package)
            if args.is_empty() {
                return Ok(EvalResult::Boolean(true));
            }

            // Get list of packages to unuse
            let pkgs_to_unuse: Vec<String> = match &args[0] {
                EvalResult::Symbol(name) | EvalResult::String(name) => {
                    let pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    vec![pkg_name]
                }
                EvalResult::Cons(_, _) => {
                    let mut pkgs = Vec::new();
                    let mut current = args[0].clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        if let EvalResult::Symbol(s) | EvalResult::String(s) = &*car.borrow() {
                            let pkg_name = if s.starts_with(':') {
                                s[1..].to_uppercase()
                            } else {
                                s.to_uppercase()
                            };
                            pkgs.push(pkg_name);
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
                    EvalResult::Symbol(name) | EvalResult::String(name) => {
                        if name.starts_with(':') {
                            name[1..].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    }
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

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
                Some(EvalResult::Package(name)) => name.clone(),
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    }
                }
                _ => return Err("rename-package requires a package designator".to_string()),
            };

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
                if let Some(mut pkg) = packages.remove(&old_pkg_name) {
                    // Update package name and nicknames
                    pkg.name = new_name.clone();
                    pkg.nicknames = new_nicknames.clone();

                    // Remove old nickname entries
                    packages.retain(|k, _| k != &old_pkg_name);

                    // Insert with new name
                    packages.insert(new_name.clone(), pkg.clone());

                    // Add nickname entries
                    for nick in &new_nicknames {
                        packages.insert(nick.clone(), pkg.clone());
                    }
                }
            });

            Ok(EvalResult::Package(new_name))
        }

        "unintern" => {
            // (unintern symbol &optional package)
            if args.is_empty() {
                return Err("unintern requires a symbol".to_string());
            }

            // Get symbol name
            let sym_name = match &args[0] {
                EvalResult::Symbol(s) => {
                    if s.starts_with(':') {
                        s[1..].to_uppercase()
                    } else {
                        s.to_uppercase()
                    }
                }
                EvalResult::String(s) => s.to_uppercase(),
                _ => return Err("unintern requires a symbol".to_string()),
            };

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Symbol(name) => {
                        if name.starts_with(':') {
                            name[1..].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    }
                    EvalResult::String(name) => name.to_uppercase(),
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

            // Remove symbol from package
            let result = PACKAGES.with(|p| {
                let mut packages = p.borrow_mut();
                if let Some(pkg) = packages.get_mut(&pkg_name) {
                    pkg.unintern(&sym_name)
                } else {
                    false
                }
            });

            Ok(EvalResult::Boolean(result))
        }

        "find-symbol" => {
            // (find-symbol string &optional package)
            // Return symbol and status (:internal, :external, :inherited, or nil) as multiple values
            let name = match args.get(0) {
                Some(EvalResult::String(s)) => s.to_uppercase(),
                Some(EvalResult::Symbol(s)) => s.to_uppercase(),
                _ => return Err("find-symbol requires a string".to_string()),
            };

            // Get package name - resolve to canonical name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Package(n) => n.clone(),
                    EvalResult::Symbol(n) => {
                        let key = if n.starts_with(':') { n[1..].to_uppercase() } else { n.to_uppercase() };
                        // Resolve nickname to canonical name
                        PACKAGES.with(|p| {
                            p.borrow().get(&key).map(|pkg| pkg.get_name().to_string()).unwrap_or(key)
                        })
                    }
                    EvalResult::String(n) => {
                        let key = n.to_uppercase();
                        // Resolve nickname to canonical name
                        PACKAGES.with(|p| {
                            p.borrow().get(&key).map(|pkg| pkg.get_name().to_string()).unwrap_or(key)
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
                    if pkg.external_symbols.contains_key(&name) {
                        return Some((name.clone(), ":EXTERNAL"));
                    }
                    if pkg.internal_symbols.contains_key(&name) {
                        return Some((name.clone(), ":INTERNAL"));
                    }

                    // Check inherited symbols from used packages
                    for used_pkg_name in pkg.get_use_list() {
                        if let Some(used_pkg) = packages.get(used_pkg_name) {
                            if used_pkg.external_symbols.contains_key(&name) {
                                return Some((name.clone(), ":INHERITED"));
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
                        EvalResult::Symbol(status.to_string())
                    ]))
                }
                None => {
                    // Return (values nil nil) when symbol not found
                    Ok(EvalResult::MultipleValues(vec![
                        EvalResult::Nil,
                        EvalResult::Nil
                    ]))
                }
            }
        }

        "intern" => {
            // (intern string &optional package)
            // Returns symbol and status as multiple values
            let name = match args.get(0) {
                Some(EvalResult::String(s)) => s.to_uppercase(),
                Some(EvalResult::Symbol(s)) => {
                    // If it's a symbol, get its name
                    if s.starts_with(':') { s[1..].to_uppercase() } else { s.to_uppercase() }
                }
                Some(EvalResult::Nil) => "NIL".to_string(),
                _ => return Err("intern requires a string".to_string()),
            };

            // Get package name
            let pkg_name = if args.len() > 1 {
                match &args[1] {
                    EvalResult::Symbol(n) => {
                        if n.starts_with(':') { n[1..].to_uppercase() } else { n.to_uppercase() }
                    }
                    EvalResult::String(n) => n.to_uppercase(),
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

            // Check if symbol already exists, if not add as internal
            // First check if already exists (without mutable borrow)
            let existing_status = PACKAGES.with(|p| {
                let packages = p.borrow();
                if let Some(pkg) = packages.get(&pkg_name) {
                    if pkg.external_symbols.contains_key(&name) {
                        Some(":EXTERNAL")
                    } else if pkg.internal_symbols.contains_key(&name) {
                        Some(":INTERNAL")
                    } else {
                        // Check inherited from use-list
                        for used_pkg_name in pkg.get_use_list() {
                            if let Some(used_pkg) = packages.get(used_pkg_name) {
                                if used_pkg.external_symbols.contains_key(&name) {
                                    return Some(":INHERITED");
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
                Some(s) => (name.clone(), s),
                None => {
                    // Need to intern - use mutable borrow
                    PACKAGES.with(|p| {
                        let mut packages = p.borrow_mut();
                        if let Some(pkg) = packages.get_mut(&pkg_name) {
                            pkg.add_internal_symbol(&name);
                        }
                    });
                    (name.clone(), "NIL")
                }
            };

            // Return multiple values: symbol and status
            if status == "NIL" {
                Ok(EvalResult::MultipleValues(vec![
                    EvalResult::Symbol(symbol_name),
                    EvalResult::Nil
                ]))
            } else {
                Ok(EvalResult::MultipleValues(vec![
                    EvalResult::Symbol(symbol_name),
                    EvalResult::Symbol(status.to_string())
                ]))
            }
        }

        "delete-package" => {
            // (delete-package package)
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    PACKAGES.with(|p| {
                        p.borrow_mut().remove(&name.to_uppercase());
                    });
                    Ok(EvalResult::Boolean(true))
                }
                _ => Err("delete-package requires a package designator".to_string()),
            }
        }

        "package-shadowing-symbols" => {
            // Return list of shadowing symbols in package
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
                            for sym_name in pkg.get_shadowing_symbols().iter().rev() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(
                                        EvalResult::Symbol(sym_name.clone())
                                    )),
                                    std::rc::Rc::new(std::cell::RefCell::new(result))
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

        "package-use-list" => {
            // Return list of packages used by this package
            let pkg_name = match args.get(0) {
                Some(EvalResult::Package(name)) => name.clone(),
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    }
                }
                _ => return Ok(EvalResult::Nil),
            };
            PACKAGES.with(|p| {
                let packages = p.borrow();
                if let Some(pkg) = packages.get(&pkg_name) {
                    let mut result = EvalResult::Nil;
                    for used_name in pkg.get_use_list().iter().rev() {
                        result = EvalResult::Cons(
                            std::rc::Rc::new(std::cell::RefCell::new(
                                EvalResult::Symbol(used_name.clone())
                            )),
                            std::rc::Rc::new(std::cell::RefCell::new(result))
                        );
                    }
                    Ok(result)
                } else {
                    Ok(EvalResult::Nil)
                }
            })
        }

        "package-used-by-list" => {
            // Return list of packages that use this package
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    let target_pkg_name = if name.starts_with(':') {
                        name[1..].to_uppercase()
                    } else {
                        name.to_uppercase()
                    };
                    PACKAGES.with(|p| {
                        let packages = p.borrow();
                        let mut result = EvalResult::Nil;
                        // Find all packages that have target_pkg_name in their use-list
                        for (pkg_name, pkg) in packages.iter() {
                            if pkg.get_use_list().iter().any(|u| u == &target_pkg_name) {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(
                                        EvalResult::Symbol(pkg_name.clone())
                                    )),
                                    std::rc::Rc::new(std::cell::RefCell::new(result))
                                );
                            }
                        }
                        Ok(result)
                    })
                }
                _ => Ok(EvalResult::Nil),
            }
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
                    EvalResult::Symbol(name) | EvalResult::String(name) => {
                        if name.starts_with(':') {
                            name[1..].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    }
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

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
                    EvalResult::Symbol(name) | EvalResult::String(name) => {
                        if name.starts_with(':') {
                            name[1..].to_uppercase()
                        } else {
                            name.to_uppercase()
                        }
                    }
                    _ => get_current_package(),
                }
            } else {
                get_current_package()
            };

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
                            for sym_name in pkg.internal_symbols.keys() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(
                                        EvalResult::Symbol(sym_name.clone())
                                    )),
                                    std::rc::Rc::new(std::cell::RefCell::new(result))
                                );
                            }
                            // Add external symbols
                            for sym_name in pkg.external_symbols.keys() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(
                                        EvalResult::Symbol(sym_name.clone())
                                    )),
                                    std::rc::Rc::new(std::cell::RefCell::new(result))
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
                            for sym_name in pkg.external_symbols.keys() {
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(
                                        EvalResult::Symbol(sym_name.clone())
                                    )),
                                    std::rc::Rc::new(std::cell::RefCell::new(result))
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
    }
}
