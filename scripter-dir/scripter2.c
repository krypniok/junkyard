#include <dlfcn.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define MAX_PARAMS 10
#define STACK_SIZE 1024

typedef enum {
    PARAM_TYPE_INT,
    PARAM_TYPE_FLOAT,
    PARAM_TYPE_DOUBLE,
    PARAM_TYPE_CHAR,
    PARAM_TYPE_STRING,
    PARAM_TYPE_VOID_PTR,
    PARAM_TYPE_SIZE_T,
    PARAM_TYPE_CHAR_PTR,
    PARAM_TYPE_INT_PTR,
    PARAM_TYPE_FLOAT_PTR,
    PARAM_TYPE_VAR_ARGS,
} ParamType;

typedef union {
    int intValue;
    float floatValue;
    double doubleValue;
    char charValue;
    char* stringValue;
    void* voidPtrValue;
    size_t sizeValue;
    char* charPtrValue;
    int* intPtrValue;
    float* floatPtrValue;
    va_list varArgsValue;
} ParamValue;

typedef struct {
    const char* functionName;
    ParamType paramTypes[MAX_PARAMS];
    int numParams;
    void (*functionPtr)();
    ParamValue params[MAX_PARAMS];
} Function;

void parseScriptLine(const char* line, Function* function) {
    char* token;
    char* rest = strdup(line);
    int paramIndex = 0;

    // Extract function name
    token = strtok(rest, "(");
    function->functionName = strdup(token);

    // Extract function parameters
    while ((token = strtok(NULL, ",")) != NULL && paramIndex < MAX_PARAMS) {
        // Remove leading/trailing whitespace
        while (*token == ' ')
            token++;

        // Check for parameter type and convert accordingly
        if (strncmp(token, "0x", 2) == 0) {
            // Hexadecimal value
            intptr_t value = (intptr_t)strtol(token, NULL, 16);
            function->paramTypes[paramIndex] = PARAM_TYPE_VOID_PTR;
            function->params[paramIndex].voidPtrValue = (void*)value;
        } else if (strncmp(token, "\"", 1) == 0) {
            // String parameter
            char* stringParam = strdup(token + 1);
            char* lastChar = strchr(stringParam, '\"');
            if (lastChar != NULL)
                *lastChar = '\0';
            // Replace \\n with \n
            char* lineBreak = strstr(stringParam, "\\n");
            while (lineBreak != NULL) {
                *lineBreak = '\n';
                strcpy(lineBreak + 1, lineBreak + 2);
                lineBreak = strstr(stringParam, "\\n");
            }
            function->paramTypes[paramIndex] = PARAM_TYPE_STRING;
            function->params[paramIndex].stringValue = stringParam;
        } else if (strncmp(token, "'", 1) == 0) {
            // Character parameter
            char charParam = token[1];
            function->paramTypes[paramIndex] = PARAM_TYPE_CHAR;
            function->params[paramIndex].charValue = charParam;
        } else if (strcmp(token, "int") == 0) {
            // Integer parameter
            function->paramTypes[paramIndex] = PARAM_TYPE_INT;
        } else if (strcmp(token, "float") == 0) {
            // Float parameter
            function->paramTypes[paramIndex] = PARAM_TYPE_FLOAT;
        } else {
            fprintf(stderr, "Error: Unsupported parameter type for parameter %d.\n", paramIndex + 1);
            free(rest);
            return;
        }

        paramIndex++;
    }

    function->numParams = paramIndex;

    free(rest);
}


void callFunction(Function* function) {
    // Dynamically load the shared library
    void* handle = dlopen(NULL, RTLD_LAZY);

    if (handle == NULL) {
        fprintf(stderr, "Error: Failed to load shared library.\n");
        return;
    }

    // Find the function symbol
    function->functionPtr = dlsym(handle, function->functionName);

    if (function->functionPtr == NULL) {
        fprintf(stderr, "Error: Failed to find function '%s'.\n", function->functionName);
        dlclose(handle);
        return;
    }

    // Prepare an array to hold the converted parameter values
    void* convertedParams[MAX_PARAMS];
    memset(convertedParams, 0, sizeof(convertedParams));

    // Convert and dereference the parameters
    for (int i = 0; i < function->numParams; i++) {
        switch (function->paramTypes[i]) {
            case PARAM_TYPE_INT_PTR:
                convertedParams[i] = &(function->params[i].intValue);
                break;
            case PARAM_TYPE_FLOAT_PTR:
                convertedParams[i] = &(function->params[i].floatValue);
                break;
            default:
                convertedParams[i] = &(function->params[i]);
                break;
        }
    }

    // Call the function with the converted parameters
    switch (function->numParams) {
        case 0:
            ((void (*)())function->functionPtr)();
            break;
        case 1:
            ((void (*)(void*))function->functionPtr)(convertedParams[0]);
            break;
        case 2:
            ((void (*)(void*, void*))function->functionPtr)(
                convertedParams[0], convertedParams[1]);
            break;
        case 3:
            ((void (*)(void*, void*, void*))function->functionPtr)(
                convertedParams[0], convertedParams[1], convertedParams[2]);
            break;
        // Add more cases for higher number of parameters if needed
        default:
            fprintf(stderr, "Error: Unsupported number of parameters (%d).\n", function->numParams);
    }

    // Close the shared library
    dlclose(handle);
}


int main() {
    char line[256];
    Function function;

    printf("Function: ");
    fgets(line, sizeof(line), stdin);
    line[strcspn(line, "\n")] = '\0'; // remove newline character

    parseScriptLine(line, &function);
    callFunction(&function);

    return 0;
}
