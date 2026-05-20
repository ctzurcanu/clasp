(in-package :cl-user)

(format t "direct handler => ~S~%"
        (handler-case
            (progn (funcall 'progn 1) :bad)
          (undefined-function (uf)
            (list :caught t
                  :type (type-of uf)
                  :name (cell-error-name uf)
                  :eq-progn (eq (cell-error-name uf) 'progn)))
          (error (e)
            (list :caught-error t
                  :type (type-of e)
                  :name (ignore-errors (cell-error-name e))))))

(format t "ignore-errors => ~S~%"
        (multiple-value-list
         (ignore-errors (funcall 'progn 1))))

(format t "raw value => ~S~%"
        (let ((x (ignore-errors (funcall 'progn 1))))
          x))

(multiple-value-bind (value condition)
    (ignore-errors (funcall 'progn 1))
  (format t "caught value => ~S~%" value)
  (format t "caught type => ~S~%" (type-of condition))
  (format t "caught undefined-p => ~S~%" (typep condition 'undefined-function))
  (format t "caught cell-name => ~S~%" (cell-error-name condition))
  (format t "caught cell-name type => ~S~%" (type-of (cell-error-name condition)))
  (format t "caught cell-name symbolp => ~S~%" (symbolp (cell-error-name condition)))
  (format t "caught cell-name stringp => ~S~%" (stringp (cell-error-name condition)))
  (format t "caught eq-progn => ~S~%" (eq (cell-error-name condition) 'progn)))
