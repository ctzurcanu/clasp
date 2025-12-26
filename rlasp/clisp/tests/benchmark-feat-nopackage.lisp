;;;; benchmark-features-final.lisp
;;;; Broad Common Lisp semantic feature benchmark
;;;; SBCL / CLASP clean, rlasp-targeted



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Timing utility
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun time-it (name thunk)
  (let ((start (get-internal-real-time))
        (iterations 10000))
    (dotimes (i iterations)
      (funcall thunk))
    (format t "~&~A: ~,6F sec~%"
            name
            (/ (- (get-internal-real-time) start)
               internal-time-units-per-second))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Argument lists (ALL kinds, legally)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun optional-test (a &optional (b 2 b-p))
  (list a b b-p))

(defun rest-test (&rest r)
  r)

(defun key-test (&key (x 1) (y 2))
  (+ x y))

(defun allow-other-keys-test (&key x &allow-other-keys)
  x)

(defun aux-test (a &aux (b (+ a 1)))
  b)

(defun opt-rest-test (a &optional b &rest r)
  (list a b r))

(defun rest-key-test (&rest r &key k &allow-other-keys)
  (list r k))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Numbers (entire numeric tower)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun number-test ()
  (let ((i 10)
        (b (expt 10 30))     ; bignum
        (r 3/7)              ; ratio
        (f 1.25f0)           ; single float
        (d 1.25d0)           ; double float
        (c #C(3 4)))         ; complex
    (+ i
       (mod b 97)
       (numerator r)
       (denominator r)
       (round f)
       (round d)
       (realpart c)
       (imagpart c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Characters & strings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun string-test ()
  (let ((s (make-string 4 :initial-element #\a)))
    (setf (char s 1) #\Z)
    (string= s (copy-seq s))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Arrays
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun array-test ()
  (let ((v (make-array 5 :initial-contents '(1 2 3 4 5))))
    (setf (aref v 2) 99)
    (reduce #'+ v)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Lists
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun list-test ()
  (let ((x (list 1 2 3)))
    (setf (cadr x) 9)
    (append x '(4 5))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hash tables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun hash-test ()
  (let ((h (make-hash-table :test #'equal)))
    (setf (gethash "a" h) 1)
    (incf (gethash "a" h))
    (gethash "a" h)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Control flow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun control-test ()
  ;; Simplified version without complex loop macro
  (let ((sum 0))
    (dotimes (i 5)
      (if (evenp i)
          (setq sum (+ sum i))
          (setq sum (+ sum (- i)))))
    sum))

(defun nonlocal-test ()
  (block done
    (return-from done :ok)))

(defun tagbody-test ()
  (let ((i 0))
    (tagbody
     start
       (incf i)
       (when (< i 3)
         (go start)))
    i))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Functions, closures, environments
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun closure-test ()
  (let ((x 5))
    (funcall (lambda (y) (+ x y)) 3)))

(defun flet-labels-test ()
  (flet ((f (x) (+ x 1)))
    (labels ((g (y) (f y)))
      (g 10))))

(defun apply-funcall-test ()
  (+ (funcall #'+ 1 2)
     (apply #'+ '(3 4))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Multiple values
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun mv-test ()
  (multiple-value-bind (q r) (truncate 17 5)
    (+ q r)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SETF & generalized places
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun setf-test ()
  (let ((x (list 1 2)))
    (incf (car x))
    x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro twice (x)
  `(+ ,x ,x))

(defun macro-test ()
  (twice 21))

(defun macrolet-test ()
  (macrolet ((m (x) `(+ ,x 1)))
    (m 10)))

(defun symbol-macro-test ()
  (symbol-macrolet ((x 7))
    (* x x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EVAL & COMPILE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun eval-test ()
  (eval '(+ 1 2 3)))

(defun compile-test ()
  (funcall (compile nil '(lambda (x) (+ x 1))) 10))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Reader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun reader-test ()
  (read-from-string "(+ 1 2)"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Conditions (runtime, no folding)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun condition-test ()
  (handler-case
      (let ((x 0))
        (/ 1 x))
    (division-by-zero () :ok)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CLOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass point ()
  ((x :initarg :x :accessor x)
   (y :initarg :y :accessor y)))

(defgeneric magnitude (p))

(defmethod magnitude ((p point))
  (sqrt (+ (* (x p) (x p))
           (* (y p) (y p)))))

(defun clos-test ()
  (magnitude (make-instance 'point :x 3 :y 4)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Introspection
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun introspection-test ()
  (and (fboundp 'magnitude)
       (boundp '*package*)
       (functionp #'magnitude)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun run-benchmarks ()
  (format t "~&Running Common Lisp feature benchmark...~%")

  (time-it "Optional args"        (lambda () (optional-test 1)))
  (time-it "Rest args"            (lambda () (rest-test 1 2 3)))
  (time-it "Key args"             (lambda () (key-test :x 3 :y 4)))
  (time-it "Allow-other-keys"     (lambda () (allow-other-keys-test :x 1 :z 9)))
  (time-it "Aux args"             (lambda () (aux-test 5)))
  (time-it "Optional + Rest"      (lambda () (opt-rest-test 1 2 3 4)))
  (time-it "Rest + Key"           (lambda () (rest-key-test :k 9 :x 1)))

  (time-it "Numbers"              #'number-test)
  (time-it "Strings"              #'string-test)
  (time-it "Arrays"               #'array-test)
  (time-it "Lists"                #'list-test)
  (time-it "Hash tables"          #'hash-test)

  (time-it "Control flow"         #'control-test)
  (time-it "Non-local exit"       #'nonlocal-test)
  (time-it "Tagbody"              #'tagbody-test)

  (time-it "Closures"             #'closure-test)
  (time-it "FLET / LABELS"        #'flet-labels-test)
  (time-it "Apply / Funcall"      #'apply-funcall-test)
  (time-it "Multiple values"      #'mv-test)
  (time-it "SETF"                 #'setf-test)

  (time-it "Macros"               #'macro-test)
  (time-it "Macrolet"             #'macrolet-test)
  (time-it "Symbol macros"        #'symbol-macro-test)

  (time-it "Eval"                 #'eval-test)
  (time-it "Compile"              #'compile-test)
  (time-it "Reader"               #'reader-test)

  (time-it "Conditions"           #'condition-test)
  (time-it "CLOS"                 #'clos-test)
  (time-it "Introspection"        #'introspection-test)

  (format t "~&Done.~%"))
(run-benchmarks)
