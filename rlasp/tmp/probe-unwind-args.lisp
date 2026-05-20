(in-package #:cl-user)

(format t "compile-file-pathname => ~s~%" (compile-file-pathname "foo.lisp"))
(format t "compile-file-pathname type=~s pathnamep=~s namestring=~s~%"
        (type-of (compile-file-pathname "foo.lisp"))
        (pathnamep (compile-file-pathname "foo.lisp"))
        (ignore-errors (namestring (compile-file-pathname "foo.lisp"))))
(format t "pathname-type => ~s type=~s~%"
        (pathname-type (compile-file-pathname "foo.lisp"))
        (type-of (pathname-type (compile-file-pathname "foo.lisp"))))
(format t "mkstemp => ~s~%" (core:mkstemp "/tmp/predlib"))
(format t "make-pathname => ~s~%"
        (make-pathname :type (pathname-type (compile-file-pathname "foo.lisp"))
                       :defaults (core:mkstemp "/tmp/predlib")))
(format t "make-pathname type=~s pathnamep=~s namestring=~s~%"
        (type-of (make-pathname :type (pathname-type (compile-file-pathname "foo.lisp"))
                                 :defaults (core:mkstemp "/tmp/predlib")))
        (pathnamep (make-pathname :type (pathname-type (compile-file-pathname "foo.lisp"))
                                  :defaults (core:mkstemp "/tmp/predlib")))
        (ignore-errors (namestring (make-pathname :type (pathname-type (compile-file-pathname "foo.lisp"))
                                                  :defaults (core:mkstemp "/tmp/predlib")))))
(multiple-value-bind (value err)
    (ignore-errors
      (let ((unwinds (gctools:thread-local-unwinds)))
        (ext:with-unlocked-packages ("CL" "CORE")
          (compile-file "sys:src;lisp;kernel;lsp;predlib.lisp"
                        :execution :serial
                        :output-file (make-pathname
                                      :type (pathname-type (compile-file-pathname "foo.lisp"))
                                      :defaults (core:mkstemp "/tmp/predlib")))
          (- (gctools:thread-local-unwinds) unwinds))))
  (format t "value=~s err=~s err-type=~s~%" value err (type-of err)))
(multiple-value-bind (value err)
    (ignore-errors
      (compile-file "sys:src;lisp;kernel;lsp;predlib.lisp"
                    :execution :serial
                    :output-file (make-pathname
                                  :type (pathname-type (compile-file-pathname "foo.lisp"))
                                  :defaults (core:mkstemp "/tmp/predlib"))))
  (format t "compile-file-only value=~s err=~s err-type=~s type-error-p=~s datum=~s expected=~s~%"
          value err (type-of err) (typep err 'type-error)
          (ignore-errors (type-error-datum err))
          (ignore-errors (type-error-expected-type err))))
(format t "thread-local-unwinds => ~s type=~s~%"
        (gctools:thread-local-unwinds)
        (type-of (gctools:thread-local-unwinds)))
(multiple-value-bind (value err)
    (ignore-errors
      (ext:with-unlocked-packages ("CL" "CORE")
        17))
  (format t "with-unlocked-packages-only value=~s err=~s err-type=~s~%"
          value err (type-of err)))
(multiple-value-bind (value err)
    (ignore-errors
      (let ((unwinds (gctools:thread-local-unwinds)))
        (- (gctools:thread-local-unwinds) unwinds)))
  (format t "unwind-subtract-only value=~s err=~s err-type=~s~%"
          value err (type-of err)))
