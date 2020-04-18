Script started on 2020-04-18 11:30:00-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/ruby[00m$ cat search.rb
# search.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/22/2020
# Project: 09
###################################################

require './List'

list1 = List.new
list2 = List.new
list3 = List.new
list4 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)
list4.append(55).append(77).append(0).append(88).append(66)

list1.print 
puts
 puts "Position of 99 of list1: #{list1.search(99)}"

list2.print 
puts
puts "Position of 99 of list2: #{list2.search(99)}"

list3.print 
puts
puts "Position of 99 of list3: #{list3.search(99)}"

list4.print 
puts
puts "Position of 99 of list4: #{list4.search(99)}"

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/ruby[00m$ cat List.rb
# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/22/2020
# Project: 09
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

  # initialize a List to be empty
  # Postcondition: first == nil and last == nil and length == 0
  def initialize
    @first = nil
    @last = nil
    @length = 0
  end

  
  # create reader method for length
  attr_reader :length


  # Am I empty?
  # Return: length == 0
  def empty?
    @length == 0
  end
  
  # append a value to me
  # Receive: value, the item to be appended
  # Postcondition: my last item is value and
  #                 my length is one more than it was
  def append(value)
    newNode = Node.new(value, nil)

    if empty?
      @first = newNode
    else
      @last.next = newNode      
    end

    @last = newNode
    @length += 1
    self
  end


  # print my items
  # Postcondition: my items have been displayed to the screen

  def print
    temp = @first
    while !temp.nil?
      printf " #{temp.value}"
      temp = temp.next
    end
  end


  # find my maximum item
  # Return: my maximum item
  def max
    temp = @first
    maxValue = -99999
    while !temp.nil?
      if temp.value > maxValue then
        maxValue = temp.value
      end
      temp = temp.next
    end
    maxValue
  end

  # search for integer in list
  # returns position if exists, else -1
  def search(item)
    temp = @first
    count = 0
    while !temp.nil?
      if temp.value == item then
        return count
      end
      count += 1
      temp = temp.next
    end
    -1
  end
  
  
  # Node class
  class Node
    def initialize(item, link)
      @value = item
      @next = link
    end

    attr_reader :value
    attr_accessor :next
  end
  
end

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/ruby[00m$ ruby search.rb
 99 88 77 66 55
Position of 99 of list1: 0
 55 66 77 88 99
Position of 99 of list2: 4
 55 77 99 88 66
Position of 99 of list3: 2
 55 77 0 88 66
Position of 99 of list4: -1
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/ruby[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/ruby[00m$ exit

Script done on 2020-04-18 11:30:26-0500
