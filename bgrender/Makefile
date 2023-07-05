CC = gcc
CFLAGS = -g
LIBS = -lSDL2 -lm -lGL -lGLU -lglut -lopenal -lGLEW -lX11 -lXrender -lXcomposite -lXext -lpcre -lsqlite3 -lncurses

bgrender: bgrender.c
	$(CC) $(CFLAGS) bgrender.c $(LIBS) -o bgrender

.PHONY: clean

clean:
	rm -f bgrender

