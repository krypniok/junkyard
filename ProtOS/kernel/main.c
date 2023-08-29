#include "../cpu/idt.h"
#include "../cpu/isr.h"
#include "../cpu/timer.h"
#include "../drivers/ports.h"
#include "../drivers/hdd.h"



void print_frame() {
    int w = 16;
    int h = 16;

    printf("%c", 0xC9);
    for (int col = 0; col < w; col++) {
        printf("%c", 0xCD);
    }
    printf("%c\n", 0xBB);

    printf("%c", 0xBA);
    printf("    ");
    printf("%c", 0xB3);
    
    printf("%c\n", 0xBA);

    printf("%c", 0xC7);
    printf("%c", 0xC4);
    printf("%c", 0xC4);
    printf("%c", 0xC4);
    printf("%c", 0xC4);
    printf("%c", 0xC5);

    printf("%c\n", 0xB6);

    printf("%c", 0xC8);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCD);
    printf("%c", 0xCF);


}

unsigned char logo[9][80] = {
" 332333   335333   133333  444333332 133333    333333 ",
"2336  331233 1 3311331  3312  331 211331  331133    1 ",
"2336 3321233 643 11336  3311 2336 161336  3316 2334   ",
"1334321 11335534  133   3366 2332 6 133   336  1   331",
"1331 6  66332 13316 3333216  1331 6 6 3333216133333311",
"1216 6  66 12 61266 161616   1 66   6 161616 1 121 1 6",
"61 6       61 6 16  6 1 16     6      6 1 16 6 61  6 6",
"66         66   6 6 6 6 1    6      6 6 6 1  6  6  6  ",
"            6         6 6               6 6        6  "};
#include "../drivers/display.h"

typedef struct {
    unsigned char in, out;
} translate_t;

translate_t translate[] = { 
    {1, 177},
    {2, 178},
    {3, 219},
    {4, 220},
    {5, 223},
    {6, 176}
};

// Funktion zum Lesen des Tastaturstatus
uint8_t read_keyboard_status() {
    return port_byte_in(0x64);
}

// Funktion zum Lesen des Tastaturdatenports
uint8_t read_keyboard_data() {
    return port_byte_in(0x60);
}


unsigned char getch() {
    while ( !(read_keyboard_status() & 0x01)) { }
    uint8_t scancode = read_keyboard_data();
    return scancode;
}

void* search_signature(void* start_address, size_t size, uint32_t signature) {
    for (size_t i = 0; i < size - sizeof(uint32_t) + 1; i++) {
        uint32_t value = *((uint32_t*)(start_address + i));
        if (value == signature) {
            // Signature found, return the address
            return (start_address + i);
        }
    }

    // Signature not found in the given range
    return NULL;
}


#define ET(x) printf("Error Trace %s\n", #x);

#define PUSH_ALL asm volatile ( \
        "pusha \n\t" \
        : : : "memory" );

#define POP_ALL asm volatile ( \
        "popa \n\t" \
        : : : "memory" );


int check = 0;
void start_kernel() {
    if(check == 1) {
        clear_screen();
        ET(start)
        while(1) {}
    }
    PUSH_ALL;

    for(int i=0; i<9; i++) {
       for(int j=0; j<55; j++) {
            if(logo[i][j] == '3')
                printf("%c", 219);
            else if(logo[i][j] == '6')
                printf("%c", 176);
            else if(logo[i][j] == '5')
                printf("%c", 223);
            else if(logo[i][j] == '4')
                printf("%c", 220);
            else if(logo[i][j] == '2')
                printf("%c", 178);
            else if(logo[i][j] == '1')
                printf("%c", 177);
            else
                printf("%c", ' ');
       }
       printf("\n");
    }

    readFromHardDrive(33, 2880, (void*)0x200000);

    void* sig = 0x200000;
    void* jmp = 0x1000;
    while(sig = search_signature(sig, 512*2880, 0xDEADBEEF)) { 
        printf("signature found at %p\n", sig);
        jmp = sig;
        sig++;
    }

    int sector = 1;
    char run = 0;
    while(run) {
        char c = getch();
        switch(c) {
            case 0x49: sector--; break; 
            case 0x51: sector++; break;
            case 1: run = 0; break;
        }
        clear_screen();
        hexDump(0x100000+(256*sector), 256);
    }

    memcpy(0x100000, jmp-9, 0x100000);
    hexDump(0x100000, 64);

    getch();

   POP_ALL;

    ET(usw)
    check = 1;
    // Rufe den Eintrittspunkt von kernel2.bin auf

    void (*functionPointer)() = (void*)0x100000; // kernel_start_main;

    printf("functionPtr = %p\n", functionPointer);

    functionPointer();

    ET(etc)
}
