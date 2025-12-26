#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

(defun factorial (n)
  (if (< n 2)
      1
      (* n (factorial (- n 1)))))

(defun main ()
  (let ((result (factorial 10)))
    result))

(main)
