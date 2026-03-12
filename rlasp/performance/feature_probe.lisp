#+clasp (format t "CLASP~%")
#+mkcl (format t "MKCL~%")
#-(or clasp ecl sbcl) (format t "NOT-OR~%")
#+(or clasp ecl sbcl) (format t "OR~%")
