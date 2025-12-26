;;; Test file for modules/asdf/test/file4.lisp
;;; Tests: in-package, assert, defparameter

;; Load file3 first (file4 depends on it)
(load "clisp/modules/asdf/test/file3.lisp")

;; Load the file
(load "clisp/in_work/modules/asdf/test/file4.lisp")

;; Switch to the package
(in-package :test-package)

;; Test that *file4* was defined
(if (eq *file4* t)
    (print "PASS: *file4* is T")
    (print "FAIL: *file4* is not T"))

(print "All tests completed for file4.lisp")
