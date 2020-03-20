Script started on 2020-03-20 09:12:50-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ gnat[K[K[K[Kcat average.adb
-- average.adb "test-drives" function Average.
-- Precondition: theArray is an array of numbers.
-- Output: the average of the numbers.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 3/17/2020
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure average is

   -- Declare Vector type
   type Vector is array ( Positive range <>) of Float;

-- Define array0 as an array containing no values
   array0 : Vector := (0.0, 0.0);
   
-- Define array1 as an array containing 9, 8, 7, 6
   array1 : Vector := (9.0, 8.0, 7.0, 6.0);
   
----------------------------------------------
-- Sum() Sums the values in an array           -
-- Receive: anArray, an array of numbers     -
-- Return: the sum of the values in anArray. -
----------------------------------------------
   function Sum(A: Vector) return Float is 
      Total : Float := 0.0; 
   begin 
      for I in A'Range 
      loop 
	 Total := Total + A(I); 
      end loop; 
      return Total; 
   end Sum;
   
----------------------------------------------
-- Average() averages the values in an array         -
-- Receive: anArray, an array of numbers     -
-- Return: the average of the values in anArray. -
----------------------------------------------

   function Average(A: Vector) return Float is
   begin
      return Sum(A)/Float(A'Length);
   end Average;
  
   
begin
   Put(" average 0 is ");
   Put( Average(array0) );
   New_line;
   Put(" average 1 is ");
   Put( Average(array1) );
   New_line;
end average;

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ gnatmake average.adb
gnatmake: "average" up to date.
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ ./average
 average 0 is  0.00000E+00
 average 1 is  7.50000E+00
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ exit

Script done on 2020-03-20 09:13:36-0500
