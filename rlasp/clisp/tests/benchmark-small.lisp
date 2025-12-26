;;;; benchmark-small.lisp
;;;; Reduced iteration counts for interpreter testing

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
  (declare (fixnum n))
  (let ((acc 0))
    (declare (fixnum acc))
    (dotimes (i n acc)
      (declare (fixnum i))
      (setf acc (+ acc (the fixnum (* i 3)))))))

(defun fib (n)
  (declare (fixnum n))
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
                         (numeric-n 500000)      ; 100x smaller
                         (fib-n 25)              ; 10 smaller
                         (alloc-n 50000)         ; 100x smaller
                         (hash-n 20000)          ; 100x smaller
                         (closure-n 2000)        ; 100x smaller
                         (clos-n 2000))          ; 100x smaller
  (format t "~&Running Common Lisp benchmarks (interpreter-sized)...~%")
  (time-it "Numeric loop"
           (lambda () (numeric-loop numeric-n)))
  (time-it "Fibonacci"
           (lambda () (fib fib-n)))
  (time-it "Allocation / list processing"
           (lambda () (build-and-sum alloc-n)))
  (time-it "Hash table"
           (lambda () (hash-bench hash-n)))
  (time-it "Closures"
           (lambda () (closure-test closure-n)))
  (time-it "CLOS"
           (lambda () (clos-test clos-n)))
  (format t "~&Done.~%"))
