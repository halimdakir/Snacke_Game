.extern board_init
.extern start_game
.extern printf

.section .data
    default_snake_length: .long 5       # Default initial length of the snake
    default_apple_count:  .long 2       # Default number of apples on the screen
    message: .asciz "Hello world!\n"

.section .text
.global _start                          # Define _start as global so it's recognized as the entry point


# _start:
# Entry point of the program. Initializes parameters and calls start_game.
_start:
    mov $1, %rax            # Syscall number for write
    mov $1, %rdi            # File descriptor 1 is stdout
    mov $message, %rsi      # Address of string
    mov $14, %rdx           # Length of string (14 bytes)
    syscall                 # Invoke the syscall

    call board_init
    # Set up parameters for start_game (snake length and apple count)
    # movl default_snake_length, %edi     # Move snake length into %edi (1st argument in x86-64)
    # movl default_apple_count, %esi      # Move apple count into %esi (2nd argument in x86-64)

    call start_game                     # Call start_game with the initial parameters

    # Exit the program (return from _start)
    mov $60, %rax                       # syscall number for exit
    xor %rdi, %rdi                      # exit code 0
    syscall                             # make the system call to exit
