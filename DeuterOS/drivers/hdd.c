#include "ports.h"

// Function to wait until the disk is ready
void waitForDiskReady() {
    unsigned short status;
    do {
        // Read the status register from the disk controller
        __asm__ volatile("inw %%dx, %%ax" : "=a"(status) : "d"(0x1F7));
    } while ((status & 0x0800) != 0x0800);  // Check the status bit 7 (bit 11 in the word) for the ready status
}

// Function to set the current sector
void setCurrentSector(unsigned int sectorNumber) {
    // Issue the command to set the current sector
    __asm__ volatile(
        "outb %%al, %%dx"   // Write the command (0x30) to the command register of the disk controller
        :
        : "a"(0x30), "d"(0x1F2)
    );

    // Write the sector number to the disk controller
    __asm__ volatile(
        "outb %%al, %%dx"   // Write the low byte of the sector number
        :
        : "a"(sectorNumber), "d"(0x1F3)
    );

    // Write the sector number high byte (bits 24-31) to the disk controller
    __asm__ volatile(
        "outb %%al, %%dx"   // Write the high byte of the sector number
        :
        : "a"((sectorNumber >> 8) & 0xFF), "d"(0x1F4)
    );

    // Write the sector number high byte (bits 32-39) to the disk controller
    __asm__ volatile(
        "outb %%al, %%dx"   // Write the highest byte of the sector number
        :
        : "a"((sectorNumber >> 16) & 0xFF), "d"(0x1F5)
    );

    // Write the drive select and LBA mode bits to the disk controller
    __asm__ volatile(
        "outb %%al, %%dx"   // Write the drive select and LBA mode bits
        :
        : "a"((sectorNumber >> 24) & 0x0F), "d"(0x1F6)
    );

    // Wait until the disk is ready
    waitForDiskReady();
}

// Function to read the current sector
void readCurrentSector(void* buffer) {
    unsigned short* wordBuffer = (unsigned short*)buffer;

    // Issue the read command
    __asm__ volatile(
        "movw $0x0201, %%ax\n\t"   // Set up the read command (0x02) and sector count (0x01)
        "outw %%ax, %%dx"         // Write the command to the command register of the disk controller
        :
        : "d"(0x1F7)
        : "ax"
    );

    // Wait until the disk is ready
    waitForDiskReady();

    // Read a sector of data from the disk
    for (unsigned int i = 0; i < 256; ++i) {
        __asm__ volatile(
            "inw %%dx, %%ax"         // Read two bytes from the data register of the disk controller
            : "=a"(wordBuffer[i])
            : "d"(0x1F0)
        );
    }
}

// Function to read from the hard drive using ports
void readFromHardDrive(unsigned int sectorNumber, unsigned int sectorCount, void* buffer) {
    // Temporary variables
    unsigned short* wordBuffer = (unsigned short*)buffer;
    unsigned short status;

    setCurrentSector(sectorNumber);

    // Loop through each sector to read
    for (unsigned int sector = 0; sector < sectorCount; ++sector) {
        // Wait until the disk is ready
      
        do {
            // Read the status register from the disk controller
            __asm__ volatile("inw %%dx, %%ax" : "=a"(status) : "d"(0x1F7));

        } while ((status & 0x0800) != 0x0800);  // Check the status bit 3 (bit 8 in the word) for the ready status

        // Issue the read command
        __asm__ volatile(
            "outw %%ax, %%dx"  // Write the command (0x20) to the command register of the disk controller
            :
            : "a"(0x20), "d"(0x1F7)
        );

        // Wait until the disk is ready
        do {
            __asm__ volatile("inw %%dx, %%ax" : "=a"(status) : "d"(0x1F7));

        } while ((status & 0x0800) != 0x0800);  // Check the status bit 3 (bit 8 in the word) for the ready status

        // Read a sector of data from the disk
        for (unsigned int i = 0; i < 256; ++i) {
            __asm__ volatile(
                "inw %%dx, %%ax"         // Read two bytes from the data register of the disk controller
                : "=a"(wordBuffer[i])
                : "d"(0x1F0)
            );
        }

        // Move to the next sector
        wordBuffer += 256;
    }
}

