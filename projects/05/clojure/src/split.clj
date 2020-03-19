;;;; split.clj splits a string into two substrings.
;;;;
;;;; Input: aString, the string to be split,
;;;;        pos, the index where aString is to be split.
;;;; Output: the substring of aString before pos, and
;;;;         the substring of aString from pos onwards.
;;;;
;;;; Usage: clojure -m split
;;;;
;;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 3/6/2020
;;;; Lab: 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns split)      ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; split() splits a string into its two substrings.  
;;; Receive: aString, the string to be split,         
;;;          splitPos, the index where aString should be split.
;;; PRE: 0 <= splitPos < the length of aString.
;;; Return: the substring of aString before pos, and  
;;;         the substring of aString from pos onwards.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn split [iString sPos]
  (let [firstPart (subs iString 0 sPos)
        secondPart (subs iString sPos)]
    (vector firstPart secondPart)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main function
;;; Input: the string to be split,
;;;        the index where it should be split.
;;; Output: the two split parts of the string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "To split a string, enter the string: ") (flush)
  (let
    [ aString (read-line) ]                      ; read the string
    (print "Enter the split position: ") (flush)
    (let 
      [ pos (read)                               ; read the split pos.
        result (split aString pos)               ; split the string
        part1 (get result 0)                     ; retrieve the two
        part2 (get result 1)                     ;  parts
      ]
                                                 ; display the parts
      (printf (str "\nThe first part is \"%s\" and" 
                    " the second part is \"%s\"\n\n")
                       part1 part2)
    )
  )
)

