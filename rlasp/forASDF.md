
# Full Common Lisp Compatibility for ASDF Integration

## Goal

 Enable loading standard CL libraries via ASDF by fixing parser edge cases, cleaning up debug output, and
 implementing missing CL features.

 ---
 Phase 1: Parser/Reader Fixes

 1.1 Fix String Representation

 - File: crates/rlasp-reader/src/parser.rs (lines 88-95)
 - Issue: Strings created as symbols with quote markers
 - Fix: Use RString::allocate() instead of Symbol::allocate()

 1.2 Fix Vector Type

 - File: crates/rlasp-reader/src/parser.rs (lines 570-594)
 - Issue: Vectors as (vector ...) tagged lists
 - Fix: Create proper RVector type in runtime, use in parser

 1.3 Feature Conditionals #+/#-

 - Files: crates/rlasp-reader/src/parser.rs (lines 197-218), crates/rlasp/src/repl/eval_core.rs
 - Issue: Always assumes features absent
 - Fix:
   - Create *features* with (:RLASP :COMMON-LISP :ANSI-CL)
   - Parse feature expressions (and ...), (or ...), (not ...)
   - Conditionally include/skip forms

 1.4 Uninterned Symbols #:

 - Files: crates/rlasp-reader/src/parser.rs (lines 229-247), crates/rlasp-runtime/src/symbol.rs
 - Fix: Add Symbol::allocate_uninterned() that bypasses symbol table

 1.5 Circular References #n=/#n#

 - File: crates/rlasp-reader/src/parser.rs (lines 321-349)
 - Fix: Add label_map: HashMap<u8, LispObject> to Parser, store/retrieve labels

 1.6 Read-time Eval #.

 - File: crates/rlasp-reader/src/parser.rs (lines 220-227)
 - Fix: Parse form, evaluate in minimal environment, return result

 ---
 Phase 2: Backquote/Unquote Evaluation

 - File: crates/rlasp/src/repl/eval_core.rs (lines 779-930)
 - Issue: Just creates (backquote expr) without proper expansion
 - Fix: Rewrite expand_backquote() to handle:
   - `x → (quote x)
   - `(a ,b c) → (list 'a b 'c)
   - `(a ,@b c) → (append (list 'a) b (list 'c))
   - Nested backquotes

 ---
 Phase 3: Debug Output Cleanup

 | File                                    | Count | Action                           |
 |-----------------------------------------|-------|----------------------------------|
 | crates/rlasp-mlir/src/lib_stack.rs      | 14    | Wrap in #[cfg(debug_assertions)] |
 | crates/rlasp-jit/src/intrinsics_clos.rs | 3     | Wrap in #[cfg(debug_assertions)] |
 | crates/rlasp/src/repl/eval_core.rs      | 1     | Wrap in #[cfg(debug_assertions)] |

 ---
 Phase 4: Missing Special Forms

 4.1 eval-when

 - File: crates/rlasp/src/repl/eval_control.rs (lines 892-907)
 - Fix: Parse :compile-toplevel, :load-toplevel, :execute situations

 4.2 loop Macro (ASDF uses extensively)

 - File: Create crates/rlasp/src/repl/eval_loop.rs
 - Implement: for, as, with, collect, append, sum, while, until, return, finally
 - Estimated: 500-800 LOC

 4.3 multiple-value-bind / destructuring-bind

 - File: crates/rlasp/src/repl/eval_control.rs
 - Implement: Pattern matching with &optional, &rest, &key

 4.4 catch/throw

 - File: crates/rlasp/src/repl/eval_control.rs
 - Implement: Thread-local catch tag stack, tag matching with eq

 4.5 handler-case / handler-bind

 - File: Create crates/rlasp/src/repl/eval_conditions.rs
 - Implement: Condition hierarchy, handler establishment, signal/error/warn

 4.6 unwind-protect

 - File: crates/rlasp/src/repl/eval_control.rs (line 2219)
 - Implement: Execute cleanup forms on normal/abnormal exit

 ---
 Phase 5: Missing Library Functions

 5.1 Hash Table Extensions

 - File: crates/rlasp/src/repl/eval_system.rs
 - Add: maphash, hash-table-keys, hash-table-values

 5.2 Full format Directives

 - File: crates/rlasp/src/repl/eval_io.rs
 - Add: ~{...~} (iteration), ~[...~] (conditional), ~R, ~*, ~?

 5.3 compile-file / load Infrastructure

 - File: Create crates/rlasp/src/repl/eval_compile.rs
 - Add: *load-truename*, *load-pathname*, *compile-file-pathname*

 5.4 Logical Pathnames

 - File: crates/rlasp/src/repl/eval_pathname.rs
 - Add: translate-logical-pathname, logical pathname host table

 5.5 Package System Extensions

 - File: crates/rlasp/src/repl/eval_package.rs
 - Add: define-package, package-shadowing-symbols, local nicknames

 ---
 Phase 6: ASDF Integration Testing

 1. Load UIOP: clisp/in_work/modules/asdf/uiop/package.lisp
 2. Load ASDF core: clisp/in_work/modules/asdf/header.lisp
 3. Test: (asdf:load-system :test-system)

 ---
 Dependency Order

 Phase 1 (Reader) → Phase 2 (Backquote) → Phase 4 (Special Forms) → Phase 5 (Library) → Phase 6 (ASDF)
                                       ↘
                          Phase 3 (Debug Cleanup) - can run in parallel

 Estimated Total: ~3,500 LOC


   Completed Parser/Reader Fixes:
  - Vector type: #(1 2 3) now creates proper RVector objects (not (vector 1 2 3) lists)
  - Feature conditionals: #+rlasp form now works with features :RLASP, :COMMON-LISP, :ANSI-CL, :IEEE-FLOATING-POINT, :UNIX. Supports (and ...), (or ...), (not ...) expressions
  - Uninterned symbols: #:foo now creates truly uninterned symbols (with is_interned flag)
  - Circular references: #1=(a b #1#) now properly stores/retrieves labeled expressions

  Debug Output Cleanup:
  - All eprintln!("DEBUG...") calls wrapped in debug_println! macro that only prints in debug builds (14 in lib_stack.rs, 3 in intrinsics_clos.rs, 1 in eval_core.rs)

  Deferred (needs evaluator updates):
  - String representation: RString support added to parser but reverted - evaluator doesn't handle RString objects yet
  - Read-time eval (#.): needs evaluator integration
  - Backquote evaluation: needs evaluator rewrite

  Still needed for ASDF:
  - eval-when, loop, catch/throw, handler-case, unwind-protect
  - Hash table extensions, full format directives, compile-file/load, logical pathnames

  