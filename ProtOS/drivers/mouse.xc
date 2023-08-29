#include <stdbool.h>

#include "keyboard.h"
#include "ports.h"
#include "../cpu/isr.h"
#include "display.h"
#include "../kernel/util.h"
#include "../kernel/kernel.h"

#include "hidden_cmd.h"

#include "mouse.h"

#define PACKETS_IN_PIPE 1024
#define DISCARD_POINT 32

#define MOUSE_IRQ 12

#define MOUSE_PORT   0x60
#define MOUSE_STATUS 0x64
#define MOUSE_ABIT   0x02
#define MOUSE_BBIT   0x01
#define MOUSE_WRITE  0xD4
#define MOUSE_F_BIT  0x20
#define MOUSE_V_BIT  0x08


typedef struct {
    mouse_device_packet_t buffer[PACKETS_IN_PIPE];
    uint32_t read_index;
    uint32_t write_index;
} mouse_buffer_t;

mouse_buffer_t mouse_buffer;

void port_wait(uint8_t a_type) {
    uint32_t timeout = 100000;
    if (!a_type) {
        while (--timeout) {
            if ((port_byte_in(MOUSE_STATUS) & MOUSE_BBIT) == 1) {
                return;
            }
        }
        printf("mouse timeout\n");
        return;
    } else {
        while (--timeout) {
            if (!((port_byte_in(MOUSE_STATUS) & MOUSE_ABIT))) {
                return;
            }
        }
        printf("mouse timeout\n");
        return;
    }
}

void IRQ_OFF() {
    asm volatile ("cli");
}

void IRQ_RES() {
    asm volatile ("sti");
}

void irq_ack(int irq_no) {
    if (irq_no >= 12) {
        port_byte_out(0xA0, 0x20);
    }
    port_byte_out(0x20, 0x20);
}

static void mouse_handler() {
    print_string("_MOUSE\n");
    uint8_t status = port_byte_in(MOUSE_STATUS);
    while (status & MOUSE_BBIT) {
        int8_t mouse_in = port_byte_in(MOUSE_PORT);
        if (status & MOUSE_F_BIT) {
            static uint8_t mouse_cycle = 0;
            static int8_t mouse_byte[3];

            switch (mouse_cycle) {
                case 0:
                    mouse_byte[0] = mouse_in;
                    if (!(mouse_in & MOUSE_V_BIT)) return;
                    ++mouse_cycle;
                    break;
                case 1:
                    mouse_byte[1] = mouse_in;
                    ++mouse_cycle;
                    break;
                case 2:
                    mouse_byte[2] = mouse_in;
                    /* We now have a full mouse packet ready to use */
                    if (mouse_byte[0] & 0x80 || mouse_byte[0] & 0x40) {
                        /* x/y overflow? bad packet! */
                        break;
                    }
                    mouse_device_packet_t packet;
                    packet.x_difference = mouse_byte[1];
                    packet.y_difference = mouse_byte[2];
                    packet.buttons = 0;
                    if (mouse_byte[0] & 0x01) {
                        packet.buttons |= LEFT_CLICK;
                    }
                    if (mouse_byte[0] & 0x02) {
                        packet.buttons |= RIGHT_CLICK;
                    }
                    if (mouse_byte[0] & 0x04) {
                        packet.buttons |= MIDDLE_CLICK;
                    }
                    mouse_cycle = 0;

                    // Write the packet to the buffer
                    uint32_t next_index = (mouse_buffer.write_index + 1) % PACKETS_IN_PIPE;
                    if (next_index != mouse_buffer.read_index) {
                        mouse_buffer.buffer[mouse_buffer.write_index] = packet;
                        mouse_buffer.write_index = next_index;
                    }

                    break;
            }
        }
        status = port_byte_in(MOUSE_STATUS);
    }
    irq_ack(MOUSE_IRQ);
}

void mouse_install() {
    uint8_t status;
  //  IRQ_OFF();
    port_wait(1);
    port_byte_out(MOUSE_STATUS, 0xA8);
    port_wait(1);
    port_byte_out(MOUSE_STATUS, 0x20);
    port_wait(0);
    status = port_byte_in(0x60) | 2;
    port_wait(1);
    port_byte_out(MOUSE_STATUS, 0x60);
    port_wait(1);
    port_byte_out(MOUSE_PORT, status);
    port_byte_out(MOUSE_PORT, 0xF6);
    port_byte_in(MOUSE_PORT);
    port_byte_out(MOUSE_PORT, 0xF4);
    port_byte_in(MOUSE_PORT);
 //   IRQ_RES();
    register_interrupt_handler(MOUSE_IRQ, mouse_handler);
}

int mouse_read_packet(mouse_device_packet_t *packet) {
    if (mouse_buffer.read_index == mouse_buffer.write_index) {
        return 0; // Puffer ist leer
    }
    *packet = mouse_buffer.buffer[mouse_buffer.read_index];
    mouse_buffer.read_index = (mouse_buffer.read_index + 1) % PACKETS_IN_PIPE;
    return sizeof(mouse_device_packet_t);
}

int mouse_write_packet(mouse_device_packet_t *packet) {
    uint32_t next_index = (mouse_buffer.write_index + 1) % PACKETS_IN_PIPE;
    if (next_index == mouse_buffer.read_index) {
        return 0; // Puffer ist voll
    }
    mouse_buffer.buffer[mouse_buffer.write_index] = *packet;
    mouse_buffer.write_index = next_index;
    return sizeof(mouse_device_packet_t);
}
