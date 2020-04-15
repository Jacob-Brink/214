# temp_tester.rb tests class Temperature and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/15/2020
# Project: 8
####################################################

require "./temperature.rb"   

def temp_tester
  
   puts "Enter baseTemp: "
   baseTemp = Weather::Temperature.read()

   puts "Enter limitTemp: "
   limitTemp = Weather::Temperature.read()

   puts "Enter stepValue: "
   stepValue = gets.to_f

   while (baseTemp.equals(limitTemp)) or (stepValue > 0 ? baseTemp.lessthan(limitTemp) : limitTemp.lessthan(baseTemp))
     print "#{baseTemp.getFahrenheit()}  #{baseTemp.getCelsius()}  #{baseTemp.getKelvin()}\n"
     baseTemp = baseTemp.raise(stepValue)
   end

# Handle user failure in a nice way
rescue StandardError => error
  puts error
   
end

if __FILE__ == $0
  temp_tester()
end


