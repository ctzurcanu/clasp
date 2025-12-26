# Stack-Based Calling Convention Migration

## Overview

This document tracks the migration from the current tagged i64 calling convention to a uniform stack-based calling convention using rlasp's two-stack architecture.

## Two-Stack Architecture

rlasp uses a dual-stack design for efficient type-safe operations:

### Type Stack
- Array of 4-byte entries
- Each entry: 2 bytes type_tag + 2 bytes length
- Fixed-size entries allow easy addressing
- Types: Fixnum, Pointer, Nil, T, etc.

### Value Stack
- Array of raw bytes
- Variable-length data
- Length specified in corresponding type stack entry

## Calling Convention

### Fixed-Arity Functions
```mlir
func.func @function_name() {
  // Access arguments from global stacks
  // Push result to stack
  return
}
```

### Variadic Functions
```mlir
func.func @function_name(%count: i64) {
  // Pop %count arguments from stack
  // Push result to stack
  return
}
```

### Stack Operations
All functions use these runtime operations:
- `stack_push_fixnum(i64)` - Push fixnum to stack
- `stack_push_pointer(i64)` - Push pointer to stack
- `stack_push_nil()` - Push nil to stack
- `stack_pop_fixnum() -> i64` - Pop fixnum from stack
- `stack_pop_pointer() -> i64` - Pop pointer from stack
- `stack_depth() -> i64` - Get current stack depth
- `stack_clear()` - Clear the stack

## Migration Status

### ✅ Completed

1. **Stack Infrastructure** (`crates/rlasp-runtime/src/eval_stack.rs`)
   - Global evaluation stack with type/value separation
   - C ABI functions for MLIR integration
   - Push/pop operations for all types

2. **Stack-Based MLIR Codegen** (`crates/rlasp-mlir/src/lib_stack.rs`)
   - Complete rewrite of code generator
   - All AST nodes handled (some with stubs)
   - Implemented features:
     - Arithmetic: +, -, *, /
     - Comparisons: <, >, =, <=, >=
     - List operations: cons, car, cdr, list
     - Control flow: if, progn, cond, block
     - I/O: print, format
     - CLOS: make-instance, slot-value
   - All tests passing

3. **Runtime Declarations** (`crates/rlasp-mlir/runtime-decls.mlir`)
   - Stack operation declarations added
   - Legacy runtime functions preserved for compatibility

### 🚧 In Progress

4. **Documentation**
   - This migration guide
   - Code examples needed
   - Architecture diagrams needed

### ⏳ Pending

5. **Runtime Intrinsics Migration** (`crates/rlasp-jit/src/intrinsics*.rs`)
   - ~100+ runtime functions need conversion
   - Current: `cc_cons(i64, i64) -> i64`
   - Target: `cc_cons()` - pops 2 args, pushes result
   - Files to update:
     - `intrinsics.rs` - core operations
     - `intrinsics_clos.rs` - CLOS operations
     - `intrinsics_io.rs` - I/O operations
     - etc.

6. **JIT Engine Updates** (`crates/rlasp-jit/src/*.rs`)
   - Update function registration for stack convention
   - Modify execution engine for global stacks
   - Update symbol resolution

7. **Interpreter Integration**
   - Switch from `MLIRCodegen` to `StackMLIRCodegen`
   - Update `irlasp/src/main.rs` line 540
   - May need compatibility layer during transition

8. **Testing**
   - Unit tests for all runtime intrinsics
   - Integration tests for full programs
   - Performance benchmarks
   - Verify all existing tests still pass

## Examples

### Before (Tagged i64)
```mlir
func.func @add(%a: i64, %b: i64) -> i64 {
  %result = func.call @cc_add(%a, %b) : (i64, i64) -> i64
  return %result : i64
}
```

### After (Stack-based)
```mlir
func.func @add() {
  // Arguments already on stack (pushed by caller)
  %right = func.call @stack_pop_fixnum() : () -> i64
  %left = func.call @stack_pop_fixnum() : () -> i64

  // Perform operation
  %result = arith.addi %left, %right : i64

  // Push result to stack
  func.call @stack_push_fixnum(%result) : (i64) -> ()
  return
}
```

### Example: cons operation
```mlir
// Before
func.func @user_code() -> i64 {
  %a = ...
  %b = ...
  %result = func.call @cc_cons(%a, %b) : (i64, i64) -> i64
  return %result : i64
}

// After
func.func @user_code() {
  // Push arguments
  func.call @stack_push_pointer(%a) : (i64) -> ()
  func.call @stack_push_pointer(%b) : (i64) -> ()

  // Call cons (pops args, pushes result)
  func.call @cc_cons() : () -> ()

  // Result is on stack
  return
}
```

## Next Steps

1. **Start with Core Runtime Functions**
   - Begin with arithmetic: cc_add, cc_sub, cc_mul, cc_div
   - Update signatures to `() -> ()`
   - Add stack pop/push logic

2. **Update List Operations**
   - cc_cons, cc_car, cc_cdr
   - Already have stack-based MLIR generation
   - Need matching runtime implementation

3. **Gradually Convert Remaining Functions**
   - Group by category (I/O, CLOS, arrays, etc.)
   - Test each group before moving to next
   - Keep old versions for rollback if needed

4. **Integration Testing**
   - Test simple programs first
   - Gradually increase complexity
   - Compare output with old implementation

5. **Performance Validation**
   - Benchmark critical paths
   - Optimize stack operations if needed
   - May need inline stack ops for hot paths

## Files Modified

### Created
- `crates/rlasp-runtime/src/eval_stack.rs` (240 lines)
- `crates/rlasp-mlir/src/lib_stack.rs` (830+ lines)
- `crates/rlasp-mlir/tests/test_stack_codegen.rs` (tests)

### Modified
- `crates/rlasp-runtime/src/lib.rs` (added eval_stack module)
- `crates/rlasp-mlir/src/lib.rs` (added lib_stack module)
- `crates/rlasp-mlir/runtime-decls.mlir` (added stack declarations)

### To Modify
- `crates/rlasp-jit/src/intrinsics*.rs` (all runtime functions)
- `crates/rlasp-jit/src/lib.rs` (JIT engine)
- `crates/irlasp/src/main.rs` (switch to StackMLIRCodegen)
- Many more...

## Estimated Effort

- Runtime intrinsics: ~1-2 days (100+ functions)
- JIT engine updates: ~0.5-1 day
- Integration and testing: ~1-2 days
- Bug fixes and polish: ~1 day

**Total: ~4-6 days of focused work**

## Notes

- Current implementation keeps both old and new codegen
- Can switch with minimal changes (one line in main.rs)
- May want feature flag for gradual rollout
- Consider keeping old system for compatibility mode
