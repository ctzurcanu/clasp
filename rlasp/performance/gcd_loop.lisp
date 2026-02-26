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

(defun gcd-euclid (a b)
  (loop while (/= b 0) do
    (psetq a b
           b (mod a b))
    finally (return (abs a))))

(defun gcd-loop (iterations a b)
  (let ((x a)
        (y b)
        (acc 0))
    (dotimes (i iterations acc)
      (declare (ignore i))
      (let ((g (gcd-euclid x y)))
        (setf acc (+ acc g))
        (psetq x (+ y 17)
               y (+ x 31))))))

(let* ((iterations (bench-int-arg-from-end 3 1000000))
       (a (bench-int-arg-from-end 2 832040))
       (b (bench-int-arg-from-end 1 514229))
       (result (gcd-loop iterations a b)))
  (bench-report "gcd_loop" (list iterations a b) result))
