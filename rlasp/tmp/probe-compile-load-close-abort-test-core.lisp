(multiple-value-bind (fasl warnings-p failure-p)
    (compile-file "tmp/probe-close-abort-test-core.lisp")
  (declare (ignore warnings-p failure-p))
  (load fasl))
