(in-package #:cl-user)
(loop for x below 1000
      for c = (code-char x)
      do (format nil "#\\~a" (char-name c)))
(princ (ignore-errors (readtable-case *readtable*)))
(terpri)
(write *readtable*)
(terpri)
