;;;; Bird.clj provides a Bird "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 4/24/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Define a Bird 'class' with one attribute, the Bird's name.
;(defrecord Bird [name])
(defrecord Bird [name])

;;; Bird constructors
;;; - default: no args
;;;   Postcondition: name == a default value.
;;; - explicit:
;;;   Receive: itsName, a String.
;;;   Postcondition: name == itsName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn make-Bird
  ([] (->Bird "Ann Onymous"))
  ([itsName] (->Bird itsName))
  )


;;; accessor method for name attribute
;;; Receive: this, a Bird object.
;;; Return: this's name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn getName [^Bird this]
  (:name this)
  )


;; define getClass, getCall, and toString as polymorphic methods
;; Note: these must be defined using defmethod instead of defn.

(defmulti getClass class)
(defmulti getCall class)
(defmulti toString class)

;;; method to retrieve a Bird's class
;;; Receive: this, a Bird object.
;;; Return: "Bird".
;;; Note: 'subclasses' of Bird must define this method.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod getClass Bird [ _ ]
  "Bird"
  )



;;; method to retrieve a Bird's call
;;; Receive: this, a Bird object.
;;; Return: a default bird-call.
;;; Note: 'subclasses' of Bird must define this method.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  getCall :default [ _ ]
   "Squaaaaawk!"
)

;;; method to combine a Bird, its class and its call into a String.
;;; Receive: this, a Bird object.
;;; Return: a String representing this, its class, and its call.
;;; Note: getClass and getCall are polymorphic methods.
;;; Note also: the use of :default for its class means that
;;;        'subclasses' may but are not required to define it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod toString :default [aBird]
  (str (getName aBird) " " (getClass aBird) " says, \"" (getCall aBird) "\"")
)

