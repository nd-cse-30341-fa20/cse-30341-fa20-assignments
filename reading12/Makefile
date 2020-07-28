CC=	gcc
CFLAGS=	-Wall -g -std=gnu99
LIBS=	

test:	test-quiz test-program

program:    program.c
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

test-quiz:

test-program: program
	curl -sLO https://raw.githubusercontent.com/nd-cse-30341-fa20/cse-30341-fa20-assignments/master/reading12/test_program.sh
	chmod +x test_program.sh
	./test_program.sh

clean:
	rm -f program
