;;;; arraySum.clj sums the integers in a file using an array.
;;;;
;;;; Usage: clojure -m arraySum <inputFileName> 
;;;;
;;;; Input: the name of the input file and the number of threads
;;;;         (both entered on the command-line).
;;;; Precondition: the first line of the file is an integer N
;;;;               the second line is a blank
;;;;               the remaining lines contain N integers
;;;;               (one per line).
;;;; Output: the sum of the other numbers in the file
;;;;          and how long it took to compute that sum.
;;;;
;;;; Begun by: Prof. Adams for CS 214 at Calvin College.
;;;; Completed by:
;;;; Date:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns arraySum)

;;; recursively fill an array with values from a Java Scanner
;;;
;;; Parameters: array, an array of longs 
;;;             in, a scanner.
;;; Precondition: in contains N values &&
;;;               array contains space for N values.
;;; Postcondition: array contains the N values from in.
;;; Pass back: array, containing the N values from in.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn fill [array in] 
  (loop [i 0]                            ; set i to 0
    (when (< i (count array))            ; while i < array.size
      (aset array i (.nextLong in))      ;  array[i] = in.nextLong
      (recur (inc i))                    ;  recurse (i+1)
    )
  )
)

;; The following version of fill works for smaller arrays,
;;  but generates StackOverflow errors for larger arrays
;;  even though the function uses end-recursion.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(defn fill [ array index in] 
;  (if (< index (count array))
;    (do
;        (aset-long array index (.nextLong in))
;        (fill array (inc index) in)
;    )
;    array
;  )
;)


;;; read values from a file into an array 
;;;
;;;   Receive: inFile, a String naming an input file.
;;;   Precondition: the first line of the input file is N,
;;;                  the second line is blank, and
;;;                  the rest of the file contains N integers,
;;;                   one per line.
;;;   Postcondition: the N int values have been read
;;;                   from 'in' and stored in an array.
;;;   Return: an array containing the N values from the file.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn readFile [fileName]
  ; before proceeding, check to make sure fileName exists 
  (assert (.exists (clojure.java.io/file fileName))
            (str "input file '" fileName "' not found"))
   (let
     [
      in (java.util.Scanner. (java.io.File. fileName))
      numNumbers (.nextLong in)       ; read first line
      blankLine (.nextLine in)        ; read blank line
      array (long-array numNumbers 0) ; allocate array of N zeros
     ]

     (fill array in)                  ; fill array with other vals from in
     (.close in)                      ; close Scanner
     array                            ; return the array
    )
)


;;; sum the values in an array sequentially.
;;; 
;;; Receive: anArray, an array containing values to be summed.
;;; Return: the sum of the values in anArray.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn sumArray [anArray]
  (loop
    [
      sum 0
      i   0
    ]

    (if (>= i (count anArray)) ; Basis: i >= aVec.size:
      sum                      ;  return sum (i.e., 0).
                               ; I-Step: i < n:
                               ;  return aVec[i] + sum and recurse(i+1).
      (recur (+ (get anArray i) sum) (inc i))
    )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main method 
;;;
;;; Receive: inFile, a String containing the name of an input file.
;;; Precondition: inFile has N+2 lines, formatted as follows:
;;;                the first line is a positive integer N 
;;;                the second line is a blank line
;;;                the remaining N lines are the values (1 per line).
;;; Output: the sum of the values in inFile
;;;           and the time required to sum them
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main [inFile]
  (let
    [
      anArray    (readFile inFile)        ; read inFile into anArray 
      numValues  (count anArray)          ; determine numValues
      startTime  (System/nanoTime)        ; - start timer
      sum        (sumArray anArray)       ; - sum values sequentially
      stopTime   (System/nanoTime)        ; - stop timer
      totalTime  (- stopTime startTime)   ; - calc. sequential time
    ]
                                          ; output results
    (printf "\nThe sequential sum of the %d numbers is %d;\n"
               numValues sum)
    (printf " summing them with 1 thread took %d time units.\n\n"
               totalTime)
  )
)

