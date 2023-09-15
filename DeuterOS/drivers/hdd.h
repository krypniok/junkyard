// Function to wait until the disk is ready
void waitForDiskReady();

// Function to set the current sector
void setCurrentSector(unsigned int sectorNumber);

// Function to read the current sector
void readCurrentSector(void* buffer);
void readFromHardDrive(unsigned int sectorNumber, unsigned int sectorCount, void* buffer);

// Function to write the current sector
void writeCurrentSector(void* buffer);
void writeToHardDrive(unsigned int sectorNumber, unsigned int sectorCount, void* buffer);

void write_to_disk(uint32_t lba, uint8_t* buffer, uint32_t size_in_bytes);
