(load "clisp/in_work/regression-tests/framework.lisp")
(in-package #:clasp-tests)

(defun probe-stream-external-format-direct ()
  (let ((name (core:mkstemp "stream-external-format")))
    (unwind-protect
         (progn
           (with-open-file (stream name :if-does-not-exist :create
                                        :if-exists :supersede
                                        :direction :output
                                        :element-type 'character
                                        :external-format :utf-8)
             (write-char #\! stream)
             (write-char #\newline stream)
             (setf (stream-external-format stream) '(:utf-8 :crlf))
             (write-char #\! stream)
             (write-char #\newline stream)
             (setf (stream-external-format stream) :ucs-2be)
             (write-char #\trade_mark_sign stream))
           (values (with-open-file (stream name :direction :input
                                                :element-type 'character
                                                :external-format :utf-8)
                     (list (stream-external-format stream)
                           (read-char stream)
                           (read-char stream)
                           (read-char stream)
                           (read-char stream)
                           (read-char stream)
                           (read-char stream)
                           (read-char stream)
                           (stream-external-format stream)))
                   (with-open-file (stream name :direction :input
                                                :element-type 'character
                                                :external-format :utf-8)
                     (list (stream-external-format stream)
                           (read-char stream)
                           (read-char stream)
                           (setf (stream-external-format stream) '(:utf-8 :crlf))
                           (read-char stream)
                           (read-char stream)
                           (setf (stream-external-format stream) :ucs-2be)
                           (read-char stream)
                           (stream-external-format stream)))))
      (delete-file name))))

(defun probe-stream-external-format-synonym ()
  (let ((name (core:mkstemp "stream-external-format")))
    (unwind-protect
         (progn
           (with-open-file (mearts name :if-does-not-exist :create
                                        :if-exists :supersede
                                        :direction :output
                                        :element-type 'character
                                        :external-format :utf-8)
             (declare (special mearts))
             (let ((stream (make-synonym-stream 'mearts)))
               (write-char #\! stream)
               (write-char #\newline stream)
               (setf (stream-external-format stream) '(:utf-8 :crlf))
               (write-char #\! stream)
               (write-char #\newline stream)
               (setf (stream-external-format stream) :ucs-2be)
               (write-char #\trade_mark_sign stream)))
           (values (with-open-file (mearts name :direction :input
                                                :element-type 'character
                                                :external-format :utf-8)
                     (declare (special mearts))
                     (let ((stream (make-synonym-stream 'mearts)))
                       (list (stream-external-format stream)
                             (read-char stream)
                             (read-char stream)
                             (read-char stream)
                             (read-char stream)
                             (read-char stream)
                             (read-char stream)
                             (read-char stream)
                             (stream-external-format stream))))
                   (with-open-file (mearts name :direction :input
                                                :element-type 'character
                                                :external-format :utf-8)
                     (declare (special mearts))
                     (let ((stream (make-synonym-stream 'mearts)))
                       (list (stream-external-format stream)
                             (read-char stream)
                             (read-char stream)
                             (setf (stream-external-format stream) '(:utf-8 :crlf))
                             (read-char stream)
                             (read-char stream)
                             (setf (stream-external-format stream) :ucs-2be)
                             (read-char stream)
                             (stream-external-format stream))))))
      (delete-file name))))

(format t "DIRECT=~S~%" (multiple-value-list (probe-stream-external-format-direct)))
(format t "SYNONYM=~S~%" (multiple-value-list (probe-stream-external-format-synonym)))
