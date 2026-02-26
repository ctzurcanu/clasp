(in-package #:cl-user)

(defun bench-int-arg-from-end (from-end default)
  (let* ((count (handler-case (si:argc) (error () 0)))
         (idx (- count from-end)))
    (if (< idx 0)
        default
        (let ((raw (handler-case (si:argv idx) (error () nil))))
          (if (stringp raw)
              (handler-case (parse-integer raw :junk-allowed nil)
                (error () default))
              default)))))

(defun bench-report (algo args result)
  (format t "~&ALGO=~A ARGS=~S RESULT=~S~%" algo args result)
  (finish-output))

(defun tco-sum (n acc)
  (if (= n 0)
      acc
      (tco-sum (- n 1) (+ acc n))))

(let* ((n (bench-int-arg-from-end 1 50000))
       (result (tco-sum n 0)))
  (bench-report "tco_sum" (list n) result))
