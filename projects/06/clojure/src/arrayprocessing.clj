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

