Script started on 2020-03-12 21:00:16-0400
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ cat roots.rb
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
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ ruby roots.rb
Enter A: a 1
Enter B: 2 1
Enter C: 1
 roots(): b^2 - 4ac is negative!
Roots are 0.0 and 0.0
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ ruby roots.rb
Enter A: 0\ 
Enter B: 1
Enter C: 1
 roots(): a is zero!
Roots are 0.0 and 0.0
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ ruby roots.rb
Enter A: 2
Enter B: 5
Enter C: 3

Roots are -1.0 and -1.5
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ exit

Script done on 2020-03-12 21:00:47-0400
