(in-package :cl-user)

(format t "issue-930 => ~S~%"
        (handler-case
            (progn (funcall 'progn 1) :bad)
          (undefined-function (uf)
            (list :type (type-of uf)
                  :name (cell-error-name uf)
                  :eq-progn (eq (cell-error-name uf) 'progn)))))

(define-setf-expander issue-982-place (place &environment env)
  (get-setf-expansion `(cdr ,place) env))

(format t "issue-982-flet => ~S~%"
        (flet ((issue-982-place (c) (car c))
               ((setf issue-982-place) (n c) (setf (car c) n)))
          (declare (ignore #'issue-982-place))
          (let ((c (cons nil nil)))
            (setf (issue-982-place c) t)
            (list :car (car c) :cdr (cdr c)))))

(format t "issue-982-labels => ~S~%"
        (labels ((issue-982-place (c) (car c))
                 ((setf issue-982-place) (n c) (setf (car c) n)))
          (declare (ignore #'issue-982-place))
          (let ((c (cons nil nil)))
            (setf (issue-982-place c) t)
            (list :car (car c) :cdr (cdr c)))))

(format t "issue-982-macrolet => ~S~%"
        (macrolet ((issue-982-place (c) `(car ,c)))
          (let ((c (cons nil nil)))
            (setf (issue-982-place c) t)
            (list :car (car c) :cdr (cdr c)))))

(define-setf-expander macro-place-1 (place &environment env)
  (get-setf-expansion `(cdr ,place) env))

(defmacro macro-place-1 (place) `(car ,place))

(format t "macro-place-1 => ~S~%"
        (macrolet ((macro-place-pre (place) `(macro-place-1 ,place)))
          (let ((c (cons nil nil)))
            (setf (macro-place-pre c) t)
            (list :car (car c) :cdr (cdr c)))))
