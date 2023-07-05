all: run

kernel.bin: kernel-entry.o kernel.o
	nasm -f elf32 -o kernel-entry.o kernel-entry.asm
	gcc -Wall -pedantic-errors -nostdlib -Wpointer-to-int-cast --no-pie -m32 -ffreestanding -c kernel.c -o kernel.o
	ld -nostdlib -m elf_i386 -o kernel.bin -Ttext 0x1000 --entry=kernel_entry kernel-entry.o kernel.o --oformat binary

mbr.bin: mbr.asm
	nasm -f bin -o mbr.bin mbr.asm

os-image.bin: mbr.bin kernel.bin
	cat mbr.bin kernel.bin > os-image.bin

run: os-image.bin
	dd if=/dev/zero of=disk_image.img bs=512 count=2880
	dd if=os-image.bin of=disk_image.img conv=notrunc

clean:
	rm -f *.bin *.o
