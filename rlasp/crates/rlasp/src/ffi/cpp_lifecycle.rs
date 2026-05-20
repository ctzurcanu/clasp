use std::collections::HashMap;
use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::sync::Mutex;

#[derive(Debug, Clone)]
pub enum CppArg {
    Int(i64),
    Float(f64),
    String(String),
    Handle(i64),
    Nil,
}

#[derive(Debug, Clone)]
pub enum CppValue {
    Int(i64),
    Float(f64),
    String(String),
    Handle(i64),
    Nil,
}

enum CppObject {
    TestClass(*mut ()),
    Vector(*mut ()),
}

unsafe impl Send for CppObject {}

struct CppManager {
    next_handle: i64,
    objects: HashMap<i64, CppObject>,
}

impl CppManager {
    fn new() -> Self {
        Self {
            next_handle: 1,
            objects: HashMap::new(),
        }
    }

    fn alloc_handle(&mut self, object: CppObject) -> i64 {
        let handle = self.next_handle;
        self.next_handle += 1;
        self.objects.insert(handle, object);
        handle
    }
}

lazy_static::lazy_static! {
    static ref CPP_MANAGER: Mutex<CppManager> = Mutex::new(CppManager::new());
}

fn canonical_name(raw: &str) -> String {
    let base = raw.rsplit(':').next().unwrap_or(raw).trim();
    base.chars()
        .filter(|c| !matches!(c, '-' | '_' | ':'))
        .flat_map(|c| c.to_lowercase())
        .collect::<String>()
}

fn arg_to_i64(arg: &CppArg, label: &str) -> Result<i64, String> {
    match arg {
        CppArg::Int(v) => Ok(*v),
        CppArg::Float(v) if v.fract() == 0.0 => Ok(*v as i64),
        _ => Err(format!("{} must be an integer", label)),
    }
}

fn arg_to_f64(arg: &CppArg, label: &str) -> Result<f64, String> {
    match arg {
        CppArg::Int(v) => Ok(*v as f64),
        CppArg::Float(v) => Ok(*v),
        _ => Err(format!("{} must be numeric", label)),
    }
}

fn arg_to_string(arg: &CppArg, label: &str) -> Result<String, String> {
    match arg {
        CppArg::String(s) => Ok(s.clone()),
        CppArg::Int(v) => Ok(v.to_string()),
        CppArg::Float(v) => Ok(v.to_string()),
        _ => Err(format!("{} must be a string", label)),
    }
}

pub fn new_object(class_name: &str, ctor_args: &[CppArg]) -> Result<i64, String> {
    let class = canonical_name(class_name);
    let mut mgr = CPP_MANAGER
        .lock()
        .map_err(|_| "cpp manager poisoned".to_string())?;

    match class.as_str() {
        "testclass" => {
            let value = if let Some(arg) = ctor_args.get(0) {
                arg_to_i64(arg, "test-class constructor value")? as i32
            } else {
                0
            };
            let name = if let Some(arg) = ctor_args.get(1) {
                arg_to_string(arg, "test-class constructor name")?
            } else {
                String::new()
            };
            let c_name = CString::new(name).map_err(|_| "name contains NUL byte".to_string())?;
            let ptr = unsafe { test_class_new(value, c_name.as_ptr()) };
            if ptr.is_null() {
                return Err("cpp-new failed to create TestClass".to_string());
            }
            Ok(mgr.alloc_handle(CppObject::TestClass(ptr)))
        }
        "vector" => {
            let x = if let Some(arg) = ctor_args.get(0) {
                arg_to_f64(arg, "vector constructor x")?
            } else {
                0.0
            };
            let y = if let Some(arg) = ctor_args.get(1) {
                arg_to_f64(arg, "vector constructor y")?
            } else {
                0.0
            };
            let ptr = unsafe { vector_new(x, y) };
            if ptr.is_null() {
                return Err("cpp-new failed to create Vector".to_string());
            }
            Ok(mgr.alloc_handle(CppObject::Vector(ptr)))
        }
        _ => Err(format!("cpp-new unsupported C++ class '{}'", class_name)),
    }
}

pub fn delete_object(handle: i64) -> Result<(), String> {
    let mut mgr = CPP_MANAGER
        .lock()
        .map_err(|_| "cpp manager poisoned".to_string())?;
    let object = mgr
        .objects
        .remove(&handle)
        .ok_or_else(|| format!("cpp-delete unknown handle {}", handle))?;

    match object {
        CppObject::TestClass(ptr) => unsafe { test_class_delete(ptr) },
        CppObject::Vector(ptr) => unsafe { vector_delete(ptr) },
    }
    Ok(())
}

