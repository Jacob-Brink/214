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
