-- name_package.ads declares the Name_Package type and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/10/2020
-- Lab: 8
--------------------------------------------------------------


package Name_Package is 
   
  type Name is private;
   
  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  procedure Init (TheName : out Name; First, Middle, Last : in String);
  
  
  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  procedure Put(Thename : in Name);
  
  
  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst     -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  function getFirst(TheName : in Name) return String;


  ----------------------------------------------
  -- getMiddle(Name) retrieves Name.myMiddle   -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myMiddle.                 -
  ----------------------------------------------

  function getMiddle(TheName : in Name) return String;


  ----------------------------------------------
  -- getLast(Name) retrieves Name.myLast       -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myLast.                   -
  ----------------------------------------------

  function getLast(TheName : in Name) return String;


  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String 
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  function getFullName(TheName : in Name) return String;
  
  
  private
   
  NAME_SIZE : constant Positive := 8;
  
  
  type Name is
      record
         myFirst,
         myMiddle,
         MyLast : String(1..NAME_SIZE);
      end record;
   
end Name_Package;

