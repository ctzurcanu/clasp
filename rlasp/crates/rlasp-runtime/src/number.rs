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

    /// Allocate a bignum and return LispObject
    pub fn allocate_bignum(n: Integer) -> LispObject {
        let num = Box::new(Number::new(NumberValue::Bignum(n)));
        let ptr = Box::into_raw(num);
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a ratio and return LispObject
    pub fn allocate_ratio(r: Rational) -> LispObject {
        let num = Box::new(Number::new(NumberValue::Ratio(r)));
        let ptr = Box::into_raw(num);
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a float and return LispObject
    pub fn allocate_float(f: f64) -> LispObject {
        let num = Box::new(Number::new(NumberValue::Float(f)));
        let ptr = Box::into_raw(num);
        LispObject::from_general_ptr(ptr)
    }

    /// Allocate a complex and return LispObject
    pub fn allocate_complex(c: Complex<f64>) -> LispObject {
        let num = Box::new(Number::new(NumberValue::Complex(c)));
        let ptr = Box::into_raw(num);
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
