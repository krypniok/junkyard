#include <dlfcn.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define MAX_PARAMS 10

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
        } else {
            // Numeric parameter
            double value = strtod(token, NULL);
            intptr_t intValue = (intptr_t)value;
            if (value == (double)intValue) {
                function->paramTypes[paramIndex] = PARAM_TYPE_INT;
                function->params[paramIndex].intValue = (int)intValue;
            } else {
                function->paramTypes[paramIndex] = PARAM_TYPE_FLOAT;
                function->params[paramIndex].floatValue = (float)value;
            }
        }
        paramIndex++;
    }

    function->numParams = paramIndex;

    free(rest);
}


void printParam(const ParamValue* param, ParamType paramType) {
    switch (paramType) {
        case PARAM_TYPE_INT:
            printf("%d", param->intValue);
            break;
        case PARAM_TYPE_FLOAT:
            printf("%g", param->floatValue);
            break;
        case PARAM_TYPE_DOUBLE:
            printf("%lf", param->doubleValue);
            break;
        case PARAM_TYPE_CHAR:
            printf("%c", param->charValue);
            break;
        case PARAM_TYPE_STRING:
            // Escape special characters within the string
            for (int i = 0; param->stringValue[i] != '\0'; i++) {
                if (param->stringValue[i] == '\n')
                    printf("\\n");
                else
                    printf("%c", param->stringValue[i]);
            }
            break;
        case PARAM_TYPE_VOID_PTR:
            printf("%p", param->voidPtrValue);
            break;
        case PARAM_TYPE_SIZE_T:
            printf("%zu", param->sizeValue);
            break;
        case PARAM_TYPE_CHAR_PTR:
            printf("%s", param->charPtrValue);
            break;
        case PARAM_TYPE_INT_PTR:
            printf("%d", *(param->intPtrValue));
            break;
        case PARAM_TYPE_FLOAT_PTR:
            printf("%f", *(param->floatPtrValue));
            break;
        default:
            printf("Unsupported parameter type\n");
            break;
    }
}

void strtocall(const char* script, Function* function) {
    // Parse script line by line
    char* scriptCopy = strdup(script);
    char* line = strtok(scriptCopy, "\n");
    while (line != NULL) {
        memset(function, 0, sizeof(Function));
        parseScriptLine(line, function);
        // Process function call
        printf("Function: %s\n", function->functionName);
        for (int i = 0; i < function->numParams; i++) {
            printf("Parameter %d (%d): ", i, function->paramTypes[i]);
            printParam(&function->params[i], function->paramTypes[i]);
            printf("\n");
        }
        line = strtok(NULL, "\n");
    }
    free(scriptCopy);
}

int main() {
    const char* libraryName = "libGL.so";
    const char* functionName = "printf";

    // Open the dynamic library
    void* libHandle = dlopen(libraryName, RTLD_LAZY);
    if (libHandle == NULL) {
        // Handle the error
        printf("Failed to open library: %s\n", dlerror());
        return 1;
    }

    // Retrieve the function symbol
    void* funcPtr = dlsym(libHandle, functionName);
    if (funcPtr == NULL) {
        // Handle the error
        printf("Failed to find function: %s\n", dlerror());
        dlclose(libHandle);
        return 1;
    }

    Function function;
    memset(&function, 0, sizeof(Function));

    const char* script = "printf(\"string %s %f\\n\", \"str\", 3.14)";

    
    strtocall(script, &function);

    function.functionPtr = (void (*)())funcPtr;

    if (function.functionPtr != NULL) {
        // Call the function through the function pointer with the parsed parameters
        switch (function.numParams) {
            case 0:
                ((void (*)())function.functionPtr)();
                break;
            case 1:
                ((void (*)(void*))function.functionPtr)(function.params[0].voidPtrValue);
                break;
            case 2:
                ((void (*)(void*, void*))function.functionPtr)(function.params[0].voidPtrValue, function.params[1].voidPtrValue);
                break;
            case 3:
                ((void (*)(const char*, const char*, double))function.functionPtr)(function.params[0].stringValue, function.params[1].stringValue, function.params[2].floatValue);
                break;
            // Add more cases for different number of parameters as needed
            default:
                printf("Invalid number of parameters: %d\n", function.numParams);
                break;
        }
    }

    // Close the dynamic library
    dlclose(libHandle);

    return 0;
}
