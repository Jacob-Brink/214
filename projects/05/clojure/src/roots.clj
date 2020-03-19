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
