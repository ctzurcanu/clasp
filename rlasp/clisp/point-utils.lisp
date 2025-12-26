;;; point-utils.lisp - 2D point utilities using CLOS

(defpackage :point-utils
  (:use :common-lisp)
  (:export :make-point
           :point-distance
           :point-midpoint))

(in-package :point-utils)

(defun make-point (x y)
  "Create a new point with x and y coordinates"
  (make-instance 'point :x x :y y))

(defun point-distance (p)
  "Calculate distance from origin"
  (let ((x (slot-value p 'x))
        (y (slot-value p 'y)))
    (sqrt (+ (* x x) (* y y)))))

(defun point-midpoint (p1 p2)
  "Calculate midpoint between two points"
  (let ((x1 (slot-value p1 'x))
        (y1 (slot-value p1 'y))
        (x2 (slot-value p2 'x))
        (y2 (slot-value p2 'y)))
    (make-point (/ (+ x1 x2) 2.0)
                (/ (+ y1 y2) 2.0))))

(print "Point utilities loaded successfully!")
