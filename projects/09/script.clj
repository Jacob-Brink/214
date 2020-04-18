Script started on 2020-04-18 11:23:33-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/clojure[00m$ cat src/listOps.clj
;; listOps.clj is a Clojure "module" for list operations.
;;
;; Begun by: Prof. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 4/22/2020
;; Project: 09
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; searchList() finds the position of item in list
;; Receive: aList, a list of values; item to search, an integer    
;; PRE: aList is a list 
;;      values in aList can be compared using >.
;; Return: position of item in list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn searchList [aList, item, position]
  (if (list? aList)
    (if (empty? aList)
      -1
      (if (= (first aList) item)
        position
        (searchList (rest aList) item (+ position 1))
        )
      )
    nil
    )
  )
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/clojure[00m$ cat src/search.clj
;; search.clj tests a function to search a list for its maximum value.
;;
;; Output: three lists, and 
;;          the results of calling a maxList() function on them.
;;
;; Usage: clojure -m max
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 4/22/2020
;; Project: 09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns search)

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
       list4 '(88 77 66 55 44)
       emptyList '()                  ; list is empty
       ]

    (println)
    (println "list1: " list1)        ; print list1,
    (println "list2: " list2)        ;   list2,
    (println "list3: " list3)
    (println "list4: " list4)                                    ;  list3,
    (println "empty: " emptyList)    ;   list3,
    (println)                        ;   and their maxima
    (println "The position of 99 in list1 is: " (searchList list1 99 0))
    (println "The position of 99 in list2 is: " (searchList list2 99 0))
    (println "The position of 99 in list3 is: " (searchList list3 99 0))
    (println "The position of 99 in list4 is: " (searchList list4 99 0))
    
    (println)
    (println "The max of an empty list is: " (listMax emptyList))
    (println)
    )
  )

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/clojure[00m$ clojure -m search

list1:  (99 88 77 66 55)
list2:  (55 66 77 88 99)
list3:  (55 77 99 88 66)
list4:  (88 77 66 55 44)
empty:  ()

The position of 99 in list1 is:  0
The position of 99 in list2 is:  4
The position of 99 in list3 is:  2
The position of 99 in list4 is:  -1

The max of an empty list is:  nil

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/clojure[00m$ exit

Script done on 2020-04-18 11:24:12-0500
