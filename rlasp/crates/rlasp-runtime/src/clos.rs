//! CLOS - Common Lisp Object System
//!
//! Implements:
//! - Class definition with superclass inheritance
//! - Class Precedence List (CPL) using C3 linearization
//! - Slot inheritance from superclasses
//! - Instance creation and slot access

use crate::object::LispObject;
use std::collections::{HashMap, HashSet};
use std::sync::{Arc, RwLock, Mutex};

/// Global class registry for CPL computation and class lookup
static mut CLASS_TABLE: Option<Mutex<HashMap<String, *const Class>>> = None;
static mut INSTANCE_TABLE: Option<Mutex<HashSet<usize>>> = None;

fn get_class_table() -> &'static Mutex<HashMap<String, *const Class>> {
    unsafe {
        CLASS_TABLE.get_or_insert_with(|| Mutex::new(HashMap::new()))
    }
}

fn get_instance_table() -> &'static Mutex<HashSet<usize>> {
    unsafe {
        INSTANCE_TABLE.get_or_insert_with(|| Mutex::new(HashSet::new()))
    }
}

/// Register a class in the global table
pub fn register_class(name: &str, class_ptr: *const Class) {
    let mut table = get_class_table().lock().unwrap();
    table.insert(name.to_string(), class_ptr);
}

/// Look up a class by name
pub fn find_class(name: &str) -> Option<*const Class> {
    let table = get_class_table().lock().unwrap();
    table.get(name).copied()
}

/// Class definition
#[repr(C)]
pub struct Class {
    name: String,
    /// Direct slots defined by this class
    direct_slots: Vec<String>,
    /// All slots including inherited ones
    all_slots: Vec<String>,
    /// Direct superclass names
    direct_superclasses: Vec<String>,
    /// Class Precedence List (computed via C3 linearization)
    class_precedence_list: Vec<String>,
    /// Methods defined on this class
    methods: Arc<RwLock<HashMap<String, usize>>>,
}

