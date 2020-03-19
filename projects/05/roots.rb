# roots.rb rootss a string into two substrings.
#
# Input: a, b, and c
# Output: roots to quadratic equation if valid, false and 0's otherwise
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 3/7/2020
# Project: 5
#################################################################


# roots() finds roots
# Input: a, b, and c
# Output: roots to quadratic equation if valid, false and 0's otherwise
######################################################

def roots (a, b, c)
  array = Array.new(3)
  if a != 0
    arg = b*b - 4 * a * c
    if arg >= 0
      array[0] = true
      array[1] = (-b + Math.sqrt(arg))/(2*a)
      array[2] = (-b - Math.sqrt(arg))/(2*a)
    else
      print " roots(): b^2 - 4ac is negative!"
      array[0] = false
      array[1] = array[2] = 0.0      
    end
  else
    print " roots(): a is zero!"
    array[0] = false
    array[1] = array[2] = 0.0
  end
  array
end


if __FILE__ == $0
  print "Enter A: "; 
  a = gets.to_f

  print "Enter B: "; 
  b = gets.to_f

  print "Enter C: "; 
  c = gets.to_f

  results = roots(a,b,c)

  puts "\n"
  print "Roots are #{results[1]} and #{results[2]}\n"
  
end
