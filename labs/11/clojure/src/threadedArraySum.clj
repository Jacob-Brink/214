;;;; threadedarraysum.clj sums the integers in a file using an array.
;;;;
;;;; Usage: clojure -m threadedarraysum <inputFileName> 
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
;;;; Completed by: Jacob Brink
;;;; Date: 5/4/2020
;;;; Lab: 11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns threadedArraySum
  (:require [clojure.core.async            ; need this clause to use async
             :refer [chan go put! take! <! >! <!! >!!] 
             ] 
            ) 
  )

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





;;; calcPartialSum():
;;; - sum a 'slice' of an array given start and stop indices.
;;; 
;;; Receive: anArray, an array containing values to be summed;
;;;          start, a long containing the starting index;
;;;          stop, a long containing the stopping index.
;;; Return: the sum of anArray[start] .. anArray[stop-1] (inclusive).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn calcPartialSum [anArray start stop]
(loop
    [                           ; initially:
      partialSum 0              ;  partialSum = 0
      i          start          ;  i = start
    ]
    (if (>= i stop)             ; Basis: i >= stop:
      partialSum                ;  return partialSum
                                ; I-step:
                                ;  return loop(partialSum + a[i], ++i)
      (recur (+ partialSum (get anArray i)) (inc i))
    )
  )
)

;;; sum a 'slice' of an array based on thread ID and numThreads
;;;
;;; Receive: anArray, the array of ints to be summed;
;;;          id, the ID of the current thread;
;;;          numThreads, how many workers we have;
;;;          channel, the channel to write its slice-sum to.
;;; Postcondition: the sum of the values in this thread's slice
;;;           of anArray have been put into channel.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
(defn sumSlice [anArray id numThreads channel]
  (let
    [ arraySize   (count anArray)              ; determine array size
      sliceSize   (quot arraySize numThreads)  ; calculate slice size
      start       (* id sliceSize)             ; calc. starting index
      stop        (if (< id (- numThreads 1))  ; calc. stopping index
                     (+ start sliceSize)       ; - all but last thread
                     arraySize                 ; - last thread
                  )
                                               ; calc. sum of my slice
      partialSum  (calcPartialSum anArray start stop)
    ]

    ; write partial sum to channel
    (put! channel partialSum)
  )
  )



;;; sum the values in an array sequentially.
;;; 
;;; Receive: anArray, an array containing values to be summed.
;;; Return: the sum of the values in anArray.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn sumArray [anArray  numThreads]
  (let
      [ resChannel (chan) ]        ; define shared channel for results

    (loop [id 1]                 ; loop to fork threads,
      (when (< id numThreads)    ;  each writing its partial-sum 
        (go                      ;  to the channel
          (sumSlice anArray id numThreads resChannel)
          )
        (recur (inc id))
        )
      )
                                        ; main thread does slice 0
    (sumSlice anArray 0 numThreads resChannel)
                                        ; loop to read each partial-sum
    (loop [ sum 0                ;  from resChannel and add it to sum
           id  0]               ;  
      (if (>= id numThreads)     ; Basis: id >= numThreads:
        sum                      ;  return sum
                                        ; I-Step: 
                                        ;  return sum + next resChannel val
                                        ;          and recurse (id+1)
        (recur (+ sum (<!! resChannel)) (inc id)) 
        )
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
(defn -main [inFile numThreadsStr]
  (let
      [
       anArray    (readFile inFile)        ; read inFile into anArray 
       numValues  (count anArray)          ; determine numValues
       numThreads   (read-string numThreadsStr)  ; numThreadsStr -> integer
       
       startTime  (System/nanoTime)        ; - start timer
       sum        (sumArray anArray numThreads)       ; - sum values sequentially
       stopTime   (System/nanoTime)        ; - stop timer
       totalTime  (- stopTime startTime)   ; - calc. sequential time
       ]
                                        ; output results
    (printf "\nThe *parallel* sum of the %d numbers is %d;\n"
            numValues sum)
    (printf " summing them with %d thread(s) took %d time units.\n\n"
            numThreads totalTime)
    )
  )

