Script started on 2020-02-06 16:49:30-0500
]0;jpb34@cs-ssh: ~/Documents/214/labs/01jpb34@cs-ssh:~/Documents/214/labs/01$ cat circle_area.rb
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
]0;jpb34@cs-ssh: ~/Documents/214/labs/01jpb34@cs-ssh:~/Documents/214/labs/01$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 1
The circle's area is: 3.1415927
]0;jpb34@cs-ssh: ~/Documents/214/labs/01jpb34@cs-ssh:~/Documents/214/labs/01$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 2
The circle's area is: 12.5663708
]0;jpb34@cs-ssh: ~/Documents/214/labs/01jpb34@cs-ssh:~/Documents/214/labs/01$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 2.5
The circle's area is: 19.634954375
]0;jpb34@cs-ssh: ~/Documents/214/labs/01jpb34@cs-ssh:~/Documents/214/labs/01$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 4.99999
The circle's area is: 78.53950334104417
]0;jpb34@cs-ssh: ~/Documents/214/labs/01jpb34@cs-ssh:~/Documents/214/labs/01$ exit

Script done on 2020-02-06 16:50:06-0500
