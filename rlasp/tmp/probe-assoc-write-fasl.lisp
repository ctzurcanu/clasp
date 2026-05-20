(format t "assoc-if condition=~S~%"
        (handler-case (assoc-if #'null '((a . b) :bad (c . d)))
          (condition (c) (class-name (class-of c)))))
(format t "write-sequence-3 condition=~S~%"
        (handler-case (write-sequence "ABCDEFGH" *standard-output* :end -1)
          (condition (c) (class-name (class-of c)))))
(format t "write-sequence-4 condition=~S~%"
        (handler-case (write-sequence "ABCDEFGH" *standard-output* :end 1 :start 2)
          (condition (c) (class-name (class-of c)))))
