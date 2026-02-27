//! Garbage collection abstraction
//!
//! Provides a trait-based GC interface that can be implemented with:
//! - Reference counting (Phase 1a - quick bootstrap)
//! - Boehm GC (Phase 1b - proven with Clasp)
//! - Custom precise GC (Future)

use crate::object::LispObject;
use std::alloc::{alloc, Layout};
use std::ptr::NonNull;

#[cfg(feature = "boehm-gc")]
use std::sync::atomic::{AtomicBool, Ordering};

#[allow(unused_imports)]
use std::alloc::dealloc;

// === Boehm GC FFI ===
#[cfg(feature = "boehm-gc")]
#[allow(dead_code)]
mod ffi {
    use std::os::raw::c_void;

    extern "C" {
        /// Initialize the garbage collector
        pub fn GC_init();

        /// Allocate memory that may contain pointers
        pub fn GC_malloc(size: usize) -> *mut c_void;

        /// Allocate memory that will not contain pointers (atomic)
        pub fn GC_malloc_atomic(size: usize) -> *mut c_void;

        /// Allocate memory that will not be collected (uncollectable)
        pub fn GC_malloc_uncollectable(size: usize) -> *mut c_void;

        /// Free memory explicitly (optional with GC)
        pub fn GC_free(ptr: *mut c_void);

        /// Force a garbage collection
        pub fn GC_gcollect();

        /// Add a memory range as a root
        pub fn GC_add_roots(low: *mut c_void, high: *mut c_void);

        /// Remove a memory range as a root
        pub fn GC_remove_roots(low: *mut c_void, high: *mut c_void);

        /// Get heap size
        pub fn GC_get_heap_size() -> usize;

        /// Get free bytes
        pub fn GC_get_free_bytes() -> usize;

        /// Get total bytes allocated
        pub fn GC_get_total_bytes() -> usize;

        /// Enable/disable GC
        pub fn GC_enable();
        pub fn GC_disable();

        /// Register a finalizer
        pub fn GC_register_finalizer(
            obj: *mut c_void,
            fn_ptr: Option<unsafe extern "C" fn(*mut c_void, *mut c_void)>,
            client_data: *mut c_void,
            old_fn: *mut Option<unsafe extern "C" fn(*mut c_void, *mut c_void)>,
            old_data: *mut *mut c_void,
        );
    }
}

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

// === Boehm GC allocator ===
#[cfg(feature = "boehm-gc")]
pub mod boehm {
    use super::*;
    use std::os::raw::c_void;

    static INITIALIZED: AtomicBool = AtomicBool::new(false);

    /// Boehm-Demers-Weiser conservative garbage collector
    ///
    /// This is the same GC used by Clasp, providing proven reliability
    /// for Common Lisp implementations.
    pub struct BoehmGC {
        _private: (), // Prevent direct construction
    }

    impl BoehmGC {
        /// Create a new BoehmGC instance
        ///
        /// This initializes the Boehm GC if not already initialized.
        /// Safe to call multiple times.
        pub fn new() -> Self {
            if !INITIALIZED.swap(true, Ordering::SeqCst) {
                unsafe {
                    super::ffi::GC_init();
                }
            }
            Self { _private: () }
        }

        /// Get heap statistics
        pub fn stats(&self) -> GCStats {
            unsafe {
                GCStats {
                    heap_size: super::ffi::GC_get_heap_size(),
                    free_bytes: super::ffi::GC_get_free_bytes(),
                    total_bytes: super::ffi::GC_get_total_bytes(),
                }
            }
        }

        /// Allocate memory that contains no pointers (more efficient)
        pub unsafe fn allocate_atomic(&self, layout: Layout) -> NonNull<u8> {
            let size = layout.size().max(layout.align());
            let ptr = super::ffi::GC_malloc_atomic(size);

            if ptr.is_null() {
                std::alloc::handle_alloc_error(layout);
            }

            NonNull::new_unchecked(ptr as *mut u8)
        }

        /// Allocate memory that will never be collected
        pub unsafe fn allocate_uncollectable(&self, layout: Layout) -> NonNull<u8> {
            let size = layout.size().max(layout.align());
            let ptr = super::ffi::GC_malloc_uncollectable(size);

            if ptr.is_null() {
                std::alloc::handle_alloc_error(layout);
            }

            NonNull::new_unchecked(ptr as *mut u8)
        }

        /// Enable garbage collection
        pub fn enable(&self) {
            unsafe { super::ffi::GC_enable(); }
        }

        /// Disable garbage collection
        pub fn disable(&self) {
            unsafe { super::ffi::GC_disable(); }
        }

        /// Register a finalizer for an object
        pub unsafe fn register_finalizer<T>(
            &self,
            ptr: *mut T,
            finalizer: unsafe extern "C" fn(*mut c_void, *mut c_void),
        ) {
            super::ffi::GC_register_finalizer(
                ptr as *mut c_void,
                Some(finalizer),
                std::ptr::null_mut(),
                std::ptr::null_mut(),
                std::ptr::null_mut(),
            );
        }
    }

