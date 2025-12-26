;;;; cffi.lisp - FFI (Foreign Function Interface) Demo for rlasp
;;;;
;;;; This file demonstrates rlasp's FFI capabilities.
;;;; It can now be loaded with (load "cffi.lisp") or run in the REPL!

(format t "~%=== rlasp FFI Demo ===~%~%")

;; 1. Load the math library
(load-lib "libm")
(format t "✓ Loaded libm~%~%")

;; 2. Define foreign functions
(defforeign demo-sqrt "sqrt" double double)
(defforeign demo-pow "pow" double double double)
(defforeign demo-sin "sin" double double)
(defforeign demo-cos "cos" double double)
(defforeign demo-fabs "fabs" double double)
(format t "✓ Defined FFI functions~%~%")

;; 3. Test basic calls
(format t "Basic Tests:~%")
(format t "  sqrt(16) = ~A~%"  (demo-sqrt 16.0))
(format t "  pow(2,3) = ~A~%" (demo-pow 2.0 3.0))
(format t "  sin(π/2) = ~A~%" (demo-sin 1.5708))
(format t "  cos(π) = ~A~%"   (demo-cos 3.14159))
(format t "  fabs(-42.5) = ~A~%~%" (demo-fabs -42.5))

;; 4. Define and test Lisp function using FFI
(defun hypotenuse (a b)
  "Calculate hypotenuse using FFI functions"
  (demo-sqrt (+ (demo-pow a 2.0) (demo-pow b 2.0))))

(defun distance (x1 y1 x2 y2)
  "Calculate distance between two points using FFI"
  (let ((dx (demo-fabs (- x2 x1)))
        (dy (demo-fabs (- y2 y1))))
    (demo-sqrt (+ (demo-pow dx 2.0) (demo-pow dy 2.0)))))

(format t "Pythagorean Theorem:~%")
(format t "  hypotenuse(3,4) = ~A~%" (hypotenuse 3.0 4.0))
(format t "  hypotenuse(5,12) = ~A~%~%" (hypotenuse 5.0 12.0))

(format t "Distance Formula:~%")
(format t "  distance(0,0,3,4) = ~A~%" (distance 0.0 0.0 3.0 4.0))
(format t "  distance(1,2,4,6) = ~A~%~%" (distance 1.0 2.0 4.0 6.0))

(format t "✓ FFI is working!~%~%")


;;;;
;;;; === FFI Tutorial ===
;;;;

;;;; Supported FFI Types
;;;;
;;;; Integer types:
;;;;   int8, uint8     - 8-bit signed/unsigned integers
;;;;   int16, uint16   - 16-bit signed/unsigned integers
;;;;   int32, uint32   - 32-bit signed/unsigned integers
;;;;   int64, uint64   - 64-bit signed/unsigned integers
;;;;
;;;; Floating-point types:
;;;;   float           - 32-bit floating point
;;;;   double          - 64-bit floating point
;;;;
;;;; Other types:
;;;;   void            - For functions with no return value
;;;;   pointer         - Generic pointer type

;;;; Loading Foreign Libraries
;;;;
;;;; Syntax: (load-lib "library-name")
;;;;
;;;; On different platforms, you can load:
;;;;   macOS:  (load-lib "libc.dylib")
;;;;   Linux:  (load-lib "libc.so.6")
;;;;   Windows: (load-lib "msvcrt.dll")
;;;;
;;;; The special name "libm" automatically uses the correct platform path.

;;;; Defining Foreign Functions
;;;;
;;;; Syntax: (defforeign lisp-name "c-symbol" param-types... return-type)
;;;;
;;;; Examples:
;;;;   (defforeign my-sqrt "sqrt" double double)
;;;;   (defforeign my-pow "pow" double double double)
;;;;   (defforeign my-floor "floor" double double)
;;;;   (defforeign my-ceil "ceil" double double)

;;;; Available Math Functions (after loading libm)
;;;;
;;;; Basic: sqrt, pow, fabs, fmod
;;;; Trig: sin, cos, tan, asin, acos, atan, atan2
;;;; Hyperbolic: sinh, cosh, tanh, asinh, acosh, atanh
;;;; Exponential: exp, exp2, expm1, log, log10, log2, log1p
;;;; Rounding: ceil, floor, round, trunc
;;;; Other: fmin, fmax, fdim, copysign, nan, hypot, cbrt

;;;; Example: Define more functions
;;;;
;;;; (defforeign my-exp "exp" double double)
;;;; (defforeign my-log "log" double double)
;;;; (defforeign my-atan2 "atan2" double double double)
;;;; (defforeign my-hypot "hypot" double double double)

