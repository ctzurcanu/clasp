# Common Lisp in the CLI — Additional Expressivity & Functionality

Commands starting with `(` are evaluated by a Common Lisp interpreter.
Everything else goes to bash. Below is what this unlocks beyond a normal shell.

---

## 1. Exact / Arbitrary-Precision Arithmetic

Bash and most shells truncate or lose precision. CL does not.

```lisp
(/ 5564 7)          ; => 5564/7  (exact rational, not 0.79...)
(/ 1 3)             ; => 1/3
(expt 2 128)        ; => 340282366920938463463374607431768211456  (bignum)
(* 123456789 987654321) ; exact, no overflow
```

---

## 2. Rational & Complex Number Arithmetic

```lisp
(+ 1/3 1/6)         ; => 1/2
(* #C(1 2) #C(3 4)) ; => #C(-5 10)  complex multiplication
(sqrt -1)           ; => #C(0 1.0)
```

---

## 3. Symbolic / Algebraic Manipulation

Variables and expressions remain symbolic until evaluated:

```lisp
(let ((x 'width) (y 'height)) (list '* x y))
; => (* WIDTH HEIGHT)
```

Build and eval code at runtime — essentially a programmable pipeline.

---

## 4. First-Class Functions & Higher-Order Programming

```lisp
(mapcar #'(lambda (x) (* x x)) '(1 2 3 4 5))
; => (1 4 9 16 25)

(reduce #'+ '(1 2 3 4 5))   ; => 15
(remove-if #'oddp '(1 2 3 4 5)) ; => (2 4)
```

Compose, curry, and pipeline data without temporary files or `xargs`.

---

## 5. Persistent State Within the Session

The CL image stays live. You can define variables and functions once and reuse them across subsequent `(...)` commands in the same session:

```lisp
(defparameter *root* "/Users/me/project")
; later:
(merge-pathnames "src/main.lisp" *root*)
```

No need to re-export shell variables or source files.

---

## 6. Macros — Code That Writes Code

```lisp
(defmacro while (condition &body body)
  `(loop while ,condition do ,@body))

(let ((n 5))
  (while (> n 0) (print n) (decf n)))
```

Extend the language itself. No equivalent in bash.

---

## 7. Rich Data Structures

| Structure     | Example                                       |
|---------------|-----------------------------------------------|
| List / tree   | `'(a (b c) (d (e f)))`                       |
| Hash table    | `(make-hash-table :test #'equal)`            |
| Struct        | `(defstruct point x y)`                      |
| Vector        | `#(1 2 3)`                                   |
| Association list | `'((key1 . val1) (key2 . val2))`          |

---

## 8. String Processing (Beyond grep/sed)

```lisp
(string-upcase "hello world")
(subseq "ensemble" 3 7)          ; => "embl"
(search "sem" "ensemble")        ; => 2  (position)
(format nil "~{~a~^, ~}" '(a b c)) ; => "A, B, C"
```

`format` alone replaces many `printf`/`awk` one-liners.

---

## 9. Advanced Looping — `loop` and `iterate`

```lisp
(loop for i from 1 to 10
      when (evenp i) collect i)
; => (2 4 6 8 10)

(loop for (k . v) in '((a . 1)(b . 2))
      summing v)
; => 3
```

Declarative, readable, no `for`/`while`/`awk` gymnastics.

---

## 10. Condition & Restart System

CL's error handling is restartable — you can handle an error and *resume* execution at any point, not just abort:

```lisp
(handler-case
  (error "oops")
  (error (c) (format t "Caught: ~a" c)))
```

Useful for robust scripting that tolerates partial failures.

---

## 11. Multiple Return Values

```lisp
(floor 17 5)        ; => 3, 2  (quotient AND remainder simultaneously)
(values 'a 'b 'c)
(multiple-value-bind (q r) (floor 17 5)
  (format t "~a remainder ~a" q r))
```

No need for temporary files or parsing combined output strings.

---

## 12. Compile-Time Computation (`eval-when`)

Run arbitrary computations at macro-expansion / compile time. Generate lookup tables, validate configs, or pre-compute constants before the "script" runs.

