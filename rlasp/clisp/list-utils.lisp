;;; list-utils.lisp - Basic list utilities for rlasp

(defpackage :list-utils
  (:use :common-lisp)
  (:export :list-length
           :list-sum
           :list-product))

(in-package :list-utils)

(defun list-length (lst)
  "Return the length of a list"
  (if (null lst)
      0
      (+ 1 (list-length (cdr lst)))))

(defun list-sum (lst)
  "Sum all numbers in a list"
  (if (null lst)
      0
      (+ (car lst) (list-sum (cdr lst)))))

(defun list-product (lst)
  "Multiply all numbers in a list"
  (if (null lst)
      1
      (* (car lst) (list-product (cdr lst)))))

(print "List utilities loaded successfully!")
