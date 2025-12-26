;;; Test file for b.lisp
;;; Tests: defpackage with :use and package dependencies

;; Create prerequisite package
(defpackage package-inferred-system-test/a (:use :cl))

;; Load the file
(load "clisp/in_work/modules/asdf/test/package-inferred-system-test/b.lisp")

;; Test that the package was created
(if (find-package :package-inferred-system-test/b)
    (print "PASS: package-inferred-system-test/b exists")
    (print "FAIL: package-inferred-system-test/b does not exist"))

(print "All tests completed for b.lisp")
