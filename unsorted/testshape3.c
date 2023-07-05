#include <stdio.h>
#include <stdbool.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/glu.h>
#include <GL/freeglut.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600
#define TILE_SIZE 64
#define GRID_SIZE 8
#define CAMERA_SPEED 5.0f
#define CAMERA_ROTATION_SPEED 0.1f

typedef struct {
    float x;
    float y;
    float z;
} Vector3;


void renderString(float x, float y, float r, float g, float b, const char* string) {
    glColor3f(r, g, b);
    glRasterPos2f(x, y);
    
    while (*string) {
        glutBitmapCharacter(GLUT_BITMAP_8_BY_13, *string);
        string++;
    }
}

void display() {
    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
    // Render a red string at position (100, 100)
    renderString(100, 100, 1.0f, 0.0f, 0.0f, "Hello, World!");
    
    glFlush();
}

Vector3 cameraPosition = {0.0f, 0.0f, 1.0f};
float cameraRotationX = 0.0f;
float cameraRotationY = 0.0f;

void handleInput(SDL_Window *window) {
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            SDL_DestroyWindow(window);
            SDL_Quit();
            exit(0);
        } else if (event.type == SDL_KEYDOWN) {
            switch (event.key.keysym.sym) {
                case SDLK_w:
                    cameraPosition.z += CAMERA_SPEED;
                    break;
                case SDLK_s:
                    cameraPosition.z -= CAMERA_SPEED;
                    break;
                case SDLK_a:
                    cameraPosition.x -= CAMERA_SPEED;
                    break;
                case SDLK_d:
                    cameraPosition.x += CAMERA_SPEED;
                    break;
            }
        } else if (event.type == SDL_MOUSEMOTION) {
            int deltaX = event.motion.xrel;
            int deltaY = event.motion.yrel;
            cameraRotationX += deltaX * CAMERA_ROTATION_SPEED;
            cameraRotationY += deltaY * CAMERA_ROTATION_SPEED;
        }
    }
}

void render() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    gluLookAt(cameraPosition.x, cameraPosition.y, cameraPosition.z,
             0.0f, 0.0f, 0.0f,
             0.0f, 1.0f, 0.0f);

    for (int row = 0; row < GRID_SIZE; row++) {
        for (int col = 0; col < GRID_SIZE; col++) {
            float tileX = col * TILE_SIZE;
            float tileZ = row * TILE_SIZE;

            
            glColor3f((row + col) % 2, (row + col) % 2, (row + col) % 2);
            
            glColor3f(1, 1, 1);
            

            glBegin(GL_QUADS);
            glVertex3f(tileX, 0.0f, tileZ);
            glVertex3f(tileX + TILE_SIZE, 0.0f, tileZ);
            glVertex3f(tileX + TILE_SIZE, 0.0f, tileZ + TILE_SIZE);
            glVertex3f(tileX, 0.0f, tileZ + TILE_SIZE);
            glEnd();
        }
    }

    SDL_GL_SwapWindow(SDL_GL_GetCurrentWindow());
}


int main(int argc, char *argv[]) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL initialization failed: %s\n", SDL_GetError());
        return -1;
    }

    SDL_Window *window = SDL_CreateWindow("Checkerboard", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                                          SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);
    if (!window) {
        printf("Window creation failed: %s\n", SDL_GetError());
        SDL_Quit();
        return -1;
    }

    SDL_GLContext glContext = SDL_GL_CreateContext(window);
    if (!glContext) {
        printf("Failed to create OpenGL context: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return -1;
    }

    glClearColor(0.5f, 0.5f, 0.5f, 0.5f);
    glEnable(GL_DEPTH_TEST);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0f, (float) SCREEN_WIDTH / SCREEN_HEIGHT, 0.0f, 1000.0f);

    while (1) {
        handleInput(window);
        render();
    }

    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}
