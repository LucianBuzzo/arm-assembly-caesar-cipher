//
// Assembler program to print "Hello World!"
// to stdout on macOS (ARM64).
//
// X0-X2 - parameters to macOS syscall services
// X16 - macOS syscall number
//
.global _start             // Provide program starting address to linker
.align 2

// Setup the parameters to print hello world
// and then call macOS to do it.

_start: mov X0, #1     // 1 = StdOut
        adr X1, helloworld // string to print
        mov X2, #16     // byte length of "Hello it's me!\n\n"
        mov X16, #4     // macOS write syscall
        svc 0     // Call macOS to output the string

// Setup the parameters to exit the program
// and then call macOS to do it.

        mov     X0, #0      // Use 0 return code
        mov     X16, #1     // Service command code 1 terminates this program
        svc     0           // Call MacOS to terminate the program

helloworld:      .ascii  "Hello it's me!\n\n"