# temperature.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Jacob Brink
# Date: 4/15/2020
# Project: 8
####################################################

module Weather
 
  class Temperature

    class Invalid_Temperature < StandardError
    end

    class Invalid_Scale < StandardError
    end
    
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

    def setup(degrees, scale)
      isValid(degrees, scale)
      @degrees, @scale = degrees, scale
    end
    
    def initialize(degrees, scale)
      self.setup(degrees, scale)
    end

    attr_reader :degrees, :scale

    def raise(delta)
      Temperature.new(@degrees + delta, @scale)
    end

    def lower(delta)
      Temperature.new(@degrees - delta, @scale)
    end
    
    def getFahrenheit()
      if scale =~ /f/ then
        Temperature.new(@degrees, @scale)
      elsif scale =~ /c/ then
        Temperature.new(@degrees * (9.0/5) + 32, "f")
      else
        Temperature.new((@degrees + 273.15) * (9.0/5) + 32, "f")
      end
    end

    def getCelsius()
      if scale =~ /f/ then
        Temperature.new((@degrees-32)*(5.0/9), "c")
      elsif scale =~ /c/ then
        Temperature.new(@degrees, @scale)
      else
        Temperature.new(@degrees - 273.15, "c")
      end
    end

    def getKelvin()
      if scale =~ /f/ then
        Temperature.new((@degrees-32)*(5.0/9)+273.15, "k")
      elsif scale =~ /c/ then
        Temperature.new(@degrees + 273.15, "k")
      else
        Temperature.new(@degrees, @scale)   
      end
    end
    
    def read()
      rawText = gets
      splitText = rawText.split

      degrees = splitText[0].to_f
      scale = splitText[1]

      setup(degrees, scale)
    end    
    
    def to_s
      "#{@degrees.round(2)} #{@scale}"
    end

    def equals(other_object)
      if !(other_object.instance_of? Temperature) then
        false
      else
        (other_object.getKelvin().degrees == self.getKelvin().degrees)
      end
    end

    def lessthan(other_object)
      if !(other_object.instance_of? Temperature) then
        false
      else
        (self.getKelvin().degrees < other_object.getKelvin().degrees)
      end
    end
      
    
  end

end
