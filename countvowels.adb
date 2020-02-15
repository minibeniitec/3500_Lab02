-- ---------------------------------------------------------------------------
-- course: cmps3500
-- lab 2
-- date: 02/14/20
-- username: bgarza
-- name: Benjamin Garza
-- description: counting vowels in a file.
-- ---------------------------------------------------------------------------
-- CMPS 3500
-- vowels.adb (filename must match outer procedure name)
-- compile only:            $ gcc -c countvowels.adb
-- compile and link:        $ gnatmake countvowels.adb
-- execute:                 $ ./countvowels
-- --------------------------------------------------------------------------
-- This program counts the number of vowels in a series of 5 characters 
-- input by the user

with Ada.Text_IO; 
use Ada.Text_IO;
with Ada.Integer_Text_IO; 
use Ada.Integer_Text_IO;

procedure countvowels is

    Letter 		: Character;
    Vowel_Count : Integer := 0;
    Y_Count 	: Integer := 0;
    inf : FILE_TYPE;   -- declare two file handlers

begin

    Open(inf, In_File, "paragraph.in");       -- open file for reading 
    Set_Input(inf);


    -- this loop reads 1 character at a time from the input file
    loop
        exit when End_Of_File(inf);
        Get(Letter);
        case Letter is
            when 'A'|'E'|'I'|'O'|'U'|'a'|'e'|'i'|'o'|'u' =>
                Vowel_Count := Vowel_Count + 1;
            when 'Y'|'y' =>
                Y_Count := Y_Count + 1;
            when others =>
                null;
        end case;
    end loop;

    -- print all vowel numbers
    Put("The number of vowels (aeiou) in the text located in the input file is "); 
    Put(Vowel_Count, 3); 
    New_Line;
    Put("The number of y's in the text located in the input file is "); 
    Put(Y_Count, 3); 
    New_Line;
    Put("The number of vowels in the text located in the input file is "); 
    Put(Vowel_Count+Y_Count, 3); 
    New_Line;

    -- reset input and close file
    Set_Input(Standard_Input);
    Close(inf);

end countvowels;                                              
