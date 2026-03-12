(in-package #:cl-user)

(format t "start-case=~a~%" (readtable-case *readtable*))

(block done
  (loop for x below (min 65535 char-code-limit)
        for char = (code-char x)
        for name = (char-name char)
        for text = (format nil "#\\~a" name)
        for other = (read-from-string text)
        do (unless (char= char other)
             (format t "char-mismatch x=~a name=~s other=~s~%" x name other)
             (return-from done nil))
           (let ((case-ok (ignore-errors (readtable-case *readtable*))))
             (unless case-ok
               (format t "corrupt x=~a name=~s raw=~s~%" x name *readtable*)
               (return-from done nil)))))

(format t "end-case=~a raw=~s~%" (readtable-case *readtable*) *readtable*)
