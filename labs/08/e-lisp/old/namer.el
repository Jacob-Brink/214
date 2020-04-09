;;; namer.cpp implements and tests an e-LISP Name type.
;;; Dr. Adams, CS 214 at Calvin College.
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Name constructs a name from three strings.      ;;
;;; Receive: first, middle and last, three strings. ;;
;;; Return: the triplet (first middle last).        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Name (first middle last)
  (list first middle last))
Name




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; First extracts the first name of a name object. ;;
;;; Receive: theName, a Name.                       ;;
;;; Return: the first string in theName.            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun First (theName)
  (car theName))
First




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Middle extracts the middle name of a name object. ;;
;;; Receive: theName, a Name.                         ;;
;;; Return: the second string in theName.             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Middle (theName)
  (car (cdr theName)))
Middle





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Last extracts the last name of a name object. ;;
;;; Receive: theName, a Name.                     ;;
;;; Return: the third string in theName.          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Last (theName)
  (car (cdr (cdr theName))))
Last




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FullName returns a full name in F-M-L order.  ;;
;;; Return: myFirst, myMiddle, myLast.            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun FullName (theName)
  (concat (First theName) " " (Middle theName) " " (Last theName)))
FullName



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PrintName displays a name object.         ;;
;;; Receive: theName, a Name,                 ;;
;;;          buffer, the name of a buffer.    ;;
;;; Output: the strings in theName to buffer. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun PrintName (theName buffer)
  (princ (First theName) buffer)
  (princ " " buffer)
  (princ (Middle theName) buffer)
  (princ " " buffer)
  (princ (Last theName) buffer)
  theName)
PrintName






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (setq aName (Name "John" "Paul" "Jones"))     ; build a Name
  (setq buf (get-buffer "namer.el"))            ; buf = this buffer
  (PrintName aName buf)                         ; Print a Name
  (terpri buf)                                  ; newline
  (princ (First aName) buf)                     ; print first name
  (terpri buf)                                  ; newline
  (princ (Last aName) buf)                      ; print last name
  (terpri buf)                                  ; newline  
  (princ (FullName aName) buf)                  ; print name as string
  (terpri buf))




















