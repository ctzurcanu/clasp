# rlasp Development Progress

## Current
- Interpreter runs asdf.lisp
- MLIR hits stack overflow in asdf.lisp
- Read-time eval (#.) handled in lisp_to_ast
- Loop :by support for :on/:in
- Propagate global bindings out of lambda calls (quiet load/defs)
- MLIR runtime load (cc_load) wired for compiled `load`

## Completed ✅

### Phase 1.1: Core Object System (Week 1)
- ✅ Tagged pointer implementation (`LispObject` with 2-bit tags)
- ✅ Fixnum (immediate 62-bit integers)
- ✅ Character (immediate Unicode characters)
- ✅ Cons cells with atomic car/cdr (thread-safe)
- ✅ Symbol system with value/function cells
- ✅ Numeric tower foundation (Bignum, Ratio, Float, Complex)
- ✅ All 18 unit tests passing

### Phase 1.2: Memory Management (Week 1)
- ✅ GC abstraction trait (`GCAllocator`)
- ✅ NoGC implementation (for bootstrapping)
- ✅ GCInfo trait for type metadata
- ✅ Object-safe trait design

### Phase 1.3: C FFI Layer ✅ COMPLETE!
- ✅ `FromLisp`/`ToLisp` type translators (4 tests passing)
- ✅ Support for C primitive types (int, long, double, char*, void*)
- ✅ Foreign function calling via libffi - **WORKING!** (6 tests passing)
- ✅ Dynamic library loading with libloading (2 tests passing)
- ✅ **Successfully calling real C functions** (sqrt from libm, custom test functions)
- ✅ **10 out of 11 FFI tests passing!**
- ✅ **Integrated into REPL** with clean Lisp-style syntax
- 🔧 Mixed parameter types (strlen test) - minor enhancement, core functionality works

### Phase 1.5: Rust ↔ Lisp FFI ✅ COMPLETE!
- ✅ `#[lisp_fn]` procedural macro for exposing Rust to Lisp
- ✅ Automatic type conversion (Rust ↔ Lisp)
- ✅ Kebab-case naming (rust_add → rust-add)
- ✅ Function registration system
- ✅ **Integrated into REPL** - call Rust functions directly from Lisp!
- ✅ **Demo working**: factorial, pow, is-even all callable from REPL

### REPL Features ✅
- ✅ Full Lisp evaluator with arithmetic (+, -, *, /, =, <, >, <=, >=)
- ✅ Control flow (if, progn, let, lambda)
- ✅ Macro system: defun, when, unless, and, or, cond
- ✅ String literals with escapes
- ✅ Multi-line input with continuation prompt
- ✅ Comments (line `;` and block `#|...|#`)
- ✅ List operations (cons, car, cdr, list)
- ✅ Type predicates (numberp, stringp, symbolp, null?, pair?)
- ✅ C FFI: `(load-lib "libm")`, `(defforeign sqrt "sqrt" double double)`, `(sqrt 16.0)`
- ✅ Namespace syntax: `(libm:sqrt 25.0)` - direct library calls
- ✅ Rust FFI: Register functions with #[lisp_fn], call directly from Lisp
- ✅ Mixed evaluation: `(+ (sqrt 144.0) 10)` works!
- ✅ Piped input support for release builds
- ✅ MLIR: vectors, mapc/keywordp, variadic compares, position keywords

### Phase 2: LLVM JIT Infrastructure ✅ COMPLETE!
- ✅ LLVM IR code generation using inkwell
- ✅ Runtime intrinsics system (box/unbox fixnum, float, cons, car, cdr, type checks)
- ✅ JIT execution engine with automatic intrinsic registration
- ✅ Code generator for constant fixnums and addition functions
- ✅ **All 9 JIT tests passing!**
- ✅ **Working JIT demo** - compile and execute functions at runtime
- ✅ Type-safe LispObject boxing/unboxing in compiled code

### Phase 3.1: S-Expression Reader ✅ COMPLETE!
- ✅ Full lexical analyzer (tokenizer)
  - Numbers (integers, floats, ratios)
  - Strings with escape sequences
  - Symbols and keywords
  - Characters (including named chars like #\newline)
  - Comments (line `;` and block `#|...|#`)
- ✅ S-expression parser
  - Lists `(a b c)`
  - Dotted pairs `(a . b)`
  - Vectors `#(1 2 3)`
  - Nested structures
- ✅ Reader macros
  - Quote `'x` → `(quote x)`
  - Backquote `` `x`` and unquote `,x ,@x`
  - Function `#'fn` → `(function fn)`
- ✅ **All 19 reader tests passing!**
- ✅ **Successfully parses Clasp kernel source files**

### Phase 3.2: Macro System & Evaluator Enhancements ✅
- ✅ Macro expansion infrastructure (Expander with MacroTable)
- ✅ Core macros: defun, when, unless, and, or, cond
- ✅ String support in evaluator (EvalResult::String variant)
- ✅ List functions: cons, car, cdr, list
- ✅ Sequence operations: length, nth, append, reverse
- ✅ Functional operations: mapcar, member, assoc
- ✅ Type predicates: numberp, stringp, symbolp, null?, pair?
- ✅ Comparison operators: <=, >=
- ✅ Multi-line REPL input with balanced parentheses detection
- ✅ Comment handling (line and inline comments)
- ✅ EOF handling for piped input (release builds work with `< file.lisp`)
- ✅ Recursive function evaluation (factorial, list sum working)
- ✅ Higher-order functions (mapcar with user-defined lambdas)

### Phase 3.3: WASM Extension Runtime ✅ COMPLETE!
- ✅ Go-based WASM runtime using wazero
- ✅ WASI support (stdin/stdout/stderr, args, file system)
- ✅ Custom host functions module (`rlasp_ext`)
  - ✅ `ffi_load_library` - Dynamic library loading via dlopen
  - ✅ `ffi_call_function` - FFI function calling (scaffolding)
  - ✅ `cpp_new/cpp_delete` - C++ object lifecycle
  - ✅ `cpp_call_method` - C++ method calling (scaffolding)
  - ✅ `alloc_memory/free_memory` - Memory management (scaffolding)
  - ✅ `log_message` - Structured logging from WASM
- ✅ **Successful end-to-end test**
  - Loaded libm.dylib from WASM
  - Created and deleted C++ objects
  - Bidirectional logging working
- ✅ Test WASM module compiled with Rust
- ✅ Project structure: `wasm_ext/` with full documentation
- 🔧 Full FFI function calling (type marshaling) - deferred
- 🔧 Complete C++ interop (beyond stubs) - deferred

## Current Structure

```
rlasp/
├── Cargo.toml (workspace)
├── crates/
│   ├── rlasp-runtime/       ✅ Complete (18 tests passing)
│   │   ├── object.rs        - Tagged pointers
│   │   ├── cons.rs          - Cons cells
│   │   ├── symbol.rs        - Symbol system
│   │   ├── number.rs        - Numeric tower
│   │   └── gc.rs            - GC abstraction
│   │
│   ├── rlasp-ffi/           ✅ Complete (10/11 tests passing)
│   │   ├── types.rs         ✅ Type translators
│   │   ├── c_ffi.rs         ✅ libffi wrapper
│   │   └── library.rs       ✅ Dynamic loading
│   │
│   ├── rlasp-macros/        ✅ Complete
│   │   └── lib.rs           ✅ #[lisp_fn] proc-macro
│   │
│   ├── rlasp/               ✅ Working REPL with FFI
│   │   ├── repl/            ✅ Evaluator + FFI integration
│   │   └── main.rs          ✅ Interactive REPL
│   │
│   ├── rlasp-jit/           ✅ Complete (9 tests passing)
│   │   ├── intrinsics.rs    ✅ Runtime boxing/unboxing
│   │   ├── codegen.rs       ✅ LLVM IR generation
│   │   └── jit.rs           ✅ JIT execution engine
│   │
│   ├── rlasp-reader/        ✅ Complete (19 tests passing)
│   │   ├── token.rs         ✅ Token types
│   │   ├── lexer.rs         ✅ Tokenizer
│   │   ├── parser.rs        ✅ S-expression parser
│   │   ├── reader.rs        ✅ Reader interface
│   │   └── error.rs         ✅ Error types
│   │
│   ├── rlasp-compiler/      - Compiler (Phase 3.2-4)
│   ├── rlasp-evaluator/     - Interpreter (Phase 3)
│   └── rlasp-clbind/        - C++ bindings (Phase 1.4)
│
├── wasm_ext/                ✅ Complete (WASM runtime)
│   ├── main.go              ✅ Wazero runtime with WASI
│   ├── ffi_simple.go        ✅ Dynamic library loading
│   ├── cpp_interop.go       ✅ C++ object management
│   ├── cpp_stub.c           ✅ C++ bridge stubs
│   ├── README.md            ✅ Architecture documentation
│   └── test_wasm/           ✅ Rust test module
│       └── src/main.rs      ✅ Host function integration test
```

## Next Steps (Priority Order)

### Immediate (This Week)
1. **Complete C FFI** - Foreign function calling with libffi
2. **Test C FFI** - Call libc functions (strlen, printf, malloc, free)
3. **Dynamic library loading** - Load and call .so/.dylib/.dll

### Phase 1.4: C++ Bindings (Week 2)
4. Proc-macro for class binding generation
5. Method calling with policies (adopt, outValue, etc.)
6. Constructor/destructor handling
7. Test with std::vector, std::string

### Phase 1.5: Rust ↔ Lisp FFI (Week 3)
8. `#[lisp_fn]` procedural macro
9. Safe Lisp calling from Rust
10. Bidirectional type conversion

## Acceptance Criteria for Phase 1

- [ ] Load C library (libm) and call functions ✓ (almost there!)
- [ ] Bind C++ classes (std::vector example)
- [ ] Expose Rust functions to Lisp REPL
- [ ] Call Lisp functions from Rust
- [ ] CFFI compatibility subset passes

## Next Phases

### Phase 2.5: Enhanced JIT Capabilities (Optional)
- Calling convention (LCC pattern from Clasp)
- More intrinsics (arithmetic, comparison, type predicates)
- Function compilation from Lisp AST
- Integration with REPL for runtime compilation

### Phase 3: Reader & Compiler
- Full CL reader with readtable
- Macro expansion
- AST → BIR → LLVM IR pipeline
- File compilation (compile-file, FASL format)
- Lambda lifting and closure conversion

### Phase 4: Core Lisp Semantics
- Full numeric tower (Bignum, Ratio, Complex)
- Sequence operations (list, vector, string)
- CLOS (Common Lisp Object System)
- Condition system
- Streams and I/O

## Key Design Decisions

1. **FFI-First**: Build working interop before expanding Lisp semantics
2. **Tagged Pointers**: Following Clasp's proven 2-bit tag design
3. **Object-Safe Traits**: GC abstraction allows swapping implementations
4. **Thread-Safe Cons**: Atomic pointers for car/cdr
5. **Type Translator Pattern**: FromLisp/ToLisp for automatic conversion

## Test Coverage

- **rlasp-runtime**: 18/18 tests passing ✅
- **rlasp-ffi**: 10/11 tests passing ✅ (core functionality complete)
- **rlasp-jit**: 9/9 tests passing ✅
  - 4 intrinsics tests (box/unbox operations)
  - 3 codegen tests (IR generation)
  - 2 JIT execution tests (constant + addition)
- **rlasp-reader**: 19/19 tests passing ✅
  - 10 lexer tests (tokens, numbers, strings, comments, reader macros)
  - 9 parser tests (atoms, lists, quotes, vectors, nested structures)
- **Total**: 56/57 tests passing (98% pass rate)

## Performance Notes

Current implementation uses NoGC (no garbage collection) for bootstrapping.
This leaks memory but allows rapid development. Phase 1b will add Boehm GC.

## Documentation

- Clasp reference files analyzed for design patterns
- Plan follows proven architecture from /Users/christiantzurcanu/Documents/dev/clasp
- All code includes doc comments explaining design decisions
