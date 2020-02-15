--------------------------------------------------------------------------
-- course: cmps3500
-- lab 2
-- date: 02/14/20
-- username: bgarza
-- name: Benjamin Garza
-- description: counting vowels in a file.
-- -----------------------------------------------------------------------
-- CMPS 3500
-- testada.adb (filename must match outer procedure name)
-- compile only:            $ gcc -c testada.adb
-- compile and link:        $ gnatmake testada.adb
-- execute:                 $ ./testada
--------------------------------------------------------------------------
-- Demonstrate Ada's strong typing, static scoping rules, support for arrays, 
-- abstract data types (ADTs), I/O, and parameter passing mechanisms

with Ada.Text_IO;                 -- similar to include
use Ada.Text_IO;                  -- similar to namespace 
with Ada.Integer_Text_IO; 
use Ada.Integer_Text_IO;

procedure dotproduct is             -- outermost procedure is entry point 

    --  start of declaration section 
    package Flt_IO is new Ada.Text_IO.Float_IO(FLOAT); -- a package is like class
    use Flt_IO;

    -- 2-dimensional array 
    type MATRIX is array(INTEGER range 1..3, INTEGER range 1..5) of INTEGER; 
    -- example of aggregate initialization
    grid_x  : MATRIX := ((0,0,0,0,0),
    (0,0,0,0,0),
    (0,0,0,0,0));
    grid_y  : MATRIX := ((0,0,0,0,0),
    (0,0,0,0,0),
    (0,0,0,0,0));

    grid_z  : MATRIX := ((0,0,0,0,0),
    (0,0,0,0,0),
    (0,0,0,0,0));

    --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    -- loads all values from input file to  

    procedure loadMatrices is

        inf : FILE_TYPE;   -- declare file handler

    begin

        Open(inf, In_File, "lab02.in");       -- open file for reading 
        Set_Input(inf);

        -- loop saves first 15 ints from input file to matrix 1 (aka grid_x)
        for i in 1 .. 3 loop
            for j in 1 .. 5 loop
                Get(inf, grid_x(i,j));
            end loop;
        end loop;

        -- loop saves second 15 ints from input file to matrix 2 (aka grid_y)
        for i in 1 .. 3 loop
            for j in 1 .. 5 loop
                Get(inf, grid_y(i,j));
            end loop;
        end loop;

        -- reset input and close file
        Set_Input(Standard_Input);
        Close(inf);

    end loadMatrices; 

    --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    -- demonstrate parameter passing, file I/O, scoping, no compiler coercions 


    procedure writeToFile is

        outf : FILE_TYPE; -- declare file handler

    begin

        Create(outf, Out_File, "lab02.out");  -- create and open file for writing
        Set_Output(outf);                        -- make outf the default output   
        
        -- for each value in matrix 3 (aka grid_z) put to file
        for i in 1 .. 3 loop
            for j in 1 .. 5 loop
                Put(grid_z(i,j), 5);
            end loop;
            New_Line;
        end loop;

        Set_Output(Standard_Output);             -- return to stdout
        Close(outf);

    end writeToFile;

    --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

begin

    -- load values into global matrices
    loadMatrices;      

    -- calculate the dotproduct and save into matrix 3
    for a in 1 .. 3 loop
        for b in 1 .. 5 loop
            grid_z(a,b) := grid_x(a,b) * grid_y(a,b);
        end loop;
    end loop;

    -- write global variable results to file
    writeToFile;

end dotproduct; 
