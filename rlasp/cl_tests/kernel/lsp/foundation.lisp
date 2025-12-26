;; Tests for foundation.lisp functions
;; Note: Run with: cat clisp/kernel/lsp/foundation.lisp cl_tests/kernel/lsp/foundation.lisp | rlasp

(print "Testing 1-:")
(print (1- 5))  ; Should be 4
(print (1- 0))  ; Should be -1
(print (1- -3)) ; Should be -4
(print "1- tests passed!")

(print "Testing 1+:")
(print (1+ 5))  ; Should be 6
(print (1+ 0))  ; Should be 1
(print (1+ -3)) ; Should be -2
(print "1+ tests passed!")

(print "Testing constantly:")
(setq const-5 (constantly 5))
(print (funcall const-5))        ; Should be 5
(print (funcall const-5 1 2 3))  ; Should be 5 (ignores args)
(print "constantly tests passed!")

(print "Testing tailp:")
(setq mylist '(1 2 3 4))
(setq tail (cdr (cdr mylist)))
(print (tailp tail mylist))      ; Should be T
(setq other '(3 4))
(print (tailp other mylist))     ; Should be NIL
(print (tailp nil nil))          ; Should be T
(print "tailp tests passed!")

(print "Testing ldiff:")
(setq x '(1 2 3 4))
(setq y (cdr (cdr x)))
(print (ldiff x y))              ; Should be (1 2)
(setq a '(1 2 3))
(print (ldiff a a))              ; Should be NIL
(setq b '(1 2 3))
(setq c '(3))
(print (ldiff b c))              ; Should be (1 2 3)
(print "ldiff tests passed!")

(print "Testing adjoin:")
(print (adjoin 1 '(2 3 4)))      ; Should be (1 2 3 4)
(print (adjoin 2 '(1 2 3)))      ; Should be (1 2 3)
(setq result (adjoin 'x '(a b c)))
(print result)                    ; Should be (x a b c)
(print "adjoin tests passed!")

(print "Testing sublis:")
(setq alist '((a . 1) (b . 2) (c . 3)))
(print (sublis alist '(a b c)))  ; Should be (1 2 3)
(print (sublis alist '(a (b c) d))) ; Should be (1 (2 3) d)
(print (sublis '((x . 100)) '(x y z))) ; Should be (100 y z)
(print "sublis tests passed!")

(print "Testing nsublis:")
(setq al1 '((a . 1) (b . 2)))
(setq tree1 '(a b c))
(print (nsublis al1 tree1))      ; Should be (1 2 c)
(setq al2 '((x . foo) (y . bar)))
(setq tree2 '(x (y z)))
(print (nsublis al2 tree2))      ; Should be (foo (bar z))
(print "nsublis tests passed!")

(print "All foundation.lisp tests PASSED!")
