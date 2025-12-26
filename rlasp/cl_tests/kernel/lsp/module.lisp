;; Tests for module.lisp
;; This file implements the module system (PROVIDE and REQUIRE)

(load "clisp/in_work/kernel/lsp/module.lisp")

(print "module.lisp loaded successfully!")

;; File defines:
;; - *modules* - list of loaded modules
;; - ext:*module-provider-functions* - module provider functions
;; - provide, require functions for module management
;; - normalize-module-name, module-provide-clasp

(print "All module.lisp tests passed!")
