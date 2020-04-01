Script started on 2020-04-01 09:39:18-0400
]0;jpb34@gold03: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold03[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ cloju     cat r src/factorial.clj
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

]0;jpb34@gold03: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold03[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ clojure -m factorial
Enter a number: 
4

The factorial of 4.0 is 24]0;jpb34@gold03: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold03[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ clojure -m factorial
2Enter a number: 


The factorial of 2.0 is 2]0;jpb34@gold03: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold03[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ clojure -m factorial
Enter a number: 
1

The factorial of 1.0 is 1]0;jpb34@gold03: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold03[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ clojure -m factorial
Enter a number: 
0

The factorial of 0.0 is 1]0;jpb34@gold03: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold03[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ exit

Script done on 2020-04-01 09:41:05-0400
