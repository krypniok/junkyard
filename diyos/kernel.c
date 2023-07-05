#include <stdint.h>
#include <stddef.h>

// IDT entry structure
struct idt_entry
{
    uint16_t offset_low;
    uint16_t selector;
    uint8_t zero;
    uint8_t type_attr;
    uint16_t offset_high;
};

// IDT descriptor structure
struct idt_descriptor
{
    uint16_t limit;
    uint32_t base;
};

// Declare the IDT with 256 entries
struct idt_entry idt[256];

// Declare the IDT descriptor
struct idt_descriptor idt_desc;

void printChar(unsigned char x, unsigned char y, unsigned char cl, char c);

char receivedChar = 'Q';

// Interrupt Service Routine (ISR) function for keyboard interrupt (IRQ 1)
void keyboard_isr()
{
    // Read the character from the keyboard
    char c;
    asm volatile(
        "xor %%ah, %%ah\n"
        "int $0x16\n"
        "mov %%al, %0\n"
        : "=r"(c)
        :
        : "%eax");

    // Store the received character in the global variable
    receivedChar = c;

    printChar(0,1,0x0f,'X');

    // Acknowledge the interrupt
    asm volatile("movb $0x20, %al; outb %al, $0x20");
}

// Function to initialize the IDT entry
void idt_set_entry(int index, uint32_t offset, uint16_t selector, uint8_t type_attr)
{
    idt[index].offset_low = offset & 0xFFFF;
    idt[index].offset_high = (offset >> 16) & 0xFFFF;
    idt[index].selector = selector;
    idt[index].zero = 0;
    idt[index].type_attr = type_attr;
}

// Function to load the IDT
void load_idt()
{
    idt_desc.limit = sizeof(idt) - 1;
    idt_desc.base = (uint32_t)&idt;

    // Load the IDT
    asm volatile("lidt %0"
                 :
                 : "m"(idt_desc));
}

// Function to initialize the IDT
void init_idt()
{
    // Set up the IDT entry for the keyboard interrupt (IRQ 1)
    idt_set_entry(0x21, (uint32_t)keyboard_isr, 0x08, 0x8E);

    // Load the IDT
    load_idt();
}

// Function to set video mode using BIOS interrupt 0x10
void setVideoMode(unsigned char mode)
{
    asm volatile(
        "movb %0, %%ah\n"
        "int $0x10\n"
        :
        : "r"(mode)
        : "%ah");
}

// Function to read a character from the console
char getchar()
{
    char c;
    asm volatile(
        "mov $0x00, %%ah\n" // BIOS interrupt 0x16 function 0x00
        "int $0x16\n"
        "mov %%al, %0\n"
        : "=r"(c)
        :
        : "%eax");
    return c;
}

// Function to calculate the absolute value of an integer
int abs(int n)
{
    int result;
    asm volatile(
        "mov %1, %%eax\n"
        "test %%eax, %%eax\n"
        "jns 1f\n"
        "neg %%eax\n"
        "1: mov %%eax, %0\n"
        : "=r"(result)
        : "r"(n)
        : "%eax");
    return result;
}

// Function to draw a pixel at the specified coordinates and color
void drawPixel(int x, int y, unsigned char color)
{
    unsigned char *video_memory = (unsigned char *)0xA0000;
    unsigned int offset = y * 320 + x;
    video_memory[offset] = color;
}

// Function to draw a line using Bresenham's algorithm
void drawLine(int x1, int y1, int x2, int y2, unsigned char color)
{
    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;
    int err = dx - dy;

    while (1)
    {
        drawPixel(x1, y1, color);

        if (x1 == x2 && y1 == y2)
        {
            break;
        }

        int err2 = 2 * err;

        if (err2 > -dy)
        {
            err -= dy;
            x1 += sx;
        }

        if (err2 < dx)
        {
            err += dx;
            y1 += sy;
        }
    }
}

// Function to print a colored character to the screen
// TODO: shorten by using unsigned short*
void printChar(unsigned char x, unsigned char y, unsigned char cl, char c)
{
    unsigned char *videomemory = (unsigned char *)0xb8000 + (y << 7) + (y << 5) + (x << 1);
    *videomemory = c;
    videomemory++;
    // Set character and attribute (0x0F is white on black)
    *videomemory = cl;
    videomemory++;
}

void printChar2(unsigned char x, unsigned char y, unsigned char cl, char c)
{
    unsigned short *videomemory = (unsigned short *)0xb8000 + (y << 7) + (y << 5) + x;
    *videomemory = c | ((unsigned short)cl << 8);
}

// Function to print a null-terminated string to the screen
void printString(unsigned char *str)
{
    unsigned char *sp = str;
    // console cursor position
    static unsigned char x = 0, y = 0;
    while (*sp != '\0')
    {
        if (*sp == '\n')
        {
            y++;
            x = 0;
            sp++;
        }
        printChar(x, y, 0x0F, *sp);
        x++;
        sp++;
    }
}

#include <stdarg.h>

// Helper function to convert an integer to a string
void intToString(int value, char *buffer)
{
    if (value == 0)
    {
        buffer[0] = '0';
        buffer[1] = '\0';
        return;
    }

    int numDigits = 0;
    int temp = value;

    // Count the number of digits
    while (temp != 0)
    {
        numDigits++;
        temp /= 10;
    }

    // Convert the integer to a string in reverse order
    for (int i = numDigits - 1; i >= 0; i--)
    {
        buffer[i] = '0' + (value % 10);
        value /= 10;
    }

    buffer[numDigits] = '\0';
}

