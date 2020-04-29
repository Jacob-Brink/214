Script started on 2020-04-29 15:38:56-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ ruby birds.rb[1Pcat[C[C[C[C[C[C[C[C[CWalkingBird.rb[4PPenguin.rb[4POwl.rbstrich.rb[3PKiwi.rbGoose.rbFlyingBird.rb[6PDuck.rbBird.rb[7Pexitcat Bird.rb
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
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat Bird.rbruby birds.rb[1Pcat[C[C[C[C[C[C[C[C[C[K[K[K[K[K[K[K[K[K Duck.rb
# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './FlyingBird.rb'

class Duck < FlyingBird
  def call
    'Quack!'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat FlyingBird.rb
# FlyingBird.rb | Defines the FlyingBird class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './Bird.rb'

class FlyingBird < Bird
  def movement
    'flew'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat g[KGoose.rb 
# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './FlyingBird.rb'

class Goose < FlyingBird
  def call
    'Honk!'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat Kiwi.rb
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
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ catO[K Osti[Krich.rb
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
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat Owl.rb
# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './FlyingBird.rb'

class Owl < FlyingBird
  def call
    'Whoo-hoo'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat Penguin.rb
# Penguin.rb | Defines the Penguin class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './WalkingBird.rb'

class Penguin < WalkingBird
  def call
    '*Penguin Noises*'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat WalkingBird.rb 
# WalkingBird.rb | Defines the WalkingBird class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
####################################################

require './Bird.rb'

class WalkingBird < Bird
  def movement
    'walked'
  end
end
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ cat birds.rb
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/29/2020
# Project: 10
######################################################

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'
require './Ostrich.rb'
require './Penguin.rb'
require './Kiwi.rb'

puts "\nWelcome to the Bird Park!\n\n"


bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

bird4 = Ostrich.new "*Ostrich Name*"
bird4.print

bird5 = Penguin.new "*Penguin Name*"
bird5.print

bird6 = Kiwi.new "*Kiwi Name*"
bird6.print


puts "\n\n"
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ ruby birds.rb

Welcome to the Bird Park!

Donald, a Duck flew past, said, "Quack!"
Mother, a Goose flew past, said, "Honk!"
Woodsey, a Owl flew past, said, "Whoo-hoo"
*Ostrich Name*, a Ostrich walked past, said, "*Ostrich Noises*"
*Penguin Name*, a Penguin walked past, said, "*Penguin Noises*"
*Kiwi Name*, a Kiwi walked past, said, "*Kiwi Noises*"


]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/ruby[00m$ exit

Script done on 2020-04-29 15:40:00-0400
