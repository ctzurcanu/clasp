;;;; benchmark-tiny.lisp
;;;; Very small iteration counts for quick interpreter testing

(defpackage #:cl-bench
  (:use #:cl)
  (:export #:run-benchmarks))

(in-package #:cl-bench)

(defun time-it (name thunk)
  (let* ((start (get-internal-real-time))
         (result (funcall thunk))
         (end (get-internal-real-time))
         (elapsed (/ (- end start)
                     internal-time-units-per-second)))
    (format t "~&~A: ~,3F seconds~%" name elapsed)
    result))

(defun numeric-loop (n)
  (let ((acc 0))
    (dotimes (i n acc)
      (setf acc (+ acc (* i 3))))))

;; Iterative fibonacci - much faster
(defun fib-iter (n)
  (if (< n 2)
      n
      (let ((a 0) (b 1))
        (dotimes (i (- n 1) b)
          (let ((temp b))
            (setf b (+ a b))
            (setf a temp))))))

;; Recursive fibonacci - keep it small!
(defun fib (n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

(defun build-and-sum (n)
  (let ((lst nil))
    (dotimes (i n)
      (push i lst))
    (reduce #'+ lst)))

(defun hash-bench (n)
  (let ((ht (make-hash-table :test 'eq)))
    (dotimes (i n)
      (setf (gethash i ht) (* i i)))
    (let ((sum 0))
      (maphash (lambda (k v)
                 (declare (ignore k))
                 (incf sum v))
               ht)
      sum)))

(defun make-adder (x)
  (lambda (y) (+ x y)))

(defun closure-test (n)
  (let ((fns (loop for i below n collect (make-adder i)))
        (sum 0))
    (dolist (f fns sum)
      (incf sum (funcall f 10)))))

(defclass point ()
  ((x :initarg :x :accessor x)
   (y :initarg :y :accessor y)))

(defgeneric distance (p))

(defmethod distance ((p point))
  (sqrt (+ (* (x p) (x p))
           (* (y p) (y p)))))

(defun clos-test (n)
  (let ((sum 0.0d0))
    (dotimes (i n sum)
      (let ((p (make-instance 'point :x i :y i)))
        (incf sum (distance p))))))

(defun run-benchmarks (&key
                         (numeric-n 100000)     ; Fast loop test
                         (fib-n 15)             ; fib(15) = 610, manageable for recursion
                         (fib-iter-n 1000)      ; Iterative can handle more
                         (alloc-n 10000)        ; List allocation
                         (hash-n 5000)          ; Hash operations
                         (closure-n 500)        ; Closure creation
                         (clos-n 500))          ; CLOS instances
  (format t "~&Running Common Lisp benchmarks (tiny/interpreter)...~%")
  (time-it "Numeric loop"
           (lambda () (numeric-loop numeric-n)))
  (time-it "Fibonacci (recursive)"
           (lambda () (fib fib-n)))
  (time-it "Fibonacci (iterative)"
           (lambda () (fib-iter fib-iter-n)))
  (time-it "Allocation / list processing"
           (lambda () (build-and-sum alloc-n)))
  (time-it "Hash table"
           (lambda () (hash-bench hash-n)))
  (time-it "Closures"
           (lambda () (closure-test closure-n)))
  (time-it "CLOS"
           (lambda () (clos-test clos-n)))
  (format t "~&Done.~%"))
