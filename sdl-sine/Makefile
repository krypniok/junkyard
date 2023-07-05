CC = gcc
CFLAGS = -g
LIBS = -lm -lSDL2 -lSDL2main

bgrender: sinewave.c
	$(CC) $(CFLAGS) sinewave.c $(LIBS) -o sinewave

.PHONY: clean

clean:
	rm -f sinewave

