(defclass point ()
  ((x :initarg :x :accessor x)))

(format t "Class defined~%")

(defun test ()
  (let ((p (make-instance 'point :x 5)))
    (x p)))

(format t "Function defined~%")

(format t "Result: ~A~%" (test))
