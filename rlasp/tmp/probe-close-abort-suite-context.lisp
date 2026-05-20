(load "clisp/in_work/regression-tests/framework.lisp")
(in-package #:clasp-tests)

(require :gray-streams)

(defclass character-input-stream
    (gray:fundamental-character-input-stream)
  ((value :reader value
          :initarg :value)
   (index :accessor index
          :initform 0)))

(defmethod gray:stream-read-char ((stream character-input-stream))
  (with-accessors ((value value)
                   (index index))
      stream
    (if (< index (length value))
        (prog1 (char value index)
          (incf index))
        :eof)))

(defmethod gray:stream-unread-char ((stream character-input-stream) character)
  (with-accessors ((value value)
                   (index index))
      stream
    (when (zerop index)
      (error "Stream is at beginning, cannot unread character"))
    (when (char/= character (char value (decf index)))
      (error "Cannot unread a character that does not match."))
    nil))

(test read-line.eof.01
  (read-line (make-instance 'character-input-stream :value ""))
  (nil))

(test read-line.eof.02
  (read-line (make-instance 'character-input-stream :value "") nil :wibble)
  (:wibble t))

(test read-line.eof.03
  (read-line (make-instance 'character-input-stream :value "a
"))
  ("a" nil))

(test read-line.eof.04
  (read-line (make-instance 'character-input-stream :value "a"))
  ("a" t))

(test close.abort.01.probe
  (let* ((name (core:mkstemp "close-abort"))
         (stream (open name :if-does-not-exist :create :direction :output)))
    (write-string "wibble" stream)
    (close stream)
    (when (core:file-kind name nil)
      (delete-file name)))
  (t))

(test close.abort.02.probe
  (let* ((name (core:mkstemp "close-abort"))
         (stream (open name :if-does-not-exist :create :direction :output)))
    (write-string "wibble" stream)
    (close stream :abort t)
    (when (core:file-kind name nil)
      (delete-file name)))
  (nil))

(test close.abort.03.probe
  (let* ((name (core:mkstemp "close-abort"))
         (stream (open name :if-does-not-exist :create :direction :output))
         (buffer (make-array 3 :element-type 'character)))
    (write-string "foo" stream)
    (close stream)
    (setf stream (open name :if-does-not-exist :create :if-exists :supersede :direction :output))
    (write-string "bar" stream)
    (close stream)
    (setf stream (open name :direction :input))
    (read-sequence buffer stream :start 0 :end 3)
    (close stream)
    (delete-file name)
    buffer)
  ("bar"))

(test close.abort.04.probe
  (let* ((name (core:mkstemp "close-abort"))
         (stream (open name :if-does-not-exist :create :direction :output))
         (buffer (make-array 3 :element-type 'character)))
    (write-string "foo" stream)
    (close stream)
    (setf stream (open name :if-does-not-exist :create :if-exists :supersede :direction :output))
    (write-string "bar" stream)
    (close stream :abort t)
    (setf stream (open name :direction :input))
    (read-sequence buffer stream :start 0 :end 3)
    (close stream)
    (delete-file name)
    buffer)
  ("foo"))
