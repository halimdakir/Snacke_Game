.section .text
.global _start

_start:
    # Call C function to initialize the game environment
    call board_init

    # Setup default game parameters or parse them if required
    mov $5, %edi       # Default snake length
    mov $3, %esi       # Default number of apples

    # Start the actual game
    call start_game

    # Cleanup after game ends
    call game_exit

    # Exit the program
    mov $0, %edi       # Exit status
    mov $60, %eax      # syscall number for sys_exit
    syscall            # perform the system call
