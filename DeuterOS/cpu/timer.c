#include "timer.h"
#include "../drivers/display.h"
#include "../drivers/ports.h"
#include "../kernel/util.h"
#include "isr.h"

uint32_t tick = 0;

static void timer_callback(registers_t *regs) {
    tick++;
    update_sub_timers(1); // Call this with a suitable interval (e.g., 1 ms) to update sub-timers
}

void sleep(int ms) {
    uint32_t ts = tick;
    while ((tick - ts) < ms) { }
}

unsigned int GetTicks() {
    return tick;
}


void sub_timer_callback() {
    static int count=0;
    // Do something when the sub-timer expires
    // For example: printf("Sub-timer expired!\n");
    printf("%d", count++);
}

// init_custom_timer
void init_timer(uint32_t freq) {
    /* Install the function we just wrote */
    register_interrupt_handler(IRQ0, timer_callback);

    /* Get the PIT value: hardware clock at 1193180 Hz */
    uint32_t divisor = 1193180 / freq;
    uint8_t low  = (uint8_t)(divisor & 0xFF);
    uint8_t high = (uint8_t)((divisor >> 8) & 0xFF);
    /* Send the command */
    port_byte_out(0x43, 0x36); /* Command port */
    port_byte_out(0x40, low);
    port_byte_out(0x40, high);

    add_sub_timer(3000, sub_timer_callback);
}

#define MAX_SUB_TIMERS 10

typedef struct {
    uint32_t remaining_time;
    uint32_t duration;
    void (*callback)(void);
} SubTimer;

SubTimer sub_timers[MAX_SUB_TIMERS];
uint8_t num_sub_timers = 0;

void add_sub_timer(uint32_t duration, void (*callback)(void)) {
    if (num_sub_timers >= MAX_SUB_TIMERS) {
        // Max number of sub-timers reached, handle accordingly
        return;
    }

    sub_timers[num_sub_timers].remaining_time = duration;
    sub_timers[num_sub_timers].duration = duration;
    sub_timers[num_sub_timers].callback = callback;
    num_sub_timers++;
}

void update_sub_timers(uint32_t elapsed_time) {
    for (uint8_t i = 0; i < num_sub_timers; i++) {
        if (sub_timers[i].remaining_time > elapsed_time) {
            sub_timers[i].remaining_time -= elapsed_time;
        } else {
            if (sub_timers[i].callback != NULL) {
                sub_timers[i].callback();
            }

            // Reset the sub-timer to its original duration
            sub_timers[i].remaining_time = sub_timers[i].duration;
        }
    }
}

