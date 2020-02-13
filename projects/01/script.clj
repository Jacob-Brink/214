Script started on 2020-02-12 20:46:45-0500
]0;jpb34@gold14: ~/Documents/214/projects/01[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01[00m$ cat     cd clojure/
]0;jpb34@gold14: ~/Documents/214/projects/01/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01/clojure[00m$ cat src/rectangle_area.clj
;;;; rectangle_area.clj calculates the area of a rectangle.
;;;;
;;;; Input: The width and height of a rectangle.
;;;; Output: The area of that rectangle.
;;;;
;;;; Usage: clojure -m rectangle_area
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 2/12/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns rectangle_area) ; namespace function names the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function rectangleArea() computes the area of a rectangle.
;;; Receive: itsWidth, itsHeight, a number.
;;; Precondition: itsHeight itsWidth  >= 0.0.
;;; Return: the area of the corresponding rectangle.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn rectangleArea [itsHeight itsWidth]
  (* itsHeight itsWidth 1.0 )  ; return width * height * 1.0 since formatting (%f) requires float not integer to display properly
)

(defn assertPositive [itsNumber]
  (assert (>= itsNumber 0) "-assertPositive: number must be positive")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins
;;; Input: the width and height of a rectangle.
;;; Output: the area of that rectangle.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (println "\nTo compute the area of a rectangle,")
  (print   " enter its height: ") (flush)
  (let
      [ height (read)]
      (assertPositive height)
      (print " enter its width: ") (flush)

      (let
        [ width (read) ]
        (assertPositive width)
        (printf "\nThe area is %f\n\n" (rectangleArea width height))
    )
    
  )
)  
]0;jpb34@gold14: ~/Documents/214/projects/01/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01/clojure[00m$ clojure -m rectangle_area

To compute the area of a rectangle,
 enter its height: 2
 enter its width: 3

The area is 6.000000

]0;jpb34@gold14: ~/Documents/214/projects/01/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01/clojure[00m$ clojure -m rectangle_areaat src/rectangle_area.clj[1Plojure -m rectangle_area

To compute the area of a rectangle,
 enter its height: 4
 enter its width: 6

The area is 24.000000

]0;jpb34@gold14: ~/Documents/214/projects/01/clojure[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01/clojure[00m$ exit

Script done on 2020-02-12 20:47:28-0500
