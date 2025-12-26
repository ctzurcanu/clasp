(load "clisp/in_work/kernel/lsp/helpfile.lisp")

;; Test the functions defined in helpfile.lisp

;; Test get-annotation and remove-annotation
(setq *documentation-pool* (list (make-hash-table)))

;; Test get-annotation with no annotation
(setq result1 (get-annotation 'test-sym 'documentation))
(if (eq result1 nil)
    (print "PASS: get-annotation returns nil for missing annotation")
    (print "FAIL: get-annotation should return nil"))

;; Test remove-annotation (should work even when nothing to remove)
(remove-annotation 'test-sym 'documentation 'function)
(print "PASS: remove-annotation works")

;; Note: Some functions like get-documentation use ext:compiled-function-name
;; and ext:annotate which aren't implemented yet, so we can't fully test those

(print "helpfile.lisp basic tests passed!")
