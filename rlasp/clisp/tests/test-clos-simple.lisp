(defclass point ()
  ((x :initarg :x :accessor x)))

(format t "Class defined~%")

(defun test ()
  (format t "Creating instance...~%")
  (let ((p (make-instance 'point :x 5)))
    (format t "Instance created: ~A~%" p)
    (format t "Calling accessor...~%")
    (let ((val (x p)))
      (format t "Accessor returned: ~A~%" val)
      val)))

(format t "Calling test...~%")
(test)
(format t "Done~%")
