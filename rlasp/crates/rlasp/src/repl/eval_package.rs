/// eval_package.rs - Common Lisp package system operations
use super::eval_types::EvalResult;
use std::collections::HashMap;

// Simple package registry (in real CL, this would be more sophisticated)
thread_local! {
    static PACKAGES: std::cell::RefCell<HashMap<String, Package>> = {
        let mut map = HashMap::new();
        // Initialize default packages
        map.insert("COMMON-LISP".to_string(), Package::new("COMMON-LISP", vec!["CL"]));
        map.insert("CL".to_string(), Package::new("COMMON-LISP", vec!["CL"]));
        map.insert("KEYWORD".to_string(), Package::new("KEYWORD", vec![]));
        map.insert("COMMON-LISP-USER".to_string(), Package::new("COMMON-LISP-USER", vec!["CL-USER"]));
        map.insert("CL-USER".to_string(), Package::new("COMMON-LISP-USER", vec!["CL-USER"]));
        std::cell::RefCell::new(map)
    };
    static CURRENT_PACKAGE: std::cell::RefCell<String> =
        std::cell::RefCell::new("COMMON-LISP-USER".to_string());
}

#[derive(Debug, Clone)]
struct Package {
    name: String,
    nicknames: Vec<String>,
    external_symbols: HashMap<String, bool>,
    internal_symbols: HashMap<String, bool>,
}

impl Package {
    fn new(name: &str, nicknames: Vec<&str>) -> Self {
        Package {
            name: name.to_string(),
            nicknames: nicknames.iter().map(|s| s.to_string()).collect(),
            external_symbols: HashMap::new(),
            internal_symbols: HashMap::new(),
        }
    }
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
                    let found = PACKAGES.with(|p| {
                        p.borrow().contains_key(&name.to_uppercase())
                    });
                    if found {
                        // Return package name as symbol (simplified)
                        Ok(EvalResult::Symbol(name.to_uppercase()))
                    } else {
                        Ok(EvalResult::Nil)
                    }
                }
                _ => Err("find-package requires a string or symbol".to_string()),
            }
        }

        "package-name" => {
            // Return current package name
            let pkg_name = CURRENT_PACKAGE.with(|p| p.borrow().clone());
            Ok(EvalResult::String(pkg_name))
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
                    PACKAGES.with(|p| {
                        let mut packages = p.borrow_mut();
                        let pkg_name = name.to_uppercase();
                        packages.insert(pkg_name.clone(), Package::new(&pkg_name, vec![]));
                    });
                    Ok(EvalResult::Symbol(name.to_uppercase()))
                }
                _ => Err("make-package requires a package name".to_string()),
            }
        }

        "in-package" => {
            // (in-package package-name)
            match args.get(0) {
                Some(EvalResult::String(name)) | Some(EvalResult::Symbol(name)) => {
                    let pkg_name = name.to_uppercase();

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
            // For now, just return success
            Ok(EvalResult::Boolean(true))
        }

        "unexport" => {
            // (unexport symbols &optional package)
            // Mark symbols as internal
            Ok(EvalResult::Boolean(true))
        }

        "import" => {
            // (import symbols &optional package)
            Ok(EvalResult::Boolean(true))
        }

        "use-package" => {
            // (use-package packages-to-use &optional package)
            Ok(EvalResult::Boolean(true))
        }

        "unuse-package" => {
            // (unuse-package packages-to-unuse &optional package)
            Ok(EvalResult::Boolean(true))
        }

        "unintern" => {
            // (unintern symbol &optional package)
            Ok(EvalResult::Boolean(true))
        }

        "find-symbol" => {
            // (find-symbol string &optional package)
            // Return (symbol, status) where status is :internal, :external, :inherited, or nil
            match args.get(0) {
                Some(EvalResult::String(name)) => {
                    // Simplified: just return the symbol and :internal
                    Ok(EvalResult::Symbol(name.clone()))
                }
                _ => Err("find-symbol requires a string".to_string()),
            }
        }

        "intern" => {
            // (intern string &optional package)
            // Return (symbol, status)
            match args.get(0) {
                Some(EvalResult::String(name)) => {
                    Ok(EvalResult::Symbol(name.to_uppercase()))
                }
                _ => Err("intern requires a string".to_string()),
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

        "rename-package" => {
            // (rename-package package new-name &optional new-nicknames)
            Err("rename-package not implemented yet".to_string())
        }

        "package-shadowing-symbols" => {
            // Return list of shadowing symbols in package
            Ok(EvalResult::Nil)
        }

        "package-use-list" => {
            // Return list of packages used by this package
            // Simplified: just return nil for now
            Ok(EvalResult::Nil)
        }

        "package-used-by-list" => {
            // Return list of packages that use this package
            Ok(EvalResult::Nil)
        }

        "shadow" => {
            // (shadow symbol-names &optional package)
            Ok(EvalResult::Boolean(true))
        }

        "shadowing-import" => {
            // (shadowing-import symbols &optional package)
            Ok(EvalResult::Boolean(true))
        }

        _ => Err(format!("Unknown package builtin: {}", name)),
    }
}
