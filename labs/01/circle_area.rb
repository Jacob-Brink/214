#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
#
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 2/6/2020
###############################################################

# function circleArea returns a circle's area, given its radius
# Parameters: r, a number
# Precondition: r > 0.
# Returns: the area of a circle whose radius is r.

# set PI to an approximate value
PI = 3.1415927

# declare a function with parameter "r"
def circleArea(r)
  # return PI * r^2
  PI * r ** 2
  # set end of circleArea function
end

# if this file is called (ruby thisFile), run this code
if __FILE__ == $0
  # writes string and new line
  puts "To compute the area of a circle,"
  # writes string with no new line
  print " enter its radius: "

  # get input and store it in radius
  radius = gets.chomp.to_f

  # writes string and new line
  print "The circle's area is: "

  # writes with newline at end the result of the circle area function with user input as the parameter
  puts circleArea(radius)
  # set end of if block
end
