(in-package #:cl-user)
(loop for x below 500
      for c = (code-char x)
      for text = (format nil "#\\~a" (char-name c))
      do (read-from-string text))
(princ (readtable-case *readtable*))
(terpri)
(write *readtable*)
(terpri)
