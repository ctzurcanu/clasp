(in-package #:cl-user)
(format t "before=~s ~a~%" *readtable* (ignore-errors (readtable-case *readtable*)))
(loop for x from 320 to 340
      for c = (code-char x)
      for text = (format nil "#\\~a" (char-name c))
      do (read-from-string text)
         (format t "x=~a raw=~s case=~s~%" x *readtable* (ignore-errors (readtable-case *readtable*))))
