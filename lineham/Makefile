CC = gcc
CFLAGS = -g
LIBS = -O3 -lm -lGLEW -lGL -lGLU -lglut -lX11 -lXxf86vm -lXrandr -lXi -lXinerama -lXcursor -lpthread -ldl


lineham: lineham.c
	$(CC) $(CFLAGS) lineham.c $(LIBS) -o lineham

.PHONY: clean

clean:
	rm -f lineham

