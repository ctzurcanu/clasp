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

(defun count-primes-up-to (limit)
  (if (< limit 2)
      0
      (let ((flags (make-array (1+ limit) :element-type 'bit :initial-element 1)))
        (setf (aref flags 0) 0
              (aref flags 1) 0)
        (loop for p from 2 to (isqrt limit) do
          (when (= (aref flags p) 1)
            (loop for m from (* p p) to limit by p do
              (setf (aref flags m) 0))))
        (loop for i from 2 to limit count (= (aref flags i) 1)))))

(let* ((limit (bench-int-arg-from-end 1 250000))
       (result (count-primes-up-to limit)))
  (bench-report "sieve_primes" (list limit) result))
