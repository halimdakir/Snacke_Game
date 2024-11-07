.section .text
.global start_game

start_game:
    # Initial setup, position the snake in the middle of the board, place the first apple, etc.
    # Initialize loop variables, direction of snake, game status flags, etc.

    # Game loop starts here
    .loop_start:
        call board_get_key       # Get user input from keyboard
        cmp $-1, %eax            # Check if a key was pressed
        je .no_key_pressed       # If no key is pressed, jump to continue in the same direction

        # Check for specific key presses and update direction
        cmp $258, %eax  # Check if the 'down' arrow key was pressed
        je .move_down
        cmp $259, %eax  # Check if the 'up' arrow key was pressed
        je .move_up
        cmp $260, %eax  # Check if the 'left' arrow key was pressed
        je .move_left
        cmp $261, %eax  # Check if the 'right' arrow key was pressed
        je .move_right

    .no_key_pressed:
        # Continue movement in the last known direction
        # This needs to be fleshed out based on last direction variable

    .move_down:
        # Update snake's position moving down
        # Calculate new position
        jmp .update_game

    .move_up:
        # Update snake's position moving up
        jmp .update_game

    .move_left:
        # Update snake's position moving left
        jmp .update_game

    .move_right:
        # Update snake's position moving right
        jmp .update_game

    .update_game:
        # Collision detection
        # Check if the snake has hit itself or the boundary
        # Check if the snake has eaten an apple
        # Possibly place a new apple if needed
        # Redraw the game state
        # Move the snake forward based on the current direction
        # Check for game over conditions
        # If game is over, exit the loop, otherwise continue
        # Refresh the display, if using ncurses, you might need to refresh the window here
        jmp .loop_start  # Continue the game loop

    # Game over handling
    call game_exit   # Clean up game state, display game over message, etc.
    ret

exit_game:
    # Proper exit and clean up
    call game_exit
    mov $0, %edi      # Set exit status
    mov $60, %eax     # syscall number for exit
    syscall           # Exit the program
