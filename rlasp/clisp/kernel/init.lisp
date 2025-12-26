;;; init.lisp - rlasp kernel initialization
;;; This file bootstraps the rlasp runtime

(in-package :rlasp)

;; Set up basic runtime environment
(defparameter *rlasp-version* "0.1.0")
(defparameter *kernel-loaded* nil)

(format t "~%Initializing rlasp kernel ~A~%" *rlasp-version*)
