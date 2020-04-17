-- name_tester.adb "test-drives" the Name type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: Jacob Brink
-- Date: 4/10/2020
-- Lab: 8
----------------------------------------------

with Ada.Text_IO; with Name_Package;
use Ada.Text_IO; use Name_Package;

procedure Name_Tester is
   AName : Name_Package.Name;
begin
   Init(AName, "John    ", "Paul    ", "Jones   ");
   
   pragma Assert( GetFirst(AName) = "John    ",
		  "getFirst() failed");
   pragma Assert( GetMiddle(AName) = "Paul    ", 
		  "getMiddle() failed");
   pragma Assert( GetLast(AName) = "Jones   ", 
		  "getLast() failed");
   pragma Assert( GetFullName(AName) = "John     Paul     Jones   ",
		  "getFullName() failed");
   Put(AName); New_Line;
   Put("All tests passed!"); New_Line;
end Name_Tester;
