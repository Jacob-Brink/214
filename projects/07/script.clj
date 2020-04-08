Script started on 2020-04-08 12:55:32-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/07/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/07/clojure[00m$ cat src/nameTester.clj
;;;; nameTester.clj creates and tests a clojure Name type.
;;;;
;;;; Output: results of testing Name functions.
;;;;
;;;; Usage: clojure -m nameTester
;;;;
;;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 3/20/2020
;;;; Project: 07
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns nameTester)   ; program name

;;; define a Clojure record named Name 
;;; (which compiles to a Java class).

(defrecord Name [firstName middleName lastName])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; make-Name constructs a Name from three strings. 
;;; Receive: firstN, middleN and lastN, three strings.
;;; Return: the Name (firstN middleN lastN). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn make-Name [first middle last]
  (->Name first middle last)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setFirst() sets the first name of Name.
;;; Receive: aName, newFirstName.
;;; Return: the new Name with first name changed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn setFirst [^Name aName newFirstName]
  (->Name newFirstName (:middleName aName) (:lastName aName))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setMiddle() sets the middle name of Name.
;;; Receive: aName, newMiddleName.
;;; Return: the new Name with middle name changed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn setMiddle [^Name aName newMiddleName]
  (->Name (:firstName aName) newMiddleName (:lastName aName))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setLast() sets the last name of Name.
;;; Receive: aName, newLastName.
;;; Return: the new Name with last name changed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn setLast [^Name aName newLastName]
  (->Name (:firstName aName) (:middleName aName) newLastName)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLfmi() extracts the last first and middle initial
;;; Receive: aName, a Name.
;;; Return: the LfmiName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn getLfmi [^Name aName]
  (str (:lastName aName) ", " (:firstName aName) " " (subs (:middleName aName) 0 1) ".")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLfmi() extracts the last first and middle initial
;;; Receive: aName, a Name.
;;; Return: the LfmiName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn readName [^Name aName]
  (print "Enter First Name: ") (flush)
  (let  [ first (read) ]
    (print "Enter Middle Name: ") (flush)
    (let [ middle (read) ]
      (print "Enter Last Name: ") (flush)
      (let [ last (read) ] 
        (->Name first middle last)
      )
     )
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst() extracts the first name of a Name object.
;;; Receive: aName, a Name.
;;; Return: the firstName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn getFirst [^Name aName]
  (:firstName aName)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle() extracts the middle name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the middleName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn getMiddle [^Name aName]
  (:middleName aName)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast() extracts the last name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the lastName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 

(defn getLast [^Name aName]
  (:lastName aName)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName() returns a full name in F-M-L order. 
;;; Receive: aName, a Name. 
;;; Return: firstName, middleName, lastName,
;;;           separated by spaces. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn toString [^Name aName]
  (str (:firstName aName) " " (:middleName aName) " " (:lastName aName))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName() displays a name object.
;;; Receive: aName, a Name.
;;; Output: the strings in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn printName [^Name aName]
  (print (toString aName))
  )


(defn testProject []
  (let [
        name1 (->Name "Jacob" "Jingle" "Hymer")
        mutate_first (setFirst name1 "John")
        mutate_middle (setMiddle name1 "Paul")
        mutate_last (setLast name1 "Jones")
        lfmi (getLfmi name1)
        ]
    ;; ------- MUTATOR -------
    (println "Testing mutator methods...")
    (println "Testing setFirst")
    (assert (= (getFirst mutate_first) "John") "setFirst() failed")
    (assert (= (getMiddle mutate_first) "Jingle") "setFirst() failed")
    (assert (= (getLast mutate_first) "Hymer") "setFirst() failed")

    (println "Testing setMiddle")
    (assert (= (getFirst mutate_middle) "Jacob") "setMiddle() failed")
    (assert (= (getMiddle mutate_middle) "Paul") "setMiddle() failed")
    (assert (= (getLast mutate_middle) "Hymer") "setMiddle() failed")

    (println "Testing setLast")
    (assert (= (getFirst mutate_last) "Jacob") "setLast() failed")
    (assert (= (getMiddle mutate_last) "Jingle") "setLast() failed")
    (assert (= (getLast mutate_last) "Jones") "setLast() failed")

    ;; ------ LFMI -------
    (println "Testing Last, First I. method")
    (println (getLfmi name1))
    (assert (= (getLfmi name1) "Hymer, Jacob J.") "getLfmi() failed")

    ;; ------ READ -------
    (println "Testing read function...")
    (let [read_name (readName name1)]
      (println "Check that the following name matches what you entered")
      (print read_name)
      )
    
    
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver to test our Name functions. 
;;; Output: the result of testing our Name functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                                          ; 3 ways to construct an object:
      name1 (make-Name "John" "Paul" "Jones")  ; -using our "make-" constructor
      name2 (->Name "Jane" "Penelope" "Jones") ; -invoking constructor directly
                                               ; -mapping field-names to values
      name3 (map->Name {:lastName "Jones" :firstName "Jinx" :middleName "Joy"})
    ]
    ;; ----- SECTION 1 -----
    (println)
    (print name1) (println)
    (assert (= (getFirst name1) "John") "getFirst(1) failed")
    (assert (= (getMiddle name1) "Paul") "getMiddle(1) failed")
    (assert (= (getLast name1) "Jones") "getLast(1) failed")
    (assert (= (toString name1) "John Paul Jones") "toString(1) failed")
    (printName name1) (println)
    ;; ----- SECTION 2 -----
    (println)
    (print name2) (println)
    (assert (= (getFirst name2) "Jane") "getFirst(2) failed")
    (assert (= (getMiddle name2) "Penelope") "getMiddle(2) failed")
    (assert (= (getLast name2) "Jones") "getLast(2) failed")
    (assert (= (toString name2) "Jane Penelope Jones") "toString(2) failed")
    (printName name2) (println)
    ;; ----- SECTION 3 -----
    (println)
    (print name3) (println)
    (assert (= (getFirst name3) "Jinx") "getFirst(3) failed")
    (assert (= (getMiddle name3) "Joy") "getMiddle(3) failed")
    (assert (= (getLast name3) "Jones") "getLast(3) failed")
    (assert (= (toString name3) "Jinx Joy Jones") "toString(3) failed")
    (printName name3) (println)

    (testProject)
    
    (println "\nAll tests passed!\n")
  )
)

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/07/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/07/clojure[00m$ clojure -m nameTester

#nameTester.Name{:firstName John, :middleName Paul, :lastName Jones}
John Paul Jones

#nameTester.Name{:firstName Jane, :middleName Penelope, :lastName Jones}
Jane Penelope Jones

#nameTester.Name{:firstName Jinx, :middleName Joy, :lastName Jones}
Jinx Joy Jones
Testing mutator methods...
Testing setFirst
Testing setMiddle
Testing setLast
Testing Last, First I. method
Hymer, Jacob J.
Testing read function...
Enter First Name: Jacob
Enter Middle Name: Br  Peter
Enter Last Name: r Brink
Check that the following name matches what you entered
#nameTester.Name{:firstName Jacob, :middleName Peter, :lastName Brink}
All tests passed!

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/07/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/07/clojure[00m$ exit

Script done on 2020-04-08 12:56:22-0400
