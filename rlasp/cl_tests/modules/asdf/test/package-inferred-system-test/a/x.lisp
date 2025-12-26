;;; Test file for a/x.lisp
;;; Tests: defpackage with package dependencies

;; Create prerequisite packages
(defpackage package-inferred-system-test/a (:use :cl))
(defpackage package-inferred-system-test/c (:use :cl :package-inferred-system-test/a))

;; Load the file
(load "clisp/in_work/modules/asdf/test/package-inferred-system-test/a/x.lisp")

;; Test that the package was created
(if (find-package :package-inferred-system-test/a/x)
    (print "PASS: package-inferred-system-test/a/x exists")
    (print "FAIL: package-inferred-system-test/a/x does not exist"))

(print "All tests completed for a/x.lisp")
