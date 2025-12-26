;;; Test file for modules/asdf/test/file3.lisp
;;; Tests: defpackage, in-package, defparameter

;; Load the file
(load "clisp/in_work/modules/asdf/test/file3.lisp")

;; Switch to the package
(in-package :test-package)

;; Test that *file3* was defined and has value T
(if (eq *file3* t)
    (print "PASS: *file3* is T")
    (print "FAIL: *file3* is not T"))

;; Test reading the variable
(print *file3*)

(print "All tests completed for file3.lisp")
