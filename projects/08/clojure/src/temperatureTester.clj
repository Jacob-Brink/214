;; temperatureTester.clj tests a Clojure Temperature type,
;;  stored in Temperature.clj (in the src directory).
;;
;; Output: the results of testing the Name functions.
;;
;; Usage: clojure -m temperatureTester
;;
;; Begun by: Prof. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 4/14/2020
;; Project: 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns temperatureTester)


(load "Temperature")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A simple driver to test our Temperature functions. 
;; Output: the table results of testing our Temperature functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                                          ; 3 ways to construct an object:
     baseTemp (read-Temperature)
     limitTemp (read-Temperature)
     stepValue (Double/parseDouble (read-line))
    ]
    ;; ----- SECTION 1 -----
    (println)

    ;; if step value is positive loop up otherwise loop down

        (loop [currentTemp baseTemp]
          (if (or
               (if (> stepValue 0) (less-than currentTemp limitTemp) (less-than limitTemp currentTemp))
               (equals currentTemp limitTemp)
               )
            (do
              (print (printTemperature (getFahrenheit currentTemp)) " "
                     (printTemperature (getCelsius currentTemp)) " "
                     (printTemperature (getKelvin currentTemp)))
              (println) (flush)
              (recur (raise currentTemp stepValue))
              )
            )
          )        
      )
    
  )



