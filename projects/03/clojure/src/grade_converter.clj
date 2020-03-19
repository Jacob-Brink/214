;;; grade_converter.clj calculates the area of a rectangle.
;;;;
;;;; Input: The average grade
;;;; Output: The letter grade
;;;;
;;;; Usage: clojure -m grade_converter.clj
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Jacob Brink
;;;; Date: 2/26/2020
;;;; Project: 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns grade_converter)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function getLetter() computes the letter grade
;;; Receive: average grade
;;; Precondition: average grade is between 0 and 100
;;; Return: the letter grade matching the given average grade
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getLetter [avgGrade]
  (let
      [ grade (quot avgGrade 10)]

    (cond
      (= grade 10) "A"
      (= grade 9) "A"
      (= grade 8) "B"
      (= grade 7) "C"
      (= grade 6) "D"
      :else "F"
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function testGetLetter() runs test on specific case
;;; Receive: average grade and expected letter grade
;;; Precondition: average grade is between 0 and 100
;;; Return: none
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn testGetLetter [avgGrade, expectedLetterGrade]
  (println "(getLetter" avgGrade ") =" expectedLetterGrade
           (if (= (getLetter avgGrade) expectedLetterGrade)
             "Passed!"
             "Failed!"
             )
           )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function runTests runs tests on getLetter method

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn runTests []
  (println "Running tests...")
  (testGetLetter 100 "A")
  (testGetLetter 90 "A")
  (testGetLetter 85 "B")
  (testGetLetter 80 "B")
  (testGetLetter 75 "C")
  (testGetLetter 70 "C")
  (testGetLetter 65 "D")
  (testGetLetter 60 "D")
  (testGetLetter 59 "F")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (runTests)
  )
