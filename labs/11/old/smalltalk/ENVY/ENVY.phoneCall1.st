"phoneCall.st simulates a phone call, demonstrating process synchronization.
  Dr. Adams, CPSC 280, Fall 1997 at Calvin College.
"

| kellySem chrisSem kellyProc chrisProc |


kellyProc := [	Transcript cr; nextPutAll: 'Hello, can I speak to Chris?'.
		Transcript cr; nextPutAll: 'Chris, this is Kelly from the ACME company';
			   cr; nextPutAll: ' and we are having a special on ...'.
		Transcript cr; nextPutAll: 'But this is a great deal and ...'.
	 ].

chrisProc := [	Transcript cr; nextPutAll: 'Hello?'.
		Transcript cr; nextPutAll: 'This is Chris.'.
		Transcript cr; nextPutAll: 'Excuse me, but I am really not interested.';
			cr; nextPutAll: 'Please do not call me again.'.
		Transcript cr; nextPutAll: 'I am hanging up now.';
			cr; nextPutAll: 'Goodbye.'.
	 ].

kellyProc fork.
chrisProc fork.

