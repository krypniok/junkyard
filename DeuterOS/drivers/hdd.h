// Function to wait until the disk is ready
void waitForDiskReady();
// Function to set the current sector
void setCurrentSector(unsigned int sectorNumber);
// Function to read the current sector
void readCurrentSector(void* buffer);

void readFromHardDrive(unsigned int sectorNumber, unsigned int sectorCount, void* buffer);
