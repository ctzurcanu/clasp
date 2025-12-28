;;;; benchmark-features-simple.lisp
;;;; Semantic coverage benchmark – zero arguments, interpreter-friendly

(defun time-it (name thunk)
  (let* ((start (get-internal-real-time))
         (result (funcall thunk))
         (end (get-internal-real-time))
         (elapsed (/ (- end start)
                     internal-time-units-per-second)))
    (format t "~&~A: ~,3F seconds~%" name elapsed)
    result))

;;; ------------------------------------------------------------
;;; 1. Numbers & arithmetic
;;; ------------------------------------------------------------

(defun number-test ()
  (let* ((a 42)
         (b 100000000000000000000) ; bignum
         (c (/ 3 7))
         (d 1.25d0))
    (+ a (truncate b 10000000000000000000)
       (numerator c)
       (round d))))

;;; ------------------------------------------------------------
;;; 2. Characters & strings
;;; ------------------------------------------------------------

(defun string-test ()
  (let ((s (make-string 10 :initial-element #\a)))
    (setf (aref s 5) #\Z)
    (string-upcase s)))

;;; ------------------------------------------------------------
;;; 3. Lists & cons cells
;;; ------------------------------------------------------------

(defun list-test ()
  (let ((lst '(1 2 3)))
    (push 0 lst)
    (append lst '(4 . 5))))

;;; ------------------------------------------------------------
;;; 4. Vectors & arrays
;;; ------------------------------------------------------------

(defun array-test ()
  (let ((v (make-array 5 :initial-contents '(1 2 3 4 5))))
    (setf (aref v 2) 99)
    (reduce #'+ v)))

;;; ------------------------------------------------------------
;;; 5. Hash tables
;;; ------------------------------------------------------------

(defun hash-test ()
  (let ((ht (make-hash-table :test 'equal)))
    (setf (gethash "a" ht) 1)
    (setf (gethash "b" ht) 2)
    (+ (gethash "a" ht)
       (gethash "b" ht))))

;;; ------------------------------------------------------------
;;; 6. Symbols & dynamic binding
;;; ------------------------------------------------------------

(defparameter *dyn* 10)

(defun symbol-test ()
  (let ((*dyn* 32))
    (+ *dyn* (symbol-value '*dyn*))))

;;; ------------------------------------------------------------
;;; 7. Closures
;;; ------------------------------------------------------------

(defun closure-test ()
  (let ((x 10))
    (funcall (lambda (y) (+ x y)) 5)))

;;; ------------------------------------------------------------
;;; 8. Multiple values
;;; ------------------------------------------------------------

(defun mv-test ()
  (multiple-value-bind (q r) (truncate 17 5)
    (+ q r)))

;;; ------------------------------------------------------------
;;; 9. Minimal CLOS (optional – comment out if unsupported)
;;; ------------------------------------------------------------

(defclass point ()
  ((x :initarg :x :accessor x)
   (y :initarg :y :accessor y)))

(defgeneric magnitude (p))

(defmethod magnitude ((p point))
  (sqrt (+ (* (x p) (x p))
           (* (y p) (y p)))))

(defun clos-test ()
  (magnitude (make-instance 'point :x 3 :y 4)))

;;; ------------------------------------------------------------
;;; 10. Condition system
;;; ------------------------------------------------------------

(defun condition-test ()
  (handler-case
      (/ 1 0)
    (division-by-zero () :ok)))

;;; ------------------------------------------------------------
;;; 11. Eval
;;; ------------------------------------------------------------

(defun eval-test ()
  (eval '(+ 1 2 3)))

;;; ------------------------------------------------------------
;;; Runner – NO ARGUMENTS
;;; ------------------------------------------------------------

(defun run-benchmarks ()
  (format t "~&Running Common Lisp semantic feature benchmarks...~%")
  (time-it "Numbers"          #'number-test)
  (time-it "Strings"          #'string-test)
  (time-it "Lists"            #'list-test)
  (time-it "Arrays"           #'array-test)
  (time-it "Hash tables"      #'hash-test)
  (time-it "Symbols"          #'symbol-test)
  (time-it "Closures"         #'closure-test)
  (time-it "Multiple values"  #'mv-test)
 
  (time-it "Conditions"       #'condition-test)
  (time-it "Eval"             #'eval-test)
  (time-it "CLOS"             #'clos-test)
  (format t "~&Done.~%"))

(run-benchmarks)