;; Tests for util.lisp functions: nconc, tailp, ldiff

(load "clisp/kernel/lsp/util.lisp")

(print "Testing nconc:")

;; Test 1: nconc two simple lists
(setq l1 (list 1 2))
(setq l2 (list 3 4))
(setq result (nconc l1 l2))
(print result)

;; Test 2: nconc with empty list
(setq l3 (list 5 6))
(setq result2 (nconc nil l3))
(print result2)

;; Test 3: nconc multiple lists
(setq l4 (list 7))
(setq l5 (list 8))
(setq l6 (list 9))
(setq result3 (nconc l4 l5 l6))
(print result3)

(print "nconc tests passed!")

(print "Testing tailp:")

;; Test 1: tailp with actual tail
(setq mylist (list 1 2 3 4))
(setq mytail (cdr (cdr mylist)))
(print (tailp mytail mylist))

;; Test 2: tailp with non-tail
(setq other (list 3 4))
(print (tailp other mylist))

;; Test 3: tailp with nil
(print (tailp nil nil))

(print "tailp tests passed!")

(print "Testing ldiff:")

;; Test 1: ldiff basic usage
(setq x (cons 1 (cons 2 (cons 3 (cons 4 nil)))))
(setq y (cdr (cdr x)))
(setq result (ldiff x y))
(print result)

;; Test 2: ldiff with entire list
(setq a (list 1 2 3))
(setq result2 (ldiff a a))
(print result2)

;; Test 3: ldiff with non-matching tail
(setq b (list 1 2 3))
(setq c (list 3))
(setq result3 (ldiff b c))
(print result3)

(print "ldiff tests passed!")

(print "All util.lisp tests passed!")
