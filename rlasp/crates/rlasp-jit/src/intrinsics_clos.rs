//! CLOS (Common Lisp Object System) Runtime Support
//!
//! Implements:
//! - Polymorphic Inline Caches (PICs) for fast generic function dispatch
//! - Standard method combination (:before, :after, :around, :primary)
//! - call-next-method support
//! - MetaObject Protocol (MOP) basics
//! - Class Precedence List (CPL) introspection
//! - Slot and class introspection

use rlasp_runtime::{LispObject, Class, Instance};
use rlasp_runtime::clos::{find_class, register_class};
use rlasp_runtime::eval_stack::{stack_push_pointer, stack_pop_pointer, stack_push_nil};
use std::sync::Mutex;
use std::collections::HashMap;
use std::cell::RefCell;
use std::hash::{Hash, Hasher};
use std::collections::hash_map::DefaultHasher;

#[inline]
fn trace_generic_enabled() -> bool {
    std::env::var("RLASP_TRACE_GENERIC").is_ok()
}

/// Debug print macro - only prints in debug builds
macro_rules! debug_println {
    ($($arg:tt)*) => {
        #[cfg(debug_assertions)]
        eprintln!($($arg)*);
    };
}

//============================================================================
// Method Qualifiers and Method Combination
//============================================================================

/// Method qualifier determines when/how a method is called
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum MethodQualifier {
    /// Primary method - the main implementation
    Primary,
    /// :before - called before primary, most-specific-first
    Before,
    /// :after - called after primary, least-specific-first
    After,
    /// :around - wraps the entire call, can use call-next-method
    Around,
}

impl MethodQualifier {
    pub fn from_str(s: &str) -> Self {
        match s.to_uppercase().as_str() {
            ":BEFORE" | "BEFORE" => MethodQualifier::Before,
            ":AFTER" | "AFTER" => MethodQualifier::After,
            ":AROUND" | "AROUND" => MethodQualifier::Around,
            _ => MethodQualifier::Primary,
        }
    }
}

/// A method with qualifier, specializers, and function pointer
#[derive(Debug, Clone)]
pub struct Method {
    pub qualifier: MethodQualifier,
    pub specializers: Vec<String>,
    pub function_ptr: usize,
}

impl Method {
    pub fn new(qualifier: MethodQualifier, specializers: Vec<String>, function_ptr: usize) -> Self {
        Method { qualifier, specializers, function_ptr }
    }
}

/// Thread-local state for call-next-method
/// Stores the method chain and current position for the active generic function call
struct MethodChainState {
    /// All applicable methods in call order
    methods: Vec<(MethodQualifier, usize)>, // (qualifier, function_ptr)
    /// Current position in the chain
    current_index: usize,
    /// Original arguments for call-next-method
    args_and_env: usize,
}

thread_local! {
    /// Stack of method chain states (for nested generic function calls)
    static METHOD_CHAIN_STACK: RefCell<Vec<MethodChainState>> = RefCell::new(Vec::new());
}

//============================================================================
// Polymorphic Inline Cache (PIC) Implementation
//============================================================================

/// Maximum entries per cache (polymorphic limit)
/// Beyond this, the cache becomes megamorphic and we fall back to hash lookup
const PIC_MAX_ENTRIES: usize = 4;

/// Cache entry: maps a type signature hash to a method pointer
#[derive(Clone, Copy)]
struct PICEntry {
    /// Hash of the argument type signature
    type_hash: u64,
    /// Cached method function pointer
    method_ptr: usize,
    /// Hit count for LRU eviction
    hits: u32,
}

impl PICEntry {
    fn new(type_hash: u64, method_ptr: usize) -> Self {
        Self { type_hash, method_ptr, hits: 1 }
    }
}

/// Per-generic-function dispatch cache
struct DispatchCache {
    /// Cache entries (up to PIC_MAX_ENTRIES)
    entries: Vec<PICEntry>,
    /// Total lookups for statistics
    total_lookups: u64,
    /// Cache hits for statistics
    cache_hits: u64,
}

impl DispatchCache {
    fn new() -> Self {
        Self {
            entries: Vec::with_capacity(PIC_MAX_ENTRIES),
            total_lookups: 0,
            cache_hits: 0,
        }
    }

    /// Look up method in cache by type signature hash
    #[inline]
    fn lookup(&mut self, type_hash: u64) -> Option<usize> {
        self.total_lookups += 1;
        for entry in &mut self.entries {
            if entry.type_hash == type_hash {
                entry.hits = entry.hits.saturating_add(1);
                self.cache_hits += 1;
                return Some(entry.method_ptr);
            }
        }
        None
    }

    /// Insert a new cache entry, evicting LRU if full
    fn insert(&mut self, type_hash: u64, method_ptr: usize) {
        // Check if already cached (shouldn't happen but be safe)
        for entry in &mut self.entries {
            if entry.type_hash == type_hash {
                entry.method_ptr = method_ptr;
                entry.hits = entry.hits.saturating_add(1);
                return;
            }
        }

        if self.entries.len() < PIC_MAX_ENTRIES {
            // Space available, just add
            self.entries.push(PICEntry::new(type_hash, method_ptr));
        } else {
            // Evict LRU entry (lowest hit count)
            let mut min_idx = 0;
            let mut min_hits = u32::MAX;
            for (idx, entry) in self.entries.iter().enumerate() {
                if entry.hits < min_hits {
                    min_hits = entry.hits;
                    min_idx = idx;
                }
            }
            self.entries[min_idx] = PICEntry::new(type_hash, method_ptr);
        }
    }

    /// Get cache hit ratio for diagnostics
    #[allow(dead_code)]
    fn hit_ratio(&self) -> f64 {
        if self.total_lookups == 0 {
            0.0
        } else {
            self.cache_hits as f64 / self.total_lookups as f64
        }
    }
}

/// Compute hash of argument type signature
#[inline]
fn compute_type_signature_hash(arg_classes: &[String]) -> u64 {
    let mut hasher = DefaultHasher::new();
    for class in arg_classes {
        class.hash(&mut hasher);
    }
    hasher.finish()
}

/// Thread-local dispatch caches for each generic function
/// Key: generic function name, Value: dispatch cache
thread_local! {
    static DISPATCH_CACHES: RefCell<HashMap<String, DispatchCache>> =
        RefCell::new(HashMap::new());
}

/// Access dispatch cache for a generic function
fn with_dispatch_cache<F, R>(gf_name: &str, f: F) -> R
where
    F: FnOnce(&mut DispatchCache) -> R,
{
    DISPATCH_CACHES.with(|caches| {
        let mut caches = caches.borrow_mut();
        let cache = caches.entry(gf_name.to_string())
            .or_insert_with(DispatchCache::new);
        f(cache)
    })
}

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

/// Generic function registry: name -> GenericFunction with methods
pub struct GenericFunction {
    /// All methods registered for this generic function
    pub methods: Vec<Method>,
    /// Method combination type (currently only "standard" supported)
    pub method_combination: String,
}

static mut GENERIC_REGISTRY: Option<Mutex<HashMap<String, GenericFunction>>> = None;

pub fn get_generic_registry() -> &'static Mutex<HashMap<String, GenericFunction>> {
    unsafe {
        GENERIC_REGISTRY.get_or_insert_with(|| Mutex::new(HashMap::new()))
    }
}

//============================================================================
// Runtime Functions
//============================================================================

