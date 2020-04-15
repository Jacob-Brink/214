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
