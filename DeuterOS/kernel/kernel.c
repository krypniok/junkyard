#include "../cpu/idt.h"
#include "../cpu/isr.h"
#include "../cpu/timer.h"
#include "../drivers/display.h"
#include "../drivers/keyboard.h"
#include "../drivers/ports.h"
#include "../drivers/graphics.h"
#include "../drivers/video.h"

#include "../stdlibs/string.h"

#include "util.h"
#include "mem.h"

#define SHIFT 0x2A
#define RELEASED_SHIFT 0xAA

#define BACKSPACE 0x0E
#define ENTER 0x1C

#define SC_MAX 128

static char key_buffer2[256];

bool g_bShiftPressed = false;
bool g_bKernelShouldStop = false;
bool g_bKernelInitialised = false;


// Funktion zum Lesen des Tastaturstatus
uint8_t read_keyboard_status() {
    return port_byte_in(0x64);
}

// Funktion zum Lesen des Tastaturdatenports
uint8_t read_keyboard_data() {
    return port_byte_in(0x60);
}

int kernel_console_program();



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
                         '7', '8', '9', '0', '-', '=', 'ß', '?', 'q', 'w', 'e', 'r', 't', 'z',
                         'u', 'i', 'o', 'p', '[', ']', '?', '?', 'a', 's', 'd', 'f', 'g',
                         'h', 'j', 'k', 'l', ';', '\'', '`', 0, '\\', 'y', 'x', 'c', 'v',
                         'b', 'n', 'm', ',', '.', '/', '?', '?', '?', ' ', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '^', 'v', '<', '>'};

const char sc_ascii3[] = {'?', '?', '!', '"', '§', '$', '%', '&',
                         '/', '(', ')', '=', '_', '*', '?', '?', 'Q', 'W', 'E', 'R', 'T', 'Z',
                         'U', 'I', 'O', 'P', '[', ']', '?', '?', 'A', 'S', 'D', 'F', 'G',
                         'H', 'J', 'K', 'L', ';', '\'', '`', 0, '\\', 'Y', 'X', 'C', 'V',
                         'B', 'N', 'M', ',', '.', '/', '?', '?', '?', ' ', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '^', 'v', '<', '>'};


void start_kernel() {
    set_color(WHITE_ON_BLACK);
    clear_screen();
    unsigned char str[80];
    int revnum = REVISION_NUMBER;
    unsigned char* revdate = REVISION_DATE;
    sprintf(str, "DeuterOS 0.%d (%s)\n", (void*)&revnum, (void*)&revdate);
    printf("DeuterOS 0.%d (", REVISION_NUMBER);
    print_string(REVISION_DATE);
    printf(")\n");

    if(! g_bKernelInitialised) {
    print_string("Installing interrupt service routines (ISRs).\n");
    isr_install();

    print_string("Enabling external interrupts.\n");
    asm volatile("sti");

   // print_string("Initializing keyboard (IRQ 1).\n");
    init_keyboard();

    print_string("Initializing dynamic memory.\n");
    init_dynamic_mem();

    print_string("A20 Line was activated by the MBR.\n");
//    enable_a20_line();

    print_string("Initializing timer.\n");
    init_timer(1000);
    g_bKernelInitialised = true;
    }
/*
    print_nl();
    printf("Test char: %c\n", 99);
    printf("Test: %s\n", &str[0]);
    printf("Test pointer: %p\n", 0xDEADBEEF);
    printf("Test dezimal: %d\n", 97);
    printf("Test hexadezimal: %X\n", 0x100);
*/
    printf("\n> ");

    while(!g_bKernelShouldStop) {
        kernel_editor_program();
    }

end_of_kernel:
    print_nl();
    printf("Wow, we should get here...\nExiting...\nStopping the CPU...\nescape espace...\n");
    asm volatile("hlt");
    printf("P.S. Why is this still working when the CPU is officially stopped (hlt) ?\n");
}

void name1() {
    // Code for name1 function
    print_string("function name1");
    print_nl();
}

void name2() {
    // Code for name2 function
}

typedef void (*FilePointer)();

typedef struct {
    unsigned char filename[32];
    FilePointer filepointer;
} fileentry;

fileentry filetable[2] = { {"name1", name1}, {"name2", name2} };


