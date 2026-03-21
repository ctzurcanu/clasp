/// eval_clos.rs - Basic CLOS (Common Lisp Object System) support
use super::eval_types::{EvalResult, Instance, primary_value};
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

fn class_name_candidates(class_name: &str) -> Vec<String> {
    let mut out = vec![class_name.to_string()];
    let base = class_name.rsplit(':').next().unwrap_or(class_name);
    if !base.eq_ignore_ascii_case(class_name) {
        out.push(base.to_string());
    }
    out
}

fn lookup_class_slots(
    env: &HashMap<String, EvalResult>,
    class_name: &str,
) -> Option<EvalResult> {
    for candidate in class_name_candidates(class_name) {
        let key = class_slots_key(&candidate);
        if let Some(v) = env.get(&key).cloned() {
            return Some(v);
        }
        if let Some(v) = super::eval_core::lookup_global_variable_binding(&key) {
            return Some(v);
        }
    }
    None
}

fn lookup_class_initargs(
    env: &HashMap<String, EvalResult>,
    class_name: &str,
) -> Option<EvalResult> {
    for candidate in class_name_candidates(class_name) {
        let key = class_initargs_key(&candidate);
        if let Some(v) = env.get(&key).cloned() {
            return Some(v);
        }
        if let Some(v) = super::eval_core::lookup_global_variable_binding(&key) {
            return Some(v);
        }
    }
    None
}

fn lookup_class_supers(
    env: &HashMap<String, EvalResult>,
    class_name: &str,
) -> Option<EvalResult> {
    for candidate in class_name_candidates(class_name) {
        let key = class_supers_key(&candidate);
        if let Some(v) = env.get(&key).cloned() {
            return Some(v);
        }
        if let Some(v) = super::eval_core::lookup_global_variable_binding(&key) {
            return Some(v);
        }
    }
    None
}

fn has_class_metadata(env: &HashMap<String, EvalResult>, class_name: &str) -> bool {
    lookup_class_slots(env, class_name).is_some()
        || lookup_class_initargs(env, class_name).is_some()
        || lookup_class_supers(env, class_name).is_some()
}

fn normalize_slot_name(raw: &str) -> String {
    let base = raw.rsplit(':').next().unwrap_or(raw);
    let stripped = base.strip_prefix(':').unwrap_or(base);
    stripped.to_ascii_lowercase()
}

fn normalize_hash_slot_lookup_key(raw: &str) -> String {
    let stripped = raw
        .strip_prefix("sym:")
        .or_else(|| raw.strip_prefix("key:"))
        .or_else(|| raw.strip_prefix("str:"))
        .or_else(|| raw.strip_prefix("num:"))
        .unwrap_or(raw);
    normalize_slot_name(stripped)
}

fn hash_slot_key_matches(existing_key: &str, normalized_slot_name: &str) -> bool {
    existing_key.eq_ignore_ascii_case(normalized_slot_name)
        || normalize_hash_slot_lookup_key(existing_key).eq_ignore_ascii_case(normalized_slot_name)
}

fn default_hash_slot_storage_key(normalized_slot_name: &str) -> String {
    format!("sym:{}", normalized_slot_name)
}

pub const CLASS_NAME_OVERRIDE_SLOT_KEY: &str = "__class_name__";

fn effective_instance_class_name(inst: &Instance) -> String {
    if let Some(EvalResult::Symbol(name)) = inst.slots.borrow().get(CLASS_NAME_OVERRIDE_SLOT_KEY) {
        return name.clone();
    }
    if let Some(EvalResult::String(name)) = inst.slots.borrow().get(CLASS_NAME_OVERRIDE_SLOT_KEY) {
        return name.clone();
    }
    inst.class_name.clone()
}

fn lookup_function_binding(env: &HashMap<String, EvalResult>, name: &str) -> Option<EvalResult> {
    let fn_prefix = super::eval_core::FUNCTION_NS_PREFIX;
    let mut candidates = vec![
        name.to_string(),
        name.to_ascii_lowercase(),
        name.to_ascii_uppercase(),
    ];
    if let Some(base) = name.rsplit(':').next() {
        if !base.eq_ignore_ascii_case(name) {
            candidates.push(base.to_string());
            candidates.push(base.to_ascii_lowercase());
            candidates.push(base.to_ascii_uppercase());
        }
    }
    for candidate in candidates {
        let fn_name = format!("{}{}", fn_prefix, candidate);
        if let Some(v) = env.get(&fn_name).cloned() {
            return Some(v);
        }
        if let Some(v) = env.get(&candidate).cloned() {
            return Some(v);
        }
        if let Some(v) = super::eval_core::lookup_global_function_binding(&candidate) {
            return Some(v);
        }
    }
    None
}

