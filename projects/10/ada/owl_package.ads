-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Flying_Bird.
--
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Flying_Bird_Package; use Flying_Bird_Package;

package Owl_Package is
   
   type Owl_Type is new Flying_Bird_Type with private;

   ----------------------------------------------------
   -- A Owl's Call (Over-rides Flying_Bird.Call())           -
   -- Receive: An_Owl, an Owl_Type.                   -
   -- Return: "Whoo!"                                 -
   ----------------------------------------------------
   function Call(An_Owl : in Owl_Type) return String;

   -----------------------------------------------------
   -- Determine type of a Owl                          -
   -- (Over-rides Flying_Bird.Type_Name())                    -
   -- Receive: An_Owl, an Owl_Type.                    -
   -- Return: "Owl".                                   -
   -----------------------------------------------------
   function Type_Name(An_Owl : in Owl_Type) return String;
private
   type Owl_Type is new Flying_Bird_Type with
      record
	 null;
      end record;


end Owl_Package;
