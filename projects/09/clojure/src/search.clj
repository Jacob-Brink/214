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

