#include <stdio.h>
#include <stdlib.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>
#include <GL/glu.h>

SDL_Window* window;
SDL_GLContext context;
const int SCREEN_WIDTH = 800;
const int SCREEN_HEIGHT = 600;
const int FRAME_DURATION_MS = 100;  // Frame duration in milliseconds

typedef struct {
    GLuint textureID;
    SDL_Surface* surface;
    int frameWidth;
    int frameHeight;
    int frameCount;
    int currentFrame;
} Sprite;

Sprite sprites[10];
int spriteCount = 0;

Sprite* createSprite(const char* fileName, int frameWidth, int frameHeight, int frameCount) {
    if (spriteCount >= 10) {
        return NULL; // Maximum number of sprites reached
    }

    Sprite* sprite = &sprites[spriteCount];
    sprite->surface = SDL_LoadBMP(fileName);
    if (!sprite->surface) {
        exit(1);
    }

    sprite->frameWidth = frameWidth;
    sprite->frameHeight = frameHeight;
    sprite->frameCount = frameCount;
    sprite->currentFrame = 0;

    glGenTextures(1, &(sprite->textureID));
    glBindTexture(GL_TEXTURE_2D, sprite->textureID);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, sprite->surface->w, sprite->surface->h, 0, GL_RGBA, GL_UNSIGNED_BYTE, sprite->surface->pixels);

    return sprite;
}

void destroySprite(Sprite* sprite) {
    glDeleteTextures(1, &(sprite->textureID));
    SDL_FreeSurface(sprite->surface);
}

// Function to draw a sprite frame at a specific position
void drawSpriteFrame(const Sprite* sprite, int x, int y) {
    glBindTexture(GL_TEXTURE_2D, sprite->textureID);
    glLoadIdentity();
    glTranslatef(x, y, 0);

    int columnCount = sprite->surface->w / sprite->frameWidth;
    int row = sprite->currentFrame / columnCount;
    int column = sprite->currentFrame % columnCount;

    float u = (float)column / columnCount;
    float v = (float)row / sprite->frameCount;
    float u2 = (float)(column + 1) / columnCount;
    float v2 = (float)(row + 1) / sprite->frameCount;

    glBegin(GL_QUADS);
    glTexCoord2f(u, v);     glVertex2f(0, 0);
    glTexCoord2f(u2, v);    glVertex2f(sprite->frameWidth, 0);
    glTexCoord2f(u2, v2);   glVertex2f(sprite->frameWidth, sprite->frameHeight);
    glTexCoord2f(u, v2);    glVertex2f(0, sprite->frameHeight);
    glEnd();
}

int main(int argc, char* argv[]) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        exit(1);
    }

    // Create an SDL window with OpenGL context
    window = SDL_CreateWindow("Animated Sprite Game", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
                              SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);
    if (!window) {
        exit(1);
    }

    context = SDL_GL_CreateContext(window);
    if (!context) {
        exit(1);
    }

    // Set up OpenGL projection matrix
    glViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);

    // Load animated sprite texture
    Sprite* sprite = createSprite("spritesheet.bmp", 32, 32, 16);
    if (!sprite) {
        exit(1);
    }
    spriteCount++;

    int frameRate = 0;
    Uint32 fpsStartTime = SDL_GetTicks();
    int frameCountPerSecond = 0;

    int quit = 0;
    SDL_Event e;
    while (!quit) {
        while (SDL_PollEvent(&e) != 0) {
            if (e.type == SDL_QUIT) {
                quit = 1;
            }
        }

        glClear(GL_COLOR_BUFFER_BIT);

        // Draw current sprite frame
        drawSpriteFrame(sprite, 0, 0);

        SDL_GL_SwapWindow(window);

        // Update frame rate
        Uint32 currentTime = SDL_GetTicks();
        frameCountPerSecond++;

        if (currentTime - fpsStartTime >= 1000) {
            frameRate = frameCountPerSecond;
            frameCountPerSecond = 0;
            fpsStartTime = currentTime;

            // Update window title with frame rate
            char windowTitle[64];
            snprintf(windowTitle, sizeof(windowTitle), "Animated Sprite Game | FPS: %d", frameRate);
            SDL_SetWindowTitle(window, windowTitle);
        }

        // Update sprite frame
        if (currentTime - frameStartTime >= FRAME_DURATION_MS) {
            sprite->currentFrame = (sprite->currentFrame + 1) % sprite->frameCount;
            frameStartTime = currentTime;
        }
    }

    // Cleanup and exit
    for (int i = 0; i < spriteCount; i++) {
        destroySprite(&sprites[i]);
    }

    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
