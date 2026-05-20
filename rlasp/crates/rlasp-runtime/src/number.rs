//! Numeric tower implementation
//!
//! Common Lisp requires a complete numeric tower:
//! - Fixnum (immediate in LispObject)
//! - Bignum (arbitrary precision integer)
//! - Ratio (exact rational)
//! - Float (double precision)
//! - Complex (complex numbers)
//!
//! Using Malachite for high-performance numerics

use crate::object::LispObject;
use malachite::Integer;
use malachite::Rational;
use num_complex::Complex;
use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::OnceLock;

static BIGNUM_ALLOC_COUNT: AtomicUsize = AtomicUsize::new(0);
static BIGNUM_COLLECT_EVERY: OnceLock<usize> = OnceLock::new();

fn bignum_collect_every() -> usize {
    *BIGNUM_COLLECT_EVERY.get_or_init(|| {
        std::env::var("RLASP_GC_COLLECT_EVERY_BIGNUM")
            .ok()
            .and_then(|s| s.trim().parse::<usize>().ok())
            .filter(|v| *v > 0)
            .unwrap_or(2048)
    })
}

fn maybe_collect_after_bignum_alloc() {
    let every = bignum_collect_every();
    if every == 0 {
        return;
    }
    let n = BIGNUM_ALLOC_COUNT.fetch_add(1, Ordering::Relaxed) + 1;
    if n % every == 0 {
        if crate::gc::is_gc_initialized() {
            crate::gc::global_gc().collect();
        }
    }
}

/// Number variants (heap-allocated)
#[derive(Debug, Clone)]
pub enum NumberValue {
    /// Arbitrary precision integer (using Malachite)
    Bignum(Integer),

    /// Exact rational (numerator/denominator, using Malachite)
    Ratio(Rational),

    /// Double-precision float
    Float(f64),

    /// Complex number
    Complex(Complex<f64>),
}

/// Floating-point format metadata.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FloatFormat {
    Single,
    Double,
}

/// Number with type header
#[repr(C)]
pub struct Number {
    /// Type header (MUST be first field)
    header: crate::header::TypeHeader,

    /// The actual number value
    pub value: NumberValue,

    /// Floating-point format metadata for `NumberValue::Float`.
    pub float_format: FloatFormat,
}

impl Number {
    fn new(value: NumberValue, float_format: FloatFormat) -> Self {
        Number {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::Number),
            value,
            float_format,
        }
    }

    #[inline]
    unsafe fn allocate_number(value: NumberValue, float_format: FloatFormat) -> *mut Number {
        let ptr = crate::gc::gc_allocate_value(Number::new(value, float_format)).as_ptr();
        #[cfg(feature = "boehm-gc")]
        {
            crate::gc::gc_register_drop_finalizer(ptr);
        }
        ptr
    }

    /// Allocate a bignum and return LispObject
    pub fn allocate_bignum(n: Integer) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Bignum(n), FloatFormat::Double) };
        maybe_collect_after_bignum_alloc();
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a ratio and return LispObject
    pub fn allocate_ratio(r: Rational) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Ratio(r), FloatFormat::Double) };
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a double-float and return LispObject.
    pub fn allocate_float(f: f64) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Float(f), FloatFormat::Double) };
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a single-float (stored as f64 value with single precision rounding).
    pub fn allocate_single_float(f: f64) -> LispObject {
        let rounded = (f as f32) as f64;
        let ptr =
            unsafe { Self::allocate_number(NumberValue::Float(rounded), FloatFormat::Single) };
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a float with an explicit format.
    pub fn allocate_float_with_format(f: f64, format: FloatFormat) -> LispObject {
        match format {
            FloatFormat::Single => Self::allocate_single_float(f),
            FloatFormat::Double => Self::allocate_float(f),
        }
    }

    /// Return stored component float format for float and complex values.
    pub fn float_format(&self) -> Option<FloatFormat> {
        match self.value {
            NumberValue::Float(_) | NumberValue::Complex(_) => Some(self.float_format),
            _ => None,
        }
    }

    /// True if this number is a single-float.
    pub fn is_single_float(&self) -> bool {
        matches!(self.value, NumberValue::Float(_)) && self.float_format == FloatFormat::Single
    }

    /// True if this number is a double-float.
    pub fn is_double_float(&self) -> bool {
        matches!(self.value, NumberValue::Float(_)) && self.float_format == FloatFormat::Double
    }

    /// Allocate a complex and return LispObject
    pub fn allocate_complex(c: Complex<f64>) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Complex(c), FloatFormat::Double) };
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a complex with an explicit component float format.
    pub fn allocate_complex_with_format(c: Complex<f64>, format: FloatFormat) -> LispObject {
        let value = match format {
            FloatFormat::Single => Complex::new((c.re as f32) as f64, (c.im as f32) as f64),
            FloatFormat::Double => c,
        };
        let ptr = unsafe { Self::allocate_number(NumberValue::Complex(value), format) };
        LispObject::from_general_ptr(ptr)
    }

    /// Try to get bignum value
    pub fn as_bignum(&self) -> Option<&Integer> {
        match &self.value {
            NumberValue::Bignum(b) => Some(b),
            _ => None,
        }
    }
}

