;; Comprehensive CLOS test
;; Tests: defclass, defgeneric, defmethod, make-instance, slot-value, typep, class-of

(format t "=== Comprehensive CLOS Test ===~%~%")

;; 1. Basic class with various slot options
(format t "1. Testing defclass with slot options...~%")
(defclass person ()
  ((name :initarg :name :accessor person-name)
   (age :initarg :age :reader person-age)
   (address :initarg :address)))

;; 2. Create instance and test slot-value
(format t "2. Testing make-instance and slot-value...~%")
(defvar *p* (make-instance 'person :name "Alice" :age 30 :address "123 Main St"))
(format t "   Name: ~A~%" (slot-value *p* 'name))
(format t "   Age: ~A~%" (slot-value *p* 'age))
(format t "   Address: ~A~%" (slot-value *p* 'address))

;; 3. Test generated accessors
(format t "3. Testing generated accessors...~%")
(format t "   person-name accessor: ~A~%" (person-name *p*))
(format t "   person-age reader: ~A~%" (person-age *p*))
(format t "   Slot getter for address: ~A~%" (address *p*))

;; 4. Test class-of and typep
(format t "4. Testing class-of and typep...~%")
(format t "   (class-of *p*) = ~A~%" (class-of *p*))
(format t "   (typep *p* 'person) = ~A~%" (typep *p* 'person))
(format t "   (typep 42 'fixnum) = ~A~%" (typep 42 'fixnum))
(format t "   (typep 42 'number) = ~A~%" (typep 42 'number))
(format t "   (typep \"hello\" 'string) = ~A~%" (typep "hello" 'string))

;; 5. Generic function with method specialization
(format t "5. Testing defgeneric and defmethod with specializers...~%")

(defclass animal ()
  ((species :initarg :species)))

(defclass dog (animal)
  ((breed :initarg :breed)))

(defgeneric speak (x))

(defmethod speak ((x person))
  (format nil "Hello, I'm ~A" (slot-value x 'name)))

(defmethod speak ((x animal))
  (format nil "I'm a ~A" (slot-value x 'species)))

(defvar *dog* (make-instance 'dog :species "canine" :breed "Labrador"))
(format t "   (speak *p*) = ~A~%" (speak *p*))
(format t "   (speak *dog*) = ~A~%" (speak *dog*))

;; 6. Generic function with multiple methods (dispatch test)
(format t "6. Testing multiple method dispatch...~%")

(defclass shape ()
  ((color :initarg :color)))

(defclass circle (shape)
  ((radius :initarg :radius)))

(defclass rectangle (shape)
  ((width :initarg :width)
   (height :initarg :height)))

(defgeneric area (s))

(defmethod area ((s circle))
  (let ((r (slot-value s 'radius)))
    (* 3.14159 r r)))

(defmethod area ((s rectangle))
  (* (slot-value s 'width) (slot-value s 'height)))

(defvar *circle* (make-instance 'circle :color "red" :radius 5))
(defvar *rect* (make-instance 'rectangle :color "blue" :width 4 :height 6))

(format t "   Circle area (r=5): ~A~%" (area *circle*))
(format t "   Rectangle area (4x6): ~A~%" (area *rect*))

;; 7. Point magnitude test (original benchmark)
(format t "7. Testing point magnitude (original benchmark)...~%")

(defclass point ()
  ((x :initarg :x :accessor x)
   (y :initarg :y :accessor y)))

(defgeneric magnitude (p))

(defmethod magnitude ((p point))
  (sqrt (+ (* (x p) (x p)) (* (y p) (y p)))))

(defvar *pt* (make-instance 'point :x 3 :y 4))
(format t "   Point (3,4) magnitude: ~A~%" (magnitude *pt*))

;; Summary
(format t "~%=== CLOS Test Complete ===~%")
(format t "All tests passed if no errors above.~%")
