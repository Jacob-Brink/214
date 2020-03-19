Script started on 2020-02-28 13:45:54-0500
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ cat log_table.ta a  adb
-- log_table.adb computes a table of logarithms.
--
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Lab: 04
-- Date: 2/28/2020
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure log_table is

   Start, Stop, Increment : Float;

begin                                           -- Prompt for input
   Put_Line("To print a table of logarithms,");
   Put(" enter the start, stop, and increment values: ");
   Get(Start); Get(Stop); Get(Increment);

   while (Start <= Stop)
   loop
      Put("The logarithm of ");
      Put(Start);
      Put(" is ");
      Put(log(Start, 10.0));
      New_Line;
      Start := Start + Increment;
   end loop;
	

end log_table;

]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ gnatmake log_table.adb
gnatmake: "log_table" up to date.
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ ./log_table
To print a table of logarithms,
 enter the start, stop, and increment values: 1
2
0.5
The logarithm of  1.00000E+00 is  0.00000E+00
The logarithm of  1.50000E+00 is  1.76091E-01
The logarithm of  2.00000E+00 is  3.01030E-01
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ ls
[0m[01;34mclojure[0m        log_table.adb~  LogTable.java   logTable.rb   script.adb
[01;32mlog_table[0m      log_table.ali   LogTable.java~  logTable.rb~  script.java
log_table.adb  LogTable.class  log_table.o     Makefile      typescript
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ ./log_Table     tabe le
To print a table of logarithms,
 enter the start, stop, and increment values: 1
20
2
The logarithm of  1.00000E+00 is  0.00000E+00
The logarithm of  3.00000E+00 is  4.77121E-01
The logarithm of  5.00000E+00 is  6.98970E-01
The logarithm of  7.00000E+00 is  8.45098E-01
The logarithm of  9.00000E+00 is  9.54243E-01
The logarithm of  1.10000E+01 is  1.04139E+00
The logarithm of  1.30000E+01 is  1.11394E+00
The logarithm of  1.50000E+01 is  1.17609E+00
The logarithm of  1.70000E+01 is  1.23045E+00
The logarithm of  1.90000E+01 is  1.27875E+00
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ exit

Script done on 2020-02-28 13:48:00-0500
