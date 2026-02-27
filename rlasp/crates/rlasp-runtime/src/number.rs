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

/// Number with type header
#[repr(C)]
pub struct Number {
    /// Type header (MUST be first field)
    header: crate::header::TypeHeader,

    /// The actual number value
    pub value: NumberValue,
}

impl Number {
    fn new(value: NumberValue) -> Self {
        Number {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::Number),
            value,
        }
    }

    #[inline]
    unsafe fn allocate_number(value: NumberValue) -> *mut Number {
        let ptr = crate::gc::gc_allocate_value(Number::new(value)).as_ptr();
        #[cfg(feature = "boehm-gc")]
        {
            crate::gc::gc_register_drop_finalizer(ptr);
        }
        ptr
    }

    /// Allocate a bignum and return LispObject
    pub fn allocate_bignum(n: Integer) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Bignum(n)) };
        maybe_collect_after_bignum_alloc();
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a ratio and return LispObject
    pub fn allocate_ratio(r: Rational) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Ratio(r)) };
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a float and return LispObject
    pub fn allocate_float(f: f64) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Float(f)) };
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a complex and return LispObject
    pub fn allocate_complex(c: Complex<f64>) -> LispObject {
        let ptr = unsafe { Self::allocate_number(NumberValue::Complex(c)) };
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
        if self.header.obj_type != crate::header::ObjectType::Number {
            return write!(f, "#<INVALID-NUMBER>");
        }
        match &self.value {
            NumberValue::Bignum(n) => write!(f, "{}", n),
            NumberValue::Ratio(r) => {
                use malachite::num::arithmetic::traits::Reciprocal;
                write!(f, "{}/{}", r.numerator_ref(), r.denominator_ref())
            }
            NumberValue::Float(fl) => write!(f, "{}", fl),
            NumberValue::Complex(c) => write!(f, "#C({} {})", c.re, c.im),
        }
    }
}

/// Type checking and conversion utilities
impl LispObject {
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
            if ptr.is_null() {
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
            let num = unsafe { &*ptr };
            // Double-check the header
            if num.header.obj_type != crate::header::ObjectType::Number {
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
