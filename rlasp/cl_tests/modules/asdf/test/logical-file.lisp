;;; Test file for logical-file.lisp
;;; Tests: defpackage, in-package, defvar

;; Load the file
(load "clisp/in_work/modules/asdf/test/logical-file.lisp")

;; Switch to the package
(in-package :test-package)

;; Test that *logical-file* was defined
(if (eq *logical-file* t)
    (print "PASS: *logical-file* is T")
    (print "FAIL: *logical-file* is not T"))

(print "All tests completed for logical-file.lisp")
