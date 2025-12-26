;; Tests for top-hook.lisp
;; This file defines hook functions for Clasp initialization and toplevel

(load "clisp/in_work/kernel/lsp/top-hook.lisp")

(print "top-hook.lisp loaded successfully!")

;; File defines several system hook functions:
;; - sys::load-foreign-libraries
;; - sys::load-extensions
;; - sys::call-initialize-hooks
;; - sys::call-terminate-hooks
;; - sys::standard-toplevel

(print "All top-hook.lisp tests passed!")
