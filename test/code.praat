echo Checking code updates...

code$ < ../dwtools/Strings_extensions.cpp
assert not index (code$, "Get string...")   ; 2012-08-11

code$ < ../external/GSL/Makefile
assert not index (code$, "CFLAGS")   ; 2012-08-08

code$ < ../dwsys/regularexp.cpp
assert not index (code$, "'0' }")   ; 2012-08-07

printline OK