SDKROOT := $(shell xcrun --sdk macosx --show-sdk-path)
ARCH := arm64

hello: hello.o
	ld -o hello hello.o -e _start -arch $(ARCH) -syslibroot $(SDKROOT) -lSystem

hello.o: hello.s
	as -o hello.o hello.s

.PHONY: fast
fast: hello
	./hello
