Script started on 2020-02-28 13:49:53-0500

]0;jpb34@gold14: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ 
]0;jpb34@gold14: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ at  cat src/logTable.clj
;;;; logTable.clj displays a table of logarithms.
;;;;
;;;; Input: start, stop and increment, three numbers.
;;;; Precondition: start < stop && increment > 0.
;;;; Output: A table of logarithms from start to stop,
;;;;          with interval of increment.
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 2/28/2020
;;;; Lab: 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns logTable)                                 ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; displayLogTable() recursively generates the log-table.
;;; Receive: start the first value for the table;
;;;          stop, the last  value for the table;
;;;           step, the step value for the table;
;;; Precondition: start < stop && increment > 0.
;;; Output: The table of logs from start to stop, by step.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defn displayLogTable [start stop step]
  (if (<= start stop)
    (do
      (printf "The logarithm of %f is %f%n" start (Math/log10 start))
      (displayLogTable (+ start step) stop step)
      )
    )
  )


;; loop (indirect-recursion) version
(defn displayLogTable2 [start stop step]
  (loop [i start]                           ; set i to start
    (when (<= i stop)                       ; if i <= stop:
      (printf "The logarithm of %f is %f\n" ;  print one line
              i (Math/log10 i)
              )
      (recur (+ i step))                    ; recurse, i += step
      )
    )
  )

;; indirect/tail-recursive version (just using recur)
(defn displayLogTable3 [start stop step]
  (if (<= start stop)                     ; if start <= stop:
    (do                                      ; do these two things:
      (printf "The logarithm of %f is %f\n"  ; - print one line
              start (Math/log10 start)
              )
      (recur (+ start step) stop step)       ; - recurse, start+=step
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; -main is a 'driver' for the displayLogTable() functions.
;;; Input: start, stop and increment.
;;; Output: The table of logarithms 
;;;          from start to stop by increment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn -main []
 (println "To display a table of logarithms,")
 (print " enter the start, stop, and increment values: ") (flush)
 (let
    [ start (double (read))
      stop (double (read))
      increment (double (read))
    ] 
    (println)
    (displayLogTable start stop increment) 
    (println)
    (displayLogTable2 start stop increment) 
    (println)
    (displayLogTable3 start stop increment) 
    (println)
 )
)

]0;jpb34@gold14: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ clojure -m logTable
To display a table of logarithms,
 enter the start, stop, and increment values: 1
2
0.5

The logarithm of 1.000000 is 0.000000
The logarithm of 1.500000 is 0.176091
The logarithm of 2.000000 is 0.301030

The logarithm of 1.000000 is 0.000000
The logarithm of 1.500000 is 0.176091
The logarithm of 2.000000 is 0.301030

The logarithm of 1.000000 is 0.000000
The logarithm of 1.500000 is 0.176091
The logarithm of 2.000000 is 0.301030

]0;jpb34@gold14: ~/Documents/214/projects/04/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04/clojure[00m$ c exit

Script done on 2020-02-28 13:50:47-0500
