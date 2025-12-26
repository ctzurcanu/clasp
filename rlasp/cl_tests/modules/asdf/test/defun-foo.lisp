;;; Test file for modules/asdf/test/defun-foo.lisp
;;; Tests: defun, in-package, 1+

;; Create the package
(defpackage :asdf-test/deferred-warnings (:use :cl))

;; Load the file
(load "clisp/in_work/modules/asdf/test/defun-foo.lisp")

;; Switch to package
(in-package :asdf-test/deferred-warnings)

;; Test the function
(if (eq (foo 5) 6)
    (print "PASS: (foo 5) = 6")
    (print "FAIL: (foo 5) != 6"))

(if (eq (foo 10) 11)
    (print "PASS: (foo 10) = 11")
    (print "FAIL: (foo 10) != 11"))

(print "All tests completed for defun-foo.lisp")
