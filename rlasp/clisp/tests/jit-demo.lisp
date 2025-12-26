#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;; JIT Compilation Demo

(defun fib (n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(defun count-odds (n)
  (let ((count 0))
    (dotimes (i n count)
      (if (oddp i)
          (incf count)))))

(defun list-test ()
  (let ((lst nil))
    (dotimes (i 5)
      (push (* i 2) lst))
    (length lst)))

(defun math-test ()
  (let ((x 16))
    (+ (expt x 2) (sqrt x))))

(print (fib 10))
(print (count-odds 20))
(print (list-test))
(print (math-test))
