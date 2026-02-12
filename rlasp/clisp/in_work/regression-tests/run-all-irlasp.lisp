(in-package :cl-user)

;; Dedicated regression runner for irlasp (interpreter and MLIR modes).
;; Uses local regression-tests files under in_work.

(defparameter *runner-dir*
  "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/regression-tests/")

(load (concatenate 'string *runner-dir* "framework.lisp"))
(load (concatenate 'string *runner-dir* "set-unexpected-failures.lisp"))

(in-package #:clasp-tests)

(reset-clasp-tests)

(defparameter *irlasp-suites*
  '("defcallback-native"
    "lowlevel"
    "fastgf"
    "array0"
    "tests01"
    "finalizers"
    "strings01"
    "cons01"
    "sequences01"
    "clos"
    "mop"
    "update-instance-abort"
    "numbers"
    "ehkiller"
    "package"
    "structures"
    "symbol0"
    "string-comparison0"
    "bit-array0"
    "bit-array1"
    "character0"
    "unicode"
    "hash-tables0"
    "misc"
    "read01"
    "printer01"
    "streams01"
    "environment01"
    "types01"
    "control01"
    "iteration"
    "loop"
    "numbers-core"
    "unwind"
    "encodings"
    "environment"
    "conditions"
    "float-features"
    "debug"
    "mp"
    "interrupt"
    "posix"
    "btb"
    "system-construction"
    "extensions"
    "run-program"
    "snapshot"))

(let ((requested (or (ext:getenv "TEST_SUITES") "")))
  ;; Regression harness invokes this runner one suite at a time.
  ;; Keeping execution on a single concrete suite path avoids MLIR
  ;; failures in complex top-level suite selection forms.
  (if (string= requested "")
      (progn
        (message :err "TEST_SUITES is required for run-all-irlasp.lisp")
        (sys:quit 2))
      (progn
        (message :emph "~%Running ~a suite..." requested)
        (load-if-compiled-correctly
         (concatenate 'string *runner-dir* requested ".lisp")))))

(show-test-summary)
(sys:quit 0)
