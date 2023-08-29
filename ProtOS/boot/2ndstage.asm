[bits 32]
BEGIN_32BIT:

  ; pusha
  ; mov esi, 0x1000  ; Source address
  ; mov edi, 0x100000 ; Destination address
  ; mov ecx, 0xFFFF  ; Length of data to move
  ; cld             ; Set the direction flag to forward
  ; rep movsb       ; Move the data from source to destination
  ; popa

   call 0x1000 ; Give control to the kernel
   jmp $ ; Stay here when the kernel returns control to us (if ever)
