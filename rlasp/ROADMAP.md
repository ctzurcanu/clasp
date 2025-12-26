# Roadmap to Clasp Source Compatibility

**Goal**: rlasp can ingest, execute, and compile Clasp Lisp sources to native and WASM targets.

## Current Status ✅

- ✅ Core object system (tagged pointers, cons, symbols)
- ✅ C/Rust FFI (libffi integration)
- ✅ LLVM JIT infrastructure (inkwell)
- ✅ Basic REPL with evaluator

## Critical Path to Clasp Compatibility

### Phase 3: S-Expression Reader (Week 1-2)
**Goal**: Parse Clasp source files into AST

#### 3.1: Basic Reader
- [ ] Tokenizer/lexer
  - Numbers (integers, floats, ratios, complex)
  - Strings with escape sequences
  - Symbols and keywords
  - Comments (`;` and `#|...|#`)
- [ ] S-expression parser
  - Lists `(a b c)`
  - Dotted pairs `(a . b)`
  - Vectors `#(1 2 3)`
  - Arrays `#2A((1 2) (3 4))`
- [ ] Reader macros
  - Quote `'x` → `(quote x)`
  - Backquote `` `x`` and unquote `,x`
  - Function `#'fn` → `(function fn)`
  - Character `#\a`, `#\newline`

**Deliverable**: `(read)` function that parses Clasp source
**Tests**: Read Clasp source files from `/Users/christiantzurcanu/Documents/dev/clasp/src/lisp/kernel/lsp/`

#### 3.2: Readtable & Packages
- [ ] Readtable implementation
  - Macro characters
  - Dispatch macro characters
  - Reader customization
- [ ] Package system basics
  - `defpackage`, `in-package`
  - Symbol interning
  - Package-qualified symbols `pkg:sym`, `pkg::sym`
  - `use-package`, `export`, `import`

**Deliverable**: Read Clasp kernel files with correct package context
**Tests**: Parse `kernel/lsp/foundation.lsp`

---

### Phase 4: Compiler Pipeline (Week 3-6)

#### 4.1: AST Representation
- [ ] Define AST nodes for all special forms
  - `quote`, `if`, `progn`, `let`, `let*`, `flet`, `labels`
  - `setq`, `function`, `lambda`
  - `block`, `return-from`, `tagbody`, `go`
  - `catch`, `throw`, `unwind-protect`
  - `multiple-value-call`, `multiple-value-prog1`
- [ ] AST validation pass
- [ ] Pretty-printer for debugging

**Deliverable**: AST structure that represents all Clasp special forms

#### 4.2: Macro Expansion
- [ ] Macro definition storage
- [ ] `macroexpand-1` and `macroexpand`
- [ ] Compiler macro support
- [ ] Symbol macros (`symbol-macrolet`)
- [ ] Bootstrap core macros
  - `defun`, `defmacro`, `defvar`, `defparameter`
  - `and`, `or`, `cond`, `when`, `unless`
  - `do`, `do*`, `dotimes`, `dolist`
  - `destructuring-bind`

**Deliverable**: Expand Clasp macros to primitive special forms
**Tests**: Macroexpand Clasp utility functions

#### 4.3: Semantic Analysis
- [ ] Symbol resolution (lexical vs special)
- [ ] Closure analysis (free variables)
- [ ] Optimize tail calls
- [ ] Type inference (basic)
- [ ] Dead code elimination

**Deliverable**: Analyzed AST ready for code generation

#### 4.4: BIR (Backend IR)
Following Clasp's design:
- [ ] Define BIR instruction set
  - Function calls
  - Variable access (local/closure/global)
  - Conditional branches
  - Loops and jumps
  - Multiple values
- [ ] AST → BIR lowering pass
- [ ] BIR optimization passes

**Deliverable**: BIR representation for compiled functions

#### 4.5: LLVM Code Generation
- [ ] Extend existing codegen for all special forms
- [ ] Calling convention (LCC from Clasp)
  - Multiple return values
  - Dynamic extent
  - Unwind handling
- [ ] Closure compilation
  - Closure object layout
  - Environment capture
- [ ] Intrinsics for all primitives
  - Arithmetic (+, -, *, /, etc.)
  - Comparisons (=, <, >, etc.)
  - Type predicates (consp, symbolp, etc.)
  - Car/cdr and sequence ops

**Deliverable**: Generate LLVM IR for arbitrary Lisp functions
**Tests**: Compile and run simple Clasp functions

---

### Phase 5: Runtime System (Week 7-10)

