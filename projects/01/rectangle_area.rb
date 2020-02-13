#! /usr/bin/ruby
# rectangle_area.rb computes the area of a rectangle given its width, height
#
# Input: the width, height of a rectangle
# Precondition: the width, height is not negative
# Output: the area of the rectangle.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 2/6/2020
###############################################################

# function rectangleArea returns a rectangle's area, given its width, height
# Parameters: width and height, a number
# Precondition: width and height > 0.
# Returns: the area of a rectangle whose width, height.

# declare a function with parameter "width" and "height"
def rectangleArea(width, height)
  # return width * height
  width * height
  # set end of rectangleArea function
end

# if this file is called (ruby thisFile), run this code
if __FILE__ == $0
  # writes string and new line
  puts "To compute the area of a rectangle,"
  # writes string with no new line
  print " enter its width: "

  # get input and store it in width
  width = gets.chomp.to_f


  # writes string with no new line
  print " enter its height: "

  # get input and store it in height
  height = gets.chomp.to_f
  
  
  # writes string and new line
  print "The rectangle's area is: "

  # writes with newline at end the result of the rectangle area function with user input as the parameter
  puts rectangleArea(width, height)
  # set end of if block
end
