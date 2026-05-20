(in-package :cl-user)

(defun perf-arith (n)
  (let ((s 0))
    (dotimes (i n s)
      (setq s (mod (+ (* 33 s) i 17) 1000000007)))))

(defun perf-cons (n)
  (let ((x nil))
    (dotimes (i n)
      (push i x))
    (let ((s 0))
      (dolist (v x s)
        (setq s (mod (+ s v) 1000000007))))))

(format t "ARITH ~A~%" (perf-arith 2000000))
(format t "CONS ~A~%" (perf-cons 500000))
