(in-package #:cl-user)

(format t "before-case=~a~%" (readtable-case *readtable*))

(loop for x below (min 65535 char-code-limit)
      for char = (code-char x)
      for other = (read-from-string (format nil "#\\~a" (char-name char)))
      unless (char= char other)
        collect char)

(format t "raw=*readtable*=~s~%" *readtable*)
(format t "symbolp=~s stringp=~s consp=~s characterp=~s~%"
        (symbolp *readtable*)
        (stringp *readtable*)
        (consp *readtable*)
        (characterp *readtable*))
(format t "case=~a~%" (readtable-case *readtable*))
