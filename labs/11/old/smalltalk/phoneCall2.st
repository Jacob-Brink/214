"phoneCall.st simulates a phone call, demonstrating process synchronization.
  Dr. Adams, CS 214 at Calvin College.
"

| kelly chris |

Transcript clear.

kelly :=
  [
    Transcript cr; show: 'Hello, can I speak to Chris?'.
    Transcript cr; show: 'Chris, this is Kelly from the ACME company';
               cr; show: ' and we are having a special on ...'.
    Transcript cr; show: 'But this is a great deal and ...'.
  ] newProcess. 

chris :=
  [ 
    Transcript cr; show: 'Hello?'.
    Transcript cr; show: 'This is Chris.'.
    Transcript cr; show: 'Excuse me, but I am really not interested.';
               cr; show: 'Please do not call me again.'.
    Transcript cr; show: 'I am hanging up now;';
               cr; show: ' goodbye.'.
  ] newProcess.

chris resume.

