(in-package :cl-user)

(format *error-output* "ratio=~s~%"
        (let ((num -7/16)
              (*print-readably* t)
              (*print-array* nil)
              (*print-base* 10)
              (*print-radix* t)
              (*print-escape* nil))
          (write-to-string num)))

(format *error-output* "unicode-eq=~s left=~s right=~s~%"
        (let* ((unicode-string (make-array 4 :element-type 'character
                                           :initial-contents
                                           (mapcar #'code-char
                                                   (list 40340 25579 40824 28331))))
               (left (with-output-to-string (s)
                       (write unicode-string :stream s)))
               (right (write-to-string unicode-string)))
          (list (string= left right) left right)))

(format *error-output* "code-char-probe=~s~%"
        (let ((chars (mapcar #'code-char (list 40340 25579 40824 28331))))
          (list (mapcar #'characterp chars)
                (mapcar #'char-code chars))))

(let* ((unicode-string (make-array 4 :element-type 'character
                                   :initial-contents
                                   (mapcar #'code-char
                                           (list 40340 25579 40824 28331))))
       (left (with-output-to-string (s)
               (write unicode-string :stream s)))
       (right (write-to-string unicode-string)))
  (format *error-output* "unicode-left-stringp=~s right-stringp=~s left-errorp=~s right-errorp=~s~%"
          (stringp left) (stringp right) (errorp left) (errorp right))
  (format *error-output* "unicode-left=~a right=~a~%" left right)
  (format *error-output* "unicode-string-equal=~s~%" (string= left right)))

(format *error-output* "cons-circle-search=~s output=~s~%"
        (let ((a (list 1 2 3)))
          (setf (cdddr a) a)
          (let* ((*print-circle* t)
                 (out (write-to-string a)))
            (list (search "#1=" out) out))))

(format *error-output* "pprint-dispatch=~s~%"
        (with-standard-io-syntax
          (let ((*print-pprint-dispatch* (copy-pprint-dispatch nil))
                (*print-readably* nil)
                (*print-escape* nil)
                (*print-pretty* t))
            (let ((f #'(lambda (stream obj)
                         (declare (ignore obj))
                         (write "ABC" :stream stream))))
              (values (write-to-string 'x)
                      (set-pprint-dispatch '(eql x) f)
                      (write-to-string 'x)
                      (set-pprint-dispatch '(eql x) nil)
                      (write-to-string 'x))))))

(with-standard-io-syntax
  (let ((*print-pprint-dispatch* (copy-pprint-dispatch nil))
        (*print-readably* nil)
        (*print-escape* nil)
        (*print-pretty* t))
    (let ((f #'(lambda (stream obj)
                 (declare (ignore obj))
                 (write "ABC" :stream stream))))
      (format *error-output* "pprint-before=~s~%" (write-to-string 'x))
      (format *error-output* "pprint-set=~s~%" (set-pprint-dispatch '(eql x) f))
      (format *error-output* "pprint-after=~s~%" (write-to-string 'x))
      (format *error-output* "pprint-unset=~s~%" (set-pprint-dispatch '(eql x) nil))
      (format *error-output* "pprint-final=~s~%" (write-to-string 'x)))))

(format *error-output* "read-bqv=~s~%"
        (eval (read-from-string "`(#())")))

(format *error-output* "complex-probe=~s~%"
        (let ((c1 (complex 3.0 3.0d0))
              (c2 (complex 3.0 3.0))
              (s (signum (complex 3/5 4/5))))
          (list (type-of (realpart c1))
                (type-of (imagpart c1))
                (type-of (realpart c2))
                (type-of (imagpart c2))
                s
                (realpart s)
                (imagpart s)
                (type-of (realpart s))
                (type-of (imagpart s)))))

(format *error-output* "signum-3-probe=~s~%"
        (let* ((actual (signum (complex 3/5 4/5)))
               (expected #c(0.6 0.8)))
          (list :actual actual
                :expected expected
                :equalp (equalp actual expected)
                :actual-real (realpart actual)
                :actual-imag (imagpart actual)
                :expected-real (realpart expected)
                :expected-imag (imagpart expected)
                :actual-real-type (type-of (realpart actual))
                :actual-imag-type (type-of (imagpart actual))
                :expected-real-type (type-of (realpart expected))
                :expected-imag-type (type-of (imagpart expected))
                :equal (equal actual expected)
                :eql (eql actual expected)
                := (= actual expected)
                :real-equalp (equalp (realpart actual) (realpart expected))
                :imag-equalp (equalp (imagpart actual) (imagpart expected)))))

(format *error-output* "ltv-complex-3-probe=~s~%"
        (let ((a #C(1/2 1/3))
              (b (complex 1/2 1/3)))
          (list :a a
                :b b
                :equal (equal a b)
                := (= a b)
                :a-real (realpart a)
                :a-imag (imagpart a)
                :b-real (realpart b)
                :b-imag (imagpart b)
                :a-real-type (type-of (realpart a))
                :a-imag-type (type-of (imagpart a))
                :b-real-type (type-of (realpart b))
                :b-imag-type (type-of (imagpart b)))))
