/// eval_symbol.rs - Common Lisp symbol operations
use super::eval_types::EvalResult;
use std::cell::{Cell, RefCell};
use std::collections::HashMap;
use std::rc::Rc;

// Thread-local symbol property lists
thread_local! {
    static SYMBOL_PLISTS: RefCell<HashMap<String, Vec<(EvalResult, EvalResult)>>> =
        RefCell::new(HashMap::new());
    static UNINTERNED_SYMBOL_HOME: RefCell<HashMap<String, String>> =
        RefCell::new(HashMap::new());
}

// Thread-local storage for *features* and other global dynamic variables
thread_local! {
    static FEATURES: RefCell<EvalResult> = {
        // Initialize with default features as a proper list
        let mut list = EvalResult::Nil;
        // Include OS features that ASDF expects
        for feat in &["OS-MACOSX", "OS-UNIX", "UNICODE", "DARWIN", "UNIX", "IEEE-FLOATING-POINT",
                      "ANSI-CL", "COMMON-LISP", "RLASP", "CLASP"] {
            list = EvalResult::Cons(
                Rc::new(RefCell::new(EvalResult::Symbol(format!(":{}", feat)))),
                Rc::new(RefCell::new(list)),
            );
        }
        RefCell::new(list)
    };
    static GENTEMP_COUNTER: Cell<u64> = const { Cell::new(0) };
}

/// Get the current *features* value
pub fn get_features() -> EvalResult {
    FEATURES.with(|f| f.borrow().clone())
}

/// Set the *features* value
pub fn set_features(value: EvalResult) {
    FEATURES.with(|f| *f.borrow_mut() = value);
}

pub fn set_uninterned_symbol_home(symbol_name: &str, package_name: &str) {
    UNINTERNED_SYMBOL_HOME.with(|homes| {
        homes
            .borrow_mut()
            .insert(symbol_name.to_string(), package_name.to_uppercase());
    });
}

pub fn clear_uninterned_symbol_home(symbol_name: &str) {
    UNINTERNED_SYMBOL_HOME.with(|homes| {
        homes.borrow_mut().remove(symbol_name);
    });
}

fn normalize_qualified_symbol_identity_literal(raw_name: &str) -> String {
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

    let canonical_pkg = super::eval_package::PACKAGES.with(|p| {
        p.borrow()
            .get(&pkg_key)
            .map(|pkg| pkg.get_name().to_string())
            .unwrap_or(pkg_key)
    });
    let base = raw_base_name
        .rsplit(':')
        .next()
        .unwrap_or(raw_base_name)
        .trim_start_matches(':')
        .to_uppercase();
    if external_only {
        format!("{}:{}", canonical_pkg, base)
    } else {
        format!("{}::{}", canonical_pkg, base)
    }
}

