ENTRY(kernel_start_main)

SECTIONS {
    . = 0x100000;

    .my_special_section : AT(0x100000) {
        KEEP(*(.my_special_function))
    }

    .text : ALIGN(16) {
        *(.text)
    }

    /* Andere Sektionen hier */

    /DISCARD/ : {
        *(.comment)
    }
}
