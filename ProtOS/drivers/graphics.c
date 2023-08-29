#include "../drivers/ports.h"
#include "graphics.h"

// Function to write to VGA controller ports
void vga_write(uint16_t port, uint8_t index, uint8_t value) {
    // Write index to VGA_MODE_PORT
    port_byte_out(port, index);
    // Write value to VGA_DATA_PORT
    port_byte_out(port + 1, value);
}

// Set up the 320x200 graphics mode
void setup_graphics_mode() {
    // Initialize VGA controller
    vga_write(VGA_MISC_PORT, VGA_MISC_REGISTER, 0x63);
    
    // Set video mode 320x200
    vga_write(VGA_MODE_PORT, VGA_MODE_REGISTER, 0x13);
}
