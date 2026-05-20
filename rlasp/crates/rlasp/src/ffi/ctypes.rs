/// C type representation for FFI
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum CType {
    /// void
    Void,
    /// Signed integers
    Int8,
    Int16,
    Int32,
    Int64,
    /// Unsigned integers
    UInt8,
    UInt16,
    UInt32,
    UInt64,
    /// Floating point
    Float,
    Double,
    /// Pointer to type
    Pointer(Box<CType>),
    /// C struct
    Struct {
        name: Option<String>,
        fields: Vec<(String, CType)>,
    },
    /// C array
    Array {
        element_type: Box<CType>,
        size: Option<usize>,
    },
    /// Function pointer
    Function {
        return_type: Box<CType>,
        param_types: Vec<CType>,
        variadic: bool,
    },
}

impl CType {
    /// Get the size in bytes (for fixed-size types)
    pub fn size(&self) -> Option<usize> {
        use std::mem::size_of;
        match self {
            CType::Void => Some(0),
            CType::Int8 | CType::UInt8 => Some(size_of::<i8>()),
            CType::Int16 | CType::UInt16 => Some(size_of::<i16>()),
            CType::Int32 | CType::UInt32 => Some(size_of::<i32>()),
            CType::Int64 | CType::UInt64 => Some(size_of::<i64>()),
            CType::Float => Some(size_of::<f32>()),
            CType::Double => Some(size_of::<f64>()),
            CType::Pointer(_) => Some(size_of::<*const ()>()),
            CType::Function { .. } => Some(size_of::<*const ()>()),
            CType::Array {
                element_type,
                size: Some(n),
            } => element_type.size().map(|elem_size| elem_size * n),
            _ => None,
        }
    }

    /// Get the alignment in bytes
    pub fn alignment(&self) -> Option<usize> {
        use std::mem::align_of;
        match self {
            CType::Void => Some(1),
            CType::Int8 | CType::UInt8 => Some(align_of::<i8>()),
            CType::Int16 | CType::UInt16 => Some(align_of::<i16>()),
            CType::Int32 | CType::UInt32 => Some(align_of::<i32>()),
            CType::Int64 | CType::UInt64 => Some(align_of::<i64>()),
            CType::Float => Some(align_of::<f32>()),
            CType::Double => Some(align_of::<f64>()),
            CType::Pointer(_) => Some(align_of::<*const ()>()),
            CType::Function { .. } => Some(align_of::<*const ()>()),
            _ => None,
        }
    }

    /// Convert to libffi type
    pub fn to_ffi_type(&self) -> libffi::middle::Type {
        match self {
            CType::Void => libffi::middle::Type::void(),
            CType::Int8 => libffi::middle::Type::i8(),
            CType::Int16 => libffi::middle::Type::i16(),
            CType::Int32 => libffi::middle::Type::i32(),
            CType::Int64 => libffi::middle::Type::i64(),
            CType::UInt8 => libffi::middle::Type::u8(),
            CType::UInt16 => libffi::middle::Type::u16(),
            CType::UInt32 => libffi::middle::Type::u32(),
            CType::UInt64 => libffi::middle::Type::u64(),
            CType::Float => libffi::middle::Type::f32(),
            CType::Double => libffi::middle::Type::f64(),
            CType::Pointer(_) => libffi::middle::Type::pointer(),
            CType::Function { .. } => libffi::middle::Type::pointer(),
            _ => panic!("Cannot convert {:?} to ffi type", self),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ctype_sizes() {
        assert_eq!(CType::Int32.size(), Some(4));
        assert_eq!(CType::Int64.size(), Some(8));
        assert_eq!(CType::Double.size(), Some(8));
        assert_eq!(CType::Pointer(Box::new(CType::Int32)).size(), Some(8));
    }

    #[test]
    fn test_array_size() {
        let array_type = CType::Array {
            element_type: Box::new(CType::Int32),
            size: Some(10),
        };
        assert_eq!(array_type.size(), Some(40));
    }
}
