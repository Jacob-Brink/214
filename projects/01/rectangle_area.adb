-- rectangle_area.adb computes the area of a rectangle.
--
-- Input: The width, height of the rectangle.
-- Precondition: The width, height is a positive number.
-- Output: The area of the rectangle.
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 2/6/2020
----------------------------------------------------

-- loads libraries
with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

-- Define procedure / function where execution starts
procedure rectangle_area is

   -- Declares two variables both of which of type float
   width, height, area : float; 

   -- function rectangleArea computes a rectangle's area, given its width, height
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the rectangle whose width, height is r
   ----------------------------------------------------
  
   -- define function rectangleArea with paramater r of type float and with return type float
   function rectangleArea(itsWidth, itsHeight: in float) return float is 
   begin
      -- return area of rectangle
      return ItsWidth * itsHeight;
   end rectangleArea;

begin
   -- Writes new line	
   New_Line;
   
   -- Writes string with new line at the end
   Put_Line("To compute the area of a rectangle,");
   
   -- Writes string with no new line at the end
   Put("enter its width: ");
   
   -- Get user input stored in width, height variable
   Get(width);
   
   -- Writes string with no new line at the end
   Put("enter its height: ");
   
   -- Get user input stored in width, height variable
   Get(height);
   

   -- set area to result of rectangleArea function
   area := rectangleArea(width, height);

   
   
   -- Writes new line
   New_Line;
   
   -- Writes string to console
   Put("The rectangle's area is ");

   -- Writes string to console
   Put(area);

   -- Make two new lines
   New_Line; New_Line; 

   -- Writes line
   Put("The rectangle's area is ");

   -- Writes line
   Put(area, 1, 15, 0);

   -- Writes two new lines
   New_Line; New_Line; 

   -- Tell compiler that the procedure ends here
end rectangle_area;

