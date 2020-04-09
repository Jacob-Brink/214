

namer: namer.o NameModule.o 
	f90 NameModule.o namer.o -o namer

NameModule.o: NameModule.f90
	f90 -c NameModule.f90

namemodule.mod: NameModule.f90
	f90 -c NameModule.f90

namer.o: namer.f90 namemodule.mod
	f90 -c namer.f90

clean:
	rm -f namer *.o *~ *# *.mod

