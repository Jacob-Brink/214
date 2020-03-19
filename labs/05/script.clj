Script started on 2020-03-07 10:36:11-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="93" LINES="25"]
]0;jacobb@jacob-virtualbox:~/lab5/clojure[01;32m[jacobb@jacob-virtualbox[01;37m clojure[01;32m]$[00m clojure -m split.clj[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kcat src/split.clj
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

]0;jacobb@jacob-virtualbox:~/lab5/clojure[01;32m[jacobb@jacob-virtualbox[01;37m clojure[01;32m]$[00m clojure -m split
To split a string, enter the string: hello
Enter the split position: 0

The first part is "" and the second part is "hello"

]0;jacobb@jacob-virtualbox:~/lab5/clojure[01;32m[jacobb@jacob-virtualbox[01;37m clojure[01;32m]$[00m clojure -m split
To split a string, enter the string: hello
Enter the split position: 3

The first part is "hel" and the second part is "lo"

]0;jacobb@jacob-virtualbox:~/lab5/clojure[01;32m[jacobb@jacob-virtualbox[01;37m clojure[01;32m]$[00m clojure -m split
To split a string, enter the string: hello
Enter the split position: 5

The first part is "hello" and the second part is ""

]0;jacobb@jacob-virtualbox:~/lab5/clojure[01;32m[jacobb@jacob-virtualbox[01;37m clojure[01;32m]$[00m clojure -m split[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kexit

Script done on 2020-03-07 10:37:31-05:00 [COMMAND_EXIT_CODE="0"]
