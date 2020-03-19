Script started on 2020-02-28 13:49:05-0500
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ cat logTqable     able.rb
#! /usr/bin/ruby
# logTable.rb displays a table of logarithms
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 2/28/2020
# Lab: 4
#
# Input:  The start, stop and increment values
# Precondition: The start value is less than the stop value, 
#     and the increment is greater than 0
# Output: A table of logarithms from start to stop, with increment
#     as the step value


if __FILE__ == $0
   print "Enter the start value: "
   start = gets.chomp.to_f
   print "Enter the stop value: "
   stop = gets.chomp.to_f
   print "Enter the increment value: "
   increment = gets.chomp.to_f

   while start <= stop
     puts "The logarithm of #{start} is #{Math.log(start)}"
     start += increment
   end
   
#  Replace this line with a loop to display the log table 
end

]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ ruby logTable.rb
Enter the start value: 1
Enter the stop value: 2
Enter the increment value: 0.5
The logarithm of 1.0 is 0.0
The logarithm of 1.5 is 0.4054651081081644
The logarithm of 2.0 is 0.6931471805599453
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ ruby logTable.rb
Enter the start value: 1
Enter the stop value: 5
Enter the increment value: 1
The logarithm of 1.0 is 0.0
The logarithm of 2.0 is 0.6931471805599453
The logarithm of 3.0 is 1.0986122886681098
The logarithm of 4.0 is 1.3862943611198906
The logarithm of 5.0 is 1.6094379124341003
]0;jpb34@gold14: ~/Documents/214/projects/04[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/04[00m$ exit

Script done on 2020-02-28 13:49:31-0500
