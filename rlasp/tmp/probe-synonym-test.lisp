(load "clisp/in_work/regression-tests/framework.lisp")
(in-package #:clasp-tests)

(test stream-element-type.02.probe
  (let ((name (core:mkstemp "stream-element-type")))
    (unwind-protect
         (progn
           (with-open-file (mearts name :if-does-not-exist :create
                                        :if-exists :supersede
                                        :direction :output
                                        :element-type '(unsigned-byte 8))
             (declare (special mearts))
             (let ((stream (make-synonym-stream 'mearts)))
               (write-byte 33 stream)
               (setf (stream-element-type stream) 'character)
               (write-char #\" stream)))
           (values (with-open-file (mearts name :direction :input
                                                :element-type '(unsigned-byte 8))
                     (declare (special mearts))
                     (let ((stream (make-synonym-stream 'mearts)))
                       (list (stream-element-type stream)
                             (read-byte stream)
                             (read-byte stream)
                             (stream-element-type stream))))
                   (with-open-file (mearts name :direction :input
                                                :element-type '(unsigned-byte 8))
                     (declare (special mearts))
                     (let ((stream (make-synonym-stream 'mearts)))
                       (list (stream-element-type stream)
                             (read-byte stream)
                             (setf (stream-element-type stream) 'character)
                             (read-char stream)
                             (unread-char #\" stream)
                             (stream-element-type stream)
                             (setf (stream-element-type stream) '(unsigned-byte 8))
                             (read-byte stream)
                             (stream-element-type stream))))))
      (delete-file name)))
  (((unsigned-byte 8) 33 34 (unsigned-byte 8))
   ((unsigned-byte 8) 33
    character #\" nil character
    (unsigned-byte 8) 34 (unsigned-byte 8))))

(show-test-summary)
