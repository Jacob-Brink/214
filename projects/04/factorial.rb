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
