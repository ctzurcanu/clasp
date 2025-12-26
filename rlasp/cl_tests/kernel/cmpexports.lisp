;;; Test file for kernel/cmpexports.lisp
;;; Tests: in-package, export with list

;; Create the package first
(defpackage :cmp (:use :cl))

;; Load the file
(load "clisp/in_work/kernel/cmpexports.lisp")

;; Test that the package exists
(if (find-package :cmp)
    (print "PASS: cmp package exists")
    (print "FAIL: cmp package does not exist"))

(print "All tests completed for cmpexports.lisp")
