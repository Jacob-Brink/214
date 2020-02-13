Script started on 2020-02-12 20:47:43-0500
]0;jpb34@gold14: ~/Documents/214/projects/01[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01[00m$ cat rectangle_area.rb
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
]0;jpb34@gold14: ~/Documents/214/projects/01[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01[00m$ ruby rectangle_area.rb
To compute the area of a rectangle,
 enter its width: 2
 enter its height: 3
The rectangle's area is: 6.0
]0;jpb34@gold14: ~/Documents/214/projects/01[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01[00m$ ruby rectangle_area.rb
To compute the area of a rectangle,
 enter its width: 4
 enter its height: 5
The rectangle's area is: 20.0
]0;jpb34@gold14: ~/Documents/214/projects/01[01;32mjpb34@gold14[00m:[01;34m~/Documents/214/projects/01[00m$ exit

Script done on 2020-02-12 20:51:01-0500
