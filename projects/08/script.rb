Script started on 2020-04-15 17:04:04-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ cat temp_tester.rb
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


]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ cat temperature.rb
# temperature.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/15/2020
# Project: 8
####################################################

module Weather
 
  class Temperature

    # Invalid_Temperature is a custom Standard Error for invalid temperatures
    ########################################################################
    class Invalid_Temperature < StandardError
    end
    
    # Invalid_Scale is a custom Standard Error for invalid scales
    ########################################################################
    class Invalid_Scale < StandardError
    end

    # isValid() checks if given parameters are valid
    # Input: degrees, a float; scale, a string
    # Output: throws Invalid_Temperature if below 0 K
    #         throws Invalid_Scale if given scale does
    #         exist
    ######################################################
    def isValid(degrees, scale)
      invalid_temp = "#{degrees} #{scale} is below 0 K"
      invalid_scale = "Temperature Scale #{scale} is invalid"
      if scale =~ /f/ then
        Kernel::raise Invalid_Temperature, invalid_temp if degrees < -459.67
      elsif scale =~ /c/ then
        Kernal::raise Invalid_Temperature, invalid_temp if degrees < -273.15
      elsif scale =~ /k/ then
        Kernel::raise Invalid_Temperature, invalid_temp if degrees < 0
      else
        Kernel::raise Invalid_Scale, invalid_scale
      end      
    end

    # initialize() intializes Temperature object
    # Input: degrees, a float; scale, a string
    # Returns: Temperature object if valid parameters
    #         else exception
    ######################################################
    def initialize(degrees, scale)
      scale = scale.downcase
      isValid(degrees, scale)
      @degrees, @scale = degrees, scale
    end

    attr_reader :degrees, :scale

    # raise()
    # Input: delta, a float
    # Returns: new Temperature with risen degrees
    ######################################################
    def raise(delta)
      Temperature.new(@degrees + delta, @scale)
    end

    # lower()
    # Input: delta, a float
    # Returns: new Temperature with delta degrees less
    #          or exception if new temperature is lower
    #          than 0 K
    ######################################################
    def lower(delta)
      Temperature.new(@degrees - delta, @scale)
    end

    # getFahrenheit() returns Fahrenheit temperature
    # Input: none
    # Returns: new Temperature with same temperature
    #          in new scale
    ######################################################
    def getFahrenheit()
      if scale =~ /f/ then
        Temperature.new(@degrees, @scale)
      elsif scale =~ /c/ then
        Temperature.new(@degrees * (9.0/5) + 32, "f")
      else
        Temperature.new((@degrees + 273.15) * (9.0/5) + 32, "f")
      end
    end
    
    # getCelsius() returns Celsius temperature
    # Input: none
    # Returns: new Temperature with same temperature
    #          in new scale
    ######################################################
    def getCelsius()
      if scale =~ /f/ then
        Temperature.new((@degrees-32)*(5.0/9), "c")
      elsif scale =~ /c/ then
        Temperature.new(@degrees, @scale)
      else
        Temperature.new(@degrees - 273.15, "c")
      end
    end

    # getKelvin() returns Kelvin temperature
    # Input: none
    # Returns: new Temperature with same temperature
    #          in new scale
    ######################################################    
    def getKelvin()
      if scale =~ /f/ then
        Temperature.new((@degrees-32)*(5.0/9)+273.15, "k")
      elsif scale =~ /c/ then
        Temperature.new(@degrees + 273.15, "k")
      else
        Temperature.new(@degrees, @scale)   
      end
    end

    # read() reads in user input
    # Input: none
    # Returns: new Temperature according to user input
    #          if not valid, an exception
    ######################################################
    def self.read()
      rawText = gets
      splitText = rawText.split

      degrees = splitText[0].to_f
      scale = splitText[1]

      Temperature.new(degrees, scale)
    end    

    # to_s() allows for pretty printing of object
    # Input: none
    # Returns: formatted String with degrees and scale
    ######################################################
    def to_s
      "#{@degrees.round(2)} #{@scale}"
    end

    # equals() shows equality
    # Input: other_object
    # Returns: true if equal, else false
    ######################################################
    def equals(other_object)
      if !(other_object.instance_of? Temperature) then
        false
      else
        (other_object.getKelvin().degrees == self.getKelvin().degrees)
      end
    end

    # lessthan() shows inequality
    # Input: other_object
    # Returns: true if self is less than other
    ######################################################
    def lessthan(other_object)
      if !(other_object.instance_of? Temperature) then
        false
      else
        (self.getKelvin().degrees < other_object.getKelvin().degrees)
      end
    end
      
    
  end

end
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ ruby temp_tester.rb
Enter baseTemp: 
12 F
Enter limitTemp: 
40 F
Enter stepValue: 
2
12.0 f  -11.11 c  262.04 k
14.0 f  -10.0 c  263.15 k
16.0 f  -8.89 c  264.26 k
18.0 f  -7.78 c  265.37 k
20.0 f  -6.67 c  266.48 k
22.0 f  -5.56 c  267.59 k
24.0 f  -4.44 c  268.71 k
26.0 f  -3.33 c  269.82 k
28.0 f  -2.22 c  270.93 k
30.0 f  -1.11 c  272.04 k
32.0 f  0.0 c  273.15 k
34.0 f  1.11 c  274.26 k
36.0 f  2.22 c  275.37 k
38.0 f  3.33 c  276.48 k
40.0 f  4.44 c  277.59 k
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ ruby temp_tester.rb
Enter baseTemp: 
40 F
Enter limitTemp: 
20  20 F
Enter stepValue: 
-5
40.0 f  4.44 c  277.59 k
35.0 f  1.67 c  274.82 k
30.0 f  -1.11 c  272.04 k
25.0 f  -3.89 c  269.26 k
20.0 f  -6.67 c  266.48 k
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ ruby temp_tester.rb
Enter baseTemp: 
- -2 K
-2.0 k is below 0 K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ ruby temp_tester.rb
Enter baseTemp: 
-2000 F
-2000.0 f is below 0 K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ ruby temp_tester.rb
Enter baseTemp: 
200 Y
Temperature Scale y is invalid
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ruby[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ruby[00m$ exit

Script done on 2020-04-15 17:08:10-0400
