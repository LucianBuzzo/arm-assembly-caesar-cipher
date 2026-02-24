hello: hello.o
	ld -o hello hello.o -e _start

hello.o: hello.s
	as -o hello.o hello.s

.PHONY: fast
fast: hello
	./hello
