#include "string.h"

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

unsigned long strtoul_custom(const char* str, char** endptr, int base) {
    unsigned long result = 0;
    bool isNegative = false;

    // Überspringe führende Leerzeichen
    while (*str == ' ')
        str++;

    // Überprüfe auf Vorzeichen
    if (*str == '-') {
        isNegative = true;
        str++;
    } else if (*str == '+') {
        str++;
    }

    // Überprüfe auf Basis 0x für Hexadezimal
    if (base == 0 && *str == '0') {
        str++;
        if (*str == 'x' || *str == 'X') {
            base = 16;
            str++;
        } else {
            base = 8;
        }
    }

    // Überprüfe auf Basis 0 für Oktal
    if (base == 0 && *str == '0') {
        base = 8;
        str++;
    }

    // Wenn die Basis immer noch 0 ist, setzen wir sie auf 10
    if (base == 0)
        base = 10;

    // Konvertiere die Zeichenkette in eine Ganzzahl
    while (*str != '\0') {
        int digit;
        if (*str >= '0' && *str <= '9') {
            digit = *str - '0';
        } else if (*str >= 'A' && *str <= 'Z') {
            digit = *str - 'A' + 10;
        } else if (*str >= 'a' && *str <= 'z') {
            digit = *str - 'a' + 10;
        } else {
            break; // Ungültiges Zeichen, beende die Konvertierung
        }

        if (digit >= base)
            break; // Ungültiges Zeichen für die gegebene Basis, beende die Konvertierung

        result = result * base + digit;
        str++;
    }

    // Setze den Zeiger auf das nächste Zeichen nach der konvertierten Zahl
    if (endptr != NULL)
        *endptr = (char*)str;

    // Setze das Vorzeichen entsprechend
    if (isNegative)
        result = -result;

    return result;
}

char* strstr_custom(const char* haystack, const char* needle) {
    if (*needle == '\0') {
        return (char*)haystack;
    }

    while (*haystack != '\0') {
        const char* h = haystack;
        const char* n = needle;
        while (*h == *n && *n != '\0') {
            h++;
            n++;
        }
        if (*n == '\0') {
            return (char*)haystack;
        }
        haystack++;
    }

    return NULL;
}

char* strchr_custom(const char* str, int ch) {
    while (*str != '\0') {
        if (*str == ch) {
            return (char*)str;
        }
        str++;
    }
    return NULL;
}

char* strtok_custom(char* str, const char* delim) {
    static char* savedStr = NULL;
    if (str != NULL) {
        savedStr = str;
    }
    if (savedStr == NULL || *savedStr == '\0') {
        return NULL;
    }
    char* token = savedStr;
    while (*savedStr != '\0') {
        if (strchr_custom(delim, *savedStr) != NULL) {
            *savedStr = '\0';
            savedStr++;
            return token;
        }
        savedStr++;
    }
    return token;
}

// Helper function to search for a string within a memory range
void* search_string(void* start_address, size_t size, const char* str) {
    size_t str_len = 0;
    while (str[str_len]) {
        str_len++;
    }

    for (size_t i = 0; i < size; i++) {
        if (compare_string(start_address + i, str) == 0) {
            // String found, return the address
            return start_address + i;
        }
    }

    // String not found in the given range
    return NULL;
}