(in-package #:cl-user)

(defpackage :asdf-test (:use :cl))
(defvar asdf-test::*lambda-string*)
(defun %string-char-codes (s)
  (loop :for c :across s :collect (char-code c)))

(dolist (fmt '(nil :utf-8 :latin-1 :iso-8859-1 :latin-2 :iso-8859-2 :us-ascii))
  (multiple-value-bind (value err)
      (ignore-errors
        (if fmt
            (load #P"sys:src;lisp;modules;asdf;test;lambda.lisp" :external-format fmt)
            (load #P"sys:src;lisp;modules;asdf;test;lambda.lisp")))
    (format t "load fmt=~s value=~s err=~s err-type=~s~%"
            fmt value err (type-of err)))
  (multiple-value-bind (value err)
      (ignore-errors (%string-char-codes asdf-test::*lambda-string*))
    (format t "codes fmt=~s value=~s err=~s err-type=~s string=~s~%"
            fmt value err (type-of err)
            (ignore-errors asdf-test::*lambda-string*))))
