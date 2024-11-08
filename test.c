#include <ncurses.h>

int main() {
    initscr();            // Initialize the ncurses screen
    printw("ncurses is working!\n");
    refresh();            // Display on the screen
    getch();              // Wait for user input
    endwin();             // End ncurses mode
    return 0;
}