/// Define a class with optional superclasses
/// Arguments: class_name (symbol), slot_names (list), superclasses (list)
#[no_mangle]
pub extern "C" fn cc_defclass(class_name: usize, slot_names: usize, superclasses: usize) -> usize {
    // Extract class name from symbol
    let class_name_str = extract_string_from_cons_list(class_name);

    // Extract slot names from list
    let slots = extract_string_list(slot_names);

    // Extract superclass names from list
    let superclass_names = extract_string_list(superclasses);

    // Create and register the class
    let class_obj = if superclass_names.is_empty() {
        Class::allocate(class_name_str.clone(), slots)
    } else {
        Class::allocate_with_superclasses(class_name_str.clone(), slots, superclass_names)
    };

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        let mut registry = get_class_registry().lock().unwrap();
        registry.insert(class_name_str, class_ptr);
    }

    class_obj.raw()
}

/// Define a generic function
/// Arguments: name (symbol), lambda_list (ignored for now), method_combination (optional)
#[no_mangle]
pub extern "C" fn cc_defgeneric(name: usize, _lambda_list: usize) -> usize {
    let name_str = extract_string_from_cons_list(name);
    if trace_generic_enabled() {
        eprintln!("[generic defgeneric] name={}", name_str);
    }

    let mut registry = get_generic_registry().lock().unwrap();
    registry.entry(name_str).or_insert_with(|| GenericFunction {
        methods: Vec::new(),
        method_combination: "standard".to_string(),
    });

    LispObject::t().raw()
}

/// Define a method for a generic function
/// Arguments: generic_name, specializers, function_ptr, arity, qualifier
/// Invalidates the PIC for this generic function to ensure new method is used
#[no_mangle]
pub extern "C" fn cc_defmethod(generic_name: usize, specializers: usize, function_ptr: usize, _arity: usize) -> usize {
    cc_defmethod_qualified(generic_name, specializers, function_ptr, _arity, 0) // 0 = primary
}

/// Define a method with explicit qualifier
/// qualifier_raw: 0 = primary, 1 = before, 2 = after, 3 = around
#[no_mangle]
pub extern "C" fn cc_defmethod_qualified(generic_name: usize, specializers: usize, function_ptr: usize, _arity: usize, qualifier_raw: usize) -> usize {
    let name_str = extract_string_from_cons_list(generic_name);
    let spec_list = extract_string_list(specializers);
    if trace_generic_enabled() {
        eprintln!(
            "[generic defmethod] name={} specializers={:?} fn_ref=0x{:x} qualifier={}",
            name_str, spec_list, function_ptr, qualifier_raw
        );
    }

    let qualifier = match qualifier_raw {
        1 => MethodQualifier::Before,
        2 => MethodQualifier::After,
        3 => MethodQualifier::Around,
        _ => MethodQualifier::Primary,
    };

    let method = Method::new(qualifier, spec_list, function_ptr);

    let mut registry = get_generic_registry().lock().unwrap();
    let gf = registry.entry(name_str.clone()).or_insert_with(|| GenericFunction {
        methods: Vec::new(),
        method_combination: "standard".to_string(),
    });

    gf.methods.push(method);

    // Invalidate PIC for this generic function (methods changed)
    invalidate_dispatch_cache(&name_str);

    LispObject::t().raw()
}

/// Invalidate dispatch cache for a generic function
/// Called when methods are added or removed
fn invalidate_dispatch_cache(gf_name: &str) {
    DISPATCH_CACHES.with(|caches| {
        let mut caches = caches.borrow_mut();
        caches.remove(gf_name);
    });
}

/// Get PIC statistics for diagnostics
/// Returns: (total_lookups, cache_hits, hit_ratio) for a generic function
#[no_mangle]
pub extern "C" fn cc_pic_stats(generic_name: usize) -> usize {
    let name_str = extract_string_from_cons_list(generic_name);

    let stats = with_dispatch_cache(&name_str, |cache| {
        (cache.total_lookups, cache.cache_hits, cache.entries.len())
    });

    // Return hit ratio as fixnum percentage (0-100)
    let hit_ratio = if stats.0 == 0 {
        0
    } else {
        ((stats.1 as f64 / stats.0 as f64) * 100.0) as i64
    };

    LispObject::fixnum(hit_ratio).raw()
}

