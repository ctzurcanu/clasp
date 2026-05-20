(multiple-value-bind (fasl warnings-p failure-p)
    (compile-file "tmp/probe-close-abort-compiled.lisp")
  (declare (ignore warnings-p failure-p))
  (load fasl))
