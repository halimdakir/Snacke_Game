# Makefile for the Snake lab.
# This is a modified version of the nibbles 
# lab by Simon Kågström and Håkan Grahn
#
# Author: Christoffer Åleskog

all: snake_asm start_asm_start

# Rule for compiling C source
.c.o:
	gcc -Os -Wall -g -c $<

# Rule for compiling assembly source
snake.o: snake.asm
	as -gstabs $^ -o $@

start.o: start.asm
	as -gstabs $^ -o $@

# ASM game with main.o (entry point from main.c)
snake_asm: main.o snake.o helpers.o
	gcc $^ -o $@ -lncurses

# ASM game with start.o (entry point from start.asm)
snake_asm_start: start.o snake.o helpers.o workaround.o
	gcc -nostdlib $^ -o $@ -lc -lncurses

# Clean up build artifacts
clean:
	rm -f *~
	rm -f *.o
	rm -f snake snake_asm