/// Clear all dispatch caches (useful for benchmarking)
#[no_mangle]
pub extern "C" fn cc_clear_all_caches() -> usize {
    DISPATCH_CACHES.with(|caches| {
        caches.borrow_mut().clear();
    });
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

                        let trimmed_key = key_name.trim_start_matches(':');
                        for slot in class.slots() {
                            let trimmed_slot = slot.trim_start_matches(':');
                            if trimmed_slot == trimmed_key {
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

/// Call a generic function with standard method combination
///
/// Implements the full CLOS standard method combination:
/// 1. Find all applicable methods
/// 2. Sort by specificity
/// 3. Call in order: around -> (before -> primary -> after)
#[no_mangle]
pub extern "C" fn cc_call_generic(generic_name: usize, args_and_env: usize) -> usize {
    let name_str = extract_string_from_cons_list(generic_name);

    // Get class names of arguments for dispatch
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };
    let arg_classes = extract_arg_classes(args_obj);

    // Find all applicable methods
    let applicable_methods = find_applicable_methods(&name_str, &arg_classes);

    if applicable_methods.is_empty() {
        // No applicable method found
        return LispObject::nil().raw();
    }

    // Execute with standard method combination
    execute_standard_method_combination(&applicable_methods, args_and_env)
}

/// Find all methods that are applicable for the given argument types
fn find_applicable_methods(gf_name: &str, arg_classes: &[String]) -> Vec<Method> {
    let registry = get_generic_registry().lock().unwrap();

    if let Some(gf) = registry.get(gf_name) {
        let mut applicable: Vec<Method> = gf.methods
            .iter()
            .filter(|method| method_matches(&method.specializers, arg_classes))
            .cloned()
            .collect();

        // Sort by specificity (most specific first)
        // More specific = specializer matches exactly rather than T
        applicable.sort_by(|a, b| {
            let a_specificity = a.specializers.iter()
                .filter(|s| *s != "T")
                .count();
            let b_specificity = b.specializers.iter()
                .filter(|s| *s != "T")
                .count();
            b_specificity.cmp(&a_specificity) // Most specific first
        });

        applicable
    } else {
        Vec::new()
    }
}

/// Check if method specializers match argument classes
fn method_matches(specializers: &[String], arg_classes: &[String]) -> bool {
    if specializers.len() != arg_classes.len() {
        return false;
    }

    for (spec, arg_class) in specializers.iter().zip(arg_classes.iter()) {
        if !spec.eq_ignore_ascii_case("T") && !is_class_subtype(arg_class, spec) {
            return false;
        }
    }

    true
}

/// Execute standard method combination
///
/// Order:
/// 1. :around methods (most-specific-first, can call-next-method)
/// 2. If no :around or when call-next-method is invoked:
///    a. :before methods (most-specific-first)
///    b. :primary methods (most-specific, can call-next-method to less-specific)
///    c. :after methods (least-specific-first)
/// 3. Return value from primary (or from :around if it doesn't call-next-method)
fn execute_standard_method_combination(methods: &[Method], args_and_env: usize) -> usize {
    // Partition methods by qualifier
    let mut around_methods: Vec<&Method> = Vec::new();
    let mut before_methods: Vec<&Method> = Vec::new();
    let mut primary_methods: Vec<&Method> = Vec::new();
    let mut after_methods: Vec<&Method> = Vec::new();

    for method in methods {
        match method.qualifier {
            MethodQualifier::Around => around_methods.push(method),
            MethodQualifier::Before => before_methods.push(method),
            MethodQualifier::Primary => primary_methods.push(method),
            MethodQualifier::After => after_methods.push(method),
        }
    }

    // Before and primary are most-specific-first (already sorted)
    // After methods are called least-specific-first
    after_methods.reverse();

    // Build the method chain for call-next-method
    let mut method_chain: Vec<(MethodQualifier, usize)> = Vec::new();

    // If we have :around methods, they wrap everything
    if !around_methods.is_empty() {
        for m in &around_methods {
            method_chain.push((MethodQualifier::Around, m.function_ptr));
        }
        // After all :around, the "next" is the before/primary/after chain
        // We'll handle this specially in call-next-method
    }

    // Add before methods to chain (called when primary is reached)
    for m in &before_methods {
        method_chain.push((MethodQualifier::Before, m.function_ptr));
    }

    // Add primary methods
    for m in &primary_methods {
        method_chain.push((MethodQualifier::Primary, m.function_ptr));
    }

    // Add after methods (called after primary returns)
    for m in &after_methods {
        method_chain.push((MethodQualifier::After, m.function_ptr));
    }

    if method_chain.is_empty() {
        return LispObject::nil().raw();
    }

    // Push method chain state onto thread-local stack
    METHOD_CHAIN_STACK.with(|stack| {
        stack.borrow_mut().push(MethodChainState {
            methods: method_chain.clone(),
            current_index: 0,
            args_and_env,
        });
    });

    // Execute method combination
    let result = if !around_methods.is_empty() {
        // Start with first :around method
        let first_around = around_methods[0].function_ptr;
        unsafe {
            let f: extern "C" fn(usize) -> usize = std::mem::transmute(first_around);
            f(args_and_env)
        }
    } else {
        // No :around - execute before/primary/after directly
        execute_primary_effective_method(&before_methods, &primary_methods, &after_methods, args_and_env)
    };

    // Pop method chain state
    METHOD_CHAIN_STACK.with(|stack| {
        stack.borrow_mut().pop();
    });

    result
}

/// Execute the effective method without :around wrapping
fn execute_primary_effective_method(
    before_methods: &[&Method],
    primary_methods: &[&Method],
    after_methods: &[&Method],
    args_and_env: usize,
) -> usize {
    // Call all :before methods (most-specific-first)
    for method in before_methods {
        unsafe {
            let f: extern "C" fn(usize) -> usize = std::mem::transmute(method.function_ptr);
            f(args_and_env);
        }
    }

    // Call primary method(s) - most specific, can use call-next-method for less specific
    let result = if let Some(primary) = primary_methods.first() {
        // Set up for call-next-method within primary
        METHOD_CHAIN_STACK.with(|stack| {
            let mut stack = stack.borrow_mut();
            if let Some(state) = stack.last_mut() {
                // Find the index of this primary method
                for (i, (q, ptr)) in state.methods.iter().enumerate() {
                    if *q == MethodQualifier::Primary && *ptr == primary.function_ptr {
                        state.current_index = i;
                        break;
                    }
                }
            }
        });

        unsafe {
            let f: extern "C" fn(usize) -> usize = std::mem::transmute(primary.function_ptr);
            f(args_and_env)
        }
    } else {
        LispObject::nil().raw()
    };

    // Call all :after methods (least-specific-first, already reversed)
    for method in after_methods {
        unsafe {
            let f: extern "C" fn(usize) -> usize = std::mem::transmute(method.function_ptr);
            f(args_and_env);
        }
    }

    result
}

/// call-next-method - call the next method in the chain
#[no_mangle]
pub extern "C" fn cc_call_next_method() -> usize {
    cc_call_next_method_with_args(0) // 0 means use original args
}

/// call-next-method with optional new arguments
#[no_mangle]
pub extern "C" fn cc_call_next_method_with_args(new_args: usize) -> usize {
    METHOD_CHAIN_STACK.with(|stack| {
        let mut stack = stack.borrow_mut();
        if let Some(state) = stack.last_mut() {
            let next_index = state.current_index + 1;

            if next_index >= state.methods.len() {
                // No more methods
                return LispObject::nil().raw();
            }

            let (qualifier, method_ptr) = state.methods[next_index];
            state.current_index = next_index;

            let args = if new_args == 0 {
                state.args_and_env
            } else {
                new_args
            };

            // For :around transitioning to effective method, we need special handling
            if qualifier == MethodQualifier::Before {
                // We're transitioning from :around to the effective method
                // Collect before, primary, after from remaining chain
                let mut before: Vec<usize> = Vec::new();
                let mut primary: Vec<usize> = Vec::new();
                let mut after: Vec<usize> = Vec::new();

                for i in next_index..state.methods.len() {
                    let (q, ptr) = state.methods[i];
                    match q {
                        MethodQualifier::Before => before.push(ptr),
                        MethodQualifier::Primary => primary.push(ptr),
                        MethodQualifier::After => after.push(ptr),
                        MethodQualifier::Around => {} // Skip remaining arounds
                    }
                }

                // Execute before
                for ptr in &before {
                    unsafe {
                        let f: extern "C" fn(usize) -> usize = std::mem::transmute(*ptr);
                        f(args);
                    }
                }

                // Execute primary (first one)
                let result = if let Some(&ptr) = primary.first() {
                    // Update current index to this primary
                    for (i, (q, p)) in state.methods.iter().enumerate() {
                        if *q == MethodQualifier::Primary && *p == ptr {
                            state.current_index = i;
                            break;
                        }
                    }
                    unsafe {
                        let f: extern "C" fn(usize) -> usize = std::mem::transmute(ptr);
                        f(args)
                    }
                } else {
                    LispObject::nil().raw()
                };

                // Execute after
                for ptr in &after {
                    unsafe {
                        let f: extern "C" fn(usize) -> usize = std::mem::transmute(*ptr);
                        f(args);
                    }
                }

                return result;
            }

            // Normal case: call the next method directly
            unsafe {
                let f: extern "C" fn(usize) -> usize = std::mem::transmute(method_ptr);
                f(args)
            }
        } else {
            // No method chain - error
            LispObject::nil().raw()
        }
    })
}

/// Check if there's a next method available
#[no_mangle]
pub extern "C" fn cc_next_method_p() -> usize {
    METHOD_CHAIN_STACK.with(|stack| {
        let stack = stack.borrow();
        if let Some(state) = stack.last() {
            if state.current_index + 1 < state.methods.len() {
                LispObject::t().raw()
            } else {
                LispObject::nil().raw()
            }
        } else {
            LispObject::nil().raw()
        }
    })
}

/// Extract class names from argument list for dispatch
#[inline]
fn extract_arg_classes(args_obj: LispObject) -> Vec<String> {
    let mut arg_classes = Vec::with_capacity(4);
    let mut current = args_obj;

    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let arg = cons.car();

        let class_name = get_object_class_name(arg);
        arg_classes.push(class_name);
        current = cons.cdr();
    }

    arg_classes
}

/// Get class name for an object (for method dispatch)
#[inline]
fn get_object_class_name(obj: LispObject) -> String {
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    use rlasp_runtime::error::ErrorKind;

    if obj.is_nil() {
        "NULL".to_string()
    } else if obj.is_fixnum() {
        "FIXNUM".to_string()
    } else if obj.as_cons_ptr().is_some() {
        "CONS".to_string()
    } else if obj.as_character().is_some() {
        "CHARACTER".to_string()
    } else if obj.is_general() {
        let raw_ptr = obj.as_general_ptr_unchecked::<u8>();
        if !raw_ptr.is_null() {
            if let Some(obj_type) = unsafe { TypeHeader::from_ptr(raw_ptr as *const _) } {
                return match obj_type {
                    ObjectType::Symbol => "SYMBOL".to_string(),
                    ObjectType::String => "STRING".to_string(),
                    ObjectType::Vector => "VECTOR".to_string(),
                    ObjectType::Error => match obj.as_error_kind() {
                        Some(ErrorKind::TypeError) => "TYPE-ERROR".to_string(),
                        Some(ErrorKind::DivisionByZero) => "DIVISION-BY-ZERO".to_string(),
                        Some(ErrorKind::UnboundVariable) => "UNBOUND-VARIABLE".to_string(),
                        Some(ErrorKind::UndefinedFunction) => "UNDEFINED-FUNCTION".to_string(),
                        Some(ErrorKind::InvalidArgument) => {
                            if let Some(err_ptr) = obj.as_general_ptr::<rlasp_runtime::LispError>() {
                                if !err_ptr.is_null() {
                                    let err = unsafe { &*err_ptr };
                                    if let Some(msg) = &err.message {
                                        let upper = msg.to_ascii_uppercase();
                                        if upper.starts_with("FILE-ERROR") {
                                            return "FILE-ERROR".to_string();
                                        }
                                        if upper.contains("PACKAGE-ERROR") {
                                            return "PACKAGE-ERROR".to_string();
                                        }
                                        if upper.contains("STREAM-ERROR") {
                                            return "STREAM-ERROR".to_string();
                                        }
                                        if upper.contains("PARSE-ERROR") {
                                            return "PARSE-ERROR".to_string();
                                        }
                                        if upper.contains("READER-ERROR") {
                                            return "READER-ERROR".to_string();
                                        }
                                        if upper.contains("TYPE-ERROR") {
                                            return "TYPE-ERROR".to_string();
                                        }
                                        if upper.contains("REQUIRES")
                                            && (upper.contains("STREAM")
                                                || upper.contains("CHARACTER")
                                                || upper.contains("SEQUENCE")
                                                || upper.contains("STRING"))
                                        {
                                            return "TYPE-ERROR".to_string();
                                        }
                                        if upper.contains("END-OF-FILE") {
                                            return "END-OF-FILE".to_string();
                                        }
                                        if upper.contains("END OF FILE") {
                                            return "END-OF-FILE".to_string();
                                        }
                                        if upper.contains("PACKAGE-LOCK-VIOLATION") {
                                            return "PACKAGE-LOCK-VIOLATION".to_string();
                                        }
                                    }
                                }
                            }
                            "PROGRAM-ERROR".to_string()
                        }
                        Some(ErrorKind::IndexOutOfBounds) => "TYPE-ERROR".to_string(),
                        None => "ERROR".to_string(),
                    },
                    ObjectType::Number => {
                        let num_ptr = raw_ptr as *const rlasp_runtime::Number;
                        if num_ptr.is_null() {
                            "NUMBER".to_string()
                        } else {
                            let num = unsafe { &*num_ptr };
                            match &num.value {
                                rlasp_runtime::NumberValue::Float(_) => "FLOAT".to_string(),
                                rlasp_runtime::NumberValue::Bignum(_) => "INTEGER".to_string(),
                                rlasp_runtime::NumberValue::Ratio(_) => "RATIO".to_string(),
                                rlasp_runtime::NumberValue::Complex(_) => "COMPLEX".to_string(),
                            }
                        }
                    }
                    ObjectType::Package => "PACKAGE".to_string(),
                    ObjectType::Pathname => "PATHNAME".to_string(),
                    ObjectType::Stream => "STREAM".to_string(),
                    ObjectType::HashTable => "HASH-TABLE".to_string(),
                    ObjectType::Closure => "FUNCTION".to_string(),
                    _ => "T".to_string(),
                };
            }
        }
        "T".to_string()
    } else {
        "T".to_string()
    }
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
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    use rlasp_runtime::{Symbol, RString};

    // Safely inspect heap object type before casting to concrete structs.
    if let Some(ptr) = obj.as_general_ptr::<()>() {
        if !ptr.is_null() {
            match unsafe { TypeHeader::from_ptr(ptr) } {
                Some(ObjectType::Symbol) => {
                    let sym = unsafe { &*(ptr as *const Symbol) };
                    return sym.name().to_string();
                }
                Some(ObjectType::String) => {
                    let rstr = unsafe { &*(ptr as *const RString) };
                    return rstr.as_str().to_string();
                }
                _ => {}
            }
        }
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

//============================================================================
// MOP Introspection Functions
//============================================================================

/// Find a class by name
/// Arguments: class_name (symbol)
/// Returns: class object or NIL if not found
#[no_mangle]
pub extern "C" fn cc_find_class(class_name: usize) -> usize {
    let name_str = normalize_type_name(&extract_string_from_cons_list(class_name));

    if let Some(class_ptr) = ensure_builtin_class(&name_str) {
        return LispObject::from_class_ptr(class_ptr).raw();
    }

    // Check runtime class table first
    if let Some(class_ptr) = find_class(&name_str) {
        return LispObject::from_class_ptr(class_ptr).raw();
    }

    // Check our local registry
    let registry = get_class_registry().lock().unwrap();
    if let Some(&class_ptr) = registry.get(&name_str) {
        return LispObject::from_class_ptr(class_ptr).raw();
    }

    LispObject::nil().raw()
}

/// Get the class of an object
/// Arguments: object
/// Returns: class object
#[no_mangle]
pub extern "C" fn cc_class_of(object: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(object) };

    // For instances, return their class
    if let Some(inst_ptr) = obj.as_instance_ptr() {
        let inst = unsafe { &*inst_ptr };
        return LispObject::from_class_ptr(inst.class()).raw();
    }

    // For other types, return their built-in class
    let class_name = get_object_class_name(obj);

    if let Some(class_ptr) = ensure_builtin_class(&class_name) {
        return LispObject::from_class_ptr(class_ptr).raw();
    }

    // Try to find the built-in class
    if let Some(class_ptr) = find_class(&class_name) {
        return LispObject::from_class_ptr(class_ptr).raw();
    }

    LispObject::nil().raw()
}

/// Get class name
/// Arguments: class
/// Returns: symbol
#[no_mangle]
pub extern "C" fn cc_class_name(class: usize) -> usize {
    let class_obj = unsafe { LispObject::from_raw(class) };

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        let class = unsafe { &*class_ptr };
        // Return name as a symbol
        let name = class.name();
        return make_symbol(name);
    }

    LispObject::nil().raw()
}

/// Get all slots of a class (including inherited)
/// Arguments: class
/// Returns: list of slot names
#[no_mangle]
pub extern "C" fn cc_class_slots(class: usize) -> usize {
    let class_obj = unsafe { LispObject::from_raw(class) };

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        let class = unsafe { &*class_ptr };
        let slots = class.slots();
        return make_symbol_list(slots);
    }

    LispObject::nil().raw()
}

