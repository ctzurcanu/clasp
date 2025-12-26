;; RLASP DEMO - All Working Features
;; =================================

;; BASIC ARITHMETIC
(+ 1 2)
(* 3 4)
(- 10 5)
(+ (* 2 3) (- 10 4))

;; NUMBERS - Integers & Floats
42
-123
3.14159

;; CONS CELLS
(cons 1 2)
(cons 'a 'b)

;; QUOTED LISTS
'(hello world)
'(a (nested (list)))

;; SYMBOLS
'foo
'bar-baz

;; KEYWORDS (read as symbols)
:key1
:key2

;; CHARACTERS
#\a
#\newline
#\space

;; VECTORS
#(1 2 3)
#(a b c)

;; STRINGS
"Hello, World!"

;; WHEN/UNLESS (single line)
(when t (+ 1 2))
(unless nil 42)

;; DEFUN on single line
(defun add (a b) (+ a b))
(add 10 20)

;; FACTORIAL
(defun factorial (n) (if (<= n 1) 1 (* n (factorial (- n 1)))))
(factorial 5)
(factorial 10)

;; IF EXPRESSIONS
(if t "yes" "no")
(if (> 5 3) "5 > 3" "nope")

;; PROGN (single line)
(progn (+ 1 2) (* 3 4))

;; C FFI - Load libm
(load-lib "libm")
(defforeign sqrt "sqrt" double double)
(defforeign sin "sin" double double)
(defforeign cos "cos" double double)
(defforeign pow "pow" double double double)

;; Call C functions
(sqrt 16.0)
(sqrt 25.0)
(sin 0.0)
(cos 0.0)
(pow 2.0 8.0)

;; Direct namespace calls
(libm:sqrt 144.0)
(libm:pow 3.0 4.0)

;; COMPARISONS
(= 5 5)
(< 3 7)
(> 10 2)

:quit