impl std::fmt::Display for Number {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        // Verify this is actually a Number before accessing
        if self.header.object_type() != Some(crate::header::ObjectType::Number) {
            return write!(f, "#<INVALID-NUMBER>");
        }
        match &self.value {
            NumberValue::Bignum(n) => write!(f, "{}", n),
            NumberValue::Ratio(r) => {
                write!(f, "{}/{}", r.numerator_ref(), r.denominator_ref())
            }
            NumberValue::Float(fl) => write!(f, "{}", fl),
            NumberValue::Complex(c) => write!(f, "#C({} {})", c.re, c.im),
        }
    }
}

/// Type checking and conversion utilities
impl LispObject {
    #[inline]
    fn plausible_general_ptr<T>(ptr: *const T) -> bool {
        if ptr.is_null() {
            return false;
        }
        let addr = ptr as usize;
        if addr < 4096 {
            return false;
        }
        // Reject obvious malformed values (e.g. sign-extended immediates
        // interpreted as pointers). Valid user-space object pointers in this
        // runtime live in the low canonical range.
        #[cfg(target_pointer_width = "64")]
        if (addr >> 48) != 0 {
            return false;
        }
        true
    }

    /// Is this any kind of number?
    pub fn is_number(self) -> bool {
        if self.is_fixnum() {
            return true;
        }

        if !self.is_general() {
            return false;
        }

        // Use type header to reliably distinguish Numbers from other General objects
        if let Some(ptr) = self.as_general_ptr::<Number>() {
            if !Self::plausible_general_ptr(ptr) {
                return false;
            }
            unsafe {
                crate::header::TypeHeader::from_ptr(ptr) == Some(crate::header::ObjectType::Number)
            }
        } else {
            false
        }
    }

    /// Try to get float value - only returns Some if value IS a float
    /// Does NOT convert other types (bignums, ratios) to float
    pub fn as_float(self) -> Option<f64> {
        // Fixnums are not floats
        if self.as_fixnum().is_some() {
            return None;
        }

        // First check if it's actually a number
        if !self.is_number() {
            return None;
        }

        if let Some(ptr) = self.as_general_ptr::<Number>() {
            if !Self::plausible_general_ptr(ptr) {
                return None;
            }
            let num = unsafe { &*ptr };
            // Double-check the header
            if num.header.object_type() != Some(crate::header::ObjectType::Number) {
                return None;
            }
            match &num.value {
                NumberValue::Float(f) => Some(*f),
                // Bignums and Ratios are NOT floats - don't convert them
                _ => None,
            }
        } else {
            None
        }
    }

    /// Return the float format for float objects.
    pub fn as_float_format(self) -> Option<FloatFormat> {
        if !self.is_number() {
            return None;
        }
        let ptr = self.as_general_ptr::<Number>()?;
        if !Self::plausible_general_ptr(ptr) {
            return None;
        }
        let num = unsafe { &*ptr };
        if num.header.object_type() != Some(crate::header::ObjectType::Number) {
            return None;
        }
        num.float_format()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_bignum() {
        let big = Integer::from(12345678901234567890_i128);
        let obj = Number::allocate_bignum(big.clone());

        assert!(obj.is_general());
        assert!(obj.is_number());

        if let Some(ptr) = obj.as_general_ptr::<Number>() {
            let num = unsafe { &*ptr };
            match &num.value {
                NumberValue::Bignum(b) => assert_eq!(b, &big),
                _ => panic!("Wrong number type"),
            }
        }
    }

    #[test]
    fn test_float() {
        let obj = Number::allocate_float(3.14159);

        assert!(obj.is_number());
        assert_eq!(obj.as_float(), Some(3.14159));
    }

    #[test]
    fn test_fixnum_to_float() {
        let obj = LispObject::fixnum(42);
        assert_eq!(obj.as_float(), Some(42.0));
    }
}
