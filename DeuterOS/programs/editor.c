#include "../drivers/display.h"
#include "../drivers/keyboard.h"
#include "../drivers/ports.h"
#include "../drivers/graphics.h"
#include "../drivers/video.h"

#include "../stdlibs/string.h"
#include "../kernel/util.h"
#include "../kernel/mem.h"

#include "editor.h"

#define MAX_BUFFER_SIZE 1024

const char* sc_name3[] = {"VROOM", "Esc", "1", "2", "3", "4", "5", "6",
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

const char sc_name8[][12] = {"VROOOM", "Esc", "1", "2", "3", "4", "5", "6",
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


const char teststr[8] = {'t', 'e', 's', 't', 's', 't', 'r', 0};


const char sc_ascii4[] = {'?', 0, '1', '2', '3', '4', '5', '6',
                         '7', '8', '9', '0', '-', '=', 'ß', '?', 'q', 'w', 'e', 'r', 't', 'z',
                         'u', 'i', 'o', 'p', '[', ']', '?', '?', 'a', 's', 'd', 'f', 'g',
                         'h', 'j', 'k', 'l', ';', '\'', '`', 0, '\\', 'y', 'x', 'c', 'v',
                         'b', 'n', 'm', ',', '.', '/', '?', '?', '?', ' ', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '^', 'v', '<', '>'};

const char sc_ascii5[] = {'?', 0, '!', '"', '§', '$', '%', '&',
                         '/', '(', ')', '=', '_', '*', '?', '?', 'Q', 'W', 'E', 'R', 'T', 'Z',
                         'U', 'I', 'O', 'P', '[', ']', '?', '?', 'A', 'S', 'D', 'F', 'G',
                         'H', 'J', 'K', 'L', ';', '\'', '`', 0, '\\', 'Y', 'X', 'C', 'V',
                         'B', 'N', 'M', ',', '.', '/', '?', '?', '?', ' ', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
                         '^', 'v', '<', '>'};


void draw_status_bar() {
    set_color(FG_BLACK | BG_CYAN);
    for(unsigned char c=0; c<80; c++) {
        printf(" ");
    }    
}

void editor_exit() {
    set_color(FG_WHITE | BG_BLACK);
    clear_screen();
}

unsigned char text_buffer[MAX_BUFFER_SIZE];
int text_buffer_index = 0;

void insert_character(unsigned char c) {
    if (text_buffer_index < MAX_BUFFER_SIZE - 1) {
        text_buffer[text_buffer_index] = c;
        text_buffer_index++;
        text_buffer[text_buffer_index] = '\0';
        draw_text_buffer();
    }
}

void delete_character() {
    if (text_buffer_index > 0) {
        text_buffer_index--;
        text_buffer[text_buffer_index] = '\0';
        draw_text_buffer();
    }
}

void clear_text_buffer() {
    text_buffer[0] = '\0';
    text_buffer_index = 0;
}

void draw_text_buffer() {
    set_color(FG_WHITE | BG_LIGHT_BLUE);
    printf("%s", text_buffer);
}

int vgatest();

int keycoder() {

    unsigned char *sc_name8[] = {"ERROR", "Esc", "1", "2", "3", "4", "5", "6",
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
    while (1) {

        while (!(read_keyboard_status() & 0x01)) {}
        uint8_t scancode = read_keyboard_data();

        void* ptr = &teststr[0];
        unsigned char str[10];

        printf("editor_main = ");
        pointerToString(editor_main, str);
        print_string(str);
        print_nl();

        printf("vgatest = ");
        pointerToString(vgatest, str);
        print_string(str);
        print_nl();

        printf("teststr = ");
        pointerToString(ptr, str);
        print_string(str);
        print_nl();

        printf("sc_name3 (global) = ");
        pointerToString(sc_name3, str);
        print_string(str);
        print_nl();

        printf("sc_name8 (local) = ");
        pointerToString(sc_name8, str);
        print_string(str);
        print_nl();

        printf("sc_name4 (global) = ");
        pointerToString(sc_ascii4, str);
        print_string(str);
        print_nl();

        printf("sc_name5 (global) = ");
        pointerToString(sc_ascii5, str);
        print_string(str);
        print_nl();

        // Überprüfe den Tastaturstatus
        if (scancode < 128) {
            if (scancode == SC_ESC) {
               // editor_exit();
                return 0;
            }
            printf("%s\n", sc_name3[scancode]);
        }
    }
    sleep(33);
}

int editor_main() {
    while (1) {
        clear_screen();
        draw_status_bar();
        draw_text_buffer();

        while (!(read_keyboard_status() & 0x01)) {}
        uint8_t scancode = read_keyboard_data();

        // Überprüfe den Tastaturstatus
        if (scancode < 128) {
            
            if (scancode == SC_ESC) {
                editor_exit();
                return 0;
            } else if (scancode == SC_F1) {
                clear_text_buffer();
            } else if (scancode == SC_ENTER) {
                insert_character('\n');
            } else if (scancode == SC_BACKSPACE) {
                delete_character();
            } else {
                unsigned char letter;
                if (is_key_pressed(SC_LEFT_SHIFT)) {
                    if(scancode == SC_LEFT_SHIFT) continue;;
                    letter = sc_ascii5[(int)scancode];
                    insert_character(letter);
                } else {
                    letter = sc_ascii4[(int)scancode];
                    insert_character(letter);
                }
                
            }
        }
    }
    sleep(100);
}
