# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

class Bird

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def call()
    "Squaaaaawk!"
  end

  def className
    self.class.to_s
  end

  def movement
    "error"
  end
  
  def print()
    puts @name + ", a " + className + " " + movement + " past, said, \"" + call + "\""
  end

  
end
