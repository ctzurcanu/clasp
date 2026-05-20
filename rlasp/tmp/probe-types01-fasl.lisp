(in-package #:cl-user)

(format t "array type-of => ~S~%" (type-of #2a((nil nil) (nil nil))))
(format t "array class-of => ~S~%" (class-of #2a((nil nil) (nil nil))))
(multiple-value-bind (st vp)
    (subtypep (type-of #2a((nil nil) (nil nil)))
              (class-of #2a((nil nil) (nil nil))))
  (format t "array subtypep => ~S ~S~%" st vp))

(format t "car type-of => ~S~%" (type-of #'car))
(multiple-value-bind (st vp)
    (subtypep (type-of #'car) 'function)
  (format t "car subtypep => ~S ~S~%" st vp))
