all: compile run clean

compile: dotproduct.adb countvowels.adb 
	gnatmake -gnatwl dotproduct.adb
	gnatmake -gnatwl countvowels.adb

run: dotproduct countvowels
	./dotproduct
	./countvowels

clean: 
	rm -rf testada dotproduct countvowels
	rm -rf *.ali 
	rm -rf *.o
