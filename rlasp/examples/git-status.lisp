#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;;; Git status checker

(defun check-git ()
  (shell "git status --short")
  (shell "git log --oneline -5"))

(check-git)
