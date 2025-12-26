//! rlasp-ffi: Foreign Function Interface
//!
//! Provides C/C++/Rust FFI capabilities following Clasp's design.

pub mod c_ffi;
pub mod types;
pub mod library;

pub use c_ffi::{ForeignFunction, ForeignSignature, ForeignType, call_foreign};
pub use types::{FromLisp, ToLisp, TypeError};
pub use library::Library;
