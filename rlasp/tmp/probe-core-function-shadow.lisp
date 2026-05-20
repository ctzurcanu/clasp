(in-package :cl-user)

(format t "CAR ~A~%" (car '(1 2)))
(flet ((car (x) (declare (ignore x)) 99))
  (format t "SHADOW-CAR ~A~%" (car '(1 2))))