---

## 13. Pattern Matching via Destructuring

```lisp
(destructuring-bind (a b &rest rest) '(1 2 3 4 5)
  (list a b rest))
; => (1 2 (3 4 5))
```

Unpack nested structures in one step.

---

## 14. CLOS — Object System in the Shell

Define classes, methods, and generic dispatch interactively:

```lisp
(defclass file-entry ()
  ((path :initarg :path :reader entry-path)
   (size :initarg :size :reader entry-size)))

(defmethod describe-entry ((e file-entry))
  (format t "~a (~a bytes)" (entry-path e) (entry-size e)))
```

Model complex domains without switching to a "real" program.

---

## 15. Tail-Call-Friendly Recursion & Tree Walking

Process deeply nested data (JSON-like trees, ASTs, file hierarchies) recursively without stack overflow concerns on implementations that support TCO.

---

## 16. Read/Eval/Print — Any Lisp S-Expression Is Data

```lisp
(read-from-string "(+ 1 2 3)")  ; parses to a list
(eval (read-from-string "(+ 1 2 3)")) ; => 6
```

Parse, inspect, and run code-as-data. No external parser needed.

---

## 17. Interop with the OS via Bash Boundary

Keep heavy lifting in bash (file I/O, git, curl) and do all the **computation and data transformation** in CL. The two modes complement each other:

```
# bash
FILES=$(git diff --name-only)

# CL — count, filter, classify
(remove-if-not (lambda (f) (search ".lisp" f)) *file-list*)
```

---

# OS-Level Powers — via rlasp's Native Interop Layer

rlasp is built on Rust with a layered FFI stack. The notes below distinguish
what is **tested and working** in the current release binary from what is
**implemented in source but not yet wired** (a one-line fix away) vs. what is
**planned / future**.

Legend: ✓ tested working | ⚠ code exists, gating bug | ✗ not yet implemented

---

## 18. Environment & Process — Working Today

These extension builtins are live in the current binary:

```lisp
(getenv "HOME")      ; => "/Users/me"        ✓ tested
(getenv "PATH")      ; => full PATH string   ✓ tested
(getenv "USER")      ; => "christiantzurcanu" ✓ tested
(argc)               ; => 2  (arg count)     ✓ tested
(argv)               ; => NIL / list         ✓ tested
```

No subprocess, no `$()` capture — the OS environment is a first-class Lisp
value.

---

## 19. Raw Foreign Memory — Working Today

Allocate, write, and read raw C memory blocks from the REPL:

```lisp
; Allocate 8 bytes of unmanaged C memory
(let ((p (%foreign-alloc 8)))
  (%mem-set p :int 99)        ; write 99 at offset 0   ✓
  (%mem-set p :int 42 4)      ; write 42 at offset 4   ✓
  (print (%mem-ref p :int 0)) ; => 99                  ✓
  (print (%mem-ref p :int 4)) ; => 42                  ✓
  (%foreign-free p))

; Query C ABI type sizes
(%foreign-type-size :int)      ; => 4   ✓
(%foreign-type-size :pointer)  ; => 8   ✓
```

This is direct heap access — the same pointer you would pass to a C function.

---

## 20. Sort Native Memory with C's qsort — Working Today

`%foreign-funcall` supports `qsort` for in-place C integer array sorting:

```lisp
(let ((p (%foreign-alloc 16)))
  (%mem-set p :int 4)          ; [4, 3, 2, 1]
  (%mem-set p :int 3 4)
  (%mem-set p :int 2 8)
  (%mem-set p :int 1 12)
  (%foreign-funcall "qsort" :pointer p :int 4 :int 4 :int)
  (print (list (%mem-ref p :int 0)   ; => (1 2 3 4)   ✓
               (%mem-ref p :int 4)
               (%mem-ref p :int 8)
               (%mem-ref p :int 12)))
  (%foreign-free p))
```

Additional tested `%foreign-funcall` entries now available:

```lisp
(%foreign-funcall "getpid" :int)                         ; => current PID  ✓
(%foreign-funcall "strlen" :string "abcdef" :int)       ; => 6            ✓
(%foreign-funcall "open" :string "/etc/hosts" :int 0 :int) ; => fd        ✓
```

