#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>
#include <GL/glu.h>

#define ET printf("! Error Trace ( . y . ) Escape espacE !\n"); \

SDL_Window* window;
SDL_GLContext context;
const int SCREEN_WIDTH = 1920;
const int SCREEN_HEIGHT = 1080;
const int FRAME_DURATION_MS = 100;  // Frame duration in milliseconds

#define MAX_SPRITES 100

typedef struct {
    GLuint textureID;
    SDL_Surface* surface;
    int frameWidth;
    int frameHeight;
    int frameCount;
    int currentFrame;
    int frameDuration; // Duration (in milliseconds) for each frame
    Uint32 frameStartTime; // Start time of the current frame
    Uint32 spawnTime; // Time when the sprite was spawned
    int x; // X position of the sprite
    int y; // Y position of the sprite
} Sprite;

Sprite sprites[MAX_SPRITES];
int spriteCount = 0;

Sprite* createSprite(const char* fileName, int frameWidth, int frameHeight, int frameDuration, int x, int y) {
    if (spriteCount >= MAX_SPRITES) {
        return NULL; // Maximum number of sprites reached
    }

    Sprite* sprite = &sprites[spriteCount];
    sprite->surface = SDL_LoadBMP(fileName);
    if (!sprite->surface) {
        exit(1);
    }

    sprite->frameWidth = frameWidth;
    sprite->frameHeight = frameHeight;
    sprite->currentFrame = 0;

    sprite->frameDuration = frameDuration;
    sprite->frameStartTime = SDL_GetTicks();
    sprite->spawnTime = sprite->frameStartTime;

    int numCols = sprite->surface->w / sprite->frameWidth;
    int numRows = sprite->surface->h / sprite->frameHeight;
    sprite->frameCount = numCols * numRows;

    glGenTextures(1, &(sprite->textureID));
    glBindTexture(GL_TEXTURE_2D, sprite->textureID);

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, sprite->surface->w, sprite->surface->h, 0, GL_RGBA, GL_UNSIGNED_BYTE, sprite->surface->pixels);

    // Set texture parameters
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

    glBindTexture(GL_TEXTURE_2D, 0); // Unbind the texture

    sprite->x = x;
    sprite->y = y;

    spriteCount++;

    return sprite;
}

void destroySprite(Sprite* sprite) {
    glDeleteTextures(1, &(sprite->textureID));
    SDL_FreeSurface(sprite->surface);
}

void drawSpriteFrame(Sprite* sprite) {
    glBindTexture(GL_TEXTURE_2D, sprite->textureID);
    glLoadIdentity();
    glTranslatef(sprite->x, sprite->y, 0);

    Uint32 currentTime = SDL_GetTicks();
    Uint32 elapsed = currentTime - sprite->frameStartTime;

    int numCols = sprite->surface->w / sprite->frameWidth;
    int numRows = sprite->surface->h / sprite->frameHeight;

    if (elapsed >= sprite->frameDuration) {
        sprite->currentFrame = (sprite->currentFrame + 1) % sprite->frameCount;
        sprite->frameStartTime = currentTime;
    }

    int row = sprite->currentFrame / numCols;
    int col = sprite->currentFrame % numCols;

    float u = (float)(col * sprite->frameWidth) / sprite->surface->w;
    float v = (float)(row * sprite->frameHeight) / sprite->surface->h;
    float u2 = u + (float)sprite->frameWidth / sprite->surface->w;
    float v2 = v + (float)sprite->frameHeight / sprite->surface->h;

    glColor3f(32, 64, 192);
    glEnable(GL_BLEND);
    glBegin(GL_QUADS);
    glTexCoord2f(u, v);     glVertex2f(0, 0);
    glTexCoord2f(u2, v);    glVertex2f(sprite->frameWidth, 0);
    glTexCoord2f(u2, v2);   glVertex2f(sprite->frameWidth, sprite->frameHeight);
    glTexCoord2f(u, v2);    glVertex2f(0, sprite->frameHeight);
    glEnd();
}

void drawSprites() {
    for (int i = 0; i < spriteCount; i++) {
        drawSpriteFrame(&sprites[i]);
    }
}

void spawnRandomSprite() {
    int frameWidth = 102;
    int frameHeight = 102;
    int frameDuration = 25;

    // Generate random position within the screen bounds
    int x = rand() % (SCREEN_WIDTH - frameWidth);
    int y = rand() % (SCREEN_HEIGHT - frameHeight);

    createSprite("explosion2.bmp", frameWidth, frameHeight, frameDuration, x, y);
}

int main(int argc, char* argv[]) {
    srand(time(NULL)); // Seed the random number generator

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        exit(1);
    }

    window = SDL_CreateWindow("Animated Sprite Game", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
                              SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN | SDL_WINDOW_BORDERLESS |
                                                           SDL_WINDOW_SKIP_TASKBAR);// | SDL_WINDOW_FULLSCREEN);
    if (!window) {
        exit(1);
    }

    context = SDL_GL_CreateContext(window);
    if (!context) {
        exit(1);
    }

    glViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    
    glEnable(GL_TEXTURE_2D);

    Uint32 fpsStartTime = SDL_GetTicks();
    int frameCountPerSecond = 0;
    Uint32 frameStartTime = SDL_GetTicks();
    Uint32 prevTime = frameStartTime;

    int quit = 0;
    SDL_Event e;
    while (!quit) {
        while (SDL_PollEvent(&e) != 0) {
            if (e.type == SDL_QUIT) {
                quit = 1;
            }
            else if (e.type == SDL_KEYDOWN) {
                if (e.key.keysym.sym == SDLK_F1) {
                    spawnRandomSprite();
                }
            }
        }

        glClear(GL_COLOR_BUFFER_BIT);

        drawSprites();

        SDL_GL_SwapWindow(window);

        // Update frame rate
        Uint32 currentTime = SDL_GetTicks();
        frameCountPerSecond++;

        if (currentTime - fpsStartTime >= 1000) {
            int frameRate = frameCountPerSecond;
            frameCountPerSecond = 0;
            fpsStartTime = currentTime;

            //printf("Frame rate: %d\n", frameRate);
        }

        // Update sprite animation
        Uint32 elapsed = currentTime - prevTime;
        if (elapsed >= FRAME_DURATION_MS) {
            for (int i = 0; i < spriteCount; i++) {
                drawSpriteFrame(&sprites[i]);
            }

            prevTime = currentTime;
        }
    }

    for (int i = 0; i < spriteCount; i++) {
        destroySprite(&sprites[i]);
    }

    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
