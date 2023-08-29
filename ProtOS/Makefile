# $@ = target file
# $< = first dependency
# $^ = all dependencies

# detect all .o files based on their .c source
C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c stdlibs/*.c programs/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h stdlibs/*.h programs/*.h)
OBJ_FILES = ${C_SOURCES:.c=.o cpu/interrupt.o cpu/isr.o} # Added cpu/isr.o here

# List of object files for kernel1
KERNEL_OBJ_FILES = boot/kernel_entry.o kernel/main.o stdlibs/string.o kernel/mem.o stdlibs/memory.o kernel/util.o cpu/interrupt.o cpu/isr.o cpu/idt.o drivers/ports.o drivers/display.o drivers/hdd.o # Add other necessary object files

# List of object files for kernel2
#KERNEL2_OBJ_FILES = kernel/kernel.o $(OBJ_FILES) # Add other necessary object files for kernel2
KERNEL2_OBJ_FILES = kernel/kernel.o $(filter-out kernel/main.o, $(OBJ_FILES)) # Add other necessary object files for kernel2


# First rule is the one executed when no parameters are fed to the Makefile
all: run

# Read current revision number from file
CURRENT_REVISION := $(shell cat version.txt)
CURRENT_DATE := $(shell date)

# Increment the revision number
NEW_REVISION := $(shell expr $(CURRENT_REVISION) + 1)

# Update the version file with the new revision number
$(shell echo $(NEW_REVISION) > version.txt)

# Define revision number as a preprocessor macro
CFLAGS := -DREVISION_NUMBER=$(NEW_REVISION) -DREVISION_DATE='"$(CURRENT_DATE)"'

# Notice how dependencies are built as needed

# Linker scripts
KERNEL_LD = kernel.ld
KERNEL2_LD = kernel2.ld

# Kernel binaries
KERNEL_BIN = kernel.bin
KERNEL2_BIN = kernel2.bin

# Kernel ELF files (only for debugging)
KERNEL_ELF = kernel.elf
KERNEL2_ELF = kernel2.elf

# Build kernel.bin
$(KERNEL_BIN): $(KERNEL_OBJ_FILES)
	ld -nostdlib -m elf_i386 -o $@ -T $(KERNEL_LD) $^ --oformat binary

# Build kernel2.bin
$(KERNEL2_BIN): $(KERNEL2_OBJ_FILES)
	ld -nostdlib -m elf_i386 -o $@ -T $(KERNEL2_LD) $^ --oformat binary

# Add loader.bin as a dependency for os-image.bin
os-image.bin: boot/mbr.bin $(KERNEL_BIN) $(KERNEL2_BIN)
	cat $^ > $@

run: os-image.bin
	dd if=/dev/zero of=disk_image.img bs=512 count=2880
	dd if=os-image.bin of=disk_image.img conv=notrunc
	qemu-system-i386 -rtc "base=2023-08-03T12:34:56" -drive format=raw,file=disk_image.img

echo: os-image.bin
	xxd $<

# only for debug
kernel.elf: boot/kernel_entry.o ${OBJ_FILES}
	ld -nostdlib -m elf_i386 -o $@ -Ttext 0x1000 $^

debug: os-image.bin kernel.elf
	qemu-system-i386 -s -S -fda disk_image.img -d guest_errors,int &
	gdb -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

%.o: %.c ${HEADERS}
	gcc -fno-PIC -nostdlib --no-pie -m32 -ffreestanding -O0 $(CFLAGS) -c $< -o $@ # -g for debugging

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

%.dis: %.bin
	ndisasm -b 32 $< > $@

clean:
	$(RM) *.bin *.o *.dis *.elf
	$(RM) kernel/*.o
	$(RM) boot/*.o boot/*.bin
	$(RM) drivers/*.o
	$(RM) cpu/*.o
