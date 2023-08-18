#include <stddef.h>
#include <stdbool.h>

#include "hidden_cmd.h"
#include "display.h"

#include "../stdlibs/string.h"

#define BUFFER_SIZE 16

void processBuffer(char* buffer) {
    // Hier wird deine Funktion ausgelöst, wenn die Zeichenkette gefunden wurde.
    int parameter = atoi(buffer + 6);  // Extrahiere den Integer-Parameter aus dem Buffer
    

	printf("Parameter gefunden: %d\n", parameter);

}

void addToBuffer(char* buffer, char ch) {
    // Hier wird das Zeichen an den Buffer angehängt.
    size_t len = strlen(buffer);

    if (len >= BUFFER_SIZE) {
        // Wenn der Buffer voll ist, wird das älteste Zeichen entfernt.
        memcpy(buffer, buffer + 1, BUFFER_SIZE - 1);
        buffer[BUFFER_SIZE - 1] = ch;
    } else {
        buffer[len] = ch;
        buffer[len + 1] = '\0';
    }
}

void emptyBuffer(char* buffer) {
    // Hier wird der Buffer geleert.
    memset(buffer, 0, BUFFER_SIZE);
}

    char buffer[BUFFER_SIZE] = "\0";
    const char* targetString = "system####"; // Die zu suchende Zeichenkette

bool HandleCheats(unsigned char ch) {
    size_t targetLength = strlen(targetString);
    addToBuffer(buffer, ch);
    if (strlen(buffer) >= targetLength) {
        int i;
        for (i = 0; i < targetLength; i++) {
            if (targetString[i] != '#' && targetString[i] != buffer[i]) {
                break;
            }
            if (i == targetLength) {
                processBuffer(buffer);
                emptyBuffer(buffer);
            }
        }
    }
}

