(in-package #:cl-user)

(defun probe (label)
  (format t "~a => ~a~%" label (readtable-case *readtable*)))

(probe "start")

(with-standard-io-syntax
  (symbol-name (read-from-string "\\o")))
(probe "after escaped 1")

(with-standard-io-syntax
  (symbol-name (read-from-string "\\O")))
(probe "after escaped 2")

(and (get-dispatch-macro-character #\# #\=)
     (get-dispatch-macro-character #\# #\#)
     (get-dispatch-macro-character #\# #\I)
     (get-dispatch-macro-character #\# #\a)
     (get-dispatch-macro-character #\# #\A)
     (get-dispatch-macro-character #\# #\s)
     (get-dispatch-macro-character #\# #\S))
(probe "after readtable-1")

(let ((new (copy-readtable)))
  (and (get-dispatch-macro-character #\# #\= new)
       (get-dispatch-macro-character #\# #\# new)
       (get-dispatch-macro-character #\# #\I new)
       (get-dispatch-macro-character #\# #\a new)
       (get-dispatch-macro-character #\# #\A new)
       (get-dispatch-macro-character #\# #\s new)
       (get-dispatch-macro-character #\# #\S new)))
(probe "after readtable-2")

(let ((new (copy-readtable nil)))
  (and (get-dispatch-macro-character #\# #\= new)
       (get-dispatch-macro-character #\# #\# new)
       (get-dispatch-macro-character #\# #\I new)
       (get-dispatch-macro-character #\# #\a new)
       (get-dispatch-macro-character #\# #\A new)
       (get-dispatch-macro-character #\# #\s new)
       (get-dispatch-macro-character #\# #\S new)))
(probe "after readtable-3")

(row-major-aref #0A0 0)
(row-major-aref #0A1 0)
(probe "after nil bitarrays")

(loop for x below (min 65535 char-code-limit)
      for char = (code-char x)
      for other = (read-from-string (format nil "#\\~a" (char-name char)))
      unless (char= char other)
        collect char)
(probe "after all-char-names")

(loop for x below (min 65535 char-code-limit)
      for c = (code-char x)
      unless (or (not (characterp c))
                 (let ((name (char-name c)))
                   (or (null name)
                       (and (stringp name) (char= c (name-char name))))))
        collect c)
(probe "after all-chars")

(loop for s in '("RubOut" "PAGe" "BacKspace" "RetUrn" "Tab" "LineFeed"
                 "SpaCE" "NewLine")
      for c1 = (name-char (string-upcase s))
      for c2 = (name-char (string-downcase s))
      for c3 = (name-char (string-capitalize s))
      for c4 = (name-char s)
      unless (and (char= c1 c2) (char= c2 c3) (char= c3 c4))
        collect s)
(probe "after name-char")

(defstruct syntax-test-struct-1 a b c)

(let ((v (read-from-string "#s(syntax-test-struct-1 \"A\" x)")))
  (list
   (not (not (typep v 'syntax-test-struct-1)))
   (syntax-test-struct-1-a v)
   (syntax-test-struct-1-b v)
   (syntax-test-struct-1-c v)))
(probe "after sharp-s")

(with-input-from-string (*standard-input* "1 2 3 ]")
  (read-delimited-list #\] nil))
(probe "after issue-67")

(let (($%e 2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190255151086574637721112523897844250569536967707854499699679468644549059879316368892300987931277361782154249992295763514822082698951936680331825288693984964651058209392398294887933203625094431173012381970684161404))
  (and (floatp $%e)
       (not (ext:float-nan-p $%e))))
(probe "after long-float")