#### 5.1: Complete Object System
- [ ] Strings (with Unicode support)
- [ ] Vectors (adjustable, fill-pointer)
- [ ] Hash tables
- [ ] Arrays (multi-dimensional)
- [ ] Pathnames
- [ ] Streams (file, string, broadcast, etc.)

#### 5.2: Numeric Tower
- [ ] Bignum (arbitrary precision integers)
  - Use GMP or num-bigint
- [ ] Ratio (rational numbers)
- [ ] Float (single, double)
- [ ] Complex numbers
- [ ] Generic arithmetic
  - Automatic type coercion
  - Contagion rules

#### 5.3: Sequence Operations
- [ ] List functions
  - `car`, `cdr`, `nth`, `nthcdr`, `last`
  - `append`, `reverse`, `nreverse`
  - `mapcar`, `mapc`, `mapcan`
  - `member`, `assoc`, `subst`
- [ ] Vector functions
  - `aref`, `svref`, `vector-pop`, `vector-push`
- [ ] Generic sequences
  - `elt`, `length`, `subseq`
  - `find`, `position`, `count`
  - `remove`, `substitute`
  - `sort`, `stable-sort`

#### 5.4: Core Functions
- [ ] Function calling
  - `apply`, `funcall`
  - `values`, `multiple-value-bind`
- [ ] Control flow
  - `loop` macro (full CLtL2 spec)
  - `map`, `reduce`
- [ ] I/O
  - `read`, `print`, `write`
  - `format` (basic subset)
  - File operations
- [ ] Error handling
  - `error`, `cerror`, `warn`
  - `handler-case`, `handler-bind`
  - `restart-case`, `restart-bind`

**Deliverable**: Runtime sufficient to run basic Clasp library code

---

### Phase 6: CLOS (Week 11-14)

#### 6.1: Object Model
- [ ] Class definition (`defclass`)
- [ ] Slot access
- [ ] Instance creation (`make-instance`)
- [ ] Class hierarchy

#### 6.2: Generic Functions
- [ ] `defgeneric`, `defmethod`
- [ ] Method combination
  - Standard combination
  - `:before`, `:after`, `:around`
- [ ] Method dispatch
  - Single dispatch
  - Multiple dispatch
  - Effective method computation

#### 6.3: MOP (Metaobject Protocol)
- [ ] Basic MOP support
  - Class metaobjects
  - Generic function metaobjects
- [ ] Introspection

**Deliverable**: CLOS support sufficient for Clasp kernel
**Tests**: Run Clasp's CLOS-dependent code

---

### Phase 7: AOT Compilation (Week 15-16)

#### 7.1: FASL Format
- [ ] Define compiled file format
  - Code section (LLVM bitcode or object)
  - Data section (constants, strings)
  - Metadata (exports, dependencies)
- [ ] `compile-file` implementation
- [ ] `load` for compiled files
- [ ] Incremental compilation

#### 7.2: Native Binary Generation
- [ ] Link compiled code
- [ ] Embed runtime
- [ ] Standalone executable generation
- [ ] Shared library generation

**Deliverable**: `compile-file` produces native code
**Tests**: Compile and load Clasp kernel modules

---

### Phase 8: WASM Target (Week 17-20)

#### 8.1: WASM Code Generation
- [ ] LLVM → WASM backend
  - Use LLVM's wasm32 target
  - Configure for web or WASI
- [ ] WASM-specific runtime
  - Memory management
  - GC integration (WasmGC)
- [ ] Import/export functions

#### 8.2: JavaScript Interop
- [ ] JS FFI (similar to C FFI)
  - Call JS functions from Lisp
  - Expose Lisp functions to JS
- [ ] DOM manipulation primitives
- [ ] Promise/async support

#### 8.3: WASI Support
- [ ] File system access
- [ ] Environment variables
- [ ] Command-line arguments
- [ ] Standard I/O

**Deliverable**: Compile Clasp code to WASM
**Tests**: Run Clasp programs in browser and Node.js

---

## Clasp Source Compatibility Milestones

### Milestone 1: Bootstrap (Phase 3-4)
**Can compile**: Simple utility functions from `kernel/lsp/foundation.lsp`
- Pure functions without dependencies
- Basic macros like `defun`, `defmacro`

### Milestone 2: Kernel (Phase 5)
**Can compile**: Core kernel modules
- `kernel/lsp/foundation.lsp`
- `kernel/lsp/sequence.lsp`
- `kernel/lsp/predlib.lsp`

### Milestone 3: CLOS (Phase 6)
**Can compile**: Object-oriented code
- `kernel/clos/`
- Class definitions
- Generic functions

