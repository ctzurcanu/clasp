;;; Test file for unintern-foo.lisp
;;; Tests: eval-when, when, find-package, delete-package, defpackage

;; Load the file
(load "clisp/in_work/modules/asdf/test/unintern-foo.lisp")

;; Test that the package was created
(if (find-package :asdf-test/deferred-warnings)
    (print "PASS: asdf-test/deferred-warnings package exists")
    (print "FAIL: asdf-test/deferred-warnings does not exist"))

(print "All tests completed for unintern-foo.lisp")
