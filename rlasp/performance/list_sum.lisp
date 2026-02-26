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

(defun build-list (n)
  (let ((acc nil))
    (dotimes (i n acc)
      (setf acc (cons i acc)))))

(defun list-sum (lst)
  (let ((acc 0))
    (dolist (x lst acc)
      (setf acc (+ acc x)))))

(let* ((n (bench-int-arg-from-end 1 1200000))
       (lst (build-list n))
       (result (list-sum lst)))
  (bench-report "list_sum" (list n) result))
