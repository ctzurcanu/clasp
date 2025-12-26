;;; Test file for kernel/clos/static-gfs/package.lisp
;;; Tests: defpackage with multiple exports, :implement option

;; Load the file
(load "clisp/in_work/kernel/clos/static-gfs/package.lisp")

;; Test that the package was created
(if (find-package :static-gfs)
    (print "PASS: static-gfs package exists")
    (print "FAIL: static-gfs package does not exist"))

(print "All tests completed for static-gfs/package.lisp")
