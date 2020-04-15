-- name_package.ads declares the Name_Package type and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/10/2020
-- Lab: 8
--------------------------------------------------------------


package Temp_Package is
   
   type ScaleType is (F, C, K);
   
   type Temperature is private;
   
   
  ----------------------------------------------
  -- IsValid returns true if valid temperature
  -- Receive: Degree in Float, Scale in String                     .            
  -- Return: true if valid, else false
  ----------------------------------------------
  function IsValid(Degree : in Float; Scale : in String) return Boolean;
   
   
  ----------------------------------------------
  -- Init initializes a Temperature variable          
  -- Receive: TheTemperature , the Temperature variable;          
  --          Degree, a Float
  --          Scale, a String
  -- Return: TheTemperature , its fields set to First, 
  --               Middle, and Last.     
  ----------------------------------------------
  procedure Init(TheTemperature : out Temperature; Degree : in Float; Scale : in String);

  ----------------------------------------------
  -- getDegree(Temperature) retrieves Temperature.myDegree        
  -- Receive: TheTemperature , a Temperature.                      
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature .Degree.                     
  ----------------------------------------------
  function getDegree( TheTemperature : in Temperature) return Float;

  ----------------------------------------------
  -- getScale(Temperature) retrieves Temperature as a String 
  -- Receive: TheTemperature , a Temperature.        
  -- PRE: TheTemperature  has been initialized.
  -- Return: TheTemperature .Scale. 
  ----------------------------------------------
  function getScale( TheTemperature : in Temperature) return ScaleType;

  ----------------------------------------------
  -- getFahrenheit(Temperature) retrieves Temperature in Fahrenheit       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Fahrenheit.                        
  ----------------------------------------------
  function getFahrenheit(TheTemperature : in Temperature) return Temperature;

  ----------------------------------------------
  -- getCelsius(Temperature) retrieves Temperature in Celsius       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Celsius.                        
  ----------------------------------------------
  function getCelsius(TheTemperature : in Temperature) return Temperature;

  ----------------------------------------------
  -- getKelvin(Temperature) retrieves Temperature in Kelvin       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Kelvin.                        
  ----------------------------------------------
  function getKelvin(TheTemperature : in Temperature) return Temperature;
  
  
  ----------------------------------------------
  -- getKelvin(Temperature) retrieves Temperature in Kelvin       
  -- Receive: TheTemperature , a Temperature.                    
  -- PRE: TheTemperature  has been initialized.            
  -- Return: TheTemperature in Kelvin.                        
  ----------------------------------------------
  procedure ReadTemperature(TheTemperature : out Temperature);

  ----------------------------------------------
  -- Put(Temperature) displays a Temperature value.        
  -- PRE: TheTemperature  has been initialized.             
  -- Receive: TheTemperature , a Temperature.               
  -- Output: TheTemperature , to the screen.                
  ----------------------------------------------
  procedure Put(TheTemperature : in Temperature);

  ----------------------------------------------
  -- increase(Temperature) increases temperature!
  -- PRE: TheTemperature  has been initialized.             
  -- Receive: TheTemperature , a Temperature, amount a Number.               
  -- POST: TheTemperature is modified to have risen temperature                
  ----------------------------------------------
  procedure increase(TheTemperature : out Temperature; Amount : Float);
  
  ----------------------------------------------
  -- lower(Temperature) lowers temperature!
  -- PRE: TheTemperature  has been initialized.             
  -- Receive: TheTemperature , a Temperature, amount a Number.               
  -- POST: TheTemperature is modified to have risen temperature                
  ----------------------------------------------
  procedure lower(TheTemperature : out Temperature; Amount : Float);
  
  ----------------------------------------------
  -- equals(aTemperature, bTemperature)
  -- PRE: aTemperature and bTemperature are intitialized             
  -- Receive: aTemperature and bTemperature               
  -- Returns: true if equal, else false                
  ----------------------------------------------
  function equals(ATemperature, BTemperature : in Temperature) return Boolean;

  ----------------------------------------------
  -- lessthan(aTemperature, bTemperature)
  -- PRE: aTemperature and bTemperature are intitialized             
  -- Receive: aTemperature and bTemperature               
  -- Returns: true if less-than, else false                
  ----------------------------------------------
  function lessthan(ATemperature, BTemperature : in Temperature) return Boolean;  
  
  private
  
  type Temperature is
     record
	Degree : Float;
	Scale : ScaleType;
     end record;
	
  
end Temp_Package;
