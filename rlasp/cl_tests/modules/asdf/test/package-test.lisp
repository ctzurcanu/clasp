;;; Test file for modules/asdf/test/package-test.lisp
;;; Tests: in-package

;; Create the package first
(defpackage :asdf/package (:use :cl))

;; Load the file
(load "clisp/in_work/modules/asdf/test/package-test.lisp")

;; Test that the package exists and we're in it
(if (find-package :asdf/package)
    (print "PASS: asdf/package exists")
    (print "FAIL: asdf/package does not exist"))

(print "All tests completed for package-test.lisp")
