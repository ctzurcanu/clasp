;;; Test file for modules/asdf/test/file2.lisp
;;; Tests: in-package, assert, defparameter, defvar, incf

;; Load file1 first (file2 depends on it)
(load "clisp/modules/asdf/test/file1.lisp")

;; Load the file
(load "clisp/in_work/modules/asdf/test/file2.lisp")

;; Switch to the package
(in-package :test-package)

;; Test that *file2* was defined
(if (eq *file2* t)
    (print "PASS: *file2* is T")
    (print "FAIL: *file2* is not T"))

;; Test that *f2c* was incremented from 0 to 1
(if (eq *f2c* 1)
    (print "PASS: *f2c* is 1 (incf worked)")
    (print "FAIL: *f2c* is not 1"))

(print "All tests completed for file2.lisp")
