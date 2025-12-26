# Common Lisp Kernel Tests

Tests for kernel/lsp functions moved to production.

## Running Tests

Tests should be run by concatenating the source file with the test file:

```bash
cat clisp/kernel/lsp/<filename>.lisp cl_tests/kernel/lsp/<filename>.lisp | ./target/release/rlasp
```

## Test Status

### ✅ Fully Tested and Passing

- **foundation.lisp** - 8/8 functions (100%)
  - Functions: 1-, 1+, constantly, tailp, ldiff, adjoin, sublis, nsublis
  - Run: `cat clisp/kernel/lsp/foundation.lisp cl_tests/kernel/lsp/foundation.lisp | ./target/release/rlasp`

- **util.lisp** - 3/3 functions (100%)
  - Functions: nconc, tailp, ldiff
  - Run: `cat clisp/kernel/lsp/util.lisp cl_tests/kernel/lsp/util.lisp | ./target/release/rlasp`

**Total: 2 files, 11 functions, 100% tested**

## Files Remaining

57 files in `clisp/in_work/kernel/lsp/` awaiting implementation of required features

## Implemented Features

- **coerce-fdesignator** - Converts function designators to functions
- All other standard features (complement, labels, flet) already existed

## Rules

- **DO NOT MODIFY** source .lisp files - they must work AS THEY ARE
- Implement missing built-in functions to make files work
- Test ALL functions in a file before marking it complete
