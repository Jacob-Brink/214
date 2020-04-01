Script started on 2020-03-20 13:53:06-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ cat name_tester.adb
-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 3/20/2020
-- Lab: 07
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is

  NAME_SIZE : constant Natural := 8;

  type Name is
     record
	MyFirst, MyMiddle, MyLast : String(1..NAME_SIZE);
     end record;

  aName : Name ;


  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  procedure Init (TheName : out Name; First, Middle, Last : in String) is
  begin
     TheName.MyFirst := First;
     TheName.MyMiddle := Middle;
     TheName.MyLast := Last;
  end Init;
  


  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  function getFirst(TheName : in Name) return String is
  begin
     return TheName.MyFirst;
  end getFirst;


  ----------------------------------------------
  -- getMiddle(Name) retrieves Name.myMiddle        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myMiddle.                  -
  ----------------------------------------------

  function getMiddle(TheName : in Name) return String is
  begin
     return TheName.MyMiddle;
  end getMiddle;


  ----------------------------------------------
  -- getLast(Name) retrieves Name.myLast        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myLast.                  -
  ----------------------------------------------

  function getLast(TheName : in Name) return String is
  begin
     return TheName.MyLast;
  end getLast;


  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  function getFullName(TheName : in Name) return String is
  begin
     return TheName.MyFirst & ' ' & TheName.MyMiddle & ' ' & TheName.MyLast;
  end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  procedure Put(Thename : in Name) is
  begin
     Put(getFullName(TheName));
  end Put;
    


begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");

   Put(aName); New_line;
   Put("All tests passed!"); New_line;

end name_tester;

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ gnatmake name_tester.adb 
gnatmake: "name_tester" up to date.
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ ./name_tester 
John     Paul     Jones   
All tests passed!
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ exit

Script done on 2020-03-20 13:53:50-0500
