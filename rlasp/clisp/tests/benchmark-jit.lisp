#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp
;;;; JIT Benchmark - Tests JIT-supported features

;;; Fibonacci (recursive)
(defun fib (n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

;;; Numeric loop
(defun numeric-loop (n)
  (let ((acc 0))
    (dotimes (i n acc)
      (setf acc (+ acc (* i 3))))))

;;; Arithmetic intensive
(defun arithmetic-test (n)
  (let ((result 0))
    (dotimes (i n result)
      (setf result (+ result (* (- (+ i 1) 2) (/ (+ i 10) 2)))))))

;;; List construction
(defun build-list (n)
  (let ((lst nil))
    (dotimes (i n lst)
      (push i lst))))

;;; List traversal
(defun sum-list-recursive (lst)
  (if (not lst)
      0
      (+ (car lst) (sum-list-recursive (cdr lst)))))

;;; Comparison operations
(defun comparison-test (n)
  (let ((result 0))
    (dotimes (i n result)
      (cond
        ((< i 10) (setf result (+ result 1)))
        ((> i 90) (setf result (+ result 2)))
        ((= i 50) (setf result (+ result 5)))
        ((<= i 30) (setf result (+ result 3)))
        ((>= i 70) (setf result (+ result 4)))
        (t (setf result result))))))

;;; Nested loops
(defun nested-loops (n)
  (let ((sum 0))
    (dotimes (i n sum)
      (dotimes (j n)
        (setf sum (+ sum 1))))))

;;; Run all benchmarks
(defun run-all ()
  (let ((start 0) (end 0) (elapsed 0))
    (shell "echo 'JIT Benchmark Suite'")
    (shell "echo '==================='")
    (shell "echo ''")
    
    ;; Fib
    (shell "echo '=== Fibonacci(20) x100 ==='")
    (setf start (get-internal-real-time))
    (dotimes (i 100)
      (fib 20))
    (setf end (get-internal-real-time))
    (setf elapsed (- end start))
    (shell "echo 'Total time (ms):'")
    (print elapsed)
    (shell "echo ''")
    
    ;; Numeric loop
    (shell "echo '=== Numeric Loop(100k) x10 ==='")
    (setf start (get-internal-real-time))
    (dotimes (i 10)
      (numeric-loop 100000))
    (setf end (get-internal-real-time))
    (setf elapsed (- end start))
    (shell "echo 'Total time (ms):'")
    (print elapsed)
    (shell "echo ''")
    
    ;; Arithmetic
    (shell "echo '=== Arithmetic(10k) x50 ==='")
    (setf start (get-internal-real-time))
    (dotimes (i 50)
      (arithmetic-test 10000))
    (setf end (get-internal-real-time))
    (setf elapsed (- end start))
    (shell "echo 'Total time (ms):'")
    (print elapsed)
    (shell "echo ''")
    
    ;; List build
    (shell "echo '=== List Build(5k) x20 ==='")
    (setf start (get-internal-real-time))
    (dotimes (i 20)
      (build-list 5000))
    (setf end (get-internal-real-time))
    (setf elapsed (- end start))
    (shell "echo 'Total time (ms):'")
    (print elapsed)
    (shell "echo ''")
    
    ;; List sum  
    (shell "echo '=== List Sum(1k) x50 ==='")
    (setf start (get-internal-real-time))
    (dotimes (i 50)
      (sum-list-recursive (build-list 1000)))
    (setf end (get-internal-real-time))
    (setf elapsed (- end start))
    (shell "echo 'Total time (ms):'")
    (print elapsed)
    (shell "echo ''")
    
    ;; Comparisons
    (shell "echo '=== Comparisons(100) x100 ==='")
    (setf start (get-internal-real-time))
    (dotimes (i 100)
      (comparison-test 100))
    (setf end (get-internal-real-time))
    (setf elapsed (- end start))
    (shell "echo 'Total time (ms):'")
    (print elapsed)
    (shell "echo ''")
    
    ;; Nested loops
    (shell "echo '=== Nested Loops(100) x50 ==='")
    (setf start (get-internal-real-time))
    (dotimes (i 50)
      (nested-loops 100))
    (setf end (get-internal-real-time))
    (setf elapsed (- end start))
    (shell "echo 'Total time (ms):'")
    (print elapsed)
    (shell "echo ''")
    
    (shell "echo 'All benchmarks complete!'")))

(run-all)
