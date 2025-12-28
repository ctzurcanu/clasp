//! CLOS (Common Lisp Object System) Runtime Support

use rlasp_runtime::{LispObject, Class, Instance};
use rlasp_runtime::eval_stack::{stack_push_pointer, stack_pop_pointer, stack_push_nil};
use std::sync::Mutex;
use std::collections::HashMap;

//============================================================================
// Global Registries
//============================================================================

/// Global class registry: name -> Class pointer
static mut CLASS_REGISTRY: Option<Mutex<HashMap<String, *const Class>>> = None;

fn get_class_registry() -> &'static Mutex<HashMap<String, *const Class>> {
    unsafe {
        CLASS_REGISTRY.get_or_insert_with(|| Mutex::new(HashMap::new()))
    }
}

/// Generic function registry: name -> list of (specializers, function_ptr)
struct GenericFunction {
    methods: Vec<(Vec<String>, usize)>,  // (specializers, function_ptr)
}

static mut GENERIC_REGISTRY: Option<Mutex<HashMap<String, GenericFunction>>> = None;

fn get_generic_registry() -> &'static Mutex<HashMap<String, GenericFunction>> {
    unsafe {
        GENERIC_REGISTRY.get_or_insert_with(|| Mutex::new(HashMap::new()))
    }
}

//============================================================================
// Runtime Functions
//============================================================================

/// Define a class
/// Arguments: class_name (symbol), slot_names (list), superclasses (list - currently ignored)
#[no_mangle]
pub extern "C" fn cc_defclass(class_name: usize, slot_names: usize, _superclasses: usize) -> usize {
    // Extract class name from symbol
    let class_name_str = extract_string_from_cons_list(class_name);

    // Extract slot names from list
    let slots = extract_string_list(slot_names);

    // Create and register the class
    let class_obj = Class::allocate(class_name_str.clone(), slots);

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        let mut registry = get_class_registry().lock().unwrap();
        registry.insert(class_name_str, class_ptr);
    }

    class_obj.raw()
}

/// Define a generic function
#[no_mangle]
pub extern "C" fn cc_defgeneric(name: usize, _lambda_list: usize) -> usize {
    let name_str = extract_string_from_cons_list(name);

    let mut registry = get_generic_registry().lock().unwrap();
    registry.entry(name_str).or_insert_with(|| GenericFunction {
        methods: Vec::new(),
    });

    LispObject::t().raw()
}

/// Define a method for a generic function
#[no_mangle]
pub extern "C" fn cc_defmethod(generic_name: usize, specializers: usize, function_ptr: usize, _arity: usize) -> usize {
    let name_str = extract_string_from_cons_list(generic_name);
    let spec_list = extract_string_list(specializers);

    let mut registry = get_generic_registry().lock().unwrap();
    let gf = registry.entry(name_str).or_insert_with(|| GenericFunction {
        methods: Vec::new(),
    });

    gf.methods.push((spec_list, function_ptr));

    LispObject::t().raw()
}

/// Make an instance of a class
/// Arguments: class_name (symbol), initargs (list of key-value pairs)
/// Returns: instance object
#[no_mangle]
pub extern "C" fn cc_make_instance(class_name: usize, initargs: usize) -> usize {
    let class_name_str = extract_string_from_cons_list(class_name);

    let registry = get_class_registry().lock().unwrap();
    if let Some(&class_ptr) = registry.get(&class_name_str) {
        let instance_obj = Instance::allocate(class_ptr);

        // Initialize slots from initargs
        if let Some(inst_ptr) = instance_obj.as_instance_ptr() {
            let inst = unsafe { &*inst_ptr };
            let class = unsafe { &*class_ptr };

            // Parse initargs: (:slot-name value :slot-name value ...)
            let mut current = unsafe { LispObject::from_raw(initargs) };

            while let Some(cons_ptr) = current.as_cons_ptr() {
                let cons = unsafe { &*cons_ptr };
                let key = cons.car();

                // Get key name
                if let Some(key_cons) = key.as_cons_ptr() {
                    let key_cons_ref = unsafe { &*key_cons };
                    let key_name = extract_string_from_object(key_cons_ref.car());

                    // Get value (next item in list)
                    if let Some(rest_cons) = cons.cdr().as_cons_ptr() {
                        let rest_cons_ref = unsafe { &*rest_cons };
                        let value = rest_cons_ref.car();

                        // Find matching slot
                        for slot in class.slots() {
                            if slot.trim_start_matches(':') == key_name.trim_start_matches(':') {
                                inst.set_slot(slot.clone(), value);
                                break;
                            }
                        }

                        // Move to next pair
                        current = rest_cons_ref.cdr();
                    } else {
                        break;
                    }
                } else {
                    // Try direct key
                    let key_name = extract_string_from_object(key);

                    if let Some(rest_cons) = cons.cdr().as_cons_ptr() {
                        let rest_cons_ref = unsafe { &*rest_cons };
                        let value = rest_cons_ref.car();

                        for slot in class.slots() {
                            if slot.trim_start_matches(':') == key_name.trim_start_matches(':') {
                                inst.set_slot(slot.clone(), value);
                                break;
                            }
                        }

                        current = rest_cons_ref.cdr();
                    } else {
                        break;
                    }
                }
            }
        }

        return instance_obj.raw();
    } else {
        return LispObject::nil().raw();
    }
}

