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
