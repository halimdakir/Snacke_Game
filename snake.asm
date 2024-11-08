.section .note.GNU-stack,"",@progbits

.section ,data
message: .asciz "Inside snake!\n"

.section .text
.global start_game

# _start:
# Entry point of the program. Initializes parameters and calls start_game.
start_game:
    mov $1, %rax            # Syscall number for write
    mov $1, %rdi            # File descriptor 1 is stdout
    mov $message, %rsi      # Address of string
    ret
    
