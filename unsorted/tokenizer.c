#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <GL/gl.h>

typedef struct {
    void (*functionPointer)();
    void* parameters[4]; // Maximum of 4 parameters
} FunctionCall;

typedef struct {
    const char* functionName;
    FunctionCall functionCall;
    int numParameters;
    const char* parameterTypes[4]; // Maximum of 4 parameters
} OpenGLFunction;

void dispatchFunctionCall(FunctionCall* functionCall);

OpenGLFunction openglFunctions[] = {
    {
        "glClear",
        { (void (*)())glClear, { "GLbitfield", NULL, NULL, NULL } },
        1,
        { "GLbitfield", NULL, NULL, NULL }
    },
    {
        "glClear",
        { (void (*)())glClear, { "GLbitfield", NULL, NULL, NULL } },
        1,
        { "GLbitfield", NULL, NULL, NULL }
    },
    {
        "glClearColor",
        { (void (*)())glClearColor, { "GLfloat", "GLfloat", "GLfloat", "GLfloat" } },
        4,
        { "GLfloat", "GLfloat", "GLfloat", "GLfloat" }
    },
    {
        "glViewport",
        { (void (*)())glViewport, { "GLint", "GLint", "GLsizei", "GLsizei" } },
        4,
        { "GLint", "GLint", "GLsizei", "GLsizei" }
    },
    {
        "glMatrixMode",
        { (void (*)())glMatrixMode, { "GLenum", NULL, NULL, NULL } },
        1,
        { "GLenum", NULL, NULL, NULL }
    },
    // Rest of the OpenGL functions...
};

void tokenizeAndCallFunction(const char* command) {
    char* commandCopy = strdup(command);
    char* functionName = strtok(commandCopy, "(");
    
    OpenGLFunction* matchedFunction = NULL;
    
    for (int i = 0; i < sizeof(openglFunctions) / sizeof(openglFunctions[0]); i++) {
        if (strcmp(openglFunctions[i].functionName, functionName) == 0) {
            matchedFunction = &openglFunctions[i];
            break;
        }
    }
    
    if (matchedFunction == NULL) {
        printf("Error: Invalid function name\n");
        free(commandCopy);
        return;
    }
    
    char* parameters = strtok(NULL, ")");
    char* parameter = strtok(parameters, ",");
    
    int paramIndex = 0;
    
    while (parameter != NULL && paramIndex < matchedFunction->numParameters) {
        matchedFunction->functionCall.parameters[paramIndex] = parameter;
        
        parameter = strtok(NULL, ",");
        paramIndex++;
    }
    
    // Call the dispatcher function with the temporary struct
    dispatchFunctionCall(&matchedFunction->functionCall);
    
    free(commandCopy);
}

// Dispatcher function to call the OpenGL functions with the parsed parameters
void dispatchFunctionCall(FunctionCall* functionCall) {
    if (functionCall == NULL || functionCall->functionPointer == NULL) {
        printf("Error: Invalid function call\n");
        return;
    }
    
    if (functionCall->functionPointer == (void (*)())glClear) {
        GLbitfield mask = *(GLbitfield*)functionCall->parameters[0];
        glClear(mask);
    } else if (functionCall->functionPointer == (void (*)())glClearColor) {
        GLfloat red =  atof(functionCall->parameters[0]);
        GLfloat green = *(GLfloat*)functionCall->parameters[1];
        GLfloat blue = *(GLfloat*)functionCall->parameters[2];
        GLfloat alpha = *(GLfloat*)functionCall->parameters[3];
        glClearColor(red, green, blue, alpha);
        printf("test %f %s %f %f\n", red, (char*)functionCall->parameters[1], blue, alpha);
    } else if (functionCall->functionPointer == (void (*)())glViewport) {
        GLint x = *(GLint*)functionCall->parameters[0];
        GLint y = *(GLint*)functionCall->parameters[1];
        GLsizei width = *(GLsizei*)functionCall->parameters[2];
        GLsizei height = *(GLsizei*)functionCall->parameters[3];
        glViewport(x, y, width, height);
    } else if (functionCall->functionPointer == (void (*)())glMatrixMode) {
        GLenum mode = *(GLenum*)functionCall->parameters[0];
        glMatrixMode(mode);
    } else {
        printf("Error: Unsupported function call\n");
    }
}

int main() {
    const char* command = "glClearColor(1.0f, 1.0f, 1.0f, 1.0f);";
    tokenizeAndCallFunction(command);

    return 0;
}
