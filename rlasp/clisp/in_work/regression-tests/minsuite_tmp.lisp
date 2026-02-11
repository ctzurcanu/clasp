(in-package #:clasp-tests)

(test floor-remainder-contagion
      (loop for fun in '(floor ceiling truncate round
                         ffloor fceiling ftruncate fround)
            nconc
            (loop for args in '((3f0 2) (3 2f0) (3f0 4/7) (31/30 2f0)
                                (3f0 2d0) (3d0 2f0) (3d0 2d0))
                  for rtype in '(single-float single-float single-float single-float
                                 double-float double-float double-float)
                  unless (typep (nth-value 1 (apply fun args)) rtype)
                    collect (cons fun args)))
      (nil))

(test ffloor-quotient-contagion
      (loop for fun in '(ffloor fceiling ftruncate fround)
            nconc
            (loop for args in '((3 2) (3 4/7) (31/30 2)
                                (3f0 2) (3 2f0) (3f0 4/7) (31/30 2f0)
                                (3f0 2d0) (3d0 2f0) (3d0 2d0))
                  for rtype in '(single-float single-float single-float
                                 single-float single-float single-float single-float
                                 double-float double-float double-float)
                  unless (typep (apply fun args) rtype)
                    collect (cons fun args)))
      (nil))
