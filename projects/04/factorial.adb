-- log_table.adb computes a table of logarithms.
--
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Project: 04
-- Date: 2/28/2020
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure factorial is

   User_Integer : Natural;
   
   function FactorialFunction(Number : Natural) return Natural is
      Counter : Natural := 1;
      Answer : Natural := 1;
   begin
      for Counter in 2..Number
      loop
	 Answer := Answer*Counter;
      end loop;
      return Answer;
   end FactorialFunction;
   
   
begin                                           -- Prompt for input
   Put_Line("Enter a number: ");
   User_Integer := Integer'Value(Get_Line);
   Put(Natural'Image(FactorialFunction(User_Integer)));

end factorial;

