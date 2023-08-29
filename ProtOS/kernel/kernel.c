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

/*
char logo[9][54] = {
" ██▓███   ██▀███   ▒█████  ▄▄▄█████▓ ▒█████    ██████ ",
"▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒▓  ██▒ ▓▒▒██▒  ██▒▒██    ▒ ",
"▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒▒ ▓██░ ▒░▒██░  ██▒░ ▓██▄   ",
"▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░░ ▓██▓ ░ ▒██   ██░  ▒   ██▒",
"▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░  ▒██▒ ░ ░ ████▓▒░▒██████▒▒",
"▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░   ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░",
"░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░     ░      ░ ▒ ▒░ ░ ░▒  ░ ░",
"░░         ░░   ░ ░ ░ ░ ▒    ░      ░ ░ ░ ▒  ░  ░  ░  ",
"            ░         ░ ░               ░ ░        ░  "};
*/                                                    

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


#define SIGNATURE 0xDEADBEEF

__attribute__((section(".my_special_function"))) __attribute__((optimize("O0")))
void kernel_start_main() {
    // Einfügen der Signatur als Anker
    uint32_t anchor = SIGNATURE;

    clear_screen();
    printf("in time\n");
    getch();

    set_color(WHITE_ON_BLACK);
    clear_screen();
    unsigned char str[80];
    int revnum = REVISION_NUMBER;
    unsigned char* revdate = REVISION_DATE;
    sprintf(str, "ProtOS 0.%d (%s)\n", (void*)&revnum, (void*)&revdate);
    printf("ProtOS 0.%d (", REVISION_NUMBER);
    print_string(REVISION_DATE);
    printf(")\n");

    if(! g_bKernelInitialised) {
        print_string("Installing interrupt service routines (ISRs).\n");
        isr_install();

        print_string("Enabling external interrupts.\n");
        asm volatile("sti");

        print_string("Initializing keyboard (IRQ 1).\n");
        init_keyboard();

        print_string("Initializing dynamic memory.\n");
        init_dynamic_mem();

        init_memory();

        print_string("A20 Line was activated by the MBR.\n");
        // enable_a20_line();

        print_string("Initializing timer.\n");
        init_timer(1000);

        print_string("Initializing PS/2 mouse interface\n");;
        //mouse_install();

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
        kernel_console_program();
    }

end_of_kernel:
    print_nl();
    printf("Wow, we should get here...\nExiting...\nStopping the CPU...\nescape espace...\n");
    asm volatile("hlt");
    printf("P.S. Why is this still working when the CPU is officially stopped (hlt) ?\n");
}

typedef void (*FilePointer)();


// Helper function to search for a byte within a memory range
void* search_byte(void* start_address, size_t size, unsigned char byteToFind) {
    for (size_t i = 0; i < size; i++) {
        unsigned char byte = *((unsigned char*)(start_address + i));
        if (byte == byteToFind) {
            // Byte found, return the address
            return (start_address + i);
        }
    }

    // Byte not found in the given range
    return NULL;
}

void execute_search_command_str(char *input) {
    char* addressStr = strtok(input + strlen("searchs") + 1, " ");
    char* sizeStr = strtok(NULL, " ");
    char* searchString = strtok(NULL, " ");

    if (addressStr != NULL && sizeStr != NULL && searchString != NULL) {
        uint32_t address = strtoul(addressStr, NULL, 0);
        uint32_t size = strtoul(sizeStr, NULL, 0);

        // Call the search_string function to find the string
        void* result = search_string((void*)address, size, searchString);

        if (result != NULL) {
            // String found, print the address
            char resultAddressStr[20];
            sprintf(resultAddressStr, "%p", &result);
            print_string("String found at address: ");
            print_string(resultAddressStr);
            print_string("\n");
        } else {
            print_string("String not found.\n");
        }
    } else {
        print_string("Invalid parameters for 'search address size string' command.\n");
    }
}

