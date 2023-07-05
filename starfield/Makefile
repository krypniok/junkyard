CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -O2
LDFLAGS = -lX11 -lGL -lGLU -lglut

SRCS = starfield.c
OBJS = $(SRCS:.c=.o)
TARGET = starfield

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

