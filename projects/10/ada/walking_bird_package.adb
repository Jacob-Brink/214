-- walking_bird_package.adb defines Walking_Bird_Type methods
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------


package body Walking_Bird_Package is

   ----------------------------------------------------
   -- A Walking Bird's movement                        -
   -- Receive: A_Bird, a Walking_Bird_Type             -
   -- Output: Movement Description                    -
   ----------------------------------------------------
   function Movement(A_Walker : in Walking_Bird_Type) return String is
   begin
      return "walked";
   end Movement;

end Walking_Bird_Package;
