CC = gcc
CFLAGS = -g
LIBS = -lm -lopenal

bgrender: alsine.c
	$(CC) $(CFLAGS) alsine.c $(LIBS) -o alsine

.PHONY: clean

clean:
	rm -f alsine

