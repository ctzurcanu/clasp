(in-package :cl-user)

;; Dedicated regression runner for irlasp (interpreter and MLIR modes).
;; Uses local regression-tests files under in_work.

(defparameter *runner-dir*
  #P"/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/regression-tests/")

(load (merge-pathnames #P"framework.lisp" *runner-dir*))
(load (merge-pathnames #P"set-unexpected-failures.lisp" *runner-dir*))

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

(let* ((requested (or (ext:getenv "TEST_SUITES") ""))
       (requested-suites (unless (string= requested "")
                           (core:split requested ","))))
  (loop for suite in *irlasp-suites*
        when (or (null requested-suites)
                 (member suite requested-suites :test #'equal))
          do (message :emph "~%Running ~a suite..." suite)
             (load-if-compiled-correctly
              (merge-pathnames (make-pathname :name suite :type "lisp")
                               *runner-dir*))))

(show-test-summary)
(sys:quit 0)
