Script started on 2020-02-21 13:08:37-0500
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ./year_codesgnatmake year_codes.adb [12P./year_codesgnatmake year_codes.adb [6Pcat year_codes.adb[6P./year_codescat year_codes.adb
-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Student: Jacob Brink
-- Date: 2/21/2020
-- Lab: 03
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure year_codes is

   year : String(1..9) := "         ";
   charsRead : Natural;
   
   
   -- function yearCode computes the integer that represents the given school year
   -- Parameter: year, a string
   -- Precondition: year is string
   -- Return: 1-4 for freshman, sophomore, junior, senior respectively, 0 for anything else
   ----------------------------------------------------
   function yearCode (Year : string) return integer is
   begin
      
      if Year = "freshman " then
	 return 1;
      elsif ( Year = "sophomore" ) then
	 return 2;
      elsif ( Year = "junior   " ) then
	 return 3;
      elsif (Year = "senior   " ) then
	 return 4;
      else
	 return 0;
      end if;
	 
   end YearCode;
     

begin                                          
   Put("Enter your academic year: ");           -- Prompt for input
   Get_Line(year, charsRead);                   -- Input
   Put( yearCode(year) );                       -- Convert and output
   New_Line;
end year_codes;

]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ cat year_codes.adb[6P./year_codesgnatmake year_codes.adb 
gnatmake: "year_codes" up to date.
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ gnatmake year_codes.adb [6Pcat year_codes.adb[6P./year_codes
Enter your academic year: j frs eshj ,am   man
          1
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ./year_codes
Enter your academic year: sophomore
          2
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ./year_codes
Enter your academic year: junior
          3
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ./year_codes
Enter your academic year: senior
          4
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ./year_codes
Enter your academic year: should_be_s zeroooooo
          0
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ exit

Script done on 2020-02-21 13:09:14-0500
