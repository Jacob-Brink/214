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
    array[i] = gets.to_f
    puts "\n"
  end  
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


