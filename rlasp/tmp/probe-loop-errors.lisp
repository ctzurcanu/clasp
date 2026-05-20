(defun show-loop-error (name thunk)
  (multiple-value-bind (values err)
      (ignore-errors (values (multiple-value-list (funcall thunk)) nil))
    (format t "~a => values=~s err=~s err-type=~s type-error-p=~s~%"
            name values err (and err (type-of err)) (typep err 'type-error))))

(show-loop-error "issue-1212"
                 (lambda () (loop for x in '(a . b) collect x)))
(show-loop-error "issue-1239"
                 (lambda () (loop for x in (random 42)
                                   do (format t "x = ~a~%" x))))
(show-loop-error "issue-1239a"
                 (lambda () (loop for x in (make-hash-table)
                                   do (format t "x = ~a~%" x))))

(multiple-value-bind (a b)
    (ignore-errors (loop for x in '(a . b) collect x))
  (format t "direct-ignore => a=~s b=~s type-of-b=~s typep=~s eq-type-error=~s~%"
          a b (type-of b) (typep b 'type-error) (eq b 'type-error)))