Supported today: `qsort`, `getpid`, `strlen`, `malloc`, `free`, `open`, `close`,
`read`, `write`.

---

## 21. Compile Lisp to LLVM IR and Link with C/C++ Objects — Working Today

```bash
rlasp-compile algo.lisp algo.ll     # emits standard LLVM IR  ✓ tested
llc algo.ll -o algo.o               # LLVM → object file
clang algo.o libfoo.a -o algo       # link with any C/C++ library
```

The IR declares standard `cc_box_fixnum` / `cc_unbox_fixnum` / `cc_box_float`
intrinsics and can be linked against any LLVM-compatible object file.

---

## 22. MLIR JIT — Working Today

```bash
irlasp --mode mlir script.lisp      # compiles and runs via MLIR + ORC JIT  ✓
```

```lisp
(* 6 7)   ; compiled to MLIR, JIT-executed → 42  ✓ tested
```

LLVM JIT mode (`--mode llir`) generates IR correctly but ORC JIT execution
currently requires `cc_apply` to be linked — works for AOT, not yet live REPL.

---

## 23. `load-lib` / `defforeign` — Working Today

`load-lib` and `defforeign` are now wired and callable from the CLI:

```lisp
(load-lib "libm")
(defforeign c-sqrt "sqrt" double double)
(c-sqrt 2.0)     ; => 1.4142135623730951  ✓

(load-lib "libc")
(defforeign c-getpid "getpid" int)
(c-getpid)       ; => current PID         ✓
```

`defforeign` type parsing accepts CL-style aliases (`:int`, `:double`,
`long-long`, `unsigned-char`, `ptr`, etc.).
The full `ForeignType` bridge supports: i8–i64, u8–u64, f32, f64, pointer, void.

---

## 24. Expose Rust Functions to Lisp — Runtime Capability ✓

Rust native functions can now be registered at runtime through C ABI:

```c
int rlasp_register_rust_fn(RlaspRuntime *rt, const char *name, RlaspRustFn fn);
int rlasp_load_rust_plugin(RlaspRuntime *rt, const char *plugin_path);
```

Once registered, the function is callable from Lisp by symbol name:

```lisp
(native-add 7 8)  ; => 15
```

---

## 25. Embed rlasp as a C Library — Implemented ✓

`c_api.rs` defines a clean C ABI for embedding:

```c
RlaspRuntime *rt = rlasp_init();
char *result;
rlasp_eval(rt, "(+ 1 2)", &result);   // "3"
rlasp_eval_file(rt, "config.lisp", &result);         // file path or source string
rlasp_compile(rt, "input.lisp", "output.fasl");      // compile-file API
rlasp_load_image(rt, "output.fasl");                 // load compiled image
rlasp_free_string(result);
```

Public header is available at `include/rlasp.h`.

---

## 26. C++ Object Lifecycle — Implemented ✓

Lisp-side object lifecycle is wired to native C++ shims:

```lisp
(setq o (cpp-new "test-class" 10 "abc"))
(cpp-call-method o "set-value" 25)
(cpp-call-method o "add" 7)        ; => 32
(cpp-delete o)                     ; => T

(setq v1 (cpp-new "vector" 3.0 4.0))
(cpp-call-method v1 "length")      ; => 5.0
```

Supported classes in the current runtime bridge: `test-class`, `vector`.

---

## 27. OS Command Catalog (Structured By Library / Functionality / Function)

This section is the canonical inventory of OS-facing capabilities exposed by `irlasp`.
It is grouped by library namespace, functionality, and specific function.

### 27.1 Environment, CWD, Process Metadata

