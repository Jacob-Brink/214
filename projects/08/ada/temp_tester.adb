-- name_tester.adb "test-drives" the Name type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: Jacob Brink
-- Date: 4/10/2020
-- Lab: 8
----------------------------------------------

with Ada.Text_IO; with Ada.Float_Text_IO; With Temp_Package;
use Ada.Text_IO; use Ada.Float_Text_IO; Use Temp_Package;

procedure temp_tester is
   BaseTemp, LimitTemp : Temp_Package.Temperature;
   StepValue : Float;
begin
   Put("Enter BaseTemp: "); ReadTemperature(BaseTemp); New_Line;
   Put("Enter LimitTemp: "); ReadTemperature(LimitTemp); New_Line;
   Put("Enter StepValue: "); Get(StepValue);
   
   while (lessthan(BaseTemp, LimitTemp))
   loop
      Put(GetFahrenheit(BaseTemp)); Put(GetCelsius(BaseTemp)); Put(GetKelvin(BaseTemp)); New_Line;
      -- Temperature_Package.raise(BaseTemp, StepValue);
   end loop;
   
end temp_tester;