pub fn call_symbol_builtin(
    name: &str,
    args: &[EvalResult],
    env: &HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    match name {
        "symbol-name" => {
            match args.get(0) {
                Some(EvalResult::Symbol(s)) => {
                    // Remove package prefix if present
                    let name = if let Some(pos) = s.rfind(':') {
                        &s[pos + 1..]
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
                EvalResult::Symbol(s) => super::eval_core::lookup_env_binding(s, env)
                    .or_else(|| super::eval_types::get_dynamic_var(s))
                    .or_else(|| super::eval_core::lookup_global_variable_binding(s))
                    .ok_or_else(|| format!("Unbound variable: {}", s)),
                _ => Err("symbol-value argument must be a symbol".to_string()),
            }
        }

        "symbol-function" => match args.get(0) {
            Some(EvalResult::Symbol(s)) => {
                let fn_key = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, s);
                let fn_base = s.rsplit(':').next().unwrap_or(s);
                let fn_base_key = format!("{}{}", super::eval_core::FUNCTION_NS_PREFIX, fn_base);
                let found = super::eval_core::lookup_env_binding(&fn_key, env)
                    .or_else(|| super::eval_core::lookup_env_binding(&fn_base_key, env))
                    .or_else(|| super::eval_core::lookup_global_function_binding(&fn_key))
                    .or_else(|| super::eval_core::lookup_global_function_binding(&fn_base_key))
                    .or_else(|| super::eval_core::lookup_global_function_binding(s))
                    .or_else(|| super::eval_core::lookup_env_binding(s, env));
                match found {
                    Some(val @ EvalResult::Lambda { .. })
                    | Some(val @ EvalResult::Macro { .. })
                    | Some(val @ EvalResult::BuiltinFunction(_))
                    | Some(val @ EvalResult::GenericFunction(_))
                    | Some(val @ EvalResult::ForeignFunction(_)) => Ok(val),
                    _ => Err(format!("Undefined function: {}", s)),
                }
            }
            _ => Err("symbol-function requires a symbol".to_string()),
        },

        "symbol-package" => match args.get(0) {
            Some(EvalResult::Symbol(s)) => {
                let raw = s.trim();
                if raw.eq_ignore_ascii_case("NIL") || raw.eq_ignore_ascii_case("T") {
                    return Ok(EvalResult::Package("COMMON-LISP".to_string()));
                }
                if raw.starts_with("#:") {
                    let home =
                        UNINTERNED_SYMBOL_HOME.with(|homes| homes.borrow().get(raw).cloned());
                    return Ok(home.map(EvalResult::Package).unwrap_or(EvalResult::Nil));
                }
                if raw.starts_with(':') {
                    return Ok(EvalResult::Package("KEYWORD".to_string()));
                }
                if let Some((pkg, _)) = raw.split_once("::").or_else(|| raw.split_once(':')) {
                    if !pkg.is_empty() {
                        let key = pkg.to_uppercase();
                        let base = raw.rsplit(':').next().unwrap_or(raw).to_uppercase();
                        let canonical_raw = normalize_qualified_symbol_identity_literal(raw);
                        let canonical = super::eval_package::PACKAGES.with(|p| {
                            let packages = p.borrow();
                            packages.get(&key).and_then(|pkg| {
                                let direct_match = pkg
                                    .get_all_symbol_identities()
                                    .into_iter()
                                    .filter(|sym| {
                                        sym.rsplit(':')
                                            .next()
                                            .map(|tail| tail.eq_ignore_ascii_case(&base))
                                            .unwrap_or(false)
                                    })
                                    .any(|sym| {
                                        normalize_qualified_symbol_identity_literal(&sym)
                                            .eq_ignore_ascii_case(&canonical_raw)
                                    });
                                if direct_match {
                                    Some(pkg.get_name().to_string())
                                } else {
                                    None
                                }
                            })
                        });
                        return Ok(canonical
                            .map(EvalResult::Package)
                            .unwrap_or(EvalResult::Nil));
                    }
                }

                let base = raw.rsplit(':').next().unwrap_or(raw).to_uppercase();
                let current = super::eval_package::get_current_package();
                let inferred = super::eval_package::PACKAGES.with(|p| {
                    let packages = p.borrow();
                    if let Some(pkg) = packages.get(&current) {
                        if pkg.has_symbol(&base) {
                            return Some(pkg.get_name().to_string());
                        }
                        for used in pkg.get_use_list() {
                            if let Some(used_pkg) = packages.get(used) {
                                if used_pkg
                                    .get_external_symbols()
                                    .iter()
                                    .any(|sym| sym.eq_ignore_ascii_case(&base))
                                {
                                    return Some(used_pkg.get_name().to_string());
                                }
                            }
                        }
                    }
                    let mut candidates: Vec<String> = packages
                        .values()
                        .filter(|pkg| pkg.has_symbol(&base))
                        .map(|pkg| pkg.get_name().to_string())
                        .collect();
                    candidates.sort_unstable();
                    candidates.dedup();
                    if candidates.len() == 1 {
                        Some(candidates.remove(0))
                    } else {
                        None
                    }
                });
                Ok(EvalResult::Package(inferred.unwrap_or(current)))
            }
            _ => Err("symbol-package requires a symbol".to_string()),
        },

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
                                    Rc::new(RefCell::new(result)),
                                );
                                result = EvalResult::Cons(
                                    Rc::new(RefCell::new(key.clone())),
                                    Rc::new(RefCell::new(result)),
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
                                            (EvalResult::Symbol(k), EvalResult::Symbol(i)) => {
                                                k == i
                                            }
                                            (EvalResult::Fixnum(k), EvalResult::Fixnum(i)) => {
                                                k == i
                                            }
                                            (EvalResult::String(k), EvalResult::String(i)) => {
                                                k == i
                                            }
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
                    // Create an uninterned symbol
                    Ok(EvalResult::Symbol(format!("#:{}", name)))
                }
                _ => Err("make-symbol requires a string".to_string()),
            }
        }

        "gentemp" => {
            let prefix = match args.get(0) {
                None => "T".to_string(),
                Some(EvalResult::String(s)) => s.clone(),
                Some(EvalResult::Symbol(s)) => s.rsplit(':').next().unwrap_or(s).to_string(),
                Some(EvalResult::Character(c)) => c.to_string(),
                Some(EvalResult::Nil) => return Err("TYPE-ERROR".to_string()),
                Some(_) => return Err("TYPE-ERROR".to_string()),
            };
            let package = if let Some(pkg) = args.get(1) {
                super::eval_package::designator_to_package_name(pkg)?
            } else {
                super::eval_package::get_current_package()
            };
            let mut signal_env = env.clone();
            loop {
                let suffix = GENTEMP_COUNTER.with(|counter| {
                    let next = counter.get().saturating_add(1);
                    counter.set(next);
                    next
                });
                let name = format!("{}{}", prefix, suffix);
                let found = super::eval_package::call_package_builtin(
                    "find-symbol",
                    &[
                        EvalResult::String(name.clone()),
                        EvalResult::Package(package.clone()),
                    ],
                    &mut signal_env,
                )?;
                if !matches!(found, EvalResult::MultipleValues(ref vals) if !vals.is_empty() && !matches!(vals[1], EvalResult::Nil))
                {
                    return super::eval_package::call_package_builtin(
                        "intern",
                        &[
                            EvalResult::String(name),
                            EvalResult::Package(package.clone()),
                        ],
                        &mut signal_env,
                    );
                }
            }
        }

        "makunbound" => match args.get(0) {
            Some(EvalResult::Symbol(_)) => Ok(args[0].clone()),
            _ => Err("TYPE-ERROR".to_string()),
        },

        "fmakunbound" => {
            if let Some(EvalResult::Symbol(name)) | Some(EvalResult::String(name)) = args.get(0) {
                let target_pkg = if let Some((pkg, _)) = name.split_once("::") {
                    pkg.to_string()
                } else if let Some((pkg, _)) = name.split_once(':') {
                    pkg.to_string()
                } else {
                    super::eval_package::get_current_package()
                };
                if super::eval_package::is_package_locked(&target_pkg) {
                    let mut signal_env = env.clone();
                    return super::eval_package::signal_package_lock_violation(
                        "Package is locked",
                        &mut signal_env,
                    );
                }
            }
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

pub fn set_symbol_plist(symbol: &str, plist: EvalResult) -> Result<EvalResult, String> {
    let mut pairs: Vec<(EvalResult, EvalResult)> = Vec::new();
    let mut current = plist;
    loop {
        match current {
            EvalResult::Nil => break,
            EvalResult::Cons(key_cell, rest_cell) => {
                let key = key_cell.borrow().clone();
                match rest_cell.borrow().clone() {
                    EvalResult::Cons(val_cell, next_cell) => {
                        let value = val_cell.borrow().clone();
                        pairs.push((key, value));
                        current = next_cell.borrow().clone();
                    }
                    _ => return Err("symbol-plist setter requires a proper plist".to_string()),
                }
            }
            _ => return Err("symbol-plist setter requires a proper plist".to_string()),
        }
    }

    SYMBOL_PLISTS.with(|plists| {
        plists.borrow_mut().insert(symbol.to_string(), pairs);
    });

    Ok(EvalResult::Symbol(symbol.to_string()))
}
