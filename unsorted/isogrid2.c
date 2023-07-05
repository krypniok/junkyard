#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include <stdbool.h>

typedef struct {
    char* filename[80];
    SDL_Surface* surface;
    GLuint textureID;
    int width, height;
    bool isTile;
    int tileSize;
    int numFrames;

} texture_t;

#define MAX_TEXTURES 2
int currentTexture = 0;
texture_t g_Textures[MAX_TEXTURES];



int loadTexture(const char* filename, float tileSize=0) {
    if(currentTexture >= MAX_TEXTURES) {
        printf("Error loadsing texture\n"); exit(1);
    }
    
    //strcpy(&g_Textures[currentTexture].filename[0], filename); 
    g_Textures[currentTexture].surface = SDL_LoadBMP(filename);
    if (!g_Textures[currentTexture].surface) {
        printf("Error loadsing texture\n"); exit(1);
        return;
    }

    glGenTextures(1, &g_Textures[currentTexture].textureID);
    glBindTexture(GL_TEXTURE_2D, g_Textures[currentTexture].textureID);

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, g_Textures[currentTexture].surface->w, g_Textures[currentTexture].surface->h, 0, GL_BGRA, GL_UNSIGNED_BYTE, g_Textures[currentTexture].surface->pixels);

    // SDL_FreeSurface(surface);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    
    if(tileSize > 0) {

    }

    return currentTexture++;
}


int renderTexture(int textureID, int x, int y) {
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glLoadIdentity();
    glTranslatef(0.375f, 0.375f, 0.0f);
    glTranslatef(x, y, 0.0f);
    
    // rotate the quad around the z-axis
    //glRotatef(angle, 0.0f, 0.0f, 1.0f);

    glBindTexture(GL_TEXTURE_2D, textureID);
    glBegin(GL_QUADS);
    glTexCoord2f(0.0f, 0.0f);
    glVertex2f(0, 0);
    glTexCoord2f(1.0f, 0.0f);
    glVertex2f(256, 0);
    glTexCoord2f(1.0f, 1.0f);
    glVertex2f(256, 256);
    glTexCoord2f(0.0f, 1.0f);
    glVertex2f(0, 256);
    glEnd();

    glDisable(GL_BLEND);
}

float angle = 0.0f;
int frameindex = 0;

int renderSubTexture(int textureID, int frameindex, int x, int y, int w, int h) {
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glLoadIdentity();
    glTranslatef(0.375f, 0.375f, 0.0f);
    glTranslatef(x, y, 0.0f);
    
    // rotate the quad around the z-axis
    glRotatef(angle+=0.5, 0.0f, 0.0f, 1.0f);

    float spritewh = 102.4;
    int numcols = g_Textures[textureID].surface->w / 102.4;
    int numrows = g_Textures[textureID].surface->h / 102.4;
    int framecount = numcols * numrows;

    if(frameindex > framecount) { printf("Errors"); exit(1); }

    float left = spritewh * (int)(frameindex % numcols);
    float top = spritewh * (int)(frameindex / numcols);
    float bottom = top+spritewh; //$top + $spritewh;
    float right = left+spritewh; //$top + $spritewh;

    float piece = 1.0f / numcols;
    float factor = 1.0f / 512.0f;
    
    left = left * factor;
    right = right * factor;
    top = top * factor;
    bottom = bottom * factor;

    //printf("%f %f %f %f - piece %f, framecount %i\n", left, top, right, bottom, piece, framecount);

    glBindTexture(GL_TEXTURE_2D, g_Textures[textureID].textureID);
    glBegin(GL_QUADS);
    glTexCoord2f(left, top);
    glVertex2f(0, 0);
    glTexCoord2f(right, top);
    glVertex2f(w, 0);
    glTexCoord2f(right, bottom);
    glVertex2f(w, h);
    glTexCoord2f(left, bottom);
    glVertex2f(0, h);
    glEnd();

    glDisable(GL_BLEND);
}


int main() {
    float angle = 0;

SDL_Window* window = SDL_CreateWindow("OpenGL-SDL2 Textur Beispiel", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800, 600, SDL_WINDOW_OPENGL );
SDL_GL_CreateContext(window);

//Uint32 colorKey = SDL_MapRGB(SDL_GetWindowSurface(window)->format, 0xFF, 0x00, 0xFF);
//SDL_SetColorKey(SDL_GetWindowSurface(window), SDL_TRUE, colorKey);

//GLuint textureID = loadTexture("shuttle.bmp");
//GLuint textureID2 = loadTexture("explosion2.bmp");

loadTexture("explosion2.bmp", 102.4);



glEnable(GL_TEXTURE_2D);

glMatrixMode(GL_PROJECTION);
glLoadIdentity();
glOrtho(0, 800, 600, 0, -1, 1);

glMatrixMode(GL_MODELVIEW);
glLoadIdentity();

glClearColor(0.0f, 0.0f, 0.0f, 0.0f);



while (true) {
SDL_Event event;
while (SDL_PollEvent(&event)) {
if (event.type == SDL_QUIT) {
return 0;
}
}

//glClearColor(1.0f, 0.0f, 1.0f, 0.0f);
glClear(GL_COLOR_BUFFER_BIT);

//renderTexture(textureID, 128, 128);
renderSubTexture(0, frameindex, 128, 128, 64, 64);

if(frameindex++ > 24) frameindex = 0;

SDL_GL_SwapWindow(window);
}

return 0;
}
