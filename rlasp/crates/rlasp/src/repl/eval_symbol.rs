/// eval_symbol.rs - Common Lisp symbol operations
use super::eval_types::EvalResult;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

// Thread-local symbol property lists
thread_local! {
    static SYMBOL_PLISTS: RefCell<HashMap<String, Vec<(EvalResult, EvalResult)>>> =
        RefCell::new(HashMap::new());
}

// Thread-local storage for *features* and other global dynamic variables
thread_local! {
    static FEATURES: RefCell<EvalResult> = {
        // Initialize with default features as a proper list
        let mut list = EvalResult::Nil;
        // Include OS features that ASDF expects
        // NOTE: We don't claim to be SBCL or CLASP to avoid triggering implementation-specific code
        // that we can't support. ASDF will use generic fallbacks.
        for feat in &["OS-MACOSX", "OS-UNIX", "UNICODE", "DARWIN", "UNIX", "IEEE-FLOATING-POINT",
                      "ANSI-CL", "COMMON-LISP", "RLASP"] {
            list = EvalResult::Cons(
                Rc::new(RefCell::new(EvalResult::Symbol(format!(":{}", feat)))),
                Rc::new(RefCell::new(list)),
            );
        }
        RefCell::new(list)
    };
}

/// Get the current *features* value
pub fn get_features() -> EvalResult {
    FEATURES.with(|f| f.borrow().clone())
}

/// Set the *features* value
pub fn set_features(value: EvalResult) {
    FEATURES.with(|f| *f.borrow_mut() = value);
}

