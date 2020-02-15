-- ---------------------------------------------------------------------------
-- CMPS 3500
-- vowels.adb (filename must match outer procedure name)
-- compile only:            $ gcc -c vowels.adb
-- compile and link:        $ gnatmake vowels.adb
-- execute:                 $ ./vowels
-- --------------------------------------------------------------------------
-- This program counts the number of vowels in a series of 5 characters 
-- input by the user

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure vowels.adb is
	Letter 		: Character;
	Vowel_Count : Integer := 0;
	Y_Count 	: Integer := 0;
begin
	-- this loop is to ask user for 5 characters
	for i in 1 .. 5 loop
	    Put("Please enter a character = ");
		Get(Letter);
		case Letter is
			when 'A'|'E'|'I'|'O'|'U'|'a'|'e'|'i'|'o'|'u' =>
				Vowel_Count := Vowel_Count + 1;
			
			when others =>
				null;
		
		end case;
	end loop;
	
	Put("Total number of vowels = "); Put(Vowel_Count); New_Line;

end vowels;                                              