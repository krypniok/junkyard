#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <SDL2/SDL.h>
#include <GL/gl.h>

#include <setjmp.h>

// Function pointer that returns void* (generic pointer type)
typedef void* (*FunctionPtr)(va_list);

typedef struct {
    const char* name;
    FunctionPtr funcPtr;
} FunctionEntry;

// Function declarations
void* SDL_Init_Func(va_list args);
void* SDL_GL_SetAttribute_Func(va_list args);
void* SDL_CreateWindow_Func(va_list args);
void* SDL_GL_CreateContext_Func(va_list args);
void* glViewport_Func(va_list args);
void* glClearColor_Func(va_list args);
void* glClear_Func(va_list args);
void* glBegin_Func(va_list args);
void* glColor3f_Func(va_list args);
void* glVertex2f_Func(va_list args);
void* glEnd_Func(va_list args);
void* SDL_GL_SwapWindow_Func(va_list args);
void* SDL_PollEvent_Func(va_list args);

FunctionEntry functionTable[] = {
    { "SDL_Init", SDL_Init_Func },
    { "SDL_GL_SetAttribute", SDL_GL_SetAttribute_Func },
    { "SDL_CreateWindow", SDL_CreateWindow_Func },
    { "SDL_GL_CreateContext", SDL_GL_CreateContext_Func },
    { "glViewport", glViewport_Func },
    { "glClearColor", glClearColor_Func },
    { "glClear", glClear_Func },
    { "glBegin", glBegin_Func },
    { "glColor3f", glColor3f_Func },
    { "glVertex2f", glVertex2f_Func },
    { "glEnd", glEnd_Func },
    { "SDL_GL_SwapWindow", SDL_GL_SwapWindow_Func },
    { "SDL_PollEvent", SDL_PollEvent_Func }
};

int numFunctions = sizeof(functionTable) / sizeof(FunctionEntry);

// CallFunctionByName implementation
void* CallFunctionByName(const char* name, int numArgs, ...) {
    va_list args;
    va_start(args, numArgs);

    FunctionPtr funcPtr = NULL;

    // Find the appropriate function pointer in the functionTable
    for (int i = 0; i < numFunctions; ++i) {
        if (strcmp(name, functionTable[i].name) == 0) {
            funcPtr = functionTable[i].funcPtr;
            break;
        }
    }

    if (!funcPtr) {
        printf("Function not found: %s\n", name);
        va_end(args);
        return NULL;
    }

    // Call the function and capture the return value
    void* returnValue = NULL;
    jmp_buf jmpBuf;
    if (setjmp(jmpBuf) == 0) {
        returnValue = funcPtr(args);
    } else {
        printf("Error occurred while executing function: %s\n", name);
    }

    va_end(args);
    return returnValue;
}

// Error handling and logging

jmp_buf jmpBuf;

#define SET_ERROR(errorMsg) longjmp(jmpBuf, 1)

// SDL error handling and logging
void LogSDLError(const char* message) {
    printf("%s. SDL Error: %s\n", message, SDL_GetError());
}

void CheckSDLError() {
    const char* sdlError = SDL_GetError();
    if (*sdlError != '\0') {
        LogSDLError("SDL Error");
        SET_ERROR("SDL error occurred");
    }
}

// Function implementations

void* SDL_Init_Func(va_list args) {
    int flags = va_arg(args, int);
    if (SDL_Init(flags) < 0) {
        LogSDLError("SDL_Init failed");
        SET_ERROR("SDL_Init failed");
    }
    return NULL;
}

void* SDL_GL_SetAttribute_Func(va_list args) {
    int attribute = va_arg(args, int);
    int value = va_arg(args, int);
    SDL_GL_SetAttribute(attribute, value);
    return NULL;
}

void* SDL_CreateWindow_Func(va_list args) {
    const char* title = va_arg(args, const char*);
    int x = va_arg(args, int);
    int y = va_arg(args, int);
    int width = va_arg(args, int);
    int height = va_arg(args, int);
    Uint32 flags = va_arg(args, Uint32);

    SDL_Window* window = SDL_CreateWindow(title, x, y, width, height, flags);
    if (!window) {
        LogSDLError("SDL_CreateWindow failed");
        SET_ERROR("SDL_CreateWindow failed");
    }

    return window;
}

void* SDL_GL_CreateContext_Func(va_list args) {
    SDL_Window* window = va_arg(args, SDL_Window*);
    SDL_GLContext context = SDL_GL_CreateContext(window);
    if (!context) {
        LogSDLError("SDL_GL_CreateContext failed");
        SET_ERROR("SDL_GL_CreateContext failed");
    }
    return context;
}

