section .text
global _start

_start:
    call init_board   ; Initialize the game board with ncurses

    ; Example to draw a point at position (10, 10)
    mov edi, 10       ; x position
    mov esi, 10       ; y position
    mov edx, '*'      ; symbol to draw
    call draw_point   ; Draw the point

    ; Wait for a key press to exit
    xor eax, eax
    call getch
    call endwin       ; End ncurses mode

    ; Exit the program
    mov eax, 60       ; syscall number for exit
    xor edi, edi      ; exit status 0
    syscall           ; call the kernel