/// Get direct slots of a class (not inherited)
/// Arguments: class
/// Returns: list of slot names
#[no_mangle]
pub extern "C" fn cc_class_direct_slots(class: usize) -> usize {
    let class_obj = unsafe { LispObject::from_raw(class) };

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        let class = unsafe { &*class_ptr };
        let slots = class.direct_slots();
        return make_symbol_list(slots);
    }

    LispObject::nil().raw()
}

/// Get direct superclasses of a class
/// Arguments: class
/// Returns: list of class names
#[no_mangle]
pub extern "C" fn cc_class_direct_superclasses(class: usize) -> usize {
    let class_obj = unsafe { LispObject::from_raw(class) };

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        let class = unsafe { &*class_ptr };
        let superclasses = class.direct_superclasses();
        return make_symbol_list(superclasses);
    }

    LispObject::nil().raw()
}

/// Get class precedence list
/// Arguments: class
/// Returns: list of class names in precedence order
#[no_mangle]
pub extern "C" fn cc_class_precedence_list(class: usize) -> usize {
    let class_obj = unsafe { LispObject::from_raw(class) };

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        let class = unsafe { &*class_ptr };
        let cpl = class.class_precedence_list();
        return make_symbol_list(cpl);
    }

    LispObject::nil().raw()
}

