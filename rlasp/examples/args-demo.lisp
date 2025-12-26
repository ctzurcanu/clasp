#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;;; Command-line argument demo
;;; Usage: ./args-demo.lisp arg1 arg2 arg3

(defun main ()
  (let ((n (argc)))
    (shell "echo '=== Total arguments:'")
    (print n)
    (shell "echo ''")
    
    (shell "echo '=== Arguments (starting from 1 to skip program name):'")
    (let ((i 1))
      (dotimes (_ (- n 1))
        (shell "echo -n 'Arg '")
        (print i)
        (shell "echo ':'")
        (shell "echo $(printenv)")  
        (incf i)))))

(main)
