(defun oscov-fail (message)
  (error (format nil "OS-COVERAGE FAIL: ~a" message)))

(defun oscov-assert (condition message)
  (unless condition
    (oscov-fail message))
  t)

(defun oscov-assert-equal (expected actual message)
  (unless (equal expected actual)
    (oscov-fail (format nil "~a (expected=~s actual=~s)" message expected actual)))
  t)

(defun oscov-note (label)
  (format t "[OS-COVERAGE] ~a~%" label))
