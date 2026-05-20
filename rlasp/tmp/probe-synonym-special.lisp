(in-package #:clasp-tests)

(let ((name (core:mkstemp "probe-synonym-special")))
  (unwind-protect
       (progn
         (with-open-file (mearts name :if-does-not-exist :create
                                      :if-exists :supersede
                                      :direction :output
                                      :element-type '(unsigned-byte 8))
           (declare (special mearts))
           (format t "boundp=~s value=~s stream=~s~%"
                   (boundp 'mearts)
                   (symbol-value 'mearts)
                   (make-synonym-stream 'mearts))
           (write-byte 33 (make-synonym-stream 'mearts)))
         (with-open-file (mearts name :direction :input
                                      :element-type '(unsigned-byte 8))
           (declare (special mearts))
           (format t "read=~s~%" (read-byte (make-synonym-stream 'mearts)))))
    (ignore-errors (delete-file name))))
