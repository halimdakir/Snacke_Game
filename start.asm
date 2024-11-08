.section .text
.globl _start

_start:
    call board_init    # Call the board initialization function

    # Prepare to print '*' at position (10, 5)
    movl $10, %edi     # Set X position
    movl $5, %esi      # Set Y position
    movl $42, %edx     # ASCII code for '*' (Note: '%' not needed for constants)
    call board_put_char  # Call the function to put a char on the board

    # Infinite loop to keep the display open
    .loop_here:
    jmp .loop_here     # Jump to itself, creating an infinite loop

    # This section would not be reached due to the loop, but typically here:
    # call endwin       # Would clean up the ncurses environment if used

    # Exit the program properly
    movl $60, %eax     # Syscall number for exit
    xorl %edi, %edi    # Exit status 0
    syscall            # System call to exit
