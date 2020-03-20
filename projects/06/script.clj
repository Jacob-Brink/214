Script started on 2020-03-20 12:41:27-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06/clojure[00m$ clojur[K[K[K[K[Kat src/a[KA[Karrayprocessing.clj
;; arrayprocessing.clj "test-drives" function arrayprocessing() and arrayinput().
;; precondition: size given is nonnegative
;; Output: the arrayprocessing of a sequence of numbers.
;;
;; Usage: clojure -m arrayprocessing
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 3/19/2020
;; Project: 06
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns arrayprocessing)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; arrayprocessing() prints the values of the given array
;; Receive: aVec, a vector of numbers. 
;; Return: the arrayprocessing of the numbers in aVec.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
(defn arrayprocessing [array]
  (loop [i 0]
    (if (< i (count array))
      (do
        (printf "%.3f\n" (get array i))
        (recur (inc i))
        )
      )
    )
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; arrayinput inputs the values in a vector.       
;; Receive: arraySize an integer
;; Return: array filled with user input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn arrayinput [arraySize]
  (loop [i 0 array []]
    (if (< i arraySize)
      (do (print "Enter value: ") (flush)
          (let [userInput (float (read))]
            (recur (inc i) (conj array userInput))
         )
          )
      array
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; main function to test functions sum() and arrayprocessing()
;; Output: the sum and arrayprocessing of some test vectors.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "\nEnter Size: ") (flush)

  (let [ arraySize (int (read)) ]
    (arrayprocessing (arrayinput arraySize))
    )

)

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06/clojure[00m$ cat src/arrayprocessing.clj[4Pruby ArrayProcessing.rb[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kclojure -m ArrayProcessing[C[1Processingprocessing[1Prrayprocessingarrayprocessing

Enter Size: 4
Enter value: 1
Enter value: 2
Enter value: 3
Enter value: 4
1.000
2.000
3.000
4.000
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06/clojure[00m$ clojure -m arrayprocessing

Enter Size: 0
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06/clojure[00m$ clojure -m arrayprocessing

Enter Size: -1
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06/clojure[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06/clojure[00m$ exit

Script done on 2020-03-20 12:42:28-0500
