# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/8/2020
# Project: 7
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name

  def initialize(first, middle, last)
    @first, @middle, @last = first, middle, last
  end

  attr_accessor :first, :middle, :last
  
  def fullName()
    @first + " " + @middle + " " + @last
  end

  def lfmi()
    @last + ", " + @first + " " + @middle[0] + "."
  end

  def read()
    puts "First: "
    @first = gets.chomp

    puts "Middle: "
    @middle = gets.chomp

    puts "Last: "
    @last = gets.chomp
  end

  def print()
    puts self.fullName
    self.fullName
  end
  
end


def testName
   name = Name.new("John", "Paul", "Jones")

   puts "Testing Lab Methods..."
   
   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"

   puts "Testing Project Methods..."
   name.first = "Jacob"
   name.middle = "Jingle"
   name.last = "Hymer"

   assert name.first == "Jacob", "first setter failed"
   assert name.middle == "Jingle", "middle setter failed"
   assert name.last == "Hymer", "last setter failed"
   assert name.lfmi == "Hymer, Jacob J.", "lfmi failed"

   name.read()
   puts "Does this look right?"
   name.print
   
   print "All tests passed!\n"
end

if __FILE__ == $0
  testName()
end
