(in-package #:clasp-tests)
(format t "compiled-one-past=~s type=~s fixnum?=~s bignum?=~s~%"
        (1+ most-positive-fixnum)
        (type-of (1+ most-positive-fixnum))
        (typep (1+ most-positive-fixnum) 'fixnum)
        (typep (1+ most-positive-fixnum) 'bignum))
(format t "compiled-integer-length-checks=~s~%"
        (loop for len from 0 to 100
              for i = (1- (ash 1 len))
              for vals = (multiple-value-list (integer-length i))
              for len2 = (car vals)
              unless (and (= (length vals) 1) (eql len len2))
                collect (list len i vals len2)))
(format t "compiled-logand-checks=~s~%"
        (list
         (= (logand (1+ most-positive-fixnum)) (1+ most-positive-fixnum))
         (= (logand (1+ most-positive-fixnum) (1+ (1+ most-positive-fixnum)))
            (1+ most-positive-fixnum))
         (= (logand (1- most-negative-fixnum) (1- (1- most-negative-fixnum)))
            (- most-negative-fixnum 2))
         (= (1+ most-positive-fixnum)
            (logandc2 (1+ most-positive-fixnum) 0))))
(format t "compiled-single-low-failures=~s~%"
        (loop for i from -500 to 500
              for n = (+ most-negative-fixnum i)
              for rn = (truncate (float n 1f0))
              unless (if (<= rn most-negative-fixnum)
                         (typep rn 'fixnum)
                         (typep rn 'bignum))
                collect (list i n rn (typep rn 'fixnum) (typep rn 'bignum))))
