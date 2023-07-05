boot_sector_src = boot_sector.asm
kernel_src = kernel.asm

disk_image = disk_image.img

all: $(disk_image)

$(disk_image): $(boot_sector_src) $(kernel_src)
	nasm -f bin -o boot_sector.bin $(boot_sector_src)
	nasm -f bin -o kernel.bin $(kernel_src)
	dd if=/dev/zero of=$(disk_image) bs=512 count=2880
	dd if=boot_sector.bin of=$(disk_image) conv=notrunc
	dd if=kernel.bin of=$(disk_image) bs=512 seek=1 conv=notrunc

clean:
	rm -f boot_sector.bin kernel.bin $(disk_image)

