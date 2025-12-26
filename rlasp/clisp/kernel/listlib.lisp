;;; listlib.lisp - Common Lisp list library functions
;;; Extended list manipulation functions for rlasp

(in-package :rlasp)

;; List traversal and mapping

(defun mapcar (function list &rest more-lists)
  "Apply FUNCTION to successive elements of LIST(s), return list of results."
  (if (null more-lists)
      ;; Single list case
      (let ((result nil))
        (dolist (elem list (nreverse result))
          (push (funcall function elem) result)))
      ;; Multiple lists case
      (let ((result nil)
            (lists (cons list more-lists)))
        (loop
          (when (some #'null lists) (return (nreverse result)))
          (push (apply function (mapcar #'car lists)) result)
          (setf lists (mapcar #'cdr lists))))))

(defun mapc (function list &rest more-lists)
  "Apply FUNCTION to successive elements of LIST(s), return first list."
  (if (null more-lists)
      (dolist (elem list list)
        (funcall function elem))
      (let ((lists (cons list more-lists)))
        (loop
          (when (some #'null lists) (return list))
          (apply function (mapcar #'car lists))
          (setf lists (mapcar #'cdr lists))))))

(defun remove-if (test list &key (key #'identity))
  "Remove elements from LIST where (funcall TEST element) is true."
  (let ((result nil))
    (dolist (elem list (nreverse result))
      (unless (funcall test (funcall key elem))
        (push elem result)))))

(defun remove-if-not (test list &key (key #'identity))
  "Remove elements from LIST where (funcall TEST element) is false."
  (remove-if (lambda (x) (not (funcall test x))) list :key key))

(defun find-if (predicate list &key (key #'identity))
  "Find first element in LIST satisfying PREDICATE."
  (dolist (elem list nil)
    (when (funcall predicate (funcall key elem))
      (return elem))))

(defun position-if (predicate list &key (key #'identity))
  "Find position of first element in LIST satisfying PREDICATE."
  (let ((pos 0))
    (dolist (elem list nil)
      (when (funcall predicate (funcall key elem))
        (return pos))
      (incf pos))))

;; Association lists

(defun assoc (item alist &key (test #'eql) (key #'identity))
  "Find first pair in ALIST whose CAR matches ITEM."
  (dolist (pair alist nil)
    (when (and (consp pair)
               (funcall test item (funcall key (car pair))))
      (return pair))))

(defun rassoc (item alist &key (test #'eql) (key #'identity))
  "Find first pair in ALIST whose CDR matches ITEM."
  (dolist (pair alist nil)
    (when (and (consp pair)
               (funcall test item (funcall key (cdr pair))))
      (return pair))))

;; List construction

(defun append (&rest lists)
  "Concatenate all LISTS into a single list."
  (if (null lists)
      nil
      (let ((result (car lists)))
        (dolist (list (cdr lists) result)
          (setf result (nconc (copy-list result) list))))))

(defun copy-list (list)
  "Create a shallow copy of LIST."
  (let ((result nil))
    (dolist (elem list (nreverse result))
      (push elem result))))

(defun nreverse (list)
  "Destructively reverse LIST."
  (let ((prev nil))
    (loop while list do
      (let ((next (cdr list)))
        (setf (cdr list) prev
              prev list
              list next)))
    prev))

;; List predicates

(defun every (predicate list &rest more-lists)
  "Return true if PREDICATE is true for all elements."
  (if (null more-lists)
      (dolist (elem list t)
        (unless (funcall predicate elem)
          (return nil)))
      (let ((lists (cons list more-lists)))
        (loop
          (when (some #'null lists) (return t))
          (unless (apply predicate (mapcar #'car lists))
            (return nil))
          (setf lists (mapcar #'cdr lists))))))

(defun some (predicate list &rest more-lists)
  "Return true if PREDICATE is true for any element."
  (if (null more-lists)
      (dolist (elem list nil)
        (when (funcall predicate elem)
          (return t)))
      (let ((lists (cons list more-lists)))
        (loop
          (when (some #'null lists) (return nil))
          (when (apply predicate (mapcar #'car lists))
            (return t))
          (setf lists (mapcar #'cdr lists))))))
