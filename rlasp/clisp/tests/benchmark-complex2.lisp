;;;; benchmark-features-complete.lisp
;;;; Maximal Common Lisp semantic feature benchmark
;;;; Interpreter-friendly, feature-rich, lightweight.

;;;; -------------------------------------------------------------------
;;;; Timing helper
;;;; -------------------------------------------------------------------

(defun time-it (name thunk)
  "Time a single evaluation of THUNK and report."
  (let ((result (ignore-errors
                  (let* ((start (get-internal-real-time))
                         (res (funcall thunk))
                         (end (get-internal-real-time)))
                    (format t "~&~A: ~,6F sec~%" name
                            (/ (- end start)
                               internal-time-units-per-second))
                    res))))
    result))

;;;; -------------------------------------------------------------------
;;;; 1. Numbers
;;;; -------------------------------------------------------------------

(defun numbers-test ()
  (let ((i 42)
        (b 12345678901234567890) ; bignum
        (r (/ 3 7))              ; ratio
        (f 3.14)
        (d 1.25d0)
        (c #C(3 4)))              ; complex
    (+ i b (numerator r) (denominator r) f d (realpart c) (imagpart c))))

;;;; -------------------------------------------------------------------
;;;; 2. Characters
;;;; -------------------------------------------------------------------

(defun chars-test ()
  (let ((a #\A) (b #\Z))
    (char-code a)
    (char-code b)
    (char-upcase a)
    (char-downcase b)))

;;;; -------------------------------------------------------------------
;;;; 3. Strings
;;;; -------------------------------------------------------------------

(defun strings-test ()
  (let ((s (make-string 5 :initial-element #\a)))
    (setf (aref s 2) #\Z)
    (string-upcase s)
    (string-downcase s)
    (concatenate 'string s "END")))

;;;; -------------------------------------------------------------------
;;;; 4. Lists
;;;; -------------------------------------------------------------------

(defun lists-test ()
  (let ((lst (list 1 2 3)))
    (push 0 lst)
    (append lst '(4 5 6))
    (setf (cadr lst) 99)
    lst))

;;;; -------------------------------------------------------------------
;;;; 5. Vectors / arrays
;;;; -------------------------------------------------------------------

(defun arrays-test ()
  (let ((v #(1 2 3 4 5)))
    (setf (aref v 1) 99)
    (reduce #'+ v)))

;;;; -------------------------------------------------------------------
;;;; 6. Hash tables
;;;; -------------------------------------------------------------------

(defun hash-tables-test ()
  (let ((ht (make-hash-table :test 'equal)))
    (setf (gethash "a" ht) 1)
    (setf (gethash "b" ht) 2)
    (+ (gethash "a" ht) (gethash "b" ht))))

;;;; -------------------------------------------------------------------
;;;; 7. Symbols & packages
;;;; -------------------------------------------------------------------

(defun symbols-test ()
  (let ((sym 'run-benchmarks)
        (key :keyword))
    (list (symbol-name sym)
          (package-name (symbol-package sym))
          (symbolp sym)
          (keywordp key))))

;;;; -------------------------------------------------------------------
;;;; 8. Dynamic binding & closures
;;;; -------------------------------------------------------------------

(defparameter *dyn* 10)

(defun dynamic-closure-test ()
  (let ((*dyn* 20))
    (+ *dyn* (symbol-value '*dyn*)))
  (let ((x 5))
    (funcall (lambda (y) (+ x y)) 10)))

;;;; -------------------------------------------------------------------
;;;; 9. Multiple values
;;;; -------------------------------------------------------------------

(defun multiple-values-test ()
  (multiple-value-bind (q r) (truncate 17 5)
    (+ q r))
  (values 1 2 3))

;;;; -------------------------------------------------------------------
;;;; 10. Control flow
;;;; -------------------------------------------------------------------

(defun control-flow-test ()
  (let ((sum 0))
    (dotimes (i 5 sum)
      (if (evenp i)
          (incf sum i)
          (decf sum i)))))

(defun nonlocal-exit-test ()
  (block done
    (dotimes (i 10)
      (when (= i 5)
        (return-from done i)))))

(defun tagbody-test ()
  (let ((x 0))
    (tagbody
     start
       (incf x)
       (when (< x 3)
         (go start)))
    x))

;;;; -------------------------------------------------------------------
;;;; 11. Functions
;;;; -------------------------------------------------------------------

(defun function-def-test ()
  (labels ((fib (n) (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2))))))
    (fib 5)))

(defun funcall-apply-test ()
  (+ (funcall #'+ 1 2) (apply #'+ '(3 4))))

;;;; -------------------------------------------------------------------
;;;; 12. Macros
;;;; -------------------------------------------------------------------

(defmacro simple-macro (x) `(+ ,x ,x))

(defun macros-test ()
  (simple-macro 10)
  (macroexpand-1 '(simple-macro 10))
  (macroexpand '(simple-macro 10)))

;;;; -------------------------------------------------------------------
;;;; 13. CLOS
;;;; -------------------------------------------------------------------

(defclass point ()
  ((x :initarg :x :accessor x)
   (y :initarg :y :accessor y)))


(defgeneric magnitude (p &rest args))
(defmethod magnitude ((p point) &rest args)
  (sqrt (+ (* (x p) (x p))
           (* (y p) (y p)))))



(defun clos-test ()
  (let ((p (make-instance 'point :x 3 :y 4)))
    (magnitude p)
    (call-next-method p)))

;;;; -------------------------------------------------------------------
;;;; 14. Conditions
;;;; -------------------------------------------------------------------

(defun conditions-test ()
  (handler-case
      (/ 1 0)
    (division-by-zero () :ok)
    (error (e) e)))

(defun ignore-errors-test ()
  (ignore-errors (/ 1 0)))

;;;; -------------------------------------------------------------------
;;;; 15. Eval / compile / reader
;;;; -------------------------------------------------------------------

(defun eval-test ()
  (eval '(+ 1 2 3))
  (read-from-string "(+ 10 20)"))

;;;; -------------------------------------------------------------------
;;;; 16. Gensym
;;;; -------------------------------------------------------------------

(defun gensym-test ()
  (let ((s1 (gensym)) (s2 (gensym)))
    (not (eq s1 s2))))

;;;; -------------------------------------------------------------------
;;;; Runner
;;;; -------------------------------------------------------------------

(defun run-benchmarks ()
  (format t "~&Running MAXIMAL Common Lisp feature benchmarks...~%")
  (time-it "Numbers"                #'numbers-test)
  (time-it "Characters"             #'chars-test)
  (time-it "Strings"                #'strings-test)
  (time-it "Lists"                  #'lists-test)
  (time-it "Arrays / vectors"       #'arrays-test)
  (time-it "Hash tables"            #'hash-tables-test)
  (time-it "Symbols & packages"     #'symbols-test)
  (time-it "Dynamic binding & closures" #'dynamic-closure-test)
  (time-it "Multiple values"        #'multiple-values-test)
  (time-it "Control flow"           #'control-flow-test)
  (time-it "Non-local exits"        #'nonlocal-exit-test)
  (time-it "Tagbody / Go"           #'tagbody-test)
  (time-it "Functions / recursion"  #'function-def-test)
  (time-it "Funcall / Apply"        #'funcall-apply-test)
  (time-it "Macros"                 #'macros-test)
  (time-it "CLOS / Objects"         #'clos-test)
  (time-it "Conditions / Errors"    #'conditions-test)
  (time-it "Ignore-errors"          #'ignore-errors-test)
  (time-it "Eval / Reader"          #'eval-test)
  (time-it "Gensym"                 #'gensym-test)
  (format t "~&Done.~%"))
