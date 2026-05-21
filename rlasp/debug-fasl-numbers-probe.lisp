(in-package :cl-user)
(format t "mpf=~s mnf=~s~%" most-positive-fixnum most-negative-fixnum)
(format t "one-past=~s type=~s~%" (1+ most-positive-fixnum) (type-of (1+ most-positive-fixnum)))
(format t "integer-lengths=~s~%"
        (list (integer-length 0)
              (integer-length (1- (ash 1 62)))
              (integer-length (ash 1 62))
              (integer-length (- (ash 1 62)))))
(format t "logand=~s~%"
        (list (logand (1+ most-positive-fixnum))
              (logand (1+ most-positive-fixnum) (+ 2 most-positive-fixnum))
              (logandc2 (1+ most-positive-fixnum) 0)))
(format t "single-low=~s~%"
        (loop for i from -3 to 3
              for n = (+ most-negative-fixnum i)
              for rn = (truncate (float n 1f0))
              collect (list i n rn (typep rn 'fixnum) (typep rn 'bignum))))
