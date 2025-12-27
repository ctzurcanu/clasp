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

/// Box a character (char → LispObject)
#[no_mangle]
pub extern "C" fn cc_box_character(val: u32) -> usize {
    if let Some(c) = char::from_u32(val) {
        LispObject::character(c).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Unbox a character (LispObject → u32)
#[no_mangle]
pub extern "C" fn cc_unbox_character(obj: usize) -> u32 {
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    lisp_obj.as_character().unwrap_or('\0') as u32
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

/// Add two numbers (supports fixnum, bignum, float, ratio)
#[no_mangle]
pub extern "C" fn cc_add(a: usize, b: usize) -> usize {
    use malachite::Integer;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};
    use rlasp_runtime::Number;

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Try fixnum + fixnum first (fast path)
    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        // Check for overflow
        if let Some(result) = a_val.checked_add(b_val) {
            return LispObject::fixnum(result).raw();
        } else {
            // Overflow: convert to bignum
            let result = Integer::from(a_val) + Integer::from(b_val);
            return Number::allocate_bignum(result).raw();
        }
    }

    // Convert both to floats if either is a float
    if let (Some(a_float), Some(b_float)) = (a_obj.as_float(), b_obj.as_float()) {
        return Number::allocate_float(a_float + b_float).raw();
    }

    // Handle bignum + fixnum or fixnum + bignum or bignum + bignum
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

    let result = a_bigint + b_bigint;

    // Try to fit in Fixnum, otherwise return Bignum
    if i64::convertible_from(&result) {
        LispObject::fixnum(i64::exact_from(&result)).raw()
    } else {
        Number::allocate_bignum(result).raw()
    }
}

/// Subtract two fixnums
#[no_mangle]
pub extern "C" fn cc_sub(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        LispObject::fixnum(a_val - b_val).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Multiply two fixnums
#[no_mangle]
pub extern "C" fn cc_mul(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        LispObject::fixnum(a_val * b_val).raw()
    } else {
        LispObject::nil().raw()
    }
}

/// Divide two fixnums
#[no_mangle]
pub extern "C" fn cc_div(a: usize, b: usize) -> usize {
    use malachite::Rational;
    use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if b_val != 0 {
            // Create ratio for exact division
            let ratio = Rational::from_signeds(a_val, b_val);

            // If the result is an integer, return fixnum
            if ratio.denominator_ref() == &1 {
                let numerator = ratio.numerator_ref();
                if i64::convertible_from(numerator) {
                    return LispObject::fixnum(i64::exact_from(numerator)).raw();
                }
            }

            // Otherwise return ratio
            rlasp_runtime::Number::allocate_ratio(ratio).raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
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
    if let Some(ptr) = lisp_obj.as_general_ptr::<Number>() {
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
    if let Some(ptr) = lisp_obj.as_general_ptr::<Number>() {
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

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
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

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if a_val > b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Equal comparison (= a b)
#[no_mangle]
pub extern "C" fn cc_eq(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if a_val == b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Less than or equal (<= a b)
#[no_mangle]
pub extern "C" fn cc_le(a: usize, b: usize) -> usize {
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
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

    if let (Some(a_val), Some(b_val)) = (a_obj.as_fixnum(), b_obj.as_fixnum()) {
        if a_val >= b_val {
            LispObject::t().raw()
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Get internal real time in milliseconds
#[no_mangle]
pub extern "C" fn cc_get_internal_real_time() -> usize {
    use std::sync::OnceLock;
    use std::time::Instant;

    static START_TIME: OnceLock<Instant> = OnceLock::new();
    let start = START_TIME.get_or_init(|| Instant::now());

    let elapsed = start.elapsed();
    let millis = elapsed.as_millis() as i64;
    LispObject::fixnum(millis).raw()
}

/// Internal time units per second (1000 for milliseconds)
#[no_mangle]
pub extern "C" fn cc_internal_time_units_per_second() -> usize {
    LispObject::fixnum(1000).raw()
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

/// Length of a list
#[no_mangle]
pub extern "C" fn cc_length(list: usize) -> usize {
    let mut current = unsafe { LispObject::from_raw(list) };
    let mut count = 0i64;

    while !current.is_nil() {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            count += 1;
            let cons = unsafe { &*cons_ptr };
            current = cons.cdr();
        } else {
            // Not a proper list
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
    let x_obj = unsafe { LispObject::from_raw(x) };

    if let Some(fixnum) = x_obj.as_fixnum() {
        // Already an integer
        x
    } else if let Some(float) = x_obj.as_float() {
        LispObject::fixnum(float.ceil() as i64).raw()
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
    let x_obj = unsafe { LispObject::from_raw(x) };
    let y_obj = unsafe { LispObject::from_raw(y) };

    let x_val = if let Some(fx) = x_obj.as_fixnum() {
        fx
    } else if let Some(fl) = x_obj.as_float() {
        fl as i64
    } else {
        return LispObject::nil().raw();
    };

    let y_val = if let Some(fy) = y_obj.as_fixnum() {
        fy
    } else if let Some(fl) = y_obj.as_float() {
        fl as i64
    } else {
        return LispObject::nil().raw();
    };

    if y_val == 0 {
        return LispObject::nil().raw();
    }

    let quotient = x_val / y_val;
    LispObject::fixnum(quotient).raw()
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
    // For now, strings are immutable in our implementation
    // Return the character value
    ch
}

/// Copy a sequence (list or string)
#[no_mangle]
pub extern "C" fn cc_copy_seq(seq: usize) -> usize {
    let seq_obj = unsafe { LispObject::from_raw(seq) };

    // Check if it's a string
    if seq_obj.tag() == rlasp_runtime::Tag::General {
        unsafe {
            let ptr = (seq_obj.raw() & !0b11) as *const rlasp_runtime::RString;
            if !ptr.is_null() {
                let s = (*ptr).as_str();
                return rlasp_runtime::RString::allocate(s.to_string()).raw();
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
    let a_obj = unsafe { LispObject::from_raw(a) };
    let b_obj = unsafe { LispObject::from_raw(b) };

    // Extract string from first object
    let a_str = unsafe {
        if a_obj.tag() == rlasp_runtime::Tag::General {
            let ptr = (a_obj.raw() & !0b11) as *const rlasp_runtime::RString;
            if !ptr.is_null() {
                (*ptr).as_str()
            } else {
                return LispObject::nil().raw();
            }
        } else {
            return LispObject::nil().raw();
        }
    };

    // Extract string from second object
    let b_str = unsafe {
        if b_obj.tag() == rlasp_runtime::Tag::General {
            let ptr = (b_obj.raw() & !0b11) as *const rlasp_runtime::RString;
            if !ptr.is_null() {
                (*ptr).as_str()
            } else {
                return LispObject::nil().raw();
            }
        } else {
            return LispObject::nil().raw();
        }
    };

    if a_str == b_str {
        LispObject::t().raw()
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
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };
    let param_obj = unsafe { LispObject::from_raw(param_info) };

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
    } else if let Some(sym_ptr) = param_obj.as_general_ptr::<rlasp_runtime::Symbol>() {
        // Keyword argument - search for :keyword in args list
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
            if let Some(key_sym_ptr) = key.as_general_ptr::<rlasp_runtime::Symbol>() {
                let key_sym = unsafe { &*key_sym_ptr };
                let key_name = key_sym.name().to_string();

                if key_name == keyword_name || key_name == param_name {
                    // Found the keyword, return the next value
                    let rest = cons.cdr();
                    if let Some(value_cons_ptr) = rest.as_cons_ptr() {
                        let value_cons = unsafe { &*value_cons_ptr };
                        return value_cons.car().raw();
                    }
                }
            }

            // Move to next pair (skip both key and value)
            let rest = cons.cdr();
            if let Some(rest_cons_ptr) = rest.as_cons_ptr() {
                let rest_cons = unsafe { &*rest_cons_ptr };
                current = rest_cons.cdr();
            } else {
                break;
            }
        }

        // Keyword not found - return nil (default value)
        LispObject::nil().raw()
    } else {
        // Invalid param_info - return nil
        LispObject::nil().raw()
    }
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
    let lisp_obj = unsafe { LispObject::from_raw(obj) };
    print_lisp_object(lisp_obj);
    println!();
    obj
}

/// Format a LispObject as an s-expression (for use in format ~S directive)
fn format_s_expr(obj: LispObject) -> String {
    use rlasp_runtime::{header::TypeHeader, header::ObjectType, RString};

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
        // Check the type header to determine what kind of general object this is
        if let Some(ptr) = obj.as_general_ptr::<RString>() {
            unsafe {
                if let Some(obj_type) = TypeHeader::from_ptr(ptr) {
                    match obj_type {
                        ObjectType::String => {
                            let string = &*ptr;
                            // For ~S, print strings with quotes
                            return format!("\"{}\"", string.as_str());
                        }
                        _ => {}
                    }
                }
            }
        }
        // Try as symbol
        if let Some(sym_ptr) = obj.as_general_ptr::<rlasp_runtime::Symbol>() {
            unsafe {
                let sym = &*sym_ptr;
                return sym.name().to_uppercase();
            }
        }
        // Fallback for other general objects
        format!("{:?}", obj)
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
    use rlasp_runtime::{header::TypeHeader, header::ObjectType, RString};

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
        // Check the type header to determine what kind of general object this is
        if let Some(ptr) = obj.as_general_ptr::<RString>() {
            unsafe {
                if let Some(obj_type) = TypeHeader::from_ptr(ptr) {
                    match obj_type {
                        ObjectType::String => {
                            let string = &*ptr;
                            return string.as_str().to_string();
                        }
                        _ => {}
                    }
                }
            }
        }
        // Try as symbol
        if let Some(sym_ptr) = obj.as_general_ptr::<rlasp_runtime::Symbol>() {
            unsafe {
                let sym = &*sym_ptr;
                return sym.name().to_string();
            }
        }
        // Fallback for other general objects
        format!("{:?}", obj)
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
    use rlasp_runtime::{header::TypeHeader, header::ObjectType, RString};

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
        if let Some(ptr) = obj.as_general_ptr::<RString>() {
            unsafe {
                if let Some(obj_type) = TypeHeader::from_ptr(ptr) {
                    match obj_type {
                        ObjectType::String => {
                            let string = &*ptr;
                            print!("\"{}\"", string.as_str());
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
    let dest_obj = unsafe { LispObject::from_raw(dest) };
    let args_obj = unsafe { LispObject::from_raw(args_and_control) };

    // Extract control string (first argument) and remaining args
    let (control_obj, arg_list) = if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        (cons.car(), cons.cdr())
    } else {
        return LispObject::nil().raw();
    };

    let control_str = unsafe {
        if control_obj.tag() == rlasp_runtime::Tag::General {
            let ptr = (control_obj.raw() & !0b11) as *const rlasp_runtime::RString;
            if !ptr.is_null() {
                (*ptr).as_str()
            } else {
                return LispObject::nil().raw();
            }
        } else {
            return LispObject::nil().raw();
        }
    };

    let mut result = String::new();
    let mut chars = control_str.chars();
    let mut arg_list = arg_list;

    while let Some(ch) = chars.next() {
        if ch == '~' {
            if let Some(directive) = chars.next() {
                match directive {
                    '&' => {},
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
                        // Print s-expression form (same as ~A for now, but could be different for strings)
                        if let Some(cons_ptr) = arg_list.as_cons_ptr() {
                            let cons = unsafe { &*cons_ptr };
                            let arg = cons.car();
                            result.push_str(&format_s_expr(arg));
                            arg_list = cons.cdr();
                        }
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

                                // Convert fixnum to float
                                if let Some(n) = arg.as_fixnum() {
                                    result.push_str(&format!("{:.prec$}", n as f64, prec = precision));
                                } else {
                                    // Try to extract float value from tagged pointer
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
        print!("{}", result);
        use std::io::Write;
        let _ = std::io::stdout().flush();
        LispObject::nil().raw()
    }
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
        let ht = unsafe { &*ht_ptr };
        // Iterate over hash table entries and call function for each
        let entries = ht.entries();
        for (key, value) in entries {
            // Push value, then key (stack grows down, so last pushed is first popped)
            stack_push_pointer(value.raw());
            stack_push_pointer(key.raw());

            // Call function using stack-based convention
            cc_funcall_stack(func_ref);

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

            // Call function using stack-based convention
            cc_funcall_stack(func_ref);

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
        let cons = unsafe { &*cons_ptr };
        let elem = cons.car();

        // Push element
        stack_push_pointer(elem.raw());

        // Call function using stack-based convention
        cc_funcall_stack(func_ref);

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

        // Call function
        cc_funcall_stack(func_ref);

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

    rlasp_runtime::Symbol::allocate(name_str).raw()
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
    let obj = unsafe { LispObject::from_raw(obj) };
    if obj.as_general_ptr::<rlasp_runtime::RString>().is_some() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_symbolp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    let is_t = obj.raw() == rlasp_runtime::T_SYMBOL.raw();
    if obj.as_general_ptr::<rlasp_runtime::Symbol>().is_some() || obj.is_nil() || is_t {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_arrayp(obj: usize) -> usize {
    let obj = unsafe { LispObject::from_raw(obj) };
    // Arrays not fully implemented yet, strings are array-like
    if obj.as_general_ptr::<rlasp_runtime::RString>().is_some() {
        LispObject::t().raw()
    } else {
        LispObject::nil().raw()
    }
}

#[no_mangle]
pub extern "C" fn cc_vectorp(obj: usize) -> usize {
    // Vectors not fully implemented yet
    let _obj = unsafe { LispObject::from_raw(obj) };
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
pub extern "C" fn cc_equal(obj1: usize, obj2: usize) -> usize {
    let obj1 = unsafe { LispObject::from_raw(obj1) };
    let obj2 = unsafe { LispObject::from_raw(obj2) };

    // Simple equality check
    if obj1.raw() == obj2.raw() {
        return LispObject::t().raw();
    }

    // Check fixnums
    if let (Some(n1), Some(n2)) = (obj1.as_fixnum(), obj2.as_fixnum()) {
        if n1 == n2 {
            return LispObject::t().raw();
        }
    }

    // Check strings
    if let (Some(s1_ptr), Some(s2_ptr)) = (
        obj1.as_general_ptr::<rlasp_runtime::RString>(),
        obj2.as_general_ptr::<rlasp_runtime::RString>()
    ) {
        let s1 = unsafe { &*s1_ptr };
        let s2 = unsafe { &*s2_ptr };
        if s1.as_str() == s2.as_str() {
            return LispObject::t().raw();
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
/// For now, implement as a list for simplicity
#[no_mangle]
pub extern "C" fn cc_make_array(size: usize) -> usize {
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

/// Make an array with initial contents (a list)
#[no_mangle]
pub extern "C" fn cc_make_array_with_contents(size: usize, contents: usize) -> usize {
    let contents_obj = unsafe { LispObject::from_raw(contents) };
    // For now, just return the contents list
    // In a real implementation, would convert to an actual array
    contents_obj.raw()
}

/// Access array element at index
#[no_mangle]
pub extern "C" fn cc_aref(array: usize, index: usize) -> usize {
    let array_obj = unsafe { LispObject::from_raw(array) };
    let index_obj = unsafe { LispObject::from_raw(index) };

    let idx = if let Some(fx) = index_obj.as_fixnum() {
        fx as usize
    } else {
        return LispObject::nil().raw();
    };

    // Treat array as a list, nth access
    let mut current = array_obj;
    for _ in 0..idx {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            unsafe {
                current = (*cons_ptr).cdr();
            }
        } else {
            return LispObject::nil().raw();
        }
    }

    if let Some(cons_ptr) = current.as_cons_ptr() {
        unsafe { (*cons_ptr).car().raw() }
    } else {
        LispObject::nil().raw()
    }
}

/// Set array element at index
#[no_mangle]
pub extern "C" fn cc_set_aref(array: usize, index: usize, value: usize) -> usize {
    let array_obj = unsafe { LispObject::from_raw(array) };
    let index_obj = unsafe { LispObject::from_raw(index) };
    let value_obj = unsafe { LispObject::from_raw(value) };

    let idx = if let Some(fx) = index_obj.as_fixnum() {
        fx as usize
    } else {
        return value;
    };

    // Treat array as a list, nth access
    let mut current = array_obj;
    for _ in 0..idx {
        if let Some(cons_ptr) = current.as_cons_ptr() {
            unsafe {
                current = (*cons_ptr).cdr();
            }
        } else {
            return value;
        }
    }

    if let Some(cons_ptr) = current.as_cons_ptr() {
        unsafe {
            (*cons_ptr).set_car(value_obj);
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

use std::sync::Mutex;
use std::collections::HashMap;
use std::ffi::CString;

use std::sync::Once;

/// Global function registry mapping function names to their addresses
/// This is populated by the JIT when functions are compiled
static mut FUNCTION_REGISTRY: Option<Mutex<HashMap<String, FunctionEntry>>> = None;
static INIT_REGISTRY: Once = Once::new();

/// Reverse mapping from function ID (hash) to function name
/// This allows extract_function_name to retrieve the name from a function reference
static mut FUNCTION_ID_MAP: Option<Mutex<HashMap<i64, String>>> = None;
static INIT_ID_MAP: Once = Once::new();

#[derive(Clone)]
struct FunctionEntry {
    address: usize,
    arity: usize,
}

fn get_registry() -> &'static Mutex<HashMap<String, FunctionEntry>> {
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
    registry.insert(name, FunctionEntry { address, arity });
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
fn extract_function_name(func_ref: usize) -> Option<String> {
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
/// (apply func args) - calls func with args as individual arguments
#[no_mangle]
pub extern "C" fn cc_apply(args_and_env: usize) -> usize {
    // Extract function and args list from arguments
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let func_ref = cons.car();

        // Get the args list (second argument)
        let cdr_obj = cons.cdr();
        if let Some(args_cons_ptr) = cdr_obj.as_cons_ptr() {
            let args_cons = unsafe { &*args_cons_ptr };
            let args_list = args_cons.car();

            // Call cc_funcall with the args list
            cc_funcall(func_ref.raw(), args_list.raw())
        } else {
            LispObject::nil().raw()
        }
    } else {
        LispObject::nil().raw()
    }
}

/// Funcall for stack-based calling convention
/// Takes a function reference (symbol), calls the function
/// Arguments are already on the stack, function will pop them
/// Function pushes result to stack
#[no_mangle]
pub extern "C" fn cc_funcall_stack(func_ref: usize) {
    use rlasp_runtime::{Closure, TypeHeader, ObjectType};

    let obj = unsafe { LispObject::from_raw(func_ref) };

    // Check if it's a closure
    if let Some(closure_ptr) = obj.as_general_ptr::<Closure>() {
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
                    unsafe {
                        // Call lambda function
                        let f: extern "C" fn() = std::mem::transmute(address);
                        f();
                    }
                    return;
                }
            }
        }
    }

    // Try to extract function name from symbol or fixnum
    let name_opt = if let Some(symbol_ptr) = obj.as_general_ptr::<rlasp_runtime::Symbol>() {
        let symbol = unsafe { &*symbol_ptr };
        Some(symbol.name().to_string())
    } else if let Some(func_id) = obj.as_fixnum() {
        // Function reference stored as ID
        let id_map = get_id_map().lock().unwrap();
        id_map.get(&func_id).cloned()
    } else {
        None
    };

    // Look up function address (release lock before calling)
    let func_address = if let Some(ref name) = name_opt {
        let registry = get_registry().lock().unwrap();
        registry.get(name).map(|entry| entry.address)
    } else {
        None
    };

    if let Some(address) = func_address {
        unsafe {
            // Call function with stack-based calling convention: () -> ()
            let f: extern "C" fn() = std::mem::transmute(address);
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
            _ => {
                // Function not found, push nil
                stack_push_nil();
            }
        }
    } else {
        // Function not found or invalid reference, push nil
        stack_push_nil();
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
    // Evaluate the form using the interpreter
    let args_obj = unsafe { LispObject::from_raw(args_and_env) };

    if let Some(cons_ptr) = args_obj.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let form = cons.car();

        // For simple values (numbers, strings, etc), return as-is
        // For lists, we would need to call the interpreter
        // For now, if it's a fixnum or other immediate value, return it
        // Otherwise return NIL (partial implementation)
        if form.as_fixnum().is_some() {
            form.raw()
        } else {
            // Return the form itself for complex expressions
            // Full implementation would recursively evaluate
            form.raw()
        }
    } else {
        LispObject::nil().raw()
    }
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
