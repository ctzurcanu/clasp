(in-package #:cl-user)
(loop for x from 818 to 821
      for c = (code-char x)
      for text = (format nil "#\\~a" (char-name c))
      do (format t "x=~a text=~s value=~s before=~s~%" x text (read-from-string text) *readtable*))
(format t "after=~s case=~s~%" *readtable* (ignore-errors (readtable-case *readtable*)))
