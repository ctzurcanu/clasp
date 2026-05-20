(let ((result
       (let ((chars (list #\Backspace #\Tab #\Newline #\Linefeed #\Page #\Return #\Space #\Rubout)))
         (mapcar #'(lambda (c)
                     (with-standard-io-syntax
                       (let ((*readtable* (copy-readtable nil)))
                         (handler-case
                             (read-from-string (concatenate 'string (string c) "Z"))
                           (reader-error (e) e)))))
                 chars))))
  (format t "result=~S~%" result)
  (format t "first=~S typep-reader-error=~S~%" (first result) (typep (first result) 'reader-error))
  (format t "eighth=~S typep-reader-error=~S~%" (eighth result) (typep (eighth result) 'reader-error)))
