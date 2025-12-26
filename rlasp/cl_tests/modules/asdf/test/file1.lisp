;;; Test file for modules/asdf/test/file1.lisp
;;; Tests: defpackage, in-package, defparameter

;; Load the file
(load "clisp/in_work/modules/asdf/test/file1.lisp")

;; Switch to the package
(in-package :test-package)

;; Test that *file1* was defined and has value T
(if (eq *file1* t)
    (print "PASS: *file1* is T")
    (print "FAIL: *file1* is not T"))

;; Test reading the variable
(print *file1*)

;; Test that we're in the right package
(if (find-package :test-package)
    (print "PASS: test-package exists")
    (print "FAIL: test-package does not exist"))

(print "All tests completed for file1.lisp")
