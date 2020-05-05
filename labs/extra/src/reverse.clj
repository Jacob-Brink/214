;; reverse.clj "test-drives" function reverse-simple() and super-reverse().
;;
;; Output: the average of a sequence of numbers.
;;
;; Usage: clojure -m reverse
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 5/5/2020
;; Lab: 12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns reverse)

;; harder (recursive) solution
(defn sum [aVec]
  (if (vector? aVec)      ; if aVec is a vector
    (if (empty? aVec)     ;   if aVec is empty:
      0.0                 ;     return 0
      (+ (peek aVec)      ;   else return the last value
         (sum (pop aVec)) ;    + sum(all but the last value)
         )
      )
    )
  )

;; reverse function
(defn reverse-simple [listA reverseList]
  (if (= (count listA) 1)
    (conj reverseList (first listA)) ;;end recursion by returning reverseList with first number (really last number in original listA) to beginning of reverseList
    (reverse-simple (rest listA) (conj reverseList (first listA)))         
    )
  )



(defn super-reverse [listA reverseList]
  (let [item
        (if (list? (first listA))
               (super-reverse (first listA) '())
               (first listA)
               )

        ]
    (if (= (count listA) 1)
      (conj reverseList item) ;;end recursion by returning reverseList with first number (really last number in original listA) to beginning of reverseList
      (super-reverse (rest listA) (conj reverseList item))         
      )
    
    )
  
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; main function to test functions sum() and average()
;; Output: the sum and average of some test vectors.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (loop [ meta '(
                (12 3 4 5)
                ((4 5) 6 7 8)
                (55 (66 77) 88)
                )]
    (when (not (empty? meta))
      (print "Original List Is " (first meta))
      (print "\nReversed List Is " (reverse-simple (first meta) '()))
     (print "\nSuper Reversed List Is " (super-reverse (first meta) '()))
      (print "\n\n")
      (recur (rest meta))          
      )
    )

  ) 
