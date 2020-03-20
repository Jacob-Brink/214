Script started on 2020-03-20 09:13:40-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ cat average.rb
# average.rb averages the values of an array of doubles.
# Precondition: theArray is an array of numbers
# Output: the average of the values in theArray
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 3/20/2020
########################################################


###############################################
# sum() sums the values in an array
# Receive: anArray, an array of numbers
# Return: the sum of the values in anArray.
################################################
def sum (array)
  total = 0.0
  array.each { |elem| total += elem }
  total
end

################################################
# average() returns the average of elements in given array
# Receive: an array of numeric values 
# Return: average of elements in array
######################################################
def average (array)
  if array.empty? then
    0
  else
    (sum(array)/array.size)
  end
end


if __FILE__ == $0
  array0 = Array.new(0)
  array1 = [ 9.0, 8.0, 7.0, 6.0 ]

  puts "sum 0 is: #{ sum(array0) }\n"
  puts "sum 1 is: #{ sum(array1) }\n"

  puts "average 0 is: #{ average(array0) }\n"
  puts "average 1 is: #{ average(array1) }\n"

  
end


]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ riub[K[K[Kuby average.rb
sum 0 is: 0.0
sum 1 is: 30.0
average 0 is: 0
average 1 is: 7.5
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ exit

Script done on 2020-03-20 09:14:11-0500
