Script started on 2020-04-09 17:06:59-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/08/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/08/ruby[00m$ cat Name.rb
# Name.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/10/2020
# Lab: 8
####################################################
module Names

  class Name

    def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
    end

    attr_reader :first, :middle, :last

    def fullName
      @first + " " + @middle + " " + @last
    end

    def print
      puts fullName
      fullName
    end
  end

end
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/08/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/08/ruby[00m$ cat NameT[K[K[K[K[KnameTester.rb
# nameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/10/2020
# Lab: 8
####################################################

require 'test/unit/assertions'
require "./Name.rb"
include Test::Unit::Assertions

def testName
   name = Names::Name.new("John", "Paul", "Jones")

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end

if __FILE__ == $0
  testName()
end


]0;jacob@DESKTOP-QKT72KA: ~/214/labs/08/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/08/ruby[00m$ ruby nameTester.rb
John Paul Jones
All tests passed!
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/08/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/08/ruby[00m$ exit

Script done on 2020-04-09 17:07:18-0500
