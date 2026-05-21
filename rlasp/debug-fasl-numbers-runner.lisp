(in-package :cl-user)
(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/regression-tests/framework.lisp")
(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/regression-tests/set-unexpected-failures.lisp")
(in-package #:clasp-tests)
(clasp-tests::reset-clasp-tests)
(let ((compiled (multiple-value-list
                 (compile-file "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/debug-fasl-numbers-source.lisp"))))
  (format t "compile-values=~s~%" compiled)
  (load (first compiled)))
