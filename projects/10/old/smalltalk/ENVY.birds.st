"birds.st tests a few bird-related classes,
  and illustrates derivation and polymorphism.
Dr. Adams, CPSC 280, Fall 1997 at Calvin College.
"

|aBird aDuck aGoose anOwl|

aBird := Bird new name: 'Hawkeye'.
Transcript cr; nextPutAll: aBird printString.

aDuck := Duck new name: 'Donald'.
Transcript cr; nextPutAll: aDuck printString.

aGoose := Goose new name: 'Mother Goose'.
Transcript cr; nextPutAll: aGoose printString.

anOwl := Owl new name: 'Woodsey'.
Transcript cr; nextPutAll: anOwl printString.