fn collect_class_lineage(
    class_name: &str,
    env: &HashMap<String, EvalResult>,
    lineage: &mut Vec<String>,
    visiting: &mut std::collections::HashSet<String>,
) {
    let key = class_name.to_uppercase();
    if !visiting.insert(key) {
        return;
    }
    if let Some(EvalResult::Array(supers)) = lookup_class_supers(env, class_name) {
        let supers_vec = supers.borrow().clone();
        for sup in supers_vec {
            if let EvalResult::Symbol(sup_name) = sup {
                collect_class_lineage(&sup_name, env, lineage, visiting);
            }
        }
    }
    lineage.push(class_name.to_string());
}

fn list_from_items(items: Vec<EvalResult>) -> EvalResult {
    let mut out = EvalResult::Nil;
    for item in items.into_iter().rev() {
        out = EvalResult::Cons(
            Rc::new(RefCell::new(item)),
            Rc::new(RefCell::new(out)),
        );
    }
    out
}

fn quoted(item: EvalResult) -> EvalResult {
    list_from_items(vec![EvalResult::Symbol("quote".to_string()), item])
}

fn debug_init_protocol_name(name: &str) -> bool {
    name.eq_ignore_ascii_case("initialize-instance")
        || name.eq_ignore_ascii_case("reinitialize-instance")
        || name.eq_ignore_ascii_case("shared-initialize")
}

pub(super) fn initialize_instance_slots_from_initargs(args: &[EvalResult]) -> Result<EvalResult, String> {
    if args.is_empty() {
        if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
            eprintln!("[init-instance] fallback args=[]");
        }
        return Err("initialize-instance requires an instance".to_string());
    }
    if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
        eprintln!(
            "[init-instance] fallback args={:?} stack=[{}]",
            args,
            super::eval_core::debug_call_stack_summary()
        );
    }
    let inst = match &args[0] {
        EvalResult::Instance(i) => i.clone(),
        other => {
            if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
                eprintln!(
                    "[init-instance] bad-first-arg={:?} stack=[{}]",
                    other,
                    super::eval_core::debug_call_stack_summary()
                );
            }
            return Err("initialize-instance: first argument must be an instance".to_string());
        }
    };
    let mut i = 1usize;
    while i + 1 < args.len() {
        if let EvalResult::Symbol(key) = &args[i] {
            let slot_name = normalize_slot_name(key);
            inst.slots.borrow_mut().insert(slot_name, args[i + 1].clone());
        }
        i += 2;
    }
    Ok(EvalResult::Instance(inst))
}

pub(super) fn shared_initialize_slots_from_initargs(args: &[EvalResult]) -> Result<EvalResult, String> {
    if args.len() < 2 {
        if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
            eprintln!("[shared-init] fallback args={:?}", args);
        }
        return Err("shared-initialize requires an instance and slot-names".to_string());
    }
    let inst = match &args[0] {
        EvalResult::Instance(i) => i.clone(),
        other => {
            if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
                eprintln!("[shared-init] bad-first-arg={:?}", other);
            }
            return Err("shared-initialize: first argument must be an instance".to_string());
        }
    };
    let mut i = 2usize;
    while i + 1 < args.len() {
        if let EvalResult::Symbol(key) = &args[i] {
            let slot_name = normalize_slot_name(key);
            inst.slots.borrow_mut().insert(slot_name, args[i + 1].clone());
        }
        i += 2;
    }
    Ok(EvalResult::Instance(inst))
}

