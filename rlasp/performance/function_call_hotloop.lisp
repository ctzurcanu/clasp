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

(defun lcg-step (state iter)
  (mod (+ (* state 1664525) iter 1013904223) 2147483647))

(defun function-call-hotloop (n)
  (let ((state 1))
    (dotimes (i n state)
      (setf state (lcg-step state i)))))

(let* ((n (bench-int-arg-from-end 1 800000))
       (result (function-call-hotloop n)))
  (bench-report "function_call_hotloop" (list n) result))