void* glViewport_Func(va_list args) {
    GLint x = va_arg(args, GLint);
    GLint y = va_arg(args, GLint);
    GLsizei width = va_arg(args, GLsizei);
    GLsizei height = va_arg(args, GLsizei);
    glViewport(x, y, width, height);
    return NULL;
}

void* glClearColor_Func(va_list args) {
    GLfloat red = (GLfloat) va_arg(args, double);
    GLfloat green = (GLfloat) va_arg(args, double);
    GLfloat blue = (GLfloat) va_arg(args, double);
    GLfloat alpha = (GLfloat) va_arg(args, double);
    glClearColor(red, green, blue, alpha);
    return NULL;
}

void* glClear_Func(va_list args) {
    GLbitfield mask = va_arg(args, GLbitfield);
    glClear(mask);
    return NULL;
}

void* glBegin_Func(va_list args) {
    GLenum mode = va_arg(args, GLenum);
    glBegin(mode);
    return NULL;
}

void* glColor3f_Func(va_list args) {
    GLfloat red = (GLfloat) va_arg(args, double);
    GLfloat green = (GLfloat) va_arg(args, double);
    GLfloat blue = (GLfloat) va_arg(args, double);
    glColor3f(red, green, blue);
    return NULL;
}

void* glVertex2f_Func(va_list args) {
    GLfloat x = (GLfloat) va_arg(args, double);
    GLfloat y = (GLfloat) va_arg(args, double);
    glVertex2f(x, y);
    return NULL;
}

void* glEnd_Func(va_list args) {
    glEnd();
    return NULL;
}

void* SDL_GL_SwapWindow_Func(va_list args) {
    SDL_Window* window = va_arg(args, SDL_Window*);
    SDL_GL_SwapWindow(window);
    return NULL;
}

void* SDL_PollEvent_Func(va_list args) {
    SDL_Event* event = va_arg(args, SDL_Event*);
    int result = SDL_PollEvent(event);
    if (result == 0) {
        // No event available, return NULL
        return NULL;
    } else {
        // Event available, return event pointer
        return event;
    }
}

int main() {
    // Example usage
    CallFunctionByName("SDL_Init", 1, (int) SDL_INIT_VIDEO);
    CallFunctionByName("SDL_GL_SetAttribute", 2, (int) SDL_GL_CONTEXT_MAJOR_VERSION, (int) 2);
    CallFunctionByName("SDL_GL_SetAttribute", 2, (int) SDL_GL_CONTEXT_MINOR_VERSION, (int) 1);
    SDL_Window* window = CallFunctionByName("SDL_CreateWindow", 6, "OpenGL Window", (int) SDL_WINDOWPOS_CENTERED, (int) SDL_WINDOWPOS_CENTERED, (int) 800, (int) 600, (Uint32) SDL_WINDOW_OPENGL);
    CallFunctionByName("SDL_GL_CreateContext", 1, window);
    CallFunctionByName("glViewport", 4, (GLint) 0, (GLint) 0, (GLsizei) 800, (GLsizei) 600);
    CallFunctionByName("glClearColor", 4, (GLfloat) 0.0f, (GLfloat) 1.0f, (GLfloat) 0.0f, (GLfloat) 1.0f);

    SDL_Event event;
    int quit = 0;

    // Main loop
    while (!quit) {
        // Process events
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                quit = 1;
            }
        }

        // Render
        CallFunctionByName("glClear", 1, (GLbitfield) GL_COLOR_BUFFER_BIT);
        CallFunctionByName("glBegin", 1, (GLenum) GL_TRIANGLES);
        CallFunctionByName("glColor3f", 3, (GLfloat) 1.0f, (GLfloat) 0.0f, (GLfloat) 0.0f);
        CallFunctionByName("glVertex2f", 2, (GLfloat) 0.0f, (GLfloat) 0.5f);
        CallFunctionByName("glColor3f", 3, (GLfloat) 0.0f, (GLfloat) 1.0f, (GLfloat) 0.0f);
        CallFunctionByName("glVertex2f", 2, (GLfloat) -0.5f, (GLfloat) -0.5f);
        CallFunctionByName("glColor3f", 3, (GLfloat) 0.0f, (GLfloat) 0.0f, (GLfloat) 1.0f);
        CallFunctionByName("glVertex2f", 2, (GLfloat) 0.5f, (GLfloat) -0.5f);
        CallFunctionByName("glEnd", 0);

        // Swap buffers
        CallFunctionByName("SDL_GL_SwapWindow", 1, window);
    }

    // Cleanup
    SDL_Quit();

    return 0;
}
