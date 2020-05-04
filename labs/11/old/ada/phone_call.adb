-- phone_call.adb simulates a phone conversation in Ada.
-- Begun by: Joel Adams, for CS 214 at Calvin College
-- Completed by:
------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure Phone_Call is

 task type Consumer is
 end Consumer;

 task type Marketer is
 end Marketer;

 Kelly : Marketer;
 Chris : Consumer;

 task body Consumer is
 begin
  Put_Line("Hello?");
  Put_Line("This is Chris.");
  Put_Line("Excuse me, but I'm really not interested.");
  Put("I'm hanging up now."); New_Line; Put_Line("Goodbye.");
 end Consumer;

 task body Marketer is
 begin
  Put_Line("Hello, is Chris there?");
  Put("Chris, this is Kelly from the ACME company,"); New_Line;
   Put_Line(" and we're having a special on...");
  Put_Line("But Chris, this is a great deal, and...");
 end Marketer;

begin
 null;
end Phone_Call;
