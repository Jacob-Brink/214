Script started on 2020-04-17 12:08:03-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/09/clojure[00m$ clojure[K[K[K[K[K[K[Kcat listOps.c[K[K[K[K[K[K[K[K[Ksrc.[K/listOps.clj 
;; listOps.clj is a Clojure "module" for list operations.
;;
;; Begun by: Prof. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 4/17/2020
;; Lab: 09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; maxOf2() finds the maximum of two values.  
;; Receive: val1, val2, two values.  
;; PRE: val1 and val2 can be compared using >.
;; Return: the maximum of val1 and val2. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn maxOf2 [val1 val2]
  (println val1 " " val2)
  (if (> val1 val2)      ; if val1 > val2
    val1                 ;   return val1
    val2                 ; else return val2
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; listMax() finds the maximum value in a list.
;; Receive: aList, a list of values.    
;; PRE: aList is a list 
;;      values in aList can be compared using >.
;; Return: the maximum value in aList.         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn listMax [aList]
  (if (and (list? aList) (not (empty? aList)))   
    (let [firstVal (first aList)]
      (if (= (count aList) 1)
        firstVal
        (maxOf2 firstVal (listMax (rest aList)))
      )
    )
    nil
    )
  )

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/09/clojure[00m$ cat src/max.clj
;; max.clj tests a function to search a list for its maximum value.
;;
;; Output: three lists, and 
;;          the results of calling a maxList() function on them.
;;
;; Usage: clojure -m max
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 4/17/2020
;; Lab: 09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns max)

(load "listOps")                      ; load module

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function -main tests function listMax(). 
;; Output: the results of testing listMax() on various lists.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
      [ 
       list1 '(99 88 77 66 55)        ; max is first value
       list2 (list 55 66 77 88 99)    ; max is last value
       list3 (list 55 77 99 88 66)    ; max is middle value
       emptyList '()                  ; list is empty
       ]

    (println)
    (println "list1: " list1)        ; print list1,
    (println "list2: " list2)        ;   list2,
    (println "list3: " list3)        ;   list3,
    (println "empty: " emptyList)    ;   list3,
    (println)                        ;   and their maxima
    (println "The max value in list1 is: " (listMax list1))
    (println "The max value in list2 is: " (listMax list2))
    (println "The max value in list3 is: " (listMax list3))
    (println)
    (println "The max of an empty list is: " (listMax emptyList))
    (println)
    )
  )

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/09/clojure[00m$ clojure -m max

list1:  (99 88 77 66 55)
list2:  (55 66 77 88 99)
list3:  (55 77 99 88 66)
empty:  ()

66   55
77   66
88   77
99   88
The max value in list1 is:  99
88   99
77   99
66   99
55   99
The max value in list2 is:  99
88   66
99   88
77   99
55   99
The max value in list3 is:  99

The max of an empty list is:  nil

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/09/clojure[00m$ exit

Script done on 2020-04-17 12:08:45-0500
