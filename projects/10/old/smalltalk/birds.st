"birds.st tests a few bird-related classes,
  and illustrates derivation and polymorphism.
Dr. Adams, CS 214 at Calvin College.
"

|aBird aDuck aGoose anOwl|

aBird := Bird new name: 'Hawkeye'.
Transcript cr; show: aBird printString.

aDuck := Duck new name: 'Donald'.
Transcript cr; show: aDuck printString.

aGoose := Goose new name: 'Mother Goose'.
Transcript cr; show: aGoose printString.

anOwl := Owl new name: 'Woodsey'.
Transcript cr; show: anOwl printString.

