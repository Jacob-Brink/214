# temp_tester.rb tests class Temperature and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/15/2020
# Project: 8
####################################################

require "./Temperature.rb"
include Test::Unit::Assertions

def temp_tester
   baseTemp, limitTemp = Weather::Temperature.new(0, "F");

   puts "Enter baseTemp: "
   baseTemp.read()

   puts "Enter limitTemp: "
   limitTemp.read()

   puts "Enter stepValue: "
   stepValue = gets.to_f
   
   while (baseTemp.equals(limitTemp)) or (baseTemp.lessthan(limitTemp))
     print "#{baseTemp.getFahrenheit()} #{baseTemp.getCelsius()} #{baseTemp.getKelvin()}"
     baseTemp = baseTemp.raise(stepValue)
   end
   
end

if __FILE__ == $0
  temp_tester()
end


