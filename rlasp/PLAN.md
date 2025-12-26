# rlasp Implementation Plan

Rust-based Common Lisp with C/C++/Rust FFI focus

## Phase 1: C FFI Foundation

### Step 1: Core Types & libffi Integration ✅ COMPLETE
- [x] `CType` - Represent C types (int, double, pointer, struct, etc.)
- [x] `CFuncRef` - Reference to C functions (address + signature)
- [x] `CCall` - AST node for calling C functions
- [x] libffi lowering - Convert CCall to actual libffi invocations
- [x] CFFI-compatible user API

### Step 2: C++ Static Wrappers ✅ COMPLETE
- [x] Manual C shims for test class
- [x] Expose through CFFI machinery
- [x] Wrapper type using CFFI (CppClass/CppMethod map to shims)

### Step 3: Shim Code Generation ✅ COMPLETE
- [x] Codegen pass: AST → C++ extern "C" wrappers
- [x] Cargo build script integration
- [x] Compile generated shims automatically

### Step 4: cxx/autocxx Integration ✅ COMPLETE
- [x] For hot APIs: use cxx crate
- [x] Switch `CppMethodCall` lowering to generated Rust wrappers
- [x] Performance optimization

### Step 5: Lifetime/GC Polish ✅ COMPLETE
- [x] Handle table for foreign objects
- [x] Rooting mechanism
- [x] Finalizers calling C++ destructors
- [x] Memory safety guarantees

### Step 6: Advanced C++ Semantics (Optional) ✅ COMPLETE
- [x] Overload resolution
- [ ] Template instantiation tracking (future work)
- [ ] RTTI metadata (future work)
- [ ] vtable handling (future work)

## Architecture

```
rlasp/
├── src/
│   ├── ffi/
│   │   ├── ctypes.rs      # CType definitions
│   │   ├── cfunc.rs       # CFuncRef
│   │   ├── ccall.rs       # CCall AST node
│   │   ├── libffi.rs      # libffi lowering
│   │   └── cpp_bridge.rs  # C++ wrapper generation
│   ├── runtime/
│   │   ├── object.rs      # LispObject (tagged pointer)
│   │   ├── gc.rs          # GC integration
│   │   └── handles.rs     # Foreign object handles
│   └── main.rs
├── build.rs              # Codegen + C++ compilation
├── Cargo.toml
└── generated/            # Auto-generated C++ shims
```
