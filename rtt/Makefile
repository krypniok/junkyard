CC = gcc
CFLAGS = -g
LIBS = -lSDL2 -lSDL2main -lm -lGL -lGLU -lglut -lGLEW

bgrender: render_to_texture.c
	$(CC) $(CFLAGS) render_to_texture.c $(LIBS) -o render_to_texture

.PHONY: clean

clean:
	rm -f render_to_texture

