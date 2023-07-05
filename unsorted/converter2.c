#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <GL/gl.h>

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
    ParamType paramTypes[10]; // Assuming a maximum of 10 parameters per function
    int numParams;
    void (*functionPtr)(); // Function pointer
    ParamValue params[10]; // Array to store parameters
} Function;

void funcTest(float x, float y, float z) {
    printf("CALLED IT %f %f %f\n", x, y, z);
}

Function LibraryFunctions[] = {
    // OpenGL 2.1
    {"glBegin", {PARAM_TYPE_INT}, 1, (void (*)())glBegin},
    {"glEnd", {}, 0, (void (*)())glEnd},
    {"printf", {PARAM_TYPE_STRING}, 1, (void (*)())printf},
    {"funcTest", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 3, (void (*)())funcTest},
    {"glVertex3f", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 3, (void (*)())glVertex3f},
    // Add more OpenGL functions here
};

void printParam(ParamType type, ParamValue value) {
    switch (type) {
        case PARAM_TYPE_INT:
            printf("%d", value.intValue);
            break;
        case PARAM_TYPE_FLOAT:
            printf("%f", value.floatValue);
            break;
        case PARAM_TYPE_DOUBLE:
            printf("%f", value.doubleValue);
            break;
        case PARAM_TYPE_CHAR:
            printf("%c", value.charValue);
            break;
        case PARAM_TYPE_STRING:
            printf("%s", value.stringValue);
            break;
        case PARAM_TYPE_VOID_PTR:
            printf("%p", value.voidPtrValue);
            break;
        case PARAM_TYPE_SIZE_T:
            printf("%zu", value.sizeValue);
            break;
        case PARAM_TYPE_CHAR_PTR:
            printf("%s", value.charPtrValue);
            break;
        case PARAM_TYPE_INT_PTR:
            printf("%p", value.intPtrValue);
            break;
        case PARAM_TYPE_FLOAT_PTR:
            printf("%p", value.floatPtrValue);
            break;
        default:
            printf("Unknown");
    }
}

void callFunction(const char* functionName, ParamValue params[], int numParams) {
    // Find the function in the LibraryFunctions array based on the function name
    Function* function = NULL;
    for (int i = 0; i < sizeof(LibraryFunctions) / sizeof(Function); i++) {
        if (strcmp(functionName, LibraryFunctions[i].functionName) == 0) {
            function = &LibraryFunctions[i];
            break;
        }
    }

    if (function == NULL) {
        printf("Function not found: %s\n", functionName);
        return;
    }

    printf("Calling function: %s\n", function->functionName);

    if (numParams != function->numParams) {
        printf("Invalid number of parameters for function: %s (%i %i)\n", function->functionName, numParams, function->numParams);
        return;
    }

    // Print the parameters
    printf("Params: ");
    for (int i = 0; i < function->numParams; i++) {
        printParam(function->paramTypes[i], params[i]);
        if (i < function->numParams - 1) {
            printf(", ");
        }
    }
    printf("\n");

    printf("numParams = %i, function->numParams = %i, size = %i\n", numParams, function->numParams, (int)sizeof(ParamValue));
    // Set the parameters in the Function struct
    memcpy(function->params, params, numParams * sizeof(ParamValue));

    // Invoke the function using the provided function pointer and the stored parameters
    switch (function->numParams) {
        case 0:
            ((void (*)())function->functionPtr)();
            break;
        case 1:
            ((void (*)(ParamValue))function->functionPtr)(function->params[0]);
            break;
        case 2:
            ((void (*)(ParamValue, ParamValue))function->functionPtr)(function->params[0], function->params[1]);
            break;
        case 3:
            ((void (*)(float, float, float))function->functionPtr)(function->params[0].floatValue, function->params[1].floatValue, function->params[2].floatValue);
            break;
        // Add cases for more parameter counts if necessary
        default:
            printf("Unsupported number of parameters\n");
            break;
    }

    printf("Function called successfully!\n");
}


int main() {
    // Example usage: Call glVertex3f function
    ParamValue params[] = {
        {.floatValue = 1.3f},
        {.floatValue = 2.5f},
        {.floatValue = 3.1f},
    };
    int numParams = sizeof(params) / sizeof(ParamValue);

    ParamValue params2[] = {
        {.stringValue = "test\n"},
    };
    callFunction("funcTest", params, 3);
    callFunction("printf", params2, 1);


    return 0;
}

