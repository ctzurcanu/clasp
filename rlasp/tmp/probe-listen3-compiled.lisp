(multiple-value-bind (a b)
    (with-input-from-string (s "xxx")
      (values (not (listen s))
              (handler-case
                  (locally (declare (optimize safety))
                    (loop (read-char s)))
                (end-of-file () (listen s)))))
  (format t "listen3 values: ~s ~s~%" a b))
