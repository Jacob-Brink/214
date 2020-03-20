;;;; nameTester.clj creates and tests a clojure Name type.
;;;;
;;;; Output: results of testing Name functions.
;;;;
;;;; Usage: clojure -m nameTester
;;;;
;;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;;; Completed by:
;;;; Date:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns nameTester)   ; program name

;;; define a Clojure record named Name 
;;; (which compiles to a Java class).

; Replace this line with the definition of record-type Name


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; make-Name constructs a Name from three strings. 
;;; Receive: firstN, middleN and lastN, three strings.
;;; Return: the Name (firstN middleN lastN). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with a definition of function make-Name

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst() extracts the first name of a Name object.
;;; Receive: aName, a Name.
;;; Return: the firstName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)
; Replace this line with the definition of getFirst()

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle() extracts the middle name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the middleName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
; Replace this line with the definition of getMiddle()

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast() extracts the last name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the lastName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
; Replace this line with the definition of getLast()

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName() returns a full name in F-M-L order. 
;;; Receive: aName, a Name. 
;;; Return: firstName, middleName, lastName,
;;;           separated by spaces. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
; Replace this line with a definition of toString()

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName() displays a name object.
;;; Receive: aName, a Name.
;;; Output: the strings in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
; Replace this line with a definition of printName()

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver to test our Name functions. 
;;; Output: the result of testing our Name functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                                          ; 3 ways to construct an object:
;      name1 (make-Name "John" "Paul" "Jones")  ; -using our "make-" constructor
;      name2 (->Name "Jane" "Penelope" "Jones") ; -invoking constructor directly
                                               ; -mapping field-names to values
;      name3 (map->Name {:lastName "Jones" :firstName "Jinx" :middleName "Joy"})
    ]
    ;; ----- SECTION 1 -----
;    (println)
;    (print name1) (println)
;    (assert (= (getFirst name1) "John") "getFirst(1) failed")
;    (assert (= (getMiddle name1) "Paul") "getMiddle(1) failed")
;    (assert (= (getLast name1) "Jones") "getLast(1) failed")
;    (assert (= (toString name1) "John Paul Jones") "toString(1) failed")
;    (printName name1) (println)
    ;; ----- SECTION 2 -----
;    (println)
;    (print name2) (println)
;    (assert (= (getFirst name2) "Jane") "getFirst(2) failed")
;    (assert (= (getMiddle name2) "Penelope") "getMiddle(2) failed")
;    (assert (= (getLast name2) "Jones") "getLast(2) failed")
;    (assert (= (toString name2) "Jane Penelope Jones") "toString(2) failed")
;    (printName name2) (println)
    ;; ----- SECTION 3 -----
;    (println)
;    (print name3) (println)
;    (assert (= (getFirst name3) "Jinx") "getFirst(3) failed")
;    (assert (= (getMiddle name3) "Joy") "getMiddle(3) failed")
;    (assert (= (getLast name3) "Jones") "getLast(3) failed")
;    (assert (= (toString name3) "Jinx Joy Jones") "toString(3) failed")
;    (printName name3) (println)

    (println "\nAll tests passed!\n")
  )
)

