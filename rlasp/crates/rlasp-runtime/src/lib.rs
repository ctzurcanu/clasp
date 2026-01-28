//! rlasp-runtime: Core object system and runtime support
//!
//! This crate implements the foundational object representation using
//! a two-stack architecture for type-safe operations.

pub mod stack;
pub mod header;
pub mod object;
pub mod cons;
pub mod symbol;
pub mod number;
pub mod gc;
pub mod package;
pub mod string;
pub mod vector;
pub mod hash_table;
pub mod clos;
pub mod eval_stack;
pub mod closure;
pub mod error;
pub mod io_syntax;

pub use stack::{TypeTag, ObjectHandle, allocate_object};
pub use header::{TypeHeader, ObjectType};
pub use object::{LispObject, Tag};
pub use cons::Cons;
pub use symbol::{Symbol, NIL_SYMBOL, T_SYMBOL};
pub use number::{Number, NumberValue};
pub use package::{Package, PackageManager, PACKAGE_MANAGER};
pub use string::RString;
pub use vector::RVector;
pub use hash_table::HashTable;
pub use clos::{Class, Instance};
pub use closure::Closure;
pub use error::{LispError, ErrorKind};

// Re-export GC functions
pub use gc::{init_gc, global_gc, is_gc_initialized, GCAllocator};

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
}

/// Check if we're using Boehm GC
pub fn using_boehm_gc() -> bool {
    cfg!(feature = "boehm-gc")
}
