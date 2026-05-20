(in-package #:clasp-tests)

(let ((text (with-output-to-string (*standard-output*)
              (eval '(compile-file "sys:src;lisp;regression-tests;test-compile-file.lisp"
                      :verbose t :print nil)))))
  (format t "eval compile verbose len=~D text=~S predicate=~S~%"
          (length text)
          text
          (not (string= "" text))))

(let ((text (with-output-to-string (*standard-output*)
              (eval '(compile-file "sys:src;lisp;regression-tests;test-compile-file.lisp"
                      :verbose nil :print t)))))
  (format t "eval compile print len=~D text=~S predicate=~S~%"
          (length text)
          text
          (not (string= "" text))))

(multiple-value-bind (value condition)
    (ignore-errors
      (eval '(compile-file "sys:src;lisp;regression-tests;I-do-not-exist.lisp")))
  (format t "eval compile-1 value=~S condition=~S type=~S file-error?=~S~%"
          value condition (and condition (type-of condition))
          (and condition (typep condition 'file-error))))
