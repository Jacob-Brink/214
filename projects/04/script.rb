Script started on 2020-02-28 15:29:43-0500
]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ ruby factorial.rb[1Pcat factorial.rb
#! /usr/bin/ruby
# factorial.rb calculates the factorial of a given number
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 2/28/2020
# Project: 4
##########################################################

# Input: Number
# Precondition: Number is integer
# Output: factorial of Number

def calcFactorial(number)
  answer = 1
  for i in 2..number
    answer *= i
  end
  return answer
end

if __FILE__ == $0
   print "Enter a number: \n"
   number = gets.chomp.to_f
   print "The factorial of #{number} is #{calcFactorial(number)}\n"
end
]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ cat factorial.rb[1@ruby factorial.rb
Enter a number: 
4
The factorial of 4.0 is 24
]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ exit

Script done on 2020-02-28 15:29:55-0500
