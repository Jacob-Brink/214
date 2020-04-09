! namer.f90 implements and tests a Fortran-90 Name type.
! Dr. Adams, CS 214 at Calvin College.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! A simple driver for our Name functions. !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PROGRAM Namer
   IMPLICIT NONE

   INTEGER, PARAMETER :: NAME_SIZE = 12

   TYPE Name
      CHARACTER(NAME_SIZE) :: myFirst, myMiddle, myLast
   END TYPE 

   TYPE(Name) :: aName

   CALL Init(aName, "John", "Paul", "Jones")
   CALL PrintName(aName)
   PRINT*, First(aName)
   PRINT*, Last(aName)
   PRINT*, FullName(aName)

CONTAINS

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Init constructs a Name from three strings.      !
! Receive: theName, a Name;                       !
!          first, middle and last, three strings. !
! Return: the triplet (first middle last).        !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE Init (theName, first, middle, last)
   IMPLICIT NONE
   TYPE(Name), INTENT(OUT) :: theName
   CHARACTER(*), INTENT(IN) :: first, middle, last

   theName%myFirst = first
   theName%myMiddle = middle
   theName%myLast = last
END SUBROUTINE



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PrintName displays a name object on the screen. !
! Receive: theName, a Name,                       !
! Output: the strings in theName.                 !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE PrintName(theName)
   IMPLICIT NONE
   TYPE(Name), INTENT(IN) :: theName
   PRINT*, theName%myFirst, ' ', theName%myMiddle, ' ', theName%myLast
END SUBROUTINE

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! First extracts the first name of a Name object. !
! Receive: theName, a Name.                       !
! Return: the first string in theName.            !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FUNCTION First(theName)
   IMPLICIT NONE
   CHARACTER(NAME_SIZE) :: First
   TYPE(Name), INTENT(IN) :: theName

   First = theName%myFirst
END FUNCTION


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! !
! Middle extracts the middle name of a name object. !
! Receive: theName, a Name.                         !
! Return: the second string in theName.             !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FUNCTION Middle(theName)
   IMPLICIT NONE
   CHARACTER(NAME_SIZE) :: Middle
   TYPE(Name), INTENT(IN) :: theName

   Middle = theName%myMiddle
END FUNCTION


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Last extracts the last name of a name object. !
! Receive: theName, a Name.                     !
! Return: the third string in theName.          !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FUNCTION Last(theName)
   IMPLICIT NONE
   TYPE(Name), INTENT(IN) :: theName
   CHARACTER(NAME_SIZE) :: Last

   Last = theName%myLast
END FUNCTION


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! FullName returns a full name in F-M-L order.  ;
! Return: myFirst, myMiddle, myLast.            ;
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FUNCTION FullName(theName)
   IMPLICIT NONE
   TYPE(Name), INTENT(IN) :: theName
   CHARACTER(3*NAME_SIZE) :: FullName

   FullName = theName%myFirst // ' ' // theName%myMiddle // ' ' // theName%myLast
END FUNCTION

END PROGRAM



