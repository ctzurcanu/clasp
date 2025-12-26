# Common Lisp Tests for rlasp

This directory contains test files for all Common Lisp code in the `clisp/` directory.

## Structure

The test directory structure mirrors the `clisp/` directory structure:
- `clisp/kernel/lsp/util.lisp` → `cl_tests/kernel/lsp/util-test.lisp`

## Test Requirements

Every function defined in a `.lisp` file in `clisp/` must have at least one test in the corresponding `-test.lisp` file in `cl_tests/`.

## Running Tests

Currently, tests can be run by loading the test file in the rlasp REPL:

```lisp
(load "cl_tests/kernel/lsp/util-test.lisp")
(run-all-util-tests)
```

## Test Format

Each test file should:
1. Define simplified versions of functions if the full implementation requires unimplemented features
2. Provide at least one test per function
3. Include a `run-all-*-tests` function that executes all tests
4. Use the `test-equal` helper for assertions

## Current Status

### kernel/lsp/util.lisp
- **tailp**: Simplified version working, 5 tests
- **nconc**: Simplified version (2 lists only), 4 tests
- **ldiff**: Simplified version, 4 tests

The full implementations in `clisp/kernel/lsp/util.lisp` require these unimplemented features:
- `&rest` - variable arguments
- `do` and `do*` - loop macros
- `rplacd` - destructive cdr modification
- `last` - get last cons cell
- `atom` - test if not cons
- `eql` - equality predicate
- `return` - non-local exit from loop
- `unless` - conditional macro

## Adding New Tests

When moving a new `.lisp` file from `clisp/in_work/` to `clisp/`, create a corresponding test file:

1. Create the test file in the mirrored directory structure
2. Identify all `defun` forms in the source file
3. Write at least one test for each function
4. If the function uses unimplemented features, write a simplified version
5. Document what features are needed for the full implementation


## JIT: MLIR generation

make all benchmarks be run correctly (with the correct result) from
/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/tests/ using JIT
DO NOT use stubs, mocks, hardcoded helpers: only full implementation
begin with /Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/tests/benchmark-feat.lisp

../target/release/irlasp -m mlir tests/benchmark-feat.lisp