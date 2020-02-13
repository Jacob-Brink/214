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
