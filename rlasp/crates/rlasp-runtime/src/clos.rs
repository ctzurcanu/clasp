//! CLOS - Common Lisp Object System

use crate::object::LispObject;
use std::collections::HashMap;
use std::sync::{Arc, RwLock};

/// Class definition
#[repr(C)]
pub struct Class {
    name: String,
    slots: Vec<String>,
    methods: Arc<RwLock<HashMap<String, usize>>>,
}

impl Class {
    pub fn new(name: String, slots: Vec<String>) -> Self {
        Self {
            name,
            slots,
            methods: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    pub fn name(&self) -> &str {
        &self.name
    }

    pub fn slots(&self) -> &[String] {
        &self.slots
    }

    pub fn add_method(&self, name: String, func_ptr: usize) {
        let mut methods = self.methods.write().unwrap();
        methods.insert(name, func_ptr);
    }

    pub fn get_method(&self, name: &str) -> Option<usize> {
        let methods = self.methods.read().unwrap();
        methods.get(name).copied()
    }

    pub fn allocate(name: String, slots: Vec<String>) -> LispObject {
        let class = Box::new(Class::new(name, slots));
        let ptr = Box::into_raw(class);
        LispObject::from_class_ptr(ptr)
    }
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
        let instance = Box::new(Instance::new(class));
        let ptr = Box::into_raw(instance);
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
            Some((self.raw & !0b11) as *const Class)
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
            Some((self.raw & !0b11) as *const Instance)
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
        // Arc will handle cleanup
    }
}
