;; Test Polymorphic Inline Cache (PIC) for CLOS dispatch
;; This test exercises the cache by making repeated calls with same types
;; Now uses slot-value directly to test that it works

;; Simple point class
(defclass point ()
  ((x :initarg :x)
   (y :initarg :y)))

;; Generic function with method using slot-value
(defgeneric magnitude (p))

(defmethod magnitude ((p point))
  (let ((x (slot-value p 'x))
        (y (slot-value p 'y)))
    (sqrt (+ (* x x) (* y y)))))

;; Test function - exercises PIC with repeated calls
(defun test-pic ()
  (let ((p1 (make-instance 'point :x 3 :y 4))
        (p2 (make-instance 'point :x 5 :y 12))
        (p3 (make-instance 'point :x 8 :y 15)))

    ;; First calls - cache miss, populate PIC
    (format t "Initial calls (cache miss):~%")
    (format t "  magnitude(3,4) = ~A~%" (magnitude p1))
    (format t "  magnitude(5,12) = ~A~%" (magnitude p2))
    (format t "  magnitude(8,15) = ~A~%" (magnitude p3))

    ;; Repeated calls - should hit PIC cache
    (format t "~%Repeated calls (10x each, cache hits):~%")
    (let ((sum 0))
      (dotimes (i 10)
        (setq sum (+ sum (magnitude p1)))
        (setq sum (+ sum (magnitude p2)))
        (setq sum (+ sum (magnitude p3))))
      (format t "  Sum of 30 magnitude calls: ~A~%" sum))

    ;; Verify results are correct
    (format t "~%Verifying results:~%")
    (format t "  Expected: 5, 13, 17~%")
    (format t "  Got: ~A, ~A, ~A~%"
            (magnitude p1)
            (magnitude p2)
            (magnitude p3))

    (and (= 5 (magnitude p1))
         (= 13 (magnitude p2))
         (= 17 (magnitude p3)))))

(format t "Testing Polymorphic Inline Cache for CLOS...~%~%")
(if (test-pic)
    (format t "~%PIC test PASSED.~%")
    (format t "~%PIC test FAILED.~%"))
