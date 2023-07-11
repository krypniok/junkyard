#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

// VGA controller ports
#define VGA_MISC_PORT       0x3C2
#define VGA_MODE_PORT       0x3D4
#define VGA_DATA_PORT       0x3D5

// VGA mode registers
#define VGA_MODE_REGISTER   0x03
#define VGA_MISC_REGISTER   0x05

// Video buffer
#define VIDEO_BUFFER_WIDTH  320
#define VIDEO_BUFFER_HEIGHT 200
#define VIDEO_BUFFER_SIZE   (VIDEO_BUFFER_WIDTH * VIDEO_BUFFER_HEIGHT)

// Function to write to VGA controller ports
void vga_write(uint16_t port, uint8_t index, uint8_t value);
// Set up the 320x200 graphics mode
void setup_graphics_mode();
