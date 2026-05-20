(format t "A~%")
(finish-output)
(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/modules/asdf/build/asdf.lisp")
(format t "B~%")
(finish-output)
(let* ((asdf-package (find-package "ASDF"))
       (initialize-source-registry
         (or (find-symbol "INITIALIZE-SOURCE-REGISTRY" asdf-package)
             (error "Missing ASDF:INITIALIZE-SOURCE-REGISTRY")))
       (find-system
         (or (find-symbol "FIND-SYSTEM" asdf-package)
             (error "Missing ASDF:FIND-SYSTEM"))))
  (funcall initialize-source-registry
           '(:source-registry
             (:tree "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/modules/clingon-master/")
             (:tree "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/modules/quicklisp/dists/quicklisp/software/")
             :ignore-inherited-configuration))
  (format t "C~%")
  (finish-output)
  (format t "UIOP=~S~%" (funcall find-system :uiop nil))
  (finish-output)
  (format t "CLINGON=~S~%" (funcall find-system :clingon nil))
  (finish-output))
