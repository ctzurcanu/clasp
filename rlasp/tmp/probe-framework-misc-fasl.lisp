(in-package :cl-user)
(load "clisp/in_work/regression-tests/framework.lisp")
(in-package #:clasp-tests)
(reset-clasp-tests)

(test-expect-error
 probe-compile-1
 (compile-file "sys:src;lisp;regression-tests;I-do-not-exist.lisp")
 :type file-error)

(defclass probe-cell-foo () ((bar :accessor probe-cell-bar)))

(test-expect-error
 probe-cell-3
 (probe-cell-bar (make-instance 'probe-cell-foo))
 :type unbound-slot)

(multiple-value-bind (value condition)
    (ignore-errors (probe-cell-bar (make-instance 'probe-cell-foo)))
  (format t "probe-cell direct value=~S condition=~S type=~S unbound-slot?=~S~%"
          value condition (and condition (type-of condition))
          (and condition (typep condition 'unbound-slot))))

(test-true probe-compile-4
           (not (string= ""
                         (with-output-to-string (*standard-output*)
                           (compile-file "sys:src;lisp;regression-tests;test-compile-file.lisp"
                                         :verbose t :print nil)))))

(show-test-summary)
