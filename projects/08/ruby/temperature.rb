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
