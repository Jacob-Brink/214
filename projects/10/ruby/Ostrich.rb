# Ostrich.rb | Defines the Ostrich class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './WalkingBird.rb'

class Ostrich < WalkingBird
  def call
    '*Ostrich Noises*'
  end
end
