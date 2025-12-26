#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;;; Test shell commands with pipes

(defun test-pipes ()
  (shell "ls -la | head -5")
  (shell "echo 'testing 123' | wc -w")
  (shell "ps aux | grep rlasp | head -3"))

(test-pipes)
