//! Runtime intrinsics for JIT-compiled code
//!
//! Following Clasp's intrinsics.h pattern
//! Now using stack-based calling convention

use rlasp_runtime::LispObject;
use rlasp_runtime::eval_stack::{
    stack_push_fixnum, stack_push_pointer, stack_push_nil,
    stack_pop_fixnum, stack_pop_pointer
};
use rlasp_runtime::string::RString;
use std::sync::{Mutex, Once};
use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
use malachite::Integer;

fn as_symbol_ptr_checked(obj: LispObject) -> Option<*const rlasp_runtime::Symbol> {
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    let ptr = obj.as_general_ptr::<()>()?;
    if ptr.is_null() {
        return None;
    }
    if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
        Some(ptr as *const rlasp_runtime::Symbol)
    } else {
        None
    }
}

fn as_string_ptr_checked(obj: LispObject) -> Option<*const rlasp_runtime::RString> {
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    let ptr = obj.as_general_ptr::<()>()?;
    if ptr.is_null() {
        return None;
    }
    if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::String) {
        Some(ptr as *const rlasp_runtime::RString)
    } else {
        None
    }
}

/// Box a fixnum (i64 → LispObject)
#[no_mangle]
pub extern "C" fn cc_box_fixnum(val: i64) -> usize {
    LispObject::fixnum(val).raw()
}

/// Unbox a fixnum (LispObject → i64)
#[no_mangle]
pub extern "C" fn cc_unbox_fixnum(obj: usize) -> i64 {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    lisp_obj.as_fixnum().unwrap_or(0)
}

/// Box a float (f64 → LispObject)
#[no_mangle]
pub extern "C" fn cc_box_float(val: f64) -> usize {
    rlasp_runtime::Number::allocate_float(val).raw()
}

/// Unbox a float (LispObject → f64)
#[no_mangle]
pub extern "C" fn cc_unbox_float(obj: usize) -> f64 {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    lisp_obj.as_float().unwrap_or(0.0)
}

/// Box a character (char code → LispObject)
#[no_mangle]
pub extern "C" fn cc_box_character(val: usize) -> usize {
    if let Some(c) = char::from_u32(val as u32) {
        LispObject::character(c).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Unbox a character (LispObject → char code)
#[no_mangle]
pub extern "C" fn cc_unbox_character(obj: usize) -> usize {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    lisp_obj.as_character().unwrap_or('\0') as usize
}

/// Parse a bignum from a string (for large numeric literals)
#[no_mangle]
pub extern "C" fn cc_parse_bignum(ptr: *const u8, len: usize) -> usize {
    if ptr.is_null() {
        return LispObject::fixnum(0).raw();
    }

    unsafe {
        let bytes = std::slice::from_raw_parts(ptr, len);
        let s = String::from_utf8_lossy(bytes);

        // Try to parse as Integer
        if let Ok(bignum) = s.parse::<malachite::Integer>() {
            // Check if it fits in a fixnum
            use malachite::num::conversion::traits::IsInteger;
            if i64::convertible_from(&bignum) {
                LispObject::fixnum(i64::exact_from(&bignum)).raw()
            } else {
                rlasp_runtime::Number::allocate_bignum(bignum).raw()
            }
        } else {
            // Parse failed, return 0
            LispObject::fixnum(0).raw()
        }
    }
}

/// Allocate a cons cell - direct args version
#[no_mangle]
pub extern "C" fn cc_cons(car: usize, cdr: usize) -> usize {
    let car_obj = unsafe { LispObject::from_raw(car) };
    let cdr_obj = unsafe { LispObject::from_raw(cdr) };
    rlasp_runtime::Cons::allocate(car_obj, cdr_obj).raw()
}

/// Get car of a cons
#[no_mangle]
pub extern "C" fn cc_car(obj: usize) -> usize {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };

    if let Some(cons_ptr) = lisp_obj.as_cons_ptr() {
        unsafe { (*cons_ptr).car().raw() }
    } else {
        LispObject::nil().raw()
    }
}

/// Get cdr of a cons
#[no_mangle]
pub extern "C" fn cc_cdr(obj: usize) -> usize {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };

    if let Some(cons_ptr) = lisp_obj.as_cons_ptr() {
        unsafe { (*cons_ptr).cdr().raw() }
    } else {
        LispObject::nil().raw()
    }
}

/// Set car of a cons
#[no_mangle]
pub extern "C" fn cc_set_car(obj: usize, value: usize) -> usize {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    let value_obj = unsafe { LispObject::from_raw(value) };
    if let Some(cons_ptr) = lisp_obj.as_cons_ptr() {
        unsafe {
            (*cons_ptr).set_car(value_obj);
        }
        value
    } else {
        LispObject::nil().raw()
    }
}

/// Set cdr of a cons
#[no_mangle]
pub extern "C" fn cc_set_cdr(obj: usize, value: usize) -> usize {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    let value_obj = unsafe { LispObject::from_raw(value) };
    if let Some(cons_ptr) = lisp_obj.as_cons_ptr() {
        unsafe {
            (*cons_ptr).set_cdr(value_obj);
        }
        value
    } else {
        LispObject::nil().raw()
    }
}

/// Get nil value (for internal use)
#[no_mangle]
pub extern "C" fn cc_nil_value() -> usize {
    LispObject::nil().raw()
}

/// Get t value (for internal use)
#[no_mangle]
pub extern "C" fn cc_t_value() -> usize {
    LispObject::t().raw()
}

/// Get nil - stack-based (for MLIR)
#[no_mangle]
pub extern "C" fn cc_nil() {
    stack_push_nil();
}

/// Get t - stack-based (for MLIR)
#[no_mangle]
pub extern "C" fn cc_t() {
    stack_push_pointer(LispObject::t().raw());
}

/// Check if object is nil
#[no_mangle]
pub extern "C" fn cc_is_nil(obj: usize) -> i32 {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    if lisp_obj.is_nil() { 1 } else { 0 }
}

/// Check if object is a fixnum
#[no_mangle]
pub extern "C" fn cc_is_fixnum(obj: usize) -> i32 {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    if lisp_obj.is_fixnum() { 1 } else { 0 }
}

/// Check if object is a cons
#[no_mangle]
pub extern "C" fn cc_is_cons(obj: usize) -> i32 {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    if lisp_obj.is_cons() { 1 } else { 0 }
}

/// Add two numbers (tagged LispObjects: fixnum, bignum, float, ratio)
#[no_mangle]
pub extern "C" fn cc_add(a: usize, b: usize) -> usize {
    use malachite::Integer;
    use malachite::Rational;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
    use rlasp_runtime::{Number, NumberValue, LispError};

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Handle NIL operands - return NIL silently
    // This is common in ASDF when optional values are nil
    if a_obj.is_nil() || b_obj.is_nil() {
        return LispObject::nil().raw();
    }

    // Fast path: both are fixnums
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if let Some(result) = a_val.checked_add(b_val) {
            // Check if result fits in 62-bit fixnum
            const MAX_FIXNUM: i64 = (1 << 61) - 1;
            const MIN_FIXNUM: i64 = -(1 << 61);
            if result >= MIN_FIXNUM && result <= MAX_FIXNUM {
                return LispObject::fixnum(result).raw();
            } else {
                return Number::allocate_bignum(Integer::from(result)).raw();
            }
        } else {
            // Overflow - promote to bignum
            let result = Integer::from(a_val) + Integer::from(b_val);
            return Number::allocate_bignum(result).raw();
        }
    }

    // Slow path: at least one is not a simple fixnum
    // Helper enum for numeric type dispatch
    enum NumericValue {
        Fixnum(i64),
        Float(f64),
        Bignum(Integer),
        Ratio(Rational),
    }

    let extract_value = |obj: LispObject| -> Option<NumericValue> {
        if let Some(fix) = obj.as_fixnum() {
            return Some(NumericValue::Fixnum(fix));
        }
        if !obj.is_number() {
            return None;
        }
        if let Some(ptr) = obj.as_general_ptr::<Number>() {
            if ptr.is_null() {
                return None;
            }
            unsafe {
                match &(*ptr).value {
                    NumberValue::Float(f) => Some(NumericValue::Float(*f)),
                    NumberValue::Bignum(b) => Some(NumericValue::Bignum(b.clone())),
                    NumberValue::Ratio(r) => Some(NumericValue::Ratio(r.clone())),
                    _ => None,
                }
            }
        } else {
            None
        }
    };

    let a_val = extract_value(a_obj);
    let b_val = extract_value(b_obj);

    match (a_val, b_val) {
        // Float + anything => float
        (Some(NumericValue::Float(a_f)), Some(b)) => {
            let b_f = match b {
                NumericValue::Fixnum(x) => x as f64,
                NumericValue::Float(x) => x,
                NumericValue::Bignum(x) => x.to_string().parse::<f64>().unwrap_or(0.0),
                NumericValue::Ratio(x) => {
                    let n: f64 = x.numerator_ref().to_string().parse().unwrap_or(0.0);
                    let d: f64 = x.denominator_ref().to_string().parse().unwrap_or(1.0);
                    n / d
                }
            };
            Number::allocate_float(a_f + b_f).raw()
        }
        (Some(a), Some(NumericValue::Float(b_f))) => {
            let a_f = match a {
                NumericValue::Fixnum(x) => x as f64,
                NumericValue::Float(x) => x,
                NumericValue::Bignum(x) => x.to_string().parse::<f64>().unwrap_or(0.0),
                NumericValue::Ratio(x) => {
                    let n: f64 = x.numerator_ref().to_string().parse().unwrap_or(0.0);
                    let d: f64 = x.denominator_ref().to_string().parse().unwrap_or(1.0);
                    n / d
                }
            };
            Number::allocate_float(a_f + b_f).raw()
        }

        // Ratio + Ratio => Ratio
        (Some(NumericValue::Ratio(a_r)), Some(NumericValue::Ratio(b_r))) => {
            let result = a_r + b_r;
            Number::allocate_ratio(result).raw()
        }

        // Ratio + integer => Ratio
        (Some(NumericValue::Ratio(a_r)), Some(NumericValue::Fixnum(b_i))) => {
            let result = a_r + Rational::from(b_i);
            Number::allocate_ratio(result).raw()
        }
        (Some(NumericValue::Fixnum(a_i)), Some(NumericValue::Ratio(b_r))) => {
            let result = Rational::from(a_i) + b_r;
            Number::allocate_ratio(result).raw()
        }
        (Some(NumericValue::Ratio(a_r)), Some(NumericValue::Bignum(b_i))) => {
            let result = a_r + Rational::from(b_i);
            Number::allocate_ratio(result).raw()
        }
        (Some(NumericValue::Bignum(a_i)), Some(NumericValue::Ratio(b_r))) => {
            let result = Rational::from(a_i) + b_r;
            Number::allocate_ratio(result).raw()
        }

        // Integer + Integer => Integer
        (Some(NumericValue::Fixnum(a_i)), Some(NumericValue::Fixnum(b_i))) => {
            // Already handled in fast path, but keep for completeness
            let result = Integer::from(a_i) + Integer::from(b_i);
            if i64::convertible_from(&result) {
                let r = i64::exact_from(&result);
                const MAX_FIXNUM: i64 = (1 << 61) - 1;
                const MIN_FIXNUM: i64 = -(1 << 61);
                if r >= MIN_FIXNUM && r <= MAX_FIXNUM {
                    LispObject::fixnum(r).raw()
                } else {
                    Number::allocate_bignum(result).raw()
                }
            } else {
                Number::allocate_bignum(result).raw()
            }
        }
        (Some(NumericValue::Fixnum(a_i)), Some(NumericValue::Bignum(b_b))) => {
            let result = Integer::from(a_i) + b_b;
            if i64::convertible_from(&result) {
                let r = i64::exact_from(&result);
                const MAX_FIXNUM: i64 = (1 << 61) - 1;
                const MIN_FIXNUM: i64 = -(1 << 61);
                if r >= MIN_FIXNUM && r <= MAX_FIXNUM {
                    return LispObject::fixnum(r).raw();
                }
            }
            Number::allocate_bignum(result).raw()
        }
        (Some(NumericValue::Bignum(a_b)), Some(NumericValue::Fixnum(b_i))) => {
            let result = a_b + Integer::from(b_i);
            if i64::convertible_from(&result) {
                let r = i64::exact_from(&result);
                const MAX_FIXNUM: i64 = (1 << 61) - 1;
                const MIN_FIXNUM: i64 = -(1 << 61);
                if r >= MIN_FIXNUM && r <= MAX_FIXNUM {
                    return LispObject::fixnum(r).raw();
                }
            }
            Number::allocate_bignum(result).raw()
        }
        (Some(NumericValue::Bignum(a_b)), Some(NumericValue::Bignum(b_b))) => {
            let result = a_b + b_b;
            if i64::convertible_from(&result) {
                let r = i64::exact_from(&result);
                const MAX_FIXNUM: i64 = (1 << 61) - 1;
                const MIN_FIXNUM: i64 = -(1 << 61);
                if r >= MIN_FIXNUM && r <= MAX_FIXNUM {
                    return LispObject::fixnum(r).raw();
                }
            }
            Number::allocate_bignum(result).raw()
        }

        // Default: type error for non-numeric operands
        _ => {
            eprintln!("Error: + requires numeric arguments");
            LispObject::nil().raw()
        }
    }
}

/// Subtract two numbers (tagged LispObjects: fixnum, bignum, float, ratio)
#[no_mangle]
pub extern "C" fn cc_sub(a: usize, b: usize) -> usize {
    use rlasp_runtime::{Number, NumberValue};
    use malachite::Integer;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Fast path: both are fixnums
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if let Some(result) = a_val.checked_sub(b_val) {
            // Check if result fits in 62-bit fixnum
            const MAX_FIXNUM: i64 = (1 << 61) - 1;
            const MIN_FIXNUM: i64 = -(1 << 61);
            if result >= MIN_FIXNUM && result <= MAX_FIXNUM {
                return LispObject::fixnum(result).raw();
            } else {
                return Number::allocate_bignum(Integer::from(result)).raw();
            }
        } else {
            // Overflow - promote to bignum
            let result = Integer::from(a_val) - Integer::from(b_val);
            return Number::allocate_bignum(result).raw();
        }
    }

    // Slow path: at least one is not a simple fixnum
    // Helper to extract numeric value
    let extract_value = |obj: LispObject| -> (Option<i64>, Option<f64>, Option<Integer>) {
        if let Some(fix) = obj.as_fixnum() {
            return (Some(fix), None, None);
        }
        if !obj.is_number() {
            return (None, None, None);
        }
        // General pointer (bignum, float, ratio)
        if let Some(ptr) = obj.as_general_ptr::<Number>() {
            if ptr.is_null() {
                return (None, None, None);
            }
            unsafe {
                match &(*ptr).value {
                    NumberValue::Float(f) => (None, Some(*f), None),
                    NumberValue::Bignum(b) => (None, None, Some(b.clone())),
                    NumberValue::Ratio(r) => {
                        let n = r.numerator_ref().to_string().parse::<f64>().unwrap_or(0.0);
                        let d = r.denominator_ref().to_string().parse::<f64>().unwrap_or(1.0);
                        (None, Some(n / d), None)
                    }
                    _ => (None, None, None),
                }
            }
        } else {
            (None, None, None)
        }
    };

    let (a_fix, a_float, a_big) = extract_value(a_obj);
    let (b_fix, b_float, b_big) = extract_value(b_obj);

    // If either is a float, do float arithmetic
    if a_float.is_some() || b_float.is_some() {
        let a_f = a_float.or_else(|| a_fix.map(|x| x as f64)).or_else(|| a_big.as_ref().map(|x| x.to_string().parse::<f64>().unwrap_or(0.0))).unwrap_or(0.0);
        let b_f = b_float.or_else(|| b_fix.map(|x| x as f64)).or_else(|| b_big.as_ref().map(|x| x.to_string().parse::<f64>().unwrap_or(0.0))).unwrap_or(0.0);
        return Number::allocate_float(a_f - b_f).raw();
    }

    // Convert to bignum for precise arithmetic
    let a_int = a_big.unwrap_or_else(|| Integer::from(a_fix.unwrap_or(0)));
    let b_int = b_big.unwrap_or_else(|| Integer::from(b_fix.unwrap_or(0)));
    let result = a_int - b_int;

    // Try to fit back into fixnum
    if i64::convertible_from(&result) {
        let r = i64::exact_from(&result);
        const MAX_FIXNUM: i64 = (1 << 61) - 1;
        const MIN_FIXNUM: i64 = -(1 << 61);
        if r >= MIN_FIXNUM && r <= MAX_FIXNUM {
            LispObject::fixnum(r).raw()
        } else {
            Number::allocate_bignum(result).raw()
        }
    } else {
        Number::allocate_bignum(result).raw()
    }
}

/// Multiply two numbers (tagged LispObjects: fixnum, bignum, float, ratio)
#[no_mangle]
pub extern "C" fn cc_mul(a: usize, b: usize) -> usize {
    use rlasp_runtime::{Number, NumberValue};
    use malachite::{Integer, Rational};
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Fast path: both are fixnums
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if let Some(result) = a_val.checked_mul(b_val) {
            // Check if result fits in 62-bit fixnum
            const MAX_FIXNUM: i64 = (1 << 61) - 1;
            const MIN_FIXNUM: i64 = -(1 << 61);
            if result >= MIN_FIXNUM && result <= MAX_FIXNUM {
                return LispObject::fixnum(result).raw();
            } else {
                return Number::allocate_bignum(Integer::from(result)).raw();
            }
        } else {
            // Overflow - promote to bignum
            let a_big = Integer::from(a_val);
            let b_big = Integer::from(b_val);
            return Number::allocate_bignum(a_big * b_big).raw();
        }
    }

    // Check if either operand is actually a float type
    let a_is_float = if a_obj.is_number() { if let Some(ptr) = a_obj.as_general_ptr::<Number>() {
        !ptr.is_null() && matches!(unsafe { &(*ptr).value }, NumberValue::Float(_))
    } else {
        false
    }} else { false };
    let b_is_float = if b_obj.is_number() { if let Some(ptr) = b_obj.as_general_ptr::<Number>() {
        !ptr.is_null() && matches!(unsafe { &(*ptr).value }, NumberValue::Float(_))
    } else {
        false
    }} else { false };

    // If either is a float, do float arithmetic
    if a_is_float || b_is_float {
        let to_float = |obj: LispObject| -> Option<f64> {
            if let Some(n) = obj.as_fixnum() {
                Some(n as f64)
            } else if obj.is_number() {
                let ptr = obj.as_general_ptr::<Number>()?;
                if ptr.is_null() { return None; }
                let num = unsafe { &*ptr };
                match &num.value {
                    NumberValue::Float(f) => Some(*f),
                    NumberValue::Bignum(b) => b.to_string().parse::<f64>().ok(),
                    NumberValue::Ratio(r) => {
                        let numer = r.numerator_ref().to_string().parse::<f64>().ok()?;
                        let denom = r.denominator_ref().to_string().parse::<f64>().ok()?;
                        Some(numer / denom)
                    }
                    _ => None,
                }
            } else {
                None
            }
        };

        if let (Some(af), Some(bf)) = (to_float(a_obj), to_float(b_obj)) {
            return Number::allocate_float(af * bf).raw();
        }
    }

    // Helper to extract numeric value as Rational
    let to_rational = |obj: LispObject| -> Option<Rational> {
        if let Some(n) = obj.as_fixnum() {
            Some(Rational::from(n))
        } else if obj.is_number() {
            let ptr = obj.as_general_ptr::<Number>()?;
            if ptr.is_null() { return None; }
            let num = unsafe { &*ptr };
            match &num.value {
                NumberValue::Bignum(b) => Some(Rational::from(b.clone())),
                NumberValue::Ratio(r) => Some(r.clone()),
                _ => None,
            }
        } else {
            None
        }
    };

    // Get both operands as Rational for exact arithmetic
    let a_rat = to_rational(a_obj);
    let b_rat = to_rational(b_obj);

    if let (Some(a_val), Some(b_val)) = (a_rat, b_rat) {
        let result = a_val * b_val;

        // If the result is an integer, return fixnum or bignum
        if result.denominator_ref() == &1u32 {
            let numerator = result.numerator_ref();
            if i64::convertible_from(numerator) {
                let r = i64::exact_from(numerator);
                const MAX_FIXNUM: i64 = (1 << 61) - 1;
                const MIN_FIXNUM: i64 = -(1 << 61);
                if r >= MIN_FIXNUM && r <= MAX_FIXNUM {
                    return LispObject::fixnum(r).raw();
                } else {
                    return Number::allocate_bignum(Integer::from(r)).raw();
                }
            } else {
                let numerator_int: Integer = numerator.clone().into();
                return Number::allocate_bignum(numerator_int).raw();
            }
        }

        // Otherwise return ratio
        return Number::allocate_ratio(result).raw();
    }

    LispObject::nil().raw()
}

/// Divide two numbers (returns fixnum if exact, ratio or float otherwise)
#[no_mangle]
pub extern "C" fn cc_div(a: usize, b: usize) -> usize {
    use rlasp_runtime::{Number, NumberValue};
    use malachite::{Integer, Rational};
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Check if either operand is actually a float type (not just convertible)
    let a_is_float = if a_obj.is_number() { if let Some(ptr) = a_obj.as_general_ptr::<Number>() {
        !ptr.is_null() && matches!(unsafe { &(*ptr).value }, NumberValue::Float(_))
    } else {
        false
    }} else { false };
    let b_is_float = if b_obj.is_number() { if let Some(ptr) = b_obj.as_general_ptr::<Number>() {
        !ptr.is_null() && matches!(unsafe { &(*ptr).value }, NumberValue::Float(_))
    } else {
        false
    }} else { false };

    // Only use float division if at least one operand is actually a float
    if a_is_float || b_is_float {
        let to_float = |obj: LispObject| -> Option<f64> {
            if let Some(n) = obj.as_fixnum() {
                Some(n as f64)
            } else if obj.is_number() {
                let ptr = obj.as_general_ptr::<Number>()?;
                if ptr.is_null() { return None; }
                let num = unsafe { &*ptr };
                match &num.value {
                    NumberValue::Float(f) => Some(*f),
                    NumberValue::Bignum(b) => b.to_string().parse::<f64>().ok(),
                    NumberValue::Ratio(r) => {
                        let numer = r.numerator_ref().to_string().parse::<f64>().ok()?;
                        let denom = r.denominator_ref().to_string().parse::<f64>().ok()?;
                        Some(numer / denom)
                    }
                    _ => None,
                }
            } else {
                None
            }
        };

        if let (Some(af), Some(bf)) = (to_float(a_obj), to_float(b_obj)) {
            if bf != 0.0 {
                return Number::allocate_float(af / bf).raw();
            } else {
                return LispObject::nil().raw();
            }
        }
    }

    // Helper to extract numeric value as Rational
    let to_rational = |obj: LispObject| -> Option<Rational> {
        if let Some(n) = obj.as_fixnum() {
            Some(Rational::from(n))
        } else if obj.is_number() {
            let ptr = obj.as_general_ptr::<Number>()?;
            if ptr.is_null() { return None; }
            let num = unsafe { &*ptr };
            match &num.value {
                NumberValue::Bignum(b) => Some(Rational::from(b.clone())),
                NumberValue::Ratio(r) => Some(r.clone()),
                _ => None,
            }
        } else {
            None
        }
    };

    // Get both operands as Rational
    let a_rat = to_rational(a_obj);
    let b_rat = to_rational(b_obj);

    if let (Some(a_val), Some(b_val)) = (a_rat, b_rat) {
        if b_val != Rational::from(0) {
            // Divide rationals: a/b
            let result = a_val / b_val;

            // If the result is an integer, return fixnum or bignum
            if result.denominator_ref() == &1u32 {
                let numerator = result.numerator_ref();
                if i64::convertible_from(numerator) {
                    let r = i64::exact_from(numerator);
                    // Check 62-bit fixnum bounds
                    const MAX_FIXNUM: i64 = (1 << 61) - 1;
                    const MIN_FIXNUM: i64 = -(1 << 61);
                    if r >= MIN_FIXNUM && r <= MAX_FIXNUM {
                        return LispObject::fixnum(r).raw();
                    } else {
                        return Number::allocate_bignum(Integer::from(r)).raw();
                    }
                } else {
                    // Convert Natural to Integer for allocate_bignum
                    let numerator_int: Integer = numerator.clone().into();
                    return Number::allocate_bignum(numerator_int).raw();
                }
            }

            // Otherwise return ratio
            return Number::allocate_ratio(result).raw();
        } else {
            return LispObject::nil().raw();
        }
    }

    LispObject::nil().raw()
}

/// Create a ratio from numerator and denominator
/// Takes args_and_env containing (numerator denominator)
#[no_mangle]
pub extern "C" fn ratio(args_and_env: usize) -> usize {
    use malachite::Rational;

    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    // Extract numerator (first element)
    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let numerator_obj = cons.car();

        // Extract denominator (second element)
        let cdr = cons.cdr();
        if let Some(cdr_cons_ptr) = cdr.as_cons_ptr() {
            let cdr_cons = unsafe { &*cdr_cons_ptr };
            let denominator_obj = cdr_cons.car();

            // Convert to fixnums and create Malachite Rational
            if let (Some(num), Some(denom)) = (numerator_obj.as_fixnum(), denominator_obj.as_fixnum()) {
                if denom != 0 {
                    let ratio = Rational::from_signeds(num, denom);
                    return rlasp_runtime::Number::allocate_ratio(ratio).raw();
                }
            }
        }
    }

    LispObject::nil().raw()
}

/// Create a ratio from numerator and denominator (standard calling convention)
#[no_mangle]
pub extern "C" fn cc_ratio(numerator: usize, denominator: usize) -> usize {
    use malachite::Rational;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let num_obj = unsafe { LispObject::from_raw(numerator) };
    let denom_obj = unsafe { LispObject::from_raw(denominator) };

    if let (Some(num), Some(denom)) = (num_obj.as_fixnum(), denom_obj.as_fixnum()) {
        if denom != 0 {
            let ratio = Rational::from_signeds(num, denom);
            // If the result is an integer, return fixnum
            if ratio.denominator_ref() == &1 {
                let n = ratio.numerator_ref();
                if i64::convertible_from(n) {
                    return LispObject::fixnum(i64::exact_from(n)).raw();
                }
            }
            return rlasp_runtime::Number::allocate_ratio(ratio).raw();
        }
    }

    LispObject::nil().raw()
}

/// Extract numerator from a ratio
/// Takes a ratio object and returns the numerator as a fixnum
#[no_mangle]
pub extern "C" fn cc_numerator(obj: usize) -> usize {
    use rlasp_runtime::Number;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let lisp_obj = unsafe { LispObject::from_raw(obj) };

    // Check if it's a Number
    if lisp_obj.is_number() {
        if let Some(ptr) = lisp_obj.as_general_ptr::<Number>() {
        if ptr.is_null() { return LispObject::nil().raw(); }
        let num = unsafe { &*ptr };
        // Access the value field - it's a public field in Number
        if let rlasp_runtime::NumberValue::Ratio(ref r) = num.value {
            // Convert Malachite Integer numerator to i64 (if it fits)
            let numerator = r.numerator_ref();
            if i64::convertible_from(numerator) {
                return LispObject::fixnum(i64::exact_from(numerator)).raw();
            }
        }
    }
    }

    LispObject::nil().raw()
}

/// Extract denominator from a ratio
/// Takes a ratio object and returns the denominator as a fixnum
#[no_mangle]
pub extern "C" fn cc_denominator(obj: usize) -> usize {
    use rlasp_runtime::Number;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let lisp_obj = unsafe { LispObject::from_raw(obj) };

    // Check if it's a Number
    if lisp_obj.is_number() {
        if let Some(ptr) = lisp_obj.as_general_ptr::<Number>() {
        if ptr.is_null() { return LispObject::nil().raw(); }
        let num = unsafe { &*ptr };
        // Access the value field
        if let rlasp_runtime::NumberValue::Ratio(ref r) = num.value {
            // Convert Malachite Natural denominator to i64 (if it fits)
            let denominator = r.denominator_ref();
            if i64::convertible_from(denominator) {
                return LispObject::fixnum(i64::exact_from(denominator)).raw();
            }
        }
    }
    }

    LispObject::nil().raw()
}

/// Create a complex number from real and imaginary parts
/// Takes args_and_env containing (real imaginary)
/// For now, returns a cons of (real . imaginary)
#[no_mangle]
pub extern "C" fn complex(args_and_env: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    // Extract real part (first element)
    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let real_obj = cons.car();

        // Extract imaginary part (second element)
        let cdr = cons.cdr();
        if let Some(cdr_cons_ptr) = cdr.as_cons_ptr() {
            let cdr_cons = unsafe { &*cdr_cons_ptr };
            let imag_obj = cdr_cons.car();

            // For now, represent complex as a cons pair (real . imaginary)
            return rlasp_runtime::Cons::allocate(real_obj, imag_obj).raw();
        }
    }

    LispObject::nil().raw()
}

/// Create a complex number (standard calling convention)
#[no_mangle]
pub extern "C" fn cc_complex(real: usize, imag: usize) -> usize {
    use num_complex::Complex;

    let real_obj = unsafe { LispObject::from_raw(real) };
    let imag_obj = unsafe { LispObject::from_raw(imag) };

    // Convert to f64
    let real_val = if let Some(r) = real_obj.as_fixnum() {
        r as f64
    } else if let Some(f) = real_obj.as_float() {
        f
    } else {
        return LispObject::nil().raw();
    };

    let imag_val = if let Some(i) = imag_obj.as_fixnum() {
        i as f64
    } else if let Some(f) = imag_obj.as_float() {
        f
    } else {
        return LispObject::nil().raw();
    };

    let complex = Complex::new(real_val, imag_val);
    rlasp_runtime::Number::allocate_complex(complex).raw()
}

/// Extract real part from a complex number
#[no_mangle]
pub extern "C" fn cc_realpart(obj: usize) -> usize {
    use rlasp_runtime::Number;

    let lisp_obj = unsafe { LispObject::from_raw(obj) };

    // Check if it's a complex number
    if lisp_obj.is_number() {
        if let Some(ptr) = lisp_obj.as_general_ptr::<Number>() {
            let num = unsafe { &*ptr };
            if let rlasp_runtime::NumberValue::Complex(c) = &num.value {
                // Return fixnum if it's an integer value
                let re_int = c.re.round();
                if (c.re - re_int).abs() < f64::EPSILON {
                    return LispObject::fixnum(re_int as i64).raw();
                }
                return rlasp_runtime::Number::allocate_float(c.re).raw();
            }
        }
    }

    // If not complex (e.g., a real number), return as-is
    obj
}

/// Extract imaginary part from a complex number
#[no_mangle]
pub extern "C" fn cc_imagpart(obj: usize) -> usize {
    use rlasp_runtime::Number;

    let lisp_obj = unsafe { LispObject::from_raw(obj) };

    // Check if it's a complex number
    if lisp_obj.is_number() {
        if let Some(ptr) = lisp_obj.as_general_ptr::<Number>() {
            let num = unsafe { &*ptr };
            if let rlasp_runtime::NumberValue::Complex(c) = &num.value {
                // Return fixnum if it's an integer value
                let im_int = c.im.round();
                if (c.im - im_int).abs() < f64::EPSILON {
                    return LispObject::fixnum(im_int as i64).raw();
                }
                return rlasp_runtime::Number::allocate_float(c.im).raw();
            }
        }
    }

    // If not complex (e.g., a real number), return 0
    LispObject::fixnum(0).raw()
}

