# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/24/2020
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
  
  def print()
    puts @name + ", a " + className + ", says \"" + call + "\""
  end

  
end