### Milestone 4: Full System (Phase 7-8)
**Can compile**: Entire Clasp source tree
- Generate native executables
- Generate WASM modules
- Self-hosting capability

---

## Architecture Decisions

### 1. Compilation Strategy
- **Hybrid**: Interpreter for development, compiler for production
- **JIT**: Use LLVM JIT for REPL
- **AOT**: Compile to native for deployment
- **WASM**: Compile to WASM for web

### 2. Calling Convention
Follow Clasp's LCC (Lisp Calling Convention):
- Multiple return values via stack
- Dynamic extent allocation
- Exception handling integration
- GC integration points

### 3. Memory Management
- **Phase 1**: NoGC (current - leaks but simple)
- **Phase 2**: Boehm GC (conservative GC)
- **Phase 3**: Custom GC (generational, concurrent)
- **WASM**: WasmGC integration

### 4. Compatibility Layer
Maintain compatibility with Clasp:
- Same object layout where possible
- Compatible FFI (can call Clasp C++ libraries)
- Compatible FASL format (can load Clasp compiled files)

---

## Performance Targets

### Compilation Speed
- **Read**: 100K+ s-expressions/sec
- **Macroexpand**: 50K+ forms/sec
- **Compile**: 10K+ functions/sec
- **JIT**: < 1ms per function

### Runtime Performance
- **Target**: 50-80% of Clasp performance
- **Arithmetic**: Within 2x of native
- **Allocation**: < 100ns per cons
- **Function call**: < 20ns overhead
- **WASM**: Within 30% of native WASM

---

## Testing Strategy

### Unit Tests
- Each phase has comprehensive unit tests
- Target: 90%+ code coverage

### Integration Tests
- Compile and run Clasp source files
- Compare output with reference Clasp

### Benchmark Suite
- Gabriel benchmarks
- CL-bench
- Custom Clasp-specific benchmarks

### Regression Tests
- Test suite runs on every commit
- Performance regression detection

---

## Development Timeline (Aggressive)

| Phase | Duration | Completion |
|-------|----------|------------|
| Phase 3: Reader | 2 weeks | Week 2 |
| Phase 4: Compiler | 4 weeks | Week 6 |
| Phase 5: Runtime | 4 weeks | Week 10 |
| Phase 6: CLOS | 4 weeks | Week 14 |
| Phase 7: AOT | 2 weeks | Week 16 |
| Phase 8: WASM | 4 weeks | Week 20 |
| **Total** | **20 weeks** | **~5 months** |

### Realistic Timeline (with buffer)
- **Optimistic**: 5 months (working full-time)
- **Realistic**: 8-10 months (accounting for unknowns)
- **Conservative**: 12 months (part-time or complex issues)

---

## Risks & Mitigation

### Technical Risks
1. **LLVM complexity** - Mitigate: Study Clasp's codegen closely
2. **CLOS implementation** - Mitigate: Start simple, iterate
3. **WASM limitations** - Mitigate: Use WASI, WasmGC when needed
4. **Performance** - Mitigate: Profile early, optimize incrementally

### Scope Risks
1. **Feature creep** - Mitigate: Strict milestone focus
2. **Compatibility edge cases** - Mitigate: Test with real Clasp code early
3. **Time estimates** - Mitigate: Build in 50% buffer

---

## Success Criteria

### Phase 3-4: Can read and compile
```lisp
(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))
```

### Phase 5: Can run kernel code
```lisp
(load "kernel/lsp/foundation.lsp")
(compile-file "kernel/lsp/foundation.lsp")
```

### Phase 6: Can use CLOS
```lisp
(defclass point ()
  ((x :accessor point-x :initarg :x)
   (y :accessor point-y :initarg :y)))

(defmethod distance ((p point))
  (sqrt (+ (expt (point-x p) 2)
           (expt (point-y p) 2))))
```

### Phase 7-8: Can deploy
```bash
# Native
rlasp compile-file myapp.lisp -o myapp
./myapp

# WASM
rlasp compile-file myapp.lisp --target wasm -o myapp.wasm
node myapp.wasm
```

---

## Next Immediate Steps

1. **Start Phase 3.1**: Implement basic reader
   - Create `rlasp-reader` crate
   - Implement tokenizer
   - Implement s-expression parser
   - Test with simple Clasp files

2. **Set up test infrastructure**
   - Clone Clasp sources as test data
   - Create integration test harness
   - Set up CI/CD

3. **Study Clasp architecture**
   - Read Clasp compiler source
   - Document calling conventions
   - Document object layouts

Would you like me to start implementing Phase 3.1 (the reader)?