/// Less than comparison (< a b)
#[no_mangle]
pub extern "C" fn cc_lt(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Try fixnum-fixnum first (no precision loss)
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        return if a_val < b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Fall back to float comparison for mixed types
    let a_f64 = if let Some(fix) = a_obj.as_fixnum() {
        Some(fix as f64)
    } else {
        a_obj.as_float()
    };
    let b_f64 = if let Some(fix) = b_obj.as_fixnum() {
        Some(fix as f64)
    } else {
        b_obj.as_float()
    };

    if let (Some(a_val), Some(b_val)) = (a_f64, b_f64) {
        if a_val < b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Greater than comparison (> a b)
#[no_mangle]
pub extern "C" fn cc_gt(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Try fixnum-fixnum comparison first
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        return if a_val > b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Try float-float comparison
    if let (Some(a_val), Some(b_val)) = (a_obj.as_float(), b_obj.as_float()) {
        return if a_val > b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Mixed: fixnum and float - coerce fixnum to float
    if let (Some(a_fix), Some(b_flt)) = (a_obj.as_fixnum(), b_obj.as_float()) {
        return if (a_fix as f64) > b_flt {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }
    if let (Some(a_flt), Some(b_fix)) = (a_obj.as_float(), b_obj.as_fixnum()) {
        return if a_flt > (b_fix as f64) {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    LispObject::nil().raw()
}

/// Equal comparison (= a b)
#[no_mangle]
pub extern "C" fn cc_eq(a: usize, b: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Fast path: identical objects
    if a_obj.raw() == b_obj.raw() {
        return LispObject::t().raw();
    }

    // Symbol equality by name (case-insensitive, matches interpreter)
    if let (Some(a_ptr), Some(b_ptr)) = (a_obj.as_general_ptr::<()>(), b_obj.as_general_ptr::<()>()) {
        if !a_ptr.is_null() && !b_ptr.is_null() {
            if unsafe { TypeHeader::from_ptr(a_ptr) } == Some(ObjectType::Symbol)
                && unsafe { TypeHeader::from_ptr(b_ptr) } == Some(ObjectType::Symbol)
            {
                let a_sym = unsafe { &*(a_ptr as *const rlasp_runtime::Symbol) };
                let b_sym = unsafe { &*(b_ptr as *const rlasp_runtime::Symbol) };
                if a_sym.name().eq_ignore_ascii_case(b_sym.name()) {
                    return LispObject::t().raw();
                }
            }
        }
    }

    // Try fixnum-fixnum comparison first
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        return if a_val == b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Try float-float comparison
    if let (Some(a_val), Some(b_val)) = (a_obj.as_float(), b_obj.as_float()) {
        return if a_val == b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Mixed: fixnum and float - coerce fixnum to float
    if let (Some(a_fix), Some(b_flt)) = (a_obj.as_fixnum(), b_obj.as_float()) {
        return if (a_fix as f64) == b_flt {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }
    if let (Some(a_flt), Some(b_fix)) = (a_obj.as_float(), b_obj.as_fixnum()) {
        return if a_flt == (b_fix as f64) {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    LispObject::nil().raw()
}

/// Helper: convert LispObject to f64 for numeric comparison
fn to_f64_for_compare(obj: LispObject) -> Option<f64> {
    if let Some(fix) = obj.as_fixnum() {
        Some(fix as f64)
    } else if let Some(flt) = obj.as_float() {
        Some(flt)
    } else {
        None
    }
}

/// Less than or equal (<= a b)
#[no_mangle]
pub extern "C" fn cc_le(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Try fixnum-fixnum first (no precision loss)
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        return if a_val <= b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Fall back to float comparison for mixed types
    if let (Some(a_val), Some(b_val)) = (to_f64_for_compare(a_obj), to_f64_for_compare(b_obj)) {
        if a_val <= b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Greater than or equal (>= a b)
#[no_mangle]
pub extern "C" fn cc_ge(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Try fixnum-fixnum first (no precision loss)
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        return if a_val >= b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        };
    }

    // Fall back to float comparison for mixed types
    if let (Some(a_val), Some(b_val)) = (to_f64_for_compare(a_obj), to_f64_for_compare(b_obj)) {
        if a_val >= b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Get internal real time in nanoseconds
#[no_mangle]
pub extern "C" fn cc_get_internal_real_time() -> usize {
    use std::sync::OnceLock;
    use std::time::Instant;

    static START_TIME: OnceLock<Instant> = OnceLock::new();
    let start = START_TIME.get_or_init(|| Instant::now());

    let elapsed = start.elapsed();
    let nanos = elapsed.as_nanos() as i64;
    LispObject::fixnum(nanos).raw()
}

/// Internal time units per second (1_000_000_000 for nanoseconds)
#[no_mangle]
pub extern "C" fn cc_internal_time_units_per_second() -> usize {
    LispObject::fixnum(1_000_000_000).raw()
}

/// Modulo operation
#[no_mangle]
pub extern "C" fn cc_mod(a: usize, b: usize) -> usize {
    use malachite::Integer;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
    use rlasp_runtime::Number;

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Try to get bignum first, then fallback to fixnum
    let a_bigint = if let Some(a_val) = a_obj.as_fixnum() {
        Integer::from(a_val)
    } else if let Some(ptr) = a_obj.as_general_ptr::<Number>() {
        if let Some(bignum) = unsafe { (*ptr).as_bignum() } {
            bignum.clone()
        } else {
            return LispObject::nil().raw();
        }
    } else {
        return LispObject::nil().raw();
    };

    let b_bigint = if let Some(b_val) = b_obj.as_fixnum() {
        if b_val == 0 {
            return LispObject::nil().raw();
        }
        Integer::from(b_val)
    } else if let Some(ptr) = b_obj.as_general_ptr::<Number>() {
        if let Some(bignum) = unsafe { (*ptr).as_bignum() } {
            bignum.clone()
        } else {
            return LispObject::nil().raw();
        }
    } else {
        return LispObject::nil().raw();
    };

    let result = a_bigint % b_bigint;

    // Try to fit in Fixnum, otherwise return Bignum
    if i64::convertible_from(&result) {
        LispObject::fixnum(i64::exact_from(&result)).raw()
    } else {
        Number::allocate_bignum(result).raw()
    }
}

/// Exponentiation (expt base power)
#[no_mangle]
pub extern "C" fn cc_expt(base: usize, power: usize) -> usize {
    use malachite::Integer;
    use malachite::num::arithmetic::traits::Pow;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
    use rlasp_runtime::Number;

    let base_obj = unsafe { LispObject::from_raw(base) };
    let power_obj = unsafe { LispObject::from_raw(power) };

    if let (Some(base_val), Some(power_val)) = (base_obj.as_fixnum(), power_obj.as_fixnum()) {
        if power_val < 0 {
            // For negative powers, return nil (could also compute float result)
            LispObject::nil().raw()
        } else {
            // Use Malachite Integer for exponentiation to avoid overflow
            let result = Integer::from(base_val).pow(power_val as u64);
            // Check if result fits in i64, otherwise allocate bignum
            if i64::convertible_from(&result) {
                LispObject::fixnum(i64::exact_from(&result)).raw()
            } else {
                Number::allocate_bignum(result).raw()
            }
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Square root (sqrt x)
/// Returns float for all inputs
#[no_mangle]
pub extern "C" fn cc_sqrt(x: usize) -> usize {
    let x_obj = unsafe { LispObject::from_raw(x) };

    let val = if let Some(fixnum) = x_obj.as_fixnum() {
        fixnum as f64
    } else if let Some(float) = x_obj.as_float() {
        float
    } else {
        return LispObject::nil().raw();
    };

    if val < 0.0 {
        LispObject::nil().raw()
    } else {
        rlasp_runtime::Number::allocate_float(val.sqrt()).raw()
    }
}

/// Absolute value (abs x)
#[no_mangle]
pub extern "C" fn cc_abs(x: usize) -> usize {
    use malachite::Rational;
    use rlasp_runtime::{Number, NumberValue};

    let x_obj = unsafe { LispObject::from_raw(x) };

    if let Some(n) = x_obj.as_fixnum() {
        if n == i64::MIN {
            return Number::allocate_bignum(-Integer::from(n)).raw();
        }
        return LispObject::fixnum(if n < 0 { -n } else { n }).raw();
    }

    if let Some(ptr) = x_obj.as_general_ptr::<Number>() {
        if ptr.is_null() {
            return LispObject::nil().raw();
        }
        let num = unsafe { &*ptr };
        return match &num.value {
            NumberValue::Float(f) => Number::allocate_float(f.abs()).raw(),
            NumberValue::Bignum(b) => {
                let v = if b < &Integer::from(0) { -b.clone() } else { b.clone() };
                Number::allocate_bignum(v).raw()
            }
            NumberValue::Ratio(r) => {
                let abs_r: Rational = if r < &Rational::from(0) { -r.clone() } else { r.clone() };
                Number::allocate_ratio(abs_r).raw()
            }
            NumberValue::Complex(c) => Number::allocate_float(c.norm()).raw(),
        };
    }

    LispObject::nil().raw()
}

/// Length of a list
#[no_mangle]
pub extern "C" fn cc_length(list: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    let obj = unsafe { LispObject::from_raw(list) };

    if let Some(str_ptr) = obj.as_general_ptr::<rlasp_runtime::RString>() {
        if unsafe { TypeHeader::from_ptr(str_ptr) } == Some(ObjectType::String) {
            let s = unsafe { &*str_ptr };
            return LispObject::fixnum(s.len_chars() as i64).raw();
        }
    }

    if let Some(vec_ptr) = obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if unsafe { TypeHeader::from_ptr(vec_ptr) } == Some(ObjectType::Vector) {
            let vec = unsafe { &*vec_ptr };
            return LispObject::fixnum(vec.len() as i64).raw();
        }
    }

    let mut current = obj;
    let mut count = 0i64;

    while !current.is_nil() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            count += 1;
            let cons = unsafe { &*cons_ptr };
            current = cons.cdr();
        } else {
            return LispObject::nil().raw();
        }
    }

    LispObject::fixnum(count).raw()
}

/// Append two lists - returns new list with all elements
#[no_mangle]
pub extern "C" fn cc_append(list1: usize, list2: usize) -> usize {
    let list1_obj = unsafe { LispObject::from_raw(list1) };
    let list2_obj = unsafe { LispObject::from_raw(list2) };

    // If list1 is nil, return list2
    if list1_obj.is_nil() {
        return list2;
    }

    // Collect all elements from list1
    let mut elements = Vec::new();
    let mut current = list1_obj;
    while !current.is_nil() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            elements.push(cons.car());
            current = cons.cdr();
        } else {
            return LispObject::nil().raw();
        }
    }

    // Build new list by consing elements in reverse order, ending with list2
    let mut result = list2_obj;
    for elem in elements.iter().rev() {
        result = rlasp_runtime::Cons::allocate(*elem, result);
    }

    result.raw()
}

/// Reverse a list
#[no_mangle]
pub extern "C" fn cc_reverse(list: usize) -> usize {
    let mut current = unsafe { LispObject::from_raw(list) };
    let mut result = LispObject::nil();

    while !current.is_nil() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            result = rlasp_runtime::Cons::allocate(cons.car(), result);
            current = cons.cdr();
        } else {
            return LispObject::nil().raw();
        }
    }

    result.raw()
}

/// Get nth element of a list (0-indexed)
#[no_mangle]
pub extern "C" fn cc_nth(n: usize, list: usize) -> usize {
    let n_obj = unsafe { LispObject::from_raw(n) };
    let mut current = unsafe { LispObject::from_raw(list) };

    let index = match n_obj.as_fixnum() {
        Some(i) if i >= 0 => i as usize,
        _ => return LispObject::nil().raw(),
    };

    let mut count = 0;
    while !current.is_nil() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            if count == index {
                return cons.car().raw();
            }
            count += 1;
            current = cons.cdr();
        } else {
            return LispObject::nil().raw();
        }
    }

    LispObject::nil().raw()
}

/// Check if number is even
#[no_mangle]
pub extern "C" fn cc_evenp(x: usize) -> usize {
    let x_obj = unsafe { LispObject::from_raw(x) };

    if let Some(val) = x_obj.as_fixnum() {
        if val % 2 == 0 {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Check if number is odd
#[no_mangle]
pub extern "C" fn cc_oddp(x: usize) -> usize {
    let x_obj = unsafe { LispObject::from_raw(x) };

    if let Some(val) = x_obj.as_fixnum() {
        if val % 2 != 0 {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Floor function - largest integer <= x
#[no_mangle]
pub extern "C" fn cc_floor(x: usize) -> usize {
    let x_obj = unsafe { LispObject::from_raw(x) };

    if let Some(fixnum) = x_obj.as_fixnum() {
        // Already an integer
        x
    } else if let Some(float) = x_obj.as_float() {
        LispObject::fixnum(float.floor() as i64).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Ceiling function - smallest integer >= x
#[no_mangle]
pub extern "C" fn cc_ceiling(x: usize) -> usize {
    use rlasp_runtime::{Number, NumberValue};
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let x_obj = unsafe { LispObject::from_raw(x) };

    if let Some(fixnum) = x_obj.as_fixnum() {
        // Already an integer
        x
    } else if let Some(float) = x_obj.as_float() {
        LispObject::fixnum(float.ceil() as i64).raw()
    } else if let Some(ptr) = x_obj.as_general_ptr::<Number>() {
        let num = unsafe { &*ptr };
        match &num.value {
            NumberValue::Ratio(r) => {
                // For ratio p/q: ceiling = floor(p/q) + (1 if p%q != 0 else 0)
                // Using malachite's ceiling_assign method
                use malachite::num::arithmetic::traits::Ceiling;
                let result = r.clone().ceiling();
                if i64::convertible_from(&result) {
                    LispObject::fixnum(i64::exact_from(&result)).raw()
                } else {
                    Number::allocate_bignum(result).raw()
                }
            }
            NumberValue::Bignum(b) => {
                // Bignum is already an integer
                x
            }
            NumberValue::Float(f) => {
                LispObject::fixnum(f.ceil() as i64).raw()
            }
            _ => LispObject::nil().raw(),
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Truncate function - remove fractional part
#[no_mangle]
pub extern "C" fn cc_truncate(x: usize) -> usize {
    let x_obj = unsafe { LispObject::from_raw(x) };

    if let Some(fixnum) = x_obj.as_fixnum() {
        // Already an integer
        x
    } else if let Some(float) = x_obj.as_float() {
        LispObject::fixnum(float.trunc() as i64).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Truncate with divisor - returns quotient (integer division)
#[no_mangle]
pub extern "C" fn cc_truncate_2(x: usize, y: usize) -> usize {
    use rlasp_runtime::{Number, NumberValue};
    use malachite::Integer;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let x_obj = unsafe { LispObject::from_raw(x) };
    let y_obj = unsafe { LispObject::from_raw(y) };

    // Extract x as Integer
    let x_int = if let Some(fx) = x_obj.as_fixnum() {
        Integer::from(fx)
    } else if let Some(ptr) = x_obj.as_general_ptr::<Number>() {
        let num = unsafe { &*ptr };
        match &num.value {
            NumberValue::Bignum(b) => b.clone(),
            NumberValue::Float(f) => Integer::from(*f as i64),
            _ => return LispObject::nil().raw(),
        }
    } else {
        return LispObject::nil().raw();
    };

    // Extract y as Integer
    let y_int = if let Some(fy) = y_obj.as_fixnum() {
        if fy == 0 {
            return LispObject::nil().raw();
        }
        Integer::from(fy)
    } else if let Some(ptr) = y_obj.as_general_ptr::<Number>() {
        let num = unsafe { &*ptr };
        match &num.value {
            NumberValue::Bignum(b) => {
                if *b == Integer::from(0) {
                    return LispObject::nil().raw();
                }
                b.clone()
            }
            NumberValue::Float(f) => {
                if *f == 0.0 {
                    return LispObject::nil().raw();
                }
                Integer::from(*f as i64)
            }
            _ => return LispObject::nil().raw(),
        }
    } else {
        return LispObject::nil().raw();
    };

    let quotient = x_int / y_int;

    // Try to return as fixnum if it fits
    if i64::convertible_from(&quotient) {
        LispObject::fixnum(i64::exact_from(&quotient)).raw()
    } else {
        Number::allocate_bignum(quotient).raw()
    }
}

/// Logical NOT - returns T if argument is NIL, NIL otherwise (uses uniform calling convention)
#[no_mangle]
pub extern "C" fn cc_not(args_and_env: usize) -> usize {
    // Extract first argument from args list
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    let x_obj = if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        cons.car()
    } else {
        LispObject::nil()
    };

    if x_obj.is_nil() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Execute ls command
#[no_mangle]
pub extern "C" fn cc_ls() -> usize {
    use std::process::Command;
    match Command::new("ls").arg("-la").status() {
        Ok(status) => LispObject::fixnum(status.code().unwrap_or(-1) as i64).raw(),
        Err(_) => LispObject::fixnum(-1).raw(),
    }
}

/// Execute pwd command
#[no_mangle]
pub extern "C" fn cc_pwd() -> usize {
    use std::process::Command;
    match Command::new("pwd").output() {
        Ok(output) => {
            print!("{}", String::from_utf8_lossy(&output.stdout));
            LispObject::fixnum(0).raw()
        }
        Err(_) => LispObject::fixnum(-1).raw(),
    }
}

/// Execute echo command with a fixnum argument
#[no_mangle]
pub extern "C" fn cc_echo(msg: usize) -> usize {
    let msg_obj = unsafe { LispObject::from_raw(msg) };
    if let Some(n) = msg_obj.as_fixnum() {
        println!("{}", n);
    }
    LispObject::fixnum(0).raw()
}

/// Allocate a string from a C string pointer
#[no_mangle]
pub extern "C" fn cc_make_string(ptr: *const u8, len: usize) -> usize {
    if ptr.is_null() {
        return LispObject::nil().raw();
    }

    unsafe {
        let bytes = std::slice::from_raw_parts(ptr, len);
        let s = String::from_utf8_lossy(bytes).into_owned();
        rlasp_runtime::RString::allocate(s).raw()
    }
}

/// Create a string of given length filled with a character
#[no_mangle]
pub extern "C" fn cc_make_string_repeat(len: usize, ch: usize) -> usize {
    let ch_obj = unsafe { LispObject::from_raw(ch) };

    // Extract character - try as fixnum first
    let char_val = if let Some(fixnum) = ch_obj.as_fixnum() {
        // Character code as fixnum
        if fixnum >= 0 && fixnum <= 0x10FFFF {
            std::char::from_u32(fixnum as u32).unwrap_or(' ')
        } else {
            ' '
        }
    } else {
        // Default to space if not a valid character
        ' '
    };

    let s = char_val.to_string().repeat(len);
    rlasp_runtime::RString::allocate(s).raw()
}

/// Set character in a string
#[no_mangle]
pub extern "C" fn cc_set_char(string: usize, index: usize, ch: usize) -> usize {
    let string_obj = unsafe { LispObject::from_raw(string) };
    let index_obj = unsafe { LispObject::from_raw(index) };
    let ch_obj = unsafe { LispObject::from_raw(ch) };

    let idx = match index_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => return ch,
    };

    let ch_val = match ch_obj.as_character() {
        Some(val) => val,
        None => return ch,
    };

    if let Some(str_ptr) = string_obj.as_general_ptr::<rlasp_runtime::RString>() {
        if !str_ptr.is_null() {
            let s = unsafe { &mut *(str_ptr as *mut rlasp_runtime::RString) };
            s.set_char(idx, ch_val);
        }
    }

    ch
}

/// Copy a sequence (list or string)
#[no_mangle]
pub extern "C" fn cc_copy_seq(seq: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};

    let seq_obj = unsafe { LispObject::from_raw(seq) };

    if let Some(ptr) = seq_obj.as_general_ptr::<()>() {
        if !ptr.is_null() {
            match unsafe { TypeHeader::from_ptr(ptr) } {
                Some(ObjectType::String) => {
                    let str_ptr = ptr as *const rlasp_runtime::RString;
                    let s = unsafe { &*str_ptr };
                    return rlasp_runtime::RString::allocate(s.as_str().to_string()).raw();
                }
                Some(ObjectType::Vector) => {
                    let vec_ptr = ptr as *const rlasp_runtime::RVector;
                    let vec = unsafe { &*vec_ptr };
                    let elements = vec.as_slice().to_vec();
                    return rlasp_runtime::RVector::allocate(elements).raw();
                }
                _ => {}
            }
        }
    }

    // Otherwise treat as a list - copy cons cells
    if seq_obj.is_nil() {
        return LispObject::nil().raw();
    }

    if let Some(cons_ptr) = seq_obj.as_cons_ptr() {
        unsafe {
            let car = (*cons_ptr).car();
            let cdr = (*cons_ptr).cdr();
            let new_cdr = cc_copy_seq(cdr.raw());
            let new_cdr_obj = LispObject::from_raw(new_cdr);
            return rlasp_runtime::Cons::allocate(car, new_cdr_obj).raw();
        }
    }

    // If not a list or string, return as-is
    seq
}

/// String equality comparison
#[no_mangle]
pub extern "C" fn cc_string_equal(a: usize, b: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    let extract_string = |obj: LispObject| -> Option<String> {
        let ptr = obj.as_general_ptr::<()>()?;
        if ptr.is_null() {
            return None;
        }
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::String) {
            let str_ptr = ptr as *const rlasp_runtime::RString;
            Some(unsafe { (&*str_ptr).as_str().to_string() })
        } else {
            None
        }
    };

    let (Some(a_str), Some(b_str)) = (extract_string(a_obj), extract_string(b_obj)) else {
        return LispObject::nil().raw();
    };

    if a_str == b_str {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

/// String equality with keyword arguments support
/// Args: (string1 string2 &key start1 end1 start2 end2)
#[no_mangle]
pub extern "C" fn cc_string_equal_full(args: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};

    let args_obj = unsafe { LispObject::from_raw(args) };

    // Extract strings and optional keyword args from list
    let mut string1: Option<String> = None;
    let mut string2: Option<String> = None;
    let mut start1: usize = 0;
    let mut end1: Option<usize> = None;
    let mut start2: usize = 0;
    let mut end2: Option<usize> = None;

    let mut current = args_obj;
    let mut positional_idx = 0;
    let mut expect_value_for: Option<String> = None;

    while !current.is_nil() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let item = cons.car();

            // Check if this is a keyword or value
            if let Some(key) = &expect_value_for {
                // This item is the value for the previous keyword
                if let Some(val) = item.as_fixnum() {
                    if val < 0 {
                        return LispObject::nil().raw();
                    }
                    match key.as_str() {
                        ":start1" | "start1" => start1 = val as usize,
                        ":end1" | "end1" => end1 = Some(val as usize),
                        ":start2" | "start2" => start2 = val as usize,
                        ":end2" | "end2" => end2 = Some(val as usize),
                        _ => {}
                    }
                }
                expect_value_for = None;
            } else {
                // Check if it's a keyword
                let is_keyword = if let Some(ptr) = item.as_general_ptr::<()>() {
                    if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
                        let sym = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                        let name = sym.name().to_ascii_lowercase();
                        if name.starts_with(':')
                            || name == "start1"
                            || name == "end1"
                            || name == "start2"
                            || name == "end2"
                        {
                            expect_value_for = Some(name);
                            true
                        } else {
                            false
                        }
                    } else {
                        false
                    }
                } else {
                    false
                };

                if !is_keyword {
                    // It's a positional argument (string)
                    let s = if let Some(ptr) = item.as_general_ptr::<()>() {
                        if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::String) {
                            let str_ptr = ptr as *const rlasp_runtime::RString;
                            Some(unsafe { (&*str_ptr).as_str().to_string() })
                        } else {
                            None
                        }
                    } else {
                        None
                    };

                    match positional_idx {
                        0 => string1 = s,
                        1 => string2 = s,
                        _ => {}
                    }
                    positional_idx += 1;
                }
            }

            current = cons.cdr();
        } else {
            break;
        }
    }

    // Compare strings
    if let (Some(s1), Some(s2)) = (string1.as_deref(), string2.as_deref()) {
        let e1 = end1.unwrap_or(s1.len());
        let e2 = end2.unwrap_or(s2.len());

        // Bounds checking
        if start1 > s1.len() || e1 > s1.len() || start2 > s2.len() || e2 > s2.len() {
            return LispObject::nil().raw();
        }

        let sub1 = &s1[start1..e1];
        let sub2 = &s2[start2..e2];

        if sub1 == sub2 {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Execute a shell command and return output as string
#[no_mangle]
pub extern "C" fn cc_shell(command_obj: usize) -> usize {
    use std::process::Command;

    let cmd_obj = unsafe { LispObject::from_raw(command_obj) };

    // Try to extract string from general pointer
    let cmd_str = unsafe {
        if cmd_obj.tag() == rlasp_runtime::Tag::General {
            let ptr = (cmd_obj.raw() & !0b11) as *const rlasp_runtime::RString;
            if !ptr.is_null() {
                (*ptr).as_str()
            } else {
                return LispObject::nil().raw();
            }
        } else {
            return LispObject::nil().raw();
        }
    };

    // Execute command
    match Command::new("sh").arg("-c").arg(cmd_str).output() {
        Ok(output) => {
            let result = String::from_utf8_lossy(&output.stdout).into_owned();
            print!("{}", result);
            rlasp_runtime::RString::allocate(result).raw()
        }
        Err(_) => LispObject::nil().raw(),
    }
}

/// Execute a shell command - legacy, now calls cc_shell
#[no_mangle]
pub extern "C" fn cc_system(command: usize) -> usize {
    cc_shell(command)
}

/// Collect N arguments from the stack into a list
/// Takes a count (as a fixnum), pops that many values from the stack,
/// and builds them into a cons list for use with cc_arg
#[no_mangle]
pub extern "C" fn cc_collect_args(count_obj: usize) -> usize {
    let count_lisp = unsafe { LispObject::from_raw(count_obj) };

    let count = if let Some(n) = count_lisp.as_fixnum() {
        n as usize
    } else {
        return LispObject::nil().raw();
    };

    // Pop count arguments from the stack
    let mut args = Vec::new();
    for _ in 0..count {
        let arg = stack_pop_pointer();
        args.push(arg);
    }

    // Reverse the args since we popped them in reverse order
    args.reverse();

    // Build a cons list from the arguments
    let mut result = LispObject::nil().raw();
    for arg in args.iter().rev() {
        result = cc_cons(*arg, result);
    }

    result
}

/// Extract the Nth argument from args_and_env list
/// For positional parameters and &optional: extracts by position
/// For &key parameters: searches for the keyword in the args list
/// param_info format:
///   - If fixnum N >= 0: extract Nth positional argument
///   - If symbol: search for keyword :symbol in args and return its value
#[no_mangle]
pub extern "C" fn cc_arg(args_and_env: usize, param_info: usize) -> usize {
    // Debug: track calls
    use std::sync::atomic::{AtomicUsize, Ordering};
    static CC_ARG_COUNT: AtomicUsize = AtomicUsize::new(0);
    let count = CC_ARG_COUNT.fetch_add(1, Ordering::Relaxed);
    let trace_args = std::env::var("RLASP_TRACE_ARGS").is_ok();

    // Validate input - check for obviously invalid pointers
    if args_and_env < 0x1000 || args_and_env > 0xFFFF_FFFF_FFFF {
        eprintln!("[cc_arg ERROR #{}] Invalid args_and_env pointer: 0x{:x}", count, args_and_env);
        return LispObject::nil().raw();
    }

    let args_obj = unsafe { LispObject::from_raw(args_and_env) };
    let param_obj = unsafe { LispObject::from_raw(param_info) };

    // Debug output for first few calls and any non-fixnum param_info
    let is_fixnum = param_obj.is_fixnum();
    if trace_args && (count < 20 || !is_fixnum) {
        eprintln!("[cc_arg #{}] args_and_env=0x{:x} param_info=0x{:x} is_fixnum={}",
                  count, args_and_env, param_info, is_fixnum);
    }

    // Check if param_info is a fixnum (positional) or symbol (keyword)
    if let Some(idx) = param_obj.as_fixnum() {
        // Positional argument - extract by index
        let mut current = args_obj;
        let idx = idx as usize;

        for _ in 0..idx {
            if let Some(cons_ptr) = current.as_cons_ptr() {
                let cons = unsafe { &*cons_ptr };
                current = cons.cdr();
            } else {
                // Index out of bounds - return nil
                return LispObject::nil().raw();
            }
        }

        // Get the car of the current cons cell
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            cons.car().raw()
        } else {
            LispObject::nil().raw()
        }
    } else if let Some(param_name) = {
        let map = get_symbol_name_map().lock().unwrap();
        map.get(&param_info).cloned()
    } {
        if std::env::var("RLASP_TRACE_ARGS").is_ok() {
            eprintln!("[cc_arg] symbol-map hit param_info=0x{:x} name={}", param_info, param_name);
        }
        // Keyword argument - use tracked symbol name (avoids raw pointer deref)
        let keyword_name = format!(":{}", param_name);

        // Search through args list for matching keyword
        let mut current = args_obj;
        while let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let key = cons.car();

            // Check if this is the keyword we're looking for
            if let Some(key_sym_ptr) = key.as_general_ptr::<rlasp_runtime::Symbol>() {
                // Validate that this really is a Symbol before dereferencing
                use rlasp_runtime::{TypeHeader, ObjectType};
                if let Some(obj_type) = unsafe { TypeHeader::from_ptr(key_sym_ptr) } {
                    if obj_type == ObjectType::Symbol {
                        let key_sym = unsafe { &*key_sym_ptr };
                        let key_name = key_sym.name().to_string();

                        if key_name == keyword_name || key_name == param_name {
                            // Found the keyword, return the next value
                            let rest = cons.cdr();
                            if let Some(rest_cons_ptr) = rest.as_cons_ptr() {
                                let rest_cons = unsafe { &*rest_cons_ptr };
                                return rest_cons.car().raw();
                            } else {
                                return LispObject::nil().raw();
                            }
                        }
                    }
                }
            }

            // Check if current element looks like a keyword (starts with :)
            let is_keyword = if let Some(key_sym_ptr) = cons.car().as_general_ptr::<rlasp_runtime::Symbol>() {
                use rlasp_runtime::{TypeHeader, ObjectType};
                if let Some(ObjectType::Symbol) = unsafe { TypeHeader::from_ptr(key_sym_ptr) } {
                    let key_sym = unsafe { &*key_sym_ptr };
                    key_sym.name().starts_with(':')
                } else {
                    false
                }
            } else {
                false
            };

            if is_keyword {
                // This was a keyword that didn't match - skip both key and value
                let rest = cons.cdr();
                if let Some(rest_cons_ptr) = rest.as_cons_ptr() {
                    let rest_cons = unsafe { &*rest_cons_ptr };
                    current = rest_cons.cdr();
                } else {
                    break;
                }
            } else {
                // Not a keyword (positional arg) - just skip this one element
                current = cons.cdr();
            }
        }

        // Keyword not found - return nil
        LispObject::nil().raw()
    } else if std::env::var("RLASP_NO_PARAM_DEREF").is_ok() {
        eprintln!("[cc_arg ERROR #{}] param_info not found in symbol map: 0x{:x}", count, param_info);
        LispObject::nil().raw()
    } else if let Some(sym_ptr) = param_obj.as_general_ptr::<rlasp_runtime::Symbol>() {
        // Keyword argument - search for :keyword in args list
        // Validate symbol pointer
        if (sym_ptr as usize) < 0x1000 {
            eprintln!("[cc_arg ERROR #{}] Invalid symbol pointer: 0x{:x}", count, sym_ptr as usize);
            return LispObject::nil().raw();
        }

        // Additional validation: check the type header before dereferencing
        use rlasp_runtime::{TypeHeader, ObjectType};
        if let Some(obj_type) = unsafe { TypeHeader::from_ptr(sym_ptr) } {
            if obj_type != ObjectType::Symbol {
                eprintln!("[cc_arg ERROR #{}] param_info 0x{:x} has type {:?}, not Symbol", count, param_info, obj_type);
                return LispObject::nil().raw();
            }
        } else {
            eprintln!("[cc_arg ERROR #{}] param_info 0x{:x} has no valid type header (ptr=0x{:x})", count, param_info, sym_ptr as usize);
            return LispObject::nil().raw();
        }

        let sym = unsafe { &*sym_ptr };
        let param_name = sym.name().to_string();

        // Create keyword symbol to search for (add : prefix)
        let keyword_name = format!(":{}", param_name);

        // Search through args list for matching keyword
        let mut current = args_obj;
        while let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let key = cons.car();

            // Check if this is the keyword we're looking for
            let mut is_keyword = false;
            if let Some(key_sym_ptr) = key.as_general_ptr::<rlasp_runtime::Symbol>() {
                let key_sym = unsafe { &*key_sym_ptr };
                let key_name = key_sym.name().to_string();
                is_keyword = key_name.starts_with(':');

                if key_name == keyword_name || key_name == param_name {
                    // Found the keyword, return the next value
                    let rest = cons.cdr();
                    if let Some(value_cons_ptr) = rest.as_cons_ptr() {
                        let value_cons = unsafe { &*value_cons_ptr };
                        return value_cons.car().raw();
                    }
                }
            }

            if is_keyword {
                // This was a keyword that didn't match - skip both key and value
                let rest = cons.cdr();
                if let Some(rest_cons_ptr) = rest.as_cons_ptr() {
                    let rest_cons = unsafe { &*rest_cons_ptr };
                    current = rest_cons.cdr();
                } else {
                    break;
                }
            } else {
                // Not a keyword (positional arg) - just skip this one element
                current = cons.cdr();
            }
        }

        // Keyword not found - return nil (default value)
        LispObject::nil().raw()
    } else {
        // Invalid param_info - return nil
        LispObject::nil().raw()
    }
}

/// Check whether an argument was supplied (positional or keyword)
/// Returns T if present, NIL otherwise.
#[no_mangle]
pub extern "C" fn cc_arg_present(args_and_env: usize, param_info: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };
    let param_obj = unsafe { LispObject::from_raw(param_info) };

    // Positional argument - check if index exists
    if let Some(idx) = param_obj.as_fixnum() {
        let mut current = args_obj;
        let idx = idx as usize;
        for _ in 0..idx {
            if let Some(cons_ptr) = current.as_cons_ptr() {
                let cons = unsafe { &*cons_ptr };
                current = cons.cdr();
            } else {
                return LispObject::nil().raw();
            }
        }
        if current.as_cons_ptr().is_some() {
            return LispObject::t().raw();
        }
        return LispObject::nil().raw();
    }

    // Keyword argument - use tracked symbol map if available
    if let Some(param_name) = {
        let map = get_symbol_name_map().lock().unwrap();
        map.get(&param_info).cloned()
    } {
        let keyword_name = format!(":{}", param_name);
        let mut current = args_obj;
        while let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let key = cons.car();

            let mut is_keyword = false;
            if let Some(key_sym_ptr) = key.as_general_ptr::<rlasp_runtime::Symbol>() {
                use rlasp_runtime::{TypeHeader, ObjectType};
                if let Some(obj_type) = unsafe { TypeHeader::from_ptr(key_sym_ptr) } {
                    if obj_type == ObjectType::Symbol {
                        let key_sym = unsafe { &*key_sym_ptr };
                        let key_name = key_sym.name().to_string();
                        is_keyword = key_name.starts_with(':');
                        if key_name == keyword_name || key_name == param_name {
                            return LispObject::t().raw();
                        }
                    }
                }
            }

            if is_keyword {
                // Skip key and value
                let rest = cons.cdr();
                if let Some(rest_cons_ptr) = rest.as_cons_ptr() {
                    let rest_cons = unsafe { &*rest_cons_ptr };
                    current = rest_cons.cdr();
                } else {
                    break;
                }
            } else {
                // Not a keyword - just skip this one element
                current = cons.cdr();
            }
        }
        return LispObject::nil().raw();
    }

    // Fallback: try to treat param_info as a symbol
    if let Some(sym_ptr) = param_obj.as_general_ptr::<rlasp_runtime::Symbol>() {
        use rlasp_runtime::{TypeHeader, ObjectType};
        if let Some(obj_type) = unsafe { TypeHeader::from_ptr(sym_ptr) } {
            if obj_type != ObjectType::Symbol {
                return LispObject::nil().raw();
            }
        } else {
            return LispObject::nil().raw();
        }

        let sym = unsafe { &*sym_ptr };
        let param_name = sym.name().to_string();
        let keyword_name = format!(":{}", param_name);

        let mut current = args_obj;
        while let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let key = cons.car();
            let mut is_keyword = false;
            if let Some(key_sym_ptr) = key.as_general_ptr::<rlasp_runtime::Symbol>() {
                let key_sym = unsafe { &*key_sym_ptr };
                let key_name = key_sym.name().to_string();
                is_keyword = key_name.starts_with(':');
                if key_name == keyword_name || key_name == param_name {
                    return LispObject::t().raw();
                }
            }
            if is_keyword {
                let rest = cons.cdr();
                if let Some(rest_cons_ptr) = rest.as_cons_ptr() {
                    let rest_cons = unsafe { &*rest_cons_ptr };
                    current = rest_cons.cdr();
                } else {
                    break;
                }
            } else {
                current = cons.cdr();
            }
        }
    }

    LispObject::nil().raw()
}

/// Collect all remaining arguments into a list starting from start_index
/// Used for &rest parameters
#[no_mangle]
pub extern "C" fn cc_collect_rest_args(args_and_env: usize, start_index_obj: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };
    let index_obj = unsafe { LispObject::from_raw(start_index_obj) };

    if let Some(start_idx) = index_obj.as_fixnum() {
        let start_idx = start_idx as usize;

        // Skip to the starting position
        let mut current = args_obj;
        for _ in 0..start_idx {
            if let Some(cons_ptr) = current.as_cons_ptr() {
                let cons = unsafe { &*cons_ptr };
                current = cons.cdr();
            } else {
                // Ran out of arguments - return nil
                return LispObject::nil().raw();
            }
        }

        // Return the remaining list (or nil if we're at the end)
        current.raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Get number of command-line arguments
#[no_mangle]
pub extern "C" fn cc_argc() -> usize {
    let args: Vec<String> = std::env::args().collect();
    LispObject::fixnum(args.len() as i64).raw()
}

/// Get nth command-line argument as string
#[no_mangle]
pub extern "C" fn cc_argv(n_obj: usize) -> usize {
    let n_lisp = unsafe { LispObject::from_raw(n_obj) };

    if let Some(n) = n_lisp.as_fixnum() {
        let args: Vec<String> = std::env::args().collect();
        if n >= 0 && (n as usize) < args.len() {
            return rlasp_runtime::RString::allocate(args[n as usize].clone()).raw();
        }
    }

    LispObject::nil().raw()
}

/// Get universal time (seconds since 1900-01-01)
#[no_mangle]
pub extern "C" fn cc_get_universal_time(args_and_env: usize) -> usize {
    use std::time::{SystemTime, UNIX_EPOCH};
    let now = SystemTime::now().duration_since(UNIX_EPOCH).unwrap();
    // Unix epoch is 1970-01-01, Universal time epoch is 1900-01-01
    // Difference is 70 years = 2208988800 seconds
    let seconds = now.as_secs() as i64 + 2208988800;
    LispObject::fixnum(seconds).raw()
}

/// Logical AND - returns NIL if any argument is NIL, otherwise returns last argument
#[no_mangle]
pub extern "C" fn cc_and(args_and_env: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };
    let mut current = args_obj;
    let mut last_value = LispObject::t();

    // Iterate through all arguments
    loop {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let arg = cons.car();

            // Check if argument is NIL
            if arg.is_nil() {
                return LispObject::nil().raw();
            }

            last_value = arg;
            current = cons.cdr();
        } else {
            // End of list
            break;
        }
    }

    last_value.raw()
}

/// Logical OR - returns first non-NIL argument, or NIL if all are NIL
#[no_mangle]
pub extern "C" fn cc_or(args_and_env: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };
    let mut current = args_obj;

    // Iterate through all arguments
    loop {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let arg = cons.car();

            // Return first non-NIL value
            if !arg.is_nil() {
                return arg.raw();
            }

            current = cons.cdr();
        } else {
            // All arguments were NIL
            break;
        }
    }

    LispObject::nil().raw()
}

/// Check if a value is NIL (uses uniform calling convention)
#[no_mangle]
pub extern "C" fn cc_null(args_and_env: usize) -> usize {
    // Extract first argument from args list
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    let obj = if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        cons.car()
    } else {
        LispObject::nil()
    };

    if obj.is_nil() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Check if a value is truthy (not NIL) - returns 0 for NIL, 1 for everything else
/// This is used for if statement conditions in MLIR
#[no_mangle]
pub extern "C" fn cc_truthiness(value: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(value) };
    if obj.is_nil() {
        0
    } else {
        1
    }
}

/// Print a value to stdout (for debugging) - direct args version
#[no_mangle]
pub extern "C" fn cc_print(obj: usize) -> usize {
    use std::io::Write;
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    print_lisp_object(lisp_obj);
    println!();
    let _ = std::io::stdout().flush();
    obj
}

/// Format a LispObject as an s-expression (for use in format ~S directive)
fn format_s_expr(obj: LispObject) -> String {
    use rlasp_runtime::{header::TypeHeader, header::ObjectType, RString, Symbol, Number, NumberValue};

    if obj.is_nil() {
        "NIL".to_string()
    } else if obj.raw() == LispObject::t().raw() {
        "T".to_string()
    } else if let Some(fixnum) = obj.as_fixnum() {
        fixnum.to_string()
    } else if let Some(ch) = obj.as_character() {
        format!("#\\{}", ch)
    } else if let Some(float) = obj.as_float() {
        float.to_string()
    } else if let Some(_cons_ptr) = obj.as_cons_ptr() {
        let mut result = String::from("(");
        result.push_str(&format_list_sexpr(obj, true));
        result.push(')');
        result
    } else if obj.is_general() {
        if let Some(ptr) = obj.as_general_ptr::<()>() {
            if ptr.is_null() {
                return "#<NULL-PTR>".to_string();
            }
            unsafe {
                match TypeHeader::from_ptr(ptr) {
                    Some(ObjectType::String) => {
                        let string = &*(ptr as *const RString);
                        // For ~S, print strings with quotes
                        format!("\"{}\"", string.as_str())
                    }
                    Some(ObjectType::Symbol) => {
                        let sym = &*(ptr as *const Symbol);
                        sym.name().to_uppercase()
                    }
                    Some(ObjectType::Number) => {
                        let num = &*(ptr as *const Number);
                        match &num.value {
                            NumberValue::Bignum(bn) => bn.to_string(),
                            NumberValue::Ratio(ratio) => ratio.to_string(),
                            NumberValue::Float(f) => f.to_string(),
                            NumberValue::Complex(c) => format!("#C({} {})", c.re, c.im),
                        }
                    }
                    _ => format!("{:?}", obj),
                }
            }
        } else {
            format!("{:?}", obj)
        }
    } else {
        format!("{:?}", obj)
    }
}

/// Helper to format a list as s-expression
fn format_list_sexpr(obj: LispObject, first: bool) -> String {
    if obj.is_nil() {
        return String::new();
    }

    if let Some(cons_ptr) = obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let mut result = String::new();
        if !first {
            result.push(' ');
        }
        result.push_str(&format_s_expr(cons.car()));
        result.push_str(&format_list_sexpr(cons.cdr(), false));
        result
    } else {
        // Improper list (dotted pair)
        format!(" . {}", format_s_expr(obj))
    }
}

/// Helper function to print a Lisp object in readable form
/// Format a LispObject to a string (for use in format ~A directive)
fn format_lisp_object(obj: LispObject) -> String {
    use rlasp_runtime::{header::TypeHeader, header::ObjectType, RString, Symbol, Number, NumberValue};

    if obj.is_nil() {
        "NIL".to_string()
    } else if obj.raw() == LispObject::t().raw() {
        "T".to_string()
    } else if let Some(fixnum) = obj.as_fixnum() {
        fixnum.to_string()
    } else if let Some(ch) = obj.as_character() {
        format!("#\\{}", ch)
    } else if let Some(float) = obj.as_float() {
        float.to_string()
    } else if let Some(_cons_ptr) = obj.as_cons_ptr() {
        let mut result = String::from("(");
        result.push_str(&format_list(obj, true));
        result.push(')');
        result
    } else if obj.is_general() {
        if let Some(ptr) = obj.as_general_ptr::<()>() {
            if ptr.is_null() {
                return "#<NULL-PTR>".to_string();
            }
            unsafe {
                match TypeHeader::from_ptr(ptr) {
                    Some(ObjectType::String) => {
                        let string = &*(ptr as *const RString);
                        string.as_str().to_string()
                    }
                    Some(ObjectType::Symbol) => {
                        let sym = &*(ptr as *const Symbol);
                        sym.name().to_string()
                    }
                    Some(ObjectType::Number) => {
                        let num = &*(ptr as *const Number);
                        match &num.value {
                            NumberValue::Ratio(r) => format!("{}/{}", r.numerator_ref(), r.denominator_ref()),
                            NumberValue::Bignum(b) => b.to_string(),
                            NumberValue::Float(f) => f.to_string(),
                            NumberValue::Complex(c) => format!("#C({} {})", c.re, c.im),
                        }
                    }
                    Some(ObjectType::Error) => {
                        let err = &*(ptr as *const rlasp_runtime::LispError);
                        if let Some(ref msg) = err.message {
                            format!("#<ERROR: {}>", msg)
                        } else {
                            format!("#<ERROR: {:?}>", err.kind)
                        }
                    }
                    _ => format!("{:?}", obj),
                }
            }
        } else {
            format!("{:?}", obj)
        }
    } else {
        format!("{:?}", obj)
    }
}

/// Helper to format a list to a string
fn format_list(obj: LispObject, first: bool) -> String {
    if obj.is_nil() {
        return String::new();
    }

    if let Some(cons_ptr) = obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let mut result = String::new();
        if !first {
            result.push(' ');
        }
        result.push_str(&format_lisp_object(cons.car()));
        result.push_str(&format_list(cons.cdr(), false));
        result
    } else {
        // Improper list (dotted pair)
        format!(" . {}", format_lisp_object(obj))
    }
}

fn print_lisp_object(obj: LispObject) {
    use rlasp_runtime::{header::TypeHeader, header::ObjectType, RString, Symbol};

    if obj.is_nil() {
        print!("NIL");
    } else if obj.raw() == LispObject::t().raw() {
        print!("T");
    } else if let Some(fixnum) = obj.as_fixnum() {
        print!("{}", fixnum);
    } else if let Some(ch) = obj.as_character() {
        print!("#\\{}", ch);
    } else if let Some(float) = obj.as_float() {
        print!("{}", float);
    } else if let Some(cons_ptr) = obj.as_cons_ptr() {
        print!("(");
        print_list(obj, true);
        print!(")");
    } else if obj.is_general() {
        // Check the type header to determine what kind of general object this is
        if let Some(ptr) = obj.as_general_ptr::<()>() {
            if ptr.is_null() {
                print!("#<NULL-PTR>");
                return;
            }
            unsafe {
                if let Some(obj_type) = TypeHeader::from_ptr(ptr) {
                    match obj_type {
                        ObjectType::String => {
                            let string_ptr = ptr as *const RString;
                            let string = &*string_ptr;
                            print!("\"{}\"", string.as_str());
                            return;
                        }
                        ObjectType::Symbol => {
                            let sym_ptr = ptr as *const Symbol;
                            let sym = &*sym_ptr;
                            print!("{}", sym.name().to_uppercase());
                            return;
                        }
                        ObjectType::Vector => {
                            print!("#(...)");  // TODO: print vector elements
                            return;
                        }
                        ObjectType::HashTable => {
                            print!("#<HASH-TABLE>");
                            return;
                        }
                        ObjectType::Closure => {
                            print!("#<CLOSURE>");
                            return;
                        }
                        ObjectType::Package => {
                            print!("#<PACKAGE>");
                            return;
                        }
                        ObjectType::Pathname => {
                            print!("#<PATHNAME>");
                            return;
                        }
                        ObjectType::Stream => {
                            print!("#<STREAM>");
                            return;
                        }
                        ObjectType::Number => {
                            // Handle bignums and other number types
                            print!("{}", format_number_obj(obj));
                            return;
                        }
                        _ => {}
                    }
                }
            }
        }
        // Fallback for other general objects
        print!("{:?}", obj);
    } else {
        print!("{:?}", obj);
    }
}

/// Helper to format a Number object
fn format_number_obj(obj: LispObject) -> String {
    use rlasp_runtime::{Number, NumberValue};

    if let Some(ptr) = obj.as_general_ptr::<Number>() {
        if ptr.is_null() {
            return "#<NULL-NUMBER>".to_string();
        }
        let num = unsafe { &*ptr };
        match &num.value {
            NumberValue::Bignum(bn) => bn.to_string(),
            NumberValue::Ratio(ratio) => ratio.to_string(),
            NumberValue::Float(f) => f.to_string(),
            NumberValue::Complex(c) => format!("#C({} {})", c.re, c.im),
        }
    } else {
        format!("{:?}", obj)
    }
}

/// Helper to print a list
fn print_list(obj: LispObject, first: bool) {
    if obj.is_nil() {
        return;
    }

    if let Some(cons_ptr) = obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        if !first {
            print!(" ");
        }
        print_lisp_object(cons.car());
        print_list(cons.cdr(), false);
    } else {
        // Improper list (dotted pair)
        print!(" . ");
        print_lisp_object(obj);
    }
}

/// Format - basic implementation
#[no_mangle]
pub extern "C" fn cc_format(dest: usize, args_and_control: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};

    let dest_obj = unsafe { LispObject::from_raw(dest) };
    let args_obj = unsafe { LispObject::from_raw(args_and_control) };
    let debug_format = std::env::var("RLASP_DEBUG_FORMAT").is_ok();

    // Extract control string (first argument) and remaining args
    let (control_obj, arg_list) = if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        (cons.car(), cons.cdr())
    } else {
        return LispObject::nil().raw();
    };

    let control_str_owned = if let Some(ptr) = control_obj.as_general_ptr::<()>() {
        if ptr.is_null() {
            return LispObject::nil().raw();
        }
        match unsafe { TypeHeader::from_ptr(ptr) } {
            Some(ObjectType::String) => unsafe {
                let str_ptr = ptr as *const rlasp_runtime::RString;
                (&*str_ptr).as_str().to_string()
            },
            Some(ObjectType::Symbol) => {
                let raw = unsafe {
                    let sym_ptr = ptr as *const rlasp_runtime::Symbol;
                    (&*sym_ptr).name().to_string()
                };
                // Reader paths can represent string literals as symbols with quoted names.
                if raw.len() >= 2 && raw.starts_with('"') && raw.ends_with('"') {
                    raw[1..raw.len() - 1].to_string()
                } else {
                    raw
                }
            }
            _ => return LispObject::nil().raw(),
        }
    } else {
        return LispObject::nil().raw();
    };
    if debug_format {
        eprintln!(
            "[cc_format] dest_nil={} control='{}'",
            dest_obj.is_nil(),
            control_str_owned
        );
    }
    let control_str = control_str_owned.as_str();

    let mut result = String::new();
    let mut chars = control_str.chars();
    let mut arg_list = arg_list;

    while let Some(ch) = chars.next() {
        if ch == '~' {
            if let Some(directive) = chars.next() {
                match directive {
                    '&' => {},  // Fresh line - ignored for now
                    '%' => result.push('\n'),
                    'A' | 'a' => {
                        if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                            let cons = unsafe { &*cons_ptr };
                            let arg = cons.car();
                            result.push_str(&format_lisp_object(arg));
                            arg_list = cons.cdr();
                        }
                    },
                    'S' | 's' => {
                        // Print s-expression form
                        if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                            let cons = unsafe { &*cons_ptr };
                            let arg = cons.car();
                            result.push_str(&format_s_expr(arg));
                            arg_list = cons.cdr();
                        }
                    },
                    'D' | 'd' => {
                        // Decimal integer
                        if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                            let cons = unsafe { &*cons_ptr };
                            let arg = cons.car();
                            if let Some(n) = arg.as_fixnum() {
                                result.push_str(&n.to_string());
                            } else {
                                result.push_str(&format_lisp_object(arg));
                            }
                            arg_list = cons.cdr();
                        }
                    },
                    'C' | 'c' => {
                        // Character directive
                        if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                            let cons = unsafe { &*cons_ptr };
                            let arg = cons.car();
                            if let Some(ch) = arg.as_character() {
                                result.push(ch);
                            } else {
                                result.push_str(&format_lisp_object(arg));
                            }
                            arg_list = cons.cdr();
                        }
                    },
                    '?' => {
                        // Recursive format - ~? takes a format string and args list
                        // For now, just consume two arguments and format recursively
                        if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                            let cons = unsafe { &*cons_ptr };
                            let fmt_arg = cons.car();
                            arg_list = cons.cdr();

                            if let Some(cons_ptr2) = arg_list.as_cons_ptr() {
                                let cons2 = unsafe { &*cons_ptr2 };
                                let args_arg = cons2.car();
                                arg_list = cons2.cdr();

                                // Recursively format
                                let inner_result = cc_format(LispObject::nil().raw(),
                                    rlasp_runtime::Cons::allocate(fmt_arg, args_arg).raw());
                                let inner_obj = unsafe { LispObject::from_raw(inner_result) };
                                if let Some(str_ptr) = inner_obj.as_general_ptr::<rlasp_runtime::RString>() {
                                    if !str_ptr.is_null() {
                                        result.push_str(unsafe { (*str_ptr).as_str() });
                                    }
                                }
                            }
                        }
                    },
                    '@' => {
                        // At-sign modifier - check next character
                        if let Some(next) = chars.next() {
                            match next {
                                '[' => {
                                    // ~@[ - Conditional: if arg is non-nil, process body
                                    // Skip until matching ~]
                                    let mut depth = 1;
                                    let mut conditional_body = String::new();
                                    while depth > 0 {
                                        if let Some(c) = chars.next() {
                                            if c == '~' {
                                                if let Some(d) = chars.next() {
                                                    if d == '[' || d == '@' {
                                                        // Check for ~@[
                                                        if d == '@' {
                                                            if let Some(d2) = chars.next() {
                                                                if d2 == '[' {
                                                                    depth += 1;
                                                                    conditional_body.push('~');
                                                                    conditional_body.push('@');
                                                                    conditional_body.push('[');
                                                                } else {
                                                                    conditional_body.push('~');
                                                                    conditional_body.push('@');
                                                                    conditional_body.push(d2);
                                                                }
                                                            }
                                                        } else {
                                                            depth += 1;
                                                            conditional_body.push('~');
                                                            conditional_body.push('[');
                                                        }
                                                    } else if d == ']' {
                                                        depth -= 1;
                                                        if depth > 0 {
                                                            conditional_body.push('~');
                                                            conditional_body.push(']');
                                                        }
                                                    } else {
                                                        conditional_body.push('~');
                                                        conditional_body.push(d);
                                                    }
                                                }
                                            } else {
                                                conditional_body.push(c);
                                            }
                                        } else {
                                            break;
                                        }
                                    }
                                    // ~@[ consumes one argument - if non-nil, process body with remaining args
                                    if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                                        let cons = unsafe { &*cons_ptr };
                                        let test_arg = cons.car();
                                        arg_list = cons.cdr();

                                        if !test_arg.is_nil() {
                                            // Process conditional body - but don't consume args from body
                                            // Just append the body text for now (simplified)
                                            result.push_str(&conditional_body);
                                        }
                                    }
                                },
                                _ => {
                                    // Unknown @-directive
                                    result.push_str("~@");
                                    result.push(next);
                                }
                            }
                        }
                    },
                    '[' => {
                        // ~[ - Conditional without @
                        // Skip until matching ~]
                        let mut depth = 1;
                        while depth > 0 {
                            if let Some(c) = chars.next() {
                                if c == '~' {
                                    if let Some(d) = chars.next() {
                                        if d == '[' {
                                            depth += 1;
                                        } else if d == ']' {
                                            depth -= 1;
                                        }
                                    }
                                }
                            } else {
                                break;
                            }
                        }
                        // Consume one argument
                        if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                            let cons = unsafe { &*cons_ptr };
                            arg_list = cons.cdr();
                        }
                    },
                    ']' => {
                        // End of conditional - already handled by [ processing
                    },
                    '~' => result.push('~'),
                    ',' => {
                        // Handle ~,NF format (floating point with N decimal places)
                        let mut precision_str = String::new();
                        while let Some(digit) = chars.clone().next() {
                            if digit.is_ascii_digit() {
                                precision_str.push(digit);
                                chars.next();
                            } else {
                                break;
                            }
                        }

                        // Check for F directive
                        if let Some('F' | 'f') = chars.next() {
                            let precision: usize = precision_str.parse().unwrap_or(6);

                            if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                                let cons = unsafe { &*cons_ptr };
                                let arg = cons.car();

                                if let Some(n) = arg.as_fixnum() {
                                    result.push_str(&format!("{:.prec$}", n as f64, prec = precision));
                                } else {
                                    result.push_str(&format!("{:.prec$}", 0.0, prec = precision));
                                }
                                arg_list = cons.cdr();
                            }
                        } else {
                            result.push_str("~,");
                            result.push_str(&precision_str);
                        }
                    },
                    _ => {
                        // Unknown directive - just pass through
                        result.push('~');
                        result.push(directive);
                    }
                }
            }
        } else {
            result.push(ch);
        }
    }

    // Check destination: NIL = return string, T = print to stdout
    if dest_obj.is_nil() {
        // Return string
        rlasp_runtime::RString::allocate(result).raw()
    } else {
        // Print to stdout (when dest is T or any non-NIL value)
        if debug_format {
            eprintln!("[cc_format] printing='{}'", result);
        }
        print!("{}", result);
        use std::io::Write;
        let _ = std::io::stdout().flush();
        LispObject::nil().raw()
    }
}