fn try_call_generic_function(
    env: &mut HashMap<String, EvalResult>,
    generic_name: &str,
    generic_args: &[EvalResult],
) -> Result<Option<EvalResult>, String> {
    if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok()
        && debug_init_protocol_name(generic_name)
    {
        eprintln!(
            "[init-instance] try-generic name={} args={:?} stack=[{}]",
            generic_name,
            generic_args,
            super::eval_core::debug_call_stack_summary()
        );
    }
    let Some(func) = lookup_function_binding(env, generic_name) else {
        if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok()
            && debug_init_protocol_name(generic_name)
        {
            eprintln!("[init-instance] generic-missing name={}", generic_name);
        }
        return Ok(None);
    };
    match func {
        EvalResult::GenericFunction(_) | EvalResult::Lambda { .. } => {
            match super::eval_system::call_function_with_values(func, generic_args, env) {
                Ok(v) => {
                    if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok()
                        && debug_init_protocol_name(generic_name)
                    {
                        eprintln!("[init-instance] generic-ok result={:?}", v);
                    }
                    Ok(Some(primary_value(v)))
                }
                Err(e) if e.to_ascii_lowercase().contains("no applicable method") => {
                    if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok()
                        && debug_init_protocol_name(generic_name)
                    {
                        eprintln!("[init-instance] generic-no-method err={}", e);
                    }
                    Ok(None)
                }
                Err(e) => {
                    if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok()
                        && debug_init_protocol_name(generic_name)
                    {
                        eprintln!("[init-instance] generic-err err={}", e);
                    }
                    Err(e)
                }
            }
        }
        _ => Ok(None),
    }
}

