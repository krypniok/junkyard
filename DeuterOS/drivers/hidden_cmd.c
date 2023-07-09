#include <stddef.h>
#include <stdbool.h>

#include "hidden_cmd.h"

#include "display.h"


#define BUFFER_SIZE 16

void byteMove(void* dest, const void* src, size_t numBytes) {
    char* destPtr = (char*)dest;
    const char* srcPtr = (const char*)src;

    if (destPtr < srcPtr) {
        while (numBytes--)
            *destPtr++ = *srcPtr++;
    } else {
        destPtr += numBytes;
        srcPtr += numBytes;
        while (numBytes--)
            *--destPtr = *--srcPtr;
    }
}

void byteSet(void* ptr, int value, size_t numBytes) {
    char* bytePtr = (char*)ptr;
    char byteValue = (char)value;

    while (numBytes--)
        *bytePtr++ = byteValue;
}

size_t byteStringLength(const char* str) {
    const char* ptr = str;
    while (*ptr)
        ptr++;
    return ptr - str;
}

int byteMemcmp(const void* ptr1, const void* ptr2, size_t numBytes) {
    const unsigned char* bytePtr1 = (const unsigned char*)ptr1;
    const unsigned char* bytePtr2 = (const unsigned char*)ptr2;

    for (size_t i = 0; i < numBytes; i++) {
        if (bytePtr1[i] != bytePtr2[i])
            return bytePtr1[i] - bytePtr2[i];
    }

    return 0;
}

int byteStrcmp(const char* str1, const char* str2) {
    while (*str1 && (*str1 == *str2)) {
        str1++;
        str2++;
    }

    return *(unsigned char*)str1 - *(unsigned char*)str2;
}

int atoi(const char *str) {
    int result = 0;
    int sign = 1;
    int i = 0;

    // Handling whitespaces
    while (str[i] == ' ') {
        i++;
    }

    // Handling sign
    if (str[i] == '+' || str[i] == '-') {
        sign = (str[i++] == '-') ? -1 : 1;
    }

    // Converting digits to integer
    while (str[i] >= '0' && str[i] <= '9') {
        result = result * 10 + (str[i] - '0');
        i++;
    }

    return sign * result;
}

void processBuffer(char* buffer) {
    // Hier wird deine Funktion ausgelöst, wenn die Zeichenkette gefunden wurde.
    int parameter = atoi(buffer + 6);  // Extrahiere den Integer-Parameter aus dem Buffer
    

	printf("Parameter gefunden: %d\n", parameter);

}


void addToBuffer(char* buffer, char ch) {
    // Hier wird das Zeichen an den Buffer angehängt.
    size_t len = byteStringLength(buffer);

    if (len >= BUFFER_SIZE) {
        // Wenn der Buffer voll ist, wird das älteste Zeichen entfernt.
        byteMove(buffer, buffer + 1, BUFFER_SIZE - 1);
        buffer[BUFFER_SIZE - 1] = ch;
    } else {
        buffer[len] = ch;
        buffer[len + 1] = '\0';
    }
}

void emptyBuffer(char* buffer) {
    // Hier wird der Buffer geleert.
    byteSet(buffer, 0, BUFFER_SIZE);
}

    char buffer[BUFFER_SIZE] = "\0";
    const char* targetString = "system####"; // Die zu suchende Zeichenkette

void printPointer(void *ptr)
{
    char buffer[sizeof(void *) * 2 + 1]; // Assumes a maximum of sizeof(void *) * 2 digits for a pointer
    charToString(0xBE, buffer);
    print_string(buffer);
}

bool HandleCheats(unsigned char ch) {

printPointer(0xDE);

    size_t targetLength = 10; //byteStringLength(targetString);

            addToBuffer(buffer, ch);

	printf("\nParameter gefunden: %s\n", buffer);

            if (byteStringLength(buffer) >= targetLength) {
                int i;
                for (i = 0; i < targetLength; i++) {
                    if (targetString[i] != '#' && targetString[i] != buffer[i])
                        break;
                }
                if (i == targetLength) {
                    processBuffer(buffer);
                    emptyBuffer(buffer);
                }
            }
}