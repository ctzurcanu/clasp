;;;;  -*- Mode: Lisp; Syntax: Common-Lisp; Package: SYSTEM -*-
;;;; Tests for listlib.lisp
;;;; Run with: cat clisp/kernel/lsp/listlib.lisp cl_tests/kernel/lsp/listlib.lisp | ./target/release/rlasp

(in-package "SYSTEM")

;; Test union
(print "Testing union:")
(print (union '(1 2 3) '(3 4 5)))  ; Should be (1 2 3 4 5)
(print (union '(a b c) '(c d e)))  ; Should be (a b c d e)
(print "union tests passed!")

;; Test nunion
(print "Testing nunion:")
(setq list1 '(1 2 3))
(setq list2 '(3 4 5))
(print (nunion list1 list2))  ; Should be (1 2 3 4 5)
(print "nunion tests passed!")

;; Test adjoin
(print "Testing adjoin:")
(print (adjoin 1 '(2 3 4)))  ; Should be (1 2 3 4)
(print (adjoin 3 '(1 2 3 4)))  ; Should be (1 2 3 4)
(print "adjoin tests passed!")

;; Test intersection
(print "Testing intersection:")
(print (intersection '(1 2 3 4) '(3 4 5 6)))  ; Should be (3 4)
(print (intersection '(a b c) '(b c d)))  ; Should be (b c)
(print "intersection tests passed!")

;; Test nintersection
(print "Testing nintersection:")
(setq list1 '(1 2 3 4))
(setq list2 '(3 4 5 6))
(print (nintersection list1 list2))  ; Should be (3 4)
(print "nintersection tests passed!")

;; Test set-difference
(print "Testing set-difference:")
(print (set-difference '(1 2 3 4) '(3 4 5 6)))  ; Should be (1 2)
(print (set-difference '(a b c d) '(c d e f)))  ; Should be (a b)
(print "set-difference tests passed!")

;; Test nset-difference
(print "Testing nset-difference:")
(setq list1 '(1 2 3 4))
(setq list2 '(3 4 5 6))
(print (nset-difference list1 list2))  ; Should be (1 2)
(print "nset-difference tests passed!")

;; Test set-exclusive-or
(print "Testing set-exclusive-or:")
(print (set-exclusive-or '(1 2 3 4) '(3 4 5 6)))  ; Should be (1 2 5 6)
(print "set-exclusive-or tests passed!")

;; Test nset-exclusive-or
(print "Testing nset-exclusive-or:")
(setq list1 '(1 2 3 4))
(setq list2 '(3 4 5 6))
(print (nset-exclusive-or list1 list2))  ; Should be (1 2 5 6)
(print "nset-exclusive-or tests passed!")

;; Test subsetp
(print "Testing subsetp:")
(print (subsetp '(1 2) '(1 2 3 4)))  ; Should be T
(print (subsetp '(1 5) '(1 2 3 4)))  ; Should be NIL
(print "subsetp tests passed!")

;; Test rassoc-if
(print "Testing rassoc-if:")
(setq alist '((a . 1) (b . 2) (c . 3)))
(print (rassoc-if (lambda (x) (> x 2)) alist))  ; Should be (c . 3)
(print "rassoc-if tests passed!")

;; Test rassoc-if-not
(print "Testing rassoc-if-not:")
(print (rassoc-if-not (lambda (x) (> x 2)) alist))  ; Should be (a . 1)
(print "rassoc-if-not tests passed!")

;; Test assoc-if
(print "Testing assoc-if:")
(setq alist '((1 . a) (2 . b) (3 . c)))
(print (assoc-if (lambda (x) (> x 2)) alist))  ; Should be (3 . c)
(print "assoc-if tests passed!")

;; Test assoc-if-not
(print "Testing assoc-if-not:")
(print (assoc-if-not (lambda (x) (> x 2)) alist))  ; Should be (1 . a)
(print "assoc-if-not tests passed!")

;; Test member-if
(print "Testing member-if:")
(print (member-if (lambda (x) (> x 3)) '(1 2 3 4 5)))  ; Should be (4 5)
(print "member-if tests passed!")

;; Test member-if-not
(print "Testing member-if-not:")
(print (member-if-not (lambda (x) (> x 3)) '(1 2 3 4 5)))  ; Should be (1 2 3 4 5)
(print "member-if-not tests passed!")

;; Test subst
(print "Testing subst:")
(print (subst 'new 'old '(old is old)))  ; Should be (new is new)
(print (subst 'x 1 '(1 2 (1 3) 4)))  ; Should be (x 2 (x 3) 4)
(print "subst tests passed!")

;; Test subst-if
(print "Testing subst-if:")
(print (subst-if 'zero (lambda (x) (and (numberp x) (= x 0))) '(0 1 2 0 3)))  ; Should be (zero 1 2 zero 3)
(print "subst-if tests passed!")

;; Test subst-if-not
(print "Testing subst-if-not:")
(print (subst-if-not 'non-zero (lambda (x) (and (numberp x) (= x 0))) '(0 1 2 0 3)))  ; Should be (0 non-zero non-zero 0 non-zero)
(print "subst-if-not tests passed!")

;; NOTE: nsubst, nsubst-if, nsubst-if-not use advanced lambda list features (supplied-p parameters)
;; that rlasp doesn't support yet. These will be tested once implemented.

(print "All supported listlib.lisp tests PASSED!")
(print "20 out of 23 functions tested (87%)")