/// Get slot value from an instance
/// Arguments: instance, slot_name (symbol)
/// Returns: slot value
#[no_mangle]
pub extern "C" fn cc_slot_value(instance: usize, slot_name: usize) -> usize {
    let inst_obj = unsafe { LispObject::from_raw(instance) };
    let slot_name_str = extract_string_from_cons_list(slot_name);

    if let Some(inst_ptr) = inst_obj.as_instance_ptr() {
        let inst = unsafe { &*inst_ptr };
        if let Some(value) = inst.get_slot(&slot_name_str) {
            return value.raw();
        }
    }

    LispObject::nil().raw()
}

/// Set slot value in an instance
#[no_mangle]
pub extern "C" fn cc_set_slot_value(instance: usize, slot_name: usize, new_value: usize) -> usize {
    let inst_obj = unsafe { LispObject::from_raw(instance) };
    let slot_name_str = extract_string_from_cons_list(slot_name);
    let new_val_obj = unsafe { LispObject::from_raw(new_value) };

    if let Some(inst_ptr) = inst_obj.as_instance_ptr() {
        let inst = unsafe { &*inst_ptr };
        inst.set_slot(slot_name_str, new_val_obj);
    }

    new_value
}

/// Call a generic function with method dispatch
#[no_mangle]
pub extern "C" fn cc_call_generic(generic_name: usize, args_and_env: usize) -> usize {
    let name_str = extract_string_from_cons_list(generic_name);

    let registry = get_generic_registry().lock().unwrap();
    if let Some(gf) = registry.get(&name_str) {
        // Get class names of arguments for dispatch
        let args_obj = unsafe { LispObject::from_raw(args_and_env) };
        let mut arg_classes = Vec::new();
        let mut current = args_obj;

        while let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let arg = cons.car();

            let class_name = if let Some(inst_ptr) = arg.as_instance_ptr() {
                let inst = unsafe { &*inst_ptr };
                let class = unsafe { &*inst.class() };
                class.name().to_string()
            } else {
                "T".to_string()
            };

            arg_classes.push(class_name);
            current = cons.cdr();
        }

        // Find matching method
        for (specializers, func_ptr) in &gf.methods {
            if specializers.len() == arg_classes.len() {
                let mut matches = true;
                for (spec, arg_class) in specializers.iter().zip(arg_classes.iter()) {
                    if spec != "T" && spec != arg_class {
                        matches = false;
                        break;
                    }
                }

                if matches {
                    // Call the method
                    unsafe {
                        let f: extern "C" fn(usize) -> usize = std::mem::transmute(*func_ptr);
                        return f(args_and_env);
                    }
                }
            }
        }
    }

    LispObject::nil().raw()
}

//============================================================================
// Helper Functions
//============================================================================

/// Extract a string from a LispObject that might be a symbol or cons
fn extract_string_from_cons_list(obj: usize) -> String {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    extract_string_from_object(lisp_obj)
}

/// Extract string from LispObject
fn extract_string_from_object(obj: LispObject) -> String {
    use rlasp_runtime::{Symbol, RString};

    // Try as symbol first
    if let Some(sym_ptr) = obj.as_general_ptr::<Symbol>() {
        let sym = unsafe { &*sym_ptr };
        return sym.name().to_string();
    }

    // Try as cons (quoted symbol)
    if let Some(cons_ptr) = obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let car = cons.car();

        // Recursively extract from car
        return extract_string_from_object(car);
    }

    // Try as fixnum
    if obj.is_fixnum() {
        return format!("{}", obj.as_fixnum().unwrap());
    }

    // Try as string
    if let Some(str_ptr) = obj.as_general_ptr::<RString>() {
        let rstr = unsafe { &*str_ptr };
        return rstr.as_str().to_string();
    }

    "UNKNOWN".to_string()
}

/// Extract list of strings from a cons list
fn extract_string_list(list: usize) -> Vec<String> {
    let mut result = Vec::new();
    let mut current = unsafe { LispObject::from_raw(list) };
    let mut count = 0;
    const MAX_LIST_LENGTH: usize = 1000;

    while let Some(cons_ptr) = current.as_cons_ptr() {
        // Safety check against infinite loops
        count += 1;
        if count > MAX_LIST_LENGTH {
            eprintln!("Warning: extract_string_list hit max length, possible circular list");
            break;
        }

        let cons = unsafe { &*cons_ptr };
        let item = cons.car();
        result.push(extract_string_from_object(item));
        current = cons.cdr();

        // Extra check: if cdr is nil, break
        if current.is_nil() {
            break;
        }
    }

    result
}
