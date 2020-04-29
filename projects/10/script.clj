Script started on 2020-04-24 14:13:05-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/clojure[00m$ cat src/Bird.clj
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

]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/clojure[00m$ cat src/Duck.clj
;;;; Duck.clj provides a Duck "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 4/24/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bring in 'Bird' (to be used as superclass) 
(load "Bird")

;; define 'Duck' as 'subclass' of Bird
(defrecord Duck [^Bird name] )

;;; constructors
;;; - default: takes no arguments
;;;   Postcondition: name is initialized to a default value
;;; - explicit: takes one parameter
;;;   Receive: itsName, a String
;;;   Postcondition: name == itsName
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Duck
  ([]                (->Duck "Ann Onymous"))
  ([^String itsName] (->Duck itsName))
)

;;; method to retrieve a Duck's class
;;; Receive: this, a Duck object.
;;; Return: "Duck"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod getClass Duck [ _ ]
  "Duck"
)

;;; method to retrieve a Duck's call
;;; Receive: this, a Duck object.
;;; Return: "Quack!"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod getCall Duck [ _ ]
  "Quack!"
)

]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/clojure[00m$ cat src/Goose.clj
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


]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/clojure[00m$ cat src/Owl.clj
;;;; Owl.clj provides an Owl "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 4/24/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bring in 'Bird' (to be used as 'superclass')

(load "Bird")


;; define 'Owl' as 'subclass' of Bird

(defrecord Owl [^Bird name] )


;;; Owl constructors
;;; - default: no args
;;;   Postcondition: name == a default value. 
;;; - explicit1:
;;;   Receive: itsName, a String
;;;   Postcondition: name == itsName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn make-Owl     
  ([]                (->Owl "Ann Onymous"))
  ([^String itsName] (->Owl itsName))
)

;;; method to retrieve a Owl's class
;;; Receive: this, a Owl object.
;;; Return: "Owl".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod getClass Owl [ _ ]
  "Owl"
)

;;; method to retrieve a Owl's call
;;; Receive: this, a Owl object.
;;; Return: "Woot"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod getCall Owl [ _ ]
  "Woot"
)



]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/clojure[00m$ cat src/birds.clj
;; birds.clj illustrates inheritance and polymorphism in Clojure.
;;
;; Output: the results of testing the Bird functions.
;;
;; Usage: clojure -m birds
;;
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 4/24/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns birds
  (:require
      [Bird]
      [Duck]
      [Goose]
      [Owl]
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main tests the classes in the Bird hierarchy.
;;; Output: the results of testing the Bird functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                              ;; Birds
      bird0 (make-Bird)            ; default Bird constructor
      bird1 (make-Bird "Hawkeye")  ; explicit Bird constructor
                                   ;; Ducks
      bird2 (make-Duck)            ; default Duck constructor
      bird3 (make-Duck  "Donald")  ; explicit Duck constructor
                                   ;; Geese
      bird4 (make-Goose)           ; default Goose constructor
      bird5 (make-Goose "Mother")  ; explicit Goose constructor
                                   ;; Owls
      bird6 (make-Owl)             ; default Owl constructor
      bird7 (make-Owl "Woodsey")   ; explicit Owl constructor
    ]

    (println "\nWelcome to the Bird Park!\n")
    (println (toString bird0))
    (println (toString bird1))
    (println)
    (println (toString bird2))
    (println (toString bird3))
    (println)
    (println (toString bird4))
    (println (toString bird5))
    (println)
    (println (toString bird6))
    (println (toString bird7))
    (println)
    (println "Goodbye, and come again!\n")
    (println)
  )
)
 
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/clojure[00m$ clojure -m birds

Welcome to the Bird Park!

Ann Onymous Bird says, "Squaaaaawk!"
Hawkeye Bird says, "Squaaaaawk!"

Ann Onymous Duck says, "Quack!"
Donald Duck says, "Quack!"

Ann Onymous Goose says, "Honk!"
Mother Goose says, "Honk!"

Ann Onymous Owl says, "Woot"
Woodsey Owl says, "Woot"

Goodbye, and come again!


]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/clojure[00m$ exit

Script done on 2020-04-24 14:13:45-0400