pub fn call_symbol_builtin(name: &str, args: &[EvalResult], env: &HashMap<String, EvalResult>) -> Result<EvalResult, String> {
    match name {
        "symbol-name" => {
            match args.get(0) {
                Some(EvalResult::Symbol(s)) => {
                    // Remove package prefix if present
                    let name = if let Some(pos) = s.rfind(':') {
                        &s[pos+1..]
                    } else {
                        s.as_str()
                    };
                    Ok(EvalResult::String(name.to_string()))
                }
                _ => Err("symbol-name requires a symbol".to_string()),
            }
        }

        "symbol-value" => {
            // Extract first value if multiple values
            let arg = match args.get(0) {
                Some(EvalResult::MultipleValues(vals)) if !vals.is_empty() => &vals[0],
                Some(v) => v,
                None => return Err("symbol-value requires a symbol argument".to_string()),
            };
            match arg {
                EvalResult::Nil => {
                    // (symbol-value nil) returns nil
                    Ok(EvalResult::Nil)
                }
                EvalResult::Symbol(s) => {
                    env.get(s).cloned()
                        .ok_or_else(|| format!("Unbound variable: {}", s))
                }
                _ => Err("symbol-value argument must be a symbol".to_string()),
            }
        }

        "symbol-function" => {
            match args.get(0) {
                Some(EvalResult::Symbol(s)) => {
                    match env.get(s) {
                        Some(EvalResult::Lambda { .. }) | Some(EvalResult::Macro { .. }) => {
                            Ok(env.get(s).unwrap().clone())
                        }
                        _ => Err(format!("Undefined function: {}", s)),
                    }
                }
                _ => Err("symbol-function requires a symbol".to_string()),
            }
        }

        "symbol-package" => {
            match args.get(0) {
                Some(EvalResult::Symbol(s)) => {
                    // Extract package from symbol
                    if let Some(pos) = s.find(':') {
                        let pkg = &s[..pos];
                        Ok(EvalResult::Symbol(pkg.to_string()))
                    } else {
                        // Default package
                        Ok(EvalResult::Symbol("COMMON-LISP-USER".to_string()))
                    }
                }
                _ => Err("symbol-package requires a symbol".to_string()),
            }
        }

        "symbol-plist" => {
            match args.get(0) {
                Some(EvalResult::Symbol(s)) => {
                    SYMBOL_PLISTS.with(|plists| {
                        let plists = plists.borrow();
                        if let Some(plist) = plists.get(s) {
                            // Convert vec of pairs to CL plist
                            let mut result = EvalResult::Nil;
                            for (key, val) in plist.iter().rev() {
                                result = EvalResult::Cons(
                                    Rc::new(RefCell::new(val.clone())),
                                    Rc::new(RefCell::new(result))
                                );
                                result = EvalResult::Cons(
                                    Rc::new(RefCell::new(key.clone())),
                                    Rc::new(RefCell::new(result))
                                );
                            }
                            Ok(result)
                        } else {
                            Ok(EvalResult::Nil)
                        }
                    })
                }
                _ => Err("symbol-plist requires a symbol".to_string()),
            }
        }

        "get" => {
            // (get symbol indicator &optional default)
            match (args.get(0), args.get(1)) {
                (Some(EvalResult::Symbol(sym)), Some(indicator)) => {
                    SYMBOL_PLISTS.with(|plists| {
                        let plists = plists.borrow();
                        if let Some(plist) = plists.get(sym) {
                            for (key, val) in plist {
                                // Check if keys match (use equal comparison)
                                if match (key, indicator) {
                                    (EvalResult::Symbol(k), EvalResult::Symbol(i)) => k == i,
                                    (EvalResult::Fixnum(k), EvalResult::Fixnum(i)) => k == i,
                                    (EvalResult::String(k), EvalResult::String(i)) => k == i,
                                    _ => false,
                                } {
                                    return Ok(val.clone());
                                }
                            }
                        }
                        // Return default or nil
                        Ok(args.get(2).cloned().unwrap_or(EvalResult::Nil))
                    })
                }
                _ => Err("get requires a symbol and indicator".to_string()),
            }
        }

        "getf" => {
            // (getf plist indicator &optional default)
            match (args.get(0), args.get(1)) {
                (Some(plist), Some(indicator)) => {
                    let mut current = plist.clone();
                    loop {
                        match current {
                            EvalResult::Cons(key_cell, rest_cell) => {
                                let key = key_cell.borrow().clone();
                                let rest = rest_cell.borrow().clone();

                                match rest {
                                    EvalResult::Cons(val_cell, next_cell) => {
                                        // Check if key matches indicator
                                        let matches = match (&key, indicator) {
                                            (EvalResult::Symbol(k), EvalResult::Symbol(i)) => k == i,
                                            (EvalResult::Fixnum(k), EvalResult::Fixnum(i)) => k == i,
                                            (EvalResult::String(k), EvalResult::String(i)) => k == i,
                                            _ => false,
                                        };

                                        if matches {
                                            return Ok(val_cell.borrow().clone());
                                        }

                                        current = next_cell.borrow().clone();
                                    }
                                    _ => break,
                                }
                            }
                            EvalResult::Nil => break,
                            _ => return Err("getf requires a proper plist".to_string()),
                        }
                    }
                    Ok(args.get(2).cloned().unwrap_or(EvalResult::Nil))
                }
                _ => Err("getf requires a plist and indicator".to_string()),
            }
        }

        "set" => {
            // (set symbol value) - set symbol's value
            // Note: This is different from setq which doesn't evaluate the symbol
            Err("set not implemented yet - use setq or setf".to_string())
        }

        "copy-symbol" => {
            match (args.get(0), args.get(1)) {
                (Some(EvalResult::Symbol(s)), copy_props) => {
                    // For simplicity, just return a new symbol with the same name
                    // Full implementation would copy properties if copy_props is true
                    Ok(EvalResult::Symbol(s.clone()))
                }
                _ => Err("copy-symbol requires a symbol".to_string()),
            }
        }

        "make-symbol" => {
            match args.get(0) {
                Some(EvalResult::String(name)) => {
                    // Create an uninterned symbol (with # prefix)
                    Ok(EvalResult::Symbol(format!("#{}", name)))
                }
                _ => Err("make-symbol requires a string".to_string()),
            }
        }

        "gentemp" => {
            // Generate a temporary symbol (interned)
            static mut GENTEMP_COUNTER: i64 = 0;
            unsafe {
                GENTEMP_COUNTER += 1;
                let prefix = match args.get(0) {
                    Some(EvalResult::String(s)) => s.clone(),
                    _ => "T".to_string(),
                };
                Ok(EvalResult::Symbol(format!("{}{}", prefix, GENTEMP_COUNTER)))
            }
        }

        "makunbound" => {
            // (makunbound symbol) - make symbol unbound
            // This would require mutable env, so return stub
            Err("makunbound not implemented yet - requires mutable environment".to_string())
        }

        "fmakunbound" => {
            // (fmakunbound function-name) - make function undefined
            // For now, just return nil (stub)
            Ok(EvalResult::Nil)
        }

        "intern" => {
            // (intern string &optional package) - intern string as symbol
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::Symbol(s.clone())),
                Some(EvalResult::Symbol(s)) => Ok(EvalResult::Symbol(s.clone())),
                _ => Err("intern requires a string or symbol".to_string()),
            }
        }

        "package-names" => {
            // Return list of all package names - stub
            Ok(EvalResult::Nil)
        }

        _ => Err(format!("Unknown symbol builtin: {}", name)),
    }
}

// Helper to set symbol property (would be called by setf)
#[allow(dead_code)]
pub fn set_symbol_property(symbol: &str, indicator: EvalResult, value: EvalResult) {
    SYMBOL_PLISTS.with(|plists| {
        let mut plists = plists.borrow_mut();
        let plist = plists.entry(symbol.to_string()).or_insert_with(Vec::new);

        // Update existing or add new
        let mut found = false;
        for (key, val) in plist.iter_mut() {
            let matches = match (key, &indicator) {
                (EvalResult::Symbol(k), EvalResult::Symbol(i)) => k == i,
                (EvalResult::Fixnum(k), EvalResult::Fixnum(i)) => k == i,
                (EvalResult::String(k), EvalResult::String(i)) => k == i,
                _ => false,
            };
            if matches {
                *val = value.clone();
                found = true;
                break;
            }
        }

        if !found {
            plist.push((indicator, value));
        }
    });
}
