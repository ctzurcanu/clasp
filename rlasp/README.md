
# rlasp

this is a common lisp implementation in Rust that should have all clasp features

- it parses and executes common lisp
- it compiles common lisp to
  - native
  - wasm
- uses LLVM for compilation:
  - see https://deepwiki.com/clasp-developers/clasp/2-compilation-system
  - JIT execution engine 
- can do all clasp does:
  - C++ interop
- also can use CFFI by construction
- expose Rust functions

read PROGRESS.md and keep it up to date

## policy

- do not use fallbacks
- do not hardcode things
- do not use mockups
- do not implement simplified versions if we have enough knowledge about the full implementation
- do not give summaries of what was done longer than 10 tokens
- do not create documents without being requested to do so



## Files:


* **`librlasp.dylib`** — shared runtime library
* **`librlasp.a`** — static runtime library
* **`irlasp`** — interactive executable (REPL / driver)

This mirrors CLASP’s layout, and **that’s a good instinct**.

---

## What goes where (given your Rust + C ABI + LLVM IR design)

### `librlasp.(dylib|a)` — *the runtime*

This is the **heart of the system**.

It should contain:

* The **runtime system**

  * object representation
  * GC
  * thread management
  * error handling
* The **compiler front-end**

  * reader
  * macroexpander
  * AST → IR lowering
* The **LLVM IR emitter**

  * produces `.ll` or in-memory IR
* The **C ABI**

  * `rlasp_init`
  * `rlasp_eval`
  * `rlasp_compile`
  * `rlasp_load_image`
  * GC root APIs

Crucially:

> **No UI, no REPL, no filesystem policy.**

This keeps the library usable for:

* embedding
* tooling
* servers
* alternative front-ends

---

### `irlasp` — *a thin executable*

`irlasp` should be:

* a **very thin wrapper**
* linked against `librlasp`
* responsible for:

  * argument parsing
  * initializing the runtime
  * setting up IO
  * running the REPL loop

In other words:

> `irlasp` is a *client* of the runtime, not part of it.

This is *exactly* the right place to put:

* readline
* debugger UI
* startup scripts
* user experience details

---

### `librlasp.a` — static embedding

The static library enables:

* single-file executables
* embedding in environments where dynamic loading is hard
* shipping tools without runtime dependencies

But conceptually:

> it is the **same runtime** as `librlasp.dylib`.

---

## Key differences from CLASP (important!)

### 1. Your “core image” situation is different

Because you emit LLVM IR:

* you may not need a traditional Lisp “core image”
* or it may be:

  * serialized ASTs
  * serialized IR modules
  * precompiled object code

So:

* `librlasp` ≠ “engine + world loader”
* it’s more like “engine + compiler + loader”

That’s fine — just don’t force a CLASP/SBCL mental model where it doesn’t fit.

---

### 2. The ABI boundary is *real*

Unlike CLASP:

* **everything outside `librlasp` must go through the C ABI**
* even Rust code in `irlasp` should ideally use it

This discipline is what makes the design pay off long-term.

---

### 3. Naming is helpful, not cosmetic

Using:

* `librlasp`
* `irlasp`

signals:

* conceptual lineage from CLASP
* similar user expectations
* different implementation philosophy

That’s a *feature*, not a problem.

---

## What not to put in `librlasp`

This is critical.

Do **not** put in the library:

* REPL loop logic
* readline
* CLI parsing
* environment variable policy
* OS signal UI behavior

Those belong in `irlasp` or higher-level tools.


in clasp/ we have files:

- iclasp:            54 KB
- libclasp.dylib:  29.2 MB
- libclasp.a        1.1 MB


/Users/christiantzurcanu/Documents/dev/clasp/src/lisp/cscript.lisp file reveals clasp's image-building process.
The add-cclasp-sources and add-eclasp-sources functions define :cclasp and :eclasp
targets, listing all source .lisp files using the #~ reader macro for relative
paths. The koga framework's k:sources function registers these files, and then
generates Ninja build rules to compile each .lisp file and link them into a
final image. Clasp's process is clear: koga script runs, loads the :koga ASDF
system, which executes cscript.lisp files to define build targets, then
generates a build.ninja file to compile the Lisp sources and dump the final
core image. 
/Users/christiantzurcanu/Documents/dev/clasp/build/boehmprecise/lib/images/base.faso

we will have images in .ll and .bc files rather than .faso
The .bc files will be input for ORC JIT and run.
