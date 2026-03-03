(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/common/assert.lisp")

(oscov-note "env_process")

(sb-posix:setenv "IRLASP_OSCOV_ENV" "abc123")
(oscov-assert-equal "abc123" (getenv "IRLASP_OSCOV_ENV") "getenv after sb-posix:setenv")
(oscov-assert-equal "abc123" (sb-ext:posix-getenv "IRLASP_OSCOV_ENV") "sb-ext:posix-getenv after setenv")
(sb-posix:unsetenv "IRLASP_OSCOV_ENV")
(oscov-assert (null (getenv "IRLASP_OSCOV_ENV")) "getenv should return NIL after unsetenv")

(let ((cwd (sb-unix:posix-getcwd/)))
  (oscov-assert (stringp cwd) "sb-unix:posix-getcwd/ should return string")
  (sb-posix:chdir cwd)
  (oscov-assert-equal cwd (sb-unix:posix-getcwd/) "sb-posix:chdir roundtrip"))

(oscov-assert (integerp (argc)) "argc should be an integer")
(let ((arg0 (argv 0)))
  (oscov-assert (or (null arg0) (stringp arg0)) "argv 0 should be NIL or string"))

(format t "OK env_process~%")