/// Check if object is an instance of a class (or subclass)
/// Arguments: object, class_name (symbol)
/// Returns: T or NIL
#[no_mangle]
pub extern "C" fn cc_typep(object: usize, class_name: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(object) };
    let class_obj = unsafe { LispObject::from_raw(class_name) };
    let name_str = normalize_type_name(&extract_string_from_cons_list(class_name));

    if let Some(spec_ptr) = class_obj.as_cons_ptr() {
        let spec = unsafe { &*spec_ptr };
        if let Some(head) = symbol_name_if_symbol(spec.car()) {
            if normalize_type_name(&head) == "NOT" {
                if let Some(rest_ptr) = spec.cdr().as_cons_ptr() {
                    let rest = unsafe { &*rest_ptr };
                    let inner = rest.car();
                    let inner_result = unsafe { LispObject::from_raw(cc_typep(object, inner.raw())) };
                    return if inner_result.is_nil() {
                        LispObject::t().raw()
                    } else {
                        LispObject::nil().raw()
                    };
                }
            }
        }
    }

    // T matches everything
    if name_str == "T" {
        return LispObject::t().raw();
    }

    // Numeric range type specifiers, e.g. (real 1), (real 0 1), (integer 0 *).
    if let Some(spec_ptr) = class_obj.as_cons_ptr() {
        let spec = unsafe { &*spec_ptr };
        if let Some(head) = symbol_name_if_symbol(spec.car()) {
            let head_name = normalize_type_name(&head);
            if head_name == "REAL" || head_name == "INTEGER" {
                let Some(val) = lisp_real_to_f64(obj) else {
                    return LispObject::nil().raw();
                };

                if head_name == "INTEGER" && val.fract() != 0.0 {
                    return LispObject::nil().raw();
                }

                let mut bounds: Vec<LispObject> = Vec::new();
                let mut tail = spec.cdr();
                while let Some(tail_ptr) = tail.as_cons_ptr() {
                    if tail_ptr.is_null() {
                        break;
                    }
                    let tail_cons = unsafe { &*tail_ptr };
                    bounds.push(tail_cons.car());
                    tail = tail_cons.cdr();
                }

                let lower = bounds
                    .get(0)
                    .and_then(|b| parse_type_bound(*b))
                    .flatten();
                let upper = bounds
                    .get(1)
                    .and_then(|b| parse_type_bound(*b))
                    .flatten();

                let lower_ok = lower.map(|l| val >= l).unwrap_or(true);
                let upper_ok = upper.map(|u| val <= u).unwrap_or(true);
                return if lower_ok && upper_ok {
                    LispObject::t().raw()
                } else {
                    LispObject::nil().raw()
                };
            }
        }
    }

    let obj_class = normalize_type_name(&get_object_class_name(obj));
    if let Some(sym_name) = symbol_name_if_symbol(obj) {
        let is_match = match name_str.as_str() {
            "PROCESS" => sym_name.starts_with("%PROCESS-"),
            "MUTEX" => sym_name.starts_with("%MUTEX-"),
            "RECURSIVE-MUTEX" => sym_name.starts_with("%RECURSIVE-MUTEX-"),
            _ => false,
        };
        if is_match {
            return LispObject::t().raw();
        }
    }
    let is_vector_like = matches!(obj_class.as_str(), "VECTOR" | "STRING");
    let is_array_like = is_vector_like;
    let dims = crate::intrinsics::array_dims_object(obj);
    let rank1 = if obj_class == "STRING" { true } else { dims.len() <= 1 };
    let has_fill_pointer = crate::intrinsics::array_has_fill_pointer_object(obj);
    let has_displacement = crate::intrinsics::array_has_displacement_object(obj);
    let is_adjustable = crate::intrinsics::array_is_adjustable_object(obj);
    let is_simple_array = is_array_like && !has_fill_pointer && !has_displacement && !is_adjustable;

    match name_str.as_str() {
        "NULL" => {
            return if obj.is_nil() { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        "STANDARD-CHAR" => {
            let is_standard = obj
                .as_character()
                .map(|ch| ch == '\n' || (' '..='~').contains(&ch))
                .unwrap_or(false);
            return if is_standard {
                LispObject::t().raw()
            } else {
                LispObject::nil().raw()
            };
        }
        "FLOAT" | "SHORT-FLOAT" | "SINGLE-FLOAT" | "DOUBLE-FLOAT" | "LONG-FLOAT" => {
            return if obj_class == "FLOAT" { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        "ARRAY" => {
            return if is_array_like { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        "VECTOR" => {
            return if is_vector_like { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        "SEQUENCE" => {
            let is_sequence = obj.is_nil() || obj.as_cons_ptr().is_some() || is_vector_like;
            return if is_sequence { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        "SIMPLE-ARRAY" => {
            return if is_simple_array { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        "SIMPLE-VECTOR" => {
            let is_simple_vector = obj_class == "VECTOR" && rank1 && is_simple_array;
            return if is_simple_vector { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        "STRING" | "SIMPLE-STRING" => {
            return if obj_class == "STRING" { LispObject::t().raw() } else { LispObject::nil().raw() };
        }
        _ => {}
    }

    if let Some(TypeSpec::SimpleArray { element_type, dim }) = parse_type_spec(class_obj) {
        if !is_simple_array {
            return LispObject::nil().raw();
        }

        let obj_element_type = if obj_class == "STRING" {
            "CHARACTER".to_string()
        } else {
            crate::intrinsics::array_element_type_name_object(obj).unwrap_or_else(|| "T".to_string())
        };
        let element_ok = obj_element_type == element_type
            || (element_type == "CHARACTER" && obj_element_type == "BASE-CHAR")
            || (element_type == "BASE-CHAR" && obj_element_type == "CHARACTER")
            || element_type == "T";

        let obj_dim = if obj_class == "STRING" {
            None
        } else {
            dims.first().copied().map(|d| d as i64)
        };
        let dim_ok = match dim {
            None => true,
            Some(expected) => obj_dim == Some(expected),
        };

        return if element_ok && dim_ok {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Numeric hierarchy checks (CL): FIXNUM/BIGNUM < INTEGER < RATIONAL < REAL < NUMBER.
    // Our runtime reports bignums as obj_class "INTEGER", fixnums as "FIXNUM".
    let numeric_match = match (obj_class.as_str(), name_str.as_str()) {
        ("FIXNUM", "FIXNUM")
        | ("FIXNUM", "INTEGER")
        | ("FIXNUM", "RATIONAL")
        | ("FIXNUM", "REAL")
        | ("FIXNUM", "NUMBER")
        | ("INTEGER", "BIGNUM")
        | ("INTEGER", "INTEGER")
        | ("INTEGER", "RATIONAL")
        | ("INTEGER", "REAL")
        | ("INTEGER", "NUMBER")
        | ("RATIO", "RATIO")
        | ("RATIO", "RATIONAL")
        | ("RATIO", "REAL")
        | ("RATIO", "NUMBER")
        | ("FLOAT", "FLOAT")
        | ("FLOAT", "SHORT-FLOAT")
        | ("FLOAT", "SINGLE-FLOAT")
        | ("FLOAT", "DOUBLE-FLOAT")
        | ("FLOAT", "LONG-FLOAT")
        | ("FLOAT", "REAL")
        | ("FLOAT", "NUMBER")
        | ("COMPLEX", "COMPLEX")
        | ("COMPLEX", "NUMBER") => true,
        _ => false,
    };
    if numeric_match {
        return LispObject::t().raw();
    }

    // Built-in and runtime object types.
    if obj_class == name_str {
        return LispObject::t().raw();
    }

    // Basic condition hierarchy needed by regression tests.
    let is_error_subtype = matches!(
        obj_class.as_str(),
        "TYPE-ERROR"
            | "PROGRAM-ERROR"
            | "FILE-ERROR"
            | "PARSE-ERROR"
            | "READER-ERROR"
            | "END-OF-FILE"
            | "PACKAGE-ERROR"
            | "STREAM-ERROR"
            | "PACKAGE-LOCK-VIOLATION"
            | "DIVISION-BY-ZERO"
            | "UNBOUND-VARIABLE"
            | "UNDEFINED-FUNCTION"
    );
    if is_error_subtype && name_str == "ERROR" {
        return LispObject::t().raw();
    }
    if is_error_subtype && (name_str == "SIMPLE-ERROR" || name_str == "SIMPLE-CONDITION") {
        return LispObject::t().raw();
    }
    if obj_class == "DIVISION-BY-ZERO" && name_str == "ARITHMETIC-ERROR" {
        return LispObject::t().raw();
    }

    LispObject::nil().raw()
}

/// Check if a class is a subclass of another
/// Arguments: class1, class2_name (symbol)
/// Returns: T or NIL
#[no_mangle]
pub extern "C" fn cc_subtypep(class1: usize, class2_name: usize) -> usize {
    let class_obj = unsafe { LispObject::from_raw(class1) };
    let class2_obj = unsafe { LispObject::from_raw(class2_name) };

    let pack = |is_subtype: bool, is_known: bool| {
        let st = if is_subtype { LispObject::t() } else { LispObject::nil() };
        let known = if is_known { LispObject::t() } else { LispObject::nil() };
        let tail = rlasp_runtime::Cons::allocate(known, LispObject::nil());
        let values = rlasp_runtime::Cons::allocate(st, tail);
        crate::intrinsics::cc_values_pack(values.raw())
    };

    if let Some(class_ptr) = class_obj.as_class_ptr() {
        // Validate class pointer is reasonable
        if class_ptr.is_null() || (class_ptr as usize) < 0x1000 {
            return pack(false, false);
        }
        let class = unsafe { &*class_ptr };
        if let Some(TypeSpec::Symbol(rhs_name)) = parse_type_spec(class2_obj) {
            if class.is_subclass_of(&rhs_name) {
                return pack(true, true);
            }
            return pack(false, true);
        }
        return pack(false, false);
    }

    let lhs = parse_type_spec(class_obj);
    let rhs = parse_type_spec(class2_obj);
    if let (Some(lhs_spec), Some(rhs_spec)) = (lhs, rhs) {
        if type_spec_is_subtype(&lhs_spec, &rhs_spec) {
            return pack(true, true);
        }
        return pack(false, true);
    }

    pack(false, false)
}

#[derive(Clone, Debug)]
enum TypeSpec {
    Symbol(String),
    SimpleArray {
        element_type: String,
        dim: Option<i64>, // None means wildcard (*)
    },
}

fn normalize_type_name(name: &str) -> String {
    let base = name.rsplit(':').next().unwrap_or(name);
    base.trim_start_matches(':').to_ascii_uppercase()
}

fn symbol_name_if_symbol(obj: LispObject) -> Option<String> {
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    use rlasp_runtime::Symbol;

    let ptr = obj.as_general_ptr::<()>()?;
    if ptr.is_null() || unsafe { TypeHeader::from_ptr(ptr) } != Some(ObjectType::Symbol) {
        return None;
    }
    let sym = unsafe { &*(ptr as *const Symbol) };
    Some(sym.name().to_string())
}

fn maybe_unquote(obj: LispObject) -> LispObject {
    let Some(cons_ptr) = obj.as_cons_ptr() else {
        return obj;
    };
    let cons = unsafe { &*cons_ptr };
    let Some(head) = symbol_name_if_symbol(cons.car()) else {
        return obj;
    };
    if !normalize_type_name(&head).eq("QUOTE") {
        return obj;
    }
    let Some(rest_ptr) = cons.cdr().as_cons_ptr() else {
        return obj;
    };
    let rest = unsafe { &*rest_ptr };
    rest.car()
}

fn lisp_real_to_f64(obj: LispObject) -> Option<f64> {
    if let Some(n) = obj.as_fixnum() {
        return Some(n as f64);
    }
    if let Some(f) = obj.as_float() {
        return Some(f);
    }
    if let Some(num_ptr) = obj.as_general_ptr::<rlasp_runtime::Number>() {
        if num_ptr.is_null() {
            return None;
        }
        let num = unsafe { &*num_ptr };
        return match &num.value {
            rlasp_runtime::NumberValue::Float(f) => Some(*f),
            rlasp_runtime::NumberValue::Bignum(b) => b.to_string().parse::<f64>().ok(),
            rlasp_runtime::NumberValue::Ratio(r) => {
                let n = r.numerator_ref().to_string().parse::<f64>().ok()?;
                let d = r.denominator_ref().to_string().parse::<f64>().ok()?;
                if d == 0.0 {
                    None
                } else {
                    Some(n / d)
                }
            }
            rlasp_runtime::NumberValue::Complex(_) => None,
        };
    }
    None
}

fn parse_type_bound(obj: LispObject) -> Option<Option<f64>> {
    let unquoted = maybe_unquote(obj);
    if let Some(sym) = symbol_name_if_symbol(unquoted) {
        if normalize_type_name(&sym) == "*" {
            return Some(None);
        }
    }
    Some(lisp_real_to_f64(unquoted))
}

fn builtin_class_superclasses(name: &str) -> Option<Vec<String>> {
    let supers: &[&str] = match name {
        "T" => &[],
        "NULL" => &["SYMBOL", "LIST", "SEQUENCE", "T"],
        "SYMBOL" => &["T"],
        "CONS" => &["LIST", "SEQUENCE", "T"],
        "LIST" => &["SEQUENCE", "T"],
        "SEQUENCE" => &["T"],
        "CHARACTER" => &["T"],
        "BASE-CHAR" => &["CHARACTER", "T"],
        "STANDARD-CHAR" => &["BASE-CHAR", "CHARACTER", "T"],
        "ARRAY" => &["T"],
        "SIMPLE-ARRAY" => &["ARRAY", "T"],
        "VECTOR" => &["ARRAY", "SEQUENCE", "T"],
        "SIMPLE-VECTOR" => &["VECTOR", "SIMPLE-ARRAY", "ARRAY", "SEQUENCE", "T"],
        "STRING" => &["VECTOR", "ARRAY", "SEQUENCE", "T"],
        "BASE-STRING" => &["STRING", "VECTOR", "ARRAY", "SEQUENCE", "T"],
        "SIMPLE-STRING" => &["STRING", "SIMPLE-ARRAY", "VECTOR", "ARRAY", "SEQUENCE", "T"],
        "SIMPLE-BASE-STRING" => &["BASE-STRING", "SIMPLE-STRING", "STRING", "SIMPLE-ARRAY", "VECTOR", "ARRAY", "SEQUENCE", "T"],
        "BIT-VECTOR" => &["VECTOR", "ARRAY", "SEQUENCE", "T"],
        "SIMPLE-BIT-VECTOR" => &["BIT-VECTOR", "VECTOR", "SIMPLE-ARRAY", "ARRAY", "SEQUENCE", "T"],
        "NUMBER" => &["T"],
        "REAL" => &["NUMBER", "T"],
        "RATIONAL" => &["REAL", "NUMBER", "T"],
        "INTEGER" => &["RATIONAL", "REAL", "NUMBER", "T"],
        "FIXNUM" => &["INTEGER", "RATIONAL", "REAL", "NUMBER", "T"],
        "BIGNUM" => &["INTEGER", "RATIONAL", "REAL", "NUMBER", "T"],
        "RATIO" => &["RATIONAL", "REAL", "NUMBER", "T"],
        "FLOAT" => &["REAL", "NUMBER", "T"],
        "SHORT-FLOAT" | "SINGLE-FLOAT" | "DOUBLE-FLOAT" | "LONG-FLOAT" => &["FLOAT", "REAL", "NUMBER", "T"],
        "COMPLEX" => &["NUMBER", "T"],
        "FUNCTION" => &["T"],
        "PACKAGE" | "PATHNAME" | "STREAM" | "HASH-TABLE" => &["T"],
        "CONDITION" => &["T"],
        "SERIOUS-CONDITION" => &["CONDITION", "T"],
        "ERROR" => &["SERIOUS-CONDITION", "CONDITION", "T"],
        "SIMPLE-CONDITION" => &["CONDITION", "T"],
        "SIMPLE-ERROR" => &["ERROR", "SERIOUS-CONDITION", "CONDITION", "SIMPLE-CONDITION", "T"],
        "PROGRAM-ERROR" | "TYPE-ERROR" | "FILE-ERROR" | "PARSE-ERROR" | "READER-ERROR" |
        "END-OF-FILE" | "PACKAGE-ERROR" | "STREAM-ERROR" | "PACKAGE-LOCK-VIOLATION" |
        "DIVISION-BY-ZERO" | "UNBOUND-VARIABLE" | "UNDEFINED-FUNCTION" => {
            &["ERROR", "SERIOUS-CONDITION", "CONDITION", "SIMPLE-ERROR", "SIMPLE-CONDITION", "T"]
        }
        _ => return None,
    };
    Some(supers.iter().map(|s| s.to_string()).collect())
}

fn ensure_builtin_class(name: &str) -> Option<*const Class> {
    let canon = normalize_type_name(name);
    if let Some(ptr) = find_class(&canon) {
        if !ptr.is_null() {
            let existing_name = unsafe { (&*ptr).name() };
            if normalize_type_name(existing_name) == canon {
                return Some(ptr);
            }
        }
    }
    let supers = builtin_class_superclasses(&canon)?;
    let class_obj = if supers.is_empty() {
        Class::allocate(canon.clone(), Vec::new())
    } else {
        Class::allocate_with_superclasses(canon.clone(), Vec::new(), supers)
    };
    class_obj.as_class_ptr()
}

fn parse_type_spec(obj: LispObject) -> Option<TypeSpec> {
    let obj = maybe_unquote(obj);

    if let Some(sym_name) = symbol_name_if_symbol(obj) {
        return Some(TypeSpec::Symbol(normalize_type_name(&sym_name)));
    }

    if let Some(class_ptr) = obj.as_class_ptr() {
        if !class_ptr.is_null() && (class_ptr as usize) >= 0x1000 {
            let class = unsafe { &*class_ptr };
            return Some(TypeSpec::Symbol(normalize_type_name(class.name())));
        }
    }

    let cons_ptr = obj.as_cons_ptr()?;
    let cons = unsafe { &*cons_ptr };
    let head_name = normalize_type_name(&symbol_name_if_symbol(cons.car())?);
    if head_name != "SIMPLE-ARRAY" {
        return None;
    }

    let tail_ptr = cons.cdr().as_cons_ptr()?;
    let tail = unsafe { &*tail_ptr };
    let element_type = normalize_type_name(&symbol_name_if_symbol(tail.car())?);

    let mut dim: Option<i64> = None;
    if let Some(dim_list_ptr) = tail.cdr().as_cons_ptr() {
        let dim_list = unsafe { &*dim_list_ptr };
        let dims_obj = maybe_unquote(dim_list.car());
        if let Some(dims_cons_ptr) = dims_obj.as_cons_ptr() {
            let dims_cons = unsafe { &*dims_cons_ptr };
            let first_dim = dims_cons.car();
            if let Some(n) = first_dim.as_fixnum() {
                dim = Some(n);
            } else if let Some(sym) = symbol_name_if_symbol(first_dim) {
                if normalize_type_name(&sym) == "*" {
                    dim = None;
                }
            }
        } else if let Some(n) = dims_obj.as_fixnum() {
            dim = Some(n);
        }
    }

    Some(TypeSpec::SimpleArray { element_type, dim })
}

fn type_spec_is_subtype(lhs: &TypeSpec, rhs: &TypeSpec) -> bool {
    let is_element_subtype = |a: &str, b: &str| -> bool {
        if a == b {
            true
        } else if (b == "CHARACTER" && a == "BASE-CHAR")
            || (b == "BASE-CHAR" && a == "CHARACTER")
        {
            true
        } else {
            false
        }
    };

    match (lhs, rhs) {
        (_, TypeSpec::Symbol(s)) if s == "T" => true,
        (TypeSpec::Symbol(a), TypeSpec::Symbol(b)) => symbol_subtype_of(a, b),
        (
            TypeSpec::SimpleArray {
                element_type: a_el,
                dim: a_dim,
            },
            TypeSpec::SimpleArray {
                element_type: b_el,
                dim: b_dim,
            },
        ) => {
            let dims_ok = match b_dim {
                None => true,
                Some(bn) => a_dim == &Some(*bn),
            };
            dims_ok && is_element_subtype(a_el, b_el)
        }
        (
            TypeSpec::SimpleArray { .. },
            TypeSpec::Symbol(s),
        ) if s == "STRING" || s == "SIMPLE-STRING" => true,
        _ => false,
    }
}

fn symbol_subtype_of(lhs: &str, rhs: &str) -> bool {
    if lhs == rhs || rhs == "T" {
        return true;
    }
    let Some(supers) = builtin_class_superclasses(lhs) else {
        return false;
    };
    supers.iter().any(|s| s == rhs)
}

/// Helper: Create a symbol from a string
fn make_symbol(name: &str) -> usize {
    use rlasp_runtime::Symbol;
    let sym = Symbol::allocate(name.to_string());
    sym.raw()
}

/// Helper: Create a list of symbols from a slice of strings
fn make_symbol_list(strings: &[String]) -> usize {
    use rlasp_runtime::Cons;

    if strings.is_empty() {
        return LispObject::nil().raw();
    }

    // Build list from back to front
    let mut result = LispObject::nil();
    for s in strings.iter().rev() {
        let sym = make_symbol(s);
        let sym_obj = unsafe { LispObject::from_raw(sym) };
        result = Cons::allocate(sym_obj, result);
    }

    result.raw()
}

//============================================================================
// Stack-Based Generic Function Dispatch
//============================================================================

/// Execute a generic function call using stack-based calling convention.
/// Arguments are already on the stack - we peek at the first to determine class,
/// find the applicable method, and call it (which expects arguments on stack).
/// num_args: the number of arguments on the stack
pub fn execute_stack_based_dispatch(gf_name: &str, num_args: usize) {
    use crate::intrinsics::get_registry;

    // If no arguments, we can't dispatch - just push nil
    if num_args == 0 {
        stack_push_nil();
        return;
    }

    // Peek at the first argument to determine its class (don't pop yet - method will pop it)
    let arg_raw = stack_pop_pointer();
    let arg_obj = unsafe { LispObject::from_raw(arg_raw) };

    // Get the class of the argument
    let arg_class = get_class_of_object(arg_obj);
    if trace_generic_enabled() {
        eprintln!(
            "[generic dispatch] gf={} arg_class={} num_args={}",
            gf_name, arg_class, num_args
        );
    }

    // Push the argument back for the method to consume
    stack_push_pointer(arg_raw);

    // Find applicable methods
    let registry = get_generic_registry().lock().unwrap();
    let gf = match registry.get(gf_name) {
        Some(gf) => gf,
        None => {
            if trace_generic_enabled() {
                let keys: Vec<String> = registry.keys().cloned().collect();
                eprintln!("[generic dispatch] gf missing={} known={:?}", gf_name, keys);
            }
            // Generic function not found - clean up all arguments and push nil
            drop(registry);
            for _ in 0..num_args {
                let _ = stack_pop_pointer();
            }
            stack_push_nil();
            return;
        }
    };

    // Find matching primary method based on specializer
    let mut best_method: Option<&Method> = None;
    for method in &gf.methods {
        if trace_generic_enabled() {
            eprintln!(
                "[generic candidate] gf={} qualifier={:?} specializers={:?}",
                gf_name, method.qualifier, method.specializers
            );
        }
        if method.qualifier == MethodQualifier::Primary {
            // Check if specializer matches
            if method.specializers.is_empty() {
                if best_method.is_none() {
                    best_method = Some(method);
                }
            } else if let Some(spec) = method.specializers.first() {
                if spec.eq_ignore_ascii_case(&arg_class) {
                    // Exact match - this is the best
                    best_method = Some(method);
                    break;
                } else if spec.eq_ignore_ascii_case("T") || is_class_subtype(&arg_class, spec) {
                    // Superclass match - use if no better match yet
                    if best_method.is_none() {
                        best_method = Some(method);
                    }
                }
            }
        }
    }

    if let Some(method) = best_method {
        if trace_generic_enabled() {
            eprintln!(
                "[generic selected] gf={} specializers={:?} fn_ref=0x{:x}",
                gf_name, method.specializers, method.function_ptr
            );
        }
        // The function_ptr in Method is a lambda reference from cc_make_lambda_ref_str
        // which contains the function name. We need to extract the name and look up
        // the actual function address in the registry.
        let func_ref = method.function_ptr;
        drop(registry); // Release lock before calling

        // Extract function name from lambda reference using the public helper
        use crate::intrinsics::extract_function_name;
        let func_name = match extract_function_name(func_ref) {
            Some(name) => name,
            None => {
                debug_println!("[DEBUG] Could not extract function name from lambda ref");
                // Clean up all arguments
                for _ in 0..num_args {
                    let _ = stack_pop_pointer();
                }
                stack_push_nil();
                return;
            }
        };

        // Look up the function in the function registry by name
        let func_registry = get_registry().lock().unwrap();
        if let Some(entry) = func_registry.get(&func_name) {
            let address = entry.address;
            drop(func_registry); // Release lock before calling
            unsafe {
                // Call the method using stack-based calling convention
                let f: extern "C" fn() = std::mem::transmute(address);
                f();
            }
        } else {
            // Method function not found in registry
            drop(func_registry);
            debug_println!("[DEBUG] Method '{}' not found in registry", func_name);
            // Clean up all arguments
            for _ in 0..num_args {
                let _ = stack_pop_pointer();
            }
            stack_push_nil();
        }
    } else {
        // No applicable method found
        if trace_generic_enabled() {
            eprintln!("[generic no-method] gf={} arg_class={}", gf_name, arg_class);
        }
        drop(registry);
        debug_println!("[DEBUG] No applicable method found for generic function '{}'", gf_name);
        // Clean up all arguments
        for _ in 0..num_args {
            let _ = stack_pop_pointer();
        }
        let err = rlasp_runtime::LispError::allocate(
            rlasp_runtime::error::ErrorKind::UndefinedFunction,
            Some(format!("No applicable method for generic function '{}'", gf_name)),
        );
        stack_push_pointer(err.raw());
    }
}

/// Get the class name of an object
fn get_class_of_object(obj: LispObject) -> String {
    use rlasp_runtime::header::{ObjectType, TypeHeader};

    // Check general heap objects by runtime header.
    if obj.is_general() {
        let raw_ptr = obj.as_general_ptr_unchecked::<u8>();
        if !raw_ptr.is_null() {
            if let Some(obj_type) = unsafe { TypeHeader::from_ptr(raw_ptr as *const _) } {
                match obj_type {
                    ObjectType::Symbol => return "SYMBOL".to_string(),
                    ObjectType::String => return "STRING".to_string(),
                    ObjectType::Vector => return "VECTOR".to_string(),
                    ObjectType::Number => return "NUMBER".to_string(),
                    _ => {}
                }
            }
        }
    }

    // Check for built-in types
    if obj.is_nil() {
        "NULL".to_string()
    } else if obj.as_fixnum().is_some() {
        "FIXNUM".to_string()
    } else if obj.as_cons_ptr().is_some() {
        "CONS".to_string()
    } else {
        "T".to_string()
    }
}

/// Check if a class is a subtype of another (simple parent check)
fn is_class_subtype(child_class: &str, parent_class: &str) -> bool {
    fn normalize(name: &str) -> String {
        name.rsplit(':').next().unwrap_or(name).to_uppercase()
    }

    let child = normalize(child_class);
    let parent = normalize(parent_class);

    if child == parent {
        return true;
    }
    if parent == "T" {
        return true;
    }

    // Built-in subtype relationships.
    if child == "NULL" {
        if matches!(parent.as_str(), "SYMBOL" | "LIST" | "SEQUENCE" | "BOOLEAN" | "ATOM") {
            return true;
        }
    }
    if child == "CONS" {
        if matches!(parent.as_str(), "LIST" | "SEQUENCE") {
            return true;
        }
    }
    if child == "FIXNUM" {
        if matches!(parent.as_str(), "INTEGER" | "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if child == "BIGNUM" {
        if matches!(parent.as_str(), "INTEGER" | "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if child == "INTEGER" {
        if matches!(parent.as_str(), "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if child == "RATIO" {
        if matches!(parent.as_str(), "RATIONAL" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if child == "RATIONAL" {
        if matches!(parent.as_str(), "REAL" | "NUMBER") {
            return true;
        }
    }
    if matches!(child.as_str(), "FLOAT" | "SINGLE-FLOAT" | "DOUBLE-FLOAT" | "SHORT-FLOAT" | "LONG-FLOAT") {
        if matches!(parent.as_str(), "FLOAT" | "REAL" | "NUMBER") {
            return true;
        }
    }
    if child == "COMPLEX" && parent == "NUMBER" {
        return true;
    }
    if child == "STRING" {
        if matches!(parent.as_str(), "VECTOR" | "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if child == "SIMPLE-STRING" {
        if matches!(parent.as_str(), "STRING" | "VECTOR" | "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if child == "VECTOR" {
        if matches!(parent.as_str(), "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if child == "SIMPLE-VECTOR" {
        if matches!(parent.as_str(), "VECTOR" | "SEQUENCE" | "ARRAY") {
            return true;
        }
    }
    if child == "KEYWORD" && parent == "SYMBOL" {
        return true;
    }

    // Check class hierarchy
    let superclasses: Option<Vec<String>> = {
        let class_registry = get_class_registry().lock().unwrap();
        if let Some(&class_ptr) = class_registry.get(&child) {
            let class = unsafe { &*class_ptr };
            Some(class.direct_superclasses().iter().map(|s| s.to_string()).collect())
        } else {
            None
        }
    };

    if let Some(supers) = superclasses {
        for super_name in supers {
            if is_class_subtype(&super_name, &parent) {
                return true;
            }
        }
    }

    false
}