impl Class {
    /// Create a new class without superclasses (used for built-in types)
    pub fn new(name: String, slots: Vec<String>) -> Self {
        let cpl = vec![name.clone(), "T".to_string()];
        Self {
            name: name.clone(),
            direct_slots: slots.clone(),
            all_slots: slots,
            direct_superclasses: vec!["T".to_string()],
            class_precedence_list: cpl,
            methods: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    /// Create a class with superclasses (full MOP constructor)
    pub fn new_with_superclasses(
        name: String,
        direct_slots: Vec<String>,
        superclass_names: Vec<String>,
    ) -> Self {
        // Compute CPL using C3 linearization
        let cpl = compute_cpl(&name, &superclass_names);

        // Compute all slots by inheriting from superclasses
        let all_slots = compute_all_slots(&direct_slots, &superclass_names);

        Self {
            name: name.clone(),
            direct_slots,
            all_slots,
            direct_superclasses: if superclass_names.is_empty() {
                vec!["T".to_string()]
            } else {
                superclass_names
            },
            class_precedence_list: cpl,
            methods: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    pub fn name(&self) -> &str {
        &self.name
    }

    /// Get all slots (direct + inherited)
    pub fn slots(&self) -> &[String] {
        &self.all_slots
    }

    /// Get only the direct slots defined by this class
    pub fn direct_slots(&self) -> &[String] {
        &self.direct_slots
    }

    /// Get direct superclass names
    pub fn direct_superclasses(&self) -> &[String] {
        &self.direct_superclasses
    }

    /// Get the class precedence list
    pub fn class_precedence_list(&self) -> &[String] {
        &self.class_precedence_list
    }

    /// Check if this class is a subclass of another
    pub fn is_subclass_of(&self, other_name: &str) -> bool {
        self.class_precedence_list.iter().any(|n| n.eq_ignore_ascii_case(other_name))
    }

    pub fn add_method(&self, name: String, func_ptr: usize) {
        let mut methods = self.methods.write().unwrap();
        methods.insert(name, func_ptr);
    }

    pub fn get_method(&self, name: &str) -> Option<usize> {
        let methods = self.methods.read().unwrap();
        methods.get(name).copied()
    }

    /// Allocate a class without superclasses
    pub fn allocate(name: String, slots: Vec<String>) -> LispObject {
        let ptr = unsafe { crate::gc::gc_allocate_value(Class::new(name.clone(), slots)).as_ptr() };
        // Register in global table
        register_class(&name, ptr);
        LispObject::from_class_ptr(ptr)
    }

    /// Allocate a class with superclasses
    pub fn allocate_with_superclasses(
        name: String,
        slots: Vec<String>,
        superclasses: Vec<String>,
    ) -> LispObject {
        let ptr = unsafe {
            crate::gc::gc_allocate_value(Class::new_with_superclasses(name.clone(), slots, superclasses)).as_ptr()
        };
        // Register in global table
        register_class(&name, ptr);
        LispObject::from_class_ptr(ptr)
    }
}

//============================================================================
// C3 Linearization for Class Precedence List
//============================================================================

/// Compute Class Precedence List using C3 linearization algorithm
/// This is the algorithm used by Python (MRO) and Common Lisp CLOS
fn compute_cpl(class_name: &str, direct_superclasses: &[String]) -> Vec<String> {
    // Start with the class itself
    let mut result = vec![class_name.to_string()];

    if direct_superclasses.is_empty() {
        // No superclasses, just append T
        result.push("T".to_string());
        return result;
    }

    // Get CPLs of all direct superclasses
    let mut superclass_cpls: Vec<Vec<String>> = Vec::new();
    for superclass_name in direct_superclasses {
        if let Some(class_ptr) = find_class(superclass_name) {
            let class = unsafe { &*class_ptr };
            superclass_cpls.push(class.class_precedence_list.clone());
        } else {
            // Superclass not found, use default [superclass, T]
            superclass_cpls.push(vec![superclass_name.clone(), "T".to_string()]);
        }
    }

    // Add the list of direct superclasses in order
    superclass_cpls.push(direct_superclasses.iter().cloned().collect());

    // C3 merge
    while !superclass_cpls.iter().all(|l| l.is_empty()) {
        // Find a good head (first element not in tail of any other list)
        let mut found_head = None;
        for (i, list) in superclass_cpls.iter().enumerate() {
            if let Some(head) = list.first() {
                // Check if head is in the tail of any other list
                let in_tail = superclass_cpls.iter().any(|other| {
                    other.len() > 1 && other[1..].contains(head)
                });

                if !in_tail && !result.contains(head) {
                    found_head = Some((i, head.clone()));
                    break;
                }
            }
        }

        if let Some((_, head)) = found_head {
            result.push(head.clone());

            // Remove head from all lists
            for list in &mut superclass_cpls {
                if list.first() == Some(&head) {
                    list.remove(0);
                }
            }
        } else {
            // No good head found - inconsistent hierarchy
            // Fall back to simple merge
            for list in &superclass_cpls {
                for item in list {
                    if !result.contains(item) {
                        result.push(item.clone());
                    }
                }
            }
            break;
        }
    }

    // Ensure T is at the end
    if result.last() != Some(&"T".to_string()) {
        result.retain(|x| x != "T");
        result.push("T".to_string());
    }

    result
}

/// Compute all slots by inheriting from superclasses
fn compute_all_slots(direct_slots: &[String], superclass_names: &[String]) -> Vec<String> {
    let mut all_slots: Vec<String> = Vec::new();

    // First, collect slots from superclasses (in CPL order)
    for superclass_name in superclass_names {
        if let Some(class_ptr) = find_class(superclass_name) {
            let class = unsafe { &*class_ptr };
            for slot in &class.all_slots {
                if !all_slots.contains(slot) {
                    all_slots.push(slot.clone());
                }
            }
        }
    }

    // Then add direct slots (they override/shadow inherited ones with same name)
    for slot in direct_slots {
        if !all_slots.contains(slot) {
            all_slots.push(slot.clone());
        }
    }

    all_slots
}

/// Instance of a class
#[repr(C)]
pub struct Instance {
    class: *const Class,
    slots: Arc<RwLock<HashMap<String, LispObject>>>,
}

impl Instance {
    pub fn new(class: *const Class) -> Self {
        Self {
            class,
            slots: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    pub fn class(&self) -> *const Class {
        self.class
    }

    pub fn get_slot(&self, name: &str) -> Option<LispObject> {
        let slots = self.slots.read().unwrap();
        slots.get(name).copied()
    }

    pub fn set_slot(&self, name: String, value: LispObject) {
        let mut slots = self.slots.write().unwrap();
        slots.insert(name, value);
    }

    pub fn slots_count(&self) -> usize {
        let slots = self.slots.read().unwrap();
        slots.len()
    }

    pub fn debug_print_slots(&self) {
        let slots = self.slots.read().unwrap();
        for (name, value) in slots.iter() {
            eprintln!("  slot '{}' = {:?}", name, value);
        }
    }

    pub fn allocate(class: *const Class) -> LispObject {
        let ptr = unsafe { crate::gc::gc_allocate_value(Instance::new(class)).as_ptr() };
        get_instance_table().lock().unwrap().insert(ptr as usize);
        LispObject::from_instance_ptr(ptr)
    }
}

impl LispObject {
    pub fn from_class_ptr(ptr: *const Class) -> Self {
        let raw = (ptr as usize) | 0b10;
        unsafe { Self::from_raw(raw) }
    }

    pub fn as_class_ptr(&self) -> Option<*const Class> {
        if (self.raw & 0b11) == 0b10 {
            let ptr = (self.raw & !0b11) as *const Class;
            // Validate pointer is in reasonable address range (not a small value)
            if (ptr as usize) < 0x1000 {
                return None;
            }
            Some(ptr)
        } else {
            None
        }
    }

    pub fn is_class(&self) -> bool {
        self.as_class_ptr().is_some()
    }

    pub fn from_instance_ptr(ptr: *const Instance) -> Self {
        let raw = (ptr as usize) | 0b11;
        unsafe { Self::from_raw(raw) }
    }

    pub fn as_instance_ptr(&self) -> Option<*const Instance> {
        if (self.raw & 0b11) == 0b11 && self.raw != 3 {
            let ptr = (self.raw & !0b11) as *const Instance;
            // Validate pointer is in reasonable address range (not a small value)
            if (ptr as usize) < 0x1000 {
                return None;
            }
            if get_instance_table().lock().unwrap().contains(&(ptr as usize)) {
                Some(ptr)
            } else {
                None
            }
        } else {
            None
        }
    }

    pub fn is_instance(&self) -> bool {
        self.as_instance_ptr().is_some()
    }
}

impl Drop for Class {
    fn drop(&mut self) {
        // Arc will handle cleanup
    }
}

impl Drop for Instance {
    fn drop(&mut self) {
        get_instance_table().lock().unwrap().remove(&(self as *const Instance as usize));
    }
}