pub fn call_method(handle: i64, method_name: &str, args: &[CppArg]) -> Result<CppValue, String> {
    let mut mgr = CPP_MANAGER
        .lock()
        .map_err(|_| "cpp manager poisoned".to_string())?;
    let (is_test_class, ptr) = match mgr.objects.get(&handle) {
        Some(CppObject::TestClass(ptr)) => (true, *ptr),
        Some(CppObject::Vector(ptr)) => (false, *ptr),
        None => return Err(format!("cpp-call-method unknown handle {}", handle)),
    };
    let method = canonical_name(method_name);

    if is_test_class {
        match method.as_str() {
            "getvalue" => Ok(CppValue::Int(unsafe { test_class_get_value(ptr) as i64 })),
            "setvalue" => {
                let value = arg_to_i64(
                    args.get(0)
                        .ok_or_else(|| "set-value requires value argument".to_string())?,
                    "set-value argument",
                )? as i32;
                unsafe { test_class_set_value(ptr, value) };
                Ok(CppValue::Int(value as i64))
            }
            "getname" => {
                let name_ptr = unsafe { test_class_get_name(ptr) };
                if name_ptr.is_null() {
                    return Ok(CppValue::String(String::new()));
                }
                let name = unsafe { CStr::from_ptr(name_ptr) }
                    .to_string_lossy()
                    .to_string();
                Ok(CppValue::String(name))
            }
            "setname" => {
                let name = arg_to_string(
                    args.get(0)
                        .ok_or_else(|| "set-name requires name argument".to_string())?,
                    "set-name argument",
                )?;
                let c_name =
                    CString::new(name).map_err(|_| "name contains NUL byte".to_string())?;
                unsafe { test_class_set_name(ptr, c_name.as_ptr()) };
                Ok(CppValue::Nil)
            }
            "add" => {
                let value = arg_to_i64(
                    args.get(0)
                        .ok_or_else(|| "add requires integer argument".to_string())?,
                    "add argument",
                )? as i32;
                Ok(CppValue::Int(unsafe { test_class_add(ptr, value) as i64 }))
            }
            _ => Err(format!("unknown TestClass method '{}'", method_name)),
        }
    } else {
        match method.as_str() {
            "getx" => Ok(CppValue::Float(unsafe { vector_getX(ptr) })),
            "gety" => Ok(CppValue::Float(unsafe { vector_getY(ptr) })),
            "setx" => {
                let x = arg_to_f64(
                    args.get(0)
                        .ok_or_else(|| "set-x requires value argument".to_string())?,
                    "set-x argument",
                )?;
                unsafe { vector_setX(ptr, x) };
                Ok(CppValue::Float(x))
            }
            "sety" => {
                let y = arg_to_f64(
                    args.get(0)
                        .ok_or_else(|| "set-y requires value argument".to_string())?,
                    "set-y argument",
                )?;
                unsafe { vector_setY(ptr, y) };
                Ok(CppValue::Float(y))
            }
            "length" => Ok(CppValue::Float(unsafe { vector_length(ptr) })),
            "add" => {
                let other_handle = match args.get(0) {
                    Some(CppArg::Handle(h)) => *h,
                    Some(CppArg::Int(h)) => *h,
                    Some(other) => {
                        return Err(format!(
                            "vector add requires handle argument, got {:?}",
                            other
                        ));
                    }
                    None => return Err("vector add requires another vector handle".to_string()),
                };
                let other_ptr = match mgr.objects.get(&other_handle) {
                    Some(CppObject::Vector(v)) => *v,
                    Some(_) => return Err("vector add requires another vector handle".to_string()),
                    None => return Err(format!("unknown vector handle {}", other_handle)),
                };
                let result_ptr = unsafe { vector_add(ptr, other_ptr) };
                if result_ptr.is_null() {
                    return Err("vector add returned null".to_string());
                }
                let new_handle = mgr.alloc_handle(CppObject::Vector(result_ptr));
                Ok(CppValue::Handle(new_handle))
            }
            _ => Err(format!("unknown Vector method '{}'", method_name)),
        }
    }
}

extern "C" {
    fn test_class_new(value: i32, name: *const c_char) -> *mut ();
    fn test_class_delete(ptr: *mut ());
    fn test_class_get_value(ptr: *const ()) -> i32;
    fn test_class_set_value(ptr: *mut (), value: i32);
    fn test_class_get_name(ptr: *mut ()) -> *const c_char;
    fn test_class_set_name(ptr: *mut (), name: *const c_char);
    fn test_class_add(ptr: *const (), x: i32) -> i32;

    fn vector_new(x: f64, y: f64) -> *mut ();
    fn vector_delete(ptr: *mut ());
    fn vector_getX(ptr: *const ()) -> f64;
    fn vector_getY(ptr: *const ()) -> f64;
    fn vector_setX(ptr: *mut (), x: f64);
    fn vector_setY(ptr: *mut (), y: f64);
    fn vector_length(ptr: *const ()) -> f64;
    fn vector_add(ptr: *const (), other: *const ()) -> *mut ();
}
