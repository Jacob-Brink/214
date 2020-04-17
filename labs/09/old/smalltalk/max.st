"max.sm tests our extensions to OrderedCollection.
 Begun by: Dr. Adams, for CS 214 at Calvin College.
 Completed by:
"
   |list1 list2 list3|

   list1 := #(99 88 77 66 55) asOrderedCollection.
   list2 := #(55 66 77 88 99) asOrderedCollection.
   list3 := #(55 77 99 88 66) asOrderedCollection.

   Transcript clear;
              cr; show: list1 printString;
              cr; show: list2 printString;
              cr; show: list3 printString.

   Transcript
              cr; show: 'The maximum of list1 is ', list1 max printString;
              cr; show: 'The maximum of list2 is ', list2 max printString;
              cr; show: 'The maximum of list3 is ', list3 max printString.