| Library / Namespace | Functionality | Function(s) | Example |
|---------------------|---------------|-------------|---------|
| `CL/EXT` | Environment variable read | `getenv`, `ext:getenv`, `sb-ext:posix-getenv` | `(getenv "HOME")` |
| `SB-POSIX` | Environment variable write/delete | `sb-posix:setenv`, `sb-posix:unsetenv` | `(sb-posix:setenv "X" "42")` |
| `SB-UNIX` | Current working directory | `sb-unix:posix-getcwd/` | `(sb-unix:posix-getcwd/)` |
| `SB-POSIX` | Change current directory | `sb-posix:chdir` | `(sb-posix:chdir "/tmp")` |
| `SI/EXT` | CLI argument count/access | `si:argc`, `ext:argc`, `argc`, `si:argv`, `ext:argv`, `argv` | `(argv 0)` |
| `EXT` | Hostname/DNS resolution | `get-host-by-name` | `(get-host-by-name "localhost")` |
| `ASDF` | System registration/lookup | `asdf:defsystem`, `find-system`, `asdf:load-system`, `asdf:load-asd` | `(find-system :my-system :if-does-not-exist nil)` |
| `CL` | Host/platform metadata | `machine-type`, `machine-version`, `machine-instance`, `software-type`, `software-version`, `user-homedir-pathname` | `(software-type)` |
| `CL` | Time/sleep | `sleep`, `get-universal-time`, `get-internal-real-time`, `get-internal-run-time` | `(sleep 0.01)` |

### 27.2 Filesystem Pathname API

| Library / Namespace | Functionality | Function(s) | Example |
|---------------------|---------------|-------------|---------|
| `CL PATHNAME` | Pathname construction/recognition | `pathname`, `pathnamep`, `make-pathname`, `parse-namestring`, `merge-pathnames` | `(pathname "/tmp/a.txt")` |
| `CL PATHNAME` | Pathname components | `pathname-name`, `pathname-type`, `pathname-directory`, `pathname-host`, `pathname-device`, `pathname-version` | `(pathname-type "/tmp/a.txt")` |
| `CL PATHNAME` | Namestring conversions | `namestring`, `file-namestring`, `directory-namestring`, `host-namestring`, `enough-namestring` | `(namestring (pathname "/tmp/a.txt"))` |
| `CL PATHNAME` | File existence/identity | `probe-file`, `truename`, `resolve-symlinks`, `truenamize` | `(probe-file "/tmp/a.txt")` |
| `CL PATHNAME` | Directory listing/creation | `directory`, `ensure-directories-exist` | `(directory "/tmp/")` |
| `CL PATHNAME` | File metadata | `file-length`, `file-position`, `file-write-date`, `file-author` | `(file-write-date "/tmp/a.txt")` |
| `CL PATHNAME` | File mutation | `delete-file`, `rename-file` | `(rename-file "/tmp/a.txt" "/tmp/b.txt")` |
| `CL PATHNAME` | Logical pathname support | `translate-logical-pathname`, `logical-pathname`, `logical-pathname-translations`, `setf-logical-pathname-translations` | `(translate-logical-pathname "SYS:foo;bar.lisp")` |
| `CL PATHNAME` | Wildcard/pathname predicates | `wild-pathname-p`, `pathname-match-p`, `translate-pathname` | `(wild-pathname-p "/tmp/*.lisp")` |

### 27.3 Stream & File I/O

| Library / Namespace | Functionality | Function(s) | Example |
|---------------------|---------------|-------------|---------|
| `CL I/O` | Open/close files | `open`, `close`, `with-open-file` | `(with-open-file (s "/tmp/x.txt" :direction :output :if-exists :supersede :if-does-not-exist :create) (write-line "ok" s))` |
| `CL I/O` | Read operations | `read`, `read-char`, `read-byte`, `read-line`, `peek-char`, `unread-char` | `(read-line s nil nil)` |
| `CL I/O` | Write operations | `write`, `write-char`, `write-byte`, `write-string`, `write-line`, `prin1`, `princ`, `print`, `pprint` | `(write-string "abc" s)` |
| `CL I/O` | String streams | `make-string-input-stream`, `make-string-output-stream`, `get-output-stream-string`, `with-input-from-string`, `with-output-to-string` | `(get-output-stream-string (make-string-output-stream))` |
| `CL I/O` | Composite streams | `make-broadcast-stream`, `make-concatenated-stream`, `make-two-way-stream`, `make-echo-stream`, `make-synonym-stream` | `(make-broadcast-stream *standard-output*)` |
| `CL I/O` | Stream state/position | `listen`, `clear-input`, `finish-output`, `force-output`, `clear-output`, `file-position`, `file-length`, `file-string-length`, `stream-external-format` | `(file-position s)` |

