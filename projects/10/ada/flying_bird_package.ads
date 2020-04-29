-- flying_bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Bird_Package; use Bird_Package;

package Flying_Bird_Package is
   
   type Flying_Bird_Type is new Bird_Type with private;
   
   function Movement(A_Flyer : in Flying_Bird_Type) return String;

private
   type Flying_Bird_Type is new Bird_Type with
      record
	 null;
      end record;

end Flying_Bird_Package;
