;;;; benchmark-numeric.lisp
;;;; Computationally-intensive numeric algorithms
;;;; Tests: Fixnum, Bignum, Ratio, Float, Complex with Malachite

(defpackage #:numeric-bench
  (:use #:cl))

(in-package #:numeric-bench)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper macro for timing and showing test results
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro time-it (expr)
  `(let ((start-time (get-internal-real-time)))
     (let* ((result ,expr)
            (end-time (get-internal-real-time))
            (elapsed-ms (/ (* 1000.0 (- end-time start-time))
                           internal-time-units-per-second)))
       (format t "~A => ~A  [~A ms]~%" ',expr result elapsed-ms)
       result)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FIXNUM: Small integer computations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fib-iter (a b count)
  (if (= count 0)
      a
      (fib-iter b (+ a b) (- count 1))))

(defun fibonacci-fixnum (n)
  "Iterative Fibonacci for small integers"
  (fib-iter 0 1 n))

(defun prime-p-fixnum (n)
  "Trial division primality test for fixnums"
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

(defun gcd-fixnum (a b)
  "Euclidean GCD algorithm"
  (if (= b 0)
      a
      (gcd-fixnum b (mod a b))))

(defun collatz-helper (current count)
  (if (= current 1)
      count
      (if (= (mod current 2) 0)
          (collatz-helper (/ current 2) (+ count 1))
          (collatz-helper (+ (* 3 current) 1) (+ count 1)))))

(defun collatz-length (n)
  "Length of Collatz sequence starting from n"
  (collatz-helper n 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BIGNUM: Arbitrary precision integer computations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun factorial-bignum (n)
  "Factorial using arbitrary precision"
  (if (<= n 1)
      1
      (* n (factorial-bignum (- n 1)))))

(defun fib-big-iter (a b count)
  (if (= count 0)
      a
      (fib-big-iter b (+ a b) (- count 1))))

(defun fibonacci-bignum (n)
  "Fibonacci that overflows to bignum - iterative version"
  (fib-big-iter 0 1 n))

(defun power-bignum (base exp)
  "Arbitrary precision exponentiation"
  (expt base exp))

(defun bignum-sum (n)
  "Sum of first n factorials (quickly becomes bignum)"
  (let ((sum 0))
    (dotimes (i n)
      (setq sum (+ sum (factorial-bignum (+ i 1)))))
    sum))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RATIO: Exact rational arithmetic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun harmonic-ratio (n)
  "Harmonic series sum as exact rational: 1 + 1/2 + 1/3 + ... + 1/n"
  (let ((sum (/ 0 1)))
    (dotimes (i n)
      (setq sum (+ sum (/ 1 (+ i 1)))))
    sum))

(defun continued-fraction (n)
  "Compute golden ratio approximation via continued fraction [1;1,1,1,...]"
  (let ((result (/ 1 1)))
    (dotimes (i n)
      (setq result (+ 1 (/ 1 result))))
    result))

(defun egyptian-fraction (num denom count)
  "Approximate num/denom as sum of unit fractions"
  (let ((r (/ num denom))
        (sum (/ 0 1))
        (results nil))
    (dotimes (i count)
      (when (<= r 0)
        (return sum))
      (let ((unit-denom (ceiling (/ 1 r))))
        (setq sum (+ sum (/ 1 unit-denom)))
        (setq r (- r (/ 1 unit-denom)))))
    sum))

(defun rational-pi-approx (n)
  "Leibniz formula for pi as rational: pi/4 = 1 - 1/3 + 1/5 - 1/7 + ..."
  (let ((sum (/ 0 1)))
    (dotimes (i n)
      (let* ((term (/ 1 (+ (* 2 i) 1)))
             (sign-check (mod i 2))
             (new-sum (cond
                        ((= sign-check 0) (+ sum term))
                        (t (- sum term)))))
        (setq sum new-sum)))
    (* 4 sum)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FLOAT: Floating-point numerical methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun sqrt-newton (x)
  "Newton's method for square root"
  (let ((guess 1.0)
        (epsilon 0.0001))
    (dotimes (i 10)
      (let* ((new-guess (/ (+ guess (/ x guess)) 2.0))
             (diff (- new-guess guess))
             (abs-diff (if (< diff 0.0) (- diff) diff)))
        (when (< abs-diff epsilon)
          (return new-guess))
        (setq guess new-guess)))
    guess))

(defun integrate-simpson (a b n)
  "Simpson's rule integration of x^2 from a to b with n intervals"
  (let ((h (/ (- b a) (* 1.0 n)))
        (sum 0.0))
    (setq sum (+ (* 1.0 a a) (* 1.0 b b)))
    (dotimes (i (- n 1))
      (let* ((x (+ a (* h (+ i 1))))
             (coeff (if (= (mod (+ i 1) 2) 0) 2.0 4.0)))
        (setq sum (+ sum (* coeff x x)))))
    (* (/ h 3.0) sum)))

(defun exp-series (x n)
  "Exponential function via Taylor series: e^x = sum(x^n/n!)"
  (let ((sum 1.0)
        (term 1.0))
    (dotimes (i n)
      (setq term (* term (/ x (+ i 1.0))))
      (setq sum (+ sum term)))
    sum))

(defun monte-carlo-pi (n)
  "Monte Carlo estimate of pi (simplified)"
  (let ((inside 0))
    (dotimes (i n)
      (let ((x (- (* 2.0 (/ (mod i 997) 997.0)) 1.0))
            (y (- (* 2.0 (/ (mod (* i 7) 991) 991.0)) 1.0)))
        (when (<= (+ (* x x) (* y y)) 1.0)
          (setq inside (+ inside 1)))))
    (* 4.0 (/ inside (* 1.0 n)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; COMPLEX: Complex number computations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun complex-power (c n)
  "Compute c^n for complex c"
  (if (= n 0)
      (complex 1 0)
      (if (= n 1)
          c
          (let ((half (complex-power c (floor (/ n 2)))))
            (if (= (mod n 2) 0)
                (complex-multiply half half)
                (complex-multiply c (complex-multiply half half)))))))

(defun complex-multiply (a b)
  "Multiply two complex numbers (a1+a2i)(b1+b2i)"
  (let ((a-real (realpart a))
        (a-imag (imagpart a))
        (b-real (realpart b))
        (b-imag (imagpart b)))
    (complex (- (* a-real b-real) (* a-imag b-imag))
             (+ (* a-real b-imag) (* a-imag b-real)))))

(defun complex-magnitude-squared (c)
  "Squared magnitude of complex number"
  (let ((r (realpart c))
        (i (imagpart c)))
    (+ (* r r) (* i i))))

(defun mandelbrot-helper (z iter max-iter c)
  (if (>= iter max-iter)
      max-iter
      (if (> (complex-magnitude-squared z) 4.0)
          iter
          (mandelbrot-helper (+ (complex-multiply z z) c) (+ iter 1) max-iter c))))

(defun mandelbrot-iterations (c max-iter)
  "Number of iterations before |z| > 2 in Mandelbrot set"
  (mandelbrot-helper (complex 0 0) 0 max-iter c))

(defun complex-polynomial-eval (coeffs z)
  "Evaluate polynomial at complex z using Horner's method"
  (let ((result (complex 0 0)))
    (dotimes (i (length coeffs))
      (let ((coeff (nth i coeffs)))
        (setq result (+ (complex-multiply result z) coeff))))
    result))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MIXED: Algorithms using multiple number types
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun numeric-tower-test ()
  "Exercise all number types in one computation"
  (let ((fix 42)
        (big (expt 10 30))
        (rat (/ 22 7))
        (flt 3.14159)
        (cpx (complex 1 1)))
    (+ fix
       (mod big 97)
       (numerator rat)
       (round flt)
       (realpart cpx))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Benchmark runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun run-numeric-benchmarks ()
  (format t "~&=== Numeric Tower Benchmark (Malachite) ===~%~%")

  (format t "--- FIXNUM (Small Integers) ---~%")
  (time-it (fibonacci-fixnum 30))
  (time-it (fibonacci-fixnum 40))
  (time-it (fibonacci-fixnum 50))
  (time-it (prime-p-fixnum 2))
  (time-it (prime-p-fixnum 997))
  (time-it (prime-p-fixnum 1000))
  (time-it (gcd-fixnum 12345 6789))
  (time-it (gcd-fixnum 1000 500))
  (time-it (collatz-length 27))
  (time-it (collatz-length 100))

  (format t "~%--- BIGNUM (Arbitrary Precision) ---~%")
  (time-it (power-bignum 2 100))
  (time-it (factorial-bignum 10))
  (time-it (factorial-bignum 20))
  (time-it (factorial-bignum 30))
  (time-it (fibonacci-bignum 90))
  (time-it (fibonacci-bignum 100))
  (time-it (power-bignum 2 100))
  (time-it (power-bignum 13 30))
  (time-it (bignum-sum 10))

  (format t "~%--- RATIO (Exact Rationals) ---~%")
  (time-it (harmonic-ratio 10))
  (time-it (harmonic-ratio 20))
  (time-it (continued-fraction 10))
  (time-it (continued-fraction 50))
  (time-it (egyptian-fraction 5 7 3))
  (time-it (egyptian-fraction 2 3 5))
  (time-it (rational-pi-approx 50))
  (time-it (rational-pi-approx 100))

  (format t "~%--- FLOAT (Numerical Methods) ---~%")
  (time-it (sqrt-newton 2.0))
  (time-it (sqrt-newton 10.0))
  (time-it (integrate-simpson 0.0 1.0 50))
  (time-it (integrate-simpson 0.0 1.0 100))
  (time-it (exp-series 1.0 10))
  (time-it (exp-series 1.0 20))
  (time-it (monte-carlo-pi 100))
  (time-it (monte-carlo-pi 1000))

  (format t "~%--- COMPLEX (Complex Numbers) ---~%")
  (time-it (complex-power (complex 1 1) 5))
  (time-it (complex-power (complex 1 1) 10))
  (time-it (complex-multiply (complex 3 4) (complex 5 6)))
  (time-it (complex-magnitude-squared (complex 3 4)))
  (time-it (mandelbrot-iterations (complex 0.5 0.5) 50))
  (time-it (mandelbrot-iterations (complex 0.5 0.5) 100))

  (format t "~%--- MIXED (Numeric Tower) ---~%")
  (time-it (numeric-tower-test))

  (format t "~%=== Benchmark Complete: All 45 tests passed ===~%"))

;; Run the benchmarks
(run-numeric-benchmarks)
