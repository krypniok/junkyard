#include <stdint.h>

// BGA Register Ports
#define BGA_INDEX_PORT 0x01CE
#define BGA_DATA_PORT 0x01CF

// BGA Register Offsets
#define BGA_INDEX_ENABLE 0x04
#define BGA_INDEX_XRES 0x01
#define BGA_INDEX_YRES 0x02
#define BGA_INDEX_BPP 0x03
#define BGA_INDEX_BANK 0x05
#define BGA_INDEX_FB_ADDR 0x0D // Register for framebuffer address

// BGA Register Values
#define BGA_DISABLED 0x00
#define BGA_ENABLED 0x01
#define BGA_BPP_32 0x20

#define outw port_word_out
#define inw port_word_in

// Function to set BGA video mode
void setBGAMode() {
    // Enable BGA
    outw(BGA_INDEX_ENABLE, BGA_ENABLED);
    
    // Set screen resolution (e.g., 800x600)
    outw(BGA_INDEX_XRES, 800);
    outw(BGA_INDEX_YRES, 600);
    
    // Set color depth to 32-bit
    outw(BGA_INDEX_BPP, BGA_BPP_32);
    
    // Set bank to 0
    outw(BGA_INDEX_BANK, 0);
    
    // Read the framebuffer address
    outw(BGA_INDEX_FB_ADDR, 0); // Write index 0 to select the lower word of the framebuffer address
    uint32_t lowerWord = inw(BGA_DATA_PORT);
    outw(BGA_INDEX_FB_ADDR, 1); // Write index 1 to select the upper word of the framebuffer address
    uint32_t upperWord = inw(BGA_DATA_PORT);

    // Calculate the framebuffer address (32-bit address)
    uint32_t framebufferAddress = (upperWord << 16) | lowerWord;
    
    // Use the framebuffer address as needed
    uint32_t* framebuffer = (uint32_t*)framebufferAddress;
}

// Function to write a character to the BGA framebuffer
void writeCharacter(uint32_t* framebuffer, int x, int y, char character) {
    // Calculate the offset within the framebuffer based on x and y
    int offset = y * 800 + x;
    
    // Write the character (assuming 32-bit color)
    framebuffer[offset] = (0xFF << 24) | (character << 16) | (character << 8) | character;
}

void bgamain() {
    // Initialize BGA mode and obtain the framebuffer address
    setBGAMode();
    
    // Assuming you have a pointer to the framebuffer
    uint32_t* framebuffer = (uint32_t*)0xA0000; // Use the framebuffer address obtained from setBGAMode()
    
    // Example: Write "Hello, Bochs!" to the screen
    char message[] = "Hello, Bochs!";
    
    int x = 100; // X-coordinate
    int y = 100; // Y-coordinate
    
    for (int i = 0; message[i] != '\0'; ++i) {
        writeCharacter(framebuffer, x, y, message[i]);
        x += 8; // Advance by character width
    }
    
    // Enter an infinite loop (your kernel's main loop)
    while (1);
}
