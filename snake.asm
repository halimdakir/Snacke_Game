section .text
global _start

_start:
    call board_init     ; Call the initialization function from C

    ; Assuming the snake starts at (10, 10)
    mov edi, 10         ; x coordinate
    mov esi, 10         ; y coordinate
    call draw_point     ; Draw the initial point of the snake

    ; More game logic here...

game_loop:
    ; Update game logic
    ; For instance, clear the board and redraw based on updated snake position
    call clear_board
    ; Redraw the snake
    ; Example of moving snake down
    add esi, 1
    call draw_point

    ; Continue the game loop
    ; Example of a simple wait, user input, etc.
    jmp game_loop

game_over:
    ; Clean up code, end ncurses session, etc.
    call endwin
    mov eax, 60        ; syscall for exit
    xor edi, edi       ; exit status 0
    syscall
