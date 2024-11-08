section .data
    snake_length dd 5       ; Length of the snake
    snake_x resb 256        ; Snake x positions
    snake_y resb 256        ; Snake y positions
    direction db 'r'        ; Initial direction (r, l, u, d)
    key_pressed db 0        ; Last key pressed

section .bss
    screen resb 4000        ; Screen buffer for 80x50 screen

section .text
extern getch, mvaddch, initscr, endwin, refresh, clear
global _start

_start:
    call initscr            ; Start ncurses mode
    call clear              ; Clear the screen

    ; Initialize snake starting position in the middle of the board
    mov byte [snake_x], 40
    mov byte [snake_y], 12

    ; Game loop
game_loop:
    call getch              ; Get user input non-blocking
    cmp eax, 'q'            ; Check if 'q' is pressed to quit
    je game_over
    mov [key_pressed], al  ; Store the last key pressed

    ; Handle changing directions
    mov al, [key_pressed]
    cmp al, 'w'            ; Up
    je set_direction_up
    cmp al, 's'            ; Down
    je set_direction_down
    cmp al, 'a'            ; Left
    je set_direction_left
    cmp al, 'd'            ; Right
    je set_direction_right

    ; Update snake position based on direction
    ; This example moves right by default
    mov al, [snake_x]
    inc al
    mov [snake_x], al

    ; Draw snake head
    mov al, [snake_x]
    mov bl, [snake_y]
    mov ecx, 'O'
    call mvaddch

    call refresh            ; Refresh screen to show updates

    jmp game_loop           ; Repeat the loop

game_over:
    call endwin             ; End ncurses mode
    mov eax, 1              ; Exit syscall
    xor ebx, ebx            ; Status 0
    int 0x80                ; Call kernel

; Direction setting stubs
set_direction_up:
    mov [direction], 'u'
    jmp game_loop

set_direction_down:
    mov [direction], 'd'
    jmp game_loop

set_direction_left:
    mov [direction], 'l'
    jmp game_loop

set_direction_right:
    mov [direction], 'r'
    jmp game_loop

