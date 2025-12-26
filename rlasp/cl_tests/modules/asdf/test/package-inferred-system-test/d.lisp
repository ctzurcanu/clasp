;;; Test file for d.lisp
;;; Tests: defpackage with multiple :use packages

;; Create prerequisite packages
(defpackage package-inferred-system-test/a (:use :cl))
(defpackage package-inferred-system-test/b (:use :cl :package-inferred-system-test/a))
(defpackage package-inferred-system-test/c (:use :cl :package-inferred-system-test/a))

;; Load the file
(load "clisp/in_work/modules/asdf/test/package-inferred-system-test/d.lisp")

;; Test that the package was created
(if (find-package :package-inferred-system-test/d)
    (print "PASS: package-inferred-system-test/d exists")
    (print "FAIL: package-inferred-system-test/d does not exist"))

(print "All tests completed for d.lisp")
