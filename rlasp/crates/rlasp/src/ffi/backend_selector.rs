/// Backend selection strategy for C++ method lowering
///
/// This module demonstrates how to choose between libffi and cxx backends
/// based on performance requirements.
///
/// Strategy:
/// - Hot path (called frequently): Use cxx for maximum performance
/// - Cold path (called rarely): Use libffi for flexibility
/// - Dynamic/unknown APIs: Use libffi (only option)

pub enum Backend {
    /// libffi: Dynamic, flexible, slower (~100-500ns per call)
    Libffi,
    /// cxx: Static, fast, requires compile-time binding (~1-10ns per call)
    Cxx,
}

pub trait VectorApi {
    fn new(x: f64, y: f64) -> Self;
    fn get_x(&self) -> f64;
    fn get_y(&self) -> f64;
    fn length(&self) -> f64;
}

impl VectorApi for super::VectorWrapper {
    fn new(x: f64, y: f64) -> Self {
        Self::new(x, y).unwrap()
    }

    fn get_x(&self) -> f64 {
        self.get_x().unwrap()
    }

    fn get_y(&self) -> f64 {
        self.get_y().unwrap()
    }

    fn length(&self) -> f64 {
        self.length().unwrap()
    }
}

#[cfg(feature = "cxx-bridge")]
impl VectorApi for super::VectorCxx {
    fn new(x: f64, y: f64) -> Self {
        Self::new(x, y)
    }

    fn get_x(&self) -> f64 {
        self.get_x()
    }

    fn get_y(&self) -> f64 {
        self.get_y()
    }

    fn length(&self) -> f64 {
        self.length()
    }
}

/// Use the appropriate backend based on usage pattern
pub fn create_vector<T: VectorApi>(x: f64, y: f64) -> T {
    T::new(x, y)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[cfg(feature = "cxx-bridge")]
    use crate::ffi::VectorCxx;
    use crate::ffi::VectorWrapper;

    #[test]
    fn test_libffi_backend() {
        let v: VectorWrapper = create_vector(3.0, 4.0);
        assert_eq!(VectorApi::get_x(&v), 3.0);
        assert_eq!(VectorApi::length(&v), 5.0);
    }

    #[cfg(feature = "cxx-bridge")]
    #[test]
    fn test_cxx_backend() {
        let v: VectorCxx = create_vector(3.0, 4.0);
        assert_eq!(VectorApi::get_x(&v), 3.0);
        assert_eq!(VectorApi::length(&v), 5.0);
    }

    #[cfg(feature = "cxx-bridge")]
    #[test]
    fn test_polymorphic_usage() {
        fn compute_length<T: VectorApi>(x: f64, y: f64) -> f64 {
            let v = T::new(x, y);
            v.length()
        }

        // Both backends produce same result
        let len1 = compute_length::<VectorWrapper>(3.0, 4.0);
        let len2 = compute_length::<VectorCxx>(3.0, 4.0);
        assert_eq!(len1, 5.0);
        assert_eq!(len2, 5.0);
    }
}
