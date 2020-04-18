CFLAGS =  -c -g

f90Max: max.o listModule.o
	f90 max.o listModule.o -g -o f90Max

max.o: max.f90 listmodule.mod
	f90 $(CFLAGS) max.f90

listModule.o: listModule.f90
	f90 $(CFLAGS) listModule.f90

listmodule.mod: listModule.f90
	f90 $(CFLAGS) listModule.f90

clean:
	rm -f f90Max *.o *.mod *~ *#
