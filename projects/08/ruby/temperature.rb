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
      def message
        "Temperature is invalid"
      end
    end

    class Invalid_Scale < StandardError
      def message
        "Temperature Scale is invalid"
      end
    end
    
    def isValid(degrees, scale)
      if scale =~ /f/ then
        raise Invalid_Temperature if degrees < -459.67        
      elsif scale =~ /c/ then
        raise Invalid_Temperature if degrees < -273.15
      elsif scale =~ /k/ then
        raise Invalid_Temperature if degrees < 0
      else
        raise Invalid_Scale;
      end      
    end

    def setup(degrees, scale)
      isValid(degrees, scale)
      @degrees, @scale = degrees, scale;
    end
    
    def initialize(degrees, scale)
      setup(degrees, scale)
    end

    attr_reader :degrees, :scale

    def raise(old_temp, delta)
      Temperature.new(old_temp.degrees + delta, old_temp.scale)
    end

    def lower(old_temp, delta)
      Temperature.new(old_temp.degrees - delta, old_temp.scale)
    end
    
    def getFahrenheit(old_temp)
      if scale =~ /f/ then
        old_temp
      elsif scale =~ /c/ then
        Temperature.new(old_temp.degrees * (9.0/5) + 32, "f")
      else
        Temperature.new((old_temp.degrees + 273.15) * (9.0/5) + 32, "f")
      end
    end

    def getCelsius(old_temp)
      if scale =~ /f/ then
        Temperature.new((old_temp.degrees-32)*(5.0/9), "c")
      elsif scale =~ /c/ then
        old_temp
      else
        Temperature.new(old_temp.degrees - 273.15, "c")
      end
    end

    def getKelvin(old_temp)
      if scale =~ /f/ then
        Temperature.new((old_temp.degrees-32)*(5.0/9)+273.15, "k")
      elsif scale =~ /c/ then
        Temperature.new(old_temp.degrees + 273.15, "k")
      else
        old_temp                         
      end
    end
    
    def read()
      rawText = gets
      splitText = rawText.split

      degrees = splitText[0].to_f
      scale = splitText[1]

      setup(degrees, scale)
    end    
    
    def print
      printOut = "#{@degrees.round(2)} #{@scale}"
      puts printOut
      printOut
    end

    def equals(other_object)
      if ~(other_object.instanceof? Temperature) then
        false
      else
        (getKelvin(other_object).degrees == self.getKelvin(other_object).degrees)
      end
    end

    def lessthan(other_object)
      if ~(other_object.instanceof? Temperature) then
        false
      else
        (self.getKelvin(other_object).degrees < getKelvin(other_object).degrees)
      end
    end
      
    
  end

end
