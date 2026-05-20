(multiple-value-bind (fasl warnings-p failure-p)
    (compile-file "tmp/probe-synonym-test.lisp")
  (declare (ignore warnings-p failure-p))
  (load fasl))
