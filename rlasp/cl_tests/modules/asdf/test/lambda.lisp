;;; Test file for modules/asdf/test/lambda.lisp
;;; Tests: setf, defparameter, in-package

;; Create the package and variable first
(defpackage :asdf-test (:use :cl))
(in-package :asdf-test)
(defparameter *lambda-string* nil)

;; Load the file
(load "clisp/in_work/modules/asdf/test/lambda.lisp")

;; Test that *lambda-string* was set correctly
(if (equal *lambda-string* "λ")
    (print "PASS: *lambda-string* is λ")
    (print "FAIL: *lambda-string* is incorrect"))

;; Print the value
(print *lambda-string*)

(print "All tests completed for lambda.lisp")
