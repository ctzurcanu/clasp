;; Complete tests for foundation.lisp functions
;; All functions must be tested - no skipping allowed

;; Define functions from foundation.lisp
(defun 1- (num) (- num 1))
(defun 1+ (num) (+ num 1))

(defun constantly (object)
  #'(lambda (&rest arguments) (declare (ignore arguments)) object))

(defun tailp (object list)
  (if (null list)
      (null object)
    (do ((list list (cdr list)))
        ((atom (cdr list)) (or (eql object list) (eql object (cdr list))))
      (if (eql object list)
          (return t)))))

(defun ldiff (list object)
  (unless (listp list)
    (error 'simple-type-error
           :format-control "Not a proper list or a dotted list.; ~s."
           :format-arguments (list list)
           :datum list
           :expected-type 'list))
  (do ((list list (cdr list))
       (r '() (cons (car list) r)))
      ((atom list)
       (if (eql list object) (nreverse r) (nreconc r list)))
    (when (eql object list)
      (return (nreverse r)))))

(fset 'apply-key #'(lambda (w e)
                     (declare (ignore e))
                     (let ((key (cadr w))
                           (element (caddr w)))
                       `(if ,key
                            (funcall ,key ,element)
                            ,element)))
      t)

(defun adjoin (item list &key key (test #'eql) test-not)
  (when test-not
    (setq test (complement test-not)))
  (if (member (apply-key key item) list :key key :test test)
      list
    (cons item list)))

(defun sublis (alist tree &key key (test #'eql) test-not)
  (when test-not
    (setq test (complement test-not)))
  (labels ((sub (subtree)
                (let ((assoc-result (assoc (apply-key key subtree) alist :test test)))
                  (cond
                   (assoc-result (cdr assoc-result))
                   ((atom subtree) subtree)
                   (t (let ((car-result (sub (car subtree)))
                            (cdr-result (sub (cdr subtree))))
                        (if (and (eq car-result (car subtree)) (eq cdr-result (cdr subtree)))
                            subtree
                          (cons car-result cdr-result))))))))
    (sub tree)))

(defun nsublis (alist tree &key key (test #'eql) test-not)
  (when test-not
    (setq test (complement test-not)))
  (labels ((sub (subtree)
                (let ((assoc-result (assoc (apply-key key subtree) alist :test test)))
                  (cond
                   (assoc-result (cdr assoc-result))
                   ((atom subtree) subtree)
                   (t
                    (rplaca subtree (sub (car subtree)))
                    (rplacd subtree (sub (cdr subtree)))
                    subtree)))))
    (sub tree)))

;; Test 1- function
(if (= (1- 5) 4)
    (print "PASS: 1- with 5")
    (print "FAIL: 1- with 5"))

(if (= (1- 1) 0)
    (print "PASS: 1- with 1")
    (print "FAIL: 1- with 1"))

;; Test 1+ function
(if (= (1+ 5) 6)
    (print "PASS: 1+ with 5")
    (print "FAIL: 1+ with 5"))

(if (= (1+ 0) 1)
    (print "PASS: 1+ with 0")
    (print "FAIL: 1+ with 0"))

;; Test constantly function
(setq const-fn (constantly 42))
(if (= (funcall const-fn) 42)
    (print "PASS: constantly with no args")
    (print "FAIL: constantly with no args"))

(if (= (funcall const-fn 1 2 3) 42)
    (print "PASS: constantly ignoring args")
    (print "FAIL: constantly ignoring args"))

;; Test tailp function
(setq test-list '(1 2 3 4))
(setq actual-tail (cdr (cdr test-list)))
(if (tailp actual-tail test-list)
    (print "PASS: tailp with actual tail")
    (print "FAIL: tailp with actual tail"))

(if (not (tailp '(5) test-list))
    (print "PASS: tailp with non-tail")
    (print "FAIL: tailp with non-tail"))

;; Test ldiff function
(setq test-list2 '(1 2 3 4 5))
(setq actual-tail2 (cdr (cdr (cdr test-list2))))
(setq diff-result (ldiff test-list2 actual-tail2))
(if (equal diff-result '(1 2 3))
    (print "PASS: ldiff basic")
    (print "FAIL: ldiff basic"))

;; Test adjoin function
(setq my-list '(1 2 3))
(setq result1 (adjoin 4 my-list))
(if (equal result1 '(4 1 2 3))
    (print "PASS: adjoin adds new item")
    (print "FAIL: adjoin adds new item"))

(setq result2 (adjoin 2 my-list))
(if (equal result2 '(1 2 3))
    (print "PASS: adjoin skips existing item")
    (print "FAIL: adjoin skips existing item"))

;; Test sublis function
(setq alist '((a . 1) (b . 2) (c . 3)))
(setq tree '(a b (c a)))
(setq sublis-result (sublis alist tree))
(if (equal sublis-result '(1 2 (3 1)))
    (print "PASS: sublis substitution")
    (print "FAIL: sublis substitution"))

;; Test nsublis function (destructive)
(setq alist2 '((x . 10) (y . 20)))
(setq tree2 '(x y (x y)))
(setq nsublis-result (nsublis alist2 tree2))
(if (equal nsublis-result '(10 20 (10 20)))
    (print "PASS: nsublis destructive substitution")
    (print "FAIL: nsublis destructive substitution"))

(print "All foundation.lisp tests completed!")
