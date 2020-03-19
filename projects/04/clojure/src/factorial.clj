;;;; factorial.clj calculates the factorial
;;;;
;;;; Input: number
;;;; Precondition: number is integer
;;;; Output: factorial of given number
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 2/28/2020
;;;; Project: 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns factorial)                                 ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; calculateFactorial() calculates a factorial
;;; Receive: number
;;; Precondition: number is integer
;;; Output: factorial of number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defn calculateFactorial [number]
    (loop [i 2 answer 1]
      (if (<= i number)
         (recur (inc i) (* answer i))
         answer
         )
      )    
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; -main is a 'driver' for the 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn -main []
 (println "Enter a number: ") (flush)
 (let
    [ number (double (read)) ] 
   (println)
   (printf "The factorial of %s is %s" number (calculateFactorial number))
 )
)

