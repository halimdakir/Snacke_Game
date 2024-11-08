.section .text
.globl _start

_start:
    call board_init        # Initialize the board

    # Draw an initial snake position at (10, 10)
    movl $10, %edi         # Y position
    movl $10, %esi         # X position
    movl $42, %edx         # Character to draw ('*' is 42 in ASCII)
    call draw_point        # Draw the character

    # Add a loop or wait to see the result
    jmp .                  # Infinite loop to keep display open

    # Cleanup (this will not execute due to the infinite loop above)
    call endwin            # Properly end ncurses mode
