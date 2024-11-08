.global _start       # Make _start visible to the linker
.extern print        # Declare print as an external function

.section .text
_start:
    # Call the print function
    call print

    # Exit the program
    movl $1, %eax      # syscall number for exit (1)
    xorl %ebx, %ebx    # return code 0
    int $0x80          # call kernel




-----------------
.global print        # Make print visible to the linker

.section .data
message:
    .ascii "Hello, World!\n"
    len = . - message  # Calculate the length of the message

.section .text
print:
    # Write message to stdout
    movl $4, %eax      # syscall number for sys_write (4)
    movl $1, %ebx      # file descriptor for stdout (1)
    movl $message, %ecx  # pointer to message
    movl $len, %edx    # length of message
    int $0x80          # call kernel

    ret                # Return to the caller


---------------
as -o start.o start.asm
as -o print.o print.asm
ld -o program start.o print.o
./program
