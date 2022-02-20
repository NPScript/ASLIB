example: clean
	as -g example.S -o example.o
	ld example.o -o example

clean:
	- rm example.o example
