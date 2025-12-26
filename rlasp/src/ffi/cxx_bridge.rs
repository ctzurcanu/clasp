/// cxx-based bridge for high-performance C++ interop
///
/// This provides an alternative to the libffi-based approach for hot APIs.
/// Trade-offs:
/// - libffi: Flexible, runtime dynamic, slower
/// - cxx: Type-safe, compile-time, faster (no FFI overhead)

#[cxx::bridge]
pub mod ffi {
    unsafe extern "C++" {
        include!("rlasp/include/vector_cxx.hpp");

        type Vector;

        fn make_vector(x: f64, y: f64) -> UniquePtr<Vector>;
        fn getX(v: &Vector) -> f64;
        fn getY(v: &Vector) -> f64;
        fn setX(v: Pin<&mut Vector>, x: f64);
        fn setY(v: Pin<&mut Vector>, y: f64);
        fn length(v: &Vector) -> f64;
        fn add(v: &Vector, other: &Vector) -> UniquePtr<Vector>;
    }
}

/// Safe Rust wrapper around cxx-generated bindings
pub struct VectorCxx {
    inner: cxx::UniquePtr<ffi::Vector>,
}

impl VectorCxx {
    pub fn new(x: f64, y: f64) -> Self {
        Self {
            inner: ffi::make_vector(x, y),
        }
    }

    pub fn get_x(&self) -> f64 {
        ffi::getX(&self.inner)
    }

    pub fn get_y(&self) -> f64 {
        ffi::getY(&self.inner)
    }

    pub fn set_x(&mut self, x: f64) {
        ffi::setX(self.inner.pin_mut(), x);
    }

    pub fn set_y(&mut self, y: f64) {
        ffi::setY(self.inner.pin_mut(), y);
    }

    pub fn length(&self) -> f64 {
        ffi::length(&self.inner)
    }

    pub fn add(&self, other: &VectorCxx) -> VectorCxx {
        VectorCxx {
            inner: ffi::add(&self.inner, &other.inner),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vector_cxx_basic() {
        let v = VectorCxx::new(3.0, 4.0);
        assert_eq!(v.get_x(), 3.0);
        assert_eq!(v.get_y(), 4.0);
        assert_eq!(v.length(), 5.0);
    }

    #[test]
    fn test_vector_cxx_mutate() {
        let mut v = VectorCxx::new(1.0, 2.0);
        v.set_x(5.0);
        v.set_y(12.0);
        assert_eq!(v.get_x(), 5.0);
        assert_eq!(v.get_y(), 12.0);
        assert_eq!(v.length(), 13.0);
    }

    #[test]
    fn test_vector_cxx_add() {
        let v1 = VectorCxx::new(1.0, 2.0);
        let v2 = VectorCxx::new(3.0, 4.0);
        let v3 = v1.add(&v2);
        assert_eq!(v3.get_x(), 4.0);
        assert_eq!(v3.get_y(), 6.0);
    }
}
