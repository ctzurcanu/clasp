;;;; Test current JIT capabilities

;; numeric-loop with setf and dotimes
(defun numeric-loop (n)
  (let ((acc 0))
    (dotimes (i n acc)
      (setf acc (+ acc (* i 3))))))

;; Recursive fibonacci
(defun fib (n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

;; Iterative fibonacci with setf
(defun fib-iter (n)
  (if (< n 2)
      n
      (let ((a 0) (b 1))
        (dotimes (i (- n 1) b)
          (let ((temp b))
            (setf b (+ a b))
            (setf a temp))))))

;; List building with push
(defun build-list (n)
  (let ((lst nil))
    (dotimes (i n)
      (push i lst))
    (length lst)))

;; List sum with reverse and nth
(defun test-reverse (n)
  (let ((lst nil))
    (dotimes (i n)
      (push i lst))
    (nth 0 (reverse lst))))

;; Even/odd counting
(defun count-even (n)
  (let ((count 0))
    (dotimes (i n count)
      (if (evenp i)
          (incf count)))))

(defun count-odd (n)
  (let ((count 0))
    (dotimes (i n count)
      (if (oddp i)
          (incf count)))))

;; Sum of even numbers
(defun sum-even (n)
  (let ((sum 0))
    (dotimes (i n sum)
      (if (evenp i)
          (setf sum (+ sum i))))))

;; Test logical operators
(defun test-and ()
  (and t t t))

(defun test-or ()
  (or nil nil t))

(defun test-not ()
  (not nil))

;; Test comparison in range check
(defun is-in-range (x low high)
  (and (>= x low) (<= x high)))

;; Run all tests
(numeric-loop 10)
(fib 10)
(fib-iter 10)
(build-list 10)
(test-reverse 10)
(count-even 100)
(count-odd 100)
(sum-even 100)
(test-and)
(test-or)
(test-not)
(is-in-range 5 0 10)
(is-in-range 15 0 10)
