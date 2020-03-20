Script started on 2020-03-20 12:40:35-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ cat ArrayProcessing.rb
# ArrayProcessing.rb creates a string of numbers from the user and prints them
# Precondition: size input is greater than or equal to 0
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 3/20/2020
# Project: 06
########################################################

###############################################
# fillarray() fills the array with user input
# Receive: anArray, an array of numbers
# Return: array populated with user input
################################################
def fillArray (arraySize)
  array = Array.new(arraySize)
  for i in 1..arraySize
    print "Enter element #{i}: "
    array[i-1] = gets.to_f
    puts "\n"
  end
  array
end

################################################
# process() prints the elements of the given array
# Receive: an array of numeric values 
# Return: void
######################################################
def process (array)
  array.each { |elem| print "#{elem}\n" }
end


if __FILE__ == $0
  print "Enter size: ";
  size = gets.to_i
  puts "\n";
  process(fillArray(size));
end


]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ gnatmake[K[K[K[K[K[K[K[Kruby ArrayProcessing.rb
Enter size: 4

Enter element 1: 4

Enter element 2: 2

Enter element 3: 1

Enter element 4: 3

4.0
2.0
1.0
3.0
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ exit

Script done on 2020-03-20 12:41:04-0500
