#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;;; Demo of JIT compilation with print

(defun fib (n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(defun main ()
  (print 10)
  (print 20)  
  (print 100)
  (fib 15))

(main)
