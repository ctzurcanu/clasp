# RLASP: Rust-based Common Lisp Implementation

## Executive Summary

RLASP is an ambitious Rust implementation of Common Lisp, designed to achieve compatibility with Clasp (a C++ Common Lisp implementation). The project employs a two-stack memory architecture and supports three execution modes: interpretation, LLVM JIT compilation, and MLIR-based compilation.

**Current State**: Active development with functional interpreter and JIT backends. Boehm GC is integrated, thread-local stacks eliminate concurrency bottlenecks, and CLOS supports classes, generic functions with method specialization, and polymorphic inline caches (PICs). All three execution modes (interpreter, LLVM JIT, MLIR JIT) are operational.

---

## Architecture Overview

### Crate Structure (12 crates)

```
rlasp/
├── crates/
│   ├── rlasp-runtime/        # Core object system, GC, numeric tower
│   ├── rlasp-reader/         # S-expression lexer and parser
│   ├── rlasp-compiler/       # AST representation
│   ├── rlasp-evaluator/      # (placeholder, mostly unused)
│   ├── rlasp-jit/            # LLVM IR generation via inkwell
│   ├── rlasp-mlir/           # MLIR text generation
│   ├── rlasp-ffi/            # libffi-based foreign function interface
│   ├── rlasp-clbind/         # C++ binding infrastructure
│   ├── rlasp-macros/         # Procedural macros for Rust FFI
│   ├── rlasp/                # Main library, REPL evaluator, C API
│   └── irlasp/               # Interactive REPL executable
└── wasm_ext/                  # Go-based WebAssembly runtime (wazero)
```

### Two-Stack Architecture

The design uses two parallel stacks:

1. **Type Stack** (4 bytes per entry):
   - 2 bytes: type tag (nil, fixnum, float, pointer, character, etc.)
   - 2 bytes: data length in value stack

2. **Value Stack** (variable-length bytes):
   - Actual data for each stack entry

This separation allows efficient type checking without touching the value data.

### Execution Modes

1. **Interpreter** (`--mode interpreter`): Direct AST evaluation, recursive descent
2. **LLVM JIT** (`--mode llir`): Generate LLVM IR via inkwell, compile with ORC JIT
3. **MLIR JIT** (`--mode mlir`): Generate MLIR text, lower to LLVM, compile with ORC

---

## Honest Appraisal

### Strengths

1. **Solid Foundation**
   - Tagged pointer implementation follows Clasp's proven design (2-bit tags)
   - Malachite library provides high-quality arbitrary precision arithmetic
   - Thread-safe cons cells using atomics (`AtomicUsize` for car/cdr)
   - Well-structured crate boundaries with clear responsibilities

2. **FFI Infrastructure**
   - libffi integration enables calling arbitrary C functions
   - Platform-aware library loading (Linux, macOS, Windows)
   - Rust FFI via procedural macros (`#[lisp_fn]`)
   - C API for embedding (`rlasp_init`, `rlasp_eval`)

3. **Complete Numeric Tower**
   - Fixnum (i64 immediate), Bignum (Malachite Integer), Ratio (Malachite Rational)
   - Float (f64), Complex (num-complex)
   - Automatic type coercion with overflow handling

4. **Pragmatic Engineering**
   - Three execution modes allow trading off development speed vs. performance
   - NoGC bootstrap strategy enables rapid iteration
   - Comprehensive intrinsic library (~50+ runtime functions)

### Weaknesses

1. ~~**Incomplete GC**~~ ✅ **RESOLVED**
   - Boehm-Demers-Weiser GC is now integrated
   - Conservative collection with proven production stability
   - Long-running programs are now supported

2. **Code Duplication**
   - Multiple reader implementations (rlasp-reader vs. rlasp/src/repl/reader.rs)
   - Parallel AST definitions in different crates
   - **Impact**: Bug fixes must be applied multiple times

3. **MLIR Backend Limitations**
   - MLIR text generation without proper verification
   - String concatenation for IR construction (fragile, error-prone)
   - No type system leverage (everything is `i64`)
   - **Impact**: Runtime type errors instead of compile-time catches
   - *Note*: Despite limitations, MLIR JIT is functional and executes compiled code

