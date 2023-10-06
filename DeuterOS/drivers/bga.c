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
#define outb port_byte_in
#define inb port_byte_in

// VGA register constants
#define VGA_MISC_OUT_REG 0x3C2
#define VGA_SEQ_INDEX_REG 0x3C4
#define VGA_SEQ_DATA_REG 0x3C5
#define VGA_GC_INDEX_REG 0x3CE
#define VGA_GC_DATA_REG 0x3CF
#define VGA_CRTC_INDEX_REG 0x3D4
#define VGA_CRTC_DATA_REG 0x3D5



// Function to initialize VGA
void vgafont() {
    // Clear even/odd mode
    outb(VGA_SEQ_INDEX_REG, 0x05);
    outb(VGA_SEQ_DATA_REG, 0x05);

    // Map VGA memory to 0xA0000
    outb(VGA_GC_INDEX_REG, 0x06);
    outb(VGA_GC_DATA_REG, 0x04);

    // Set bitplane 2
    outb(VGA_SEQ_INDEX_REG, 0x02);
    outb(VGA_SEQ_DATA_REG, 0x04);

    // Clear even/odd mode (the other way)
    outb(VGA_SEQ_DATA_REG, 0x06);

    // Copy charmap (assuming esi points to source address)
    uint8_t* esi = (uint8_t*)0xA0000;
    int charmapSize = 256;
    memcpy(0x1000, esi, 4096);

    // Restore VGA state to normal operation
    outb(VGA_CRTC_INDEX_REG, 0x02);
    outb(VGA_CRTC_DATA_REG, 0x03);
    outb(VGA_CRTC_INDEX_REG, 0x04);
    outb(VGA_CRTC_DATA_REG, 0x02);
    outb(VGA_SEQ_INDEX_REG, 0x05);
    outb(VGA_SEQ_DATA_REG, 0x10);
    outb(VGA_SEQ_INDEX_REG, 0x06);
    outb(VGA_SEQ_DATA_REG, 0x0E);
}

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

void bgamain2() {
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

#include <stdint.h>


// Bochs BGA register constants
#define BGA_INDEX_PORT 0x01CE
#define BGA_DATA_PORT 0x01CF

// Bochs BGA VBE mode setting constants
#define BGA_SET_MODE 0x4
#define BGA_MODE_1024x768 0x118  // Adjust mode number as needed
#define BGA_USE_LFB_BIT 0x4000   // Bit 14: Enable LFB

// Bochs BGA framebuffer address
#define BGA_FRAMEBUFFER_ADDRESS 0xE0000000

// Function to initialize Bochs BGA in VBE mode with LFB enabled
void initializeBochsBGA() {
    printf("hin und weg\n");
    // Set Bochs BGA mode with LFB enabled
    uint16_t mode = BGA_MODE_1024x768 | BGA_USE_LFB_BIT;
    
    outw(BGA_INDEX_PORT, BGA_SET_MODE);
    outw(BGA_DATA_PORT, mode);

    // Additional configuration or error handling can be added here
}

// Function to write a pixel to the Bochs BGA framebuffer
void writePixel(uint32_t x, uint32_t y, uint32_t color) {
    // Calculate the framebuffer address for the pixel
    uint32_t* framebuffer = (uint32_t*)BGA_FRAMEBUFFER_ADDRESS;
    uint32_t offset = y * 1024 + x;  // Assuming 1024x768 resolution
    framebuffer[offset] = color;
}

// Entry point for your kernel
void bgamain() {
    // Call the Bochs BGA initialization function
    initializeBochsBGA();

    // Example: Write a red pixel at coordinates (100, 100)
    writePixel(100, 100, 0xFF0000);

    // Your kernel code goes here
}
