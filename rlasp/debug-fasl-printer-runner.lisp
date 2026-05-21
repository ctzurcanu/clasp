(in-package :cl-user)
(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/regression-tests/framework.lisp")
(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/regression-tests/set-unexpected-failures.lisp")
(in-package #:clasp-tests)
(clasp-tests::reset-clasp-tests)
(clasp-tests::message :emph "~%Running printer01 suite...")
(let ((suite-file "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/regression-tests/printer01.lisp"))
  (handler-case
      (multiple-value-bind (fasl warnings-p failure-p)
          (compile-file suite-file)
        (declare (ignore warnings-p failure-p))
        (when fasl
          (load fasl)))
    (error (e)
      (clasp-tests::note-compile-error (list suite-file e))
      (clasp-tests::message
       :err
       "Regression: compile-file of ~a failed with ~a"
       suite-file
       e))))
(clasp-tests::show-test-summary)
