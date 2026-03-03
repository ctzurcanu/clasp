(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/common/assert.lisp")

(oscov-note "streams_io")

(let ((in (make-string-input-stream "line1
line2
")))
  (multiple-value-bind (line eofp) (read-line in nil nil)
    (declare (ignore eofp))
    (oscov-assert-equal "line1" line "read-line from make-string-input-stream")
    (oscov-assert (stringp line) "read-line should return string"))
  (oscov-assert (listen in) "listen should be true while stream still has input"))

(let ((out (make-string-output-stream)))
  (write-string "abc" out)
  (write-line "def" out)
  (finish-output out)
  (let ((s (get-output-stream-string out)))
    (oscov-assert (search "abc" s) "output stream should contain written prefix")
    (oscov-assert (search "def" s) "output stream should contain written line")))

(let* ((dir "/tmp/irlasp-oscov/io/")
       (path (concatenate 'string dir "io.txt")))
  (ensure-directories-exist dir)
  (with-open-file (out path :direction :output :if-exists :supersede :if-does-not-exist :create)
    (write-line "io-file-line" out))
  (with-open-file (in path :direction :input)
    (multiple-value-bind (line eofp) (read-line in nil nil)
      (declare (ignore eofp))
      (oscov-assert-equal "io-file-line" line "read-line from open input file")
      (oscov-assert (stringp line) "open input read-line should return string"))
    (oscov-assert (integerp (file-position in)) "file-position should return integer"))
  (delete-file path))

(format t "OK streams_io~%")
