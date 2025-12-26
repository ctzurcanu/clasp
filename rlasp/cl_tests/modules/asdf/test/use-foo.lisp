;;; Test file for modules/asdf/test/use-foo.lisp
;;; Tests: defun calling another function

;; Create the package and define foo
(defpackage :asdf-test/deferred-warnings (:use :cl))
(in-package :asdf-test/deferred-warnings)
(defun foo (x) (+ x 10))

;; Load the file
(load "clisp/in_work/modules/asdf/test/use-foo.lisp")

;; Test use-foo which calls foo
(if (eq (use-foo 5) 15)
    (print "PASS: (use-foo 5) = 15")
    (print "FAIL: (use-foo 5) != 15"))

(if (eq (use-foo 20) 30)
    (print "PASS: (use-foo 20) = 30")
    (print "FAIL: (use-foo 20) != 30"))

(print "All tests completed for use-foo.lisp")