void execute_search_command_chr(char *input) {
    char* addressStr = strtok(input + strlen("searchb") + 1, " ");
    char* sizeStr = strtok(NULL, " ");
    char* byteStr = strtok(NULL, " ");

    if (addressStr != NULL && sizeStr != NULL && byteStr != NULL) {
        uint32_t address = strtoul(addressStr, NULL, 0);
        uint32_t size = strtoul(sizeStr, NULL, 0);
        uint32_t byte = strtoul(byteStr, NULL, 0);
        unsigned char byteToFind = (unsigned char)byte;

        printf("searching %d\n", byteToFind);

        // Call the search_byte function to find the byte
        void* result = search_byte((void*)address, size, byteToFind);

        if (result != NULL) {
            // Byte found, print the address
            char resultAddressStr[20];
            sprintf(resultAddressStr, "%p", &result);
            print_string("Byte found at address: ");
            print_string(resultAddressStr);
            print_string("\n");
        } else {
            print_string("Byte not found.\n");
        }
    } else {
        print_string("Invalid parameters for 'search address size byte' command.\n");
    }
}


void print_ascii_table() {
    int rows = 16;
    int columns = 16;
    printf("%c", 0xC9);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xD1);

   // printf("----+");
    for (int col = 0; col < columns<<2; col++) {
        //printf("----");
        printf("%c", 0xCD);
    }
    printf("%c\n", 0xBB);
    //printf("+\n");

    printf("%c", 0xBA);
    printf("    ");
    printf("%c", 0xB3);
    
    for (int col = 0; col < columns; col++) {
        printf(" ");
        printHexByte(col);
    }
    printf("%c\n", 0xBA);
    //printf("|\n");

    //printf("+----+");
    printf("%c", 0xC7);
    printf("%c", 0xC4);
    printf("%c", 0xC4);
    printf("%c", 0xC4);
    printf("%c", 0xC4);
    printf("%c", 0xC5);

    for (int col = 0; col < columns<<2; col++) {
//        printf("----");
        printf("%c", 0xC4);
    }
//    printf("+\n");
    printf("%c\n", 0xB6);

    for (int row = 0; row < rows; row++) {
//        printf("| ");
        printf("%c ", 0xBA);
        printHexByte(row<<4);
//        printf("|");
        printf("%c", 0xB3);

        for (int col = 0; col < columns; col++) {
            unsigned char c = row * columns + col;
            if (c == 0 || c == 10) // Skip the newline character '\n'
                printf("    ");
            else
                printf("  %c ", c);
        }
        printf("%c\n", 0xBA);
        //printf("|\n");
    }

    printf("%c", 0xC8);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCF);

    for (int col = 0; col < columns<<2; col++) {
        //printf("----");
        printf("%c", 0xCD);
    }
    printf("%c\n", 0xBC);

//    printf("+----+");
//    for (int col = 0; col < columns; col++) {
//        printf("----");
//    }
//    printf("+\n");
}

void formatTimestamp(unsigned int timestamp_ms) {
    unsigned int ms_per_day = 86400000; // Millisekunden pro Tag
    unsigned int ms_per_hour = 3600000; // Millisekunden pro Stunde
    unsigned int ms_per_minute = 60000; // Millisekunden pro Minute
    unsigned int ms_per_second = 1000;  // Millisekunden pro Sekunde

    unsigned int days = timestamp_ms / ms_per_day;
    timestamp_ms %= ms_per_day;

    unsigned int hours = timestamp_ms / ms_per_hour;
    timestamp_ms %= ms_per_hour;

    unsigned int minutes = timestamp_ms / ms_per_minute;
    timestamp_ms %= ms_per_minute;

    unsigned int seconds = timestamp_ms / ms_per_second;
    unsigned int milliseconds = timestamp_ms % ms_per_second;

    // Ausgabe der Längenzeit
    printf("%d Tage\n", days);
    printf("%d Stunden\n", hours);
    printf("%d Minuten\n", minutes);
    printf("%d Sekunden\n", seconds);
    printf("%d Millisekunden\n", milliseconds);
}

void formatTimestampHHMMSS(unsigned int timestamp_ms) {
    unsigned int ms_per_day = 86400000; // Millisekunden pro Tag
    unsigned int ms_per_hour = 3600000; // Millisekunden pro Stunde
    unsigned int ms_per_minute = 60000; // Millisekunden pro Minute
    unsigned int ms_per_second = 1000;  // Millisekunden pro Sekunde

    unsigned int days = timestamp_ms / ms_per_day;
    timestamp_ms %= ms_per_day;

    unsigned int hours = timestamp_ms / ms_per_hour;
    timestamp_ms %= ms_per_hour;

    unsigned int minutes = timestamp_ms / ms_per_minute;
    timestamp_ms %= ms_per_minute;

    unsigned int seconds = timestamp_ms / ms_per_second;
    unsigned int milliseconds = timestamp_ms % ms_per_second;

    // Ausgabe der Längenzeit
    printf("%d:", hours);
    printf("%d:", minutes);
    printf("%d", seconds);
    print_nl();
}

