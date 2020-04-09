"namer.sm is a 'program' to test class Name.
 Dr. Adams, CS 214 at Calvin College."
  |aName|

  aName := Name new first: 'John' middle: 'Paul' last: 'Jones'.
  Transcript cr.
  aName printOn: Transcript.
  Transcript cr.
  aName first printOn: Transcript.
  Transcript cr.
  aName last printOn: Transcript.
  Transcript cr; 
             nextPutAll: (aName asString).
