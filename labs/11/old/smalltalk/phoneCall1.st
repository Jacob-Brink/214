"phoneCall.st simulates a phone call, demonstrating process synchronization.
  Dr. Adams, CS 214 at Calvin College.
"

| kellySem chrisSem kellyProc chrisProc |

Transcript clear.
kellyProc := 
    [
      Transcript cr; show: 'Hello, can I speak to Chris?'.
      Transcript cr; show: 'Chris, this is Kelly from the ACME company';
                 cr; show: ' and we are having a special on ...'.
      Transcript cr; show: 'But this is a great deal and ...'.
    ].

chrisProc := 
    [
      Transcript cr; show: 'Hello?'.
      Transcript cr; show: 'This is Chris.'.
      Transcript cr; show: 'Excuse me, but I am really not interested.';
                 cr; show: 'Please do not call me again.'.
      Transcript cr; show: 'I am hanging up now;';
                 cr; show: ' goodbye.'.
    ].

kellyProc fork.
chrisProc fork.


