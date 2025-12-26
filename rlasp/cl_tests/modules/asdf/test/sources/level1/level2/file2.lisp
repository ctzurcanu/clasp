;;; Test file for sources/level1/level2/file2.lisp
;;; Tests: in-package, defvar

;; Setup
(defpackage :test-package (:use :cl))

;; Load the file
(load "clisp/in_work/modules/asdf/test/sources/level1/level2/file2.lisp")

;; Test
(in-package :test-package)
(if (eq *file-tmp2* t)
    (print "PASS: *file-tmp2* is T")
    (print "FAIL: *file-tmp2* is not T"))

(print "All tests completed for file2.lisp")
