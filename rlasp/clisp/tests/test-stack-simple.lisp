;;; Simple test of stack-based calling convention
;;; Add two numbers: (+ 5 3)

(defun add-two (a b)
  (+ a b))

(format t "Result: ~A~%" (add-two 5 3))