### 27.4 Process Execution API

| Library / Namespace | Functionality | Function(s) | Example |
|---------------------|---------------|-------------|---------|
| `EXT` | Exec-like process start | `ext:vfork-execvp` | `(ext:vfork-execvp '("/bin/echo" "hello"))` |
| `EXT` | Process orchestration | `ext:run-program` | `(ext:run-program "/bin/sh" '("-c" "echo hello world") :output :stream)` |
| `EXT` | Process wait/status | `ext:external-process-wait` | `(ext:external-process-wait proc)` |
| `EXT` | Process stderr stream | `ext:external-process-error-stream` | `(ext:external-process-error-stream proc)` |

### 27.5 Dynamic Foreign Library Calls (Named Functions)

| Library / Namespace | Functionality | Function(s) | Example |
|---------------------|---------------|-------------|---------|
| `FFI bridge` | Dynamic library load | `load-lib`, `load-library`, `gpu:load-library` | `(load-lib "libm")` |
| `FFI bridge` | Foreign function declaration | `defforeign`, `gpu:defforeign` | `(defforeign c-sqrt "sqrt" double double)` |
| `FFI bridge` | Invoke declared symbol | user-defined symbol created by `defforeign` | `(c-sqrt 2.0)` |

### 27.6 Raw Foreign Memory & Syscall Surface

| Library / Namespace | Functionality | Function(s) | Example |
|---------------------|---------------|-------------|---------|
| `clasp-ffi` | Raw memory alloc/free | `%foreign-alloc`, `%foreign-free`, `%foreign-type-size` | `(%foreign-alloc 64)` |
| `clasp-ffi` | Memory read/write | `%mem-set`, `%mem-ref` | `(%mem-set p :int 42 0)` |
| `cffi compat` | Convenience wrappers | `foreign-alloc`, `foreign-free`, `mem-ref`, `mem-aref`, `defcfun`, `defcallback`, `with-foreign-object`, `with-foreign-objects`, `callback` | `(foreign-alloc :int :count 8)` |
| `clasp-ffi` | Foreign call dispatcher | `%foreign-funcall` | `(%foreign-funcall "getpid" :int)` |

`%foreign-funcall` currently supports these OS/libc entry points directly:

`qsort`, `getpid`, `open`, `close`, `read`, `write`, `strlen`, `malloc`, `free`, `signal`, `sigaction`, `raise`, `kill`, `mmap`, `munmap`, `mprotect`, `msync`, `ptrace`.

Example syscalls:

```lisp
(%foreign-funcall "getpid" :int)
(%foreign-funcall "open" :string "/etc/hosts" :int 0 :int)
(%foreign-funcall "kill" :int (%foreign-funcall "getpid" :int) :int 0 :int)
```

### 27.7 Async Socket & Thread Runtime

