;;; Test file for c.lisp
;;; Tests: defpackage with :use and package dependencies

;; Create prerequisite package
(defpackage package-inferred-system-test/a (:use :cl))

;; Load the file
(load "clisp/in_work/modules/asdf/test/package-inferred-system-test/c.lisp")

;; Test that the package was created
(if (find-package :package-inferred-system-test/c)
    (print "PASS: package-inferred-system-test/c exists")
    (print "FAIL: package-inferred-system-test/c does not exist"))

(print "All tests completed for c.lisp")
