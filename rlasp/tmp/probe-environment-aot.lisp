(in-package #:cl-user)

(defun foo-test-describe (a b c)
  "to test describe"
  (list a b c))

(defun stupid-function (a) a)

(define-compiler-macro stupid-function (&whole form arg)
  "This is an empty compiler macro"
  (declare (ignore form))
  `(list ,arg))

(defun (setf nada) (new old)
  "asdjhaskdhj"
  (list new old))

(defun probe-describe-case (label object &optional (doc-category 'function))
  (let ((doc (documentation object doc-category))
        (args (ignore-errors (ext:function-lambda-list object)))
        (desc (with-output-to-string (*standard-output*)
                (describe object))))
    (format *error-output* "~%~a~%doc=~s~%args=~s~%desc=~s~%"
            label doc args desc)))

(probe-describe-case "foo" 'foo-test-describe)
(probe-describe-case "defconstant" 'cl:defconstant)
(probe-describe-case "function-docstring/function" 'core:function-docstring 'function)
(probe-describe-case "function-docstring/setf" 'core:function-docstring 'setf)
(probe-describe-case "car/function" 'cl:car 'function)
(probe-describe-case "car/setf" 'cl:car 'setf)
(probe-describe-case "progn" 'progn)

(defun test-documentation-with-args/probe (object &optional (doc-category 'function) requiredp)
  (let ((doc (documentation object doc-category)))
    (format *error-output* "~%helper ~s category=~s doc=~s~%" object doc-category doc)
    (cond (doc
           (let* ((describe-string
                   (with-output-to-string (*standard-output*)
                     (describe object)))
                  (args (ext:function-lambda-list object))
                  (args-string (write-to-string args :escape t :readably t))
                  (doc-pos (search doc describe-string))
                  (args-pos (search args-string describe-string)))
             (format *error-output* "args=~s args-string=~s doc-pos=~s args-pos=~s result=~s~%desc=~s~%"
                     args args-string doc-pos args-pos (and doc-pos args-pos) describe-string)
             (and doc-pos args-pos)))
          (requiredp
           (format *error-output* "required doc missing~%")
           nil)
          (t
           (with-output-to-string (*standard-output*)
             (describe object))))))

(format *error-output* "~%helper-results~%foo => ~s~%" (test-documentation-with-args/probe 'foo-test-describe))
(format *error-output* "lambda-list => ~s~%" (test-documentation-with-args/probe 'ext:function-lambda-list))
(format *error-output* "defconstant => ~s~%" (test-documentation-with-args/probe 'cl:defconstant))
(format *error-output* "function-docstring/function => ~s~%" (test-documentation-with-args/probe 'core:function-docstring 'function t))
(format *error-output* "function-docstring/setf => ~s~%" (test-documentation-with-args/probe 'core:function-docstring 'setf t))
(format *error-output* "car/function => ~s~%" (test-documentation-with-args/probe 'cl:car 'function t))
(format *error-output* "car/setf => ~s~%" (test-documentation-with-args/probe 'cl:car 'setf t))
(format *error-output* "progn => ~s~%" (test-documentation-with-args/probe 'progn))
