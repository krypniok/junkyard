#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>


typedef struct {
float x, y, z;
} Point3D;

typedef struct {
int x, y;
} Point2D;

void getRotationMatrix(float* matrix, float angleX, float angleY, float angleZ, float* result) {
float radiansX = angleX * M_PI / 180.0f;
float radiansY = angleY * M_PI / 180.0f;
float radiansZ = angleZ * M_PI / 180.0f;

float matrixX[] = {1, 0, 0, 0, 0, cosf(radiansX), -sinf(radiansX), 0, 0, sinf(radiansX), cosf(radiansX), 0, 0, 0, 0, 1};
float matrixY[] = {cosf(radiansY), 0, sinf(radiansY), 0, 0, 1, 0, 0, -sinf(radiansY), 0, cosf(radiansY), 0, 0, 0, 0, 1};
float matrixZ[] = {cosf(radiansZ), -sinf(radiansZ), 0, 0, sinf(radiansZ), cosf(radiansZ), 0, 0, 0, 0, 1, 0, 0, 0, 0, 1};

float tempMatrix[16];
memset(tempMatrix, 0, sizeof(float) * 16);

for(int i = 0; i < 4; i++) {
for(int j = 0; j < 4; j++) {
for(int k = 0; k < 4; k++) {
tempMatrix[i * 4 + j] += matrixX[i * 4 + k] * matrixY[k * 4 + j];
}
}
}

memset(matrix, 0, sizeof(float) * 16);
for(int i = 0; i < 4; i++) {
for(int j = 0; j < 4; j++) {
for(int k = 0; k < 4; k++) {
matrix[i * 4 + j] += tempMatrix[i * 4 + k] * matrixZ[k * 4 + j];
}
}
}

if(result != NULL) {
memcpy(result, matrix, sizeof(float) * 16);
}
}

bool isKeyDown(SDL_Scancode key) {
return SDL_GetKeyboardState(NULL)[key];
}

void drawCube(SDL_Renderer* renderer, Point3D position, float* matrix, float angle) {
float matrixRotation[16];
getRotationMatrix(matrixRotation, 0, angle, 0, matrix);

Point3D vertices[] = {
{-1, -1, -1},
{-1, -1, 1},
{-1, 1, -1},
{-1, 1, 1},
{1, -1, -1},
{1, -1, 1},
{1, 1, -1},
{1, 1, 1},
};

Point2D projectedPoints[8];

for(int i = 0; i < 8; i++) {
Point3D vertex = vertices[i];

// Apply rotation matrix
Point3D rotatedVertex = {
vertex.x * matrixRotation[0] + vertex.y * matrixRotation[1] + vertex.z * matrixRotation[2],
vertex.x * matrixRotation[4] + vertex.y * matrixRotation[5] + vertex.z * matrixRotation[6],
vertex.x * matrixRotation[8] + vertex.y * matrixRotation[9] + vertex.z * matrixRotation[10]
};

// Apply projection matrix
float distance = 5.0f;
Point2D projectedPoint = {
(int)(rotatedVertex.x * distance / rotatedVertex.z + position.x),
(int)(rotatedVertex.y * distance / rotatedVertex.z + position.y)
};

projectedPoints[i] = projectedPoint;
}

// Draw lines between all vertices
for(int i = 0; i < 4; i++) {
SDL_RenderDrawLine(renderer, projectedPoints[i].x, projectedPoints[i].y, projectedPoints[(i+1)%4].x, projectedPoints[(i+1)%4].y);
SDL_RenderDrawLine(renderer, projectedPoints[i+4].x, projectedPoints[i+4].y, projectedPoints[((i+1)%4)+4].x, projectedPoints[((i+1)%4)+4].y);
SDL_RenderDrawLine(renderer, projectedPoints[i].x, projectedPoints[i].y, projectedPoints[i+4].x, projectedPoints[i+4].y);
}
}

int main() {
SDL_Init(SDL_INIT_EVERYTHING);

SDL_Window* window = SDL_CreateWindow("Cube", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800, 600, SDL_WINDOW_SHOWN);
SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

Point3D position = {400, 300, 0};
float rotationMatrix[16];
memset(rotationMatrix, 0, sizeof(float) * 16);
float angle = 0;

bool running = true;
while(running) {
SDL_Event event;
while(SDL_PollEvent(&event)) {
if(event.type == SDL_QUIT) {
running = false;
}
}

// Update cube rotation
if(isKeyDown(SDL_SCANCODE_LEFT)) {
angle -= 1.0f;
}
if(isKeyDown(SDL_SCANCODE_RIGHT)) {
angle += 1.0f;
}

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderClear(renderer);

SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
drawCube(renderer, position, rotationMatrix, angle);

SDL_RenderPresent(renderer);
}

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();
return 0;
}
