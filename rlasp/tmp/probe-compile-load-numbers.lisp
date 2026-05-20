(in-package #:cl-user)

(let ((fasl "tmp/probe-numbers-fasl.fasl"))
  (compile-file "tmp/probe-numbers-fasl.lisp" :output-file fasl :verbose nil :print nil)
  (load fasl))
