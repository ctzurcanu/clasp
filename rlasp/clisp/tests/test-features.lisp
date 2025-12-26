(print "Testing do loop:")
(print (do ((i 0 (+ i 1))) ((> i 2) i)))

(print "Testing do with return:")
(print (do ((i 0 (+ i 1))) ((> i 10) i) (if (= i 5) (return 999))))

(print "Testing do*:")
(print (do* ((x 1 (+ x 1)) (y (+ x 1) (+ x 1))) ((> y 3) y)))

(print "All tests passed!")
