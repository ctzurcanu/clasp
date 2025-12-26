;;; Test file for test-preferences-1.lisp
;;; Tests: in-package, defvar

;; Setup
(in-package :common-lisp-user)

;; Load the file
(load "clisp/in_work/modules/asdf/test/graveyard/test-preferences-1.lisp")

;; Test that variable was defined
(if (eq *test-preferences-variable-1* :default)
    (print "PASS: *test-preferences-variable-1* is :default")
    (print "FAIL: *test-preferences-variable-1* is not :default"))

(print "All tests completed for test-preferences-1.lisp")
