"max.st tests our extensions to Bag.
 Begun by: Dr. Adams, Fall 1997, CPSC 280 at Calvin College.
 Completed by:
"
     	|list1 list2 list3|

	list1 := #(99 88 77 66 55) asOrderedCollection.
	list2 := #(55 66 77 88 99) asOrderedCollection.
	list3 := #(55 77 99 88 66) asOrderedCollection.

	Transcript cr; nextPutAll: list1 printString;
		cr; nextPutAll: list2 printString;
		cr; nextPutAll: list3 printString.

	Transcript cr;
		nextPutAll: 'The maximum of list1 is ', 
			(list1 max) printString.
	Transcript cr;
		nextPutAll: 'The maximum of list2 is ', 
			(list2 max) printString.
	Transcript cr;
		nextPutAll: 'The maximum of list3 is ', 
			(list3 max) printString.

