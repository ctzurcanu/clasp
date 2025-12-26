;;; Test file for modules/unicode-data/packages.lisp
;;; Tests: defpackage with #: uninterned symbols, export

;; Load the file
(load "clisp/in_work/modules/unicode-data/packages.lisp")

;; Test that the package was created
(if (find-package :unicode-data)
    (print "PASS: unicode-data package exists")
    (print "FAIL: unicode-data package does not exist"))

(print "All tests completed for unicode-data/packages.lisp")
