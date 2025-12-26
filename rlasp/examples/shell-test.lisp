#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;;; Test arbitrary shell commands

(defun test-commands ()
  (shell "echo 'Hello from shell!'")
  (shell "date")
  (shell "whoami")
  (shell "uname -a"))

(test-commands)