4. ~~**Limited CLOS**~~ ✅ **SIGNIFICANTLY IMPROVED**
   - Full Instance type with class metadata
   - Generic function dispatch with method specializers
   - Polymorphic Inline Caches (PICs) for fast method dispatch
   - Working: defclass, defgeneric, defmethod, make-instance, slot-value, class-of, typep
   - Missing: MOP (MetaObject Protocol), standard method combinations

5. ~~**Global State Issues**~~ ✅ **RESOLVED**
   - Thread-local stacks replace mutex-protected globals
   - Uses `thread_local!` with `RefCell` for lock-free stack access
   - Symbol table and package manager still use RwLock (acceptable for low-contention paths)

6. **Parser Edge Cases**
   - Bignum overflow detection via round-trip check (inefficient)
   - Incomplete reader macro support
   - No backquote/unquote evaluation
   - **Impact**: Incompatibility with standard Common Lisp source files

### Technical Debt

1. **Debug Output Pollution**: Many `eprintln!` calls remain in production code
2. **Unsafe Code**: Heavy use of `unsafe` in runtime without comprehensive safety documentation
3. **Error Handling**: Mix of `Result`, `Option`, and panics
4. **Test Coverage**: Tests exist but gaps in edge cases

---

## Performance Analysis

### Current Performance Characteristics

| Operation | Current | Optimal | Gap |
|-----------|---------|---------|-----|
| Fixnum arithmetic | Fast (inline) | - | Good |
| Bignum operations | Malachite (optimized) | - | Good |
| Function calls | Thread-local stacks | Register passing | ~1.5x slower |
| List operations | Heap alloc per cons | Batch allocation | 5-10x slower |
| Symbol lookup | HashMap + RwLock | Interned pointers | 2x slower |
| GC | Boehm (conservative) | Generational | Adequate |
| CLOS dispatch | PICs (cache hits) | Inline caching | Good |

### Bottlenecks

1. ~~**Stack Abstraction Overhead**~~ ✅ **MITIGATED**
   - Thread-local stacks eliminate mutex contention
   - Vec operations (extend, truncate) for each stack frame (remaining overhead)
   - Type tag conversion on every operation

2. **Allocation Pressure**
   - Every cons cell is a separate allocation
   - Numbers (non-fixnum) are boxed individually
   - Closures allocate environment arrays
   - *Note*: Boehm GC handles allocation efficiently

3. **Interpreter Overhead**
   - Recursive evaluation without tail-call optimization
   - String matching for special forms (HashMap lookup)
   - No bytecode caching

---

## Performance Improvement Recommendations

### ~~Priority 1: Garbage Collection~~ ✅ **COMPLETED**

Boehm-Demers-Weiser GC has been integrated:
- Conservative collection with proven production stability
- Multi-GB heaps with efficient pause times
- No pointer tracking required

### ~~Priority 2: Eliminate Global Stack Mutex~~ ✅ **COMPLETED**

Thread-local stacks are now implemented:

```rust
thread_local! {
    static EVAL_STACK: RefCell<EvalStack> = RefCell::new(EvalStack::new());
}
```

**Result**: Eliminated mutex contention for stack operations

### Priority 3: Cons Cell Arena Allocation

**Recommendation**: Slab allocator for cons cells

```rust
pub struct ConsArena {
    slabs: Vec<Box<[Cons; 1024]>>,
    free_list: Vec<*mut Cons>,
}

impl ConsArena {
    pub fn alloc(&mut self) -> *mut Cons {
        self.free_list.pop().unwrap_or_else(|| self.new_slab())
    }
}
```

**Impact**: 5-10x improvement for list-heavy code (e.g., macro expansion)

### Priority 4: Bytecode Compiler

**Recommendation**: Compile AST to bytecode, interpret bytecode

```rust
enum Bytecode {
    LoadConst(u16),      // Push constant from pool
    LoadLocal(u16),      // Push local variable
    StoreLocal(u16),     // Pop and store to local
    Call(u8),            // Call with N args
    TailCall(u8),        // Tail call optimization
    Jump(i16),           // Unconditional jump
    JumpIfNil(i16),      // Conditional jump
    Return,
    // ...
}
```