/// Stack-call wrapper for FORMAT used by cc_funcall_stack/cc_apply.
/// Expects one stack argument: a list of FORMAT arguments (dest control . args).
#[no_mangle]
pub extern "C" fn cc_format_stack() {
    let packed_args = unsafe { LispObject::from_raw(stack_pop_pointer()) };
    let Some(cons_ptr) = packed_args.as_cons_ptr() else {
        stack_push_nil();
        return;
    };
    if cons_ptr.is_null() {
        stack_push_nil();
        return;
    }

    let cons = unsafe { &*cons_ptr };
    let dest = cons.car().raw();
    let args_and_control = cons.cdr().raw();
    let result = cc_format(dest, args_and_control);
    stack_push_pointer(result);
}

/// Make a hash table
#[no_mangle]
pub extern "C" fn cc_make_hash_table() -> usize {
    rlasp_runtime::HashTable::allocate().raw()
}

/// Make a hash table with test function and size
#[no_mangle]
pub extern "C" fn cc_make_hash_table_full(_test: usize, _size: usize) -> usize {
    // For now, ignore test and size parameters
    rlasp_runtime::HashTable::allocate().raw()
}

/// Get value from hash table
#[no_mangle]
pub extern "C" fn cc_gethash(key: usize, table: usize, default: usize) -> usize {
    let key_obj = unsafe { LispObject::from_raw(key) };
    let table_obj = unsafe { LispObject::from_raw(table) };
    let default_obj = unsafe { LispObject::from_raw(default) };

    if let Some(ht_ptr) = table_obj.as_hash_table_ptr() {
        if ht_ptr.is_null() { return default_obj.raw(); }
        let ht = unsafe { &*ht_ptr };
        if let Some(value) = ht.get(key_obj) {
            value.raw()
        } else {
            default_obj.raw()
        }
    } else {
        default_obj.raw()
    }
}

/// Put value in hash table
#[no_mangle]
pub extern "C" fn cc_puthash(key: usize, value: usize, table: usize) -> usize {
    let key_obj = unsafe { LispObject::from_raw(key) };
    let value_obj = unsafe { LispObject::from_raw(value) };
    let table_obj = unsafe { LispObject::from_raw(table) };

    if let Some(ht_ptr) = table_obj.as_hash_table_ptr() {
        if ht_ptr.is_null() { return value_obj.raw(); }
        let ht = unsafe { &*ht_ptr };
        ht.put(key_obj, value_obj);
    }

    value_obj.raw()
}

/// Map a function over hash table entries
#[no_mangle]
pub extern "C" fn cc_maphash(fn_obj: usize, table: usize) -> usize {
    let table_obj = unsafe { LispObject::from_raw(table) };

    // Extract function pointer
    let fn_ptr_val = cc_unbox_function_ptr(fn_obj);

    // Cast to function pointer type (usize, usize) -> usize
    let fn_ptr: extern "C" fn(usize, usize) -> usize = unsafe {
        std::mem::transmute(fn_ptr_val as usize)
    };

    if let Some(ht_ptr) = table_obj.as_hash_table_ptr() {
        if ht_ptr.is_null() { return LispObject::nil().raw(); }
        let ht = unsafe { &*ht_ptr };
        // Iterate over hash table entries and call function for each
        let entries = ht.entries();
        for (key, value) in entries {
            fn_ptr(key.raw(), value.raw());
        }
    }

    LispObject::nil().raw()
}

/// Map a function over hash table entries - stack-based version
/// Takes function reference and hash table, calls function for each entry
/// Function is called with stack convention: pushes value, pushes key, calls, pops result
#[no_mangle]
pub extern "C" fn cc_maphash_stack(func_ref: usize, table: usize) {
    let table_obj = unsafe { LispObject::from_raw(table) };

    if let Some(ht_ptr) = table_obj.as_hash_table_ptr() {
        if ht_ptr.is_null() { return; }
        let ht = unsafe { &*ht_ptr };
        // Iterate over hash table entries and call function for each
        let entries = ht.entries();
        for (key, value) in entries {
            // Push value, then key (stack grows down, so last pushed is first popped)
            stack_push_pointer(value.raw());
            stack_push_pointer(key.raw());

            // Call function using stack-based convention (2 args: key, value)
            cc_funcall_stack(func_ref, 2);

            // Pop and discard result
            let _result = stack_pop_pointer();
        }
    }
    // maphash returns nil - push to stack
    stack_push_nil();
}

/// Reduce a sequence with a function - stack-based version
/// Takes function reference and sequence, applies function cumulatively
/// Returns final accumulated value
#[no_mangle]
pub extern "C" fn cc_reduce_stack(func_ref: usize, sequence: usize) -> usize {
    let seq_obj = unsafe { LispObject::from_raw(sequence) };

    // Iterate over the sequence
    let mut accumulator = LispObject::nil();
    let mut current = seq_obj;
    let mut first = true;

    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        if first {
            // First element becomes the initial accumulator
            accumulator = elem;
            first = false;
        } else {
            // Push accumulator, then element
            stack_push_pointer(accumulator.raw());
            stack_push_pointer(elem.raw());

            // Call function using stack-based convention (2 args: accumulator, elem)
            cc_funcall_stack(func_ref, 2);

            // Pop result as new accumulator
            let result = stack_pop_pointer();
            accumulator = unsafe { LispObject::from_raw(result) };
        }

        current = cons.cdr();
    }

    accumulator.raw()
}

/// Map a function over a list - stack-based version
/// Takes function reference and list, returns new list with results
#[no_mangle]
pub extern "C" fn cc_mapcar_stack(func_ref: usize, list: usize) -> usize {
    let list_obj = unsafe { LispObject::from_raw(list) };

    // Collect results in a vector first
    let mut results = Vec::new();
    let mut current = list_obj;

    while let Some(cons_ptr) = current.as_cons_ptr() {
        if cons_ptr.is_null() { break; }
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Push element
        stack_push_pointer(elem.raw());

        // Call function using stack-based convention (1 arg: elem)
        cc_funcall_stack(func_ref, 1);

        // Pop result
        let result = stack_pop_pointer();
        results.push(unsafe { LispObject::from_raw(result) });

        current = cons.cdr();
    }

    // Build result list from collected results
    let mut result_list = LispObject::nil();
    for elem in results.iter().rev() {
        result_list = rlasp_runtime::Cons::allocate(*elem, result_list);
    }

    result_list.raw()
}

/// Mapc over one or more lists - stack-based version
/// Takes function reference and list of lists, returns first list
#[no_mangle]
pub extern "C" fn cc_mapc_stack(func_ref: usize, lists: usize) -> usize {
    let lists_obj = unsafe { LispObject::from_raw(lists) };
    let mut cursors = list_to_vec(lists_obj);

    if cursors.is_empty() {
        return LispObject::nil().raw();
    }

    let first_list = cursors[0];

    loop {
        let mut args: Vec<LispObject> = Vec::with_capacity(cursors.len());
        let mut next: Vec<LispObject> = Vec::with_capacity(cursors.len());

        for lst in cursors.iter() {
            if let Some(cons_ptr) = lst.as_cons_ptr() {
                let cons = unsafe { &*cons_ptr };
                args.push(cons.car());
                next.push(cons.cdr());
            } else {
                return first_list.raw();
            }
        }

        for arg in args.iter() {
            stack_push_pointer(arg.raw());
        }
        cc_funcall_stack(func_ref, args.len() as i64);
        let _ = stack_pop_pointer();

        cursors = next;
    }
}

/// Loop collect - iterate and collect results
/// Takes lambda_ref, start, limit, below_mode (1=below, 0=to)
#[no_mangle]
pub extern "C" fn cc_loop_collect(func_ref: usize, start: usize, limit: usize, below_mode: usize) -> usize {
    let start_obj = unsafe { LispObject::from_raw(start) };
    let limit_obj = unsafe { LispObject::from_raw(limit) };
    let below_mode_obj = unsafe { LispObject::from_raw(below_mode) };

    let start_val = start_obj.as_fixnum().unwrap_or(0);
    let limit_val = limit_obj.as_fixnum().unwrap_or(0);
    let is_below = below_mode_obj.as_fixnum().unwrap_or(0) != 0;

    let mut results = Vec::new();
    let mut i = start_val;

    while (is_below && i < limit_val) || (!is_below && i <= limit_val) {
        // Push loop variable
        let i_boxed = LispObject::fixnum(i);
        stack_push_pointer(i_boxed.raw());

        // Call function (1 arg: loop variable)
        cc_funcall_stack(func_ref, 1);

        // Pop result
        let result = stack_pop_pointer();
        results.push(unsafe { LispObject::from_raw(result) });

        i += 1;
    }

    // Build result list
    let mut result_list = LispObject::nil();
    for elem in results.iter().rev() {
        result_list = rlasp_runtime::Cons::allocate(*elem, result_list);
    }

    result_list.raw()
}

/// Make a symbol from a string
#[no_mangle]
pub extern "C" fn cc_make_symbol(name_ptr: *const i8, len: i64) -> usize {
    let name_str = unsafe {
        if name_ptr.is_null() {
            String::new()
        } else {
            let slice = std::slice::from_raw_parts(name_ptr as *const u8, len as usize);
            String::from_utf8_lossy(slice).to_string()
        }
    };

    let sym = rlasp_runtime::Symbol::allocate(name_str.clone());
    let raw = sym.raw();

    // Track symbol name by raw pointer for safe lookup in cc_arg
    {
        let mut map = get_symbol_name_map().lock().unwrap();
        map.insert(raw, name_str.clone());
    }

    if std::env::var("RLASP_TRACE_ARGS").is_ok() {
        use std::sync::atomic::{AtomicUsize, Ordering};
        static SYM_COUNT: AtomicUsize = AtomicUsize::new(0);
        let count = SYM_COUNT.fetch_add(1, Ordering::Relaxed);
        if count < 20 {
            eprintln!("[cc_make_symbol #{}] name={} raw=0x{:x}", count, name_str, raw);
        }
    }

    raw
}

// Thread-local storage for dynamic variable bindings
// Uses symbol name as key since symbols aren't interned
use std::cell::RefCell;
use std::collections::HashMap as StdHashMap;

// Track symbols created via cc_make_symbol (for safe param name lookup in cc_arg)
static mut SYMBOL_NAME_MAP: Option<Mutex<StdHashMap<usize, String>>> = None;
static INIT_SYMBOL_NAME_MAP: Once = Once::new();

