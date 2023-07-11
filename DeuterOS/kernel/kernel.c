#include "../cpu/idt.h"
#include "../cpu/isr.h"
#include "../cpu/timer.h"
#include "../drivers/display.h"
#include "../drivers/keyboard.h"
#include "../drivers/ports.h"
#include "../drivers/graphics.h"

#include "../stdlibs/string.h"

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

void enable_a20_line() {
    // Send the "Enable A20" command (0xD1) to the keyboard controller
    // and then read the status byte
    asm volatile(
        "cli\n"
        "xorw %%ax, %%ax\n"
        "inb $0x64, %%al\n"
        "testb $0x2, %%al\n"
        "jnz 1f\n"
        "movb $0xd1, %%al\n"
        "outb %%al, $0x64\n"
        "1:\n"
        "xorw %%ax, %%ax\n"
        "inb $0x64, %%al\n"
        "testb $0x2, %%al\n"
        "jnz 1f\n"
        "movb $0xdf, %%al\n"
        "outb %%al, $0x60\n"
        "1:\n"
        "sti\n"
        :
        :
        : "eax", "memory"
    );
}

// Funktion zum Lesen des Tastaturstatus
uint8_t read_keyboard_status() {
    return port_byte_in(0x64);
}

// Funktion zum Lesen des Tastaturdatenports
uint8_t read_keyboard_data() {
    return port_byte_in(0x60);
}








#define BACKSPACE 0x0E
#define ENTER 0x1C

#define SC_MAX 57

static char key_buffer2[256];

const char *sc_name2[] = {"ERROR", "Esc", "1", "2", "3", "4", "5", "6",
                         "7", "8", "9", "0", "-", "=", "Backspace", "Tab", "Q", "W", "E",
                         "R", "T", "Z", "U", "I", "O", "P", "[", "]", "Enter", "Lctrl",
                         "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'", "`",
                         "LShift", "\\", "Y", "X", "C", "V", "B", "N", "M", ",", ".",
                         "/", "RShift", "Keypad *", "LAlt", "Spacebar", "CapsLock",
                         "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10",
                         "NumLock", "ScrollLock", "Keypad 7", "Keypad 8", "Keypad 9",
                         "Keypad -", "Keypad 4", "Keypad 5", "Keypad 6", "Keypad +",
                         "Keypad 1", "Keypad 2", "Keypad 3", "Keypad 0", "Keypad .",
                         "AltSysReq", "???", "???", "F11", "F12",
                         "UP_ARROW", "DOWN_ARROW", "LEFT_ARROW", "RIGHT_ARROW"};

const char sc_ascii2[] = {'?', '?', '1', '2', '3', '4', '5', '6',
                         '7', '8', '9', '0', '-', '=', '?', '?', 'q', 'w', 'e', 'r', 't', 'z',
                         'u', 'i', 'o', 'p', '[', ']', '?', '?', 'a', 's', 'd', 'f', 'g',
                         'h', 'j', 'k', 'l', ';', '\'', '`', '?', '\\', 'y', 'x', 'c', 'v',
                         'b', 'n', 'm', ',', '.', '/', '?', '?', '?', ' ', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '^', 'v', '<', '>'};


// Function to generate a beep sound
void generateBeep() {
    // Enable the speaker
    asm volatile("movb $0x03, %al\n\t"
                 "outb %al, $0x61\n\t");

    // Generate the beep sound
    asm volatile("movw $1193, %cx\n\t"
                 "movw $0x42, %dx\n\t"
                 "movb $0xB6, %al\n\t"
                 "outb %al, %dx\n\t");

    // Wait for a certain duration (e.g., 500 milliseconds)
    for (uint32_t i = 0; i < 10000000; ++i)
        asm volatile("nop");

    // Turn off the speaker
    asm volatile("inb $0x61, %al\n\t"
                 "andb $0xFC, %al\n\t"
                 "outb %al, $0x61\n\t");
}

void keyboard_polling_example();

void start_kernel() {
    clear_screen();
    char str[80];
    sprintf(str, "DeuterOS 0.%d\n", REVISION_NUMBER);
    print_string(str);
    print_nl();

    print_string("Installing interrupt service routines (ISRs).\n");
    isr_install();

    print_string("Enabling external interrupts.\n");
    asm volatile("sti");

   // print_string("Initializing keyboard (IRQ 1).\n");
   // init_keyboard();

    print_string("Initializing dynamic memory.\n");
    init_dynamic_mem();

//    print_string("Activating A20 Line.\n");
//    enable_a20_line();

    print_string("Initializing timer.\n");
    init_timer(1000);


    printf("Test char: %c\n", 97);
    printf("Test: %s\n", str);
    printf("Test pointer: %p\n", 0xDEADBEEF);
    printf("Test dezimal: %d\n", 96);
    printf("Test hexadezimal: %X\n", 0x96);


    while(1) {
        keyboard_polling_example();
    }

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

            //clear_screen();
            hexDump((void*)address, (int)length);
        } else {
            print_string("Invalid parameters for 'dump' command.\n");
        }
    } else if (strstr_custom(input, "memset") == input) {
        char* addressStr = strtok_custom(input + 7, " ");
        char* lengthStr = strtok_custom(NULL, " ");

        if (addressStr != NULL && lengthStr != NULL) {
            uint32_t address = strtoul_custom(addressStr, NULL, 0);
            uint8_t length = (uint8_t)strtoul_custom(lengthStr, NULL, 0);
            byteSet((void*)address, length, 1);
        } else {
            print_string("Invalid parameters for 'memset' command.\n");
        }
    } else if (strstr_custom(input, "memcpy") == input) {
        char* addressStr = strtok_custom(input + 7, " ");
        char* addressStr2 = strtok_custom(NULL, " ");
        char* lengthStr = strtok_custom(NULL, " ");

        if (addressStr != NULL && addressStr2 != NULL && lengthStr != NULL) {
            uint32_t address = strtoul_custom(addressStr, NULL, 0);
            uint32_t address2 = strtoul_custom(addressStr2, NULL, 0);
            uint8_t length = (uint8_t)strtoul_custom(lengthStr, NULL, 0);
            byteMove((void*)address2, (void*)address, length);
        } else {
            print_string("Invalid parameters for 'memset' command.\n");
        }
    } else if (compare_string(input, "clr") == 0 || compare_string(input, "rst") == 0) {
        clear_screen();
        set_cursor(0);
    } else {
        print_string("Unknown command: ");
        print_string(input);
    }
    print_string("> ");
}



// Beispiel für die Tastaturabfrage im geschützten Modus
void keyboard_polling_example() {
    while (1) {
        // Überprüfe den Tastaturstatus
        if (read_keyboard_status() & 0x01) {
            // Tastatureingabe verfügbar, lese den Scan-Code
            uint8_t scancode = read_keyboard_data();
           //printf("SCANCODE: %c\n", scancode);

            if (scancode > SC_MAX) return;
            if (scancode == BACKSPACE) {
            if (backspace(key_buffer2)) {
                print_backspace();
            }
            } else if (scancode == ENTER) {
                print_nl();
                execute_command(key_buffer2);
                key_buffer2[0] = '\0';
            } else {
                char letter = sc_ascii2[(int) scancode];
                append(key_buffer2, letter);
                char str[2] = {letter, '\0'};
                print_string(str);
                // HandleCheats(letter);
            }
        }
    }
}
