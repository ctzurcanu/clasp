(in-package :cl-user)

(defun perf-arith (n)
  (let ((s 0))
    (dotimes (i n s)
      (setf s (mod (+ (* 33 s) i 17) 1000000007)))))

(defun perf-cons (n)
  (let ((x nil))
    (dotimes (i n)
      (push i x))
    (let ((s 0))
      (dolist (v x s)
        (setf s (mod (+ s v) 1000000007))))))

(format t "ARITH ~A~%" (perf-arith 200000))
(format t "CONS ~A~%" (perf-cons 50000))