// Helper function to execute the "search" command
void execute_search_command(char *input) {
    char* addressStr = strtok_custom(input + byteStringLength("search") + 1, " ");
    char* sizeStr = strtok_custom(NULL, " ");
    char* searchString = strtok_custom(NULL, " ");

    if (addressStr != NULL && sizeStr != NULL && searchString != NULL) {
        uint32_t address = strtoul_custom(addressStr, NULL, 0);
        uint32_t size = strtoul_custom(sizeStr, NULL, 0);

        // Call the search_string function to find the string
        void* result = search_string((void*)address, size, searchString);

        if (result != NULL) {
            // String found, call the "dump" command on the address where the string was found
            char resultAddressStr[20];
            sprintf(resultAddressStr, "%p", result);
            char dumpCommand[50];
            byteMove(dumpCommand, "dump ", 5);
            byteMove(dumpCommand + 5, resultAddressStr, byteStringLength(resultAddressStr));
            byteMove(dumpCommand + 5 + byteStringLength(resultAddressStr), " ", 1);
            byteMove(dumpCommand + 6 + byteStringLength(resultAddressStr), "4", 4);
            execute_command(dumpCommand);
        } else {
            print_string("String not found.\n");
        }
    } else {
        print_string("Invalid parameters for 'search address size string' command.\n");
    }
}

void print_ascii_table() {
    int rows = 16;
    int columns = 16;
    printf("+------+");
    for (int col = 0; col < columns; col++) {
        printf("----");
    }
    printf("+\n");

    printf("|      |");
    for (int col = 0; col < columns; col++) {
        printf(" ");
        printHexByte(col);
    }
    printf("  |\n");

    printf("+-----+");
    for (int col = 0; col < columns; col++) {
        printf("----");
    }
    printf("+\n");

    for (int row = 0; row < rows; row++) {
        printf("| ");
        printHexByte(row);
        printf("  |");
        for (int col = 0; col < columns; col++) {
            unsigned char c = row * columns + col;
            if (c == 0 || c == 10) // Skip the newline character '\n'
                printf("    ");
            else
                printf("  %c ", c);
        }
        printf(" |\n");
    }

    printf("+------+");
    for (int col = 0; col < columns; col++) {
        printf("----");
    }
    printf("+\n");
}

void execute_command(char *input) {
    int cursor = get_cursor();
    if (compare_string(input, "") == 0) {
        goto none;
    } else if (compare_string(input, "exit") == 0) {
        g_bKernelShouldStop = true;
    } else if (compare_string(input, "stage2") == 0) {
        printf("Loading Kernel to 0x100000.\n");
        readFromHardDrive(2, 2779, 0x100000);
    } else if (strstr_custom(input, "dump") == input) {
        char* addressStr = strtok_custom(input + 5, " ");
        char* lengthStr = strtok_custom(NULL, " ");

        if (addressStr != NULL && lengthStr != NULL) {
            uint32_t address = strtoul_custom(addressStr, NULL, 0);
            uint16_t length = strtoul_custom(lengthStr, NULL, 0);

            // clear_screen();
            hexDump((void*)address, (int)length);
        } else {
            print_string("Invalid parameters for 'dump address length' command.\n");
        }
    } else if (strstr_custom(input, "memset") == input) {
        char* addressStr = strtok_custom(input + 7, " ");
        char* lengthStr = strtok_custom(NULL, " ");

        if (addressStr != NULL && lengthStr != NULL) {
            uint32_t address = strtoul_custom(addressStr, NULL, 0);
            uint16_t length = (uint16_t)strtoul_custom(lengthStr, NULL, 0);
            byteSet((void*)address, length, 1);
        } else {
            print_string("Invalid parameters for 'memset dest value' command.\n");
        }
    } else if (strstr_custom(input, "memcpy") == input) {
        char* addressStr = strtok_custom(input + 7, " ");
        char* addressStr2 = strtok_custom(NULL, " ");
        char* lengthStr = strtok_custom(NULL, " ");

        if (addressStr != NULL && addressStr2 != NULL && lengthStr != NULL) {
            uint32_t address = strtoul_custom(addressStr, NULL, 0);
            uint32_t address2 = strtoul_custom(addressStr2, NULL, 0);
            uint16_t length = (uint16_t)strtoul_custom(lengthStr, NULL, 0);
            byteMove((void*)address2, (void*)address, length);
        } else {
            print_string("Invalid parameters for 'memcpy source dest length' command.\n");
        }
    } else if (strstr_custom(input, "run") == input) {
        char* addressStr = strtok_custom(input + 4, " ");

        if (addressStr != NULL) {
            uint32_t address = strtoul_custom(addressStr, NULL, 0);
            // Create a function pointer and assign the address to it
            FilePointer funcPtr = (FilePointer)address;
            // Call the function using the function pointer
            funcPtr();
        } else {
            print_string("Invalid parameters for 'run address' command.\n");
        }
    } else if (strstr_custom(input, "ascii") == input) {
        print_ascii_table();
     } else if (strstr_custom(input, "send") == input) {
        char* param1 = strtok_custom(input + byteStringLength("send") + 1, " ");

        if (param1 != NULL) {
            // Find the corresponding file entry
            int i;
            for (i = 0; i < 2; i++) {
                print_string(filetable[i].filename);
                print_string("tst");
                print_nl();
                name1();
                if (strstr_custom(param1, "name1") == param1) {
                    // Execute the function pointer if it is not NULL
                    if (filetable[i].filepointer != NULL) {
                        //FilePointer funcPtr = filetable[i].filepointer;
                        //funcPtr();
                        name1();
                    } else {
                        print_string("Function pointer is not assigned for file: ");
                        print_string(param1);
                        print_nl();
                    }
                    break;
                }
            }
            if (i == 2) {
                print_string("File not found: ");
                print_string(param1);
                print_nl();
            }
        } else {
            print_string("Invalid parameters for 'send' command.\n");
        }
    }
      else if (strstr_custom(input, "search") == input) {
        execute_search_command(input);
    } else if (compare_string(input, "clr") == 0 || compare_string(input, "rst") == 0) {
        clear_screen();
        set_cursor(0);
    } else {
        print_string("Unknown command: ");
        print_string(input);
        print_nl();
    }
    print_string("> ");
    return;
none:
    set_cursor(cursor - 156);
    return;
}



