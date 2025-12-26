/// eval_clos.rs - Basic CLOS (Common Lisp Object System) support
use super::eval_types::EvalResult;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

pub fn call_clos_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "make-instance" => {
            // (make-instance class-name &rest initargs)
            // Create a hash table to represent the instance
            // Parse initargs which are keyword-value pairs like :x 10 :y 20
            let mut slots = HashMap::new();

            // Skip the class name (first arg) and process initargs
            let mut i = 1;
            while i < args.len() {
                if let EvalResult::Symbol(key) = &args[i] {
                    // Strip the leading colon if present (e.g., ":x" -> "x")
                    let slot_name = if key.starts_with(':') {
                        &key[1..]
                    } else {
                        key.as_str()
                    };

                    // Get the value (next argument)
                    if i + 1 < args.len() {
                        slots.insert(slot_name.to_string(), args[i + 1].clone());
                        i += 2;
                    } else {
                        i += 1;
                    }
                } else {
                    i += 1;
                }
            }

            // Return a hash table representing the instance
            Ok(EvalResult::HashTable(Rc::new(RefCell::new(slots))))
        }

        "class-name" => {
            // Return the name of a class
            Ok(EvalResult::Symbol("CLASS".to_string()))
        }

        "slot-value" => {
            // (slot-value object slot-name)
            if args.len() < 2 {
                return Err("slot-value requires 2 arguments (object slot-name)".to_string());
            }

            let object = &args[0];
            let slot_name = match &args[1] {
                EvalResult::Symbol(s) => {
                    // Strip leading colon if present
                    if s.starts_with(':') {
                        s[1..].to_string()
                    } else {
                        s.to_string()
                    }
                }
                EvalResult::String(s) => s.clone(),
                _ => return Err("slot-value: slot-name must be a symbol or string".to_string()),
            };

            match object {
                EvalResult::HashTable(ht) => {
                    let hash = ht.borrow();
                    hash.get(&slot_name)
                        .cloned()
                        .ok_or_else(|| format!("Slot {} is unbound", slot_name))
                }
                _ => Err("slot-value: object must be an instance (hash table)".to_string()),
            }
        }

        "slot-boundp" => {
            // (slot-boundp object slot-name)
            if args.len() < 2 {
                return Err("slot-boundp requires 2 arguments".to_string());
            }

            let object = &args[0];
            let slot_name = match &args[1] {
                EvalResult::Symbol(s) => {
                    if s.starts_with(':') {
                        s[1..].to_string()
                    } else {
                        s.to_string()
                    }
                }
                EvalResult::String(s) => s.clone(),
                _ => return Err("slot-boundp: slot-name must be a symbol or string".to_string()),
            };

            match object {
                EvalResult::HashTable(ht) => {
                    let hash = ht.borrow();
                    Ok(EvalResult::Boolean(hash.contains_key(&slot_name)))
                }
                _ => Ok(EvalResult::Boolean(false)),
            }
        }

        "slot-exists-p" => {
            // (slot-exists-p object slot-name)
            // For hash table instances, same as slot-boundp
            if args.len() < 2 {
                return Err("slot-exists-p requires 2 arguments".to_string());
            }

            let object = &args[0];
            let slot_name = match &args[1] {
                EvalResult::Symbol(s) => {
                    if s.starts_with(':') {
                        s[1..].to_string()
                    } else {
                        s.to_string()
                    }
                }
                EvalResult::String(s) => s.clone(),
                _ => return Err("slot-exists-p: slot-name must be a symbol or string".to_string()),
            };

            match object {
                EvalResult::HashTable(ht) => {
                    let hash = ht.borrow();
                    Ok(EvalResult::Boolean(hash.contains_key(&slot_name)))
                }
                _ => Ok(EvalResult::Boolean(false)),
            }
        }

        "slot-makunbound" => {
            // (slot-makunbound object slot-name)
            if args.len() < 2 {
                return Err("slot-makunbound requires 2 arguments".to_string());
            }

            let object = &args[0];
            let slot_name = match &args[1] {
                EvalResult::Symbol(s) => {
                    if s.starts_with(':') {
                        s[1..].to_string()
                    } else {
                        s.to_string()
                    }
                }
                EvalResult::String(s) => s.clone(),
                _ => return Err("slot-makunbound: slot-name must be a symbol or string".to_string()),
            };

            match object {
                EvalResult::HashTable(ht) => {
                    ht.borrow_mut().remove(&slot_name);
                    Ok(object.clone())
                }
                _ => Err("slot-makunbound: object must be an instance".to_string()),
            }
        }

        "standard-class" | "built-in-class" | "structure-class" => {
            // Class metaclasses
            Ok(EvalResult::Symbol("STANDARD-CLASS".to_string()))
        }

        "change-class" => {
            // Change the class of an instance
            Ok(EvalResult::Nil)
        }

        "allocate-instance" => {
            // Allocate an instance without initialization
            Ok(EvalResult::Symbol("INSTANCE".to_string()))
        }

        "initialize-instance" => {
            // Initialize an instance
            Ok(EvalResult::Nil)
        }

        "reinitialize-instance" => {
            // Reinitialize an instance
            Ok(EvalResult::Nil)
        }

        "shared-initialize" => {
            // Shared initialization protocol
            Ok(EvalResult::Nil)
        }

        "update-instance-for-different-class" => {
            // Update instance when class changes
            Ok(EvalResult::Nil)
        }

        "update-instance-for-redefined-class" => {
            // Update instance when class is redefined
            Ok(EvalResult::Nil)
        }

        "call-next-method" => {
            // call-next-method can only be called from within a method
            // For now, we don't have a proper method dispatch system with method combination
            // So we signal an error when called
            Err("call-next-method can only be called from within a method".to_string())
        }

        _ => Err(format!("Unknown CLOS builtin: {}", name)),
    }
}
