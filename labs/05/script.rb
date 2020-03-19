Script started on 2020-03-07 10:37:46-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="93" LINES="25"]
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m r[Kcat split.rb
# split.rb splits a string into two substrings.
#
# Input: A string and an integer string position to split the string by.
# Precondition: The position integer is within the range of the string size.
# Output: The substrings aString(0, position - 1) and
#   aString(pos, length() - 1).
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 3/7/2020
# Lab: 5
#################################################################


# split() splits a string into its two substrings.
# Receive: aString, the string to be split,       
#        pos, the split position.                  
# PRE: 0 <= pos < the length of aString.
# Return: the substring of aString before pos, and  
#         the substring of aString from pos onwards.
######################################################

def split (aString, position)
  array = Array.new(2)
  array[0] = aString[0, position]
  array[1] = aString[position, aString.size]
  array
end


if __FILE__ == $0
  print "To split a string, enter the string: "; 
  the_string = gets
  print "Enter the split position: "; 
  position = gets.to_i
  split_string = split(the_string, position)
  puts "The first part is: " << split_string[0]
  puts "and the second part is: " << split_string[1]
end
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m cat split.rb[K[K[K[K[K[K[K[K[K[K[K[Kruby split.rb
To split a string, enter the string: hello
Enter the split position: 0
The first part is: 
and the second part is: hello
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m ruby split.rb
To split a string, enter the string: hello
Enter the split position: 3
The first part is: hel
and the second part is: lo
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m ruby split.rb
To split a string, enter the string: hello
Enter the split position: 5
The first part is: hello
and the second part is: 
]0;jacobb@jacob-virtualbox:~/lab5[01;32m[jacobb@jacob-virtualbox[01;37m lab5[01;32m]$[00m exit

Script done on 2020-03-07 10:38:24-05:00 [COMMAND_EXIT_CODE="0"]
