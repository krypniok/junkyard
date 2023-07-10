#include "../cpu/idt.h"
#include "../cpu/isr.h"
#include "../cpu/timer.h"
#include "../drivers/display.h"
#include "../drivers/keyboard.h"

#include "util.h"
#include "mem.h"

void* alloc(int n) {
    int *ptr = (int *) mem_alloc(n * sizeof(int));
    if (ptr == NULL_POINTER) {
        print_string("Memory not allocated.\n");
    } else {
        // Get the elements of the array
        for (int i = 0; i < n; ++i) {
//            ptr[i] = i + 1; // shorthand for *(ptr + i)
        }

        for (int i = 0; i < n; ++i) {
//            char str[256];
//            int_to_string(ptr[i], str);
//            print_string(str);
        }
//        print_nl();
    }
    return ptr;
}

void start_kernel() {
    clear_screen();
    print_string("Installing interrupt service routines (ISRs).\n");
    isr_install();

    print_string("Enabling external interrupts.\n");
    asm volatile("sti");

    print_string("Initializing keyboard (IRQ 1).\n");
    init_keyboard();

    print_string("Initializing dynamic memory.\n");
    init_dynamic_mem();

    

    print_string("> ");
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



void execute_command(char *input) {
    if (compare_string(input, "exit") == 0) {
        print_string("Stopping the CPU. Bye!\n");
        asm volatile("hlt");
    } else if (strstr_custom(input, "dump") == input) {
        char* addressStr = strtok_custom(input + 5, " ");
        char* lengthStr = strtok_custom(NULL, " ");

        if (addressStr != NULL && lengthStr != NULL) {
            uint32_t address = strtoul_custom(addressStr, NULL, 0);
            uint16_t length = strtoul_custom(lengthStr, NULL, 0);

            clear_screen();
            hexDump((void*)address, (int)length);
        } else {
            print_string("Invalid parameters for 'dump' command.\n");
        }
    } else if (compare_string(input, "clr") == 0 || compare_string(input, "rst") == 0) {
        clear_screen();
        set_cursor(0);
    } else {
        print_string("Unknown command: ");
        print_string(input);
    }
    print_string("\n> ");
}
