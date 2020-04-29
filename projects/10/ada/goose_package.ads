-- goose_package.ads gives Goose-related declarations,
--
--  and derives Goose from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Flying_Bird_Package; use Flying_Bird_Package;

package Goose_Package is

 type Goose_Type is new Flying_Bird_Type with private;


 ----------------------------------------------------
 -- A Goose's Call (Over-rides Bird.Call())         -
 -- Receive: A_Goose, a Goose.                      -
 -- Return: "Honk!"                                 -
 ----------------------------------------------------
function  Call(A_Goose : in Goose_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Goose                        -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: A_Goose, a Goose.                       -
 -- Return: "Goose".                                 -
 -----------------------------------------------------
function  Type_Name(A_Goose : in Goose_Type) return String;

private
type Goose_Type is new Flying_Bird_Type with
          record
            null;
          end record;

end Goose_Package;
