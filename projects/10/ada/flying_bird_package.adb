-- flying_bird_package.adb defines Flying_Bird_Type methods
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------


package body Flying_Bird_Package is

   ----------------------------------------------------
   -- A Flying Bird's movement                        -
   -- Receive: A_Bird, a Flying_Bird_Type             -
   -- Output: Movement Description                    -
   ----------------------------------------------------
   function Movement(A_Flyer : in Flying_Bird_Type) return String is
   begin
      return "flew";
   end Movement;

end Flying_Bird_Package;
