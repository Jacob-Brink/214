Script started on 2020-03-07 10:33:44-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="93" LINES="25"]
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m gnatmake s[Ksplit.adb
gnatmake: "split" up to date.
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m ./split
To split a string, enter the string: hello
Enter the split position: 1
The first part is                                         
 and the second part is hello                                   
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m ./split
To split a string, enter the string: 4 hello
Enter the split position: 4
The first part is hel                                     
 and the second part is lo                                      
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m ./split
To split a string, enter the string: hello
Enter the split position: 6
The first part is hello                                   
 and the second part is                                         
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m cat ss[Kplit.adb
-- split.adb splits an input string about a specified position.
--
-- Input: Astring, a string,
--        Pos, an integer.
-- Precondition: pos is in Astring'Range.
-- Output: The substrings Astring(Astring'First..Pos-1) and
--                        Astring(Pos..Astring'Last).
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 3/6/2020
-- Lab: 5
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;

procedure split is

   EMPTY_STRING : String := "                                        ";

   Astring, Part1, Part2 : String  := EMPTY_STRING;
   Pos, Chars_read       : Natural;

   ------------------------------------------------
   --  split() splits a string in two.           
   -- Receive: The_String, the string to be split,
   --          Position, the split index.        
   -- PRE: 0 < Position <= The_String.length(). 
   --     (Ada arrays are 1-relative by default)
   -- Passback: First_Part - the first substring,
   --           Last_Part - the second substring.
   ------------------------------------------------
   procedure split(InputString : in String; SplitPosition : in Natural; FirstPart, SecondPart : out String) is
   begin
      Move(InputString(InputString'First..(SplitPosition-1)), FirstPart);
      Move(InputString(SplitPosition..InputString'Last), SecondPart);
   end Split;
     


begin                                           -- Prompt for input
   Put("To split a string, enter the string: ");
   Get_Line(Astring, Chars_Read);
   Put("Enter the split position: ");
   Get(Pos);

   split(Astring, Pos, Part1, Part2);

   Put("The first part is ");
   Put_Line(Part1);
   Put(" and the second part is ");
   Put_Line(Part2);

end split;

]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m exit

Script done on 2020-03-07 10:34:33-05:00 [COMMAND_EXIT_CODE="0"]
