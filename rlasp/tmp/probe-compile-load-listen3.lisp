(multiple-value-bind (fasl warnings-p failure-p)
    (compile-file "tmp/probe-listen3-compiled.lisp")
  (declare (ignore warnings-p failure-p))
  (load fasl))
