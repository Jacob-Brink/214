Script started on 2020-02-06 13:01:53-0500
]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ cat CircleArea          circle_area.adb
-- circle_area.adb computes the area of a circle.
--
-- Input: The radius of the circle.
-- Precondition: The radius is a positive number.
-- Output: The area of the circle.
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 2/6/2020
----------------------------------------------------

-- loads libraries
with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

-- Define procedure / function where execution starts
procedure circle_area is

   -- Declares two variables both of which of type float
   radius, area : float; 

   -- function circleArea computes a circle's area, given its radius
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the circle whose radius is r
   ----------------------------------------------------
  
   -- define function circleArea with paramater r of type float and with return type float
   function circleArea(r: in float) return float is 
      -- define PI as constant
      PI : constant := 3.1415927;
   begin
      -- return area of circle
      return PI * r ** 2;
   end circleArea;

begin
   -- Writes new line	
   New_Line;
   
   -- Writes string with new line at the end
   Put_Line("To compute the area of a circle,");
   
   -- Writes string with no new line at the end
   Put("enter its radius: ");
   
   -- Get user input stored in radius variable
   Get(radius);

   -- set area to result of circleArea function
   area := circleArea(radius);

   
   
   -- Writes new line
   New_Line;
   
   -- Writes string to console
   Put("The circle's area is ");

   -- Writes string to console
   Put(area);

   -- Make two new lines
   New_Line; New_Line; 

   -- Writes line
   Put("The circle's area is ");

   -- Writes line
   Put(area, 1, 15, 0);

   -- Writes two new lines
   New_Line; New_Line; 

   -- Tell compiler that the procedure ends here
end circle_area;

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ gnatmake circle_area
x86_64-linux-gnu-gcc-7 -c circle_area.adb
x86_64-linux-gnu-gnatbind-7 -x circle_area.ali
x86_64-linux-gnu-gnatlink-7 circle_area.ali
]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ ./circle_area

To compute the area of a circle,
enter its radius: 1

The circle's area is  3.14159E+00

The circle's area is 3.141592741012573

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ ./circle_area

To compute the area of a circle,
enter its radius: 2

The circle's area is  1.25664E+01

The circle's area is 12.566370964050293

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ ./circle_area

To compute the area of a circle,
enter its radius: 2.5

The circle's area is  1.96350E+01

The circle's area is 19.634954452514648

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ ./circle_area

To compute the area of a circle,
enter its radius: 4.99999

The circle's area is  7.85395E+01

The circle's area is 78.539505004882813

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ exit

Script done on 2020-02-06 13:03:12-0500
