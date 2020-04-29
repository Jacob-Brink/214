Script started on 2020-04-29 15:50:21-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ada[00m$ cat *Ad[K[K.adb
-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/24/2020
-- Lab: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is


   ----------------------------------------------------
   -- initialization                                  -
   -- Receive: A_Bird, a Bird_Type;                   -
   --          Name, a String                         -
   -- Return: a Bird_Type in which My_Name = Name.    -
   ----------------------------------------------------
   procedure Init(A_Bird : out Bird_Type; Name : in String) is
   begin
      A_Bird.My_Name := Name;
   end Init;
   
   ----------------------------------------------------
   -- Name accessor                                   -
   -- Receive: A_Bird, a Bird_Type.                   -
   -- Return: A_Bird.My_Name.                         -
   ----------------------------------------------------
   function Name(A_Bird : in Bird_Type) return String is
   begin
      return A_Bird.My_Name;
   end Name;
   
   -- A Bird's Call                                   -
   -- Receive: A_Bird, a Bird_Type.                   -
   -- Return: a default bird-call ("Squawk!").        -
   ----------------------------------------------------
   function Call(A_Bird : in Bird_Type) return String is
   begin
      return "Squawwwwwwk!";
   end Call;

   ----------------------------------------------------
   -- Determine type of a Bird (for derived types)    -
   -- Receive: A_Bird, a Bird_Type.                   -
   -- Return: "Bird".                                 -
   ----------------------------------------------------
   function Type_Name(A_Bird : in Bird_Type) return String is
   begin
      return "Bird";
   end Type_Name;
   
   ----------------------------------------------------
   -- A Bird's movement                               -
   -- Receive: A_Bird, a Bird_Type                    -
   -- Output: Movement Description                    -
   ----------------------------------------------------
   function Movement(A_Bird : in Bird_Type) return String is
   begin
      return "Movement not specified";
   end Movement;
   
   ----------------------------------------------------
   -- Output a Bird                                   -
   -- Receive: A_Bird, a Bird or subclass of Bird.    -
   -- Output: Everything known about A_Bird           -
   ----------------------------------------------------
   procedure Put(A_Bird : in Bird_Type'Class) is
   begin
      Put( Name(A_Bird) );
      Put( ' ' );
      Put( Type_Name(A_Bird) );
      Put( " just " );
      Put( Movement(A_Bird) );
      Put(" past and said, """);
      Put( Call(A_Bird) );
      Put(" "" ");
   end Put; 
end Bird_Package;

-- birds.adb tests our Birds type hierarchy.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Bird_Package, 
  Duck_Package, 
  Goose_Package, 
  Owl_Package,
  Ostrich_Package,
  Penguin_Package,
  Kiwi_Package,
  Ada.Text_IO;
use Bird_Package,
  Duck_Package, 
  Goose_Package,
  Owl_Package,
  Ostrich_Package,
  Penguin_Package,
  Kiwi_Package,
  Ada.Text_IO;


procedure Birds is

   Bird1 : Bird_Type;       -- base class
   Bird2 : Duck_Type;       -- derived class 1
   Bird3 : Goose_Type;      -- derived class 2
   Bird4 : Owl_Type;        -- derived class 3
   
   Bird5 : Ostrich_Type;     -- derived class 4
   Bird6 : Penguin_Type;     -- derived class 5
   Bird7 : Kiwi_Type;      -- derived class 6

begin
   Put("Welcome to the Bird Park!"); New_Line;
   Init(Bird1, "Tweety");
   Put(Bird1); New_Line;

   Init(Bird2, "Donald");
   Put(Bird2); New_Line;

   Init(Bird3, "Mother");
   Put(Bird3); New_Line;

   Init(Bird4, "Woodsy");
   Put(Bird4); New_Line;
   
   Init(Bird5, "Jacobb");
   Put(Bird5); New_Line;
   
   Init(Bird6, "123456");
   Put(Bird6); New_Line;
   
   Init(Bird7, "Brinki");
   Put(Bird7); New_Line;
   
    
   New_Line;
end Birds;

-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Duck_Package is

   ----------------------------------------------------
   -- A Duck's Call (Over-rides Bird.Call())          -
   -- Receive: A_Duck, a Duck_Type.                   -
   -- Return: "Quack!"                                -
   ----------------------------------------------------
   function Call(A_Duck : in Duck_Type) return String is
   begin
      return "Quack!";
   end Call;

   ------------------------------------------------------------
   -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
   -- Receive: A_Duck, a Duck_Type.                          -
   -- Return: "Duck".                                        -
   -----------------------------------------------------------
   function Type_Name(A_Duck : in Duck_Type) return String is
   begin
      return "Duck";
   end Type_Name;

end Duck_Package;
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
-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

package body Goose_Package is

   ----------------------------------------------------
   -- A Goose's Call (Over-rides Bird.Call())         -
   -- Receive: A_Goose, a Goose_Type.                 -
   -- Return: "Honk!"                                 -
   ----------------------------------------------------
   function Call(A_Goose : in Goose_Type) return String is
   begin
      return "Honk!";
   end Call;

   -----------------------------------------------------
   -- Determine type of a Goose                        -
   -- (Over-rides Bird.Type_Name())                    -
   -- Receive: A_Goose, a Goose_Type.                  -
   -- Return: "Goose".                                 -
   -----------------------------------------------------
   function Type_Name(A_Goose : in Goose_Type) return String is
   begin
      return "Goose";
   end Type_Name;



end Goose_Package;
-- kiwi_package.adb gives Kiwi-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Kiwi_Package is

   ----------------------------------------------------
   -- A Kiwi's Call (Over-rides Bird.Call())          -
   -- Receive: A_Kiwi, a Kiwi_Type.                   -
   -- Return: "*Kiwi Sounds*!"                                -
   ----------------------------------------------------
   function Call(A_Kiwi : in Kiwi_Type) return String is
   begin
      return "*Kiwi Sounds*!";
   end Call;

   ------------------------------------------------------------
   -- Determine type of a Kiwi (Over-rides Bird.Type_Name()) -
   -- Receive: A_Kiwi, a Kiwi_Type.                          -
   -- Return: "Kiwi".                                        -
   -----------------------------------------------------------
   function Type_Name(A_Kiwi : in Kiwi_Type) return String is
   begin
      return "Kiwi";
   end Type_Name;

end Kiwi_Package;
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
-- owl_package.adb gives Owl-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Owl_Package is

  ----------------------------------------------------
   -- A Owl's Call (Over-rides Bird.Call())           -
   -- Receive: An_Owl, an Owl_Type.                   -
   -- Return: "Whoo!"                                 -
   ----------------------------------------------------
   function Call(An_Owl : in Owl_Type) return String is
   begin
      return "Whoo!";
   end Call;

   -----------------------------------------------------
   -- Determine type of a Owl                          -
   -- (Over-rides Bird.Type_Name())                    -
   -- Receive: An_Owl, an Owl_Type.                    -
   -- Return: "Owl".                                   -
   -----------------------------------------------------
   function Type_Name(An_Owl : in Owl_Type) return String is
   begin
      return "Owl";
   end Type_Name;
   
end Owl_Package;
-- penguin_package.adb gives Penguin-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Penguin_Package is

   ----------------------------------------------------
   -- A Penguin's Call (Over-rides Bird.Call())          -
   -- Receive: A_Penguin, a Penguin_Type.                   -
   -- Return: "*Penguin Sounds*!"                                -
   ----------------------------------------------------
   function Call(A_Penguin : in Penguin_Type) return String is
   begin
      return "*Penguin Sounds*!";
   end Call;

   ------------------------------------------------------------
   -- Determine type of a Penguin (Over-rides Bird.Type_Name()) -
   -- Receive: A_Penguin, a Penguin_Type.                          -
   -- Return: "Penguin".                                        -
   -----------------------------------------------------------
   function Type_Name(A_Penguin : in Penguin_Type) return String is
   begin
      return "Penguin";
   end Type_Name;

end Penguin_Package;
Script started on 2020-04-29 15:50:21-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ada[00m$ cat *Ad[K[K.adb
-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/24/2020
-- Lab: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is


   ----------------------------------------------------
   -- initialization                                  -
   -- Receive: A_Bird, a Bird_Type;                   -
   --          Name, a String                         -
   -- Return: a Bird_Type in which My_Name = Name.    -
   ----------------------------------------------------
   procedure Init(A_Bird : out Bird_Type; Name : in String) is
   begin
      A_Bird.My_Name := Name;
   end Init;
   
   ----------------------------------------------------
   -- Name accessor                                   -
   -- Receive: A_Bird, a Bird_Type.                   -
   -- Return: A_Bird.My_Name.                         -
   ----------------------------------------------------
   function Name(A_Bird : in Bird_Type) return String is
   begin
      return A_Bird.My_Name;
   end Name;
   
   -- A Bird's Call                                   -
   -- Receive: A_Bird, a Bird_Type.                   -
   -- Return: a default bird-call ("Squawk!").        -
   ----------------------------------------------------
   function Call(A_Bird : in Bird_Type) return String is
   begin
      return "Squawwwwwwk!";
   end Call;

   ----------------------------------------------------
   -- Determine type of a Bird (for derived types)    -
   -- Receive: A_Bird, a Bird_Type.                   -
   -- Return: "Bird".                                 -
   ----------------------------------------------------
   function Type_Name(A_Bird : in Bird_Type) return String is
   begin
      return "Bird";
   end Type_Name;
   
   ----------------------------------------------------
   -- A Bird's movement                               -
   -- Receive: A_Bird, a Bird_Type                    -
   -- Output: Movement Description                    -
   ----------------------------------------------------
   function Movement(A_Bird : in Bird_Type) return String is
   begin
      return "Movement not specified";
   end Movement;
   
   ----------------------------------------------------
   -- Output a Bird                                   -
   -- Receive: A_Bird, a Bird or subclass of Bird.    -
   -- Output: Everything known about A_Bird           -
   ----------------------------------------------------
   procedure Put(A_Bird : in Bird_Type'Class) is
   begin
      Put( Name(A_Bird) );
      Put( ' ' );
      Put( Type_Name(A_Bird) );
      Put( " just " );
      Put( Movement(A_Bird) );
      Put(" past and said, """);
      Put( Call(A_Bird) );
      Put(" "" ");
   end Put; 
end Bird_Package;

-- birds.adb tests our Birds type hierarchy.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Bird_Package, 
  Duck_Package, 
  Goose_Package, 
  Owl_Package,
  Ostrich_Package,
  Penguin_Package,
  Kiwi_Package,
  Ada.Text_IO;
use Bird_Package,
  Duck_Package, 
  Goose_Package,
  Owl_Package,
  Ostrich_Package,
  Penguin_Package,
  Kiwi_Package,
  Ada.Text_IO;


procedure Birds is

   Bird1 : Bird_Type;       -- base class
   Bird2 : Duck_Type;       -- derived class 1
   Bird3 : Goose_Type;      -- derived class 2
   Bird4 : Owl_Type;        -- derived class 3
   
   Bird5 : Ostrich_Type;     -- derived class 4
   Bird6 : Penguin_Type;     -- derived class 5
   Bird7 : Kiwi_Type;      -- derived class 6

begin
   Put("Welcome to the Bird Park!"); New_Line;
   Init(Bird1, "Tweety");
   Put(Bird1); New_Line;

   Init(Bird2, "Donald");
   Put(Bird2); New_Line;

   Init(Bird3, "Mother");
   Put(Bird3); New_Line;

   Init(Bird4, "Woodsy");
   Put(Bird4); New_Line;
   
   Init(Bird5, "Jacobb");
   Put(Bird5); New_Line;
   
   Init(Bird6, "123456");
   Put(Bird6); New_Line;
   
   Init(Bird7, "Brinki");
   Put(Bird7); New_Line;
   
    
   New_Line;
end Birds;

-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Duck_Package is

   ----------------------------------------------------
   -- A Duck's Call (Over-rides Bird.Call())          -
   -- Receive: A_Duck, a Duck_Type.                   -
   -- Return: "Quack!"                                -
   ----------------------------------------------------
   function Call(A_Duck : in Duck_Type) return String is
   begin
      return "Quack!";
   end Call;

   ------------------------------------------------------------
   -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
   -- Receive: A_Duck, a Duck_Type.                          -
   -- Return: "Duck".                                        -
   -----------------------------------------------------------
   function Type_Name(A_Duck : in Duck_Type) return String is
   begin
      return "Duck";
   end Type_Name;

end Duck_Package;
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
-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

package body Goose_Package is

   ----------------------------------------------------
   -- A Goose's Call (Over-rides Bird.Call())         -
   -- Receive: A_Goose, a Goose_Type.                 -
   -- Return: "Honk!"                                 -
   ----------------------------------------------------
   function Call(A_Goose : in Goose_Type) return String is
   begin
      return "Honk!";
   end Call;

   -----------------------------------------------------
   -- Determine type of a Goose                        -
   -- (Over-rides Bird.Type_Name())                    -
   -- Receive: A_Goose, a Goose_Type.                  -
   -- Return: "Goose".                                 -
   -----------------------------------------------------
   function Type_Name(A_Goose : in Goose_Type) return String is
   begin
      return "Goose";
   end Type_Name;



end Goose_Package;
-- kiwi_package.adb gives Kiwi-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Kiwi_Package is

   ----------------------------------------------------
   -- A Kiwi's Call (Over-rides Bird.Call())          -
   -- Receive: A_Kiwi, a Kiwi_Type.                   -
   -- Return: "*Kiwi Sounds*!"                                -
   ----------------------------------------------------
   function Call(A_Kiwi : in Kiwi_Type) return String is
   begin
      return "*Kiwi Sounds*!";
   end Call;

   ------------------------------------------------------------
   -- Determine type of a Kiwi (Over-rides Bird.Type_Name()) -
   -- Receive: A_Kiwi, a Kiwi_Type.                          -
   -- Return: "Kiwi".                                        -
   -----------------------------------------------------------
   function Type_Name(A_Kiwi : in Kiwi_Type) return String is
   begin
      return "Kiwi";
   end Type_Name;

end Kiwi_Package;
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
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ada[00m$ cat *.ads
-- bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------


package Bird_Package is

type Bird_Type is tagged private;
 ----------------------------------------------------
 -- initialization                                  -
 -- Receive: A_Bird, a Bird_Type;                   -
 --          Name, a String                         -
 -- Return: a Bird_Type whose My_Name = Name.       -
 ----------------------------------------------------
procedure Init(A_Bird : out Bird_Type; Name : in String);
 ----------------------------------------------------
 -- Name accessor                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: A_Bird.My_Name.                         -
 ----------------------------------------------------
function  Name(A_Bird : in Bird_Type) return String;
 ----------------------------------------------------
 -- A Bird's Call                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a default bird-call ("Squawk!").        -
 ----------------------------------------------------
function  Call(A_Bird : in Bird_Type) return String;
 ----------------------------------------------------
 -- Determine type of a Bird (for derived types)    -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: "Bird".                                 -
 ----------------------------------------------------
function  Type_Name(A_Bird : in Bird_Type) return String;
 ----------------------------------------------------
 -- Output a Bird                                   -
 -- Receive: A_Bird, a Bird or subclass of Bird.    -
 -- Output: Everything known about A_Bird           -
 ----------------------------------------------------
procedure Put(A_Bird : in Bird_Type'Class);

 ----------------------------------------------------
 -- A Bird's movement                               -
 -- Receive: A_Bird, a Bird_Type                    -
 -- Output: Movement Description        d           -
 ----------------------------------------------------
function Movement(A_Bird : in Bird_Type) return String;


private
type Bird_Type is
          tagged record
            My_Name : String(1..6);
          end record;

end Bird_Package;
-- duck_package.ads gives Duck-related declarations,
--
--  and derives Duck from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Flying_Bird_Package; use Flying_Bird_Package;

package Duck_Package is

   type Duck_Type is new Flying_Bird_Type with private;
   ----------------------------------------------------
   -- A Duck's Call (Over-rides Bird.Call())          -
   -- Receive: A_Duck, a Duck_Type.                   -
   -- Return: "Quack!"                                -
   ----------------------------------------------------
   function  Call(A_Duck : in Duck_Type) return String;

   ------------------------------------------------------------
   -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
   -- Receive: A_Duck, a Duck_Type.                          -
   -- Return: "Duck".                                        -
   -----------------------------------------------------------
   function  Type_Name(A_Duck : in Duck_Type) return String;

private
   type Duck_Type is new Flying_Bird_Type with
      record
	 null;
      end record;
end Duck_Package;
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
-- kiwi_package.ads gives Kiwi-related declarations,
--
--  and derives Kiwi from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Walking_Bird_Package; use Walking_Bird_Package;

package Kiwi_Package is

   type Kiwi_Type is new Walking_Bird_Type with private;
   ----------------------------------------------------
   -- A Kiwi's Call (Over-rides Bird.Call())          -
   -- Receive: A_Kiwi, a Kiwi_Type.                   -
   -- Return: "Quack!"                                -
   ----------------------------------------------------
   function  Call(A_Kiwi : in Kiwi_Type) return String;

   ------------------------------------------------------------
   -- Determine type of a Kiwi (Over-rides Bird.Type_Name()) -
   -- Receive: A_Kiwi, a Kiwi_Type.                          -
   -- Return: "Kiwi".                                        -
   -----------------------------------------------------------
   function  Type_Name(A_Kiwi : in Kiwi_Type) return String;

private
   type Kiwi_Type is new Walking_Bird_Type with
      record
	 null;
      end record;
end Kiwi_Package;
-- ostrich_package.ads gives Ostrich-related declarations,
--
--  and derives Ostrich from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Walking_Bird_Package; use Walking_Bird_Package;

package Ostrich_Package is

   type Ostrich_Type is new Walking_Bird_Type with private;
   ----------------------------------------------------
   -- A Ostrich's Call (Over-rides Bird.Call())          -
   -- Receive: A_Ostrich, a Ostrich_Type.                   -
   -- Return: "Quack!"                                -
   ----------------------------------------------------
   function  Call(A_Ostrich : in Ostrich_Type) return String;

   ------------------------------------------------------------
   -- Determine type of a Ostrich (Over-rides Bird.Type_Name()) -
   -- Receive: A_Ostrich, a Ostrich_Type.                          -
   -- Return: "Ostrich".                                        -
   -----------------------------------------------------------
   function  Type_Name(A_Ostrich : in Ostrich_Type) return String;

private
   type Ostrich_Type is new Walking_Bird_Type with
      record
	 null;
      end record;
end Ostrich_Package;
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
-- penguin_package.ads gives Penguin-related declarations,
--
--  and derives Penguin from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------

with Walking_Bird_Package; use Walking_Bird_Package;

package Penguin_Package is

   type Penguin_Type is new Walking_Bird_Type with private;
   ----------------------------------------------------
   -- A Penguin's Call (Over-rides Bird.Call())          -
   -- Receive: A_Penguin, a Penguin_Type.                   -
   -- Return: "Quack!"                                -
   ----------------------------------------------------
   function  Call(A_Penguin : in Penguin_Type) return String;

   ------------------------------------------------------------
   -- Determine type of a Penguin (Over-rides Bird.Type_Name()) -
   -- Receive: A_Penguin, a Penguin_Type.                          -
   -- Return: "Penguin".                                        -
   -----------------------------------------------------------
   function  Type_Name(A_Penguin : in Penguin_Type) return String;

private
   type Penguin_Type is new Walking_Bird_Type with
      record
	 null;
      end record;
end Penguin_Package;
-- walking_bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/29/2020
-- Project: 10
-----------------------------------------------------
with Bird_Package; use Bird_Package;

package Walking_Bird_Package is

   type Walking_Bird_Type is new Bird_Type with private;
   
   function Movement(A_Walker : in Walking_Bird_Type) return String;

private
   type Walking_Bird_Type is new Bird_Type with
      record
	 null;
      end record;

end Walking_Bird_Package;
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ada[00m$ gnatmake birds.adb
gnatmake: "birds" up to date.
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ada[00m$ ./birds
Welcome to the Bird Park!
Tweety Bird just Movement not specified past and said, "Squawwwwwwk! " 
Donald Duck just flew past and said, "Quack! " 
Mother Goose just flew past and said, "Honk! " 
Woodsy Owl just flew past and said, "Whoo! " 
Jacobb Ostrich just walked past and said, "*Ostrich Noises* " 
123456 Penguin just walked past and said, "*Penguin Sounds*! " 
Brinki Kiwi just walked past and said, "*Kiwi Sounds*! " 

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ada[00m$ exit

Script done on 2020-04-29 15:50:38-0400
