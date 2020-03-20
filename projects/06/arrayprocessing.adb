-- ArrayProcessing.adb "test-drives" function PrintArray and InputArray.
-- Precondition:  given size is nonnegative
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

