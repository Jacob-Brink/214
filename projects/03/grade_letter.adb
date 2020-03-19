-- grade_letter.adb computes the letter grade
--
-- Input: average grade
-- Precondition: average grade is between 0 and 100
-- Output: letter grade
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 2/26/2020
-- Project: 3
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure Grade_Letter is
   
   -- function getLetter computes the letter grade corresponding to the given average grade
   -- Parameter: average grade, an integer
   -- Precondition: 100 >= avgGrade >= 0
   -- Return: corresponding letter grade
   ----------------------------------------------------
   function GetLetter(AvgGrade: in Integer) return String is 
      SimpleGrade : Integer := AvgGrade / 10;
   begin
      case SimpleGrade is
	 when 9..10 => return "A";
	 when 8 => return "B";
	 when 7 => return "C";
	 when 6 => return "D";
	 when others => return "F";
      end case;
      
   end GetLetter;
   
   -- function testGetLetter
   -- Parameter: average grade, an integer and expected value
   -- Precondition: none
   -- Return: none
   ----------------------------------------------------
   procedure TestGetLetter(AvgGrade: in Integer; ExpectedLetter: in String) is 
   begin
      Put("Testing GetLetter(");
      Put(AvgGrade'Image);
      Put(" ) = ");
      Put(ExpectedLetter);
      if GetLetter(AvgGrade) = ExpectedLetter then
	 Put(" Passed!");
      else
	 Put("Failed!");
      end if;
      New_Line;
      
   end TestGetLetter;
   
   
   
begin                           
   New_Line;
   Put("Testing GetLetter method...");
   
   New_Line;
   TestGetLetter(100, "A");
   TestGetLetter(95, "A");
   TestGetLetter(90, "A");
   TestGetLetter(85, "B");
   TestGetLetter(80, "B");
   TestGetLetter(75, "C");
   TestGetLetter(70, "C");
   TestGetLetter(65, "D");
   TestGetLetter(60, "D");
   TestGetLetter(59, "F");
end Grade_Letter;
