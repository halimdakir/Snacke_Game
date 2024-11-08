/*********************************************************************
 *
 * Copyright (C) 2003,  Blekinge Institute of Technology
 *
 * Filename:      helpers.c
 * Author:        Simon Kagstrom <ska@bth.se>
 * Description:   Library with helpers for the nibbles game
 *
 * $Id: helpers.c 4937 2005-10-06 12:50:50Z ska $
 *
 *
 ********************************************************************
 *
 * Modification of original:
 * Modified by:   Christoffer Åleskog <cck@bth.se>
 * Modified date: 2024-10-14
 *
 ********************************************************************/

#include <ncurses.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

static WINDOW *p_screen;

int board_get_key(void) {
  int key = getch();

  return key;
}

void board_put_char(int x, int y, int ch) {
  mvprintw(y, x, "%c", ch);
  wrefresh(p_screen);
}

void board_put_str(int x, int y, const char *str) {
  mvprintw(y, x, "%s", str);
  wrefresh(p_screen);
}

void board_init(void) {
  printf("----");
  printw("---Board initialized! Press any key to continue..."); // Debug statement
  srand(time(0));          
  p_screen = initscr();    
  start_color();           
  curs_set(0);             
  noecho();                
  keypad(p_screen, TRUE);  
  nodelay(p_screen, TRUE); 
  printw("Board initialized! Press any key to continue..."); // Debug statement
  refresh(); // Ensure text is shown on the screen
}


void game_exit(void) {
  delwin(p_screen);
  endwin();
  exit(0);
}