// Helper function to convert a pointer to a string
void pointerToString(void *ptr, char *buffer)
{
    unsigned long value = (unsigned long)ptr;

    // Convert the pointer value to a string in hexadecimal format
    for (int i = 0; i < sizeof(void *) * 2; i++)
    {
        int digit = (value >> (sizeof(void *) * 8 - 4)) & 0xF;
        buffer[i] = (digit < 10) ? ('0' + digit) : ('A' + digit - 10);
        value <<= 4;
    }

    buffer[sizeof(void *) * 2] = '\0';
}

// Custom sprintf function
int sprintf(unsigned char *buffer, const char *format, ...)
{
    va_list args;
    va_start(args, format);

    int charsWritten = 0;

    while (*format != '\0')
    {
        if (*format == '%')
        {
            format++; // Skip the '%'

            // Handle format specifiers
            switch (*format)
            {
            case 's':
            {
                // String argument
                const char *str = va_arg(args, const char *);

                // Copy the string to the buffer
                while (*str != '\0')
                {
                    buffer[charsWritten++] = *str++;
                }
                break;
            }
            case 'd':
            {
                // Integer argument
                int value = va_arg(args, int);

                // Convert the integer to a string
                char intBuffer[12]; // Assumes a maximum of 12 digits for an integer
                intToString(value, intBuffer);

                // Copy the string to the buffer
                int i = 0;
                while (intBuffer[i] != '\0')
                {
                    buffer[charsWritten++] = intBuffer[i++];
                }
                break;
            }
            case 'p':
            {
                // Pointer argument
                void *ptr = va_arg(args, void *);

                // Convert the pointer to a string
                char ptrBuffer[sizeof(void *) * 2 + 1]; // Assumes a maximum of sizeof(void*) * 2 digits for a pointer
                pointerToString(ptr, ptrBuffer);

                // Copy the string to the buffer
                int i = 0;
                while (ptrBuffer[i] != '\0')
                {
                    buffer[charsWritten++] = ptrBuffer[i++];
                }
                break;
            }
                // Add support for additional format specifiers as needed

            default:
                // Unsupported format specifier, ignore it
                break;
            }
        }
        else
        {
            // Regular character, copy it to the buffer
            buffer[charsWritten++] = *format;
        }

        format++;
    }

    // Null-terminate the buffer
    buffer[charsWritten] = '\0';

    va_end(args);

    return charsWritten;
}

void hexDump(void *ptr, size_t size)
{
    unsigned char *data = (unsigned char *)ptr;
    const int bytesPerLine = 16;
    unsigned char *address = (unsigned char *)ptr;

    for (size_t i = 0; i < size; i += bytesPerLine)
    {
        // Print the memory address
        unsigned int addressValue = (unsigned int)((uintptr_t)address);
        unsigned char addressBuffer[9];
        for (int j = 0; j < 8; j++)
        {
            unsigned char nibble = (addressValue >> (28 - j * 4)) & 0xF;
            addressBuffer[j] = nibble < 10 ? nibble + '0' : nibble - 10 + 'A';
        }
        addressBuffer[8] = '\0'; // Null-terminate the address string

        // Print the address string character by character
        for (int j = 0; j < 8; j++)
        {
            printChar(j, i / bytesPerLine, 0x0F, addressBuffer[j]);
        }

        printChar(8, i / bytesPerLine, 0x0F, ':');

        // Print the hexadecimal and ASCII representation
        for (int j = 0; j < bytesPerLine; j++)
        {
            if (i + j < size)
            {
                // Print the hexadecimal value
                unsigned char value = data[i + j];
                unsigned char upperNibble = (value >> 4) & 0xF;
                unsigned char lowerNibble = value & 0xF;
                printChar(10 + (j * 3), i / bytesPerLine, 0x0F, upperNibble < 10 ? upperNibble + '0' : upperNibble - 10 + 'A');
                printChar(11 + (j * 3), i / bytesPerLine, 0x0F, lowerNibble < 10 ? lowerNibble + '0' : lowerNibble - 10 + 'A');

                // Print the ASCII representation
                unsigned char character = (value >= 32 && value <= 126) ? value : '.';
                printChar(61 + j, i / bytesPerLine, 0x0F, character);
            }
            else
            {
                // Print empty spaces
                printChar(10 + (j * 3), i / bytesPerLine, 0x0F, ' ');
                printChar(11 + (j * 3), i / bytesPerLine, 0x0F, ' ');
                printChar(61 + j, i / bytesPerLine, 0x0F, ' ');
            }
        }

        address += bytesPerLine;
    }
}

void main()
{

    init_idt();

    // setVideoMode(0x13);  // Set video mode 320x200x256

    //    drawLine(0, 0, 319, 199, 15);  // Draw a line from top-left to bottom-right in white color

    unsigned char str[] = "Escape\nespacE\nThree\n\n";
    //  printString(str);  // Pass the string variable as an argument

    //    hexDump(str,200);

    void *ptr = (void *)0xDEADBEEF; // Get a pointer value
    unsigned char buffer[50];
    sprintf(buffer, "Pointer value: %p", ptr);
    printString(buffer);
 

    while(1) {
    printChar(0, 0, 0x0F, 'Q');
    }

    //   getchar();  // Wait for a key press to exit the program

    //   setVideoMode(0x03);  // Set video mode back to text mode

    return;
}
