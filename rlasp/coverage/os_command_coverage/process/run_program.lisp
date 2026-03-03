(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/common/assert.lisp")

(oscov-note "run_program")

(multiple-value-bind (stdout-stream _ process)
    (ext:run-program "/bin/sh" '("-c" "echo hello world") :output :stream)
  (oscov-assert stdout-stream "ext:run-program should return output stream")
  (multiple-value-bind (status code) (ext:external-process-wait process)
    (oscov-assert status "ext:external-process-wait should return status")
    (oscov-assert (integerp code) "ext:external-process-wait should return integer code"))
  (let ((line (read-line stdout-stream nil "")))
    (oscov-assert-equal "hello world" line "ext:run-program output")))

(multiple-value-bind (result-code child-status maybe-stream)
    (ext:vfork-execvp '("/bin/echo" "oscov"))
  (oscov-assert (integerp result-code) "ext:vfork-execvp should return integer code")
  (oscov-assert (integerp child-status) "ext:vfork-execvp should return integer child status")
  (oscov-assert (or (null maybe-stream) maybe-stream) "ext:vfork-execvp third return value should be stream or NIL"))

(format t "OK run_program~%")
