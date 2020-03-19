Script started on 2020-03-12 20:58:50-0400
]0;jpb34@gold01: ~/Documents/214/projects/05/clojure[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05/clojure[00m$ clojur      cat sr /  c/roo` ts.clj
;;;; roots.clj returns roots and boolean in vector indicating whether results are valid
;;;;
;;;; Input: A, B, and C that are floats
;;;; Output: vector with roots and boolean
;;;;
;;;; Usage: clojure -m roots
;;;;
;;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Project: 5
;;;; Date: 3/11/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns roots)      ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; roots() returns roots and boolean in vector indicating whether results are valid
;;; Receive: a, b, and c that are floats
;;; Return: vector with roots and boolean
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn rooter [a b c]
  (if (not= a 0.0)
    (let [arg (- (* b b) (* 4 a c))]

      (if (>= arg 0)
        (vector
         true
         (/ (+ (- b) (Math/sqrt arg)) (* 2 a))
         (/ (- (- b) (Math/sqrt arg)) (* 2 a)))
        
        (do (println "rooter(): b^2 -4ac is negative!")
            (vector false 0.0 0.0))
      )
      )

    (do (println "rooter(): a is zero!")
        (vector false 0.0 0.0))
    
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main function
;;; Input: a, b, and c
;;; Output: roots if valid, else false and 0's are returned 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn -main []

 (println "Enter a: ") (flush)
 (let [ a (double (read)) ]
     (println "Enter b: ") (flush)
     (let [b (double (read))]
       (println "Enter c: ")
       (let [c (double (read))]
         (dorun (map println (rooter a b c)))
       )
     )
)
)
]0;jpb34@gold01: ~/Documents/214/projects/05/clojure[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05/clojure[00m$ clojure -m roots
Enter a: 
1
Enter b: 
1
Enter c: 
1
rooter(): b^2 -4ac is negative!
false
0.0
0.0
]0;jpb34@gold01: ~/Documents/214/projects/05/clojure[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05/clojure[00m$ clojure -m roots
Enter a: 
0
Enter b: 
1
Enter c: 
1
rooter(): a is zero!
false
0.0
0.0
]0;jpb34@gold01: ~/Documents/214/projects/05/clojure[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05/clojure[00m$ clojure -m roots
Enter a: 
2
Enter b: 
5
Enter c: 
3
true
-1.0
-1.5
]0;jpb34@gold01: ~/Documents/214/projects/05/clojure[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05/clojure[00m$ exit

Script done on 2020-03-12 21:00:00-0400
