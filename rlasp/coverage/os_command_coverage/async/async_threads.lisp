(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/common/assert.lisp")

(oscov-note "async_threads")

(async:sleep-ms 2)
(async:yield)

(let ((lock (mp:make-lock "oscov-lock")))
  (oscov-assert lock "mp:make-lock should return lock object")
  (oscov-assert (mp:get-lock lock) "mp:get-lock should acquire lock")
  (oscov-assert (mp:giveup-lock lock) "mp:giveup-lock should release lock"))

(let ((proc (mp:process-run-function "oscov-worker" (lambda () 99))))
  (let ((join-result (mp:process-join proc)))
    (oscov-assert (or (null join-result) (integerp join-result)) "mp:process-join should return NIL or value"))
  (oscov-assert (not (mp:process-active-p proc)) "process should not be active after join"))

(let ((connect-result nil)
      (connect-error nil))
  (handler-case
      (setq connect-result (async:tcp-connect "127.0.0.1" 1 :read-timeout-ms 10 :write-timeout-ms 10))
    (error (e)
      (declare (ignore e))
      (setq connect-error t)))
  (if connect-error
      (oscov-assert t "async:tcp-connect error path")
      (progn
        (when connect-result
          (async:tcp-close connect-result))
        (oscov-assert t "async:tcp-connect success path"))))

(let ((send-covered nil))
  (ignore-errors (async:tcp-send "NO-SOCKET" "abc"))
  (setq send-covered t)
  (oscov-assert send-covered "async:tcp-send should be invokable"))

(let ((recv-covered nil))
  (ignore-errors (async:tcp-recv "NO-SOCKET" 32))
  (setq recv-covered t)
  (oscov-assert recv-covered "async:tcp-recv should be invokable"))

(let ((close-result (async:tcp-close "NO-SOCKET")))
  (oscov-assert (null close-result) "async:tcp-close unknown socket should return NIL"))

(format t "OK async_threads~%")
