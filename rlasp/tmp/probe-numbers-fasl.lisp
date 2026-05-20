(in-package #:cl-user)

(format t "integer-length direct:~%")
(format t "fixnum bounds: mpf=~a 1+=~a type=~a mnf=~a 1-=~a type=~a~%"
        most-positive-fixnum (1+ most-positive-fixnum) (type-of (1+ most-positive-fixnum))
        most-negative-fixnum (1- most-negative-fixnum) (type-of (1- most-negative-fixnum)))
(loop for len in '(0 1 2 60 61 62 63 100)
      for i = (1- (ash 1 len))
      do (format t " len=~a i=~a integer-length=~a expected=~a ok=~a~%"
                 len i (integer-length i) len (= (integer-length i) len)))

(format t "integer-length negative:~%")
(loop for len in '(0 1 2 60 61 62 63 100)
      for i = (- (ash 1 len))
      do (format t " len=~a i=~a integer-length=~a expected=~a ok=~a~%"
                 len i (integer-length i) len (= (integer-length i) len)))

(format t "round boundary: values=~s~%"
        (multiple-value-list (round 2305843009213693952 -2305843009213693952)))

(format t "floor contagion misses=~s~%"
        (loop for fun in '(floor ceiling truncate round
                           ffloor fceiling ftruncate fround)
              nconc
              (loop for args in '((3f0 2) (3 2f0) (3f0 4/7) (31/30 2f0)
                                  (3f0 2d0) (3d0 2f0) (3d0 2d0))
                    for rtype in '(single-float single-float single-float single-float
                                   double-float double-float double-float)
                    unless (typep (nth-value 1 (apply fun args)) rtype)
                      collect (list fun args (nth-value 1 (apply fun args))
                                    (type-of (nth-value 1 (apply fun args)))
                                    rtype))))

(format t "ffloor quotient misses=~s~%"
        (loop for fun in '(ffloor fceiling ftruncate fround)
              nconc
              (loop for args in '((3 2) (3 4/7) (31/30 2)
                                  (3f0 2) (3 2f0) (3f0 4/7) (31/30 2f0)
                                  (3f0 2d0) (3d0 2f0) (3d0 2d0))
                    for rtype in '(single-float single-float single-float
                                   single-float single-float single-float single-float
                                   double-float double-float double-float)
                    unless (typep (apply fun args) rtype)
                      collect (list fun args (apply fun args)
                                    (type-of (apply fun args))
                                    rtype))))

(format t "log boundary:~%")
(format t " logand one=~a ok=~a~%"
        (logand (1+ most-positive-fixnum))
        (= (logand (1+ most-positive-fixnum)) (1+ most-positive-fixnum)))
(format t " logand two=~a expected=~a ok=~a~%"
        (logand (1+ most-positive-fixnum) (1+ (1+ most-positive-fixnum)))
        (1+ most-positive-fixnum)
        (= (logand (1+ most-positive-fixnum) (1+ (1+ most-positive-fixnum)))
           (1+ most-positive-fixnum)))
(format t " logand neg=~a expected=~a ok=~a~%"
        (logand (1- most-negative-fixnum) (1- (1- most-negative-fixnum)))
        (- most-negative-fixnum 2)
        (= (logand (1- most-negative-fixnum) (1- (1- most-negative-fixnum)))
           (- most-negative-fixnum 2)))
(format t " logandc2=~a ok=~a~%"
        (logandc2 (1+ most-positive-fixnum) 0)
        (= (1+ most-positive-fixnum) (logandc2 (1+ most-positive-fixnum) 0)))

(format t "log factorial samples:~%")
(labels ((factorial (n) (if (<= n 1) 1 (* n (factorial (1- n))))))
  (loop for x in '(10 100 200)
        for res = (log (factorial x))
        do (format t " x=~a result=~a type=~a floatp=~a nan=~a~%"
                   x res (type-of res) (floatp res) (ext:float-nan-p res))))
