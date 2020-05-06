;; misc.clj "test-drives" function member?() and subsequence().
;;
;; Output: the average of a sequence of numbers.
;;
;; Usage: clojure -m misc
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 5/5/2020
;; Lab: Extra Credit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns misc)

;; misc function
(defn member? [item listA]
  (if (empty? listA)
    false
    (if (= (count listA) 1)
      (= (first listA) item)
      (if (= (first listA) item)
        true
        (member? item (rest listA))
        )
      )
    )
  )


;; super-misc function
(defn subsequence [listA i j]
  (if (or (>= i (count listA)) (>= (+ j i) (count listA)))
    nil

    ;; add current element to sub sequence if i is less than 0 and j is greater than 0 (which means current item is in subsequence)
    (if (<= i 0)
      (if (> j 1)
        (conj (subsequence (rest listA) (dec i) (dec j)) (first listA)) 
        (if (= j 1) (list (first listA))) ;; base case: return list containing only last element of sub sequence
        )
      (subsequence (rest listA) (dec i) j)
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; main function to test functions sum() and average()
;; Output: the sum and average of some test vectors.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "\n Testing Member? \n\n")
  (loop [ meta '(
                 [((1 2) 3 (4 (5 6))) (1 2) true]
                 [((1 2) 3 (4 (5 6))) 3 true]
                 [((1 2) 3 (4 (5 6))) (4 (5 6)) true]
                 [((1 2) 3 (4 (5 6))) 1 false]
                 [((1 2) 3 (4 (5 6))) 2 false]
                 [((1 2) 3 (4 (5 6))) 4 false]
                 )]
    (when (not (empty? meta))
      
      (let [currentList (first meta)
            searchItem (get currentList 1)
            searchList (get currentList 0)
            searchSuccessExpected (get currentList 2)]

        (printf "    Searching %s for item %s should be %s. Search returns %s. %s \n"
                searchList
                searchItem
                searchSuccessExpected
                (member? searchItem searchList)
                (if (= searchSuccessExpected (member? searchItem searchList)) "Success!" "Failure!")
                )
        (recur (rest meta))          
        )
      )

    )

  (print "\n\n Testing Subsequence \n\n")

  
  (loop [ meta '(
                 [(1 2 (3 4) (5 (6 7))) 1 2 (2 (3 4))]
                 [(1 2 3 4 5 6 7) 2 4 (3 4 5 6)]
                 [(1 2 3) 5 6 nil]
                 )]
    (when (not (empty? meta))
      
      (let [currentTest (first meta)
            sequence (get currentTest 0)
            i (get currentTest 1)
            j (get currentTest 2)
            result (get currentTest 3)
            ]

        (printf "    (subsequence %s %s %s) is %s. %s\n" sequence i j (subsequence sequence i j) (if (= result (subsequence sequence i j)) "Success!" "Fail!"))
        (recur (rest meta))          
        )
      )

    )

  (print "\n\n")
  )
