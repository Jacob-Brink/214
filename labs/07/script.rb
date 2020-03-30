Script started on 2020-03-30 13:53:34-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ cat na[K[KNameTester.rb
# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 3/30/2020
# Lab: 7
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name

  def initialize(first, middle, last)
    @first, @middle, @last = first, middle, last
  end

  attr_reader :first, :middle, :last

  def fullName()
    @first + " " + @middle + " " + @last
  end

  def print()
    puts self.fullName
    self.fullName
  end
  
end


def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   
   print "All tests passed!\n"
end

if __FILE__ == $0
  testName()
end
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ ruby NameTester.rb
John Paul Jones
All tests passed!
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ exit

Script done on 2020-03-30 13:53:53-0500
