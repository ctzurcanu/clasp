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

(defun build-test-string (n)
  (let ((s (make-string n)))
    (dotimes (i n s)
      (setf (char s i)
            (if (= (mod i 3) 0) #\a #\b)))))

(defun count-char (s ch)
  (let ((acc 0)
        (n (length s)))
    (dotimes (i n acc)
      (when (char= (char s i) ch)
        (setf acc (+ acc 1))))))

(let* ((n (bench-int-arg-from-end 1 6000000))
       (s (build-test-string n))
       (result (count-char s #\a)))
  (bench-report "string_count" (list n) result))
