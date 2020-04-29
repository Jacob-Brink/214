Script started on 2020-04-24 14:32:04-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/ruby[00m$ cat Bird.rb
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
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/ruby[00m$ cat Duck.rb
# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/24/2020
####################################################

require './Bird.rb'

class Duck < Bird
  def call
    'Quack!'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/ruby[00m$ cat Goose.rb
# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/24/2020
####################################################

require './Bird.rb'

class Goose < Bird
  def call
    'Honk!'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/ruby[00m$ cat Ol.r[K[K[Kwl.rb
# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/24/2020
####################################################

require './Bird.rb'

class Owl < Bird
  def call
    'Whoo-hoo'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/ruby[00m$ cat birds.rb
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/24/2020
######################################################

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

puts "\n\n"
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/ruby[00m$ cat[K[K[Kruby birds.rb

Welcome to the Bird Park!

Hawkeye, a Bird, says "Squaaaaawk!"
Donald, a Duck, says "Quack!"
Mother, a Goose, says "Honk!"
Woodsey, a Owl, says "Whoo-hoo"


]0;jacob@DESKTOP-TMA4I98: ~/214/labs/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/10/ruby[00m$ exit

Script done on 2020-04-24 14:32:59-0400
