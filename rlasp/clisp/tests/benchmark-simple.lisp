;;;; benchmark-simple.lisp
;;;; Simple numeric benchmarks for rlasp MLIR JIT

(defpackage #:numeric-bench-simple
  (:use #:cl))

(in-package #:numeric-bench-simple)

;; FIXNUM functions
(defun fib-iter (a b count)
  (if (= count 0)
      a
      (fib-iter b (+ a b) (- count 1))))

(defun fibonacci-fixnum (n)
  (fib-iter 0 1 n))

(defun gcd-fixnum (a b)
  (if (= b 0)
      a
      (gcd-fixnum b (mod a b))))

(defun prime-p-fixnum (n)
  (if (< n 2)
      nil
      (if (= n 2)
          t
          (let ((limit (floor (sqrt (* 1.0 n)))))
            (let ((result t))
              (dotimes (i (- limit 1))
                (let ((d (+ i 2)))
                  (when (= (mod n d) 0)
                    (setq result nil))))
              result)))))

(defun collatz-helper (current count)
  (if (= current 1)
      count
      (if (= (mod current 2) 0)
          (collatz-helper (/ current 2) (+ count 1))
          (collatz-helper (+ (* 3 current) 1) (+ count 1)))))

(defun collatz-length (n)
  (collatz-helper n 0))

;; BIGNUM functions
(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

(defun power (base exp)
  (expt base exp))

;; Benchmark runner
(defun run-benchmarks ()
  (format t "=== Numeric Benchmark (rlasp MLIR JIT) ===~%")
  (format t "~%")
  (format t "--- FIXNUM (Small Integers) ---~%")
  (format t "fibonacci-fixnum 30: ~A~%" (fibonacci-fixnum 30))
  (format t "fibonacci-fixnum 40: ~A~%" (fibonacci-fixnum 40))
  (format t "prime-p-fixnum 997: ~A~%" (prime-p-fixnum 997))
  (format t "gcd-fixnum 12345 6789: ~A~%" (gcd-fixnum 12345 6789))
  (format t "collatz-length 27: ~A~%" (collatz-length 27))
  (format t "~%")
  (format t "--- BIGNUM (Large Integers) ---~%")
  (format t "factorial 10: ~A~%" (factorial 110))
  (format t "power 10 20: ~A~%" (power 13 20))
  (format t "~%")
  (format t "=== Benchmark Complete ===~%"))

;; Run the benchmarks
(run-benchmarks)
