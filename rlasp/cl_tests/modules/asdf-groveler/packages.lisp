;;; Test file for modules/asdf-groveler/packages.lisp
;;; Tests: defpackage with #: uninterned symbols, export

;; Load the file
(load "clisp/in_work/modules/asdf-groveler/packages.lisp")

;; Test that the package was created
(if (find-package :asdf-groveler)
    (print "PASS: asdf-groveler package exists")
    (print "FAIL: asdf-groveler package does not exist"))

(print "All tests completed for asdf-groveler/packages.lisp")
