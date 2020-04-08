-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Student: Jacob Brink
-- Date: 2/21/2020
-- Lab: 03
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure year_codes is

   year : String(1..9) := "         ";
   charsRead : Natural;
   
   
   -- function yearCode computes the integer that represents the given school year
   -- Parameter: year, a string
   -- Precondition: year is string
   -- Return: 1-4 for freshman, sophomore, junior, senior respectively, 0 for anything else
   ----------------------------------------------------
   function yearCode (Year : string) return integer is
   begin
      
      if Year = "freshman " then
	 return 1;
      elsif ( Year = "sophomore" ) then
	 return 2;
      elsif ( Year = "junior   " ) then
	 return 3;
      elsif (Year = "senior   " ) then
	 return 4;
      else
	 return 0;
      end if;
	 
   end YearCode;
     

begin                                          
   Put("Enter your academic year: ");           -- Prompt for input
   Get_Line(year, charsRead);                   -- Input
   Put( yearCode(year) );                       -- Convert and output
   New_Line;
end year_codes;

