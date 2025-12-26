;;;; benchmark.lisp
;;;; Portable Common Lisp benchmark
;;;; Designed for SBCL, CLASP, and rlasp

(defpackage #:cl-bench
  (:use #:cl)
  (:export #:run-benchmarks))

(in-package #:cl-bench)

;;; ------------------------------------------------------------
;;; Timing utility
;;; ------------------------------------------------------------

(defun time-it (name thunk)
  (let* ((start (get-internal-real-time))
         (result (funcall thunk))
         (end (get-internal-real-time))
         (elapsed (/ (- end start)
                     internal-time-units-per-second)))
    (format t "~&~A: ~,3F seconds~%" name elapsed)
    result))

;;; ------------------------------------------------------------
;;; 1. Numeric loop (tight arithmetic)
;;; ------------------------------------------------------------

(defun numeric-loop (n)
  (declare (fixnum n))
  (let ((acc 0))
    (declare (fixnum acc))
    (dotimes (i n acc)
      (declare (fixnum i))
      (setf acc (+ acc (the fixnum (* i 3)))))))

;;; ------------------------------------------------------------
;;; 2. Recursive computation (Fibonacci)
;;; ------------------------------------------------------------

(defun fib (n)
  (declare (fixnum n))
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

;;; ------------------------------------------------------------
;;; 3. Allocation-heavy list processing
;;; ------------------------------------------------------------

(defun build-and-sum (n)
  (let ((lst nil))
    (dotimes (i n)
      (push i lst))
    (reduce #'+ lst)))

;;; ------------------------------------------------------------
;;; 4. Hash-table stress
;;; ------------------------------------------------------------

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

;;; ------------------------------------------------------------
;;; 5. Closures
;;; ------------------------------------------------------------

(defun make-adder (x)
  (lambda (y) (+ x y)))

(defun closure-test (n)
  (let ((fns (loop for i below n collect (make-adder i)))
        (sum 0))
    (dolist (f fns sum)
      (incf sum (funcall f 10)))))

;;; ------------------------------------------------------------
;;; 6. Generic functions & CLOS
;;; ------------------------------------------------------------

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

;;; ------------------------------------------------------------
;;; Benchmark runner
;;; ------------------------------------------------------------

(defun run-benchmarks (&key
                         (numeric-n 50000000)
                         (fib-n 35)
                         (alloc-n 5000000)
                         (hash-n 2000000)
                         (closure-n 200000)
                         (clos-n 200000))
  (format t "~&Running Common Lisp benchmarks...~%")
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
