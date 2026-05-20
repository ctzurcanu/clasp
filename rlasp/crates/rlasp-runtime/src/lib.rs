//! rlasp-runtime: Core object system and runtime support
//!
//! This crate implements the foundational object representation using
//! a two-stack architecture for type-safe operations.

pub mod character_names;
pub mod cl_builtins;
pub mod clos;
pub mod closure;
pub mod cons;
pub mod error;
pub mod eval_stack;
pub mod gc;
pub mod hash_table;
pub mod header;
pub mod io_syntax;
pub mod number;
pub mod object;
pub mod package;
pub mod pathname;
pub mod stack;
pub mod stream;
pub mod string;
pub mod symbol;
pub mod vector;

pub use character_names::parse_character_name;
pub use cl_builtins::is_cl_builtin;
pub use clos::{Class, Instance};
pub use closure::Closure;
pub use cons::Cons;
pub use error::{ErrorKind, LispError};
pub use hash_table::HashTable;
pub use header::{ObjectType, TypeHeader};
pub use number::{FloatFormat, Number, NumberValue};
pub use object::{LispObject, Tag};
pub use package::{Package, PackageManager, PACKAGE_MANAGER};
pub use pathname::Pathname;
pub use stack::{allocate_object, ObjectHandle, TypeTag};
pub use stream::{Stream, StreamData, StreamDirection, StreamElementType};
pub use string::RString;
pub use symbol::{Symbol, NIL_SYMBOL, T_SYMBOL};
pub use vector::RVector;

// Re-export GC functions
pub use gc::{global_gc, init_gc, is_gc_initialized, GCAllocator};

#[cfg(feature = "boehm-gc")]
pub use gc::BoehmGC;

/// Initialize the rlasp runtime
///
/// This must be called before using any runtime functions.
/// It initializes the GC (Boehm GC if feature enabled, otherwise NoGC).
pub fn init_runtime() {
    if !gc::is_gc_initialized() {
        gc::init_gc();
    }
    let suppress_gc_warnings = std::env::var("RLASP_SUPPRESS_GC_WARNINGS")
        .map(|v| {
            !matches!(
                v.trim().to_ascii_lowercase().as_str(),
                "0" | "false" | "no" | "off"
            )
        })
        .unwrap_or(true);
    if suppress_gc_warnings {
        gc::gc_ignore_warnings();
    }
    // Optional escape hatch for AOT/debug stability when host-side roots are
    // incomplete for some runtime maps.
    if let Ok(v) = std::env::var("RLASP_DISABLE_GC") {
        let t = v.trim().to_ascii_lowercase();
        if matches!(t.as_str(), "1" | "true" | "yes" | "on") {
            gc::gc_disable();
        }
    }
}

/// Check if we're using Boehm GC
pub fn using_boehm_gc() -> bool {
    cfg!(feature = "boehm-gc")
}

#[no_mangle]
pub extern "C" fn cc_runtime_ignore_gc_warnings() {
    gc::gc_ignore_warnings();
}
