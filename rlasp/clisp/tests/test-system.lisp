(defun run-ls ()
  (system "ls -la"))

(defun run-echo ()
  (system "echo Hello from JIT"))

(run-ls)
(run-echo)
