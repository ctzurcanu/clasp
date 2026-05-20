(defpackage #:clasp-tests (:use #:cl))
(in-package #:clasp-tests)

(defun foo-test-describe (a b c)
  "to test describe"
  (list a b c))

(defun test-documentation-with-args (object &optional (doc-category 'function) requiredp)
  (let ((doc (documentation object doc-category)))
    (cond (doc
           (let ((describe-string
                  (with-output-to-string (*standard-output*)
                    (describe object)))
                 (args (ext:function-lambda-list object)))
             (format t "~&object=~s doc-category=~s~%" object doc-category)
             (format t "doc=~s~%" doc)
             (format t "args=~s~%" args)
             (format t "arg-string=~s~%" (write-to-string args :escape t :readably t))
             (format t "describe=~s~%" describe-string)
             (format t "doc-search=~s args-search=~s~%"
                     (search doc describe-string)
                     (search (write-to-string args :escape t :readably t) describe-string))
             (and (search doc describe-string)
                  (search (write-to-string args :escape t :readably t) describe-string))))
          (requiredp
           nil)
          (t
           (with-output-to-string (*standard-output*)
             (describe object))))))

(format t "function-docstring/function => ~s~%"
        (test-documentation-with-args 'core:function-docstring 'function t))
(format t "function-docstring/setf => ~s~%"
        (test-documentation-with-args 'core:function-docstring 'setf t))
(format t "car/function => ~s~%"
        (test-documentation-with-args 'cl:car 'function t))
(format t "car/setf => ~s~%"
        (test-documentation-with-args 'cl:car 'setf t))
