#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <GL/glew.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <math.h>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define NUM_LAYERS 3

typedef struct {
    float x;
    float y;
    float speed;
} Star;

Star stars[NUM_LAYERS][1000];
SDL_Window* window = NULL;

bool initSDL(SDL_GLContext* context) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL initialization failed: %s\n", SDL_GetError());
        return false;
    }

    window = SDL_CreateWindow("Multilayered Star Field", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);
    if (window == NULL) {
        printf("Window creation failed: %s\n", SDL_GetError());
        return false;
    }

    *context = SDL_GL_CreateContext(window);
    if (*context == NULL) {
        printf("OpenGL context creation failed: %s\n", SDL_GetError());
        return false;
    }

    GLenum glewError = glewInit();
    if (glewError != GLEW_OK) {
        printf("GLEW initialization failed: %s\n", glewGetErrorString(glewError));
        return false;
    }

    if (!GLEW_VERSION_2_1) {
        printf("OpenGL 2.1 not supported\n");
        return false;
    }

    glViewport(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, WINDOW_WIDTH, WINDOW_HEIGHT, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glClearColor(0, 0, 0, 1);

    return true;
}

void updateStars() {
    for (int layer = 0; layer < NUM_LAYERS; layer++) {
        for (int i = 0; i < 1000; i++) {
            Star* star = &stars[layer][i];
            star->y += star->speed;

            if (star->y >= WINDOW_HEIGHT)
                star->y = 0;
        }
    }
}

void drawLine(int x1, int y1, int x2, int y2, float pointSize, float r1, float g1, float b1, float r2, float g2, float b2) {
    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;
    int err = dx - dy;

    float r = r1, g = g1, b = b1;
    float dr = (r2 - r1) / dx;
    float dg = (g2 - g1) / dx;
    float db = (b2 - b1) / dx;

    glBegin(GL_POINTS);

    while (true) {
        glColor3f(r, g, b);
        glPointSize(pointSize);
        glVertex2i(x1, y1);

        if (x1 == x2 && y1 == y2)
            break;

        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x1 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y1 += sy;
        }

        r += dr;
        g += dg;
        b += db;
        pointSize += 0.1f;
    }

    glEnd();
}

void renderStars() {
    glClear(GL_COLOR_BUFFER_BIT);

    for (int layer = 0; layer < NUM_LAYERS; layer++) {
        glLoadIdentity();

        for (int i = 0; i < 1000; i++) {
            Star* star = &stars[layer][i];
            float x = star->x;
            float y = star->y;

            float r1 = (float)i / 1000;
            float g1 = (float)layer / NUM_LAYERS;
            float b1 = 1.0f - r1;

            float r2 = r1 + 0.1f;
            float g2 = g1 + 0.1f;
            float b2 = b1 + 0.1f;

            drawLine(x, y, x + 5, y + 5, 2.0f, r1, g1, b1, r2, g2, b2);
        }
    }

    SDL_GL_SwapWindow(window);
}

void cleanup(SDL_GLContext context) {
    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

int main() {
    SDL_GLContext context;

    if (!initSDL(&context)) {
        cleanup(context);
        return 1;
    }

    for (int layer = 0; layer < NUM_LAYERS; layer++) {
        for (int i = 0; i < 1000; i++) {
            stars[layer][i].x = rand() % WINDOW_WIDTH;
            stars[layer][i].y = rand() % WINDOW_HEIGHT;
            stars[layer][i].speed = (float)(layer + 1) / 5.0f;
        }
    }

    bool quit = false;
    SDL_Event event;

    while (!quit) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                quit = true;
                break;
            }
        }

        updateStars();
        renderStars();
    }

    cleanup(context);
    return 0;
}
