# rlasp-mlir: MLIR-based Lisp Compiler

## Overview

This crate provides an MLIR (Multi-Level Intermediate Representation) backend for compiling Lisp code. MLIR offers significant advantages over direct LLVM IR generation for dynamic languages like Lisp.

## Why MLIR?

The original LLVM IR-based JIT compiler faced several critical issues:

### Problem 1: Local Functions (flet/labels)
**Issue**: Functions defined in `flet` or `labels` forms were not visible when called, causing "Unsupported function: g" errors.

**LLVM IR Challenge**:
- Functions must be declared before use
- Complex scoping rules for nested functions
- Difficult to handle mutual recursion in `labels`

**MLIR Solution**:
- Generate all local functions as module-level functions with unique mangled names
- All functions are visible from the start
- Simple name mapping handles scoping

Example:
```lisp
(labels ((g (y) (+ y 1)))
  (g 10))
```

Generates:
```mlir
func.func @local_g_0(%arg: i64) -> i64 {
  %0 = arith.constant 1 : i64
  %1 = arith.addi %arg, %0 : i64
  func.return %1 : i64
}
```

### Problem 2: Dynamic Method Parameters (defmethod)
**Issue**: Parameters with type specifications like `((p point))` weren't being extracted correctly, causing "Undefined variable: p" errors.

**MLIR Solution**:
- All values are uniformly typed as `i64` (tagged pointers)
- Type information is handled at runtime, not compile time
- Parameters are just SSA values

### Problem 3: Variable Scoping
**Issue**: Variables in nested scopes (like `let` inside `handler-case`) weren't accessible.

**MLIR Solution**:
- Clean SSA-based value flow
- Explicit symbol table management
- No ambiguity about variable lifetime

## Architecture

```
Lisp AST → MLIR Text → MLIR Binary → LLVM IR → Machine Code
```

1. **MLIR Text Generation**: Convert Lisp AST to MLIR text format
2. **MLIR Optimization**: Use MLIR passes for high-level optimizations
3. **LLVM Lowering**: Convert optimized MLIR to LLVM IR
4. **Code Generation**: LLVM generates machine code

## Key Features

### Dynamic Typing
All Lisp values are represented as `i64` (tagged pointers):
- Fixnums: Direct integer values with tag bits
- Floats: Bitcast to i64
- Pointers: Tagged heap pointers

### Function Representation
- Module-level functions for all defuns
- Local functions with mangled names for flet/labels
- Uniform calling convention via `func.call`

### SSA Form
- Clean value flow with SSA (Static Single Assignment)
- No mutable variables in generated code
- Easy to optimize

## Usage

```rust
use rlasp_mlir::MLIRCodegen;
use rlasp::ir::{ASTNode, ConstantValue};

let mut codegen = MLIRCodegen::new("my_module");

// Define a function: (defun add-one (x) (+ x 1))
let body = ASTNode::Call {
    function: Box::new(ASTNode::Variable("+".to_string())),
    args: vec![
        ASTNode::Variable("x".to_string()),
        ASTNode::Constant(ConstantValue::Fixnum(1)),
    ],
};

codegen.compile_function("add_one", &["x".to_string()], &body).unwrap();

let mlir = codegen.finalize();
println!("{}", mlir);
```

## Comparison: LLVM IR vs MLIR

| Feature | LLVM IR | MLIR |
|---------|---------|------|
| **Local Functions** | Complex, requires nested modules or function pointers | Simple, module-level with name mangling |
| **Dynamic Types** | Must specify types explicitly, type mismatches cause errors | Uniform i64 type, runtime type handling |
| **Variable Scoping** | Manual alloca/load/store management | SSA values with symbol table |
| **Optimization** | Low-level only | Multi-level (high + low) |
| **Debugging** | Verbose, hard to read | Clean, readable syntax |

## Future Work

- [ ] Implement closures and lexical capture
- [ ] Add MLIR optimization passes
- [ ] Integrate with LLVM backend for execution
- [ ] Support for continuations and call/cc
- [ ] CLOS (Common Lisp Object System) integration

## Testing

Run examples:
```bash
cargo run -p rlasp-mlir --example basic
cargo run -p rlasp-mlir --example flet_labels
```

Run tests:
```bash
cargo test -p rlasp-mlir
```

## References

- [MLIR Documentation](https://mlir.llvm.org/)
- [MLIR Dialects](https://mlir.llvm.org/docs/Dialects/)
- [Common Lisp Specification](http://www.lispworks.com/documentation/HyperSpec/Front/index.htm)
