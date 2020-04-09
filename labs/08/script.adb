Script started on 2020-04-09 16:41:40-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ cat name__pakac[K[K[K[K[K[Kpackage.ads
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

]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ cat name_package.adb
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
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ cat name_tester.adb 
-- name_tester.adb "test-drives" the Name type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: Jacob Brink
-- Date: 4/10/2020
-- Lab: 8
----------------------------------------------

with Ada.Text_IO; with Name_Package;
use Ada.Text_IO; use Name_Package;

procedure name_tester is
   aName : Name_Package.Name;
begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ",
                   "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", 
                   "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", 
                   "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ",
                    "getFullName() failed");
   Put(aName); New_line;
   Put("All tests passed!"); New_line;
end name_tester;

]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ make
make: 'name_tester' is up to date.
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ cat MakeFile
cat: MakeFile: No such file or directory
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ cat Makefile 
# Makefile for GNAT (Ada) compilation

TARGET = name_tester
PACKAGE = name_package

CC = gcc
CFLAGS = -c -gnata

# linking step
$(TARGET): $(TARGET).ali $(PACKAGE).o
	gnatbind $(TARGET).ali
	gnatlink $(TARGET).ali

# compile program
$(TARGET).ali: $(TARGET).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(TARGET).adb

# compile package
$(PACKAGE).o: $(PACKAGE).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(PACKAGE).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali *.c

]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ ./name_tester 
John     Paul     Jones   
All tests passed!
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/ada[00m$ exit

Script done on 2020-04-09 16:42:30-0400