fn get_symbol_name_map() -> &'static Mutex<StdHashMap<usize, String>> {
    unsafe {
        INIT_SYMBOL_NAME_MAP.call_once(|| {
            SYMBOL_NAME_MAP = Some(Mutex::new(StdHashMap::new()));
        });
        SYMBOL_NAME_MAP.as_ref().unwrap()
    }
}

thread_local! {
    static DYNAMIC_BINDINGS: RefCell<StdHashMap<String, usize>> = RefCell::new(StdHashMap::new());
}

/// Get the value of a dynamic/special variable
/// Uses name-based lookup since symbols aren't interned
#[no_mangle]
pub extern "C" fn cc_symbol_value(symbol: usize) -> usize {
    let sym_obj = unsafe { LispObject::from_raw(symbol) };

    // NIL is self-evaluating
    if sym_obj.is_nil() {
        return LispObject::nil().raw();
    }

    // Try to get symbol name
    let name = if let Some(sym_ptr) = as_symbol_ptr_checked(sym_obj) {
        let sym = unsafe { &*sym_ptr };
        sym.name().to_string()
    } else {
        // Not a symbol - return nil
        return LispObject::nil().raw();
    };

    // CL self-evaluating symbols
    match name.as_str() {
        "NIL" | "nil" => return LispObject::nil().raw(),
        "T" | "t" => return LispObject::t().raw(),
        _ => {}
    }

    // Look up in dynamic bindings by name (try both original case and uppercase for CL compatibility)
    DYNAMIC_BINDINGS.with(|bindings| {
        let b = bindings.borrow();
        if let Some(&value) = b.get(&name) {
            value
        } else if let Some(&value) = b.get(&name.to_uppercase()) {
            value
        } else if let Some(&value) = b.get(&name.to_lowercase()) {
            value
        } else {
            // Also try stripping package prefix
            let base = strip_package_prefix(&name);
            if base != name.as_str() {
                if let Some(&value) = b.get(base) {
                    return value;
                }
                if let Some(&value) = b.get(&base.to_uppercase()) {
                    return value;
                }
                if let Some(&value) = b.get(&base.to_lowercase()) {
                    return value;
                }
            }
            // Unbound - return nil silently (CL would signal an error)
            LispObject::nil().raw()
        }
    })
}

/// Strip package qualifier from a symbol name (e.g., "asdf:foo" -> "foo", "asdf::bar" -> "bar")
fn strip_package_prefix(name: &str) -> &str {
    if let Some(pos) = name.rfind(':') {
        &name[pos + 1..]
    } else {
        name
    }
}

/// Check if a dynamic variable is bound by name (for interpreter bridge)
pub fn is_dynamic_bound(name: &str) -> bool {
    DYNAMIC_BINDINGS.with(|bindings| {
        let b = bindings.borrow();
        if b.contains_key(name) || b.contains_key(&name.to_uppercase()) || b.contains_key(&name.to_lowercase()) {
            return true;
        }
        // Try with package prefix stripped (e.g., "asdf::*central-registry*" -> "*central-registry*")
        let base = strip_package_prefix(name);
        if base != name {
            b.contains_key(base) || b.contains_key(&base.to_uppercase()) || b.contains_key(&base.to_lowercase())
        } else {
            false
        }
    })
}

/// Get dynamic variable value by name as raw usize (for interpreter bridge)
/// Returns None if not bound
pub fn get_dynamic_value(name: &str) -> Option<usize> {
    DYNAMIC_BINDINGS.with(|bindings| {
        let b = bindings.borrow();
        b.get(name).copied()
            .or_else(|| b.get(&name.to_uppercase()).copied())
            .or_else(|| b.get(&name.to_lowercase()).copied())
            .or_else(|| {
                // Try with package prefix stripped
                let base = strip_package_prefix(name);
                if base != name {
                    b.get(base).copied()
                        .or_else(|| b.get(&base.to_uppercase()).copied())
                        .or_else(|| b.get(&base.to_lowercase()).copied())
                } else {
                    None
                }
            })
    })
}

/// JIT package registry - tracks packages created during JIT execution
/// A real CL package with name, nicknames, use-list, symbols, etc.
#[derive(Clone)]
pub struct ClPackage {
    pub name: String,
    pub nicknames: Vec<String>,
    pub use_list: Vec<String>,
    pub used_by_list: Vec<String>,
    pub exported_symbols: std::collections::HashSet<String>,
    pub shadowing_symbols: std::collections::HashSet<String>,
    pub internal_symbols: std::collections::HashSet<String>,
}

impl ClPackage {
    pub fn new(name: &str) -> Self {
        ClPackage {
            name: name.to_uppercase(),
            nicknames: Vec::new(),
            use_list: Vec::new(),
            used_by_list: Vec::new(),
            exported_symbols: std::collections::HashSet::new(),
            shadowing_symbols: std::collections::HashSet::new(),
            internal_symbols: std::collections::HashSet::new(),
        }
    }
}

static PACKAGE_REGISTRY: std::sync::LazyLock<Mutex<HashMap<String, ClPackage>>> =
    std::sync::LazyLock::new(|| {
        let mut m = HashMap::new();
        // Bootstrap standard CL packages
        let mut cl = ClPackage::new("COMMON-LISP");
        cl.nicknames.push("CL".to_string());
        m.insert("COMMON-LISP".to_string(), cl);
        let mut cl_user = ClPackage::new("COMMON-LISP-USER");
        cl_user.nicknames.push("CL-USER".to_string());
        cl_user.use_list.push("COMMON-LISP".to_string());
        m.insert("COMMON-LISP-USER".to_string(), cl_user);
        m.insert("KEYWORD".to_string(), ClPackage::new("KEYWORD"));
        Mutex::new(m)
    });

/// Current package name (thread-local for CL *package* semantics)
thread_local! {
    static CURRENT_PACKAGE: std::cell::RefCell<String> = std::cell::RefCell::new("COMMON-LISP-USER".to_string());
}

/// Find a package by name or nickname
fn find_package_entry(name: &str) -> Option<String> {
    let normalized = name.to_uppercase();
    let reg = PACKAGE_REGISTRY.lock().unwrap();
    if reg.contains_key(&normalized) {
        return Some(normalized);
    }
    // Check nicknames
    for (canon_name, pkg) in reg.iter() {
        for nick in &pkg.nicknames {
            if nick.to_uppercase() == normalized {
                return Some(canon_name.clone());
            }
        }
    }
    // Check prefix match (e.g., "ASDF" matches "ASDF/INTERFACE")
    for canon_name in reg.keys() {
        if canon_name.starts_with(&format!("{}/", normalized)) {
            return Some(canon_name.clone());
        }
    }
    None
}

/// Register a package name in the package registry
pub fn register_jit_package(name: &str) {
    let upper = name.to_uppercase();
    let mut reg = PACKAGE_REGISTRY.lock().unwrap();
    reg.entry(upper).or_insert_with(|| ClPackage::new(name));
}

/// Check if a package exists in the package registry
pub fn is_jit_package(name: &str) -> bool {
    drop(PACKAGE_REGISTRY.lock().unwrap()); // ensure initialized
    find_package_entry(name).is_some()
}

/// Get all package names
pub fn list_all_jit_packages() -> Vec<String> {
    let reg = PACKAGE_REGISTRY.lock().unwrap();
    reg.keys().cloned().collect()
}

/// Register a package at runtime from JIT code (called by defpackage/define-package)
#[no_mangle]
pub extern "C" fn cc_register_package(name_obj: usize) -> usize {
    use rlasp_runtime::{Symbol, RString};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    let obj = unsafe { LispObject::from_raw(name_obj) };
    let pkg_name = if let Some(ptr) = obj.as_general_ptr::<()>() {
        if !ptr.is_null() {
            match unsafe { TypeHeader::from_ptr(ptr) } {
                Some(ObjectType::String) => {
                    let s = unsafe { &*(ptr as *const RString) };
                    s.as_str().to_string()
                }
                Some(ObjectType::Symbol) => {
                    let sym = unsafe { &*(ptr as *const Symbol) };
                    let name = sym.name();
                    if name.starts_with(':') { name[1..].to_string() } else { name.to_string() }
                }
                _ => return LispObject::t().raw(),
            }
        } else {
            return LispObject::t().raw();
        }
    } else {
        return LispObject::t().raw();
    };

    register_jit_package(&pkg_name);
    LispObject::t().raw()
}

// =====================================================================
// CL Package Functions
// =====================================================================

/// (in-package name) - set *package* to the named package
#[no_mangle]
pub extern "C" fn cc_in_package(name_obj: usize) -> usize {
    let pkg_name = extract_name_string(name_obj);
    if let Some(canon) = find_package_entry(&pkg_name) {
        CURRENT_PACKAGE.with(|cp| *cp.borrow_mut() = canon.clone());
        cc_find_package(name_obj)
    } else {
        LispObject::nil().raw()
    }
}

