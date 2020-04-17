! max.f90 finds the max of a list of integers.
! Dr. Adams, for CS 214 at Calvin College.

PROGRAM maxInt
  USE ListModule              ! List, Init, Append, ...
  IMPLICIT NONE
                              ! define 3 lists
  TYPE(List) :: list1, list2, list3

  CALL Init(list1)            ! initialize them
  CALL Init(list2)
  CALL Init(list3)

  CALL Append(99, list1)      ! 99, 88, 77, 66, 55
  CALL Append(88, list1)      ! max is first
  CALL Append(77, list1)
  CALL Append(66, list1)
  CALL Append(55, list1)

  CALL Append(55, list2)      ! 55, 66, 77, 88, 99
  CALL Append(66, list2)      ! max is last
  CALL Append(77, list2)
  CALL Append(88, list2)
  CALL Append(99, list2)

  CALL Append(55, list3)      ! 55, 77, 99, 88, 66
  CALL Append(77, list3)      ! max is in the middle
  CALL Append(99, list3)
  CALL Append(88, list3)
  CALL Append(66, list3)

  CALL PrintList(list1)       ! output the 3 lists
  PRINT*
  CALL PrintList(list2)
  PRINT*
  CALL PrintList(list3)
  PRINT*
                               ! display their maxima
  PRINT*, 'The maximum value in list 1 is', Max(list1)
  PRINT*, 'The maximum value in list 2 is', Max(list2)
  PRINT*, 'The maximum value in list 3 is', Max(list3)

END PROGRAM