void draw_status_bar() {
    set_color(FG_BLACK | BG_CYAN);
    for(unsigned char c=0; c<80; c++) {
        printf(" ");
    }    
}

// Console program one
int kernel_editor_program() {
    while (1) {
        set_color(FG_BRIGHT_WHITE | BG_LIGHT_BLUE);
        clear_screen();
        draw_status_bar();
        for(unsigned char c=0; c<23; c++) {
            print_nl();            
        }
        draw_status_bar();

        while ( !(read_keyboard_status() & 0x01)) { }
            
        // Überprüfe den Tastaturstatus
        if (read_keyboard_status() & 0x01) {
            // Tastatureingabe verfügbar, lese den Scan-Code
            uint8_t scancode = read_keyboard_data();

            if (scancode > SC_MAX) return 1;

            if (scancode == BACKSPACE) {
                if (backspace(key_buffer2)) {
                    print_backspace();
                }
            } else if (scancode == ENTER) {
                print_nl();
                execute_command(key_buffer2);
                key_buffer2[0] = '\0';
            } else {
                char letter;
                if (is_key_pressed(SHIFT)) {
                    letter = sc_ascii3[(int)scancode];
                } else {
                    letter = sc_ascii2[(int)scancode];
                }
                append(key_buffer2, letter);
                char str[2] = {letter, '\0'};
                print_string(str);
            }
        }
    }
}

// Console program one
int kernel_console_program() {
    while (1) {
        // Überprüfe den Tastaturstatus
        if (read_keyboard_status() & 0x01) {
            // Tastatureingabe verfügbar, lese den Scan-Code
            uint8_t scancode = read_keyboard_data();

            if (scancode > SC_MAX) return 1;

            if (scancode == BACKSPACE) {
                if (backspace(key_buffer2)) {
                    print_backspace();
                }
            } else if (scancode == ENTER) {
                print_nl();
                execute_command(key_buffer2);
                key_buffer2[0] = '\0';
            } else {
                char letter;
                if (is_key_pressed(SHIFT)) {
                    letter = sc_ascii3[(int)scancode];
                } else {
                    letter = sc_ascii2[(int)scancode];
                }
                append(key_buffer2, letter);
                char str[2] = {letter, '\0'};
                print_string(str);
            }
        }
    }
}
