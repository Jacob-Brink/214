Script started on 2020-04-15 17:35:21-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ cat src/T[KtemperatureTester.clj
;; temperatureTester.clj tests a Clojure Temperature type,
;;  stored in Temperature.clj (in the src directory).
;;
;; Output: the results of testing the Name functions.
;;
;; Usage: clojure -m temperatureTester
;;
;; Begun by: Prof. Adams, CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 4/15/2020
;; Project: 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns temperatureTester)


(load "Temperature")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A simple driver to test our Temperature functions. 
;; Output: the table results of testing our Temperature functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (try
    (do
      (print "Enter baseTemp, limitTemp, then stepValue: \n") (flush)
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


    

  (catch Exception e (print "An error occurred: " (.getMessage e) "\n"))
  )    
  )



]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ cat src/Temperature.clj
;; Temperature.clj is a module for our 'Temperature' type-abstraction.
;;
;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;; Completed by: Jacob Brink
;; Date: 4/15/2020
;; Project: 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create a record/struct type named Temperature
(defrecord Temperature [degrees scale])

;; Minimum degrees for each scale
(def minDegree (hash-map
                :f (- 0 459.67)
                :F (- 0 459.67)
                :c (- 0 273.15)
                :C (- 0 273.15)
                :k 0
                :K 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; check-Temperature checks temperature to see if it is valid
;; Receive: degrees and scale
;; Return: exception if invalid, else nothing 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn check-Temperature [^Double degrees ^String scale]
  (if (= (get minDegree (keyword scale)) nil)
    (throw (Exception. "Invalid Temperature scale"))
    (do
      (if (< degrees (get minDegree (keyword scale)))
        (throw (Exception. "Temperature cannot be below zero"))
        )
      )
    )
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make-Temperature constructs a Temperature object from degrees and scale
;; Receive: degrees a double, scale a string
;; Return: the Temperature (degrees scale). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Temperature [^Double degrees ^String scale]
  (check-Temperature degrees scale)
  (->Temperature degrees scale)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getDegrees returns the degrees of the temperature object
;; Receive: aTemperature, a Temperature.
;; Return: degrees of given temperature
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getDegrees [aTemperature]
  (:degrees aTemperature)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getScale extracts the scale type of a temperature object.
;; Receive: aTemperature, a Temperature. 
;; Return: the scale in aTemperature.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getScale [aTemperature]
  (:scale aTemperature)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getFahrenheit converts the given temperature to Fahrenheit
;; Receive: aTemperature, a Temperature.
;; Return: the temperature in fahrenheit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getFahrenheit [^Temperature temperature]
  (let [scale (getScale temperature)
        degrees (getDegrees temperature)]
    (cond
      (or (= scale "f") (= scale "F")) temperature
      (or (= scale "c") (= scale "C")) (make-Temperature (+ (* (/ 9.0 5.0) degrees) 32) "f")
      (or (= scale "k") (= scale "K")) (make-Temperature (+ (* (- degrees 273.15) (/ 9.0 5)) 32) "f")
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getCelsius converts the given temperature to celsius
;; Receive: aTemperature, a Temperature.
;; Return: the temperature in celsius
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getCelsius [^Temperature temperature]
  (let [scale (getScale temperature)
        degrees (getDegrees temperature)]
    (cond
      (or (= scale "f") (= scale "F")) (make-Temperature (* (- degrees 32) (/ 5 9)) "c")
      (or (= scale "c") (= scale "C")) temperature
      (or (= scale "k") (= scale "K")) (make-Temperature (- degrees 273.15) "c")
      )
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getKelvin converts the given temperature to Kelvin
;; Receive: aTemperature, a Temperature.
;; Return: the temperature in kelvin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getKelvin [^Temperature temperature]
  (let [scale (getScale temperature)
        degrees (getDegrees temperature)]
    (cond
      (or (= scale "f") (= scale "F")) (make-Temperature (+ (* (- degrees 32) (/ 5 9)) 273.15) "k")
      (or (= scale "c") (= scale "C")) (make-Temperature (+ degrees 273.15) "k")
      (or (= scale "k") (= scale "K")) temperature
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; read-Temperature reads in a temperature
;; Receive: aTemperature, a Temperature
;; Return: temperature if valid from user
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn read-Temperature []
  (let [aString (clojure.string/split (read-line) #" ")
        degrees (Double. (get aString 0))
        scale (get aString 1)]
    (make-Temperature degrees scale)    
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; printTemperature displays a name object. 
;; Receive: aTemperature, a Temperature, 
;; Output: the string representation of aTemperature. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn printTemperature [aTemperature]
  (format "%.2f %s" (getDegrees aTemperature) (getScale aTemperature))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; raise raises temperature
;; Receive: aTemperature, a Temperature, 
;; Output: temperature with added degrees
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn raise [^Temperature aTemperature ^Double delta]
  (make-Temperature (+ (getDegrees aTemperature) delta) (getScale aTemperature)) 
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lower lowers temperature
;; Receive: aTemperature, a Temperature, 
;; Output: temperature with less degrees
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn lower [^Temperature aTemperature ^Double delta]
  (make-Temperature (- (getDegrees aTemperature) delta) (getScale aTemperature)) 
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; equals shows equality between two temperatures
;; Receive: aTemperature, a Temperature; bTemperature, a Temperature
;; Output: true if equal, else false
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn equals [^Temperature aTemperature ^Temperature bTemperature]
  (= (getDegrees (getKelvin aTemperature)) (getDegrees (getKelvin bTemperature)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; less-than shows inequality
;; Receive: aTemperature, a Temperature; bTemperature, a Temperature
;; Output: true if a is less than b, else false
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn less-than [^Temperature aTemperature ^Temperature bTemperature]
  (< (getDegrees (getKelvin aTemperature)) (getDegrees (getKelvin bTemperature)))
  )
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ lc[K[Kclojru[K[Kure -m temperatureTester
Enter baseTemp, limitTemp, then stepValue: 
0 F
10 F
1 4

0.00 F   -17.78 c   255.37 k
4.00 F   -15.56 c   257.59 k
8.00 F   -13.33 c   259.82 k
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ clojure -m temperatureTester
20 Enter baseTemp, limitTemp, then stepValue: 
C
-10 C
-2

68.00 f   20.00 C   293.15 k
64.40 f   18.00 C   291.15 k
60.80 f   16.00 C   289.15 k
57.20 f   14.00 C   287.15 k
53.60 f   12.00 C   285.15 k
50.00 f   10.00 C   283.15 k
46.40 f   8.00 C   281.15 k
42.80 f   6.00 C   279.15 k
39.20 f   4.00 C   277.15 k
35.60 f   2.00 C   275.15 k
32.00 f   0.00 C   273.15 k
28.40 f   -2.00 C   271.15 k
24.80 f   -4.00 C   269.15 k
21.20 f   -6.00 C   267.15 k
17.60 f   -8.00 C   265.15 k
14.00 f   -10.00 C   263.15 k
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ clojure -m temperatureTester
10 kEnter baseTemp, limitTemp, then stepValue: 
^C]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ clojure -m temperatureTester
Enter baseTemp, limitTemp, then stepValue: 
10 k
20 K
2

-441.67 f   -263.15 c   10.00 k
-438.07 f   -261.15 c   12.00 k
-434.47 f   -259.15 c   14.00 k
-430.87 f   -257.15 c   16.00 k
-427.27 f   -255.15 c   18.00 k
-423.67 f   -253.15 c   20.00 k
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ clojure -m temperatureTester
Enter baseTemp, limitTemp, then stepValue: 
-20 k
An error occurred:  Temperature cannot be below zero 
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ clojure -m temperatureTester
-Enter baseTemp, limitTemp, then stepValue: 
-200    ^C]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ clojure -m temperatureTester
Enter baseTemp, limitTemp, then stepValue: 
-2000 f
An error occurred:  Temperature cannot be below zero 
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ clojure -m temperatureTester
Enter baseTemp, limitTemp, then stepValue: 
- 20 r R
An error occurred:  Invalid Temperature scale 
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/clojure[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/clojure[00m$ exit

Script done on 2020-04-15 17:37:17-0400
