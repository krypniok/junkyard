#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <SDL2/SDL.h>


SDL_Window* window;
SDL_Renderer* renderer;

const int SCREEN_WIDTH = 1024;
const int SCREEN_HEIGHT = 768;

const int TILE_WIDTH = 64;
const int TILE_HEIGHT = 32;

void drawLine(int x1, int y1, int x2, int y2) {
SDL_RenderDrawLine(renderer, x1, y1, x2, y2);
}

void drawIsoDiamond(int x, int y, int w, int h) {
int x1 = x - w/2;
int y1 = y;
int x2 = x;
int y2 = y - h/2;
int x3 = x + w/2;
int y3 = y;
int x4 = x;
int y4 = y + h/2;

drawLine(x1, y1, x2, y2);
drawLine(x2, y2, x3, y3);
drawLine(x3, y3, x4, y4);
drawLine(x4, y4, x1, y1);
}

void renderIsometricField(SDL_Renderer* renderer) {
int cellSize = 32; // Die Größe einer Zelle in Pixeln
int numRows = 10;
int numCols = 10;

for(int row=0; row<numRows; row++) {
for(int col=0; col<numCols; col++) { // Koordinaten der Zelle berechnen
int x = (col-row) * cellSize;
int y = (col+row) * (cellSize/2);

// Eckpunkte der Zelle berechnen
SDL_Point points[] = {
{x, y},
{x + cellSize, y + cellSize/2},
{x, y + cellSize},
{x - cellSize, y + cellSize/2}
};

// Eckpunkte konvertieren
for(int i=0; i<4; i++) {
int tempX = points[i].x;
int tempY = points[i].y;
points[i].x = (tempX - tempY) + (SCREEN_WIDTH / 2);
points[i].y = (tempX + tempY) / 2;
}

// Zelle mit Füllfarbe rendern
SDL_Rect rect = {points[3].x, points[0].y, cellSize, cellSize};
SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255); // Rote Farbe
SDL_RenderFillRect(renderer, &rect);
}
}
}

void drawIsoGrid(int rows, int cols, int tileWidth, int tileHeight) {
int offsetX = SCREEN_WIDTH/2 - (cols*tileWidth)/2;
int offsetY = SCREEN_HEIGHT/2 - (rows*tileHeight)/2;

for (int i = 0; i < rows; i++) {
for (int j = 0; j < cols; j++) {
int x = j*tileWidth/2 - i*tileWidth/2;
int y = i*tileHeight/2 + j*tileHeight/2;
drawIsoDiamond(x+offsetX, y+offsetY, tileWidth, tileHeight);
}
}
}

int main(int argc, char* argv[]) {
SDL_Init(SDL_INIT_VIDEO);

window = SDL_CreateWindow("Isometric Grid", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, 0);
renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderClear(renderer);

SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);

drawIsoGrid(10, 10, TILE_WIDTH, TILE_HEIGHT);
renderIsometricField(renderer);

SDL_RenderPresent(renderer);

SDL_Delay(3000);

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}