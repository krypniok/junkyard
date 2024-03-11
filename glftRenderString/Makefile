CC = gcc
CFLAGS = -g -Wall -O2 -I/usr/include/freetype2
LIBS = -lGL -lGLEW -lglfw -lfreetype -ldl -lm

SRC = glftRenderString.c glftTest.c
OBJ = glftRenderString.o glftTest.o

TARGET = glftTest

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ) $(LIBS)

$(OBJ): %.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)

run: $(TARGET)
	./$(TARGET)
