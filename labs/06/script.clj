Script started on 2020-03-20 09:14:18-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06/clojure[00m$ c[Kcat src/average.clj
;; average.clj "test-drives" function average().
;;
;; Output: the average of a sequence of numbers.
;;
;; Usage: clojure -m average
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 3/19/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns average)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sum() sums the values in a vector.       
;; Receive: aVec, a vector of numbers.
;; Return: the sum of the values in aVec.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; easier (non-recursive) solution
(defn sum2 [aVec]
  (if (vector? aVec)      ; if aVec is a vector:
    (if (empty? aVec)     ;   if aVec is empty:
      0.0                 ;    return 0
      (reduce + aVec)     ;   else reduce aVec using +
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; average() computes the average of a vector of numbers.
;; Receive: aVec, a vector of numbers. 
;; Return: the average of the numbers in aVec.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
(defn average [array]
  (if (vector? array)
    (if (empty? array)
      0.0
      (/ (sum array) (count array))
      )
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; main function to test functions sum() and average()
;; Output: the sum and average of some test vectors.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [ emptyVec []
      testVec  [9.0 8.0 7.0 6.0]
    ]

    (print "\nThe empty vec: " emptyVec) 
    (print "\nThe test  vec: " testVec) 
    (println "\n")

    ;; Test sum()...
    (printf "\nThe first sum is %.3f\n" (sum emptyVec))
    (printf "The second sum is %.3f\n" (sum testVec))

    ;; Test average()...
    (printf "\nThe first average is %.3f\n" (average emptyVec))
    (printf "The second average is %.3f\n" (average testVec))
    (println "\n")

    ;; Test sum2()...
    (printf "\nThe first sum2 is %.3f\n" (sum2 emptyVec))
    (printf "The second sum2 is %.3f\n" (sum2 testVec))
    (println "\n")
  )
)

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06/clojure[00m$ clojure -m average

The empty vec:  []
The test  vec:  [9.0 8.0 7.0 6.0]


The first sum is 0.000
The second sum is 30.000

The first average is 0.000
The second average is 7.500



The first sum2 is 0.000
The second sum2 is 30.000


]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06/clojure[00m$ exit

Script done on 2020-03-20 09:14:47-0500