#include <stdio.h>

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
    PARAM_TYPE_FLOAT_PTR
} ParamType;

typedef struct {
    const char* functionName;
    ParamType paramTypes[10]; // Assuming a maximum of 10 parameters per function
    int numParams;
} Function;

Function LibraryFunctions[] = {
    // OpenGL 2.1
    {"glBegin", {PARAM_TYPE_INT}, 1},
    {"glEnd", {}, 0},
    {"glVertex2f", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 2},
    {"glVertex3f", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 3},
    {"glColor3f", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 3},
    {"glClear", {PARAM_TYPE_INT}, 1},
    {"glClearColor", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 4},
    {"glLoadIdentity", {}, 0},
    {"glOrtho", {PARAM_TYPE_DOUBLE, PARAM_TYPE_DOUBLE, PARAM_TYPE_DOUBLE, PARAM_TYPE_DOUBLE, PARAM_TYPE_DOUBLE, PARAM_TYPE_DOUBLE}, 6},
    {"glViewport", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT}, 4},
    {"glGenTextures", {PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 2},
    {"glBindTexture", {PARAM_TYPE_INT, PARAM_TYPE_INT}, 2},
    {"glTexImage2D", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 9},
    {"glTexParameteri", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT}, 3},
    {"glEnable", {PARAM_TYPE_INT}, 1},
    {"glDisable", {PARAM_TYPE_INT}, 1},
    {"glPushMatrix", {}, 0},
    {"glPopMatrix", {}, 0},
    {"glTranslatef", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 3},
    {"glRotatef", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 4},
    {"glScalef", {PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 3},
    {"glLightfv", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_FLOAT_PTR}, 3},
    {"glMaterialfv", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_FLOAT_PTR}, 3},
    {"glShadeModel", {PARAM_TYPE_INT}, 1},
    // SDL2
    {"SDL_Init", {PARAM_TYPE_INT}, 1},
    {"SDL_CreateWindow", {PARAM_TYPE_CHAR_PTR, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT}, 6},
    {"SDL_DestroyWindow", {PARAM_TYPE_VOID_PTR}, 1},
    {"SDL_PollEvent", {PARAM_TYPE_VOID_PTR}, 1},
    {"SDL_Delay", {PARAM_TYPE_INT}, 1},
    {"SDL_RenderClear", {PARAM_TYPE_VOID_PTR}, 1},
    {"SDL_RenderPresent", {PARAM_TYPE_VOID_PTR}, 1},
    {"SDL_RenderDrawLine", {PARAM_TYPE_VOID_PTR, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT}, 5},
    {"SDL_SetRenderDrawColor", {PARAM_TYPE_VOID_PTR, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_INT}, 5},
    {"SDL_GL_CreateContext", {PARAM_TYPE_VOID_PTR}, 1},
    {"SDL_GL_DeleteContext", {PARAM_TYPE_VOID_PTR}, 1},
    {"SDL_GL_SetAttribute", {PARAM_TYPE_INT, PARAM_TYPE_INT}, 2},
    {"SDL_GL_SwapWindow", {PARAM_TYPE_VOID_PTR}, 1},
    {"SDL_GL_LoadLibrary", {PARAM_TYPE_CHAR_PTR}, 1},
    {"SDL_GL_GetProcAddress", {PARAM_TYPE_CHAR_PTR}, 1},
    {"SDL_GL_SetSwapInterval", {PARAM_TYPE_INT}, 1},
    // OpenAL
    {"alGenSources", {PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 2},
    {"alDeleteSources", {PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 2},
    {"alSourcef", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_FLOAT}, 3},
    {"alSource3f", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 5},
    {"alSourcePlay", {PARAM_TYPE_INT}, 1},
    {"alSourcePause", {PARAM_TYPE_INT}, 1},
    {"alSourceStop", {PARAM_TYPE_INT}, 1},
    {"alSourceQueueBuffers", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 3},
    {"alSourceUnqueueBuffers", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 3},
    {"alGenBuffers", {PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 2},
    {"alDeleteBuffers", {PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR}, 2},
    {"alBufferData", {PARAM_TYPE_INT, PARAM_TYPE_INT, PARAM_TYPE_VOID_PTR, PARAM_TYPE_SIZE_T, PARAM_TYPE_INT}, 5},
    {"alListener3f", {PARAM_TYPE_INT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT, PARAM_TYPE_FLOAT}, 4},
    {"alListenerf", {PARAM_TYPE_INT, PARAM_TYPE_FLOAT}, 2},
    {"alListenerfv", {PARAM_TYPE_INT, PARAM_TYPE_FLOAT_PTR}, 2},
    {"alcOpenDevice", {PARAM_TYPE_CHAR_PTR}, 1},
    {"alcCloseDevice", {PARAM_TYPE_VOID_PTR}, 1},
    {"alcCreateContext", {PARAM_TYPE_VOID_PTR, PARAM_TYPE_INT_PTR}, 2},
    {"alcDestroyContext", {PARAM_TYPE_VOID_PTR}, 1},
    {"alcMakeContextCurrent", {PARAM_TYPE_VOID_PTR}, 1},
    {"alcGetError", {PARAM_TYPE_VOID_PTR}, 1},
    {"alcGetProcAddress", {PARAM_TYPE_VOID_PTR, PARAM_TYPE_CHAR_PTR}, 2},
    {"alcGetString", {PARAM_TYPE_VOID_PTR, PARAM_TYPE_INT}, 2},
};

int main() {
    int numFunctions = sizeof(LibraryFunctions) / sizeof(Function);
    
    printf("Library Functions:\n");
    for (int i = 0; i < numFunctions; i++) {
        printf("%s(", LibraryFunctions[i].functionName);
        
        for (int j = 0; j < LibraryFunctions[i].numParams; j++) {
            switch (LibraryFunctions[i].paramTypes[j]) {
                case PARAM_TYPE_INT:
                    printf("int");
                    break;
                case PARAM_TYPE_FLOAT:
                    printf("float");
                    break;
                case PARAM_TYPE_DOUBLE:
                    printf("double");
                    break;
                case PARAM_TYPE_CHAR:
                    printf("char");
                    break;
                case PARAM_TYPE_STRING:
                    printf("const char*");
                    break;
                case PARAM_TYPE_VOID_PTR:
                    printf("void*");
                    break;
                case PARAM_TYPE_SIZE_T:
                    printf("size_t");
                    break;
                case PARAM_TYPE_CHAR_PTR:
                    printf("char*");
                    break;
                case PARAM_TYPE_INT_PTR:
                    printf("int*");
                    break;
                case PARAM_TYPE_FLOAT_PTR:
                    printf("float*");
                    break;
            }
            
            if (j < LibraryFunctions[i].numParams - 1) {
                printf(", ");
            }
        }
        
        printf(")\n");
    }

    return 0;
}
