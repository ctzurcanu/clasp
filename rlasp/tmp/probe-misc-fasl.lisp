(in-package #:clasp-tests)

(defclass probe-foo () ((bar :accessor probe-bar)))
(multiple-value-bind (value condition)
    (ignore-errors (probe-bar (make-instance 'probe-foo)))
  (format t "cell value=~S condition=~S type=~S unbound-slot?=~S~%"
          value condition (and condition (type-of condition))
          (and condition (typep condition 'unbound-slot))))

(multiple-value-bind (value condition)
    (ignore-errors
      (compile-file "sys:src;lisp;regression-tests;I-do-not-exist.lisp"))
  (format t "compile-1 value=~S condition=~S type=~S file-error?=~S~%"
          value condition (and condition (type-of condition))
          (and condition (typep condition 'file-error))))

(format t "compile verbose output len=~D text=~S~%"
        (length
         (with-output-to-string (*standard-output*)
           (compile-file "sys:src;lisp;regression-tests;test-compile-file.lisp"
                         :verbose t :print nil)))
        (with-output-to-string (*standard-output*)
          (compile-file "sys:src;lisp;regression-tests;test-compile-file.lisp"
                        :verbose t :print nil)))

(format t "compile print output len=~D text=~S~%"
        (length
         (with-output-to-string (*standard-output*)
           (compile-file "sys:src;lisp;regression-tests;test-compile-file.lisp"
                         :verbose nil :print t)))
        (with-output-to-string (*standard-output*)
          (compile-file "sys:src;lisp;regression-tests;test-compile-file.lisp"
                        :verbose nil :print t)))
