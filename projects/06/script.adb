Script started on 2020-03-20 12:39:28-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ ./arrayprocessing [11@gnatmake arrayprocessing.adb[C[6Pcat arrayprocessing.adb
-- ArrayProcessing.adb "test-drives" function PrintArray and InputArray.
-- Precondition:  given size is positive
-- Output: none
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 3/17/2020
-- Project: 06
-----------------------------------------------

with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure ArrayProcessing is

   -- Declare Vector type
   type Vector is array ( Positive range <>) of Float;
   ArraySize : Positive;
   
----------------------------------------------
-- Printer() prints the values in an array   -
-- Receive: A, an array of numbers     -
-- Return: void                              -
----------------------------------------------
   procedure Printer(A: Vector) is 
   begin 
      for I in A'Range 
      loop 
	 Ada.Float_Text_Io.Put(Item => A(I));
	 New_Line;
      end loop; 
   end Printer;
   
   
----------------------------------------------
-- InputArray() fills given array with input -
-- Receive: A, an array of numbers           -
-- Return: void                              -
----------------------------------------------
   procedure InputArray(A: in out Vector) is 
   begin 
      for I in A'Range 
      loop 
	 Put(I);
	 Put(": ");
	 Ada.Float_Text_Io.Get(Item => A(I));
	 New_Line;
      end loop; 
   end InputArray;

   
   
   
begin
   Put(" enter size of array: ");
   Ada.Integer_Text_Io.Get(Item => ArraySize);
   
   declare
      UserArray : Vector(1..ArraySize);
   begin 
      InputArray(UserArray);
      Printer(UserArray);
   end;
    
   New_line;
end ArrayProcessing;

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ cat arrayprocessing.adb[5P./arrayprocessing [11@gnatmake arrayprocessing.adb[C
x86_64-linux-gnu-gcc-7 -c arrayprocessing.adb
x86_64-linux-gnu-gnatbind-7 -x arrayprocessing.ali
x86_64-linux-gnu-gnatlink-7 arrayprocessing.ali
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ gnatmake arrayprocessing.adb [6Pcat arrayprocessing.adb[5P./arrayprocessing 
 enter size of array: 4
          1: 1

          2: 3

          3: 2

          4: 4

 1.00000E+00
 3.00000E+00
 2.00000E+00
 4.00000E+00

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ exit

Script done on 2020-03-20 12:39:51-0500