**Impact**:
- 3-5x faster than AST interpretation
- Enables proper tail-call optimization
- Foundation for AOT compilation

### ~~Priority 5: Inline Caching for Method Dispatch~~ ✅ **COMPLETED**

Polymorphic Inline Caches (PICs) are now implemented for CLOS:

```rust
struct PICEntry {
    type_hash: u64,
    method_ptr: usize,
    hits: u32,
}

struct DispatchCache {
    entries: Vec<PICEntry>,  // max 4 entries with LRU eviction
    total_lookups: u64,
    cache_hits: u64,
}

thread_local! {
    static DISPATCH_CACHES: RefCell<HashMap<String, DispatchCache>> = ...;
}
```

**Result**: Fast path dispatch for repeated method calls on same types

---

## Compatibility Assessment

### Common Lisp Compliance

| Feature | Status | Notes |
|---------|--------|-------|
| Basic special forms | Partial | if, let, lambda, cond, typecase work; block/tagbody incomplete |
| Macros | Basic | defmacro works, backquote evaluation broken |
| CLOS | **Functional** | defclass, defgeneric, defmethod, make-instance, slot-value, class-of, typep all work with method dispatch and PICs |
| Conditions | None | No condition system |
| Packages | Basic | Symbol interning works, qualified names broken |
| Streams | Minimal | print works, file I/O incomplete |
| Format | **Working** | FORMAT with ~A, ~S, ~%, ~D, ~F directives |
| Loop | None | No LOOP macro |
| Sequences | Partial | mapcar, length, elt work |
| Hash tables | Basic | make-hash-table, gethash, setf work |

### Clasp Compatibility

| Feature | Status | Notes |
|---------|--------|-------|
| Source file loading | Partial | Many Clasp sources won't parse |
| FFI calling convention | Compatible | Same libffi approach |
| Object representation | Compatible | Same tagged pointer design |
| CLOS integration | **Partial** | Basic CLOS works; MOP not implemented |
| GC | Compatible | Same Boehm GC approach |

---

## Recommendations for Next Steps

### Completed ✅

1. ~~**Integrate Boehm GC**~~ - Essential for any real use
2. ~~**Thread-local stacks**~~ - Eliminated concurrency bottleneck
3. ~~**Basic CLOS**~~ - Generic functions with method dispatch and PICs
4. ~~**FORMAT implementation**~~ - Basic directives working

### Short-term (Remaining)

1. **Fix reader inconsistencies** - Merge to single implementation
2. **Complete backquote** - Required for macro system
3. **Add tail-call optimization** - Required for recursive CL idioms
4. **Cons cell arena allocation** - Improve list allocation performance

### Medium-term

1. **Bytecode compiler** - Performance and portability
2. **Standard method combinations** - :before, :after, :around
3. **Condition system** - Error handling infrastructure
4. **LOOP macro** - Widely used in CL code

### Long-term

1. **AOT compilation** - FASL-like compiled file format
2. **Precise GC** - Better performance than conservative
3. **Full MOP** - Metaclass customization
4. **ASDF integration** - Load standard CL libraries

---

## Conclusion

RLASP demonstrates competent Rust engineering with a solid foundation for a Common Lisp implementation. The architecture is sound, following Clasp's proven design patterns. With Boehm GC integration, thread-local stacks, and functional CLOS, the implementation can now run substantive Common Lisp programs.

**Realistic Assessment**: The project is approximately 40-50% complete for basic CL compatibility, and 15-20% complete for full ANSI Common Lisp compliance. Key milestones achieved:
- Garbage collection (Boehm GC)
- Thread-local stacks (no mutex contention)
- CLOS with method dispatch and polymorphic inline caches
- Three working execution modes (interpreter, LLVM JIT, MLIR JIT)

**Recommendation**: Focus on bytecode compilation, tail-call optimization, and the condition system. The infrastructure is now mature enough to support these additions.

**Performance Potential**: With PICs for CLOS and thread-local stacks, RLASP already achieves competitive performance for method-heavy and stack-heavy workloads. Further improvements through bytecode compilation and cons cell arena allocation will close remaining gaps with mature Lisp implementations.