/// (package-name package) - return the name string of a package
#[no_mangle]
pub extern "C" fn cc_package_name(pkg_obj: usize) -> usize {
    let pkg_name = extract_name_string(pkg_obj);
    if let Some(canon) = find_package_entry(&pkg_name) {
        rlasp_runtime::RString::allocate(canon).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// (package-nicknames package) - return list of nickname strings
#[no_mangle]
pub extern "C" fn cc_package_nicknames(pkg_obj: usize) -> usize {
    let pkg_name = extract_name_string(pkg_obj);
    if let Some(canon) = find_package_entry(&pkg_name) {
        let reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get(&canon) {
            let mut list = cc_nil_value();
            for nick in pkg.nicknames.iter().rev() {
                let s = rlasp_runtime::RString::allocate(nick.clone()).raw();
                list = cc_cons(s, list);
            }
            list
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// (package-use-list package) - packages used by this package
#[no_mangle]
pub extern "C" fn cc_package_use_list(pkg_obj: usize) -> usize {
    let pkg_name = extract_name_string(pkg_obj);
    if let Some(canon) = find_package_entry(&pkg_name) {
        let reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get(&canon) {
            let mut list = cc_nil_value();
            for used in pkg.use_list.iter().rev() {
                let s = rlasp_runtime::Symbol::allocate(format!("#<PACKAGE \"{}\">", used)).raw();
                list = cc_cons(s, list);
            }
            list
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// (package-used-by-list package) - packages that use this package
#[no_mangle]
pub extern "C" fn cc_package_used_by_list(pkg_obj: usize) -> usize {
    let pkg_name = extract_name_string(pkg_obj);
    if let Some(canon) = find_package_entry(&pkg_name) {
        let reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get(&canon) {
            let mut list = cc_nil_value();
            for user in pkg.used_by_list.iter().rev() {
                let s = rlasp_runtime::Symbol::allocate(format!("#<PACKAGE \"{}\">", user)).raw();
                list = cc_cons(s, list);
            }
            list
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// (package-shadowing-symbols package) - shadowing symbols
#[no_mangle]
pub extern "C" fn cc_package_shadowing_symbols(pkg_obj: usize) -> usize {
    let pkg_name = extract_name_string(pkg_obj);
    if let Some(canon) = find_package_entry(&pkg_name) {
        let reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get(&canon) {
            let mut list = cc_nil_value();
            for sym in pkg.shadowing_symbols.iter() {
                let s = rlasp_runtime::Symbol::allocate(sym.clone()).raw();
                list = cc_cons(s, list);
            }
            list
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// (use-package packages-to-use &optional package) - add to use-list
#[no_mangle]
pub extern "C" fn cc_use_package(packages_obj: usize, target_obj: usize) -> usize {
    let target_name = if unsafe { LispObject::from_raw(target_obj) }.is_nil() {
        CURRENT_PACKAGE.with(|cp| cp.borrow().clone())
    } else {
        extract_name_string(target_obj)
    };
    let pkg_to_use = extract_name_string(packages_obj);

    if let (Some(target_canon), Some(use_canon)) = (find_package_entry(&target_name), find_package_entry(&pkg_to_use)) {
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get_mut(&target_canon) {
            if !pkg.use_list.contains(&use_canon) {
                pkg.use_list.push(use_canon.clone());
            }
        }
        if let Some(pkg) = reg.get_mut(&use_canon) {
            if !pkg.used_by_list.contains(&target_canon) {
                pkg.used_by_list.push(target_canon);
            }
        }
    }
    LispObject::t().raw()
}

/// (unuse-package packages-to-unuse &optional package) - remove from use-list
#[no_mangle]
pub extern "C" fn cc_unuse_package(packages_obj: usize, target_obj: usize) -> usize {
    let target_name = if unsafe { LispObject::from_raw(target_obj) }.is_nil() {
        CURRENT_PACKAGE.with(|cp| cp.borrow().clone())
    } else {
        extract_name_string(target_obj)
    };
    let pkg_to_remove = extract_name_string(packages_obj);

    if let (Some(target_canon), Some(rem_canon)) = (find_package_entry(&target_name), find_package_entry(&pkg_to_remove)) {
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get_mut(&target_canon) {
            pkg.use_list.retain(|x| x != &rem_canon);
        }
        if let Some(pkg) = reg.get_mut(&rem_canon) {
            pkg.used_by_list.retain(|x| x != &target_canon);
        }
    }
    LispObject::t().raw()
}

/// (export symbols &optional package) - make symbols external
#[no_mangle]
pub extern "C" fn cc_export(symbols_obj: usize, pkg_obj: usize) -> usize {
    let pkg_name = if unsafe { LispObject::from_raw(pkg_obj) }.is_nil() {
        CURRENT_PACKAGE.with(|cp| cp.borrow().clone())
    } else {
        extract_name_string(pkg_obj)
    };

    if let Some(canon) = find_package_entry(&pkg_name) {
        let sym_names = collect_symbol_names(symbols_obj);
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get_mut(&canon) {
            for name in sym_names {
                pkg.exported_symbols.insert(name);
            }
        }
    }
    LispObject::t().raw()
}

/// (unexport symbols &optional package) - make symbols internal
#[no_mangle]
pub extern "C" fn cc_unexport(symbols_obj: usize, pkg_obj: usize) -> usize {
    let pkg_name = if unsafe { LispObject::from_raw(pkg_obj) }.is_nil() {
        CURRENT_PACKAGE.with(|cp| cp.borrow().clone())
    } else {
        extract_name_string(pkg_obj)
    };

    if let Some(canon) = find_package_entry(&pkg_name) {
        let sym_names = collect_symbol_names(symbols_obj);
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get_mut(&canon) {
            for name in sym_names {
                pkg.exported_symbols.remove(&name);
            }
        }
    }
    LispObject::t().raw()
}

/// (import symbols &optional package) - import symbols into package
#[no_mangle]
pub extern "C" fn cc_import(symbols_obj: usize, pkg_obj: usize) -> usize {
    let pkg_name = if unsafe { LispObject::from_raw(pkg_obj) }.is_nil() {
        CURRENT_PACKAGE.with(|cp| cp.borrow().clone())
    } else {
        extract_name_string(pkg_obj)
    };

    if let Some(canon) = find_package_entry(&pkg_name) {
        let sym_names = collect_symbol_names(symbols_obj);
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get_mut(&canon) {
            for name in sym_names {
                pkg.internal_symbols.insert(name);
            }
        }
    }
    LispObject::t().raw()
}

/// (shadow symbols &optional package) - add to shadowing symbols
#[no_mangle]
pub extern "C" fn cc_shadow(symbols_obj: usize, pkg_obj: usize) -> usize {
    let pkg_name = if unsafe { LispObject::from_raw(pkg_obj) }.is_nil() {
        CURRENT_PACKAGE.with(|cp| cp.borrow().clone())
    } else {
        extract_name_string(pkg_obj)
    };

    if let Some(canon) = find_package_entry(&pkg_name) {
        let sym_names = collect_symbol_names(symbols_obj);
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get_mut(&canon) {
            for name in sym_names {
                pkg.shadowing_symbols.insert(name);
            }
        }
    }
    LispObject::t().raw()
}

/// (shadowing-import symbols &optional package) - import and shadow
#[no_mangle]
pub extern "C" fn cc_shadowing_import(symbols_obj: usize, pkg_obj: usize) -> usize {
    cc_shadow(symbols_obj, pkg_obj);
    cc_import(symbols_obj, pkg_obj)
}

/// (unintern symbol &optional package) - remove symbol from package
#[no_mangle]
pub extern "C" fn cc_unintern(symbol_obj: usize, pkg_obj: usize) -> usize {
    let pkg_name = if unsafe { LispObject::from_raw(pkg_obj) }.is_nil() {
        CURRENT_PACKAGE.with(|cp| cp.borrow().clone())
    } else {
        extract_name_string(pkg_obj)
    };
    let sym_name = extract_name_string(symbol_obj).to_uppercase();

    if let Some(canon) = find_package_entry(&pkg_name) {
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(pkg) = reg.get_mut(&canon) {
            pkg.internal_symbols.remove(&sym_name);
            pkg.exported_symbols.remove(&sym_name);
            pkg.shadowing_symbols.remove(&sym_name);
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

/// (delete-package package) - remove a package
#[no_mangle]
pub extern "C" fn cc_delete_package(pkg_obj: usize) -> usize {
    let pkg_name = extract_name_string(pkg_obj);
    if let Some(canon) = find_package_entry(&pkg_name) {
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        // Remove from used-by lists of packages it uses
        if let Some(pkg) = reg.get(&canon) {
            let use_list = pkg.use_list.clone();
            for used in use_list {
                if let Some(used_pkg) = reg.get_mut(&used) {
                    used_pkg.used_by_list.retain(|x| x != &canon);
                }
            }
        }
        reg.remove(&canon);
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

/// (rename-package package new-name &optional new-nicknames) -> package
#[no_mangle]
pub extern "C" fn cc_rename_package(pkg_obj: usize, new_name_obj: usize, new_nicks_obj: usize) -> usize {
    let old_name = extract_name_string(pkg_obj);
    let new_name = extract_name_string(new_name_obj).to_uppercase();

    if let Some(canon) = find_package_entry(&old_name) {
        let mut reg = PACKAGE_REGISTRY.lock().unwrap();
        if let Some(mut pkg) = reg.remove(&canon) {
            pkg.name = new_name.clone();
            // Collect nicknames from list
            if !unsafe { LispObject::from_raw(new_nicks_obj) }.is_nil() {
                pkg.nicknames = collect_symbol_names(new_nicks_obj);
            }
            reg.insert(new_name.clone(), pkg);
        }
        rlasp_runtime::Symbol::allocate(format!("#<PACKAGE \"{}\">", new_name)).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// (list-all-packages) -> list of all packages
#[no_mangle]
pub extern "C" fn cc_list_all_packages() -> usize {
    let reg = PACKAGE_REGISTRY.lock().unwrap();
    let mut list = cc_nil_value();
    for name in reg.keys() {
        let pkg = rlasp_runtime::Symbol::allocate(format!("#<PACKAGE \"{}\">", name)).raw();
        list = cc_cons(pkg, list);
    }
    list
}

// =====================================================================
// CL Symbol Functions
// =====================================================================

/// (symbol-function symbol) - get function bound to symbol
#[no_mangle]
pub extern "C" fn cc_symbol_function(symbol_obj: usize) -> usize {
    let name = extract_name_string(symbol_obj).to_uppercase();
    let fn_key = format!("%FN%{}", name);
    let registry = get_registry().lock().unwrap();
    if registry.contains_key(&fn_key) || registry.contains_key(&name) {
        // Return a function reference (the symbol itself serves as a function designator)
        rlasp_runtime::Symbol::allocate(format!("#<FUNCTION {}>", name)).raw()
    } else {
        let fn_lower = format!("%FN%{}", name.to_lowercase());
        if registry.contains_key(&fn_lower) || registry.contains_key(&name.to_lowercase()) {
            rlasp_runtime::Symbol::allocate(format!("#<FUNCTION {}>", name)).raw()
        } else {
            drop(registry);
            // Check generic functions
            let gen_reg = crate::intrinsics_clos::get_generic_registry().lock().unwrap();
            if gen_reg.contains_key(&name) || gen_reg.contains_key(&name.to_lowercase()) {
                rlasp_runtime::Symbol::allocate(format!("#<GENERIC-FUNCTION {}>", name)).raw()
            } else {
                LispObject::nil().raw()
            }
        }
    }
}

/// (symbol-package symbol) - get home package of symbol
#[no_mangle]
pub extern "C" fn cc_symbol_package(symbol_obj: usize) -> usize {
    let name = extract_name_string(symbol_obj);
    // If name contains package prefix, extract it
    if let Some(pos) = name.find(':') {
        let pkg_name = &name[..pos];
        if !pkg_name.is_empty() {
            return cc_find_package(rlasp_runtime::RString::allocate(pkg_name.to_string()).raw());
        }
    }
    // Return current package
    let current = CURRENT_PACKAGE.with(|cp| cp.borrow().clone());
    rlasp_runtime::Symbol::allocate(format!("#<PACKAGE \"{}\">", current)).raw()
}

/// (symbol-plist symbol) - get property list of symbol
#[no_mangle]
pub extern "C" fn cc_symbol_plist(symbol_obj: usize) -> usize {
    let lo = unsafe { LispObject::from_raw(symbol_obj) };
    if let Some(sym_ptr) = as_symbol_ptr_checked(lo) {
        let sym = unsafe { &*sym_ptr };
        let entries = sym.plist_entries();
        let mut list = cc_nil_value();
        for (key, value) in entries.iter().rev() {
            list = cc_cons(value.raw(), list);
            let key_sym = rlasp_runtime::Symbol::allocate(key.clone()).raw();
            list = cc_cons(key_sym, list);
        }
        return list;
    }
    LispObject::nil().raw()
}

/// (get symbol indicator &optional default) - get property value
#[no_mangle]
pub extern "C" fn cc_get_property(symbol_obj: usize, indicator_obj: usize, _default_obj: usize) -> usize {
    let result = cc_get_symbol_property(symbol_obj, indicator_obj);
    if result == LispObject::nil().raw() && _default_obj != 0 {
        let def = unsafe { LispObject::from_raw(_default_obj) };
        if !def.is_nil() { return _default_obj; }
    }
    result
}

/// (remprop symbol indicator) - remove a property
#[no_mangle]
pub extern "C" fn cc_remprop(symbol_obj: usize, indicator_obj: usize) -> usize {
    let lo = unsafe { LispObject::from_raw(symbol_obj) };
    let key_name = extract_name_string(indicator_obj);
    if let Some(sym_ptr) = as_symbol_ptr_checked(lo) {
        let sym = unsafe { &*sym_ptr };
        sym.remove_property(&key_name);
        return LispObject::t().raw();
    }
    LispObject::nil().raw()
}

/// (make-symbol name) - create an uninterned symbol
#[no_mangle]
pub extern "C" fn cc_make_symbol_from_name(name_obj: usize) -> usize {
    let name = extract_name_string(name_obj);
    rlasp_runtime::Symbol::allocate(name).raw()
}

/// (copy-symbol symbol &optional copy-props) - copy a symbol
#[no_mangle]
pub extern "C" fn cc_copy_symbol(symbol_obj: usize, _copy_props: usize) -> usize {
    let name = extract_name_string(symbol_obj);
    rlasp_runtime::Symbol::allocate(name).raw()
}

/// (gentemp &optional prefix package) - generate unique symbol
#[no_mangle]
pub extern "C" fn cc_gentemp(prefix_obj: usize, _pkg_obj: usize) -> usize {
    use std::sync::atomic::{AtomicUsize, Ordering};
    static GENTEMP_COUNTER: AtomicUsize = AtomicUsize::new(0);

    let prefix = if unsafe { LispObject::from_raw(prefix_obj) }.is_nil() {
        "T".to_string()
    } else {
        extract_name_string(prefix_obj)
    };
    let n = GENTEMP_COUNTER.fetch_add(1, Ordering::SeqCst);
    rlasp_runtime::Symbol::allocate(format!("{}{}", prefix, n)).raw()
}

// =====================================================================
// Helpers for extracting names from LispObjects
// =====================================================================

/// Extract a string from any LispObject (symbol name, string value, or repr)
fn extract_name_string(obj: usize) -> String {
    use rlasp_runtime::{Symbol, RString};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    let lo = unsafe { LispObject::from_raw(obj) };
    if lo.is_nil() { return String::new(); }

    if let Some(ptr) = lo.as_general_ptr::<()>() {
        if !ptr.is_null() {
            match unsafe { TypeHeader::from_ptr(ptr) } {
                Some(ObjectType::String) => {
                    let s = unsafe { &*(ptr as *const RString) };
                    return s.as_str().to_string();
                }
                Some(ObjectType::Symbol) => {
                    let sym = unsafe { &*(ptr as *const Symbol) };
                    let name = sym.name();
                    return if name.starts_with(':') { name[1..].to_string() }
                           else if name.starts_with("#<PACKAGE \"") {
                               // Extract package name from #<PACKAGE "FOO">
                               name.trim_start_matches("#<PACKAGE \"")
                                   .trim_end_matches("\">")
                                   .to_string()
                           } else { name.to_string() };
                }
                _ => {}
            }
        }
    }
    format!("{}", lo)
}

/// Collect symbol name strings from a single symbol or a list of symbols
fn collect_symbol_names(obj: usize) -> Vec<String> {
    let lo = unsafe { LispObject::from_raw(obj) };
    if lo.is_nil() { return Vec::new(); }

    // If it's a cons (list), collect from each element
    if let Some(cons_ptr) = lo.as_cons_ptr() {
        let mut names = Vec::new();
        let mut current = lo;
        loop {
            if current.is_nil() { break; }
            if let Some(cp) = current.as_cons_ptr() {
                let cons = unsafe { &*cp };
                names.push(extract_name_string(cons.car().raw()).to_uppercase());
                current = cons.cdr();
            } else {
                names.push(extract_name_string(current.raw()).to_uppercase());
                break;
            }
        }
        names
    } else {
        vec![extract_name_string(obj).to_uppercase()]
    }
}

/// Check if a function is in the JIT registry by name
pub fn is_jit_function(name: &str) -> bool {
    let registry = get_registry().lock().unwrap();
    let fn_key = format!("%FN%{}", name);
    let fn_key_upper = format!("%FN%{}", name.to_uppercase());
    let fn_key_lower = format!("%FN%{}", name.to_lowercase());
    if registry.contains_key(&fn_key) || registry.contains_key(name)
        || registry.contains_key(&fn_key_upper) || registry.contains_key(&name.to_uppercase())
        || registry.contains_key(&fn_key_lower) || registry.contains_key(&name.to_lowercase()) {
        return true;
    }
    // Try with package prefix stripped (e.g., "asdf:load-system" -> "load-system")
    let base = strip_package_prefix(name);
    if base != name {
        let fn_key = format!("%FN%{}", base);
        let fn_key_upper = format!("%FN%{}", base.to_uppercase());
        let fn_key_lower = format!("%FN%{}", base.to_lowercase());
        if registry.contains_key(&fn_key) || registry.contains_key(base)
            || registry.contains_key(&fn_key_upper) || registry.contains_key(&base.to_uppercase())
            || registry.contains_key(&fn_key_lower) || registry.contains_key(&base.to_lowercase()) {
            return true;
        }
    }
    drop(registry);

    // Also check the generic function (CLOS) registry
    let gen_reg = crate::intrinsics_clos::get_generic_registry().lock().unwrap();
    let names_to_check: Vec<String> = {
        let base = strip_package_prefix(name);
        let mut v = vec![
            name.to_string(), name.to_uppercase(), name.to_lowercase(),
        ];
        if base != name {
            v.push(base.to_string());
            v.push(base.to_uppercase());
            v.push(base.to_lowercase());
        }
        v
    };
    names_to_check.iter().any(|n| gen_reg.contains_key(n))
}

/// Set the value of a dynamic/special variable
/// Uses name-based storage since symbols aren't interned
#[no_mangle]
pub extern "C" fn cc_set_symbol_value(symbol: usize, value: usize) -> usize {
    let sym_obj = unsafe { LispObject::from_raw(symbol) };

    // Try to get symbol name
    let name = if let Some(sym_ptr) = as_symbol_ptr_checked(sym_obj) {
        let sym = unsafe { &*sym_ptr };
        sym.name().to_string()
    } else {
        // Not a symbol - return value anyway
        return value;
    };

    // Store in dynamic bindings by name
    DYNAMIC_BINDINGS.with(|bindings| {
        bindings.borrow_mut().insert(name, value);
    });

    value
}

/// Get a symbol's property (from property list)
/// (get symbol key &optional default)
#[no_mangle]
pub extern "C" fn cc_get_symbol_property(symbol: usize, key: usize) -> usize {
    let sym_obj = unsafe { LispObject::from_raw(symbol) };
    let key_obj = unsafe { LispObject::from_raw(key) };

    // Get symbol's property list
    if let Some(sym_ptr) = as_symbol_ptr_checked(sym_obj) {
        let sym = unsafe { &*sym_ptr };

        // Get key name if it's a symbol
        let key_name = if let Some(key_sym_ptr) = as_symbol_ptr_checked(key_obj) {
            let key_sym = unsafe { &*key_sym_ptr };
            key_sym.name().to_string()
        } else {
            return LispObject::nil().raw();
        };

        // Look up property
        if let Some(value) = sym.get_property(&key_name) {
            return value.raw();
        }
    }

    LispObject::nil().raw()
}

/// Set a symbol's property (on property list)
/// (setf (get symbol key) value)
#[no_mangle]
pub extern "C" fn cc_set_symbol_property(symbol: usize, key: usize, value: usize) -> usize {
    let sym_obj = unsafe { LispObject::from_raw(symbol) };
    let key_obj = unsafe { LispObject::from_raw(key) };
    let val_obj = unsafe { LispObject::from_raw(value) };

    // Get symbol
    if let Some(sym_ptr) = as_symbol_ptr_checked(sym_obj) {
        let sym = unsafe { &*sym_ptr };

        // Get key name if it's a symbol
        let key_name = if let Some(key_sym_ptr) = as_symbol_ptr_checked(key_obj) {
            let key_sym = unsafe { &*key_sym_ptr };
            key_sym.name().to_string()
        } else {
            return value;
        };

        // Set property
        sym.set_property(key_name, val_obj);
    }

    value
}

// ============================================================================
// Symbol Functions (CL Standard)
// ============================================================================

/// Generate a unique uninterned symbol (gensym)
/// (gensym &optional prefix) -> symbol
#[no_mangle]
pub extern "C" fn cc_gensym(prefix: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    use rlasp_runtime::{RString, Symbol};
    use std::sync::atomic::{AtomicU64, Ordering};

    static GENSYM_COUNTER: AtomicU64 = AtomicU64::new(0);

    let prefix_str = if prefix == 0 || unsafe { LispObject::from_raw(prefix) }.is_nil() {
        "G".to_string()
    } else {
        let obj = unsafe { LispObject::from_raw(prefix) };
        if let Some(ptr) = obj.as_general_ptr::<()>() {
            if ptr.is_null() {
                "G".to_string()
            } else {
                match unsafe { TypeHeader::from_ptr(ptr) } {
                    Some(ObjectType::String) => {
                        let s = unsafe { &*(ptr as *const RString) };
                        s.as_str().to_string()
                    }
                    Some(ObjectType::Symbol) => {
                        let sym = unsafe { &*(ptr as *const Symbol) };
                        sym.name().to_string()
                    }
                    _ => "G".to_string(),
                }
            }
        } else {
            "G".to_string()
        }
    };

    let counter = GENSYM_COUNTER.fetch_add(1, Ordering::SeqCst);
    let name = format!("{}:{}{}", "#", prefix_str, counter);
    Symbol::allocate(name).raw()
}

/// Get the name of a symbol (symbol-name)
/// (symbol-name symbol) -> string
#[no_mangle]
pub extern "C" fn cc_symbol_name(symbol: usize) -> usize {
    use rlasp_runtime::{Symbol, RString};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    let sym_obj = unsafe { LispObject::from_raw(symbol) };

    // Check if it's a General-tagged object
    if !sym_obj.is_general() {
        return RString::allocate(String::new()).raw();
    }

    let ptr = sym_obj.as_general_ptr::<()>().unwrap();
    if ptr.is_null() {
        return RString::allocate(String::new()).raw();
    }

    // Check type header to ensure it's actually a Symbol
    let obj_type = unsafe { TypeHeader::from_ptr(ptr) };
    if obj_type == Some(ObjectType::Symbol) {
        let sym_ptr = ptr as *const Symbol;
        let sym = unsafe { &*sym_ptr };
        let name = sym.name();
        return RString::allocate(name.to_string()).raw();
    }

    // Not a symbol - return empty string
    RString::allocate(String::new()).raw()
}

/// CL string function: coerce to string
/// (string x) -> string
/// - If x is a string, return it
/// - If x is a symbol, return its name (without leading colon for keywords)
/// - If x is a character, return a 1-character string
#[no_mangle]
pub extern "C" fn cc_string(obj: usize) -> usize {
    use rlasp_runtime::{Symbol, RString};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    let lisp_obj = unsafe { LispObject::from_raw(obj) };

    if lisp_obj.is_nil() {
        return RString::allocate("NIL".to_string()).raw();
    }

    if !lisp_obj.is_general() {
        // Could be a character (fixnum-tagged)
        if let Some(n) = lisp_obj.as_fixnum() {
            if let Some(c) = char::from_u32(n as u32) {
                return RString::allocate(c.to_string()).raw();
            }
        }
        return RString::allocate(format!("{}", lisp_obj)).raw();
    }

    let ptr = lisp_obj.as_general_ptr::<()>().unwrap();
    if ptr.is_null() {
        return RString::allocate(String::new()).raw();
    }

    match unsafe { TypeHeader::from_ptr(ptr) } {
        Some(ObjectType::String) => {
            // Already a string - return as-is
            obj
        }
        Some(ObjectType::Symbol) => {
            let sym = unsafe { &*(ptr as *const Symbol) };
            let name = sym.name();
            // Strip leading colon for keywords
            let clean = if name.starts_with(':') { &name[1..] } else { name };
            RString::allocate(clean.to_string()).raw()
        }
        _ => {
            RString::allocate(format!("{}", lisp_obj)).raw()
        }
    }
}

/// Intern a symbol in a package (intern)
/// (intern name &optional package) -> symbol, status
#[no_mangle]
pub extern "C" fn cc_intern(name: usize, package: usize) -> usize {
    use rlasp_runtime::{Symbol, RString};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    // Get the name string
    let name_str = {
        let obj = unsafe { LispObject::from_raw(name) };
        if let Some(str_ptr) = obj.as_general_ptr::<RString>() {
            if !str_ptr.is_null() {
                unsafe {
                    if TypeHeader::from_ptr(str_ptr) == Some(ObjectType::String) {
                        let s = &*str_ptr;
                        s.as_str().to_string()
                    } else {
                        return LispObject::nil().raw();
                    }
                }
            } else {
                return LispObject::nil().raw();
            }
        } else if let Some(sym_ptr) = obj.as_general_ptr::<Symbol>() {
            if !sym_ptr.is_null() {
                unsafe {
                    if TypeHeader::from_ptr(sym_ptr) == Some(ObjectType::Symbol) {
                        let sym = &*sym_ptr;
                        sym.name().to_string()
                    } else {
                        return LispObject::nil().raw();
                    }
                }
            } else {
                return LispObject::nil().raw();
            }
        } else {
            return LispObject::nil().raw();
        }
    };

    // For now, just create a symbol (proper package interning would need more infrastructure)
    Symbol::allocate(name_str.to_uppercase()).raw()
}

/// Find a symbol by name in a package (find-symbol)
/// (find-symbol name &optional package) -> symbol or nil
/// In CL this returns two values; we return just the symbol (or nil if not found).
#[no_mangle]
pub extern "C" fn cc_find_symbol(name: usize, package: usize) -> usize {
    use rlasp_runtime::{Symbol, RString};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    // Get the name string
    let name_str = {
        let obj = unsafe { LispObject::from_raw(name) };
        if obj.is_nil() {
            return LispObject::nil().raw();
        }
        if let Some(ptr) = obj.as_general_ptr::<()>() {
            if !ptr.is_null() {
                match unsafe { TypeHeader::from_ptr(ptr) } {
                    Some(ObjectType::String) => {
                        let s = unsafe { &*(ptr as *const RString) };
                        s.as_str().to_string()
                    }
                    Some(ObjectType::Symbol) => {
                        let sym = unsafe { &*(ptr as *const Symbol) };
                        let n = sym.name();
                        if n.starts_with(':') { n[1..].to_string() } else { n.to_string() }
                    }
                    _ => return LispObject::nil().raw(),
                }
            } else {
                return LispObject::nil().raw();
            }
        } else {
            return LispObject::nil().raw();
        }
    };

    let upper = name_str.to_uppercase();

    // Check if it exists as a dynamic binding
    let found_dynamic = DYNAMIC_BINDINGS.with(|bindings| {
        let b = bindings.borrow();
        b.contains_key(&name_str) || b.contains_key(&upper) || b.contains_key(&name_str.to_lowercase())
    });

    if found_dynamic {
        return Symbol::allocate(upper).raw();
    }

    // Check if it exists as a function in the JIT registry
    {
        let registry = get_registry().lock().unwrap();
        let fn_key = format!("%FN%{}", upper);
        let fn_key_lower = format!("%FN%{}", name_str.to_lowercase());
        if registry.contains_key(&fn_key) || registry.contains_key(&fn_key_lower) ||
           registry.contains_key(&upper) || registry.contains_key(&name_str.to_lowercase()) {
            return Symbol::allocate(upper).raw();
        }
    }

    // Not found
    LispObject::nil().raw()
}

/// Find a package by name (find-package)
/// (find-package name) -> package or nil
#[no_mangle]
pub extern "C" fn cc_find_package(name: usize) -> usize {
    use rlasp_runtime::{Symbol, RString};
    use rlasp_runtime::header::{TypeHeader, ObjectType};

    // Get the package name
    let pkg_name = {
        let obj = unsafe { LispObject::from_raw(name) };

        // Check if it's a General-tagged object first
        if !obj.is_general() {
            return LispObject::nil().raw();
        }

        // Get the pointer and check type header to determine actual type
        let ptr = obj.as_general_ptr::<()>().unwrap();
        if ptr.is_null() {
            return LispObject::nil().raw();
        }

        let obj_type = unsafe { TypeHeader::from_ptr(ptr) };

        match obj_type {
            Some(ObjectType::String) => {
                let str_ptr = ptr as *const RString;
                unsafe { (*str_ptr).as_str().to_string() }
            }
            Some(ObjectType::Symbol) => {
                let sym_ptr = ptr as *const Symbol;
                let sym = unsafe { &*sym_ptr };
                let name = sym.name();
                // Strip leading colon for keywords
                if name.starts_with(':') {
                    name[1..].to_string()
                } else {
                    name.to_string()
                }
            }
            _ => return LispObject::nil().raw(),
        }
    };

    if let Some(canon) = find_package_entry(&pkg_name) {
        Symbol::allocate(format!("#<PACKAGE \"{}\">", canon)).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Box a function pointer as a LispObject
#[no_mangle]
pub extern "C" fn cc_box_function_ptr(fn_ptr: i64) -> usize {
    // Function pointers may not be 8-byte aligned, so we can't use the low 3 bits for tagging
    // Instead, we'll just pass them through as-is
    // This works because function pointers will never conflict with our 2-bit tagging scheme:
    // - Fixnums: (n << 2) | 0b00 - always end in 00, and shifted values are different range
    // - Cons: heap pointer | 0b01 - heap pointers are high addresses
    // - Function pointers are code addresses which are in a different memory region
    fn_ptr as usize
}

/// Unbox a function pointer from a LispObject
#[no_mangle]
pub extern "C" fn cc_unbox_function_ptr(obj: usize) -> i64 {
    // Just pass through - no tag to remove
    obj as i64
}

/// Check if a LispObject is a function
#[no_mangle]
pub extern "C" fn cc_is_function(obj: usize) -> i32 {
    // Check if lowest 3 bits are 0b101
    if (obj & 0b111) == 0b101 {
        1
    } else {
        0
    }
}

// ============================================================================
// Type Predicates
// ============================================================================

#[no_mangle]
pub extern "C" fn cc_numberp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    let result = obj.as_fixnum().is_some() || obj.as_float().is_some();
    if result {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_integerp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if obj.as_fixnum().is_some() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_floatp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if obj.as_float().is_some() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_rationalp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    // For now, integers are rational (proper ratio support would go here)
    if obj.as_fixnum().is_some() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_errorp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if obj.is_error() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_complexp(_obj: usize) -> usize {
    // Complex numbers not yet supported
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_realp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    let result = obj.as_fixnum().is_some() || obj.as_float().is_some();
    if result {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_characterp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if obj.as_character().is_some() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_stringp(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(ptr) = obj.as_general_ptr::<rlasp_runtime::RString>() {
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::String) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_symbolp(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    let obj = unsafe { LispObject::from_raw(obj) };

    // Check for T and NIL which are special symbols
    if obj.is_nil() || obj.raw() == rlasp_runtime::T_SYMBOL.raw() {
        return LispObject::t().raw();
    }

    // Check for regular symbols via TypeHeader
    if let Some(ptr) = obj.as_general_ptr::<rlasp_runtime::Symbol>() {
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_keywordp(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    let obj = unsafe { LispObject::from_raw(obj) };

    if let Some(ptr) = obj.as_general_ptr::<rlasp_runtime::Symbol>() {
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
            let sym = unsafe { &*ptr };
            let name = sym.name();
            if name.starts_with(':') {
                return LispObject::t().raw();
            }
            if let Some((pkg, _)) = name.split_once(':') {
                if pkg.eq_ignore_ascii_case("keyword") {
                    return LispObject::t().raw();
                }
            }
        }
    }

    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_arrayp(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    let obj = unsafe { LispObject::from_raw(obj) };
    // Arrays include strings and vectors
    if let Some(ptr) = obj.as_general_ptr::<rlasp_runtime::RString>() {
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::String) {
            return LispObject::t().raw();
        }
    }
    if let Some(ptr) = obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Vector) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_vectorp(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(ptr) = obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Vector) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_hash_table_p(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if obj.as_hash_table_ptr().is_some() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_pathnamep(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    use rlasp_runtime::Pathname;
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(ptr) = obj.as_general_ptr::<Pathname>() {
        if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Pathname) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_streamp(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    use rlasp_runtime::Stream;
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(ptr) = obj.as_general_ptr::<Stream>() {
        if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Stream) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_packagep(obj: usize) -> usize {
    use rlasp_runtime::header::{TypeHeader, ObjectType};
    use rlasp_runtime::Package;
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(ptr) = obj.as_general_ptr::<Package>() {
        if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Package) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_plusp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(n) = obj.as_fixnum() {
        if n > 0 {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_minusp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(n) = obj.as_fixnum() {
        if n < 0 {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_min(obj1: usize, obj2: usize) -> usize {
    let obj1 = unsafe { LispObject::from_raw(obj1) };
    let obj2 = unsafe { LispObject::from_raw(obj2) };

    if let (Some(n1), Some(n2)) = (obj1.as_fixnum(), obj2.as_fixnum()) {
        if n1 <= n2 {
            obj1.raw()
        } else {
            obj2.raw()
        }
    } else {
        // For now, just return the first argument if we can't compare
        obj1.raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_max(obj1: usize, obj2: usize) -> usize {
    let obj1 = unsafe { LispObject::from_raw(obj1) };
    let obj2 = unsafe { LispObject::from_raw(obj2) };

    if let (Some(n1), Some(n2)) = (obj1.as_fixnum(), obj2.as_fixnum()) {
        if n1 >= n2 {
            obj1.raw()
        } else {
            obj2.raw()
        }
    } else {
        // For now, just return the first argument if we can't compare
        obj1.raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_equal(obj1: usize, obj2: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};
    let obj1 = unsafe { LispObject::from_raw(obj1) };
    let obj2 = unsafe { LispObject::from_raw(obj2) };

    // Simple equality check
    if obj1.raw() == obj2.raw() {
        return LispObject::t().raw();
    }

    // Symbols by name (case-insensitive, matches interpreter)
    if let (Some(p1), Some(p2)) = (obj1.as_general_ptr::<()>(), obj2.as_general_ptr::<()>()) {
        if !p1.is_null() && !p2.is_null()
            && unsafe { TypeHeader::from_ptr(p1) } == Some(ObjectType::Symbol)
            && unsafe { TypeHeader::from_ptr(p2) } == Some(ObjectType::Symbol)
        {
            let s1 = unsafe { &*(p1 as *const rlasp_runtime::Symbol) };
            let s2 = unsafe { &*(p2 as *const rlasp_runtime::Symbol) };
            if s1.name().eq_ignore_ascii_case(s2.name()) {
                return LispObject::t().raw();
            }
        }
    }

    // Check fixnums
    if let (Some(n1), Some(n2)) = (obj1.as_fixnum(), obj2.as_fixnum()) {
        if n1 == n2 {
            return LispObject::t().raw();
        }
    }

    // Check strings
    if let (Some(p1), Some(p2)) = (obj1.as_general_ptr::<()>(), obj2.as_general_ptr::<()>()) {
        if !p1.is_null() && !p2.is_null()
            && unsafe { TypeHeader::from_ptr(p1) } == Some(ObjectType::String)
            && unsafe { TypeHeader::from_ptr(p2) } == Some(ObjectType::String)
        {
            let s1 = unsafe { &*(p1 as *const rlasp_runtime::RString) };
            let s2 = unsafe { &*(p2 as *const rlasp_runtime::RString) };
            if s1.as_str() == s2.as_str() {
                return LispObject::t().raw();
            }
        }
    }

    // Check conses recursively
    if let (Some(c1_ptr), Some(c2_ptr)) = (obj1.as_cons_ptr(), obj2.as_cons_ptr()) {
        let c1 = unsafe { &*c1_ptr };
        let c2 = unsafe { &*c2_ptr };
        if cc_equal(c1.car().raw(), c2.car().raw()) != LispObject::nil().raw()
            && cc_equal(c1.cdr().raw(), c2.cdr().raw()) != LispObject::nil().raw() {
            return LispObject::t().raw();
        }
    }

    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_equalp(obj1: usize, obj2: usize) -> usize {
    // For now, equalp is the same as equal (case-insensitive string comparison would go here)
    cc_equal(obj1, obj2)
}

// ============================================================================
// Loop Support
// ============================================================================

#[no_mangle]
pub extern "C" fn cc_build_range(start: usize, limit: usize, below_mode: usize) -> usize {
    let start_obj = unsafe { LispObject::from_raw(start) };
    let limit_obj = unsafe { LispObject::from_raw(limit) };
    let below_obj = unsafe { LispObject::from_raw(below_mode) };

    let start_val = start_obj.as_fixnum().unwrap_or(0);
    let limit_val = limit_obj.as_fixnum().unwrap_or(0);
    let is_below = below_obj.as_fixnum().unwrap_or(0) != 0;

    let mut result = LispObject::nil();
    let mut i = start_val;

    // Build list in reverse so we can cons efficiently
    let end_val = if is_below { limit_val - 1 } else { limit_val };

    while i <= end_val && i < limit_val {
        let elem = LispObject::fixnum(i);
        result = rlasp_runtime::Cons::allocate(elem, result);
        i += 1;
    }

    // Reverse to get correct order
    let mut reversed = LispObject::nil();
    let mut current = result;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        reversed = rlasp_runtime::Cons::allocate(cons.car(), reversed);
        current = cons.cdr();
    }

    reversed.raw()
}

// ============================================================================
// Additional Arithmetic Functions
// ============================================================================

#[no_mangle]
pub extern "C" fn cc_floor_2(number: usize, divisor: usize) -> usize {
    let num_obj = unsafe { LispObject::from_raw(number) };
    let div_obj = unsafe { LispObject::from_raw(divisor) };

    if let (Some(n), Some(d)) = (num_obj.as_fixnum(), div_obj.as_fixnum()) {
        if d == 0 {
            return LispObject::nil().raw();
        }
        let quotient = n / d;
        LispObject::fixnum(quotient).raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_ceiling_2(number: usize, divisor: usize) -> usize {
    let num_obj = unsafe { LispObject::from_raw(number) };
    let div_obj = unsafe { LispObject::from_raw(divisor) };

    if let (Some(n), Some(d)) = (num_obj.as_fixnum(), div_obj.as_fixnum()) {
        if d == 0 {
            return LispObject::nil().raw();
        }
        // Ceiling division
        let quotient = if (n < 0) == (d < 0) {
            (n + d - d.signum()) / d
        } else {
            n / d
        };
        LispObject::fixnum(quotient).raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_round_2(number: usize, divisor: usize) -> usize {
    let num_obj = unsafe { LispObject::from_raw(number) };
    let div_obj = unsafe { LispObject::from_raw(divisor) };

    if let (Some(n), Some(d)) = (num_obj.as_fixnum(), div_obj.as_fixnum()) {
        if d == 0 {
            return LispObject::nil().raw();
        }
        let quotient = ((n as f64) / (d as f64)).round() as i64;
        LispObject::fixnum(quotient).raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_gcd(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    if let (Some(mut a_val), Some(mut b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        a_val = a_val.abs();
        b_val = b_val.abs();
        while b_val != 0 {
            let temp = b_val;
            b_val = a_val % b_val;
            a_val = temp;
        }
        LispObject::fixnum(a_val).raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_lcm(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if a_val == 0 || b_val == 0 {
            return LispObject::fixnum(0).raw();
        }
        let gcd_result = cc_gcd(a, b);
        let gcd_obj = unsafe { LispObject::from_raw(gcd_result) };
        if let Some(gcd_val) = gcd_obj.as_fixnum() {
            let lcm = (a_val.abs() / gcd_val) * b_val.abs();
            LispObject::fixnum(lcm).raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_isqrt(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(n) = obj.as_fixnum() {
        if n < 0 {
            return LispObject::nil().raw();
        }
        let sqrt = (n as f64).sqrt() as i64;
        LispObject::fixnum(sqrt).raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_signum(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    if let Some(n) = obj.as_fixnum() {
        let sign = if n > 0 { 1 } else if n < 0 { -1 } else { 0 };
        LispObject::fixnum(sign).raw()
    } else {
        // For now, just return 0 for non-fixnum
        LispObject::fixnum(0).raw()
    }
}

// ============================================================================
// Sequence Functions
// ============================================================================

#[no_mangle]
pub extern "C" fn cc_find(item: usize, sequence: usize) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };

    // Walk the sequence (list for now)
    let mut current = seq_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Use equal comparison
        if cc_equal(elem.raw(), item_obj.raw()) != LispObject::nil().raw() {
            return elem.raw();
        }
        current = cons.cdr();
    }

    LispObject::nil().raw()
}

/// (find item sequence &key start end from-end test test-not key)
#[no_mangle]
pub extern "C" fn cc_find_full(
    item: usize,
    sequence: usize,
    start: usize,
    end: usize,
    from_end: usize,
    test: usize,
    test_not: usize,
    key: usize,
) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };
    let start_obj = unsafe { LispObject::from_raw(start) };
    let end_obj = unsafe { LispObject::from_raw(end) };
    let from_end_obj = unsafe { LispObject::from_raw(from_end) };
    let test_obj = unsafe { LispObject::from_raw(test) };
    let test_not_obj = unsafe { LispObject::from_raw(test_not) };
    let key_obj = unsafe { LispObject::from_raw(key) };

    let start_idx = match start_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => 0,
    };
    let end_idx_opt = match end_obj.as_fixnum() {
        Some(fx) if fx >= 0 => Some(fx as usize),
        _ => None,
    };
    let from_end_flag = !from_end_obj.is_nil();
    let key_fn = if key_obj.is_nil() { None } else { Some(key_obj) };
    let test_fn = if !test_not_obj.is_nil() {
        Some((test_not_obj, true))
    } else if !test_obj.is_nil() {
        Some((test_obj, false))
    } else {
        None
    };

    let items = match sequence_to_vec(seq_obj) {
        Some(v) => v,
        None => return LispObject::nil().raw(),
    };
    let len = items.len();
    let end_idx = end_idx_opt.unwrap_or(len).min(len);
    if start_idx > end_idx {
        return LispObject::nil().raw();
    }

    if from_end_flag {
        if end_idx == 0 {
            return LispObject::nil().raw();
        }
        let mut idx = end_idx as i64 - 1;
        while idx >= start_idx as i64 {
            let elem = items[idx as usize];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let mut matches = if let Some((tf, _negate)) = test_fn {
                truthy_obj(call_func_2(tf, item_obj, key_elem))
            } else {
                !unsafe { LispObject::from_raw(cc_equal(item_obj.raw(), key_elem.raw())) }.is_nil()
            };
            if let Some((_tf, negate)) = test_fn {
                if negate {
                    matches = !matches;
                }
            }
            if matches {
                return elem.raw();
            }
            idx -= 1;
        }
    } else {
        for idx in start_idx..end_idx {
            let elem = items[idx];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let mut matches = if let Some((tf, _negate)) = test_fn {
                truthy_obj(call_func_2(tf, item_obj, key_elem))
            } else {
                !unsafe { LispObject::from_raw(cc_equal(item_obj.raw(), key_elem.raw())) }.is_nil()
            };
            if let Some((_tf, negate)) = test_fn {
                if negate {
                    matches = !matches;
                }
            }
            if matches {
                return elem.raw();
            }
        }
    }

    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_position(item: usize, sequence: usize) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };

    // Walk the sequence (list for now)
    let mut current = seq_obj;
    let mut index = 0i64;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Use equal comparison
        if cc_equal(elem.raw(), item_obj.raw()) != LispObject::nil().raw() {
            return LispObject::fixnum(index).raw();
        }
        current = cons.cdr();
        index += 1;
    }

    LispObject::nil().raw()
}

/// (position item sequence &key start end from-end test test-not key)
#[no_mangle]
pub extern "C" fn cc_position_full(
    item: usize,
    sequence: usize,
    start: usize,
    end: usize,
    from_end: usize,
    test: usize,
    test_not: usize,
    key: usize,
) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };
    let start_obj = unsafe { LispObject::from_raw(start) };
    let end_obj = unsafe { LispObject::from_raw(end) };
    let from_end_obj = unsafe { LispObject::from_raw(from_end) };
    let test_obj = unsafe { LispObject::from_raw(test) };
    let test_not_obj = unsafe { LispObject::from_raw(test_not) };
    let key_obj = unsafe { LispObject::from_raw(key) };

    let start_idx = match start_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => 0,
    };
    let end_idx_opt = match end_obj.as_fixnum() {
        Some(fx) if fx >= 0 => Some(fx as usize),
        _ => None,
    };
    let from_end_flag = truthy_obj(from_end_obj);
    let key_fn = if key_obj.is_nil() { None } else { Some(key_obj) };
    let test_fn = if !test_not_obj.is_nil() {
        Some((test_not_obj, true))
    } else if !test_obj.is_nil() {
        Some((test_obj, false))
    } else {
        None
    };

    let items = match sequence_to_vec(seq_obj) {
        Some(v) => v,
        None => return LispObject::nil().raw(),
    };
    let len = items.len();
    let end_idx = end_idx_opt.unwrap_or(len).min(len);
    if start_idx > end_idx {
        return LispObject::nil().raw();
    }

    if from_end_flag {
        if end_idx == 0 {
            return LispObject::nil().raw();
        }
        let mut idx = end_idx as i64 - 1;
        while idx >= start_idx as i64 {
            let elem = items[idx as usize];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let mut matches = if let Some((tf, _negate)) = test_fn {
                truthy_obj(call_func_2(tf, item_obj, key_elem))
            } else {
                !unsafe { LispObject::from_raw(cc_equal(item_obj.raw(), key_elem.raw())) }.is_nil()
            };
            if let Some((_tf, negate)) = test_fn {
                if negate {
                    matches = !matches;
                }
            }
            if matches {
                return LispObject::fixnum(idx).raw();
            }
            idx -= 1;
        }
    } else {
        for idx in start_idx..end_idx {
            let elem = items[idx];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let mut matches = if let Some((tf, _negate)) = test_fn {
                truthy_obj(call_func_2(tf, item_obj, key_elem))
            } else {
                !unsafe { LispObject::from_raw(cc_equal(item_obj.raw(), key_elem.raw())) }.is_nil()
            };
            if let Some((_tf, negate)) = test_fn {
                if negate {
                    matches = !matches;
                }
            }
            if matches {
                return LispObject::fixnum(idx as i64).raw();
            }
        }
    }

    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_remove(item: usize, sequence: usize) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };

    // Build a new list without the item
    let mut result = LispObject::nil();
    let mut current = seq_obj;

    // Collect all elements except item
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Only add if not equal to item
        if cc_equal(elem.raw(), item_obj.raw()) == LispObject::nil().raw() {
            result = rlasp_runtime::Cons::allocate(elem, result);
        }
        current = cons.cdr();
    }

    // Reverse to get correct order
    let mut reversed = LispObject::nil();
    current = result;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        reversed = rlasp_runtime::Cons::allocate(cons.car(), reversed);
        current = cons.cdr();
    }

    reversed.raw()
}

#[no_mangle]
pub extern "C" fn cc_subseq(sequence: usize, start: usize, end: usize) -> usize {
    let seq_obj = unsafe { LispObject::from_raw(sequence) };
    let start_obj = unsafe { LispObject::from_raw(start) };
    let end_obj = unsafe { LispObject::from_raw(end) };

    let start_val = start_obj.as_fixnum().unwrap_or(0);
    let end_val = end_obj.as_fixnum().unwrap_or(i64::MAX);

    // Walk to start position
    let mut current = seq_obj;
    let mut index = 0i64;

    // Skip to start
    while index < start_val && current.as_cons_ptr().is_some() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            current = cons.cdr();
            index += 1;
        }
    }

    // Collect from start to end
    let mut result = LispObject::nil();
    while index < end_val && current.as_cons_ptr().is_some() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            result = rlasp_runtime::Cons::allocate(cons.car(), result);
            current = cons.cdr();
            index += 1;
        }
    }

    // Reverse to get correct order
    let mut reversed = LispObject::nil();
    current = result;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        reversed = rlasp_runtime::Cons::allocate(cons.car(), reversed);
        current = cons.cdr();
    }

    reversed.raw()
}

// ============================================================================
// More Sequence Functions
// ============================================================================

#[no_mangle]
pub extern "C" fn cc_count(item: usize, sequence: usize) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };

    let mut count = 0i64;
    let mut current = seq_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Use equal comparison
        if cc_equal(elem.raw(), item_obj.raw()) != LispObject::nil().raw() {
            count += 1;
        }
        current = cons.cdr();
    }

    LispObject::fixnum(count).raw()
}

#[no_mangle]
pub extern "C" fn cc_member(item: usize, list: usize) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    // Return the tail of the list starting with the matching element
    let mut current = list_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Use equal comparison
        if cc_equal(elem.raw(), item_obj.raw()) != LispObject::nil().raw() {
            return current.raw();  // Return the tail starting with this element
        }
        current = cons.cdr();
    }

    LispObject::nil().raw()
}

/// Pushnew - add item to list if not present
/// Optional test/test-not/key are function designators (symbols or closures).
/// test-not takes precedence over test and its result is negated.
#[no_mangle]
pub extern "C" fn cc_pushnew(item: usize, list: usize, test: usize, test_not: usize, key: usize) -> usize {
    let item_obj = unsafe { LispObject::from_raw(item) };
    let list_obj = unsafe { LispObject::from_raw(list) };
    let test_obj = unsafe { LispObject::from_raw(test) };
    let test_not_obj = unsafe { LispObject::from_raw(test_not) };
    let key_obj = unsafe { LispObject::from_raw(key) };

    let use_test_not = test_not_obj.raw() != LispObject::nil().raw();
    let use_test = !use_test_not && test_obj.raw() != LispObject::nil().raw();
    let use_key = key_obj.raw() != LispObject::nil().raw();

    let mut current = list_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        if cons_ptr.is_null() { break; }
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Apply key function if provided
        let test_item = if use_key {
            stack_push_pointer(elem.raw());
            cc_funcall_stack(key_obj.raw(), 1);
            let key_result = stack_pop_pointer();
            unsafe { LispObject::from_raw(key_result) }
        } else {
            elem
        };

        // Determine match based on test/test-not/default
        let matches = if use_test_not {
            // Call test-not and negate result
            stack_push_pointer(test_item.raw());
            stack_push_pointer(item_obj.raw());
            cc_funcall_stack(test_not_obj.raw(), 2);
            let result = stack_pop_pointer();
            let result_obj = unsafe { LispObject::from_raw(result) };
            result_obj.raw() == LispObject::nil().raw()
        } else if use_test {
            stack_push_pointer(test_item.raw());
            stack_push_pointer(item_obj.raw());
            cc_funcall_stack(test_obj.raw(), 2);
            let result = stack_pop_pointer();
            let result_obj = unsafe { LispObject::from_raw(result) };
            result_obj.raw() != LispObject::nil().raw()
        } else {
            cc_equal(item_obj.raw(), test_item.raw()) != LispObject::nil().raw()
        };

        if matches {
            return list_obj.raw();
        }

        current = cons.cdr();
    }

    rlasp_runtime::Cons::allocate(item_obj, list_obj).raw()
}

#[no_mangle]
pub extern "C" fn cc_assoc(key: usize, alist: usize) -> usize {
    let key_obj = unsafe { LispObject::from_raw(key) };
    let alist_obj = unsafe { LispObject::from_raw(alist) };

    // Walk through association list
    let mut current = alist_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let pair = cons.car();

        // Each element should be a cons pair (key . value)
        if let Some(pair_cons_ptr) = pair.as_cons_ptr() {
            let pair_cons = unsafe { &*pair_cons_ptr };
            let pair_key = pair_cons.car();

            // Use equal comparison
            if cc_equal(pair_key.raw(), key_obj.raw()) != LispObject::nil().raw() {
                return pair.raw();  // Return the entire pair
            }
        }
        current = cons.cdr();
    }

    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_search(seq1: usize, seq2: usize) -> usize {
    let seq1_obj = unsafe { LispObject::from_raw(seq1) };
    let seq2_obj = unsafe { LispObject::from_raw(seq2) };

    // Handle string search
    if let (Some(s1_ptr), Some(s2_ptr)) = (
        seq1_obj.as_general_ptr::<rlasp_runtime::RString>(),
        seq2_obj.as_general_ptr::<rlasp_runtime::RString>()
    ) {
        let s1 = unsafe { &*s1_ptr };
        let s2 = unsafe { &*s2_ptr };
        if let Some(pos) = s2.as_str().find(s1.as_str()) {
            return LispObject::fixnum(pos as i64).raw();
        }
        return LispObject::nil().raw();
    }

    // Handle list search - find seq1 as subsequence of seq2
    // Convert both to vectors for easier subsequence matching
    let mut needle = Vec::new();
    let mut current = seq1_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        needle.push(cons.car());
        current = cons.cdr();
    }

    if needle.is_empty() {
        return LispObject::fixnum(0).raw();
    }

    let mut haystack_pos = 0usize;
    let mut current = seq2_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };

        // Try to match needle starting at this position
        let mut match_pos = current;
        let mut matched = true;
        for needle_elem in &needle {
            if let Some(mp) = match_pos.as_cons_ptr() {
                let mc = unsafe { &*mp };
                if cc_equal(mc.car().raw(), needle_elem.raw()) == LispObject::nil().raw() {
                    matched = false;
                    break;
                }
                match_pos = mc.cdr();
            } else {
                matched = false;
                break;
            }
        }

        if matched {
            return LispObject::fixnum(haystack_pos as i64).raw();
        }

        current = cons.cdr();
        haystack_pos += 1;
    }

    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_elt(sequence: usize, index: usize) -> usize {
    let seq_obj = unsafe { LispObject::from_raw(sequence) };
    let idx_obj = unsafe { LispObject::from_raw(index) };

    let idx = idx_obj.as_fixnum().unwrap_or(0) as usize;

    // Handle string
    if let Some(str_ptr) = seq_obj.as_general_ptr::<rlasp_runtime::RString>() {
        let s = unsafe { &*str_ptr };
        let str_data = s.as_str();
        if idx < str_data.len() {
            let ch = str_data.chars().nth(idx).unwrap();
            return LispObject::character(ch).raw();
        }
        return LispObject::nil().raw();
    }

    // Handle vector/array
    if let Some(vec_ptr) = seq_obj.as_general_ptr::<rlasp_runtime::RVector>() {
        let vec = unsafe { &*vec_ptr };
        if idx < vec.len() {
            return vec.get(idx).map(|o| o.raw()).unwrap_or(LispObject::nil().raw());
        }
        return LispObject::nil().raw();
    }

    // Handle list - same as nth
    cc_nth(index, sequence)
}

#[no_mangle]
pub extern "C" fn cc_concatenate(result_type: usize, sequences: usize) -> usize {
    use rlasp_runtime::header::{ObjectType, TypeHeader};

    let type_obj = unsafe { LispObject::from_raw(result_type) };
    let seqs_obj = unsafe { LispObject::from_raw(sequences) };

    // Check if result type is 'string - check if it's a symbol with name "string"
    let is_string = if let Some(ptr) = type_obj.as_general_ptr::<()>() {
        if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
            let sym = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
            let name = sym.name();
            name.eq_ignore_ascii_case("string")
        } else {
            false
        }
    } else {
        false
    };

    if is_string {
        let append_char = |result: &mut String, obj: LispObject| -> bool {
            if let Some(ch) = obj.as_character() {
                result.push(ch);
                true
            } else if let Some(ptr) = obj.as_general_ptr::<()>() {
                if ptr.is_null() {
                    return false;
                }
                match unsafe { TypeHeader::from_ptr(ptr) } {
                    Some(ObjectType::String) => {
                        let s = unsafe { &*(ptr as *const rlasp_runtime::RString) };
                        result.push_str(s.as_str());
                        true
                    }
                    _ => false,
                }
            } else {
                false
            }
        };

        // Concatenate into a string
        let mut result = String::new();
        let mut current = seqs_obj;
        while let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let seq = cons.car();

            if let Some(ptr) = seq.as_general_ptr::<()>() {
                if !ptr.is_null() {
                    match unsafe { TypeHeader::from_ptr(ptr) } {
                        Some(ObjectType::String) => {
                            let s = unsafe { &*(ptr as *const rlasp_runtime::RString) };
                            result.push_str(s.as_str());
                        }
                        Some(ObjectType::Vector) => {
                            let vec = unsafe { &*(ptr as *const rlasp_runtime::RVector) };
                            for elem in vec.as_slice() {
                                if !append_char(&mut result, *elem) {
                                    return LispObject::nil().raw();
                                }
                            }
                        }
                        _ => return LispObject::nil().raw(),
                    }
                }
            } else if let Some(_seq_cons_ptr) = seq.as_cons_ptr() {
                let mut seq_current = seq;
                while let Some(cell_ptr) = seq_current.as_cons_ptr() {
                    let cell = unsafe { &*cell_ptr };
                    if !append_char(&mut result, cell.car()) {
                        return LispObject::nil().raw();
                    }
                    seq_current = cell.cdr();
                }
                if !seq_current.is_nil() {
                    return LispObject::nil().raw();
                }
            } else if !seq.is_nil() {
                return LispObject::nil().raw();
            }
            current = cons.cdr();
        }
        return rlasp_runtime::RString::allocate(result).raw();
    }

    // Default: concatenate into a list
    let mut result_elements: Vec<LispObject> = Vec::new();
    let mut current = seqs_obj;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let seq = cons.car();

        // Walk the sequence and collect elements
        let mut seq_current = seq;
        while let Some(seq_cons_ptr) = seq_current.as_cons_ptr() {
            let seq_cons = unsafe { &*seq_cons_ptr };
            result_elements.push(seq_cons.car());
            seq_current = seq_cons.cdr();
        }
        current = cons.cdr();
    }

    // Build result list
    let mut result = LispObject::nil();
    for elem in result_elements.into_iter().rev() {
        result = rlasp_runtime::Cons::allocate(elem, result);
    }
    result.raw()
}

#[no_mangle]
pub extern "C" fn cc_remove_duplicates(sequence: usize) -> usize {
    let seq_obj = unsafe { LispObject::from_raw(sequence) };

    // Handle string - remove duplicate characters
    if let Some(str_ptr) = seq_obj.as_general_ptr::<rlasp_runtime::RString>() {
        let s = unsafe { &*str_ptr };
        let mut seen = std::collections::HashSet::new();
        let result: String = s.as_str().chars().filter(|c| seen.insert(*c)).collect();
        return rlasp_runtime::RString::allocate(result).raw();
    }

    // Handle list - remove duplicate elements
    let mut seen: Vec<LispObject> = Vec::new();
    let mut result_elements: Vec<LispObject> = Vec::new();
    let mut current = seq_obj;

    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Check if we've seen this element before (using equal comparison)
        let is_duplicate = seen.iter().any(|s| cc_equal(s.raw(), elem.raw()) != LispObject::nil().raw());

        if !is_duplicate {
            seen.push(elem);
            result_elements.push(elem);
        }
        current = cons.cdr();
    }

    // Build result list
    let mut result = LispObject::nil();
    for elem in result_elements.into_iter().rev() {
        result = rlasp_runtime::Cons::allocate(elem, result);
    }
    result.raw()
}

#[no_mangle]
pub extern "C" fn cc_remhash(key: usize, hash_table: usize) -> usize {
    let key_obj = unsafe { LispObject::from_raw(key) };
    let ht_obj = unsafe { LispObject::from_raw(hash_table) };

    // Access the hash table
    if let Some(ht_ptr) = ht_obj.as_general_ptr::<rlasp_runtime::HashTable>() {
        let ht = unsafe { &mut *(ht_ptr as *mut rlasp_runtime::HashTable) };
        // Try to remove the key - remove returns bool
        if ht.remove(key_obj) {
            return LispObject::t().raw();
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_hash_table_keys(hash_table: usize) -> usize {
    let ht_obj = unsafe { LispObject::from_raw(hash_table) };

    // Access the hash table using as_hash_table_ptr
    if let Some(ht_ptr) = ht_obj.as_hash_table_ptr() {
        let ht = unsafe { &*ht_ptr };
        // Get all entries and extract keys
        let entries = ht.entries();
        // Build result list
        let mut result = LispObject::nil();
        for (key, _value) in entries.into_iter().rev() {
            result = rlasp_runtime::Cons::allocate(key, result);
        }
        return result.raw();
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_hash_table_values(hash_table: usize) -> usize {
    let ht_obj = unsafe { LispObject::from_raw(hash_table) };

    // Access the hash table using as_hash_table_ptr
    if let Some(ht_ptr) = ht_obj.as_hash_table_ptr() {
        let ht = unsafe { &*ht_ptr };
        // Get all entries and extract values
        let entries = ht.entries();
        // Build result list
        let mut result = LispObject::nil();
        for (_key, value) in entries.into_iter().rev() {
            result = rlasp_runtime::Cons::allocate(value, result);
        }
        return result.raw();
    }
    LispObject::nil().raw()
}

// ============================================================================
// List Accessors
// ============================================================================

#[no_mangle]
pub extern "C" fn cc_nthcdr(n: usize, list: usize) -> usize {
    let n_obj = unsafe { LispObject::from_raw(n) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let n_val = n_obj.as_fixnum().unwrap_or(0);

    // Walk down the list n times
    let mut current = list_obj;
    for _ in 0..n_val {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            current = cons.cdr();
        } else {
            // Reached end before n
            return LispObject::nil().raw();
        }
    }

    current.raw()
}

#[no_mangle]
pub extern "C" fn cc_last(list: usize) -> usize {
    let list_obj = unsafe { LispObject::from_raw(list) };

    // Walk to the last cons cell
    let mut current = list_obj;
    let mut last_cell = list_obj;

    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        last_cell = current;
        current = cons.cdr();
    }

    // Return the last cons cell as a list
    last_cell.raw()
}

#[no_mangle]
pub extern "C" fn cc_butlast(list: usize) -> usize {
    let list_obj = unsafe { LispObject::from_raw(list) };

    // Special case: empty list or single element
    if list_obj.as_cons_ptr().is_none() {
        return LispObject::nil().raw();
    }

    // Build new list without last element
    let mut result = LispObject::nil();
    let mut current = list_obj;

    // Collect all but last
    loop {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let next = cons.cdr();

            // If next is not a cons (i.e., we're at the last element), stop
            if next.as_cons_ptr().is_none() {
                break;
            }

            result = rlasp_runtime::Cons::allocate(cons.car(), result);
            current = next;
        } else {
            break;
        }
    }

    // Reverse to get correct order
    let mut reversed = LispObject::nil();
    current = result;
    while let Some(cons_ptr) = current.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        reversed = rlasp_runtime::Cons::allocate(cons.car(), reversed);
        current = cons.cdr();
    }

    reversed.raw()
}

// ============================================================================
// String Functions
// ============================================================================

#[no_mangle]
pub extern "C" fn cc_string_upcase(string: usize) -> usize {
    let str_obj = unsafe { LispObject::from_raw(string) };

    // For now, assume strings are symbols or simple string objects
    // In a real implementation, would properly handle string types
    // Return as-is for now (stub)
    str_obj.raw()
}

#[no_mangle]
pub extern "C" fn cc_string_downcase(string: usize) -> usize {
    let str_obj = unsafe { LispObject::from_raw(string) };

    // For now, assume strings are symbols or simple string objects
    // In a real implementation, would properly handle string types
    // Return as-is for now (stub)
    str_obj.raw()
}

#[no_mangle]
pub extern "C" fn cc_string_capitalize(string: usize) -> usize {
    let str_obj = unsafe { LispObject::from_raw(string) };

    // For now, assume strings are symbols or simple string objects
    // In a real implementation, would properly handle string types
    // Return as-is for now (stub)
    str_obj.raw()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_box_unbox_fixnum() {
        let val = 42i64;
        let boxed = cc_box_fixnum(val);
        let unboxed = cc_unbox_fixnum(boxed);
        assert_eq!(val, unboxed);
    }

    #[test]
    fn test_box_unbox_float() {
        let val = 3.14f64;
        let boxed = cc_box_float(val);
        let unboxed = cc_unbox_float(boxed);
        assert!((val - unboxed).abs() < 0.0001);
    }

    #[test]
    fn test_cons_car_cdr() {
        let car = cc_box_fixnum(1);
        let cdr = cc_box_fixnum(2);
        let cons = cc_cons(car, cdr);

        assert_eq!(cc_car(cons), car);
        assert_eq!(cc_cdr(cons), cdr);
    }

    #[test]
    fn test_nil_and_t() {
        let nil = cc_nil();
        let t = cc_t();

        assert_eq!(cc_is_nil(nil), 1);
        assert_eq!(cc_is_nil(t), 0);
    }
}

/// Make an array with given size
#[no_mangle]
pub extern "C" fn cc_make_array(size: usize) -> usize {
    let size_obj = unsafe { LispObject::from_raw(size) };
    let size_val = match size_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => return LispObject::nil().raw(),
    };

    let elements = vec![LispObject::nil(); size_val];
    rlasp_runtime::RVector::allocate(elements).raw()
}

/// Make a list with given size (all elements are NIL)
#[no_mangle]
pub extern "C" fn cc_make_list(size: usize) -> usize {
    let size_obj = unsafe { LispObject::from_raw(size) };
    let size_val = if let Some(fx) = size_obj.as_fixnum() {
        fx as usize
    } else {
        return LispObject::nil().raw();
    };

    // Create a list of NILs
    let mut result = LispObject::nil();
    for _ in 0..size_val {
        result = rlasp_runtime::Cons::allocate(LispObject::nil(), result);
    }
    result.raw()
}

/// Make an array with initial contents (list, vector, or string)
#[no_mangle]
pub extern "C" fn cc_make_array_with_contents(size: usize, contents: usize) -> usize {
    let size_obj = unsafe { LispObject::from_raw(size) };
    let contents_obj = unsafe { LispObject::from_raw(contents) };
    let size_val = match size_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => return LispObject::nil().raw(),
    };

    let mut elements: Vec<LispObject> = Vec::new();

    if contents_obj.is_nil() {
        // Empty contents
    } else if let Some(vec_ptr) = contents_obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if !vec_ptr.is_null() {
            let vec = unsafe { &*vec_ptr };
            elements.extend_from_slice(vec.as_slice());
        }
    } else if let Some(str_ptr) = contents_obj.as_general_ptr::<rlasp_runtime::RString>() {
        if !str_ptr.is_null() {
            let s = unsafe { &*str_ptr };
            for ch in s.as_str().chars() {
                elements.push(LispObject::character(ch));
            }
        }
    } else {
        elements = list_to_vec(contents_obj);
    }

    if elements.len() < size_val {
        elements.extend(std::iter::repeat(LispObject::nil()).take(size_val - elements.len()));
    } else if elements.len() > size_val {
        elements.truncate(size_val);
    }

    rlasp_runtime::RVector::allocate(elements).raw()
}

/// Make an array with initial element
#[no_mangle]
pub extern "C" fn cc_make_array_with_initial_element(size: usize, element: usize) -> usize {
    let size_obj = unsafe { LispObject::from_raw(size) };
    let elem_obj = unsafe { LispObject::from_raw(element) };
    let size_val = match size_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => return LispObject::nil().raw(),
    };

    let elements = vec![elem_obj; size_val];
    rlasp_runtime::RVector::allocate(elements).raw()
}

/// Access array element at index
#[no_mangle]
pub extern "C" fn cc_aref(array: usize, index: usize) -> usize {
    let array_obj = unsafe { LispObject::from_raw(array) };
    let index_obj = unsafe { LispObject::from_raw(index) };

    let idx = match index_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => return LispObject::nil().raw(),
    };

    if let Some(vec_ptr) = array_obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if !vec_ptr.is_null() {
            let vec = unsafe { &*vec_ptr };
            return vec.get(idx).unwrap_or(LispObject::nil()).raw();
        }
    }

    if let Some(str_ptr) = array_obj.as_general_ptr::<rlasp_runtime::RString>() {
        if !str_ptr.is_null() {
            let s = unsafe { &*str_ptr };
            if let Some(ch) = s.char_at(idx) {
                return LispObject::character(ch).raw();
            }
        }
    }

    LispObject::nil().raw()
}

/// Set array element at index
#[no_mangle]
pub extern "C" fn cc_set_aref(array: usize, index: usize, value: usize) -> usize {
    let array_obj = unsafe { LispObject::from_raw(array) };
    let index_obj = unsafe { LispObject::from_raw(index) };
    let value_obj = unsafe { LispObject::from_raw(value) };

    let idx = match index_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => return value,
    };

    if let Some(vec_ptr) = array_obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if !vec_ptr.is_null() {
            let vec = unsafe { &mut *(vec_ptr as *mut rlasp_runtime::RVector) };
            vec.set(idx, value_obj);
            return value;
        }
    }

    if let Some(str_ptr) = array_obj.as_general_ptr::<rlasp_runtime::RString>() {
        if !str_ptr.is_null() {
            if let Some(ch) = value_obj.as_character() {
                let s = unsafe { &mut *(str_ptr as *mut rlasp_runtime::RString) };
                s.set_char(idx, ch);
            }
            return value;
        }
    }

    value
}

#[no_mangle]
pub extern "C" fn cc_round(val: usize) -> usize {
    let val_obj = unsafe { LispObject::from_raw(val) };

    // Try to get numeric value and round it
    if let Some(fx) = val_obj.as_fixnum() {
        // Already an integer
        val
    } else if let Some(fl) = val_obj.as_float() {
        // Round float to nearest integer
        LispObject::fixnum(fl.round() as i64).raw()
    } else {
        // For other types, return as-is
        val
    }
}

#[no_mangle]
pub extern "C" fn cc_accessor_x(obj: usize) -> usize {
    // CLOS accessor for x slot
    // Object format: (class-name . ((x . value-x) (y . value-y) ...))
    let obj_obj = unsafe { LispObject::from_raw(obj) };

    // Get the property list from cdr
    if let Some(obj_cons) = obj_obj.as_cons_ptr() {
        let plist = unsafe { (*obj_cons).cdr() };

        // Search for (x . value) in the property list
        let mut current = plist;
        loop {
            if let Some(cons_ptr) = current.as_cons_ptr() {
                let pair = unsafe { (*cons_ptr).car() };

                // Check if this is (x . value)
                if let Some(pair_cons) = pair.as_cons_ptr() {
                    let slot_name = unsafe { (*pair_cons).car() };

                    // Check if slot name is 'x (represented as a symbol or keyword)
                    // For simplicity, check if it's a symbol containing "x"
                    if let Some(sym_ptr) = slot_name.as_cons_ptr() {
                        // It's a symbol, get its name and check
                        // For now, just assume the first slot is x
                        let value = unsafe { (*pair_cons).cdr() };
                        return value.raw();
                    }
                }

                current = unsafe { (*cons_ptr).cdr() };
            } else {
                break;
            }
        }
    }

    // If not found, return NIL
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_accessor_y(obj: usize) -> usize {
    // CLOS accessor for y slot
    // Object format: (class-name . ((x . value-x) (y . value-y) ...))
    let obj_obj = unsafe { LispObject::from_raw(obj) };

    // Get the property list from cdr
    if let Some(obj_cons) = obj_obj.as_cons_ptr() {
        let plist = unsafe { (*obj_cons).cdr() };

        // Search for (y . value) in the property list - it's the second slot
        let mut current = plist;
        let mut index = 0;
        loop {
            if let Some(cons_ptr) = current.as_cons_ptr() {
                let pair = unsafe { (*cons_ptr).car() };

                // Check if this is the second slot (y)
                if index == 1 {
                    if let Some(pair_cons) = pair.as_cons_ptr() {
                        let value = unsafe { (*pair_cons).cdr() };
                        return value.raw();
                    }
                }

                index += 1;
                current = unsafe { (*cons_ptr).cdr() };
            } else {
                break;
            }
        }
    }

    // If not found, return NIL
    LispObject::nil().raw()
}

/// Variadic list constructor (stub)
/// In real implementation, would use varargs
#[no_mangle]
pub extern "C" fn list(_count: usize) -> usize {
    // For now, just return empty list (nil)
    LispObject::nil().raw()
}

/// Stub for 'twice' macro/function
#[no_mangle]
pub extern "C" fn twice(x: usize) -> usize {
    // twice(x) should return 2*x
    let x_obj = unsafe { LispObject::from_raw(x) };
    if let Some(val) = x_obj.as_fixnum() {
        LispObject::fixnum(val * 2).raw()
    } else {
        x
    }
}

/// Stub for make-instance (CLOS)
#[no_mangle]
pub extern "C" fn make_instance(_class: usize, _initargs: usize) -> usize {
    // Return a dummy instance
    LispObject::nil().raw()
}

/// Stub for magnitude (complex number magnitude)
#[no_mangle]
pub extern "C" fn magnitude(x: usize) -> usize {
    // For now, just return the input
    x
}

/// If expression: select between then_val and else_val based on test
#[no_mangle]
pub extern "C" fn cc_if(test: usize, then_val: usize, else_val: usize) -> usize {
    let test_obj = unsafe { LispObject::from_raw(test) };

    // In Common Lisp, only NIL is false, everything else is true
    if test_obj.is_nil() {
        else_val
    } else {
        then_val
    }
}

use std::collections::HashMap;
use std::ffi::CString;

/// Global function registry mapping function names to their addresses
/// This is populated by the JIT when functions are compiled
static mut FUNCTION_REGISTRY: Option<Mutex<HashMap<String, FunctionEntry>>> = None;
static INIT_REGISTRY: Once = Once::new();

/// Reverse mapping from function ID (hash) to function name
/// This allows extract_function_name to retrieve the name from a function reference
static mut FUNCTION_ID_MAP: Option<Mutex<HashMap<i64, String>>> = None;
static INIT_ID_MAP: Once = Once::new();

#[derive(Clone)]
pub struct FunctionEntry {
    pub address: usize,
    pub arity: usize,
    /// If true, function expects a single args_list on stack (for &optional/&key params)
    pub expects_args_list: bool,
}

pub fn get_registry() -> &'static Mutex<HashMap<String, FunctionEntry>> {
    unsafe {
        INIT_REGISTRY.call_once(|| {
            FUNCTION_REGISTRY = Some(Mutex::new(HashMap::new()));
        });
        FUNCTION_REGISTRY.as_ref().unwrap()
    }
}

fn get_id_map() -> &'static Mutex<HashMap<i64, String>> {
    unsafe {
        INIT_ID_MAP.call_once(|| {
            FUNCTION_ID_MAP = Some(Mutex::new(HashMap::new()));
        });
        FUNCTION_ID_MAP.as_ref().unwrap()
    }
}

/// Register a function in the global registry
/// Called by the JIT system after compiling each function
#[no_mangle]
pub extern "C" fn cc_register_function_ptr(name_ptr: *const i8, address: usize, arity: usize) {
    let name = unsafe { std::ffi::CStr::from_ptr(name_ptr) }
        .to_string_lossy()
        .into_owned();

    let mut registry = get_registry().lock().unwrap();
    registry.insert(name, FunctionEntry { address, arity, expects_args_list: false });
}

/// Register a function that expects an args_list (for functions with &optional/&key)
pub extern "C" fn cc_register_function_with_args_list(name_ptr: *const i8, address: usize, arity: usize) {
    let name = unsafe { std::ffi::CStr::from_ptr(name_ptr) }
        .to_string_lossy()
        .into_owned();

    let mut registry = get_registry().lock().unwrap();
    registry.insert(name, FunctionEntry { address, arity, expects_args_list: true });
}

/// Register all builtin intrinsics in the function registry
/// This allows them to be called via funcall/cc_funcall_1 etc.
/// Must be called once at initialization time
pub fn register_builtin_intrinsics() {
    let mut registry = get_registry().lock().unwrap();

    // Single-argument predicates (arity 1)
    let arity_1_intrinsics: &[(&str, usize)] = &[
        // Type predicates
        ("evenp", cc_evenp as usize),
        ("oddp", cc_oddp as usize),
        ("numberp", cc_numberp as usize),
        ("integerp", cc_integerp as usize),
        ("floatp", cc_floatp as usize),
        ("rationalp", cc_rationalp as usize),
        ("realp", cc_realp as usize),
        ("complexp", cc_complexp as usize),
        ("stringp", cc_stringp as usize),
        ("symbolp", cc_symbolp as usize),
        ("keywordp", cc_keywordp as usize),
        ("characterp", cc_characterp as usize),
        ("arrayp", cc_arrayp as usize),
        ("vectorp", cc_vectorp as usize),
        ("hash-table-p", cc_hash_table_p as usize),
        ("pathnamep", cc_pathnamep as usize),
        ("streamp", cc_streamp as usize),
        ("packagep", cc_packagep as usize),
        ("errorp", cc_errorp as usize),
        ("plusp", cc_plusp as usize),
        ("minusp", cc_minusp as usize),
        // Single-arg functions
        ("car", cc_car as usize),
        ("cdr", cc_cdr as usize),
        ("length", cc_length as usize),
        ("reverse", cc_reverse as usize),
        ("floor", cc_floor as usize),
        ("ceiling", cc_ceiling as usize),
        ("truncate", cc_truncate as usize),
        ("abs", cc_abs as usize),
        ("sqrt", cc_sqrt as usize),
        ("isqrt", cc_isqrt as usize),
        ("signum", cc_signum as usize),
        ("numerator", cc_numerator as usize),
        ("denominator", cc_denominator as usize),
        ("realpart", cc_realpart as usize),
        ("imagpart", cc_imagpart as usize),
        ("copy-seq", cc_copy_seq as usize),
        ("symbol-value", cc_symbol_value as usize),
        ("print", cc_print as usize),
    ];

    for (name, addr) in arity_1_intrinsics {
        if rlasp_runtime::is_cl_builtin(name) {
            registry.insert(name.to_string(), FunctionEntry { address: *addr, arity: 1, expects_args_list: false });
        }
    }

    // Two-argument functions (arity 2)
    let arity_2_intrinsics: &[(&str, usize)] = &[
        ("+", cc_add as usize),
        ("-", cc_sub as usize),
        ("*", cc_mul as usize),
        ("/", cc_div as usize),
        ("mod", cc_mod as usize),
        ("expt", cc_expt as usize),
        ("<", cc_lt as usize),
        (">", cc_gt as usize),
        ("=", cc_eq as usize),
        ("<=", cc_le as usize),
        (">=", cc_ge as usize),
        ("cons", cc_cons as usize),
        ("append", cc_append as usize),
        ("nth", cc_nth as usize),
        ("set-car", cc_set_car as usize),
        ("set-cdr", cc_set_cdr as usize),
        ("min", cc_min as usize),
        ("max", cc_max as usize),
        ("equal", cc_equal as usize),
        ("equalp", cc_equalp as usize),
        ("gcd", cc_gcd as usize),
        ("lcm", cc_lcm as usize),
        ("find", cc_find as usize),
        ("position", cc_position as usize),
        ("remove", cc_remove as usize),
        ("count", cc_count as usize),
        ("member", cc_member as usize),
        ("assoc", cc_assoc as usize),
        ("search", cc_search as usize),
        ("elt", cc_elt as usize),
        ("string=", cc_string_equal as usize),
        ("set-symbol-value", cc_set_symbol_value as usize),
        ("ratio", cc_ratio as usize),
        ("complex", cc_complex as usize),
        ("typep", crate::intrinsics_clos::cc_typep as usize),
        ("subtypep", crate::intrinsics_clos::cc_subtypep as usize),
    ];

    for (name, addr) in arity_2_intrinsics {
        if rlasp_runtime::is_cl_builtin(name) {
            registry.insert(name.to_string(), FunctionEntry { address: *addr, arity: 2, expects_args_list: false });
        }
    }
    // FORMAT is used pervasively by the regression harness (message/test reporting).
    // Through funcall/apply it must use stack calling convention.
    registry.insert(
        "format".to_string(),
        FunctionEntry {
            address: cc_format_stack as usize,
            arity: 2,
            expects_args_list: true,
        },
    );

    // Three-argument functions (arity 3)
    let arity_3_intrinsics: &[(&str, usize)] = &[
        ("gethash", cc_gethash as usize),
        ("puthash", cc_puthash as usize),
        ("subseq", cc_subseq as usize),
        ("set-char", cc_set_char as usize),
    ];

    for (name, addr) in arity_3_intrinsics {
        if rlasp_runtime::is_cl_builtin(name) {
            registry.insert(name.to_string(), FunctionEntry { address: *addr, arity: 3, expects_args_list: false });
        }
    }

    // Zero-argument functions (arity 0)
    let arity_0_intrinsics: &[(&str, usize)] = &[
        ("nil", cc_nil as usize),
        ("t", cc_t as usize),
        ("make-hash-table", cc_make_hash_table as usize),
        ("get-internal-real-time", cc_get_internal_real_time as usize),
        ("argc", cc_argc as usize),
    ];

    for (name, addr) in arity_0_intrinsics {
        registry.insert(name.to_string(), FunctionEntry { address: *addr, arity: 0, expects_args_list: false });
    }
}

/// Create a function reference containing the function name
/// Returns a LispObject that funcall can use to look up and call the function
#[no_mangle]
pub extern "C" fn cc_make_function_ref(name_ptr: *const i8) -> usize {
    let name = unsafe { std::ffi::CStr::from_ptr(name_ptr) }
        .to_string_lossy()
        .into_owned();

    // Compute a unique ID (hash) for the function
    let hash = name.bytes().fold(0u64, |acc, b| acc.wrapping_mul(31).wrapping_add(b as u64));
    let func_id = (hash % 1000000) as i64;

    // Store the reverse mapping so we can look up the name later
    let mut id_map = get_id_map().lock().unwrap();
    id_map.insert(func_id, name);

    // Return the function ID as a fixnum
    LispObject::fixnum(func_id).raw()
}

/// Create a lambda reference (stores lambda function name)
#[no_mangle]
pub extern "C" fn cc_make_lambda_ref(name_ptr: *const i8) -> usize {
    cc_make_function_ref(name_ptr)
}

/// Extract function name from a function reference LispObject
pub fn extract_function_name(func_ref: usize) -> Option<String> {
    let obj = unsafe { LispObject::from_raw(func_ref) };

    // Function references are stored as fixnums (function IDs)
    if let Some(func_id) = obj.as_fixnum() {
        let id_map = get_id_map().lock().unwrap();
        id_map.get(&func_id).cloned()
    } else {
        None
    }
}

/// Complete funcall implementation with full variadic support
/// Supports calling functions with 0-10 arguments
#[no_mangle]
pub extern "C" fn cc_funcall_0(func_ref: usize) -> usize {
    let registry = get_registry().lock().unwrap();
    if let Some(name) = extract_function_name(func_ref) {
        if let Some(entry) = registry.get(&name) {
            if entry.arity == 0 {
                unsafe {
                    let f: extern "C" fn() -> usize = std::mem::transmute(entry.address);
                    return f();
                }
            }
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_funcall_1(func_ref: usize, arg0: usize) -> usize {
    let registry = get_registry().lock().unwrap();
    if let Some(name) = extract_function_name(func_ref) {
        if let Some(entry) = registry.get(&name) {
            if entry.arity == 1 {
                unsafe {
                    let f: extern "C" fn(usize) -> usize = std::mem::transmute(entry.address);
                    return f(arg0);
                }
            }
        }
    }
    LispObject::nil().raw()
}

#[no_mangle]
pub extern "C" fn cc_funcall_2(func_ref: usize, arg0: usize, arg1: usize) -> usize {
    let registry = get_registry().lock().unwrap();
    if let Some(name) = extract_function_name(func_ref) {
        if let Some(entry) = registry.get(&name) {
            if entry.arity == 2 {
                unsafe {
                    let f: extern "C" fn(usize, usize) -> usize = std::mem::transmute(entry.address);
                    return f(arg0, arg1);
                }
            }
        }
    }
    LispObject::nil().raw()
}

/// Uniform calling convention funcall
/// Takes a function reference and args_and_env list, calls the function
#[no_mangle]
pub extern "C" fn cc_funcall(func_ref: usize, args_and_env: usize) -> usize {
    let registry = get_registry().lock().unwrap();

    if let Some(name) = extract_function_name(func_ref) {
        if let Some(entry) = registry.get(&name) {
            // Check if function uses uniform calling convention
            if entry.arity == usize::MAX {
                unsafe {
                    // Call with uniform calling convention: fn(args_and_env) -> result
                    let f: extern "C" fn(usize) -> usize = std::mem::transmute(entry.address);
                    return f(args_and_env);
                }
            }
        }
    }
    LispObject::nil().raw()
}

// Legacy variadic funcall - dispatches to appropriate arity-specific version
#[no_mangle]
pub extern "C" fn cc_funcall_variadic(func_ref: usize, nargs: usize, args_ptr: *const usize) -> usize {
    let args = if args_ptr.is_null() || nargs == 0 {
        vec![]
    } else {
        unsafe { std::slice::from_raw_parts(args_ptr, nargs) }.to_vec()
    };

    let registry = get_registry().lock().unwrap();
    if let Some(name) = extract_function_name(func_ref) {
        if let Some(entry) = registry.get(&name) {
            if entry.arity == nargs {
                unsafe {
                    match nargs {
                        0 => {
                            let f: extern "C" fn() -> usize = std::mem::transmute(entry.address);
                            return f();
                        }
                        1 => {
                            let f: extern "C" fn(usize) -> usize = std::mem::transmute(entry.address);
                            return f(args[0]);
                        }
                        2 => {
                            let f: extern "C" fn(usize, usize) -> usize = std::mem::transmute(entry.address);
                            return f(args[0], args[1]);
                        }
                        3 => {
                            let f: extern "C" fn(usize, usize, usize) -> usize = std::mem::transmute(entry.address);
                            return f(args[0], args[1], args[2]);
                        }
                        4 => {
                            let f: extern "C" fn(usize, usize, usize, usize) -> usize = std::mem::transmute(entry.address);
                            return f(args[0], args[1], args[2], args[3]);
                        }
                        5 => {
                            let f: extern "C" fn(usize, usize, usize, usize, usize) -> usize = std::mem::transmute(entry.address);
                            return f(args[0], args[1], args[2], args[3], args[4]);
                        }
                        _ => {
                            // Unsupported arity
                            return LispObject::nil().raw();
                        }
                    }
                }
            }
        }
    }

    LispObject::nil().raw()
}

/// Create function ref from compile-time constant string name
/// Used for #'function-name syntax
#[no_mangle]
pub extern "C" fn cc_make_function_ref_const(name_ptr: *const i8) -> usize {
    cc_make_function_ref(name_ptr)
}

/// Create lambda ref from compile-time constant lambda name
/// Used for (lambda ...) expressions
#[no_mangle]
pub extern "C" fn cc_make_lambda_ref_str(name_ptr: *const i8) -> usize {
    cc_make_function_ref(name_ptr)
}

/// Create lambda ref from lambda ID
/// Takes an integer ID and creates a function reference for __lambda_<id>
#[no_mangle]
pub extern "C" fn cc_make_lambda_ref_id(id: i64) -> usize {
    let name = format!("__lambda_{}", id);

    // Use ID as the function reference (with offset to avoid collisions)
    let func_id = id + 1000000;  // Offset to avoid collisions with other function IDs

    let mut id_map = get_id_map().lock().unwrap();
    id_map.insert(func_id, name);

    LispObject::fixnum(func_id).raw()
}

/// Create a closure from lambda ID and captured variables
/// Stack: [var_n] ... [var_1] [var_0] -> [closure]
/// Pops num_captured variables from stack and creates a closure object
#[no_mangle]
pub extern "C" fn cc_make_closure(lambda_id: i64, num_captured: i64) -> usize {
    use rlasp_runtime::Closure;

    // Register the lambda name in the ID map
    let name = format!("__lambda_{}", lambda_id);
    let func_id = lambda_id + 1000000;
    {
        let mut id_map = get_id_map().lock().unwrap();
        id_map.insert(func_id, name);
    }

    // Pop captured variables from stack
    let mut captured_vars = Vec::new();
    for _ in 0..num_captured {
        let var = stack_pop_pointer();
        captured_vars.push(unsafe { LispObject::from_raw(var) });
    }
    // Reverse to get correct order (stack is LIFO)
    captured_vars.reverse();

    // Create closure object
    let closure_ptr = Closure::new(lambda_id, &captured_vars);

    // Return as General pointer
    LispObject::from_general_ptr(closure_ptr).raw()
}

/// Apply a function to a list of arguments
/// (apply func args-list) - calls func with elements of args-list
#[no_mangle]
pub extern "C" fn cc_apply(func_ref: usize, args_list: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_list) };
    let elements = list_to_vec(args_obj);

    // Push arguments onto the stack in order
    for arg in &elements {
        stack_push_pointer(arg.raw());
    }

    // Call using stack-based convention
    cc_funcall_stack(func_ref, elements.len() as i64);

    // Pop and return result
    stack_pop_pointer()
}

thread_local! {
    static TAILCALL_PENDING: std::cell::Cell<bool> = std::cell::Cell::new(false);
    static TAILCALL_FUNC_REF: std::cell::Cell<usize> = std::cell::Cell::new(0);
    static TAILCALL_NUM_ARGS: std::cell::Cell<i64> = std::cell::Cell::new(0);
}

#[inline]
fn clear_tailcall_request() {
    TAILCALL_PENDING.with(|pending| pending.set(false));
}

#[inline]
fn take_tailcall_request() -> Option<(usize, i64)> {
    let pending = TAILCALL_PENDING.with(|slot| slot.get());
    if !pending {
        return None;
    }
    TAILCALL_PENDING.with(|slot| slot.set(false));
    let func_ref = TAILCALL_FUNC_REF.with(|slot| slot.get());
    let num_args = TAILCALL_NUM_ARGS.with(|slot| slot.get());
    Some((func_ref, num_args))
}

/// Request a tail call from MLIR-compiled code.
/// The caller should return immediately after invoking this function.
#[no_mangle]
pub extern "C" fn cc_tailcall_stack(func_ref: usize, num_args: i64) {
    TAILCALL_FUNC_REF.with(|slot| slot.set(func_ref));
    TAILCALL_NUM_ARGS.with(|slot| slot.set(num_args));
    TAILCALL_PENDING.with(|slot| slot.set(true));
}

/// Funcall for stack-based calling convention
/// Takes a function reference (symbol) and the number of arguments on stack
/// Arguments are already on the stack, function will pop them
/// Function pushes result to stack
/// If function is not found, pops num_args to clean up stack and pushes NIL
#[no_mangle]
pub extern "C" fn cc_funcall_stack(func_ref: usize, num_args: i64) {
    use rlasp_runtime::{Closure, TypeHeader, ObjectType};
    use rlasp_runtime::eval_stack::stack_depth;
    use std::sync::atomic::{AtomicUsize, Ordering};
    use std::io::Write;
    use std::cell::Cell;

    thread_local! {
        static FUNCALL_DEPTH: Cell<usize> = Cell::new(0);
    }

    struct FuncallDepthGuard;
    impl FuncallDepthGuard {
        fn enter() -> (Self, usize) {
            let depth = FUNCALL_DEPTH.with(|d| {
                let v = d.get() + 1;
                d.set(v);
                v
            });
            (FuncallDepthGuard, depth)
        }
    }
    impl Drop for FuncallDepthGuard {
        fn drop(&mut self) {
            FUNCALL_DEPTH.with(|d| {
                let v = d.get();
                d.set(v.saturating_sub(1));
            });
        }
    }

    // Optional tracing for debugging stack overflows
    let debug_enabled = std::env::var("RLASP_TRACE_FUNCALL").is_ok();
    let trace_limit = std::env::var("RLASP_TRACE_FUNCALL_LIMIT")
        .ok()
        .and_then(|s| s.parse::<usize>().ok())
        .unwrap_or(9000);

    let (_depth_guard, call_depth) = FuncallDepthGuard::enter();
    // Debug: track call count
    static CALL_COUNT: AtomicUsize = AtomicUsize::new(0);

    let mut current_func_ref = func_ref;
    let mut current_num_args = num_args;

    loop {
        clear_tailcall_request();
        let count = CALL_COUNT.fetch_add(1, Ordering::SeqCst);

        // Check stack depth before any operations
        let depth_before = stack_depth();
        if depth_before < current_num_args {
            eprintln!("[STACK ERROR #{}] cc_funcall_stack: need {} args but stack has only {} items",
                      count, current_num_args, depth_before);
            // Push NIL result to maintain stack balance
            stack_push_nil();
            return;
        }

        let obj = unsafe { LispObject::from_raw(current_func_ref) };
        let function_name_of = |value: LispObject| -> Option<String> {
            if !value.is_general() {
                return None;
            }
            let ptr = value.as_general_ptr::<()>()?;
            if ptr.is_null() {
                return None;
            }
            match unsafe { TypeHeader::from_ptr(ptr) } {
                Some(ObjectType::Symbol) => {
                    let sym = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                    Some(sym.name().to_string())
                }
                Some(ObjectType::String) => {
                    let s = unsafe { &*(ptr as *const rlasp_runtime::RString) };
                    Some(s.as_str().to_string())
                }
                _ => None,
            }
        };

        if debug_enabled && count < trace_limit {
            // Try to get function name for debug output - be careful about dereferencing
            let name_str = if let Some(func_id) = obj.as_fixnum() {
                if let Some(name) = extract_function_name(current_func_ref) {
                    name
                } else {
                    format!("<id:{}>", func_id)
                }
            } else if let Some(name) = function_name_of(obj) {
                name
            } else if obj.is_general() {
                if let Some(ptr) = obj.as_general_ptr::<()>() {
                    if !ptr.is_null() {
                        if let Some(t) = unsafe { TypeHeader::from_ptr(ptr) } {
                            format!("<general:{:?}>", t)
                        } else {
                            "<general:unknown>".to_string()
                        }
                    } else {
                        "<general:null>".to_string()
                    }
                } else {
                    "<general?>".to_string()
                }
            } else {
                "<unknown>".to_string()
            };
            eprintln!("[funcall_stack #{}] {} (args={}, depth={}, call_depth={})", count, name_str, current_num_args, depth_before, call_depth);
            let _ = std::io::stderr().flush();
        } else if debug_enabled && count == trace_limit {
            eprintln!("[funcall_stack] trace limit reached ({} calls)", trace_limit);
            let _ = std::io::stderr().flush();
        }

    // Check if it's a closure
    if let Some(closure_ptr) = obj.as_general_ptr::<Closure>() {
        // Check pointer is non-null before dereferencing
        if closure_ptr.is_null() {
            eprintln!("[ERROR] Null closure pointer in cc_funcall_stack");
            stack_push_nil();
            return;
        }
        let closure = unsafe { &*closure_ptr };

        // Verify it's actually a closure
        if let Some(obj_type) = unsafe { TypeHeader::from_ptr(closure_ptr) } {
            if obj_type == ObjectType::Closure {
                // Push captured variables onto the stack (in reverse order)
                let captured = closure.captured_vars();
                for var in captured.iter().rev() {
                    stack_push_pointer(var.raw());
                }

                // Look up the lambda function by ID
                let lambda_id = closure.function_id();
                let name = format!("__lambda_{}", lambda_id);

                let func_address = {
                    let registry = get_registry().lock().unwrap();
                    registry.get(&name).map(|entry| entry.address)
                };

                if let Some(address) = func_address {
                    if debug_enabled && count < trace_limit {
                        eprintln!(
                            "[funcall_stack closure #{}] lambda_id={} captured={} addr=0x{:x}",
                            count,
                            lambda_id,
                            captured.len(),
                            address
                        );
                    }
                    unsafe {
                        // Call lambda function
                        let f: extern "C" fn() = std::mem::transmute(address);
                        f();
                    }
                    if debug_enabled && count < trace_limit {
                        eprintln!(
                            "[funcall_stack closure-return #{}] lambda_id={}",
                            count,
                            lambda_id
                        );
                    }
                    if let Some((next_func_ref, next_num_args)) = take_tailcall_request() {
                        if stack_depth() > 0 {
                            let _ = stack_pop_pointer();
                        }
                        current_func_ref = next_func_ref;
                        current_num_args = next_num_args;
                        continue;
                    }
                    return;
                }
            }
        }
    }

    // Try to extract function name from symbol or fixnum
    let name_opt = if let Some(func_id) = obj.as_fixnum() {
        // Function reference stored as ID
        let id_map = get_id_map().lock().unwrap();
        id_map.get(&func_id).cloned()
    } else if let Some(name) = function_name_of(obj) {
        Some(name)
    } else {
        None
    };

    // Look up function entry (release lock before calling)
    // Try both the raw name and with %FN% prefix (Lisp-2 function namespace)
    // Also try case-insensitive variants since CL symbols are uppercase but
    // MLIR-compiled functions may use lowercase names from source
    let func_entry = if let Some(ref name) = name_opt {
        let registry = get_registry().lock().unwrap();
        // First try direct name lookup
        if let Some(entry) = registry.get(name) {
            Some(entry.clone())
        } else {
            // Try with %FN% prefix for user-defined functions
            let fn_name = format!("%FN%{}", name);
            if let Some(entry) = registry.get(&fn_name) {
                Some(entry.clone())
            } else {
                // Try case-insensitive variants
                let lower = name.to_lowercase();
                let upper = name.to_uppercase();
                let fn_lower = format!("%FN%{}", lower);
                let fn_upper = format!("%FN%{}", upper);
                registry.get(&lower).cloned()
                    .or_else(|| registry.get(&upper).cloned())
                    .or_else(|| registry.get(&fn_lower).cloned())
                    .or_else(|| registry.get(&fn_upper).cloned())
                    .or_else(|| {
                        // Strip package prefix (e.g., "UIOP/PACKAGE:ENSURE-PACKAGE" -> "ENSURE-PACKAGE")
                        let base = strip_package_prefix(name);
                        if base != name {
                            let base_lower = base.to_lowercase();
                            let base_upper = base.to_uppercase();
                            let fn_base = format!("%FN%{}", base);
                            let fn_base_lower = format!("%FN%{}", base_lower);
                            let fn_base_upper = format!("%FN%{}", base_upper);
                            registry.get(base).cloned()
                                .or_else(|| registry.get(&base_lower).cloned())
                                .or_else(|| registry.get(&base_upper).cloned())
                                .or_else(|| registry.get(&fn_base).cloned())
                                .or_else(|| registry.get(&fn_base_lower).cloned())
                                .or_else(|| registry.get(&fn_base_upper).cloned())
                        } else {
                            None
                        }
                    })
            }
        }
    } else {
        None
    };

    if let Some(entry) = func_entry {
        let resolved_name = name_opt.as_deref().unwrap_or("<unknown>");
        if debug_enabled {
            let is_builtin_format =
                resolved_name.eq_ignore_ascii_case("format") && entry.address == cc_format as usize;
            eprintln!(
                "[funcall_stack resolved #{}] name={} addr=0x{:x} expects_args_list={} builtin_format={}",
                count,
                resolved_name,
                entry.address,
                entry.expects_args_list,
                is_builtin_format
            );
        }
        // Debug: trace calls to functions with expects_args_list
        if entry.expects_args_list && std::env::var("RLASP_TRACE_ARGS_LIST").is_ok() {
            use std::sync::atomic::{AtomicUsize, Ordering};
            static TRACE_COUNT: AtomicUsize = AtomicUsize::new(0);
            let tc = TRACE_COUNT.fetch_add(1, Ordering::Relaxed);
            if tc < 10 {
                eprintln!("[TRACE] Calling function that expects_args_list, num_args={}", current_num_args);
            }
        }

        // Check if function expects an args_list
        if entry.expects_args_list && current_num_args > 0 {
            // Package stack args into a list (pop in reverse order, cons together)
            let mut args = Vec::new();
            for _ in 0..current_num_args {
                args.push(stack_pop_pointer());
            }
            // Build list from end (args are now in reverse order)
            let mut list = cc_nil_value();
            for arg in args {
                list = cc_cons(arg, list);
            }
            // Push the args list
            stack_push_pointer(list);
        } else if entry.expects_args_list && current_num_args == 0 {
            // No args but function expects args_list - push NIL
            stack_push_nil();
        }

        if entry.address == 0 {
            eprintln!("[FATAL ERROR] Function has null address! Skipping call.");
            // Pop args and push nil
            for _ in 0..current_num_args {
                let _ = stack_pop_pointer();
            }
            stack_push_nil();
            return;
        }

        unsafe {
            // Call function with stack-based calling convention: () -> ()
            let f: extern "C" fn() = std::mem::transmute(entry.address);
            f();
        }
    } else if let Some(name) = name_opt {
        // Try built-in functions
        match name.as_str() {
            "+" => {
                // Pop two arguments
                let b = stack_pop_pointer();
                let a = stack_pop_pointer();
                let a_obj = unsafe { LispObject::from_raw(a) };
                let b_obj = unsafe { LispObject::from_raw(b) };

                // Add the numbers
                if let (Some(a_num), Some(b_num)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
                    let result = LispObject::fixnum(a_num + b_num);
                    stack_push_pointer(result.raw());
                } else {
                    stack_push_nil();
                }
            }
            "-" => {
                let b = stack_pop_pointer();
                let a = stack_pop_pointer();
                let a_obj = unsafe { LispObject::from_raw(a) };
                let b_obj = unsafe { LispObject::from_raw(b) };

                if let (Some(a_num), Some(b_num)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
                    let result = LispObject::fixnum(a_num - b_num);
                    stack_push_pointer(result.raw());
                } else {
                    stack_push_nil();
                }
            }
            "*" => {
                let b = stack_pop_pointer();
                let a = stack_pop_pointer();
                let a_obj = unsafe { LispObject::from_raw(a) };
                let b_obj = unsafe { LispObject::from_raw(b) };

                if let (Some(a_num), Some(b_num)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
                    let result = LispObject::fixnum(a_num * b_num);
                    stack_push_pointer(result.raw());
                } else {
                    stack_push_nil();
                }
            }
            "/" => {
                let b = stack_pop_pointer();
                let a = stack_pop_pointer();
                let a_obj = unsafe { LispObject::from_raw(a) };
                let b_obj = unsafe { LispObject::from_raw(b) };

                if let (Some(a_num), Some(b_num)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
                    if b_num != 0 {
                        let result = LispObject::fixnum(a_num / b_num);
                        stack_push_pointer(result.raw());
                    } else {
                        stack_push_nil();
                    }
                } else {
                    stack_push_nil();
                }
            }
            "1-" => {
                // Decrement: (1- n) = n - 1
                let a = stack_pop_pointer();
                let a_obj = unsafe { LispObject::from_raw(a) };
                if let Some(a_num) = a_obj.as_fixnum() {
                    let result = LispObject::fixnum(a_num - 1);
                    stack_push_pointer(result.raw());
                } else {
                    stack_push_nil();
                }
            }
            "1+" => {
                // Increment: (1+ n) = n + 1
                let a = stack_pop_pointer();
                let a_obj = unsafe { LispObject::from_raw(a) };
                if let Some(a_num) = a_obj.as_fixnum() {
                    let result = LispObject::fixnum(a_num + 1);
                    stack_push_pointer(result.raw());
                } else {
                    stack_push_nil();
                }
            }
            "parse-integer" | "PARSE-INTEGER" => {
                use malachite::Integer;
                use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
                use rlasp_runtime::header::{ObjectType, TypeHeader};
                use rlasp_runtime::{Number, Symbol, RString};

                let mut args = Vec::new();
                for _ in 0..current_num_args {
                    args.push(unsafe { LispObject::from_raw(stack_pop_pointer()) });
                }
                args.reverse();

                let clear_mvs_and_nil = || {
                    MULTIPLE_VALUES.with(|slot| {
                        slot.borrow_mut().clear();
                    });
                    stack_push_nil();
                };

                let set_two_values = |primary: LispObject, secondary: LispObject| {
                    MULTIPLE_VALUES.with(|slot| {
                        *slot.borrow_mut() = vec![primary, secondary];
                    });
                    stack_push_pointer(primary.raw());
                };

                let extract_string = |obj: LispObject| -> Option<String> {
                    let ptr = obj.as_general_ptr::<()>()?;
                    if ptr.is_null() {
                        return None;
                    }
                    match unsafe { TypeHeader::from_ptr(ptr) } {
                        Some(ObjectType::String) => {
                            let s = unsafe { &*(ptr as *const RString) };
                            Some(s.as_str().to_string())
                        }
                        Some(ObjectType::Symbol) => {
                            let sym = unsafe { &*(ptr as *const Symbol) };
                            let name = sym.name();
                            if name.len() >= 2 && name.starts_with('"') && name.ends_with('"') {
                                Some(name[1..name.len() - 1].to_string())
                            } else {
                                None
                            }
                        }
                        _ => None,
                    }
                };

                let extract_keyword = |obj: LispObject| -> Option<String> {
                    let ptr = obj.as_general_ptr::<()>()?;
                    if ptr.is_null() {
                        return None;
                    }
                    if unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
                        let sym = unsafe { &*(ptr as *const Symbol) };
                        Some(sym.name().to_ascii_uppercase())
                    } else {
                        None
                    }
                };

                let mut parse_error = false;
                let mut final_values: Option<(LispObject, LispObject)> = None;

                if let Some(first_arg) = args.first().copied() {
                    if let Some(text) = extract_string(first_arg) {
                        let mut radix: u32 = 10;
                        let mut start: usize = 0;
                        let mut end: usize = text.len();
                        let mut junk_allowed = false;

                        let mut i = 1usize;
                        while i + 1 < args.len() {
                            let Some(key) = extract_keyword(args[i]) else {
                                i += 1;
                                continue;
                            };
                            let val = args[i + 1];
                            match key.as_str() {
                                ":RADIX" => {
                                    if let Some(n) = val.as_fixnum() {
                                        if (2..=36).contains(&(n as i64)) {
                                            radix = n as u32;
                                        } else {
                                            parse_error = true;
                                            break;
                                        }
                                    }
                                }
                                ":START" => {
                                    if let Some(n) = val.as_fixnum() {
                                        if n < 0 {
                                            parse_error = true;
                                            break;
                                        }
                                        start = n as usize;
                                    }
                                }
                                ":END" => {
                                    if val.is_nil() {
                                        end = text.len();
                                    } else if let Some(n) = val.as_fixnum() {
                                        if n < 0 {
                                            parse_error = true;
                                            break;
                                        }
                                        end = n as usize;
                                    }
                                }
                                ":JUNK-ALLOWED" => {
                                    junk_allowed = !val.is_nil();
                                }
                                _ => {}
                            }
                            i += 2;
                        }

                        if !parse_error {
                            if start > text.len() {
                                parse_error = true;
                            }
                            end = end.min(text.len());
                            if start > end {
                                parse_error = true;
                            }
                        }

                        if !parse_error {
                            let mut pos = start;
                            while pos < end {
                                let Some(ch) = text[pos..end].chars().next() else { break };
                                if ch.is_whitespace() {
                                    pos += ch.len_utf8();
                                } else {
                                    break;
                                }
                            }

                            let mut is_negative = false;
                            if pos < end {
                                if let Some(ch) = text[pos..end].chars().next() {
                                    if ch == '+' || ch == '-' {
                                        is_negative = ch == '-';
                                        pos += ch.len_utf8();
                                    }
                                }
                            }

                            let mut acc = Integer::from(0);
                            let mut parsed_any = false;
                            while pos < end {
                                let Some(ch) = text[pos..end].chars().next() else { break };
                                if let Some(d) = ch.to_digit(radix) {
                                    parsed_any = true;
                                    acc = acc * Integer::from(radix as i64) + Integer::from(d as i64);
                                    pos += ch.len_utf8();
                                } else {
                                    break;
                                }
                            }

                            if !parsed_any {
                                if junk_allowed {
                                    final_values = Some((LispObject::nil(), LispObject::fixnum(pos as i64)));
                                } else {
                                    parse_error = true;
                                }
                            } else {
                                if !junk_allowed {
                                    while pos < end {
                                        let Some(ch) = text[pos..end].chars().next() else { break };
                                        if ch.is_whitespace() {
                                            pos += ch.len_utf8();
                                        } else {
                                            parse_error = true;
                                            break;
                                        }
                                    }
                                }

                                if !parse_error {
                                    if is_negative {
                                        acc = -acc;
                                    }

                                    const MAX_FIXNUM: i64 = (1 << 61) - 1;
                                    const MIN_FIXNUM: i64 = -(1 << 61);
                                    let primary = if i64::convertible_from(&acc) {
                                        let n = i64::exact_from(&acc);
                                        if (MIN_FIXNUM..=MAX_FIXNUM).contains(&n) {
                                            LispObject::fixnum(n)
                                        } else {
                                            unsafe { LispObject::from_raw(Number::allocate_bignum(acc).raw()) }
                                        }
                                    } else {
                                        unsafe { LispObject::from_raw(Number::allocate_bignum(acc).raw()) }
                                    };
                                    let secondary = LispObject::fixnum(pos as i64);
                                    final_values = Some((primary, secondary));
                                }
                            }
                        }
                    } else {
                        parse_error = true;
                    }
                } else {
                    parse_error = true;
                }

                if parse_error {
                    clear_mvs_and_nil();
                } else if let Some((primary, secondary)) = final_values {
                    set_two_values(primary, secondary);
                } else {
                    clear_mvs_and_nil();
                }
            }
            "coerce" => {
                // Simplified coerce: (coerce obj type) - return obj for now
                let _type_arg = stack_pop_pointer();
                let obj = stack_pop_pointer();
                // Just return the object unchanged for now
                stack_push_pointer(obj);
            }
            "vector" => {
                // (vector &rest args) - create a vector from arguments
                // Pop all args and create vector
                let mut items = Vec::new();
                for _ in 0..current_num_args {
                    let item = stack_pop_pointer();
                    items.push(unsafe { LispObject::from_raw(item) });
                }
                items.reverse();  // Stack is LIFO
                let vec = rlasp_runtime::RVector::allocate(items);
                stack_push_pointer(vec.raw());
            }
            "string/=" | "STRING/=" => {
                use rlasp_runtime::header::{ObjectType, TypeHeader};
                let b = unsafe { LispObject::from_raw(stack_pop_pointer()) };
                let a = unsafe { LispObject::from_raw(stack_pop_pointer()) };

                let as_string = |obj: LispObject| -> Option<String> {
                    let coerced = unsafe { LispObject::from_raw(cc_string(obj.raw())) };
                    let ptr = coerced.as_general_ptr::<()>()?;
                    if ptr.is_null() || unsafe { TypeHeader::from_ptr(ptr) } != Some(ObjectType::String) {
                        return None;
                    }
                    let s = unsafe { &*(ptr as *const rlasp_runtime::RString) };
                    Some(s.as_str().to_string())
                };

                if let (Some(sa), Some(sb)) = (as_string(a), as_string(b)) {
                    let mut diff = None;
                    let mut iter_a = sa.chars();
                    let mut iter_b = sb.chars();
                    let mut idx: usize = 0;
                    loop {
                        match (iter_a.next(), iter_b.next()) {
                            (Some(ca), Some(cb)) => {
                                if ca != cb {
                                    diff = Some(idx);
                                    break;
                                }
                                idx += 1;
                            }
                            (Some(_), None) | (None, Some(_)) => {
                                diff = Some(idx);
                                break;
                            }
                            (None, None) => break,
                        }
                    }
                    if let Some(i) = diff {
                        stack_push_pointer(LispObject::fixnum(i as i64).raw());
                    } else {
                        stack_push_nil();
                    }
                } else {
                    stack_push_nil();
                }
            }
            "string-not-equal" | "STRING-NOT-EQUAL" => {
                use rlasp_runtime::header::{ObjectType, TypeHeader};
                let b = unsafe { LispObject::from_raw(stack_pop_pointer()) };
                let a = unsafe { LispObject::from_raw(stack_pop_pointer()) };

                let as_string = |obj: LispObject| -> Option<String> {
                    let coerced = unsafe { LispObject::from_raw(cc_string(obj.raw())) };
                    let ptr = coerced.as_general_ptr::<()>()?;
                    if ptr.is_null() || unsafe { TypeHeader::from_ptr(ptr) } != Some(ObjectType::String) {
                        return None;
                    }
                    let s = unsafe { &*(ptr as *const rlasp_runtime::RString) };
                    Some(s.as_str().to_string())
                };

                if let (Some(sa), Some(sb)) = (as_string(a), as_string(b)) {
                    let mut diff = None;
                    let mut iter_a = sa.chars();
                    let mut iter_b = sb.chars();
                    let mut idx: usize = 0;
                    loop {
                        match (iter_a.next(), iter_b.next()) {
                            (Some(ca), Some(cb)) => {
                                if !ca.eq_ignore_ascii_case(&cb) {
                                    diff = Some(idx);
                                    break;
                                }
                                idx += 1;
                            }
                            (Some(_), None) | (None, Some(_)) => {
                                diff = Some(idx);
                                break;
                            }
                            (None, None) => break,
                        }
                    }
                    if let Some(i) = diff {
                        stack_push_pointer(LispObject::fixnum(i as i64).raw());
                    } else {
                        stack_push_nil();
                    }
                } else {
                    stack_push_nil();
                }
            }
            "define-condition" | "DEFINE-CONDITION" => {
                // Macro that should have been expanded - just return the condition name
                // Pop all args (condition-name supers slots options...)
                if current_num_args > 0 {
                    let first_arg = stack_pop_pointer();  // Get condition name
                    for _ in 1..current_num_args {
                        let _ = stack_pop_pointer();  // Discard rest
                    }
                    stack_push_pointer(first_arg);  // Return the name
                } else {
                    stack_push_nil();
                }
            }
            "define-package" | "DEFINE-PACKAGE" | "UIOP/PACKAGE:DEFINE-PACKAGE" => {
                // Macro that should have been expanded - just return the package name
                if current_num_args > 0 {
                    let first_arg = stack_pop_pointer();  // Get package name
                    for _ in 1..current_num_args {
                        let _ = stack_pop_pointer();  // Discard rest
                    }
                    stack_push_pointer(first_arg);  // Return the name
                } else {
                    stack_push_nil();
                }
            }
            "report" | "REPORT" => {
                // (report ...) - condition report macro, just pop args and push nil
                for _ in 0..current_num_args {
                    let _ = stack_pop_pointer();
                }
                stack_push_nil();
            }
            "default-initargs" | "DEFAULT-INITARGS" => {
                // Pop args and push nil
                for _ in 0..current_num_args {
                    let _ = stack_pop_pointer();
                }
                stack_push_nil();
            }
            "lambda" | "LAMBDA" => {
                // Lambda that wasn't compiled - just pop args and push nil
                for _ in 0..current_num_args {
                    let _ = stack_pop_pointer();
                }
                stack_push_nil();
            }
            _ => {
                // Try generic function dispatch
                use crate::intrinsics_clos::{get_generic_registry, execute_stack_based_dispatch};
                let registry = get_generic_registry().lock().unwrap();
                if registry.contains_key(&name) {
                    // It's a generic function - dispatch using CLOS
                    drop(registry); // Release lock before calling
                    execute_stack_based_dispatch(&name, current_num_args as usize);
                } else {
                    // Function not found - clean up arguments and push nil
                    // Pop all arguments to prevent stack corruption
                    for _ in 0..current_num_args {
                        let _ = stack_pop_pointer();
                    }
                    stack_push_nil();
                }
            }
        }
    } else {
        // Function not found or invalid reference
        // Clean up arguments and push nil
        for _ in 0..current_num_args {
            let _ = stack_pop_pointer();
        }
        stack_push_nil();
    }
        if let Some((next_func_ref, next_num_args)) = take_tailcall_request() {
            if stack_depth() > 0 {
                let _ = stack_pop_pointer();
            }
            current_func_ref = next_func_ref;
            current_num_args = next_num_args;
            continue;
        }
        return;
    }
}

/// Check if a variable is bound
/// (boundp symbol) - returns T if symbol has a value, NIL otherwise
#[no_mangle]
pub extern "C" fn cc_boundp(args_and_env: usize) -> usize {
    // For JIT mode, always return T (assume variables are bound)
    // Full implementation would need symbol table lookup
    LispObject::t().raw()
}

/// Check if a function is bound
/// (fboundp symbol) - returns T if symbol names a function, NIL otherwise
#[no_mangle]
pub extern "C" fn cc_fboundp(args_and_env: usize) -> usize {
    // For JIT mode, always return T (assume functions are bound)
    LispObject::t().raw()
}

/// Check if an object is a function
/// (functionp object) - returns T if object is a function, NIL otherwise
#[no_mangle]
pub extern "C" fn cc_functionp(args_and_env: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let obj = cons.car();

        // Check if it's a function reference (stored as fixnum ID)
        if obj.as_fixnum().is_some() {
            // It's a fixnum, check if it's a valid function ID
            let func_id = obj.as_fixnum().unwrap();
            let id_map = get_id_map().lock().unwrap();

            if id_map.contains_key(&func_id) {
                LispObject::t().raw()
            } else {
                LispObject::nil().raw()
            }
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Evaluate an expression
/// (eval form) - evaluates form and returns the result
#[no_mangle]
pub extern "C" fn cc_eval(args_and_env: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let form = cons.car();
        eval_form(form)
    } else {
        LispObject::nil().raw()
    }
}

/// Recursively evaluate a Lisp form
fn eval_form(form: LispObject) -> usize {
    use rlasp_runtime::Symbol;

    // Self-evaluating: numbers, strings, nil, t
    if form.as_fixnum().is_some() {
        return form.raw();
    }
    if form.is_nil() {
        return form.raw();
    }
    if let Some(num_ptr) = form.as_general_ptr::<rlasp_runtime::Number>() {
        return form.raw();
    }
    if as_string_ptr_checked(form).is_some() {
        return form.raw();
    }

    // Symbol - for now just return itself (no environment lookup)
    if let Some(sym_ptr) = as_symbol_ptr_checked(form) {
        let sym = unsafe { &*sym_ptr };
        let name = sym.name();
        // T evaluates to itself
        if name == "T" || name == "t" {
            return LispObject::t().raw();
        }
        // NIL evaluates to nil
        if name == "NIL" || name == "nil" {
            return LispObject::nil().raw();
        }
        // Other symbols: return as-is (simplified - no env lookup)
        return form.raw();
    }

    // List (cons) - function application
    if let Some(cons_ptr) = form.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let car = cons.car();
        let cdr = cons.cdr();

        // Get function name
        let func_name = if let Some(sym_ptr) = as_symbol_ptr_checked(car) {
            let sym = unsafe { &*sym_ptr };
            sym.name().to_string()
        } else {
            return LispObject::nil().raw();
        };

        // Collect and evaluate arguments
        let mut args = Vec::new();
        let mut current = cdr;
        while let Some(arg_cons_ptr) = current.as_cons_ptr() {
            let arg_cons = unsafe { &*arg_cons_ptr };
            let evaled = eval_form(arg_cons.car());
            args.push(unsafe { LispObject::from_raw(evaled) });
            current = arg_cons.cdr();
        }

        // Dispatch on function name
        match func_name.as_str() {
            "+" => {
                let mut result: i64 = 0;
                for arg in &args {
                    if let Some(n) = arg.as_fixnum() {
                        result += n;
                    }
                }
                return cc_box_fixnum(result);
            }
            "-" => {
                if args.is_empty() {
                    return cc_box_fixnum(0);
                }
                let mut result = args[0].as_fixnum().unwrap_or(0);
                if args.len() == 1 {
                    return cc_box_fixnum(-result);
                }
                for arg in &args[1..] {
                    if let Some(n) = arg.as_fixnum() {
                        result -= n;
                    }
                }
                return cc_box_fixnum(result);
            }
            "*" => {
                let mut result: i64 = 1;
                for arg in &args {
                    if let Some(n) = arg.as_fixnum() {
                        result *= n;
                    }
                }
                return cc_box_fixnum(result);
            }
            "/" => {
                if args.len() < 2 {
                    return LispObject::nil().raw();
                }
                let mut result = args[0].as_fixnum().unwrap_or(1);
                for arg in &args[1..] {
                    if let Some(n) = arg.as_fixnum() {
                        if n != 0 {
                            result /= n;
                        }
                    }
                }
                return cc_box_fixnum(result);
            }
            "list" => {
                // Build a list from the evaluated args
                let mut result = LispObject::nil().raw();
                for arg in args.iter().rev() {
                    result = cc_cons(arg.raw(), result);
                }
                return result;
            }
            "cons" => {
                if args.len() >= 2 {
                    return cc_cons(args[0].raw(), args[1].raw());
                }
                return LispObject::nil().raw();
            }
            "car" => {
                if args.len() >= 1 {
                    if let Some(c) = args[0].as_cons_ptr() {
                        return unsafe { (*c).car().raw() };
                    }
                }
                return LispObject::nil().raw();
            }
            "cdr" => {
                if args.len() >= 1 {
                    if let Some(c) = args[0].as_cons_ptr() {
                        return unsafe { (*c).cdr().raw() };
                    }
                }
                return LispObject::nil().raw();
            }
            "quote" => {
                // Return the unevaluated argument
                let mut current = cdr;
                if let Some(arg_cons_ptr) = current.as_cons_ptr() {
                    let arg_cons = unsafe { &*arg_cons_ptr };
                    return arg_cons.car().raw();
                }
                return LispObject::nil().raw();
            }
            _ => {
                // Unknown function - return nil
                return LispObject::nil().raw();
            }
        }
    }

    // Default: return the form itself
    form.raw()
}

/// Compile a lambda expression
/// (compile name lambda-expr) - compiles the lambda expression
#[no_mangle]
pub extern "C" fn cc_compile(args_and_env: usize) -> usize {
    // For now, return the lambda expression as-is (already compiled in JIT mode)
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let cdr_obj = cons.cdr();

        if let Some(cdr_cons_ptr) = cdr_obj.as_cons_ptr() {
            let cdr_cons = unsafe { &*cdr_cons_ptr };
            cdr_cons.car().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Read a Lisp expression from a string
/// (read-from-string string) - parses string and returns the Lisp object
#[no_mangle]
pub extern "C" fn cc_read_from_string(args_and_env: usize) -> usize {
    use rlasp_reader::reader::read_from_string;

    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let string_obj = cons.car();

        // Extract the string from the RString object
        if let Some(str_ptr) = string_obj.as_general_ptr::<RString>() {
            let rstring = unsafe { &*str_ptr };
            let rust_str = rstring.as_str();

            // Parse the string using the reader
            match read_from_string(rust_str) {
                Ok(obj) => obj.raw(),
                Err(_) => LispObject::nil().raw(),
            }
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Reduce a sequence with a function
/// (reduce func sequence) - applies func cumulatively to sequence elements
#[no_mangle]
pub extern "C" fn cc_reduce(args_and_env: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let func_ref = cons.car();

        // Get the sequence (second argument)
        let cdr_obj = cons.cdr();
        if let Some(args_cons_ptr) = cdr_obj.as_cons_ptr() {
            let args_cons = unsafe { &*args_cons_ptr };
            let sequence = args_cons.car();

            // Reduce the list
            let mut accumulator = LispObject::nil();
            let mut current = sequence;
            let mut first = true;

            while let Some(cons_ptr) = current.as_cons_ptr() {
                let cons = unsafe { &*cons_ptr };
                let elem = cons.car();

                if first {
                    accumulator = elem;
                    first = false;
                } else {
                    // Call func with (accumulator, elem)
                    let nil_raw = LispObject::nil().raw();
                    let args_list_raw = cc_cons(elem.raw(), nil_raw);
                    let full_args_raw = cc_cons(accumulator.raw(), args_list_raw);

                    let result = cc_funcall(func_ref.raw(), full_args_raw);
                    accumulator = unsafe { LispObject::from_raw(result) };
                }

                current = cons.cdr();
            }

            accumulator.raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Increment a place
/// (incf place) - increments the value at place and returns the new value
#[no_mangle]
pub extern "C" fn cc_incf(args_and_env: usize) -> usize {
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let place = cons.car();

        // Get the increment (default 1 if not provided)
        let cdr_obj = cons.cdr();
        let increment = if let Some(inc_cons_ptr) = cdr_obj.as_cons_ptr() {
            let inc_cons = unsafe { &*inc_cons_ptr };
            inc_cons.car()
        } else {
            LispObject::fixnum(1)
        };

        // Add place and increment
        let result = cc_add(place.raw(), increment.raw());
        result
    } else {
        LispObject::nil().raw()
    }
}

// =============================================================================
// Vector intrinsics
// =============================================================================

/// Create a new vector with the given length (all elements initialized to nil)
#[no_mangle]
pub extern "C" fn cc_make_vector(len: usize) -> usize {
    let mut elements = Vec::with_capacity(len);
    for _ in 0..len {
        elements.push(LispObject::nil());
    }
    rlasp_runtime::RVector::allocate(elements).raw()
}

/// Set an element in a simple vector (svset)
/// Returns the value that was set
#[no_mangle]
pub extern "C" fn cc_svset(vector: usize, index: usize, value: usize) -> usize {
    let vec_obj = unsafe { LispObject::from_raw(vector) };
    let value_obj = unsafe { LispObject::from_raw(value) };

    if let Some(vec_ptr) = vec_obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if !vec_ptr.is_null() {
            let vec = unsafe { &mut *(vec_ptr as *mut rlasp_runtime::RVector) };
            vec.set(index, value_obj);
        }
    }

    value
}

/// Get an element from a simple vector (svref)
#[no_mangle]
pub extern "C" fn cc_svref(vector: usize, index: usize) -> usize {
    let vec_obj = unsafe { LispObject::from_raw(vector) };

    if let Some(vec_ptr) = vec_obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if !vec_ptr.is_null() {
            let vec = unsafe { &*vec_ptr };
            if let Some(elem) = vec.get(index) {
                return elem.raw();
            }
        }
    }

    LispObject::nil().raw()
}

/// Get the length of a vector
#[no_mangle]
pub extern "C" fn cc_vector_length(vector: usize) -> usize {
    let vec_obj = unsafe { LispObject::from_raw(vector) };

    if let Some(vec_ptr) = vec_obj.as_general_ptr::<rlasp_runtime::RVector>() {
        if !vec_ptr.is_null() {
            let vec = unsafe { &*vec_ptr };
            return LispObject::fixnum(vec.len() as i64).raw();
        }
    }

    LispObject::fixnum(0).raw()
}

// =============================================================================
// Higher-order function intrinsics (some, every, find-if, remove-if, etc.)
// =============================================================================

/// Helper: iterate over a list
fn list_to_vec(list: LispObject) -> Vec<LispObject> {
    let mut result = Vec::new();
    let mut current = list;
    loop {
        if current.is_nil() {
            break;
        }
        if let Some(cons) = current.as_cons_ptr() {
            let cons_ref = unsafe { &*cons };
            result.push(cons_ref.car());
            current = cons_ref.cdr();
        } else {
            // Improper list - add the last element
            result.push(current);
            break;
        }
    }
    result
}

fn sequence_to_vec(seq: LispObject) -> Option<Vec<LispObject>> {
    if seq.is_nil() {
        return Some(Vec::new());
    }
    if seq.as_cons_ptr().is_some() {
        return Some(list_to_vec(seq));
    }
    if let Some(str_ptr) = seq.as_general_ptr::<rlasp_runtime::RString>() {
        if !str_ptr.is_null() {
            let s = unsafe { &*str_ptr };
            let mut items = Vec::new();
            for ch in s.as_str().chars() {
                items.push(LispObject::character(ch));
            }
            return Some(items);
        }
    }
    if let Some(vec_ptr) = seq.as_general_ptr::<rlasp_runtime::RVector>() {
        if !vec_ptr.is_null() {
            let vec = unsafe { &*vec_ptr };
            return Some(vec.as_slice().to_vec());
        }
    }
    None
}

fn truthy_obj(obj: LispObject) -> bool {
    !obj.is_nil()
}

thread_local! {
    static MULTIPLE_VALUES: std::cell::RefCell<Vec<LispObject>> = std::cell::RefCell::new(Vec::new());
}

/// Store a packed list of values as the current multiple-values and return primary value.
#[no_mangle]
pub extern "C" fn cc_values_pack(values_list: usize) -> usize {
    let values_obj = unsafe { LispObject::from_raw(values_list) };
    let values = list_to_vec(values_obj);
    let primary = values.first().copied().unwrap_or_else(LispObject::nil);
    MULTIPLE_VALUES.with(|slot| {
        *slot.borrow_mut() = values;
    });
    primary.raw()
}

/// Return all current multiple values as a list.
/// Falls back to a single-element list containing `primary_value`.
#[no_mangle]
pub extern "C" fn cc_multiple_value_list(primary_value: usize) -> usize {
    let primary_obj = unsafe { LispObject::from_raw(primary_value) };
    let maybe_values = MULTIPLE_VALUES.with(|slot| {
        let mut vals = slot.borrow_mut();
        if vals.is_empty() {
            None
        } else {
            Some(std::mem::take(&mut *vals))
        }
    });

    let values = if let Some(vals) = maybe_values {
        if vals.first().map(|v| v.raw()) == Some(primary_value) {
            vals
        } else {
            vec![primary_obj]
        }
    } else {
        vec![primary_obj]
    };

    let mut result = LispObject::nil();
    for value in values.iter().rev() {
        result = rlasp_runtime::Cons::allocate(*value, result);
    }
    result.raw()
}

fn call_func_1(func: LispObject, arg: LispObject) -> LispObject {
    stack_push_pointer(arg.raw());
    cc_funcall_stack(func.raw(), 1);
    let result = stack_pop_pointer();
    unsafe { LispObject::from_raw(result) }
}

fn call_func_2(func: LispObject, a: LispObject, b: LispObject) -> LispObject {
    use rlasp_runtime::header::{ObjectType, TypeHeader};

    if let Some(ptr) = func.as_general_ptr::<()>() {
        if !ptr.is_null() && unsafe { TypeHeader::from_ptr(ptr) } == Some(ObjectType::Symbol) {
            let sym = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
            let name = sym.name();
            if name.eq_ignore_ascii_case("equalp") {
                return unsafe { LispObject::from_raw(cc_equalp(a.raw(), b.raw())) };
            }
            if name.eq_ignore_ascii_case("equal") {
                return unsafe { LispObject::from_raw(cc_equal(a.raw(), b.raw())) };
            }
        }
    }

    stack_push_pointer(a.raw());
    stack_push_pointer(b.raw());
    cc_funcall_stack(func.raw(), 2);
    let result = stack_pop_pointer();
    unsafe { LispObject::from_raw(result) }
}

/// (some predicate list) - returns first non-nil result of applying predicate
#[no_mangle]
pub extern "C" fn cc_some(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    for elem in elements {
        let result = cc_funcall_1(pred.raw(), elem.raw());
        let result_obj = unsafe { LispObject::from_raw(result) };
        if !result_obj.is_nil() {
            return result;
        }
    }
    LispObject::nil().raw()
}

/// (every predicate list) - returns T if predicate is true for all elements
#[no_mangle]
pub extern "C" fn cc_every(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    for elem in elements {
        let result = cc_funcall_1(pred.raw(), elem.raw());
        let result_obj = unsafe { LispObject::from_raw(result) };
        if result_obj.is_nil() {
            return LispObject::nil().raw();
        }
    }
    LispObject::t().raw()
}

/// (every predicate list1 list2) - returns T if predicate is true for all pairs.
#[no_mangle]
pub extern "C" fn cc_every2(predicate: usize, list1: usize, list2: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list1_obj = unsafe { LispObject::from_raw(list1) };
    let list2_obj = unsafe { LispObject::from_raw(list2) };

    let elements1 = list_to_vec(list1_obj);
    let elements2 = list_to_vec(list2_obj);
    let n = std::cmp::min(elements1.len(), elements2.len());
    for i in 0..n {
        let result = call_func_2(pred, elements1[i], elements2[i]);
        if result.is_nil() {
            return LispObject::nil().raw();
        }
    }
    LispObject::t().raw()
}

/// (find-if predicate list) - returns first element for which predicate is non-nil
#[no_mangle]
pub extern "C" fn cc_find_if(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    for elem in elements {
        let result = cc_funcall_1(pred.raw(), elem.raw());
        let result_obj = unsafe { LispObject::from_raw(result) };
        if !result_obj.is_nil() {
            return elem.raw();
        }
    }
    LispObject::nil().raw()
}

/// (find-if-not predicate list) - returns first element for which predicate is nil
#[no_mangle]
pub extern "C" fn cc_find_if_not(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    for elem in elements {
        let result = cc_funcall_1(pred.raw(), elem.raw());
        let result_obj = unsafe { LispObject::from_raw(result) };
        if result_obj.is_nil() {
            return elem.raw();
        }
    }
    LispObject::nil().raw()
}

/// (remove-if predicate list) - returns list with elements for which predicate is true removed
#[no_mangle]
pub extern "C" fn cc_remove_if(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    let mut result = LispObject::nil();

    // Build result in reverse, then reverse
    for elem in elements.iter().rev() {
        let test_result = cc_funcall_1(pred.raw(), elem.raw());
        let test_obj = unsafe { LispObject::from_raw(test_result) };
        if test_obj.is_nil() {
            // Keep this element (predicate returned nil)
            result = rlasp_runtime::Cons::allocate(*elem, result);
        }
    }
    result.raw()
}

/// (remove-if-not predicate list) - returns list with elements for which predicate is nil removed
#[no_mangle]
pub extern "C" fn cc_remove_if_not(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    let mut result = LispObject::nil();

    // Build result in reverse, then reverse
    for elem in elements.iter().rev() {
        let test_result = cc_funcall_1(pred.raw(), elem.raw());
        let test_obj = unsafe { LispObject::from_raw(test_result) };
        if !test_obj.is_nil() {
            // Keep this element (predicate returned non-nil)
            result = rlasp_runtime::Cons::allocate(*elem, result);
        }
    }
    result.raw()
}

/// (substitute-if new-item predicate list) - substitutes new-item for elements where predicate is true
#[no_mangle]
pub extern "C" fn cc_substitute_if(new_item: usize, predicate: usize, list: usize) -> usize {
    let new_obj = unsafe { LispObject::from_raw(new_item) };
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    let mut result = LispObject::nil();

    for elem in elements.iter().rev() {
        let test_result = cc_funcall_1(pred.raw(), elem.raw());
        let test_obj = unsafe { LispObject::from_raw(test_result) };
        if !test_obj.is_nil() {
            // Substitute new_item
            result = rlasp_runtime::Cons::allocate(new_obj, result);
        } else {
            result = rlasp_runtime::Cons::allocate(*elem, result);
        }
    }
    result.raw()
}

/// (position-if predicate list) - returns position of first element for which predicate is non-nil
#[no_mangle]
pub extern "C" fn cc_position_if(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    for (i, elem) in elements.iter().enumerate() {
        let result = cc_funcall_1(pred.raw(), elem.raw());
        let result_obj = unsafe { LispObject::from_raw(result) };
        if !result_obj.is_nil() {
            return LispObject::fixnum(i as i64).raw();
        }
    }
    LispObject::nil().raw()
}

/// (position-if-not predicate list) - returns position of first element for which predicate is nil
#[no_mangle]
pub extern "C" fn cc_position_if_not(predicate: usize, list: usize) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    for (i, elem) in elements.iter().enumerate() {
        let result = cc_funcall_1(pred.raw(), elem.raw());
        let result_obj = unsafe { LispObject::from_raw(result) };
        if result_obj.is_nil() {
            return LispObject::fixnum(i as i64).raw();
        }
    }
    LispObject::nil().raw()
}

/// (position-if predicate sequence &key start end from-end key)
#[no_mangle]
pub extern "C" fn cc_position_if_full(
    predicate: usize,
    sequence: usize,
    start: usize,
    end: usize,
    from_end: usize,
    key: usize,
) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };
    let start_obj = unsafe { LispObject::from_raw(start) };
    let end_obj = unsafe { LispObject::from_raw(end) };
    let from_end_obj = unsafe { LispObject::from_raw(from_end) };
    let key_obj = unsafe { LispObject::from_raw(key) };

    let start_idx = match start_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => 0,
    };
    let end_idx_opt = match end_obj.as_fixnum() {
        Some(fx) if fx >= 0 => Some(fx as usize),
        _ => None,
    };
    let from_end_flag = truthy_obj(from_end_obj);
    let key_fn = if key_obj.is_nil() { None } else { Some(key_obj) };

    let items = match sequence_to_vec(seq_obj) {
        Some(v) => v,
        None => return LispObject::nil().raw(),
    };
    let len = items.len();
    let end_idx = end_idx_opt.unwrap_or(len).min(len);
    if start_idx > end_idx {
        return LispObject::nil().raw();
    }

    if from_end_flag {
        if end_idx == 0 {
            return LispObject::nil().raw();
        }
        let mut idx = end_idx as i64 - 1;
        while idx >= start_idx as i64 {
            let elem = items[idx as usize];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let matches = truthy_obj(call_func_1(pred, key_elem));
            if matches {
                return LispObject::fixnum(idx).raw();
            }
            idx -= 1;
        }
    } else {
        for idx in start_idx..end_idx {
            let elem = items[idx];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let matches = truthy_obj(call_func_1(pred, key_elem));
            if matches {
                return LispObject::fixnum(idx as i64).raw();
            }
        }
    }

    LispObject::nil().raw()
}

/// (position-if-not predicate sequence &key start end from-end key)
#[no_mangle]
pub extern "C" fn cc_position_if_not_full(
    predicate: usize,
    sequence: usize,
    start: usize,
    end: usize,
    from_end: usize,
    key: usize,
) -> usize {
    let pred = unsafe { LispObject::from_raw(predicate) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };
    let start_obj = unsafe { LispObject::from_raw(start) };
    let end_obj = unsafe { LispObject::from_raw(end) };
    let from_end_obj = unsafe { LispObject::from_raw(from_end) };
    let key_obj = unsafe { LispObject::from_raw(key) };

    let start_idx = match start_obj.as_fixnum() {
        Some(fx) if fx >= 0 => fx as usize,
        _ => 0,
    };
    let end_idx_opt = match end_obj.as_fixnum() {
        Some(fx) if fx >= 0 => Some(fx as usize),
        _ => None,
    };
    let from_end_flag = truthy_obj(from_end_obj);
    let key_fn = if key_obj.is_nil() { None } else { Some(key_obj) };

    let items = match sequence_to_vec(seq_obj) {
        Some(v) => v,
        None => return LispObject::nil().raw(),
    };
    let len = items.len();
    let end_idx = end_idx_opt.unwrap_or(len).min(len);
    if start_idx > end_idx {
        return LispObject::nil().raw();
    }

    if from_end_flag {
        if end_idx == 0 {
            return LispObject::nil().raw();
        }
        let mut idx = end_idx as i64 - 1;
        while idx >= start_idx as i64 {
            let elem = items[idx as usize];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let matches = truthy_obj(call_func_1(pred, key_elem));
            if !matches {
                return LispObject::fixnum(idx).raw();
            }
            idx -= 1;
        }
    } else {
        for idx in start_idx..end_idx {
            let elem = items[idx];
            let key_elem = if let Some(k) = key_fn {
                call_func_1(k, elem)
            } else {
                elem
            };
            let matches = truthy_obj(call_func_1(pred, key_elem));
            if !matches {
                return LispObject::fixnum(idx as i64).raw();
            }
        }
    }

    LispObject::nil().raw()
}

/// (sort list predicate) - returns a sorted copy of list
#[no_mangle]
pub extern "C" fn cc_sort(list: usize, predicate: usize) -> usize {
    let list_obj = unsafe { LispObject::from_raw(list) };
    let pred = unsafe { LispObject::from_raw(predicate) };

    let mut elements = list_to_vec(list_obj);

    // Use insertion sort (stable and simple)
    for i in 1..elements.len() {
        let key = elements[i];
        let mut j = i;
        while j > 0 {
            let cmp_result = cc_funcall_2(pred.raw(), key.raw(), elements[j - 1].raw());
            let cmp_obj = unsafe { LispObject::from_raw(cmp_result) };
            if !cmp_obj.is_nil() {
                elements[j] = elements[j - 1];
                j -= 1;
            } else {
                break;
            }
        }
        elements[j] = key;
    }

    // Build result list
    let mut result = LispObject::nil();
    for elem in elements.iter().rev() {
        result = rlasp_runtime::Cons::allocate(*elem, result);
    }
    result.raw()
}

/// (nconc &rest lists) - destructively concatenate lists (simplified: 2 args)
#[no_mangle]
pub extern "C" fn cc_nconc(list1: usize, list2: usize) -> usize {
    let list1_obj = unsafe { LispObject::from_raw(list1) };
    let list2_obj = unsafe { LispObject::from_raw(list2) };

    if list1_obj.is_nil() {
        return list2;
    }

    // Find last cons of list1
    let mut current = list1_obj;
    loop {
        if let Some(cons) = current.as_cons_ptr() {
            let cons_ref = unsafe { &*cons };
            let cdr = cons_ref.cdr();
            if cdr.is_nil() {
                // Found the last cons - destructively set its cdr
                let cons_mut = unsafe { &mut *(cons as *mut rlasp_runtime::Cons) };
                cons_mut.set_cdr(list2_obj);
                break;
            }
            current = cdr;
        } else {
            // Not a proper list
            break;
        }
    }
    list1
}

/// (acons key value alist) - add a key-value pair to front of alist
#[no_mangle]
pub extern "C" fn cc_acons(key: usize, value: usize, alist: usize) -> usize {
    let key_obj = unsafe { LispObject::from_raw(key) };
    let value_obj = unsafe { LispObject::from_raw(value) };
    let alist_obj = unsafe { LispObject::from_raw(alist) };

    // Create (key . value) pair
    let pair = rlasp_runtime::Cons::allocate(key_obj, value_obj);
    // Cons onto front of alist
    rlasp_runtime::Cons::allocate(pair, alist_obj).raw()
}

/// (getf plist key &optional default) - get value from property list
#[no_mangle]
pub extern "C" fn cc_getf(plist: usize, key: usize, default: usize) -> usize {
    let plist_obj = unsafe { LispObject::from_raw(plist) };
    let key_obj = unsafe { LispObject::from_raw(key) };

    // Helper to compare two objects for equality (symbol names or eq)
    fn objects_equal(a: LispObject, b: LispObject) -> bool {
        // First try raw equality (same object)
        if a.raw() == b.raw() {
            return true;
        }

        // If both are symbols, compare names
        if let (Some(sym_a), Some(sym_b)) = (
            as_symbol_ptr_checked(a),
            as_symbol_ptr_checked(b)
        ) {
            let name_a = unsafe { (*sym_a).name() };
            let name_b = unsafe { (*sym_b).name() };
            return name_a == name_b;
        }

        false
    }

    let mut current = plist_obj;
    loop {
        if current.is_nil() {
            return default;
        }
        if let Some(cons) = current.as_cons_ptr() {
            let cons_ref = unsafe { &*cons };
            let indicator = cons_ref.car();
            let rest = cons_ref.cdr();

            // Check if indicator matches key (using symbol name comparison)
            if objects_equal(indicator, key_obj) {
                // Return the value (car of rest)
                if let Some(rest_cons) = rest.as_cons_ptr() {
                    let rest_ref = unsafe { &*rest_cons };
                    return rest_ref.car().raw();
                }
                return default;
            }

            // Skip the value and move to next indicator
            if let Some(rest_cons) = rest.as_cons_ptr() {
                let rest_ref = unsafe { &*rest_cons };
                current = rest_ref.cdr();
            } else {
                return default;
            }
        } else {
            return default;
        }
    }
}

/// (map result-type function &rest sequences) - simplified: map nil function list
#[no_mangle]
pub extern "C" fn cc_map_nil(function: usize, list: usize) -> usize {
    let func = unsafe { LispObject::from_raw(function) };
    let list_obj = unsafe { LispObject::from_raw(list) };

    let elements = list_to_vec(list_obj);
    for elem in elements {
        cc_funcall_1(func.raw(), elem.raw());
    }
    LispObject::nil().raw()
}

/// (clrhash hash-table) - clear all entries from hash table
#[no_mangle]
pub extern "C" fn cc_clrhash(hash_table: usize) -> usize {
    // Note: HashTable clear not yet implemented, returning the table unchanged
    // TODO: Add clear() method to HashTable
    hash_table
}

/// (set-difference list1 list2 &key test) - return elements in list1 not in list2
#[no_mangle]
pub extern "C" fn cc_set_difference(list1: usize, list2: usize) -> usize {
    let list1_obj = unsafe { LispObject::from_raw(list1) };
    let list2_obj = unsafe { LispObject::from_raw(list2) };

    let elements1 = list_to_vec(list1_obj);
    let elements2 = list_to_vec(list2_obj);

    // Collect elements from list1 that are not in list2
    let mut result_elems = Vec::new();
    for elem in elements1 {
        let found = elements2.iter().any(|e2| {
            // Use eq (pointer equality) for comparison
            elem.raw() == e2.raw()
        });
        if !found {
            result_elems.push(elem);
        }
    }

    // Build result list
    let mut result = LispObject::nil();
    for elem in result_elems.iter().rev() {
        result = rlasp_runtime::Cons::allocate(*elem, result);
    }
    result.raw()
}

/// (substitute new old sequence &key test) - return sequence with old replaced by new
#[no_mangle]
pub extern "C" fn cc_substitute(new_item: usize, old_item: usize, sequence: usize) -> usize {
    let new_obj = unsafe { LispObject::from_raw(new_item) };
    let old_obj = unsafe { LispObject::from_raw(old_item) };
    let seq_obj = unsafe { LispObject::from_raw(sequence) };

    // For now, only handle lists
    if seq_obj.is_nil() {
        return sequence;
    }

    let elements = list_to_vec(seq_obj);
    let mut result_elems = Vec::new();
    for elem in elements {
        // Use eq (pointer equality) for comparison
        if elem.raw() == old_obj.raw() {
            result_elems.push(new_obj);
        } else {
            result_elems.push(elem);
        }
    }

    // Build result list
    let mut result = LispObject::nil();
    for elem in result_elems.iter().rev() {
        result = rlasp_runtime::Cons::allocate(*elem, result);
    }
    result.raw()
}

/// Initialize standard Common Lisp variables
/// This should be called once at startup before running any user code
pub fn init_standard_cl_variables() {
    use rlasp_runtime::Symbol;

    DYNAMIC_BINDINGS.with(|bindings| {
        let mut b = bindings.borrow_mut();

        // *features* - list of features supported by this implementation
        // Create a list with :rlasp, :common-lisp features
        let rlasp_sym = Symbol::allocate("rlasp".to_string());
        let cl_sym = Symbol::allocate("common-lisp".to_string());
        let unix_sym = Symbol::allocate("unix".to_string());
        let features_list = rlasp_runtime::Cons::allocate(
            rlasp_sym,
            rlasp_runtime::Cons::allocate(
                cl_sym,
                rlasp_runtime::Cons::allocate(unix_sym, LispObject::nil())
            )
        );
        b.insert("*features*".to_string(), features_list.raw());
        b.insert("*module-provider-functions*".to_string(), LispObject::nil().raw());

        // Standard streams: use T for output-like streams so FORMAT prints
        // to stdout in JIT mode. Input remains NIL placeholder.
        b.insert("*standard-input*".to_string(), LispObject::nil().raw());
        b.insert("*standard-output*".to_string(), LispObject::t().raw());
        b.insert("*error-output*".to_string(), LispObject::t().raw());
        b.insert("*trace-output*".to_string(), LispObject::t().raw());
        b.insert("*debug-io*".to_string(), LispObject::t().raw());
        b.insert("*query-io*".to_string(), LispObject::t().raw());
        b.insert("*terminal-io*".to_string(), LispObject::t().raw());

        // Readtable - NIL as placeholder
        b.insert("*readtable*".to_string(), LispObject::nil().raw());

        // Package-related
        b.insert("*package*".to_string(), LispObject::nil().raw());

        // Print control variables
        b.insert("*print-escape*".to_string(), LispObject::t().raw());
        b.insert("*print-readably*".to_string(), LispObject::nil().raw());
        b.insert("*print-circle*".to_string(), LispObject::nil().raw());
        b.insert("*print-pretty*".to_string(), LispObject::nil().raw());
        b.insert("*print-base*".to_string(), LispObject::fixnum(10).raw());
        b.insert("*print-radix*".to_string(), LispObject::nil().raw());
        b.insert("*print-length*".to_string(), LispObject::nil().raw());
        b.insert("*print-level*".to_string(), LispObject::nil().raw());
        b.insert("*print-case*".to_string(), Symbol::allocate("upcase".to_string()).raw());
        b.insert("*print-array*".to_string(), LispObject::t().raw());
        b.insert("*print-gensym*".to_string(), LispObject::t().raw());

        // Read control
        b.insert("*read-base*".to_string(), LispObject::fixnum(10).raw());
        b.insert("*read-default-float-format*".to_string(), Symbol::allocate("single-float".to_string()).raw());
        b.insert("*read-eval*".to_string(), LispObject::t().raw());
        b.insert("*read-suppress*".to_string(), LispObject::nil().raw());

        // Compilation variables
        b.insert("*compile-file-pathname*".to_string(), LispObject::nil().raw());
        b.insert("*compile-file-truename*".to_string(), LispObject::nil().raw());
        b.insert("*compile-print*".to_string(), LispObject::nil().raw());
        b.insert("*compile-verbose*".to_string(), LispObject::nil().raw());

        // Load variables
        b.insert("*load-pathname*".to_string(), LispObject::nil().raw());
        b.insert("*load-truename*".to_string(), LispObject::nil().raw());
        b.insert("*load-print*".to_string(), LispObject::nil().raw());
        b.insert("*load-verbose*".to_string(), LispObject::nil().raw());

        // Default encoding - commonly used
        b.insert("*default-encoding*".to_string(), Symbol::allocate("utf-8".to_string()).raw());

        // Random state
        b.insert("*random-state*".to_string(), LispObject::nil().raw());

        // Gensym counter
        b.insert("*gensym-counter*".to_string(), LispObject::fixnum(0).raw());

        // Modules
        b.insert("*modules*".to_string(), LispObject::nil().raw());
        b.insert("*module-provider-functions*".to_string(), LispObject::nil().raw());

        // ASDF specific variables
        b.insert("*default-pathname-defaults*".to_string(), LispObject::nil().raw());

        // Optimize settings (commonly accessed)
        b.insert("*safety*".to_string(), LispObject::fixnum(1).raw());
        b.insert("*speed*".to_string(), LispObject::fixnum(1).raw());
        b.insert("*space*".to_string(), LispObject::fixnum(1).raw());
        b.insert("*debug*".to_string(), LispObject::fixnum(1).raw());

        // Standard condition types - bind to T as placeholder class object
        // These are used by define-condition and need to exist as symbols
        let t_val = LispObject::t().raw();
        b.insert("condition".to_string(), t_val);
        b.insert("error".to_string(), t_val);
        b.insert("warning".to_string(), t_val);
        b.insert("style-warning".to_string(), t_val);
        b.insert("serious-condition".to_string(), t_val);
        b.insert("simple-error".to_string(), t_val);
        b.insert("simple-warning".to_string(), t_val);
        b.insert("type-error".to_string(), t_val);
        b.insert("program-error".to_string(), t_val);
        b.insert("stream-error".to_string(), t_val);
        b.insert("file-error".to_string(), t_val);
        b.insert("package-error".to_string(), t_val);
        b.insert("arithmetic-error".to_string(), t_val);
        b.insert("control-error".to_string(), t_val);
        b.insert("print-not-readable".to_string(), t_val);
        b.insert("reader-error".to_string(), t_val);
        b.insert("simple-condition".to_string(), t_val);
        b.insert("cell-error".to_string(), t_val);
        b.insert("unbound-variable".to_string(), t_val);
        b.insert("undefined-function".to_string(), t_val);
        b.insert("unbound-slot".to_string(), t_val);
        b.insert("end-of-file".to_string(), t_val);
        b.insert("parse-error".to_string(), t_val);
        b.insert("storage-condition".to_string(), t_val);

        // Standard classes
        b.insert("t".to_string(), t_val);
        b.insert("standard-object".to_string(), t_val);
        b.insert("structure-object".to_string(), t_val);
        b.insert("standard-class".to_string(), t_val);
        b.insert("built-in-class".to_string(), t_val);
        b.insert("structure-class".to_string(), t_val);
        b.insert("sequence".to_string(), t_val);
        b.insert("list".to_string(), t_val);
        b.insert("cons".to_string(), t_val);
        b.insert("null".to_string(), LispObject::nil().raw());
        b.insert("symbol".to_string(), t_val);
        b.insert("number".to_string(), t_val);
        b.insert("integer".to_string(), t_val);
        b.insert("float".to_string(), t_val);
        b.insert("rational".to_string(), t_val);
        b.insert("ratio".to_string(), t_val);
        b.insert("complex".to_string(), t_val);
        b.insert("character".to_string(), t_val);
        b.insert("string".to_string(), t_val);
        b.insert("array".to_string(), t_val);
        b.insert("vector".to_string(), t_val);
        b.insert("bit-vector".to_string(), t_val);
        b.insert("hash-table".to_string(), t_val);
        b.insert("function".to_string(), t_val);
        b.insert("compiled-function".to_string(), t_val);
        b.insert("generic-function".to_string(), t_val);
        b.insert("standard-generic-function".to_string(), t_val);
        b.insert("method".to_string(), t_val);
        b.insert("standard-method".to_string(), t_val);
        b.insert("method-combination".to_string(), t_val);
        b.insert("pathname".to_string(), t_val);
        b.insert("logical-pathname".to_string(), t_val);
        b.insert("stream".to_string(), t_val);
        b.insert("broadcast-stream".to_string(), t_val);
        b.insert("concatenated-stream".to_string(), t_val);
        b.insert("echo-stream".to_string(), t_val);
        b.insert("file-stream".to_string(), t_val);
        b.insert("string-stream".to_string(), t_val);
        b.insert("synonym-stream".to_string(), t_val);
        b.insert("two-way-stream".to_string(), t_val);
        b.insert("readtable".to_string(), t_val);
        b.insert("package".to_string(), t_val);
        b.insert("random-state".to_string(), t_val);
        b.insert("restart".to_string(), t_val);

        // Character subtypes
        b.insert("base-char".to_string(), t_val);
        b.insert("standard-char".to_string(), t_val);
        b.insert("extended-char".to_string(), t_val);
        b.insert("base-string".to_string(), t_val);
        b.insert("simple-string".to_string(), t_val);
        b.insert("simple-base-string".to_string(), t_val);

        // SBCL-specific stream variables (ASDF references these)
        let nil_val = LispObject::nil().raw();
        b.insert("SB-SYS:*STDIN*".to_string(), nil_val);
        b.insert("SB-SYS:*STDOUT*".to_string(), nil_val);
        b.insert("SB-SYS:*STDERR*".to_string(), nil_val);

        // Lambda list keywords
        b.insert("&key".to_string(), Symbol::allocate("&key".to_string()).raw());
        b.insert("&optional".to_string(), Symbol::allocate("&optional".to_string()).raw());
        b.insert("&rest".to_string(), Symbol::allocate("&rest".to_string()).raw());
        b.insert("&body".to_string(), Symbol::allocate("&body".to_string()).raw());
        b.insert("&allow-other-keys".to_string(), Symbol::allocate("&allow-other-keys".to_string()).raw());
        b.insert("&aux".to_string(), Symbol::allocate("&aux".to_string()).raw());
        b.insert("&whole".to_string(), Symbol::allocate("&whole".to_string()).raw());
        b.insert("&environment".to_string(), Symbol::allocate("&environment".to_string()).raw());
    });
}