// Funktion zum Verstecken des Cursors
void hideCursor() {
    // Index 0x0A entspricht dem Cursor-Form Control Register
    port_byte_out(0x3D4, 0x0A);
    unsigned char cursorControl = port_byte_in(0x3D5);

    // Bit 5 auf 1 setzen, um den Cursor zu verstecken
    cursorControl |= 0x20;

    // Neuen Wert an das CRTC Data Register senden
    port_byte_out(0x3D5, cursorControl);
}

// Funktion zum Anzeigen des Cursors
void showCursor() {
    // Index 0x0A entspricht dem Cursor-Form Control Register
    port_byte_out(0x3D4, 0x0A);
    unsigned char cursorControl = port_byte_in(0x3D5);

    // Bit 5 auf 0 setzen, um den Cursor anzuzeigen
    cursorControl &= 0xDF;

    // Neuen Wert an das CRTC Data Register senden
    port_byte_out(0x3D5, cursorControl);
}


int memtest() {
    void* mem = malloc(256);
    void* mem2 = malloc(128);
    printf("mem = %p\n", mem);
    printf("Allocated blocks:\n");
    list_allocated_blocks();
    free(mem);
    printf("\nAllocated blocks after freeing mem:\n");
    list_allocated_blocks();
    free(mem2);
    printf("\nAllocated blocks after freeing mem2:\n");
    list_allocated_blocks();
    return 0;
}


/*
    Linked List test
*/


// Definition eines Elements in der Liste
typedef struct Node {
    void* data;
    struct Node* prev;
    struct Node* next;
} Node;

// Definition der doppelt verketteten Liste
typedef struct LinkedList {
    Node* head;
    Node* tail;
} LinkedList;

// Funktion zum Einfügen eines Elements am Anfang der Liste
void insertAtBeginning(LinkedList* list, void* data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->prev = NULL;
    newNode->next = list->head;

    if (list->head != NULL)
        list->head->prev = newNode;
    else
        list->tail = newNode;

    list->head = newNode;
}

// Funktion zum Einfügen eines Elements am Ende der Liste
void insertAtEnd(LinkedList* list, void* data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->prev = list->tail;
    newNode->next = NULL;

    if (list->tail != NULL)
        list->tail->next = newNode;
    else
        list->head = newNode;

    list->tail = newNode;
}

// Funktion zum Entfernen eines Elements aus der Liste
void removeFromList(LinkedList* list, Node* node) {
    if (node->prev != NULL)
        node->prev->next = node->next;
    else
        list->head = node->next;

    if (node->next != NULL)
        node->next->prev = node->prev;
    else
        list->tail = node->prev;

    free(node);
}

// Funktion zum Ausgeben der Liste
void printList(const LinkedList* list) {
    Node* current = list->head;
    while (current != NULL) {
        printf("Node Address: %p", current);
        printf(" Data: %d\n", *(int*)current->data);
        current = current->next;
    }
}

// Funktion zum Freigeben des Speichers der Liste
void freeList(LinkedList* list) {
    Node* current = list->head;
    while (current != NULL) {
        Node* temp = current;
        current = current->next;
        free(temp);
    }
}

#define ET printf("1 Error Trace !\n");

int ll_main() {
    LinkedList list = { NULL, NULL };

    int value1 = 1;
    int value2 = 2;
    int value3 = 3;

    insertAtEnd(&list, &value1);
    insertAtEnd(&list, &value2);
    insertAtBeginning(&list, &value3);
    
    printf("List:\n");
    printList(&list);

    Node* nodeToRemove = list.head->next;
    removeFromList(&list, nodeToRemove);

    printf("List after removal:\n");
    printList(&list);

    freeList(&list);

    return 0;
}


