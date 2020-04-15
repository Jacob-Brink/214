Script started on 2020-04-15 18:37:29-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ cat temp_package.adb[Ks
-- name_package.ads declares the Name_Package type and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Jacob Brink
-- Date: 4/15/2020
-- Project: 8
--------------------------------------------------------------


package Temp_Package is
   
   type ScaleType is (F, C, K);
   
   Invalid_Temperature : exception;
   Invalid_Scale : exception;
   
   type Temperature is private;
   
   
  ----------------------------------------------
  -- IsValidValue returns true if not below 0 K
  -- Receive: Degree in Float, Scale in String                     .            
  -- Return: true if valid, else false
  ----------------------------------------------
   function IsValidValue(Degree : in Float; ThisScale : in ScaleType) return Boolean;
   
  ----------------------------------------------
  -- IsValid returns true if valid temperature
  -- Receive: Degree in Float, Scale in String                     .            
  -- Return: true if valid, else false
  ----------------------------------------------
   procedure IsValid(Degree : in Float; Scale : in String);
   
   
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
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ cat temp_package.adb[Kb[K[K[K[K.ads[Kd[Kb
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
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ cat tempt[K_tester.adb
-- name_tester.adb "test-drives" the Name type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: Jacob Brink
-- Date: 4/15/2020
-- Project: 8
----------------------------------------------

with Ada.Text_IO; with Ada.Float_Text_IO; With Temp_Package;
use Ada.Text_IO; use Ada.Float_Text_IO; Use Temp_Package;

procedure temp_tester is
   BaseTemp, LimitTemp : Temp_Package.Temperature;
   StepValue : Float;
begin
   -- get user input
   Put("Enter BaseTemp: "); ReadTemperature(BaseTemp);
   Put("Enter LimitTemp: "); ReadTemperature(LimitTemp);
   Put("Enter StepValue: "); Get(StepValue);
   
   New_Line;
   
   -- if StepValue is greater than 0 loop up else loop down
   if StepValue > 0.0 then
      while (lessthan(BaseTemp, LimitTemp) or Equals(BaseTemp, LimitTemp))
      loop
	 Put(GetFahrenheit(BaseTemp)); Put (" "); Put(GetCelsius(BaseTemp)); Put(" "); Put(GetKelvin(BaseTemp)); New_Line;
	 increase(BaseTemp, StepValue);
      end loop;
   elsif StepValue < 0.0 then -- if step value is negative loop down
      while (lessthan(LimitTemp, BaseTemp) or Equals(BaseTemp, LimitTemp))
      loop
	 Put(GetFahrenheit(BaseTemp)); Put (" "); Put(GetCelsius(BaseTemp)); Put(" "); Put(GetKelvin(BaseTemp)); New_Line;
	 increase(BaseTemp, StepValue);
      end loop;
   else
      Put("StepValue cannot be 0");
   end if;
   
exception
   when Invalid_Scale =>
      begin
	 Put("Given scale is invalid");
      end;
   when Invalid_Temperature => 
      begin
	 Put("Given temperature cannot exist");
      end;
	
      
   
end temp_tester;
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ make
make: 'temp_tester' is up to date.
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ cat Makefile 
# Makefile for GNAT (Ada) compilation

TARGET = temp_tester
PACKAGE = temp_package

CC = gcc
CFLAGS = -c -gnata

# linking step
$(TARGET): $(TARGET).ali $(PACKAGE).o
	gnatbind $(TARGET).ali
	gnatlink $(TARGET).ali

# compile program
$(TARGET).ali: $(TARGET).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(TARGET).adb

# compile package
$(PACKAGE).o: $(PACKAGE).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(PACKAGE).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali *.c

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ ./temp_tester 
Enter BaseTemp: 10 f
Enter LimitTemp: 20 F
Enter StepValue: 2

10.00 F -12.22 C 260.93 K
12.00 F -11.11 C 262.04 K
14.00 F -10.00 C 263.15 K
16.00 F -8.89 C 264.26 K
18.00 F -7.78 C 265.37 K
20.00 F -6.67 C 266.48 K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ ./temp_tester 
Enter BaseTemp: 10 c
Enter LimitTemp: 20 K
Enter StepValue: -5 10  20

50.00 F 10.00 C 283.15 K
14.00 F -10.00 C 263.15 K
-22.00 F -30.00 C 243.15 K
-58.00 F -50.00 C 223.15 K
-94.00 F -70.00 C 203.15 K
-130.00 F -90.00 C 183.15 K
-166.00 F -110.00 C 163.15 K
-202.00 F -130.00 C 143.15 K
-238.00 F -150.00 C 123.15 K
-274.00 F -170.00 C 103.15 K
-310.00 F -190.00 C 83.15 K
-346.00 F -210.00 C 63.15 K
-382.00 F -230.00 C 43.15 K
-418.00 F -250.00 C 23.15 K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ ./temp_tester 
Enter BaseTemp: 20 k
Enter LimitTemp: 44 C
Enter StepValue: 30

-423.67 F -253.15 C 20.00 K
-369.67 F -223.15 C 50.00 K
-315.67 F -193.15 C 80.00 K
-261.67 F -163.15 C 110.00 K
-207.67 F -133.15 C 140.00 K
-153.67 F -103.15 C 170.00 K
-99.67 F -73.15 C 200.00 K
-45.67 F -43.15 C 230.00 K
 8.33 F -13.15 C 260.00 K
62.33 F 16.85 C 290.00 K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ ./temp_tester 
Enter BaseTemp: 123 f w
Given scale is invalid
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ ./temp_tester 
Enter BaseTemp: -2000 f
Given temperature cannot exist
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ ./temp_tester 
Enter BaseTemp: -2 k
Given temperature cannot exist
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ ./temp_tester 
Enter BaseTemp: -1000 C
Given temperature cannot exist
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/ada[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/ada[00m$ exit

Script done on 2020-04-15 18:40:05-0400
