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

(defun make-vector-range (n offset)
  (let ((vec (make-array n)))
    (dotimes (i n vec)
      (setf (aref vec i) (+ offset (mod i 97))))))

(defun vector-dot (a b)
  (let ((acc 0))
    (dotimes (i (length a) acc)
      (setf acc (+ acc (* (aref a i) (aref b i)))))))

(let* ((n (bench-int-arg-from-end 1 1500000))
       (a (make-vector-range n 1))
       (b (make-vector-range n 3))
       (result (vector-dot a b)))
  (bench-report "vector_dot" (list n) result))
