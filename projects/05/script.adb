Script started on 2020-03-12 20:56:48-0400
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ cat roots.adb
-- Roots.adb finds the roots for a quadratic equation if valid
--
-- Input: A, B, C as Floats
-- Precondition: 
-- Output: The roots to the quadratic equation
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 3/11/2020
-- Project: 5
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed, Ada.Numerics.Elementary_Functions;

procedure Roots is

   
   A, B, C, Root1, Root2 : Float;
   Valid_Quad : Boolean;
   
   ------------------------------------------------
   -- rooter() finds roots to equation           
   -- Receive: A, B, and C as parameters of quadratic formula
   -- Passback: Roots if they exist
   -- Returns: true if valid quadratic formula, else false
   ------------------------------------------------
   function rooter(A, B, C : in Float; Root1, Root2 : out Float) return Boolean is
      Arg : Float;
   begin
      Arg := ((B ** 2) - (4.0 * A * C));
      Put(Float'Image(Arg));
      if A = 0.0 then
	 Put_Line("A cannot be zero!");
	 Root1 := 0.0;
	 Root2 := 0.0;
	 return False;
      else
	 if Arg >= 0.0 then
	    Root1 := (-B + Sqrt(Arg))/(2.0*A);
	    Root2 := (-B - Sqrt(Arg))/(2.0*A);
	    return True;
	 else
	   Put_Line("rooter(): b^2 - 4ac is negative");
	   Root1 := 0.0;
	   Root2 := 0.0;
	   return False;
	 end if;
	 
      end if;
      
   end rooter;
     


begin                                           -- Prompt for input
   Put("Enter A:");
   A := Float'Value(Get_Line);
   
   Put("Enter B:");
   B := Float'Value(Get_Line);
   
   Put("Enter C:");
   C := Float'Value(Get_Line);
   
   Valid_Quad := Rooter(A, B, C, Root1, Root2);
   
   if Valid_Quad = True then
      Put("The roots are ");
      Put(Float'Image(Root1));
      Put(" and ");
      Put(Float'Image(Root2));
   end if;
   
      
   
end Roots;

]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ gnatmake roots.adb
x86_64-linux-gnu-gcc-7 -c roots.adb
x86_64-linux-gnu-gnatbind-7 -x roots.ali
x86_64-linux-gnu-gnatlink-7 roots.ali
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ ./roots 
Enter A:1
Enter B:1
Enter C:1
-3.00000E+00rooter(): b^2 - 4ac is negative
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ 
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ ./roots 
Enter A:0
Enter B:1
Enter C:1
 1.00000E+00A cannot be zero!
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ ./roots 
Enter A:2
Enter B:5
Enter C:3
 1.00000E+00The roots are -1.00000E+00 and -1.50000E+00
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ exit

Script done on 2020-03-12 20:57:49-0400
