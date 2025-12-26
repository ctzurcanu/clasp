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
pub mod hash_table;
pub mod clos;
pub mod eval_stack;

pub use stack::{TypeTag, ObjectHandle, allocate_object};
pub use header::{TypeHeader, ObjectType};
pub use object::{LispObject, Tag};
pub use cons::Cons;
pub use symbol::{Symbol, NIL_SYMBOL, T_SYMBOL};
pub use number::{Number, NumberValue};
pub use package::{Package, PackageManager, PACKAGE_MANAGER};
pub use string::RString;
pub use hash_table::HashTable;
pub use clos::{Class, Instance};
