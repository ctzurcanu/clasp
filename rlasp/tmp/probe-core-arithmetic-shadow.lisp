(in-package :cl-user)

(format t "PLUS ~A~%" (+ 1 2))
(flet ((+ (a b) (declare (ignore a b)) 42))
  (format t "SHADOW ~A~%" (+ 1 2)))
