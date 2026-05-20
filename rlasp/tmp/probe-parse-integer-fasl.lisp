(handler-case
    (progn
      (parse-integer "123 456")
      (format t "no-error~%"))
  (error (e)
    (format t "caught=~S class=~S parse-error-p=~S type-error-p=~S program-error-p=~S~%"
            e (class-name (class-of e)) (typep e 'parse-error) (typep e 'type-error) (typep e 'program-error))))
