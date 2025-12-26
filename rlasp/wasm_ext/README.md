# rlasp WASM Extension Runtime

Go-based runtime that executes WASI WebAssembly modules and provides host functions for FFI, C++, and other native capabilities that WASM cannot access directly.

## Features

- **WASI Support**: Run WASI-compliant WebAssembly modules using wazero
- **FFI (Foreign Function Interface)**: Load and call C libraries dynamically
  - Dynamic library loading (dlopen)
  - Function calling via libffi
  - Type marshaling (int32, int64, double, pointers)
- **C++ Interop**: Create and manipulate C++ objects from WASM
  - Object creation/destruction
  - Method calling
  - Field access
- **Memory Management**: Shared memory allocation between WASM and host

## Architecture

```
┌─────────────────────────────────────┐
│   WASM Module (rlasp compiled)      │
│                                     │
│  - Core Lisp runtime                │
│  - Basic operations                 │
│  - Calls to host functions          │
└──────────────┬──────────────────────┘
               │
               │ Host Function Calls
               │
┌──────────────▼──────────────────────┐
│   Go Runtime (wasm_ext)             │
│                                     │
│  ┌─────────────────────────────┐   │
│  │  FFI Manager                │   │
│  │  - dlopen/dlsym             │   │
│  │  - libffi integration       │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │  C++ Manager                │   │
│  │  - Object lifecycle         │   │
│  │  - Method dispatch          │   │
│  └─────────────────────────────┘   │
└──────────────┬──────────────────────┘
               │
               │ CGO
               │
┌──────────────▼──────────────────────┐
│   Native Code                       │
│                                     │
│  - C libraries (libc, libm, etc.)   │
│  - C++ objects (std::vector, etc.)  │
│  - System calls                     │
└─────────────────────────────────────┘
```

## Host Functions

### FFI Functions

```wat
;; Load a dynamic library
(import "rlasp_ext" "ffi_load_library"
  (func $ffi_load_library (param i32 i32) (result i64)))

;; Call a function from loaded library
(import "rlasp_ext" "ffi_call_function"
  (func $ffi_call_function (param i64 i32 i32 i32) (result i64)))
```

### C++ Functions

```wat
;; Create a new C++ object
(import "rlasp_ext" "cpp_new"
  (func $cpp_new (param i32 i32 i32) (result i64)))

;; Delete a C++ object
(import "rlasp_ext" "cpp_delete"
  (func $cpp_delete (param i64)))

;; Call a method on a C++ object
(import "rlasp_ext" "cpp_call_method"
  (func $cpp_call_method (param i64 i32 i32 i32) (result i64)))
```

### Utility Functions

```wat
;; Allocate memory
(import "rlasp_ext" "alloc_memory"
  (func $alloc_memory (param i32) (result i32)))

;; Free memory
(import "rlasp_ext" "free_memory"
  (func $free_memory (param i32)))

;; Log message
(import "rlasp_ext" "log_message"
  (func $log_message (param i32 i32 i32 i32)))
```

## Building

```bash
go build -o rlasp-wasm-ext
```

## Usage

```bash
# Run a WASM module
./rlasp-wasm-ext program.wasm

# With arguments
./rlasp-wasm-ext program.wasm arg1 arg2
```

## Example: Calling libm from WASM

```lisp
;; In rlasp (compiled to WASM)
(ffi-load-library "libm.so.6")
(ffi-call-function "sqrt" 144.0)  ; Returns 12.0
```

## Example: Using C++ std::vector

```lisp
;; Create a vector
(defvar vec (cpp-new "std::vector<int>"))

;; Add elements
(cpp-call-method vec "push_back" 42)
(cpp-call-method vec "push_back" 100)

;; Get size
(cpp-call-method vec "size")  ; Returns 2

;; Cleanup
(cpp-delete vec)
```

## Dependencies

- Go 1.21+
- libffi
- libdl
- C++ compiler (for C++ interop)

## Platform Support

- Linux (x86_64, arm64)
- macOS (Intel, Apple Silicon)
- Windows (with MinGW/Cygwin)

## Integration with rlasp

This runtime completes rlasp's WASM target by providing:

1. **System Access**: File I/O, networking via WASI
2. **Native Performance**: Direct C/C++ calls without overhead
3. **Library Ecosystem**: Access to any C/C++ library
4. **Object Interop**: Seamless C++ object manipulation

## Security

- FFI calls are logged for audit
- C++ objects are tracked and validated
- Memory allocation is bounded
- WASM sandbox prevents direct memory access

## Future Enhancements

- [ ] JIT compilation of hot paths
- [ ] Async/await support for I/O
- [ ] Garbage collection integration
- [ ] Multi-threading with shared memory
- [ ] GPU compute via CUDA/OpenCL
