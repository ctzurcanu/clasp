(load "clisp/in_work/regression-tests/framework.lisp")
(in-package #:clasp-tests)
(format t "framework integer-length.1 form => ~S~%"
        (loop for len from 0 to 100
              for i = (1- (ash 1 len))
              for vals = (multiple-value-list (integer-length i))
              for len2 = (car vals)
              always (and (= (length vals) 1)
                          (eql len len2))))
(format t "framework logand.3a => ~S~%"
        (= (logand (1+ most-positive-fixnum)) (1+ most-positive-fixnum)))
(test-true integer-length.1
  (loop for len from 0 to 100
        for i = (1- (ash 1 len))
        for vals = (multiple-value-list (integer-length i))
        for len2 = (car vals)
        always (and (= (length vals) 1)
                    (eql len len2))))
(test-true logand.3a
      (= (logand (1+ most-positive-fixnum)) (1+ most-positive-fixnum)))
