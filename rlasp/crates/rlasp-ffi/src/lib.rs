//! rlasp-ffi: Foreign Function Interface
//!
//! Provides C/C++/Rust FFI capabilities following Clasp's design.

pub mod c_ffi;
pub mod library;
pub mod types;

pub use c_ffi::{call_foreign, ForeignFunction, ForeignSignature, ForeignType};
pub use library::Library;
pub use types::{FromLisp, ToLisp, TypeError};