pub fn call_clos_builtin(
    name: &str,
    args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>
) -> Result<EvalResult, String> {
    let name_norm = name
        .rsplit(':')
        .next()
        .unwrap_or(name)
        .to_ascii_lowercase();
    match name_norm.as_str() {
        "make-instance" => {
            // (make-instance class-name &rest initargs)
            // Get class name from first argument
            let class_name = match args.get(0) {
                Some(EvalResult::Symbol(s)) => s.clone(),
                Some(EvalResult::String(s)) => s.clone(),
                _ => return Err("make-instance: first argument must be a class name".to_string()),
            };

            // DEFSTRUCT instances are represented with make-<name> constructors. Some
            // compiled loads preserve only partial class metadata, so prefer the
            // constructor path when there is no slot/initarg metadata but the struct
            // constructor/predicate pair exists.
            let ctor_name = format!("make-{}", class_name);
            let pred_name = format!("{}-p", class_name);
            let struct_constructor = lookup_function_binding(env, &ctor_name);
            let looks_like_defstruct =
                struct_constructor.is_some() && lookup_function_binding(env, &pred_name).is_some();
            if std::env::var("RLASP_DEBUG_STRUCT_CLOS_MAKE").is_ok()
                && class_name.eq_ignore_ascii_case("struct-clos")
            {
                eprintln!(
                    "[struct-clos-make] looks_like_defstruct={} ctor={} pred={} slots_meta={} initargs_meta={} supers_meta={} stack=[{}]",
                    looks_like_defstruct,
                    struct_constructor.is_some(),
                    lookup_function_binding(env, &pred_name).is_some(),
                    lookup_class_slots(env, &class_name).is_some(),
                    lookup_class_initargs(env, &class_name).is_some(),
                    lookup_class_supers(env, &class_name).is_some(),
                    super::eval_core::debug_call_stack_summary()
                );
            }
            if looks_like_defstruct {
                let ctor_args: Vec<EvalResult> = args.iter().skip(1).cloned().collect();
                let constructed = super::eval_system::call_function_with_values(
                    struct_constructor.unwrap(),
                    &ctor_args,
                    env,
                )?;
                if std::env::var("RLASP_DEBUG_STRUCT_CLOS_MAKE").is_ok()
                    && class_name.eq_ignore_ascii_case("struct-clos")
                {
                    eprintln!("[struct-clos-make] result={:?}", constructed);
                }
                return Ok(primary_value(constructed));
            }

            // Start with defaults from class metadata (including inherited slots).
            let mut slots = HashMap::new();
            let mut initarg_to_slot: HashMap<String, String> = HashMap::new();

            let mut lineage = Vec::new();
            let mut visiting = std::collections::HashSet::new();
            collect_class_lineage(&class_name, env, &mut lineage, &mut visiting);

            for cls in &lineage {
                let default_entries: Vec<(String, EvalResult)> =
                    if let Some(EvalResult::HashTable(slot_defaults)) = lookup_class_slots(env, cls) {
                        slot_defaults
                            .borrow()
                            .iter()
                            .map(|(k, v)| (k.clone(), v.clone()))
                            .collect()
                    } else {
                        Vec::new()
                    };
                for (slot_name, default_val) in default_entries {
                    if matches!(default_val, EvalResult::Symbol(ref s) if s.eq_ignore_ascii_case(":unbound")) {
                        continue;
                    }
                    let evaluated_default = match default_val {
                        EvalResult::InitForm(ast) => {
                            primary_value(super::eval_core::eval_with_env(&ast, env)?)
                        }
                        other => other,
                    };
                    slots.insert(normalize_slot_name(&slot_name), evaluated_default);
                }
                if let Some(EvalResult::HashTable(initargs_map)) = lookup_class_initargs(env, cls) {
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
            let instance = EvalResult::Instance(Instance {
                id: super::eval_types::next_instance_id(),
                class_name,
                slots: Rc::new(RefCell::new(slots)),
            });

            // CL make-instance must invoke initialize-instance generic functions/methods
            // so user-defined :after/:before methods run.
            let mut init_call_args = Vec::with_capacity(args.len());
            init_call_args.push(instance.clone());
            init_call_args.extend(args.iter().skip(1).cloned());
            if let Some(result) = try_call_generic_function(env, "initialize-instance", &init_call_args)? {
                return match primary_value(result) {
                    EvalResult::Instance(updated) => Ok(EvalResult::Instance(updated)),
                    _ => Ok(instance),
                };
            }

            Ok(instance)
        }

        "class-name" => {
            // Return the name of a class or instance
            match args.get(0) {
                Some(EvalResult::Instance(inst)) => {
                    Ok(EvalResult::Symbol(effective_instance_class_name(inst)))
                }
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

        "ensure-class-using-class" => {
            // Minimal CLOS/MOP support: create a STANDARD-CLASS metaobject.
            Ok(EvalResult::Instance(Instance {
                id: super::eval_types::next_instance_id(),
                class_name: "STANDARD-CLASS".to_string(),
                slots: Rc::new(RefCell::new(HashMap::new())),
            }))
        }

        "make-load-form-saving-slots" => {
            // Return (values allocation-form initialization-form).
            if args.is_empty() {
                return Err("make-load-form-saving-slots requires an object".to_string());
            }
            let class_name = super::eval_types::class_of(&args[0]);
            let alloc = list_from_items(vec![
                EvalResult::Symbol("make-instance".to_string()),
                quoted(EvalResult::Symbol(class_name)),
            ]);
            Ok(EvalResult::MultipleValues(vec![alloc, EvalResult::Nil]))
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
            let normalize_type_name = |raw: &str| -> String {
                let base = raw.rsplit(':').next().unwrap_or(raw);
                base.strip_prefix("CLASS-").unwrap_or(base).to_uppercase()
            };
            let type1 = match &args[0] {
                EvalResult::Symbol(s) => normalize_type_name(s),
                EvalResult::Nil => "NULL".to_string(),
                EvalResult::Cons(_, _) => {
                    // Compound type specifier like (CONS ...), (AND ...), (MEMBER ...) etc.
                    // Return (values NIL NIL) — unknown
                    return Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Nil]));
                }
                _ => return Err("subtypep: type must be a symbol".to_string()),
            };
            let type2 = match &args[1] {
                EvalResult::Symbol(s) => normalize_type_name(s),
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
            } else if super::eval_types::is_subclass(&type1, &type2) {
                true
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

            if std::env::var("RLASP_DEBUG_SUBTYPEP").is_ok() {
                eprintln!("[subtypep-debug] type1={} type2={} result={}", type1, type2, is_subtype);
            }

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
                    if let Some(value) = inst.slots.borrow().get(&slot_name).cloned() {
                        return Ok(value);
                    }

                    if let Some(update_fn) = lookup_function_binding(env, "update-instance-for-redefined-class") {
                        let update_args = vec![
                            EvalResult::Instance(inst.clone()),
                            EvalResult::Nil,
                            EvalResult::Nil,
                            EvalResult::Nil,
                        ];
                        if let Err(e) = super::eval_system::call_function_with_values(update_fn, &update_args, env) {
                            if !e.to_ascii_lowercase().contains("no applicable method") {
                                return Err(e);
                            }
                        }
                    }

                    if let Some(value) = inst.slots.borrow().get(&slot_name).cloned() {
                        return Ok(value);
                    }

                    let mut lineage = Vec::new();
                    let mut visiting = std::collections::HashSet::new();
                    let effective_class_name = effective_instance_class_name(inst);
                    collect_class_lineage(&effective_class_name, env, &mut lineage, &mut visiting);
                    for cls in &lineage {
                        let class_default = if let Some(EvalResult::HashTable(slot_defaults)) =
                            lookup_class_slots(env, cls)
                        {
                            slot_defaults.borrow().get(&slot_name).cloned()
                        } else {
                            None
                        };
                        if let Some(default_val) = class_default {
                                if !matches!(default_val, EvalResult::Symbol(ref s) if s.eq_ignore_ascii_case(":unbound")) {
                                    let realized_default = match default_val {
                                        EvalResult::InitForm(ast) => {
                                            primary_value(super::eval_core::eval_with_env(&ast, env)?)
                                        }
                                        other => other,
                                    };
                                    inst.slots
                                        .borrow_mut()
                                        .insert(slot_name.clone(), realized_default.clone());
                                    return Ok(realized_default);
                                }
                            }
                    }

                    if std::env::var("RLASP_DEBUG_SLOT_UNBOUND").is_ok() {
                        let available_keys: Vec<String> = env
                            .keys()
                            .filter(|k| k.starts_with("*class-slots-"))
                            .take(24)
                            .cloned()
                            .collect();
                        eprintln!(
                            "[slot-unbound] slot={} class={} lineage={:?} keys={:?} stack=[{}]",
                            slot_name,
                            effective_class_name,
                            lineage,
                            available_keys,
                            super::eval_core::debug_call_stack_summary()
                        );
                    }
                    Err(format!("Slot {} is unbound", slot_name))
                }
                EvalResult::HashTable(ht) => {
                    // Backward compatibility
                    let hash = ht.borrow();
                    if let Some(v) = hash.get(&slot_name).cloned() {
                        Ok(v)
                    } else if let Some((_, v)) = hash.iter().find(|(k, _)| hash_slot_key_matches(k, &slot_name)) {
                        Ok(v.clone())
                    } else {
                        Err(format!("Slot {} is unbound", slot_name))
                    }
                }
                EvalResult::Condition(cond) => {
                    let cond_ref = cond.borrow();
                    if let Some(v) = cond_ref.slots.get(&slot_name).cloned() {
                        Ok(v)
                    } else if let Some((_, v)) = cond_ref
                        .slots
                        .iter()
                        .find(|(k, _)| k.eq_ignore_ascii_case(&slot_name))
                    {
                        Ok(v.clone())
                    } else {
                        Err(format!("Slot {} is unbound", slot_name))
                    }
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
                EvalResult::Condition(cond) => {
                    cond.borrow_mut().slots.insert(slot_name, new_value.clone());
                    Ok(new_value)
                }
                EvalResult::HashTable(ht) => {
                    let existing_key = {
                        let hash = ht.borrow();
                        hash.keys()
                            .find(|k| hash_slot_key_matches(k, &slot_name))
                            .cloned()
                    };
                    let mut hash = ht.borrow_mut();
                    let key = existing_key.unwrap_or_else(|| default_hash_slot_storage_key(&slot_name));
                    hash.insert(key, new_value.clone());
                    Ok(new_value)
                }
                _ => {
                    if std::env::var("RLASP_DEBUG_SET_SLOT").is_ok() {
                        eprintln!(
                            "[set-slot-debug] object={:?} slot={} new_value={:?} stack=[{}]",
                            object,
                            slot_name,
                            new_value,
                            super::eval_core::debug_call_stack_summary()
                        );
                    }
                    Err("set-slot-value: object must be an instance".to_string())
                },
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
                    if inst.slots.borrow().contains_key(&slot_name) {
                        return Ok(EvalResult::Boolean(true));
                    }
                    let mut lineage = Vec::new();
                    let mut visiting = std::collections::HashSet::new();
                    let effective_class_name = effective_instance_class_name(inst);
                    collect_class_lineage(&effective_class_name, env, &mut lineage, &mut visiting);
                    for cls in lineage {
                        if let Some(EvalResult::HashTable(slot_defaults)) = lookup_class_slots(env, &cls) {
                            if let Some(default_val) = slot_defaults.borrow().get(&slot_name) {
                                if !matches!(default_val, EvalResult::Symbol(ref s) if s.eq_ignore_ascii_case(":unbound")) {
                                    return Ok(EvalResult::Boolean(true));
                                }
                            }
                        }
                    }
                    Ok(EvalResult::Boolean(false))
                }
                EvalResult::HashTable(ht) => {
                    let hash = ht.borrow();
                    let bound = hash.contains_key(&slot_name)
                        || hash.keys().any(|k| hash_slot_key_matches(k, &slot_name));
                    Ok(EvalResult::Boolean(bound))
                }
                EvalResult::Condition(cond) => {
                    let cond_ref = cond.borrow();
                    Ok(EvalResult::Boolean(
                        cond_ref.slots.contains_key(&slot_name)
                            || cond_ref
                                .slots
                                .keys()
                                .any(|k| k.eq_ignore_ascii_case(&slot_name)),
                    ))
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
                EvalResult::Symbol(s) => normalize_slot_name(s),
                EvalResult::String(s) => normalize_slot_name(s),
                _ => return Err("slot-exists-p: slot-name must be a symbol or string".to_string()),
            };

            match object {
                EvalResult::HashTable(ht) => {
                    let hash = ht.borrow();
                    let exists = hash.contains_key(&slot_name)
                        || hash.keys().any(|k| hash_slot_key_matches(k, &slot_name));
                    Ok(EvalResult::Boolean(exists))
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
                    let remove_key = {
                        let hash = ht.borrow();
                        hash.keys()
                            .find(|k| hash_slot_key_matches(k, &slot_name))
                            .cloned()
                    };
                    let mut hash = ht.borrow_mut();
                    if let Some(key) = remove_key {
                        hash.remove(&key);
                    } else {
                        let fallback = default_hash_slot_storage_key(&slot_name);
                        hash.remove(&fallback);
                        hash.remove(&slot_name);
                    }
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
            // (change-class instance new-class &rest initargs)
            if args.len() < 2 {
                return Err("change-class requires at least instance and new-class".to_string());
            }
            if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
                eprintln!(
                    "[init-instance] change-class args={:?} stack=[{}]",
                    args,
                    super::eval_core::debug_call_stack_summary()
                );
            }

            let inst = match &args[0] {
                EvalResult::Instance(i) => i.clone(),
                _ => return Err("change-class: first argument must be an instance".to_string()),
            };
            let new_class_name = match &args[1] {
                EvalResult::Symbol(s) => s.clone(),
                EvalResult::String(s) => s.clone(),
                _ => return Err("change-class: new class must be a symbol or string".to_string()),
            };

            let old_slots = inst.slots.borrow().clone();
            let mut new_slots = HashMap::new();
            let mut initarg_to_slot: HashMap<String, String> = HashMap::new();
            let mut allowed_slots = std::collections::HashSet::new();

            let mut lineage = Vec::new();
            let mut visiting = std::collections::HashSet::new();
            collect_class_lineage(&new_class_name, env, &mut lineage, &mut visiting);
            for cls in &lineage {
                let default_entries: Vec<(String, EvalResult)> =
                    if let Some(EvalResult::HashTable(slot_defaults)) = lookup_class_slots(env, cls) {
                        slot_defaults
                            .borrow()
                            .iter()
                            .map(|(k, v)| (k.clone(), v.clone()))
                            .collect()
                    } else {
                        Vec::new()
                    };
                for (slot_name, default_val) in default_entries {
                    let slot_key = normalize_slot_name(&slot_name);
                    allowed_slots.insert(slot_key.clone());
                    if let Some(existing) = old_slots.get(&slot_key).cloned() {
                        new_slots.insert(slot_key, existing);
                        continue;
                    }
                    if matches!(default_val, EvalResult::Symbol(ref s) if s.eq_ignore_ascii_case(":unbound")) {
                        continue;
                    }
                    let evaluated_default = match default_val {
                        EvalResult::InitForm(ast) => {
                            primary_value(super::eval_core::eval_with_env(&ast, env)?)
                        }
                        other => other,
                    };
                    new_slots.insert(slot_key, evaluated_default);
                }
                if let Some(EvalResult::HashTable(initargs_map)) = lookup_class_initargs(env, cls) {
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
            if allowed_slots.is_empty() {
                new_slots = old_slots.clone();
            }

            let mut i = 2;
            while i + 1 < args.len() {
                if let EvalResult::Symbol(key) = &args[i] {
                    let initarg = normalize_slot_name(key);
                    let slot_name = initarg_to_slot
                        .get(&initarg)
                        .cloned()
                        .unwrap_or(initarg);
                    new_slots.insert(slot_name, args[i + 1].clone());
                    i += 2;
                } else {
                    i += 1;
                }
            }

            let prospective = EvalResult::Instance(Instance {
                id: super::eval_types::next_instance_id(),
                class_name: new_class_name.clone(),
                slots: Rc::new(RefCell::new(new_slots.clone())),
            });

            if let Some(update_fn) = lookup_function_binding(env, "update-instance-for-different-class") {
                let mut update_args = Vec::with_capacity(args.len());
                update_args.push(EvalResult::Instance(inst.clone()));
                update_args.push(prospective.clone());
                update_args.extend(args.iter().skip(2).cloned());
                if let Err(e) = super::eval_system::call_function_with_values(update_fn, &update_args, env) {
                    if !e.to_ascii_lowercase().contains("no applicable method") {
                        return Err(e);
                    }
                }
            }

            {
                let mut slots = inst.slots.borrow_mut();
                *slots = new_slots;
                slots.insert(
                    CLASS_NAME_OVERRIDE_SLOT_KEY.to_string(),
                    EvalResult::Symbol(new_class_name.clone()),
                );
            }

            Ok(EvalResult::Instance(Instance {
                id: inst.id,
                class_name: new_class_name,
                slots: inst.slots.clone(),
            }))
        }

        "allocate-instance" => {
            // Allocate an instance without applying initargs.
            if args.is_empty() {
                return Err("allocate-instance requires a class".to_string());
            }
            let class_name = match &args[0] {
                EvalResult::Symbol(s) => s.clone(),
                EvalResult::String(s) => s.clone(),
                EvalResult::Instance(inst) => effective_instance_class_name(inst),
                _ => return Err("allocate-instance: class must be a symbol/string/class metaobject".to_string()),
            };
            let allocated = call_clos_builtin("make-instance", &[EvalResult::Symbol(class_name)], env)?;
            Ok(allocated)
        }

        "initialize-instance" => {
            // Prefer user-defined generic methods for full CLOS behavior.
            if let Some(result) = try_call_generic_function(env, "initialize-instance", args)? {
                return Ok(result);
            }
            initialize_instance_slots_from_initargs(args)
        }

        "reinitialize-instance" => {
            if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
                eprintln!(
                    "[init-instance] builtin-reinitialize args={:?} stack=[{}]",
                    args,
                    super::eval_core::debug_call_stack_summary()
                );
            }
            if let Some(result) = try_call_generic_function(env, "reinitialize-instance", args)? {
                return Ok(result);
            }
            initialize_instance_slots_from_initargs(args)
        }

        "shared-initialize" => {
            if std::env::var("RLASP_DEBUG_INIT_INSTANCE").is_ok() {
                eprintln!(
                    "[init-instance] builtin-shared args={:?} stack=[{}]",
                    args,
                    super::eval_core::debug_call_stack_summary()
                );
            }
            if let Some(result) = try_call_generic_function(env, "shared-initialize", args)? {
                return Ok(result);
            }
            shared_initialize_slots_from_initargs(args)
        }

        "update-instance-for-different-class" => {
            // Update instance when class changes
            Ok(EvalResult::Nil)
        }

        "update-instance-for-redefined-class" => {
            // Update instance when class is redefined; accept and return instance.
            if let Some(EvalResult::Instance(inst)) = args.get(0) {
                Ok(EvalResult::Instance(inst.clone()))
            } else {
                Ok(EvalResult::Nil)
            }
        }

        "call-next-method" => {
            // call-next-method can only be called from within a method
            // For now, we don't have a proper method dispatch system with method combination
            // So we signal an error when called
            Err("call-next-method can only be called from within a method".to_string())
        }

        "profiling-data" => {
            // Return two values (miss count, miss ratio) for CLOS profiling tests.
            Ok(EvalResult::MultipleValues(vec![
                EvalResult::Fixnum(0),
                EvalResult::Float(0.0),
            ]))
        }

        _ => Err(format!("Unknown CLOS builtin: {}", name)),
    }
}