| Library / Namespace | Functionality | Function(s) | Example |
|---------------------|---------------|-------------|---------|
| `async` | Cooperative scheduling helpers | `async:sleep-ms`, `async:yield` | `(async:sleep-ms 10)` |
| `async` | TCP socket operations | `async:tcp-connect`, `async:tcp-send`, `async:tcp-recv`, `async:tcp-close` | `(setq s (async:tcp-connect "127.0.0.1" 8080))` |
| `usocket` | Stream socket descriptors | `usocket::make-stream-socket`, `socket-bind`, `socket-listen` | `(setq s (socket-listen (socket-bind (usocket::make-stream-socket) "127.0.0.1" 0) 16))` |
| `serve-event` | FD handler registration | `serve-event::add-fd-handler` | `(serve-event::add-fd-handler 0 :input (lambda () nil))` |
| `mp` | Thread/process lifecycle | `mp:make-process`, `mp:process-run-function`, `mp:process-join`, `mp:destroy-process`, `mp:all-processes`, `mp:current-process`, `mp:process-name`, `mp:process-active-p` | `(mp:process-run-function "w" (lambda () 1))` |
| `bordeaux-threads` (BT) | Thread lifecycle compatibility | `make-thread`, `join-thread`, `destroy-thread`, `interrupt-thread`, `thread-alive-p`, `thread-name`, `current-thread`, `all-threads` | `(bordeaux-threads:join-thread (bordeaux-threads:make-thread (lambda () 42)))` |
| `bordeaux-threads` (BT) | Lock compatibility | `make-lock`, `make-recursive-lock`, `acquire-lock`, `release-lock`, `with-lock-held` | `(bordeaux-threads:with-lock-held (lk) :ok)` |
| `bordeaux-threads` (BT) | Yield compatibility | `thread-yield` | `(bordeaux-threads:thread-yield)` |
| `bordeaux-threads` (BT) | Condition variable compatibility | `make-condition-variable`, `condition-wait`, `condition-notify`, `condition-broadcast` | `(bordeaux-threads:condition-notify cv)` |
| `bordeaux-threads` (BT) | Semaphore compatibility | `make-semaphore`, `wait-on-semaphore`, `signal-semaphore` | `(bordeaux-threads:wait-on-semaphore sem :timeout 0)` |

### 27.7.1 Bordeaux-Threads Coverage/Status

Implemented and covered in `/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/async/bordeaux_threads.lisp`:

| Namespace | Function |
|-----------|----------|
| `bordeaux-threads` | `make-thread` |
| `bordeaux-threads` | `join-thread` |
| `bordeaux-threads` | `destroy-thread` |
| `bordeaux-threads` | `interrupt-thread` |
| `bordeaux-threads` | `thread-alive-p` |
| `bordeaux-threads` | `thread-name` |
| `bordeaux-threads` | `current-thread` |
| `bordeaux-threads` | `all-threads` |
| `bordeaux-threads` | `make-lock` |
| `bordeaux-threads` | `make-recursive-lock` |
| `bordeaux-threads` | `acquire-lock` |
| `bordeaux-threads` | `release-lock` |
| `bordeaux-threads` | `with-lock-held` |
| `bordeaux-threads` | `thread-yield` |
| `bordeaux-threads` | `make-condition-variable` |
| `bordeaux-threads` | `condition-wait` |
| `bordeaux-threads` | `condition-notify` |
| `bordeaux-threads` | `condition-broadcast` |
| `bordeaux-threads` | `make-semaphore` |
| `bordeaux-threads` | `wait-on-semaphore` |
| `bordeaux-threads` | `signal-semaphore` |

### 27.8 Native Extension APIs (Non-Lisp, For Embedding)

| API Surface | Functionality | Function(s) |
|-------------|---------------|-------------|
| C ABI (`include/rlasp.h`) | Runtime lifecycle | `rlasp_init`, `rlasp_shutdown` |
| C ABI (`include/rlasp.h`) | Eval/load/compile | `rlasp_eval`, `rlasp_eval_file`, `rlasp_compile`, `rlasp_load_image` |
| C ABI (`include/rlasp.h`) | Runtime native registration | `rlasp_register_rust_fn`, `rlasp_load_rust_plugin` |
| Lisp C++ bridge | Object lifecycle interop | `cpp-new`, `cpp-call-method`, `cpp-delete` |

### 27.9 Coverage Test Directory (OS Command Surface)

Coverage suite path:

`/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/`

Included suites:

- `env/env_process.lisp`
- `fs/pathname_fs.lisp`
- `io/streams_io.lisp`
- `process/run_program.lisp`
- `ffi/ffi_syscalls.lisp`
- `async/async_threads.lisp`
- `async/bordeaux_threads.lisp`
- `network/socket_host.lisp`

Timed runner:

```bash
/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/run_os_command_coverage.sh
```

By default it runs `interpreter` and `mlir`, and prints adjacent timing columns:
`TEST_FILE | MODE | RC | TIME_S | STATUS`.

Latest OS coverage snapshot:
- `TOTAL 16 PASSED 16 FAILED 0`
- log dir: `/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/logs/20260303-131529/`

---

# Compiler

