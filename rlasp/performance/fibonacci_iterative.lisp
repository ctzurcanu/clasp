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

(defun fib-iterative (n)
  (let ((a 0)
        (b 1))
    (dotimes (i n a)
      (declare (ignore i))
      (let ((next (+ a b)))
        (setf a b
              b next)))))

(let* ((n (bench-int-arg-from-end 1 2000))
       (result (fib-iterative n)))
  (bench-report "fibonacci_iterative" (list n) result))
