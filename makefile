#Predefined variables
CC = gcc
CCLINK = $(CC)
CFLAGS = -g -Wall -std=c99
OBJS = main.o file0.o file1.o file2.o file3.o file4.o
EXEC = prog.exe
RM = rm -rf *.o *.exe

###### Rules #######

all: $(OBJS)
	$(CCLINK) $(OBJS) -o $(EXEC)

#Short syntax - make performs $(CC) $(CFLAGS) -c TARGET.c by default
main.o: main.c file0.h file1.h file2.h file3.h file4.h

file0.o: file0.c file0.h file1.h file4.h

file1.o: file1.c file0.h file1.h file2.h file3.h

file2.o: file2.c file0.h file1.h file2.h

file3.o: file3.c file1.h file3.h file4.h

file4.o: file4.c file2.h file3.h file4.h

clean:
	$(RM)