    impl GCAllocator for BoehmGC {
        unsafe fn allocate_raw(&self, layout: Layout) -> NonNull<u8> {
            // Boehm GC handles alignment internally for allocations >= 8 bytes
            // For smaller alignments, we may need to over-allocate
            let size = layout.size().max(layout.align());
            let ptr = super::ffi::GC_malloc(size);

            if ptr.is_null() {
                std::alloc::handle_alloc_error(layout);
            }

            NonNull::new_unchecked(ptr as *mut u8)
        }

        fn collect(&self) {
            unsafe {
                super::ffi::GC_gcollect();
            }
        }

        unsafe fn register_root(&self, _ptr: *const u8) {
            // Boehm GC conservatively scans the stack and data segments,
            // so explicit roots are typically not needed.
            // For now, we rely on conservative scanning.
            // If needed, use GC_add_roots with proper range management.
        }

        unsafe fn unregister_root(&self, _ptr: *const u8) {
            // No-op - see register_root comment
        }
    }

    impl Default for BoehmGC {
        fn default() -> Self {
            Self::new()
        }
    }

    /// GC statistics
    #[derive(Debug, Clone, Copy)]
    pub struct GCStats {
        pub heap_size: usize,
        pub free_bytes: usize,
        pub total_bytes: usize,
    }
}

#[cfg(feature = "boehm-gc")]
pub use boehm::BoehmGC;

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
static mut GLOBAL_GC: Option<Box<dyn GCAllocator>> = None;

/// Initialize the GC system
///
/// When compiled with the `boehm-gc` feature, uses Boehm GC.
/// Otherwise, uses a simple non-collecting allocator (for testing).
pub fn init_gc() {
    unsafe {
        #[cfg(feature = "boehm-gc")]
        {
            GLOBAL_GC = Some(Box::new(BoehmGC::new()));
        }
        #[cfg(not(feature = "boehm-gc"))]
        {
            GLOBAL_GC = Some(Box::new(NoGC::new()));
        }
    }
}

/// Initialize with Boehm GC explicitly
#[cfg(feature = "boehm-gc")]
pub fn init_boehm_gc() {
    unsafe {
        GLOBAL_GC = Some(Box::new(BoehmGC::new()));
    }
}

/// Check if GC is initialized
pub fn is_gc_initialized() -> bool {
    unsafe { GLOBAL_GC.is_some() }
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

/// Allocate a value through the configured GC allocator without requiring
/// a `GCInfo` implementation for `T`.
pub unsafe fn gc_allocate_value<T>(value: T) -> NonNull<T> {
    if !is_gc_initialized() {
        init_gc();
    }
    let layout = Layout::new::<T>();
    let ptr = global_gc().allocate_raw(layout);
    let typed_ptr = ptr.as_ptr() as *mut T;
    typed_ptr.write(value);
    NonNull::new_unchecked(typed_ptr)
}

#[cfg(feature = "boehm-gc")]
pub unsafe fn gc_register_drop_finalizer<T>(typed_ptr: *mut T) {
    use std::os::raw::c_void;
    if !std::mem::needs_drop::<T>() {
        return;
    }

    unsafe extern "C" fn drop_value_finalizer<T>(obj: *mut c_void, _client_data: *mut c_void) {
        if !obj.is_null() {
            unsafe { std::ptr::drop_in_place(obj as *mut T) };
        }
    }

    ffi::GC_register_finalizer(
        typed_ptr as *mut c_void,
        Some(drop_value_finalizer::<T>),
        std::ptr::null_mut(),
        std::ptr::null_mut(),
        std::ptr::null_mut(),
    );
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

    #[cfg(feature = "boehm-gc")]
    #[test]
    fn test_boehm_gc_allocator() {
        let gc = BoehmGC::new();

        unsafe {
            // Allocate some memory
            let ptr = allocate(&gc, 42i64);
            assert_eq!(*ptr.as_ref(), 42);

            // Allocate more and trigger collection
            for i in 0..1000 {
                let p = allocate(&gc, i as i64);
                assert_eq!(*p.as_ref(), i as i64);
            }

            // Force collection
            gc.collect();

            // Check stats
            let stats = gc.stats();
            assert!(stats.heap_size > 0);
        }
    }

    #[cfg(feature = "boehm-gc")]
    #[test]
    fn test_boehm_gc_atomic() {
        let gc = BoehmGC::new();

        unsafe {
            // Allocate atomic memory (no pointers)
            let layout = Layout::new::<[u8; 1024]>();
            let ptr = gc.allocate_atomic(layout);
            assert!(!ptr.as_ptr().is_null());

            // Write to it
            std::ptr::write_bytes(ptr.as_ptr(), 0xAB, 1024);
        }
    }
}
