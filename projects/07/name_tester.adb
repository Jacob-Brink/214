-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/8/2020
-- Project: 07
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
  -- setFirst(Name) set Name.myFirst           -
  -- Receive: theName, a Name; First, a String -
  -- PRE: theName has been initialized.        -
  -- Return: NONE.                             -
  ----------------------------------------------

  procedure setFirst(TheName : out Name; First : String) is
  begin
     TheName.MyFirst := First;
  end setFirst;

  
  
  ----------------------------------------------
  -- setMiddle(Name) set Name.myMiddle           -
  -- Receive: theName, a Name; Middle, a String -
  -- PRE: theName has been initialized.        -
  -- Return: NONE.                             -
  ----------------------------------------------

  procedure setMiddle(TheName : out Name; Middle : String) is
  begin
     TheName.MyMiddle := Middle;
  end SetMiddle;
  
  
  ----------------------------------------------
  -- setLast(Name) set Name.myLast           -
  -- Receive: theName, a Name; Last, a String -
  -- PRE: theName has been initialized.        -
  -- Return: NONE.                             -
  ----------------------------------------------

  procedure setLast(TheName : out Name; Last : String) is
  begin
     TheName.MyLast := Last;
  end SetLast;
    
  --------------------------------------------
  -- getLfmi(Name) formats name              -
  -- Receive: theName, a Name.               -
  -- PRE: theName has been initialized.      -
  -- Return: theName.myLfmi.                 -
  --------------------------------------------

  function getLfmi(TheName : in Name) return String is
     MiddleInitial : String := TheName.MyMiddle(TheName.MyMiddle'First..TheName.MyMiddle'First);
  begin
     return TheName.MyLast & ", " & TheName.MyFirst & ' ' & MiddleInitial & '.';
  end getLfmi;
  
  
  
  
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
    
  ----------------------------------------------
  -- readName(Name) builds Name from user input-
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, populated with user data -
  ----------------------------------------------

  procedure readName(Thename : in out Name) is
     First, Middle, Last : String(1..NAME_SIZE) := "        ";
     NameSize : Natural := NAME_SIZE; -- for some reason Get_Line cannot use constants for string length
  begin
     Put("Enter First Name: ");
     Get_Line(First, NameSize);
     
     Put("Enter Middle Name: ");
     Get_Line(Middle, NameSize);
     
     Put("Enter Last Name: ");
     Get_Line(Last, NameSize);
     
     setFirst(TheName, First);
     setMiddle(TheName, Middle);
     setLast(TheName, Last);
     
  end readName;
  
  

begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");
   
   
   -- MUTATOR TEST
   Put("Testing Mutator Methods..."); New_Line;
   setFirst(aName, "Jacob   ");
   pragma Assert( getFirst(aName) = "Jacob   ", "setFirst() failed" );
   
   setMiddle(aName, "Jingle  ");
   pragma Assert( getMiddle(aName) = "Jingle  ", "setMiddle() failed" );
   
   setLast(aName, "Hymer   ");
   pragma Assert( getLast(aName) = "Hymer   ", "setLast() failed" );
   
   
   -- LFMI TEST
   New_Line;
   Put("Testing LFMI Method"); New_Line;
   Put(getLfmi(aName)); New_Line;
   
   pragma Assert( GetLfmi(aName) = "Hymer   , Jacob    J." );
   
   
   -- READ TEST
   New_Line;
   readName(aName); New_Line;
   Put("Check that the following name matches what you entered"); New_Line;
   
   Put(aName); New_line;
   
   
   New_Line;
   Put("All tests passed!"); New_line;

end name_tester;

