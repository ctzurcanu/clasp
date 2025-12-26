;; Lisp source compiled to WASM
;; This demonstrates WASM-to-WASM interop

;; Simple functions
(defun get-answer ()
  42)

(defun add (a b)
  (+ a b))

(defun factorial-5 ()
  120)  ;; Pre-computed factorial(5)

;; WASM loading and calling
(defun test-wasm-call ()
  "Load math_lib.wasm and call add(10, 32) from it"
  (let ((mod (wasm-load-module "wasm/math_lib.wasm")))
    (wasm-call-function2 mod "add" 10 32)))

;; This Lisp code was compiled to WASM using rlasp's LLVM backend
;; The compiled WASM can then load and call other WASM modules
