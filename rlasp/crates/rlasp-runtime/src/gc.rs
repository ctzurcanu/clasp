//! Garbage collection abstraction
//!
//! Provides a trait-based GC interface that can be implemented with:
//! - Reference counting (Phase 1a - quick bootstrap)
//! - Boehm GC (Phase 1b - proven with Clasp)
//! - Custom precise GC (Future)

use crate::object::LispObject;
use std::alloc::{alloc, dealloc, Layout};
use std::ptr::NonNull;

/// GC allocation trait
///
/// All heap allocations go through this trait, allowing us to swap
/// GC implementations.
pub trait GCAllocator: Send + Sync {
    /// Allocate memory with given layout
    ///
    /// The GC will track this allocation and reclaim it when unreachable.
    unsafe fn allocate_raw(&self, layout: Layout) -> NonNull<u8>;

    /// Request a GC collection
    ///
    /// This is a hint - the GC may ignore it or collect later.
    fn collect(&self);

    /// Register a root (prevents collection)
    unsafe fn register_root(&self, ptr: *const u8);

    /// Unregister a root
    unsafe fn unregister_root(&self, ptr: *const u8);
}

/// Helper for allocating typed values
pub unsafe fn allocate<T: GCInfo>(gc: &dyn GCAllocator, value: T) -> NonNull<T> {
    let layout = Layout::new::<T>();
    let ptr = gc.allocate_raw(layout);
    let typed_ptr = ptr.as_ptr() as *mut T;
    typed_ptr.write(value);
    NonNull::new_unchecked(typed_ptr)
}

/// Information about a type for GC
pub trait GCInfo {
    /// Does this type need finalization?
    const NEEDS_FINALIZATION: bool = false;

    /// Trace all GC pointers in this object
    ///
    /// The visitor will be called for each LispObject pointer.
    fn trace(&self, visitor: &mut dyn GCVisitor);
}

/// Visitor for tracing GC pointers
pub trait GCVisitor {
    /// Visit a LispObject pointer
    fn visit(&mut self, obj: &LispObject);
}

// === Simple allocator (no GC) ===
// Used for bootstrapping and testing

/// Simple bump allocator with no garbage collection
///
/// WARNING: This leaks memory! Only for testing and early bootstrap.
pub struct NoGC;

impl NoGC {
    pub fn new() -> Self {
        Self
    }
}

impl GCAllocator for NoGC {
    unsafe fn allocate_raw(&self, layout: Layout) -> NonNull<u8> {
        let ptr = alloc(layout);

        if ptr.is_null() {
            std::alloc::handle_alloc_error(layout);
        }

        NonNull::new_unchecked(ptr)
    }

    fn collect(&self) {
        // No-op for NoGC
    }

    unsafe fn register_root(&self, _ptr: *const u8) {
        // No-op for NoGC
    }

    unsafe fn unregister_root(&self, _ptr: *const u8) {
        // No-op for NoGC
    }
}

impl Default for NoGC {
    fn default() -> Self {
        Self::new()
    }
}

// === GCInfo implementations for basic types ===

impl GCInfo for crate::cons::Cons {
    const NEEDS_FINALIZATION: bool = false;

    fn trace(&self, visitor: &mut dyn GCVisitor) {
        visitor.visit(&self.car());
        visitor.visit(&self.cdr());
    }
}

impl GCInfo for crate::symbol::Symbol {
    const NEEDS_FINALIZATION: bool = false;

    fn trace(&self, visitor: &mut dyn GCVisitor) {
        visitor.visit(&self.value());
        visitor.visit(&self.function());
        // Note: plist would need tracing too
    }
}

impl GCInfo for crate::number::Number {
    const NEEDS_FINALIZATION: bool = false;

    fn trace(&self, _visitor: &mut dyn GCVisitor) {
        // Numbers don't contain GC pointers
    }
}

/// Global GC instance
///
/// For now, use NoGC. Later we'll switch to Boehm or custom GC.
static mut GLOBAL_GC: Option<Box<dyn GCAllocator>> = None;

/// Initialize the GC system
pub fn init_gc() {
    unsafe {
        GLOBAL_GC = Some(Box::new(NoGC::new()));
    }
}

/// Get the global GC allocator
pub fn global_gc() -> &'static dyn GCAllocator {
    unsafe {
        GLOBAL_GC
            .as_ref()
            .expect("GC not initialized - call init_gc() first")
            .as_ref()
    }
}

/// Allocate using the global GC
pub unsafe fn gc_allocate<T: GCInfo>(value: T) -> NonNull<T> {
    allocate(global_gc(), value)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_nogc_allocator() {
        let gc = NoGC::new();

        unsafe {
            let ptr = allocate(&gc, 42i64);
            assert_eq!(*ptr.as_ref(), 42);

            // Manual cleanup for test
            dealloc(ptr.as_ptr() as *mut u8, Layout::new::<i64>());
        }
    }

    // Implement GCInfo for i64 for test
    impl GCInfo for i64 {
        fn trace(&self, _visitor: &mut dyn GCVisitor) {
            // No pointers to trace
        }
    }

    #[test]
    fn test_gc_init() {
        init_gc();
        let _gc = global_gc();
        // Should not panic
    }
}
