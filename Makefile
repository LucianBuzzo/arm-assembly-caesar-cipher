hello: hello.o
	ld -o hello hello.o -e _start

hello.o: hello.s
	as -o hello.o hello.s

fast: hello.o
	make hello.o && make hello && ./hello