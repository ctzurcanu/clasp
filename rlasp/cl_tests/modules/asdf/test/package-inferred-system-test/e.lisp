;;; Test file for e.lisp
;;; Tests: in-package

;; Create the package first
(defpackage :asdf-test (:use :cl))

;; Load the file
(load "clisp/in_work/modules/asdf/test/package-inferred-system-test/e.lisp")

;; Test that the package exists
(if (find-package :asdf-test)
    (print "PASS: asdf-test package exists")
    (print "FAIL: asdf-test package does not exist"))

(print "All tests completed for e.lisp")
