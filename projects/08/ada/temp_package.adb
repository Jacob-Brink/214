-- Temperature_package.adb defines operations for the Temperature type.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/10/2020
-- Project: 8
---------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed, Ada.Float_Text_Io;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed, Ada.Float_Text_Io;

package body Temp_Package is
   
   ----------------------------------------------
   -- IsValidValue returns true if not below 0 K
   -- Receive: Degree in Float, Scale in String                     .            
   -- Return: true if valid, else false
   ----------------------------------------------
   function IsValidValue(Degree : in Float; ThisScale : in ScaleType) return Boolean is
   begin
      if ThisScale = F then
	 return Degree >= -459.67;
      elsif ThisScale = C then
	 return Degree >= -273.15;
      else
	return Degree >= 0.0;
      end if;
   
   end;
   
  
  ----------------------------------------------
  -- IsValid returns true if valid temperature
  -- Receive: Degree in Float, Scale in String                     .            
  -- Return: true if valid, else false
  ----------------------------------------------
   procedure IsValid(Degree : in Float; Scale : in String) is
      ThisScale : ScaleType;
   begin
      begin
	 ThisScale := ScaleType'Value(Scale);
      exception
	 when others => raise Invalid_Scale;
      end;
      
      if not IsValidValue(Degree, ThisScale) then
	 raise Invalid_Temperature;
      end if;
     
   end;  
   
  ----------------------------------------------
  -- Init initializes a Temperature variable          
  -- Receive: TheTemperature , the Temperature variable;          
  --          Degree, a Float
  --          Scale, a String
  -- Return: TheTemperature , its fields set to First, 
  --               Middle, and Last.     
  ----------------------------------------------
  procedure Init(TheTemperature : out Temperature; Degree : in Float; Scale : in String) is
  begin
     IsValid(Degree, Scale);
     
     TheTemperature.Degree := Degree;
     TheTemperature.Scale := ScaleType'Value(Scale);
  end Init;

  ----------------------------------------------
  -- getDegree(Temperature) retrieves Temperature.myDegree        
  -- Receive: TheTemperature , a Temperature.                      
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature .Degree.                     
  ----------------------------------------------
  function getDegree( TheTemperature : in Temperature) return Float is
  begin
    return TheTemperature.Degree;
  end getDegree;

  ----------------------------------------------
  -- getScale(Temperature) retrieves Temperature as a String 
  -- Receive: TheTemperature , a Temperature.        
  -- PRE: TheTemperature  has been initialized.
  -- Return: TheTemperature .Scale. 
  ----------------------------------------------
  function getScale( TheTemperature : in Temperature) return ScaleType is
  begin
     return TheTemperature.Scale;
  end getScale;

  ----------------------------------------------
  -- getFahrenheit(Temperature) retrieves Temperature in Fahrenheit       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Fahrenheit.                        
  ----------------------------------------------
  function getFahrenheit(TheTemperature : in Temperature) return Temperature is
     OldScale : ScaleType := GetScale(TheTemperature);
     OldDegrees : Float := GetDegree(TheTemperature);     
     NewTemperature : Temperature;
  begin
     if OldScale = F then
	Init(NewTemperature, GetDegree(TheTemperature), "f");
     elsif OldScale = C then
	Init(NewTemperature, (OldDegrees * (9.0/5.0) + 32.0), "f");
     elsif OldScale = K then
	Init(NewTemperature, (OldDegrees - 273.15) * (9.0/5.0) + 32.0, "f"); 
     end if;
     return NewTemperature;
  end getFahrenheit;

  ----------------------------------------------
  -- getCelsius(Temperature) retrieves Temperature in Celsius       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Celsius.                        
  ----------------------------------------------
  function getCelsius(TheTemperature : in Temperature) return Temperature is
     OldScale : ScaleType := GetScale(TheTemperature);
     OldDegrees : Float := GetDegree(TheTemperature);     
     NewTemperature : Temperature;
  begin
     if OldScale = F then
	Init(NewTemperature, (OldDegrees - 32.0) * (5.0/9.0), "c");
     elsif OldScale = C then
	Init(NewTemperature, GetDegree(TheTemperature), "c");
     elsif OldScale = K then
	Init(NewTemperature, OldDegrees - 273.15, "c"); 
     end if;
     return NewTemperature;
  end getCelsius;

  ----------------------------------------------
  -- getKelvin(Temperature) retrieves Temperature in Kelvin       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Kelvin.                        
  ----------------------------------------------
  function getKelvin(TheTemperature : in Temperature) return Temperature is
     OldScale : ScaleType := GetScale(TheTemperature);
     OldDegrees : Float := GetDegree(TheTemperature);     
     NewTemperature : Temperature;
  begin
     if OldScale = F then
	Init(NewTemperature, (OldDegrees - 32.0) * (5.0/9.0) + 273.15, "k");
     elsif OldScale = C then
	Init(NewTemperature, OldDegrees + 273.15, "k");
     elsif OldScale = K then
	Init(NewTemperature, GetDegree(TheTemperature), "k"); 
     end if;
     return NewTemperature;
  end getKelvin;
  
  
  ----------------------------------------------
  -- getKelvin(Temperature) retrieves Temperature in Kelvin       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Kelvin.                        
  ----------------------------------------------
  procedure ReadTemperature(TheTemperature : out Temperature) is
     C : Character;
     SpacePosition : Integer := -1;
     Raw : String(1..8) := "        ";
     
     FirstString, SecondString : String(1..8);
     
     Degrees : Float;
     Last : Natural;
  begin
     
     Get_Line(Raw, Last);
     
     for I in Raw'Range
     loop
        C := Raw(I);
	if C = ' ' then
	   SpacePosition := I;
	end if;
	
	exit when C = ' ';
     end loop;
     
     Move(Raw(Raw'First..(SpacePosition-1)), FirstString);
     Move(Raw((SpacePosition+1)..Raw'Last), SecondString);
     
     Degrees := Float'Value(FirstString);
     
     Init(TheTemperature, Degrees, SecondString);     
     
  end ReadTemperature;

  ----------------------------------------------
  -- Put(Temperature) displays a Temperature value.        
  -- PRE: TheTemperature  has been initialized.             
  -- Receive: TheTemperature , a Temperature.               
  -- Output: TheTemperature , to the screen.                
  ----------------------------------------------
  procedure Put(TheTemperature : in Temperature) is
  begin
     Ada.Float_Text_Io.Put(Item => GetDegree(TheTemperature), Aft => 2, Exp => 0);
     Put(" " & ScaleType'Image(GetScale(TheTemperature)));
  end Put;

  ----------------------------------------------
  -- increase(Temperature) raises temperature!
  -- PRE: TheTemperature  has been initialized.             
  -- Receive: TheTemperature , a Temperature, amount a Number.               
  -- POST: TheTemperature is modified to have risen temperature                
  ----------------------------------------------
  procedure increase(TheTemperature : out Temperature; Amount : Float)  is
  begin
     Init(TheTemperature, GetDegree(TheTemperature) + Amount, ScaleType'Image(GetScale(TheTemperature)));
  end increase;
  
  ----------------------------------------------
  -- lower(Temperature) lowers temperature!
  -- PRE: TheTemperature  has been initialized.             
  -- Receive: TheTemperature , a Temperature, amount a Number.               
  -- POST: TheTemperature is modified to have risen temperature                
  ----------------------------------------------
  procedure lower(TheTemperature : out Temperature; Amount : Float)  is
  begin
     Init(TheTemperature, GetDegree(TheTemperature) - Amount, ScaleType'Image(GetScale(TheTemperature)));
  end lower;
  
  ----------------------------------------------
  -- equals(aTemperature, bTemperature)
  -- PRE: aTemperature and bTemperature are intitialized             
  -- Receive: aTemperature and bTemperature               
  -- Returns: true if equal, else false                
  ----------------------------------------------
  function equals(ATemperature, BTemperature : in Temperature) return Boolean is
  begin
     return GetDegree(GetKelvin(ATemperature)) = GetDegree(GetKelvin(BTemperature));
  end equals;

  ----------------------------------------------
  -- lessthan(aTemperature, bTemperature)
  -- PRE: aTemperature and bTemperature are intitialized             
  -- Receive: aTemperature and bTemperature               
  -- Returns: true if less-than, else false                
  ----------------------------------------------
  function lessthan(ATemperature, BTemperature : in Temperature) return Boolean is
  begin
     return GetDegree(GetKelvin(ATemperature)) < GetDegree(GetKelvin(BTemperature));
  end lessthan;
  
  
end Temp_Package;
