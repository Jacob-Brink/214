! listModule.f90 defines a linked list in Fortran90
! Begun by: Dr. Adams, CS 214 at Calvin College.
! Completed by:

MODULE ListModule
  IMPLICIT NONE

  PUBLIC :: List, Init, Empty, Length, Append, PrintList, Max

  ! nodes for storing list values (not exported)
  TYPE ListNode
     PRIVATE
     INTEGER :: itsValue
     TYPE(ListNode), POINTER :: itsNext
  END TYPE ListNode

  ! the list-type itself (exported)


CONTAINS

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! Initialize a list                                !
  ! Receive: aList, a List.                          !
  ! Pre: aList is uninitialized.                     !
  ! Post: aList%itsFirst == aList%itsLast == NULL && !
  !        aList%itsLength == 0.                     !
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  SUBROUTINE Init(aList)
    IMPLICIT NONE
    TYPE(LIST), INTENT(OUT) :: aList

    NULLIFY(aList%itsFirst, aList%itsLast)
    aList%itsLength = 0
  END SUBROUTINE Init
     
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! Is a list empty?                            !
  ! Receive: aList, a List.                     !
  ! Return: true, iff aList contains no values. !
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  FUNCTION Empty(aList) RESULT (answer)
    IMPLICIT NONE
    TYPE(LIST), INTENT(IN) :: aList
    LOGICAL answer

    answer = (aList%itsLength == 0)
  END FUNCTION Empty

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! How many values are in a list?   !
  ! Receive: aList, a List.          !
  ! Return: aList%itsLength.         !
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  FUNCTION Length(aList) RESULT(answer)
    IMPLICIT NONE
    TYPE(LIST), INTENT(IN) :: aList
    INTEGER :: answer

    answer = aList%itsLength
  END FUNCTION Length

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! Append a value to a list.           !
  ! Receive: aValue, an integer,        !
  ! Passback: aList, containing aValue. !
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  SUBROUTINE Append(aValue, aList)
    IMPLICIT NONE
    INTEGER, INTENT(IN) :: aValue
    TYPE(LIST), INTENT(INOUT) :: aList

    TYPE(ListNode), POINTER:: tempPtr
    ALLOCATE(tempPtr)
    tempPtr%itsValue = aValue
    NULLIFY(tempPtr%itsNext)

    IF (aList%itsLength == 0) THEN
       aList%itsFirst => tempPtr
    ELSE
       aList%itsLast%itsNext => tempPtr
    END IF

    aList%itsLast => tempPtr

    aList%itsLength = aList%itsLength + 1
  END SUBROUTINE Append


  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! Display the values in a list.    !
  ! Receive: aList, a List.          !
  ! Output: the values in aList.     !
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! Find the maximum value in a list.  !
  ! Receive: aList, a List.            !
  ! Return: the maximum value in aList.!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


END MODULE
