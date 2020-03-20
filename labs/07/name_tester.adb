-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by:
-- Date:
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is

  -- replace this line with the definition of NAME_SIZE

  -- replace this line with the definition of Name

--  aName : Name ;


  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  -- replace this line with the definition of Init()


  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  -- replace this line with the definition of getFirst()


  -- replace this line with the doc and def of getMiddle()


  -- replace this line with the doc and def of getLast()


  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  -- replace this line with the definition of getFullName()

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  -- replace this line with the definition of Put()


begin
--   Init(aName, "John    ", "Paul    ", "Jones   ");

--   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
--   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
--   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
--   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
--                    "getFullName() failed");

--   Put(aName); New_line;
   Put("All tests passed!"); New_line;

end name_tester;

