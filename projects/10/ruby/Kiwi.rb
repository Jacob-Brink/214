# Kiwi.rb | Defines the Kiwi class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './WalkingBird.rb'

class Kiwi < WalkingBird
  def call
    '*Kiwi Noises*'
  end
end
