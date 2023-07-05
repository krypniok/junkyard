[bits 16]

section .text
    org 0x7C00

boot_sector_entry:
    ; Set up stack
    mov ax, 0x9000
    mov ss, ax
    mov sp, 0xFFFF

    ; Print boot message
    mov si, boot_message
    call print_string

    ; Load kernel to memory
    mov bx, kernel_load_address
    mov es, bx
    mov bx, kernel_load_segment
    mov ah, 0x02 ; BIOS read function
    mov al, sectors_to_load ; Number of sectors to read
    mov ch, 0x00 ; Cylinder
    mov cl, 0x02 ; Sector
    mov dh, 0x00 ; Head
    int 0x13 ; Call BIOS interrupt

    ; Check if kernel is loaded successfully
    cmp al, 0x00 ; AL should be 0x00 on successful load
    jne load_error

    ; Print kernel loaded message
    mov si, kernel_loaded_message
    call print_string

    ; Dump memory contents
    mov si, memory_dump_message
    call print_string

   ; mov bx, kernel_load_address
   ; mov cx, kernel_load_address + kernel_size
   ; call hex_dump

    ; Jump to loaded kernel
    jmp dword kernel_load_segment:kernel_load_address
    jmp boot_sector_entry

print_string:
    lodsb ; Load next character from SI
    test al, al ; Check if end of string
    jz print_string_done
    mov ah, 0x0E ; BIOS teletype function
    int 0x10 ; Call BIOS interrupt
    jmp print_string

print_string_done:
    ret

hex_dump:
    pusha
    mov dx, 0x0000 ; Segment address for ES:DI
    mov di, 0x7C00 ; Offset address for ES:DI

dump_loop:
    mov al, [bx] ; Load byte from memory
    call print_byte_hex ; Print byte as hexadecimal
    inc bx ; Increment memory address
    cmp bx, cx ; Check if end address reached
    jle dump_loop ; Loop if not reached
    popa
    ret

print_byte_hex:
    pusha
    mov bl, ah ; Save AH register
    mov ah, 0x0E ; BIOS teletype function
    mov cl, 4 ; Shift count for nibble
    shr al, cl ; Shift right to get high nibble
    call print_nibble_hex ; Print high nibble
    mov al, bl ; Restore AH register
    mov cl, 4 ; Shift count for nibble
    shl al, cl ; Shift left to get low nibble
    shr al, cl ; Shift right to get low nibble
    call print_nibble_hex ; Print low nibble
    popa
    ret

print_nibble_hex:
    add al, 0x30 ; Convert value to ASCII
    cmp al, 0x3A ; Check if value is in range 0-9
    jge print_nibble_hex_letter ; Jump if not in range
    int 0x10 ; Call BIOS interrupt
    ret

print_nibble_hex_letter:
    add al, 0x07 ; Convert value to ASCII for A-F
    int 0x10 ; Call BIOS interrupt
    ret

load_error:
    ; Print kernel load error message
    mov si, kernel_load_error_message
    call print_string
    jmp $

boot_message db "Boot sector loaded successfully!", 0x0D, 0x0A, 0x00
kernel_loaded_message db "Kernel loaded successfully!", 0x0D, 0x0A, 0x00
kernel_load_error_message db "Kernel load error!", 0x0D, 0x0A, 0x00
memory_dump_message db "Memory dump from ", 0x0D, 0x0A, 0x00
start_address dw 0x7C00 ; Start address for memory dump
end_address dw 0x7DFF ; End address for memory dump
kernel_load_address dw 0x8000 ; Destination memory address
kernel_load_segment dw 0x0000 ; Destination segment
sectors_to_load db 2 ; Number of sectors to load

; Kernel binary size in bytes
kernel_size equ $ - kernel_load_address

times 510-($-$$) db 0
dw 0xAA55 ; Boot signature