// Function to write the current sector
void writeCurrentSector(const void* buffer) {
    const unsigned short* wordBuffer = (const unsigned short*)buffer;

    // Issue the write command
    __asm__ volatile(
        "movw $0x0301, %%ax\n\t"   // Set up the write command (0x03) and sector count (0x01)
        "outw %%ax, %%dx"         // Write the command to the command register of the disk controller
        :
        : "d"(0x1F7)
        : "ax"
    );

    // Wait until the disk is ready
    waitForDiskReady();

    // Write a sector of data to the disk
    for (unsigned int i = 0; i < 256; ++i) {
        __asm__ volatile(
            "outw %%ax, %%dx"         // Write two bytes to the data register of the disk controller
            :
            : "a"(wordBuffer[i]), "d"(0x1F0)
        );
    }
}



// Funktion zum Schreiben von Daten auf die Festplatte
void write_to_disk(uint32_t lba, uint8_t* buffer, uint32_t size_in_bytes) {
    uint16_t* buffer16 = (uint16_t*)buffer;
    uint32_t count = (size_in_bytes + 511) / 512; // Aufrunden auf ganze Sektoren

    // Port-Nummern für den IDE-Controller (Primary)
    uint16_t data_port = 0x1F0;     // Datenport
    uint16_t error_port = 0x1F1;    // Fehlerport
    uint16_t sector_count_port = 0x1F2; // Anzahl der Sektoren
    uint16_t lba_low_port = 0x1F3;  // LBA-Adressregister (Niedrige Bits)
    uint16_t lba_mid_port = 0x1F4;  // LBA-Adressregister (Mittlere Bits)
    uint16_t lba_high_port = 0x1F5; // LBA-Adressregister (Hohe Bits)
    uint16_t device_port = 0x1F6;   // Geräte/Auswahlregister
    uint16_t command_port = 0x1F7;  // Befehls-/Statusport

    // Warten, bis der Controller bereit ist
    while ((port_byte_in(command_port) & 0x80) != 0);

    // Senden Sie den Befehl zum Schreiben
    port_byte_out(device_port, 0xE0 | ((lba >> 24) & 0x0F)); // Schreibbefehl für LBA
    port_byte_out(sector_count_port, count);
    port_byte_out(lba_low_port, lba & 0xFF);
    port_byte_out(lba_mid_port, (lba >> 8) & 0xFF);
    port_byte_out(lba_high_port, (lba >> 16) & 0xFF);
    port_byte_out(command_port, 0x30); // Befehl zum Schreiben von Sektoren

    // Warten, bis der Controller bereit ist
    while ((port_byte_in(command_port) & 0x80) != 0);

    // Daten von Speicher auf die Festplatte kopieren
    for (uint32_t i = 0; i < count; i++) {
        for (uint16_t j = 0; j < 256; j++) {
            port_word_out(data_port, buffer16[j]);
        }
        buffer16 += 256;
    }
}

int main() {
    uint8_t data_to_write[512] = "Hello, World!";
    uint32_t size_to_write = sizeof(data_to_write);
    write_to_disk(0, data_to_write, size_to_write); // Schreibe die gegebene Länge in Bytes an LBA 0

    // Hier können Sie mit den geschriebenen Daten auf der Festplatte arbeiten

    return 0;
}


// Function to write to the hard drive using ports
void writeToHardDrive(unsigned int sectorNumber, unsigned int sectorCount, void* buffer) {
    // Temporary variables
    const unsigned short* wordBuffer = (const unsigned short*)buffer;
    unsigned short status;

    setCurrentSector(sectorNumber);

    // Loop through each sector to write
    for (unsigned int sector = 0; sector < sectorCount; ++sector) {

        // Wait until the disk is ready
        do {
            // Read the status register from the disk controller
            __asm__ volatile("inw %%dx, %%ax" : "=a"(status) : "d"(0x1F7));
        } while ((status & 0x0800) != 0x0800);  // Check the status bit 7 (bit 11 in the word) for the ready status

        // Issue the write command
        __asm__ volatile(
            "outw %%ax, %%dx"  // Write the command (0x30) to the command register of the disk controller
            :
            : "a"(0x30), "d"(0x1F7)
        );

        // Wait until the disk is ready
        do {
            __asm__ volatile("inw %%dx, %%ax" : "=a"(status) : "d"(0x1F7));
        } while ((status & 0x0800) != 0x0800);  // Check the status bit 7 (bit 11 in the word) for the ready status


        // Write a sector of data to the disk
        for (unsigned int i = 0; i < 256; ++i) {
            // DEBUG_POINT1
            __asm__ volatile(
                "outw %%ax, %%dx"         // Write two bytes to the data register of the disk controller
                :
                : "a"(wordBuffer[i]), "d"(0x1F0)
            );
        }
        // DEBUG_POINT2
        // Move to the next sector
        wordBuffer += 256;
    }
}
