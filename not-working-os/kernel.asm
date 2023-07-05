[bits 16]

section .text
    org 0x8000

    kernel_entry:
        ; Print message
        mov si, kernel_message
        call print_string

        jmp 0x7C00

        ; Halt the system
        cli
        hlt

    print_string:
        lodsb ; Load next character from SI
        test al, al ; Check if end of string
        jz print_string_done
        mov ah, 0x0E ; BIOS teletype function
        mov bh, 0x00 ; Display page
        mov bl, 0x07 ; Text attribute
        int 0x10 ; Call BIOS interrupt
        jmp print_string

    print_string_done:
        ret

    kernel_message db "Hello from the kernel!", 0x0D, 0x10, 0x00

