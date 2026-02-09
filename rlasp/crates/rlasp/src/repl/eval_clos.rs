/// eval_clos.rs - Basic CLOS (Common Lisp Object System) support
use super::eval_types::{EvalResult, Instance};
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

pub fn class_slots_key(class_name: &str) -> String {
    format!("*class-slots-{}*", class_name.to_uppercase())
}

pub fn class_initargs_key(class_name: &str) -> String {
    format!("*class-initargs-{}*", class_name.to_uppercase())
}

pub fn class_supers_key(class_name: &str) -> String {
    format!("*class-supers-{}*", class_name.to_uppercase())
}

fn normalize_slot_name(raw: &str) -> String {
    let base = raw.rsplit(':').next().unwrap_or(raw);
    let stripped = base.strip_prefix(':').unwrap_or(base);
    stripped.to_ascii_lowercase()
}

pub fn call_clos_builtin(
    name: &str,
    args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>
) -> Result<EvalResult, String> {
    match name {
        "make-instance" => {
            // (make-instance class-name &rest initargs)
            // Get class name from first argument
            let class_name = match args.get(0) {
                Some(EvalResult::Symbol(s)) => s.clone(),
                Some(EvalResult::String(s)) => s.clone(),
                _ => return Err("make-instance: first argument must be a class name".to_string()),
            };

            // Start with defaults from class metadata (including inherited slots).
            let mut slots = HashMap::new();
            let mut initarg_to_slot: HashMap<String, String> = HashMap::new();

            fn collect_class_lineage(
                class_name: &str,
                env: &HashMap<String, EvalResult>,
                lineage: &mut Vec<String>,
                visiting: &mut std::collections::HashSet<String>,
            ) {
                let key = class_name.to_uppercase();
                if !visiting.insert(key.clone()) {
                    return;
                }

                if let Some(EvalResult::Array(supers)) = env.get(&class_supers_key(class_name)) {
                    let supers_vec = supers.borrow().clone();
                    for sup in supers_vec {
                        if let EvalResult::Symbol(sup_name) = sup {
                            collect_class_lineage(&sup_name, env, lineage, visiting);
                        }
                    }
                }

                lineage.push(class_name.to_string());
            }

            let mut lineage = Vec::new();
            let mut visiting = std::collections::HashSet::new();
            collect_class_lineage(&class_name, env, &mut lineage, &mut visiting);

            for cls in &lineage {
                if let Some(EvalResult::HashTable(slot_defaults)) = env.get(&class_slots_key(cls)) {
                    for (slot_name, default_val) in slot_defaults.borrow().iter() {
                        if !matches!(default_val, EvalResult::Symbol(s) if s.eq_ignore_ascii_case(":unbound")) {
                            slots.insert(normalize_slot_name(slot_name), default_val.clone());
                        }
                    }
                }
                if let Some(EvalResult::HashTable(initargs_map)) = env.get(&class_initargs_key(cls)) {
                    for (initarg_name, slot_name_val) in initargs_map.borrow().iter() {
                        if let EvalResult::Symbol(slot_name) = slot_name_val {
                            initarg_to_slot.insert(
                                normalize_slot_name(initarg_name),
                                normalize_slot_name(slot_name),
                            );
                        }
                    }
                }
            }

            // Skip the class name (first arg) and process initargs
            let mut i = 1;
            while i < args.len() {
                if let EvalResult::Symbol(key) = &args[i] {
                    let initarg = normalize_slot_name(key);
                    let slot_name = initarg_to_slot
                        .get(&initarg)
                        .cloned()
                        .unwrap_or(initarg);

                    // Get the value (next argument)
                    if i + 1 < args.len() {
                        slots.insert(slot_name, args[i + 1].clone());
                        i += 2;
                    } else {
                        i += 1;
                    }
                } else {
                    i += 1;
                }
            }

            // Return a proper Instance with class metadata
            Ok(EvalResult::Instance(Instance {
                class_name,
                slots: Rc::new(RefCell::new(slots)),
            }))
        }

        "class-name" => {
            // Return the name of a class or instance
            match args.get(0) {
                Some(EvalResult::Instance(inst)) => Ok(EvalResult::Symbol(inst.class_name.clone())),
                Some(EvalResult::Symbol(s)) => Ok(EvalResult::Symbol(s.clone())),
                _ => Ok(EvalResult::Symbol("T".to_string())),
            }
        }

        "class-of" => {
            // Return the class of an object
            use super::eval_types::class_of;
            match args.get(0) {
                Some(val) => Ok(EvalResult::Symbol(class_of(val))),
                None => Err("class-of requires 1 argument".to_string()),
            }
        }

        "typep" => {
            // (typep object type) - check if object is of type
            use super::eval_types::class_of;
            use super::eval_types::is_subclass;
            if args.len() < 2 {
                return Err("typep requires 2 arguments".to_string());
            }
            let obj_class = class_of(&args[0]);
            let type_name = match &args[1] {
                EvalResult::Symbol(s) => s.rsplit(':').next().unwrap_or(s).to_uppercase(),
                EvalResult::String(s) => s.rsplit(':').next().unwrap_or(s).to_uppercase(),
                _ => return Err("typep: type must be a symbol".to_string()),
            };

            // Check if the object's class matches the type
            // T matches everything
            // In Common Lisp, NIL is both a symbol and a list
            let matches = type_name == "T"
                || obj_class.eq_ignore_ascii_case(&type_name)
                || is_subclass(&obj_class, &type_name)
                || (type_name == "NUMBER" && matches!(args[0], EvalResult::Fixnum(_) | EvalResult::Float(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_) | EvalResult::Complex(_, _)))
                || (type_name == "INTEGER" && matches!(args[0], EvalResult::Fixnum(_) | EvalResult::Bignum(_)))
                || (type_name == "REAL" && matches!(args[0], EvalResult::Fixnum(_) | EvalResult::Float(_) | EvalResult::Bignum(_) | EvalResult::Ratio(_)))
                || (type_name == "SEQUENCE" && matches!(args[0], EvalResult::Cons(_, _) | EvalResult::Array(_) | EvalResult::String(_) | EvalResult::Nil))
                || (type_name == "LIST" && matches!(args[0], EvalResult::Cons(_, _) | EvalResult::Nil))
                || (type_name == "SYMBOL" && matches!(args[0], EvalResult::Symbol(_) | EvalResult::Nil))  // NIL is a symbol in CL
                || (type_name == "ATOM" && !matches!(args[0], EvalResult::Cons(_, _)));

            Ok(EvalResult::Boolean(matches))
        }

        "subtypep" => {
            // (subtypep type1 type2) - check if type1 is a subtype of type2
            // Returns two values: (subtype-p valid-p)
            // For now, we implement a basic type hierarchy
            if args.len() < 2 {
                return Err("subtypep requires 2 arguments".to_string());
            }
            let type1 = match &args[0] {
                EvalResult::Symbol(s) => s.to_uppercase(),
                EvalResult::Nil => "NULL".to_string(),
                EvalResult::Cons(_, _) => {
                    // Compound type specifier like (CONS ...), (AND ...), (MEMBER ...) etc.
                    // Return (values NIL NIL) — unknown
                    return Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Nil]));
                }
                _ => return Err("subtypep: type must be a symbol".to_string()),
            };
            let type2 = match &args[1] {
                EvalResult::Symbol(s) => s.to_uppercase(),
                EvalResult::Nil => "NULL".to_string(),
                EvalResult::Cons(_, _) => {
                    // Compound type specifier — return (values NIL NIL) — unknown
                    return Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Nil]));
                }
                _ => return Err("subtypep: type must be a symbol".to_string()),
            };

            // Basic type hierarchy:
            // T is supertype of everything
            // NIL/NULL is subtype of everything
            // NUMBER > REAL > RATIONAL > INTEGER > FIXNUM/BIGNUM
            // NUMBER > REAL > FLOAT
            // NUMBER > COMPLEX
            // SEQUENCE > LIST, VECTOR, STRING
            // CHARACTER > BASE-CHAR, STANDARD-CHAR, EXTENDED-CHAR
            let is_subtype = if type1 == type2 {
                true
            } else if type2 == "T" {
                true  // Everything is subtype of T
            } else if type1 == "NIL" || type1 == "NULL" {
                true  // NIL is subtype of everything
            } else {
                match (type1.as_str(), type2.as_str()) {
                    // Number hierarchy
                    ("FIXNUM", "INTEGER") | ("FIXNUM", "RATIONAL") | ("FIXNUM", "REAL") | ("FIXNUM", "NUMBER") => true,
                    ("BIGNUM", "INTEGER") | ("BIGNUM", "RATIONAL") | ("BIGNUM", "REAL") | ("BIGNUM", "NUMBER") => true,
                    ("INTEGER", "RATIONAL") | ("INTEGER", "REAL") | ("INTEGER", "NUMBER") => true,
                    ("RATIO", "RATIONAL") | ("RATIO", "REAL") | ("RATIO", "NUMBER") => true,
                    ("RATIONAL", "REAL") | ("RATIONAL", "NUMBER") => true,
                    ("FLOAT", "REAL") | ("FLOAT", "NUMBER") => true,
                    ("SINGLE-FLOAT", "FLOAT") | ("SINGLE-FLOAT", "REAL") | ("SINGLE-FLOAT", "NUMBER") => true,
                    ("DOUBLE-FLOAT", "FLOAT") | ("DOUBLE-FLOAT", "REAL") | ("DOUBLE-FLOAT", "NUMBER") => true,
                    ("REAL", "NUMBER") => true,
                    ("COMPLEX", "NUMBER") => true,

                    // Character hierarchy
                    ("BASE-CHAR", "CHARACTER") => true,
                    ("STANDARD-CHAR", "CHARACTER") | ("STANDARD-CHAR", "BASE-CHAR") => true,
                    ("EXTENDED-CHAR", "CHARACTER") => true,

                    // Sequence hierarchy
                    ("LIST", "SEQUENCE") => true,
                    ("CONS", "LIST") | ("CONS", "SEQUENCE") => true,
                    ("NULL", "LIST") | ("NULL", "SEQUENCE") | ("NULL", "SYMBOL") => true,
                    ("VECTOR", "SEQUENCE") | ("VECTOR", "ARRAY") => true,
                    ("STRING", "VECTOR") | ("STRING", "SEQUENCE") | ("STRING", "ARRAY") => true,
                    ("SIMPLE-STRING", "STRING") | ("SIMPLE-STRING", "VECTOR") | ("SIMPLE-STRING", "SEQUENCE") => true,
                    ("SIMPLE-VECTOR", "VECTOR") | ("SIMPLE-VECTOR", "SEQUENCE") | ("SIMPLE-VECTOR", "ARRAY") => true,
                    ("BIT-VECTOR", "VECTOR") | ("BIT-VECTOR", "SEQUENCE") | ("BIT-VECTOR", "ARRAY") => true,

                    // Symbol hierarchy
                    ("KEYWORD", "SYMBOL") => true,

                    // Function hierarchy
                    ("COMPILED-FUNCTION", "FUNCTION") => true,
                    ("GENERIC-FUNCTION", "FUNCTION") => true,

                    // Other
                    ("SIMPLE-ARRAY", "ARRAY") => true,
                    ("PATHNAME", "T") => true,
                    ("LOGICAL-PATHNAME", "PATHNAME") => true,

                    _ => false,
                }
            };

            // Return (values subtype-p valid-p) per CL spec
            // valid-p is T when we are certain about the result
            Ok(EvalResult::MultipleValues(vec![
                EvalResult::Boolean(is_subtype),
                EvalResult::Boolean(true),  // We're certain for simple type names
            ]))
        }

        "slot-value" => {
            // (slot-value object slot-name)
            if args.len() < 2 {
                return Err("slot-value requires 2 arguments (object slot-name)".to_string());
            }

            let object = &args[0];
            let slot_name = match &args[1] {
                EvalResult::Symbol(s) => normalize_slot_name(s),
                EvalResult::String(s) => normalize_slot_name(s),
                _ => return Err("slot-value: slot-name must be a symbol or string".to_string()),
            };

            match object {
                EvalResult::Instance(inst) => {
                    let slots = inst.slots.borrow();
                    slots.get(&slot_name)
                        .cloned()
                        .ok_or_else(|| format!("Slot {} is unbound", slot_name))
                }
                EvalResult::HashTable(ht) => {
                    // Backward compatibility
                    let hash = ht.borrow();
                    hash.get(&slot_name)
                        .cloned()
                        .ok_or_else(|| format!("Slot {} is unbound", slot_name))
                }
                // Return NIL for NIL objects (allows graceful handling when object doesn't exist)
                EvalResult::Nil => Ok(EvalResult::Nil),
                _ => Err("slot-value: object must be an instance".to_string()),
            }
        }

        "set-slot-value" => {
            // (set-slot-value object slot-name new-value)
            if args.len() < 3 {
                return Err("set-slot-value requires 3 arguments".to_string());
            }

            let object = &args[0];
            let slot_name = match &args[1] {
                EvalResult::Symbol(s) => normalize_slot_name(s),
                EvalResult::String(s) => normalize_slot_name(s),
                _ => return Err("set-slot-value: slot-name must be a symbol or string".to_string()),
            };
            let new_value = args[2].clone();

            match object {
                EvalResult::Instance(inst) => {
                    inst.slots.borrow_mut().insert(slot_name, new_value.clone());
                    Ok(new_value)
                }
                EvalResult::HashTable(ht) => {
                    ht.borrow_mut().insert(slot_name, new_value.clone());
                    Ok(new_value)
                }
                _ => Err("set-slot-value: object must be an instance".to_string()),
            }
        }

        "slot-boundp" => {
            // (slot-boundp object slot-name)
            if args.len() < 2 {
                return Err("slot-boundp requires 2 arguments".to_string());
            }

            let object = &args[0];
            let slot_name = match &args[1] {
                EvalResult::Symbol(s) => normalize_slot_name(s),
                EvalResult::String(s) => normalize_slot_name(s),
                _ => return Err("slot-boundp: slot-name must be a symbol or string".to_string()),
            };

            match object {
                EvalResult::Instance(inst) => {
                    let slots = inst.slots.borrow();
                    Ok(EvalResult::Boolean(slots.contains_key(&slot_name)))
                }
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
                EvalResult::Symbol(s) => normalize_slot_name(s),
                EvalResult::String(s) => normalize_slot_name(s),
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
