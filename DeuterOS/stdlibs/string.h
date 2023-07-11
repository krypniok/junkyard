#include <stddef.h>
#include <stdbool.h>

void byteMove(void* dest, const void* src, size_t numBytes);
void byteSet(void* ptr, int value, size_t numBytes);
size_t byteStringLength(const char* str);
int byteMemcmp(const void* ptr1, const void* ptr2, size_t numBytes);
int byteStrcmp(const char* str1, const char* str2);

int atoi(const char *str);

unsigned long strtoul_custom(const char* str, char** endptr, int base);

char* strstr_custom(const char* haystack, const char* needle);
char* strchr_custom(const char* str, int ch);
char* strtok_custom(char* str, const char* delim);
