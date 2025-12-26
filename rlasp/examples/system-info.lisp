#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;;; System Information Script
;;; Demonstrates JIT compilation with CLI commands

(defun show-info ()
  (echo 1)
  (pwd)
  (echo 2)
  (ls)
  (echo 3))

(show-info)
