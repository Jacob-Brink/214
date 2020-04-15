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