void execute_command(char *input) {
    int cursor = get_cursor();
    if (strcmp(input, "") == 0)
    {
        goto none;
    }
    else if (strcmp(input, "memtest") == 0)
    {
    //    memtest();
        printf("ll_main: %p\n", ll_main);
        ll_main();
    }
    else if (strcmp(input, "random") == 0)
    {
        init_random();
        for (int i = 0; i < 10; i++) {
            printf("%d\n", rand_range(1, 100)); // Beispiel: Zahlen zwischen 1 und 100
        }
    }  
    else if (strcmp(input, "edit") == 0)
    {
        editor_main();
    }
    else if (strcmp(input, "snake") == 0)
    {
        snake_main();
    }
    else if (strcmp(input, "uptime") == 0)
    {
        formatTimestampHHMMSS(GetTicks());
    }
    else if (strcmp(input, "hide") == 0)
    {
        hideCursor();
    }
    else if (strcmp(input, "show") == 0)
    {
        showCursor();
    }
    else if (strcmp(input, "regs") == 0)
    {
        print_registers();
    }
    else if (strcmp(input, "keycodes") == 0)
    {
        keycoder();
    }
    else if (strcmp(input, "exit") == 0)
    {
        g_bKernelShouldStop = true;
    }
    else if (strcmp(input, "stage2") == 0)
    {
       // printf("start_kernel = %p\n", start_kernel_main);
        printf("Loading Kernel to 0x100000.\n");
        readFromHardDrive(2, 2880, 0x200000);

        
        //void* sector = malloc(512);1
       // memset(sector, 0xCD, 512);
       // writeToHardDrive(2779, 1, sector);      // #ERROR_TAG

       // readFromHardDrive(2779, 1, 0x100000);

      //  free(sector);    
    }
    else if (strstr(input, "dump") == input)
    {
        char* addressStr = strtok(input + 5, " ");
        char* lengthStr = strtok(NULL, " ");

        if (addressStr != NULL && lengthStr != NULL) {
            uint32_t address = strtoul(addressStr, NULL, 0);
            uint16_t length = strtoul(lengthStr, NULL, 0);

            // clear_screen();
            hexDump((void*)address, (int)length);
        } else {
            print_string("Invalid parameters for 'dump address length' command.\n");
        }
    }
    else if (strstr(input, "memset") == input)
    {
        char* addressStr = strtok(input + 7, " ");
        char* lengthStr = strtok(NULL, " ");

        if (addressStr != NULL && lengthStr != NULL) {
            uint32_t address = strtoul(addressStr, NULL, 0);
            uint16_t length = (uint16_t)strtoul(lengthStr, NULL, 0);
            memset((void*)address, length, 1);
        } else {
            print_string("Invalid parameters for 'memset dest value' command.\n");
        }
    }
    else if (strstr(input, "memcpy") == input)
    {
        char* addressStr = strtok(input + 7, " ");
        char* addressStr2 = strtok(NULL, " ");
        char* lengthStr = strtok(NULL, " ");

        if (addressStr != NULL && addressStr2 != NULL && lengthStr != NULL) {
            uint32_t address = strtoul(addressStr, NULL, 0);
            uint32_t address2 = strtoul(addressStr2, NULL, 0);
            uint16_t length = (uint16_t)strtoul(lengthStr, NULL, 0);
            memcpy((void*)address2, (void*)address, length);
        } else {
            print_string("Invalid parameters for 'memcpy source dest length' command.\n");
        }
    }
    else if (strstr(input, "run") == input)
    {
        char* addressStr = strtok(input + 4, " ");

        if (addressStr != NULL) {
            uint32_t address = strtoul(addressStr, NULL, 0);
            // Create a function pointer and assign the address to it
            FilePointer funcPtr = (FilePointer)address;
            // Call the function using the function pointer
            funcPtr();
        } else {
            print_string("Invalid parameters for 'run address' command.\n");
        }
    }
    else if (strstr(input, "ascii") == input)
    {
        print_ascii_table();
    }
    else if (strstr(input, "searchb") == input)
    {
        execute_search_command_chr(input);
    }
    else if (strstr(input, "searchs") == input)
    {
        execute_search_command_str(input);
    }
    else if (strcmp(input, "clr") == 0 || strcmp(input, "rst") == 0)
    {
        clear_screen();
        set_cursor(0);
    }
    else
    {
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

// Console program one
int kernel_console_program() {
    while (1) {
        // Überprüfe den Tastaturstatus
        if (read_keyboard_status() & 0x01) {
            // Tastatureingabe verfügbar, lese den Scan-Code
            uint8_t scancode = read_keyboard_data();

            if (scancode > SC_MAX) return 1;

            HandleKeypress(sc_ascii2[(int)scancode]);

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
