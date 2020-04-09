-- name_package.adb defines operations for the Name type.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/10/2020
-- Lab: 8
---------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

package body Name_Package is

   
   
  ----------------------------------------------
  -- Init initializes a Name variable          
  -- Receive: TheName , the Name variable;          
  --          First, the first name;         
  --          Middle, the middle name;      
  --          Last, the last name.         
  -- Return: TheName , its fields set to First, 
  --               Middle, and Last.     
  ----------------------------------------------

  procedure Init(TheName : out Name;
                 First, Middle, Last : in String) is
  begin
    TheName .MyFirst := First;
    TheName .MyMiddle := Middle;
    TheName .MyLast := Last;
  end Init;

  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        
  -- Receive: TheName , a Name.                      
  -- PRE: TheName  has been initialized.            
  -- Return: TheName .myFirst.                     
  ----------------------------------------------
  function getFirst( TheName : in Name) return String is
  begin
    return TheName .MyFirst;
  end getFirst;

  ----------------------------------------------
  -- getMiddle(Name) retrieves Name as a String 
  -- Receive: TheName , a Name.        
  -- PRE: TheName  has been initialized.
  -- Return: TheName .myMiddle. 
  ----------------------------------------------
  function getMiddle( TheName : in Name) return String is
  begin
     return TheName .MyMiddle;
  end getMiddle;

  ----------------------------------------------
  -- getLast(Name) retrieves Name.myLast       
  -- Receive: TheName , a Name.                    
  -- PRE: TheName  has been initialized.            
  -- Return: TheName .myLast.                        
  ----------------------------------------------
  function getLast( TheName : in Name) return String is
  begin
     return TheName .MyLast;
  end getLast;

  ----------------------------------------------
  -- getFullName(Name) retrieves Name as a String -
  -- Receive: TheName , a Name.                      -
  -- PRE: TheName  has been initialized.             -
  -- Return: a String representation of TheName .    -
  ----------------------------------------------
  function getFullName( TheName : in Name) return String is
  begin
    return TheName .MyFirst & " "
           & TheName .MyMiddle & " "
           & TheName .MyLast;
  end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: TheName  has been initialized.             -
  -- Receive: TheName , a Name.                      -
  -- Output: TheName , to the screen.                -
  ----------------------------------------------
  procedure Put(TheName : in Name) is
  begin
    Put( getFullName(TheName ) );
  end Put;

   
end Name_Package;