This gives the native artifact flexibility you asked for (static, dynamic, exe) with explicit timing columns.

```
/Users/christiantzurcanu/Documents/dev/clasp/rlasp/scripts/mlirbc_aot.sh \
  /tmp/your_module.mlirbc \
  --kinds all \
  --out-dir /tmp/mlir-aot-your_module \
  --csv /tmp/mlir-aot-tests.csv
```



---

## Summary Table (Tested Results)

| Capability                       | Bash | Python | rlasp CL         |
|----------------------------------|------|--------|------------------|
| Exact rationals                  | ✗    | ✗      | ✓ tested         |
| Bignums                          | ✗    | ✓      | ✓ tested         |
| First-class functions / mapcar   | ~    | ✓      | ✓ tested         |
| Persistent session state         | ~    | ✓      | ✓ tested         |
| Macros (defmacro)                | ✗    | ✗      | ✓ tested         |
| CLOS (defclass/make-instance)    | ✗    | ✓      | ✓ tested         |
| Condition system (handler-case)  | ✗    | ~      | ✓ tested         |
| Multiple return values           | ✗    | ~      | ✓ tested         |
| Destructuring-bind               | ✗    | ✗      | ✓ tested         |
| Read/eval string                 | ✗    | ✓      | ✓ tested         |
| getenv (live OS value)           | ~    | ✓      | ✓ tested         |
| Raw C memory alloc/read/write    | ✗    | ✗      | ✓ tested         |
| Typed foreign memory (:int64/:double/:byte) | ✗ | ✗ | ✓ tested |
| C-style struct layout helpers (`%foreign-struct-size`, `%foreign-struct-offsetof`) | ✗ | ~ctypes | ✓ tested |
| qsort on C memory                | ✗    | ✗      | ✓ tested         |
| libc calls via `%foreign-funcall` (`open/read/write/strlen/getpid/malloc/free`) | ✗ | ~ctypes | ✓ tested |
| VM/OS calls via `%foreign-funcall` (`mmap/munmap/mprotect/msync/ptrace`) | ✗ | ~ctypes | ✓ tested |
| Signal primitives via `%foreign-funcall` (`signal`,`sigaction`,`raise`,`kill`) | ✗ | ~signal | ✓ tested |
| Condition restarts (`restart-case`,`invoke-restart`,`find-restart`,`compute-restarts`) | ✗ | ✗ | ✓ tested |
| LOOP macro expansion/execution (`for/collect/sum/append/count/finally/return`) | ✗ | ✗ | ✓ tested |
| Compile Lisp → LLVM IR           | ✗    | ✗      | ✓ tested         |
| MLIR JIT execution               | ✗    | ✗      | ✓ tested         |
| `load-lib` + `defforeign` dynamic FFI | ✗ | ~cffi | ✓ tested |
| CFFI compatibility (`defcfun`,`defcallback`,`with-foreign-object(s)`,`foreign-alloc :count`,`mem-ref/mem-aref`,`setf` on mem refs) | ✗ | ~cffi | ✓ tested |
| Bordeaux-Threads compatibility (`threads`,`locks`,`condition vars`,`semaphores`,`thread-yield`) | ✗ | ~threading | ✓ tested |
| Async bridge (`spawn/await/sleep-ms/yield` + `tcp-connect/send/recv/close`) | ✗ | ~asyncio | ✓ tested |
| `FORMAT` user directives (`~/.../`) | ✗ | ~formatters | ✓ tested |
| `clang:ast-dump-json` API | ✗ | ~libclang bindings | ✓ tested |
| GPU C-ABI bridge (`gpu:load-library`,`gpu:defforeign`) | ✗ | ~ctypes/cffi | ✓ tested |
| MOP dependent protocol (`add/remove/map/update-dependent`) | ✗ | ✗ | ✓ tested |
| Expose Rust fns to REPL          | ✗    | ✗      | ✓ tested         |
| C++ object lifecycle             | ✗    | ✗      | ✓ tested         |
| Embed as C library               | ✗    | ~      | ✓ tested         |




## What irlasp Could Offer Next (Gaps & Opportunities)


