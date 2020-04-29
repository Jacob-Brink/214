;;;; Goose.clj provides a Goose "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 4/24/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bring in 'Bird' (to be used as 'superclass')

(load "Bird")


;; define 'Goose' as 'subclass' of Bird

(defrecord Goose [^Bird name] )


;;; Goose constructors
;;; - default: no args
;;;   Postcondition: name == a default value. 
;;; - explicit1:
;;;   Receive: itsName, a String
;;;   Postcondition: name == itsName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn make-Goose     
  ([]                (->Goose "Ann Onymous"))
  ([^String itsName] (->Goose itsName))
)

;;; method to retrieve a Goose's class
;;; Receive: this, a Goose object.
;;; Return: "Goose".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod getClass Goose [ _ ]
  "Goose"
)

;;; method to retrieve a Goose's call
;;; Receive: this, a Goose object.
;;; Return: "Honk!"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod getCall Goose [ _ ]
  "Honk!"
)


