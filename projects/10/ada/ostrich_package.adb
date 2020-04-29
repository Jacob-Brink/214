-- ostrich_package.adb gives Ostrich-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Ostrich_Package is

   ----------------------------------------------------
   -- A Ostrich's Call (Over-rides Bird.Call())          -
   -- Receive: A_Ostrich, a Ostrich_Type.                   -
   -- Return: "Quack!"                                -
   ----------------------------------------------------
   function Call(A_Ostrich : in Ostrich_Type) return String is
   begin
      return "*Ostrich Noises*";
   end Call;

   ------------------------------------------------------------
   -- Determine type of a Ostrich (Over-rides Bird.Type_Name()) -
   -- Receive: A_Ostrich, a Ostrich_Type.                          -
   -- Return: "Ostrich".                                        -
   -----------------------------------------------------------
   function Type_Name(A_Ostrich : in Ostrich_Type) return String is
   begin
      return "Ostrich";
   end Type_Name;

end Ostrich_Package;
