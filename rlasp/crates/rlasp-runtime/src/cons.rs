//! Cons cells - the fundamental list structure
//!
//! Uses atomic pointers for thread-safe car/cdr operations

use crate::object::LispObject;
use std::sync::atomic::{AtomicUsize, Ordering};
use std::fmt;

/// Cons cell with atomic car/cdr
///
/// Following Clasp's design, we use atomic pointers to allow
/// thread-safe mutations without locks.
#[repr(C, align(4))]  // 4-byte alignment ensures low 2 bits are zero
pub struct Cons {
    car: AtomicUsize,
    cdr: AtomicUsize,
}

impl Cons {
    /// Create a new cons cell
    pub fn new(car: LispObject, cdr: LispObject) -> Self {
        Self {
            car: AtomicUsize::new(car.raw()),
            cdr: AtomicUsize::new(cdr.raw()),
        }
    }

    /// Get the car (first element)
    #[inline]
    pub fn car(&self) -> LispObject {
        let raw = self.car.load(Ordering::Acquire);
        unsafe { LispObject::from_raw(raw) }
    }

    /// Get the cdr (rest of list)
    #[inline]
    pub fn cdr(&self) -> LispObject {
        let raw = self.cdr.load(Ordering::Acquire);
        unsafe { LispObject::from_raw(raw) }
    }

    /// Set the car (rplaca in Common Lisp)
    #[inline]
    pub fn set_car(&self, value: LispObject) {
        self.car.store(value.raw(), Ordering::Release);
    }

    /// Set the cdr (rplacd in Common Lisp)
    #[inline]
    pub fn set_cdr(&self, value: LispObject) {
        self.cdr.store(value.raw(), Ordering::Release);
    }

    /// Create a boxed cons cell and return a LispObject pointer to it
    pub fn allocate(car: LispObject, cdr: LispObject) -> LispObject {
        let ptr = unsafe { crate::gc::gc_allocate_value(Cons::new(car, cdr)).as_ptr() };
        LispObject::from_cons_ptr(ptr)
    }

    /// Convert to a proper list (vector of elements)
    ///
    /// Returns None if the list is improper or circular
    pub fn to_vec(&self) -> Option<Vec<LispObject>> {
        let mut result = Vec::new();
        let mut current = LispObject::from_cons_ptr(self as *const Cons);

        // Safety limit to prevent infinite loops
        const MAX_LIST_LENGTH: usize = 10000;

        for _ in 0..MAX_LIST_LENGTH {
            if current.is_nil() {
                return Some(result);
            }

            if let Some(cons_ptr) = current.as_cons_ptr() {
                let cons = unsafe { &*cons_ptr };
                result.push(cons.car());
                current = cons.cdr();
            } else {
                // Improper list (dotted pair)
                return None;
            }
        }

        // Likely circular list
        None
    }

    /// Get the length of a proper list
    ///
    /// Returns None if the list is improper or circular
    pub fn length(&self) -> Option<usize> {
        let mut len = 0;
        let mut current = LispObject::from_cons_ptr(self as *const Cons);

        // Safety limit to prevent infinite loops
        const MAX_LIST_LENGTH: usize = 10000;

        for _ in 0..MAX_LIST_LENGTH {
            if current.is_nil() {
                return Some(len);
            }

            if let Some(cons_ptr) = current.as_cons_ptr() {
                len += 1;
                let cons = unsafe { &*cons_ptr };
                current = cons.cdr();
            } else {
                // Improper list
                return None;
            }
        }

        // Likely circular list
        None
    }

    /// Build a proper list from a slice of elements
    ///
    /// Creates (a b c) from [a, b, c]
    pub fn list(elements: &[LispObject]) -> LispObject {
        if elements.is_empty() {
            return LispObject::nil();
        }

        // Keep list backbone allocation stable across GC runs while chaining cons cells.
        let _gc_pause = crate::gc::GcPauseGuard::new();
        let mut result = LispObject::nil();
        for elem in elements.iter().rev() {
            result = Cons::allocate(*elem, result);
        }
        result
    }

    /// Build a dotted list from elements and a tail
    ///
    /// Creates (a b c . tail) from [a, b, c] and tail
    pub fn build_dotted_list(elements: &[LispObject], tail: LispObject) -> LispObject {
        if elements.is_empty() {
            return tail;
        }

        // Keep list backbone allocation stable across GC runs while chaining cons cells.
        let _gc_pause = crate::gc::GcPauseGuard::new();
        let mut result = tail;
        for elem in elements.iter().rev() {
            result = Cons::allocate(*elem, result);
        }
        result
    }
}

impl LispObject {
    /// Helper to construct LispObject from raw usize (for JIT and FFI)
    pub unsafe fn from_raw(raw: usize) -> Self {
        Self { raw }
    }
}

impl fmt::Debug for Cons {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({:?} . {:?})", self.car(), self.cdr())
    }
}

impl fmt::Display for Cons {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        // Try to print as a proper list
        if let Some(elements) = self.to_vec() {
            write!(f, "(")?;
            for (i, elem) in elements.iter().enumerate() {
                if i > 0 {
                    write!(f, " ")?;
                }
                write!(f, "{}", elem)?;
            }
            write!(f, ")")
        } else {
            // Improper list - print as dotted pair
            write!(f, "({} . {})", self.car(), self.cdr())
        }
    }
}

// Cons cells need manual memory management
// We'll integrate with GC later
impl Drop for Cons {
    fn drop(&mut self) {
        // For now, just drop normally
        // Later: integrate with GC
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cons_creation() {
        let car = LispObject::fixnum(1);
        let cdr = LispObject::fixnum(2);
        let cons = Cons::new(car, cdr);

        assert_eq!(cons.car(), car);
        assert_eq!(cons.cdr(), cdr);
    }

    #[test]
    fn test_cons_mutation() {
        let cons = Cons::new(LispObject::fixnum(1), LispObject::fixnum(2));

        cons.set_car(LispObject::fixnum(10));
        assert_eq!(cons.car().as_fixnum(), Some(10));

        cons.set_cdr(LispObject::nil());
        assert!(cons.cdr().is_nil());
    }

    #[test]
    fn test_cons_list() {
        // Create (1 2 3)
        let three = Cons::allocate(LispObject::fixnum(3), LispObject::nil());
        let two = Cons::allocate(LispObject::fixnum(2), three);
        let one = Cons::allocate(LispObject::fixnum(1), two);

        // Verify structure
        assert!(one.is_cons());

        if let Some(cons1) = one.as_cons_ptr() {
            let c1 = unsafe { &*cons1 };
            assert_eq!(c1.car().as_fixnum(), Some(1));

            if let Some(cons2) = c1.cdr().as_cons_ptr() {
                let c2 = unsafe { &*cons2 };
                assert_eq!(c2.car().as_fixnum(), Some(2));
            }
        }
    }

    #[test]
    fn test_to_vec() {
        // Create (1 2 3)
        let three = Cons::allocate(LispObject::fixnum(3), LispObject::nil());
        let two = Cons::allocate(LispObject::fixnum(2), three);
        let one = Cons::allocate(LispObject::fixnum(1), two);

        if let Some(cons_ptr) = one.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let vec = cons.to_vec().unwrap();

            assert_eq!(vec.len(), 3);
            assert_eq!(vec[0].as_fixnum(), Some(1));
            assert_eq!(vec[1].as_fixnum(), Some(2));
            assert_eq!(vec[2].as_fixnum(), Some(3));
        }
    }
}
