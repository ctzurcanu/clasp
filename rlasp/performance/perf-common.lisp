(in-package #:cl-user)

(defun perf-read-symbol-value (symbol-name)
  (handler-case
      (multiple-value-bind (sym index) (read-from-string symbol-name)
        (declare (ignore index))
        (when (and (symbolp sym) (boundp sym))
          (symbol-value sym)))
    (error () nil)))

(defun perf-read-function (function-name)
  (handler-case
      (multiple-value-bind (sym index) (read-from-string function-name)
        (declare (ignore index))
        (when (and (symbolp sym) (fboundp sym))
          (fdefinition sym)))
    (error () nil)))

(defun perf-as-list (value)
  (cond
    ((null value) '())
    ((listp value) value)
    ((arrayp value) (loop for i from 0 below (length value) collect (aref value i)))
    (t (list value))))

(defun perf-raw-argv ()
  (or (perf-read-symbol-value "core:*command-line-arguments*")
      (perf-read-symbol-value "sb-ext:*posix-argv*")
      (let ((argc-fn (perf-read-function "si:argc"))
            (argv-fn (or (perf-read-function "si:argv")
                         (perf-read-function "ext:argv"))))
        (when (and argc-fn argv-fn)
          (let ((argc (ignore-errors (funcall argc-fn))))
            (when (and argc (integerp argc) (>= argc 0))
              (loop for i from 0 below argc
                    for value = (ignore-errors (funcall argv-fn i))
                    when (stringp value)
                    collect value)))))
      '()))

(defun perf-path-tail (s)
  (when (stringp s)
    (let* ((slash (or (position #\/ s :from-end t) -1))
           (backslash (or (position #\\ s :from-end t) -1))
           (cut slash))
      (when (> backslash cut)
        (setf cut backslash))
      (if (>= cut 0)
          (subseq s (1+ cut))
          s))))

(defun perf-script-names ()
  (let ((source (or *load-truename*
                    *compile-file-truename*
                    *default-pathname-defaults*))
        (names '()))
    (when source
      (let ((name (namestring source))
            (tail (perf-path-tail (namestring source))))
        (push name names)
        (when tail (push tail names))))
    (remove-duplicates names :test #'string=)))

(defun perf-user-args ()
  (let* ((argv (perf-as-list (perf-raw-argv)))
         (script-names (perf-script-names))
         (cut-index
           (loop for idx from 0
                 for arg in argv
                 for tail = (perf-path-tail arg)
                 when (or (member arg script-names :test #'string=)
                          (and tail (member tail script-names :test #'string=))
                          (and (stringp arg)
                               (search ".lisp" arg :test #'char-equal)
                               script-names
                               (some (lambda (name)
                                       (or (string= arg name)
                                           (string= tail name)))
                                     script-names)))
                 do (return idx))))
    (labels ((drop-launcher-prefix (items)
               (let ((rest items))
                 (when (and rest
                            (stringp (first rest))
                            (let ((head (string-downcase (or (perf-path-tail (first rest))
                                                             (first rest)))))
                              (or (search "sbcl" head :test #'char=)
                                  (search "clasp" head :test #'char=)
                                  (search "irlasp" head :test #'char=))))
                   (setf rest (rest rest)))
                 (when (and rest (stringp (first rest)) (string= (first rest) "--"))
                   (setf rest (rest rest)))
                 rest)))
      (if cut-index
          (nthcdr (1+ cut-index) argv)
          (drop-launcher-prefix argv)))))

(defun perf-int-arg (args index default)
  (let ((raw (nth index args)))
    (if raw
        (handler-case
            (parse-integer raw :junk-allowed nil)
          (error () default))
        default)))

(defun perf-report (algo args result)
  (format t "~&ALGO=~A ARGS=~S RESULT=~S~%" algo args result)
  (finish-output))
