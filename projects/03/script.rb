Script started on 2020-02-26 22:31:49-0500
]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ cat selectoin.rb      ion.rb
#! /usr/bin/ruby
# selection.rb determines the letter grade given a percent grade
# 
# Input: nonnegative number
# Precondition: number is not negative
# Output: the appropriate letter grade
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 2/25/2020
###############################################################

# function getLetter returns a the letter grade matching the given percent grade
# Parameters: p, a number
# Precondition: p is between 0 and 100
# Returns: string of letter grade

def getLetter(p)
  case(p.div(10))
  when 10, 9 then "A"
  when 8 then "B"
  when 7 then "C"
  when 6 then "D"
  else
    "F"
  end
end


def showSuccess(success)
  if success
    "Success"
  else
    "Fail"
  end
end

# function checkAnswers checks getLetter method
# Parameters: none
# Precondition: getLetters method exists
# Returns: none

def checkAnswers()
  print "Checking getLetter() method..."

  #check each possible grade letter
  puts "Checking 100 == A"
  puts showSuccess(getLetter(100) == "A")

  puts "Checking 90 == A"
  puts showSuccess(getLetter(90) == "A")

  puts "Checking 80 == B"
  puts showSuccess(getLetter(80) == "B")

  puts "Checking 70 == C"
  puts showSuccess(getLetter(70) == "C")

  puts "Checking 60 == D"
  puts showSuccess(getLetter(60) == "D")

  puts "Checking 40 == F"
  puts showSuccess(getLetter(40) == "F")

  #check that integer division works
  puts "Checking 95 == A"
  puts showSuccess(getLetter(95) == "A")

  
end

if __FILE__ == $0
  checkAnswers()
   puts "Enter a percentage: "
   percentage = gets.chomp.to_f
   print "The letter grade is "
   puts getLetter(percentage)
end
]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ ruby selection.rb
Checking getLetter() method...Checking 100 == A
Success
Checking 90 == A
Success
Checking 80 == B
Success
Checking 70 == C
Success
Checking 60 == D
Success
Checking 40 == F
Success
Checking 95 == A
Success
Enter a percentage: 
2
The letter grade is F
]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ ruby selection.rb
Checking getLetter() method...Checking 100 == A
Success
Checking 90 == A
Success
Checking 80 == B
Success
Checking 70 == C
Success
Checking 60 == D
Success
Checking 40 == F
Success
Checking 95 == A
Success
Enter a percentage: 
100
The letter grade is A
]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ exit

Script done on 2020-02-26 22:32:27-0500
