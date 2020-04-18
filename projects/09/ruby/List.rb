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

