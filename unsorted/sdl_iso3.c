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
{1, 1, 1}
};

for(int i = 0; i < 8; i++) {
float x = vertices[i].x;
float y = vertices[i].y;
float z = vertices[i].z;

vertices[i].x = matrixRotation[0] * x + matrixRotation[1] * y + matrixRotation[2] * z;
vertices[i].y = matrixRotation[4] * x + matrixRotation[5] * y + matrixRotation[6] * z;
vertices[i].z = matrixRotation[8] * x + matrixRotation[9] * y + matrixRotation[10] * z;
}

for(int i = 0; i < 24; i += 3) {
Point3D p1 = vertices[i / 3];
Point3D p2 = vertices[i / 3 + 1];
Point3D p3 = vertices[i / 3 + 2];

Point3D normal = {
(p1.y - p2.y) * (p1.z + p2.z) + (p2.y - p3.y) * (p2.z + p3.z) + (p3.y - p1.y) * (p3.z + p1.z),
(p1.z - p2.z) * (p1.x + p2.x) + (p2.z - p3.z) * (p2.x + p3.x) + (p3.z - p1.z) * (p3.x + p1.x),
(p1.x - p2.x) * (p1.y + p2.y) + (p2.x - p3.x) * (p2.y + p3.y) + (p3.x - p1.x) * (p3.y + p1.y)
};

float length = sqrtf(normal.x * normal.x + normal.y * normal.y + normal.z * normal.z);
normal.x /= length;
normal.y /= length;
normal.z /= length;

Uint8 r, g, b, a;
SDL_GetRenderDrawColor(renderer, &r, &g, &b, &a);

float lightAngle = normal.x * 0.5f + normal.y * 0.5f + normal.z * 0.5f;
if(lightAngle < 0.1f) {
lightAngle = 0.1f;
}

SDL_SetRenderDrawColor(renderer, r * lightAngle, g * lightAngle, b * lightAngle, a);

SDL_RenderDrawLine(renderer, (int)(position.x + p1.x), (int)(position.y + p1.y), (int)(position.x + p2.x), (int)(position.y + p2.y));
SDL_RenderDrawLine(renderer, (int)(position.x + p2.x), (int)(position.y + p2.y), (int)(position.x + p3.x), (int)(position.y + p3.y));
SDL_RenderDrawLine(renderer, (int)(position.x + p3.x), (int)(position.y + p3.y), (int)(position.x + p1.x), (int)(position.y + p1.y));
}
}

int main(int argc, char* argv[])
{
SDL_Init(SDL_INIT_VIDEO);

SDL_Window* window = SDL_CreateWindow("SDL2 Test",
SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
600, 400,
SDL_WINDOW_OPENGL);

SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, 0);

bool running = true;
Uint32 ticks = SDL_GetTicks();

Point3D cameraPosition = {0, 0, -2};
float cameraAngleX = 0.0f;
float cameraAngleY = 0.0f;
float rotationMatrix[16];
float viewerMatrix[16];

float cameraSpeed = 50.0f;
float cameraAngularSpeed = 50.0f;

while (running) {
SDL_Event event;
while (SDL_PollEvent(&event)) {
if (event.type == SDL_QUIT) {
running = false;
}
}

Uint32 newTicks = SDL_GetTicks();
float deltaTime = (newTicks - ticks) / 1000.0f;
ticks = newTicks;

float cameraVelocity[3] = {0, 0, 0};
float cameraAngularVelocity[3] = {0, 0, 0};

if(isKeyDown(SDL_SCANCODE_W)) {
cameraVelocity[2] -= cameraSpeed;
}
if(isKeyDown(SDL_SCANCODE_S)) {
cameraVelocity[2] += cameraSpeed;
}
if(isKeyDown(SDL_SCANCODE_A)) {
cameraVelocity[0] -= cameraSpeed;
}
if(isKeyDown(SDL_SCANCODE_D)) {
cameraVelocity[0] += cameraSpeed;
}

if(isKeyDown(SDL_SCANCODE_UP)) {
cameraAngularVelocity[0] -= cameraAngularSpeed;
}
if(isKeyDown(SDL_SCANCODE_DOWN)) {
cameraAngularVelocity[0] += cameraAngularSpeed;
}
if(isKeyDown(SDL_SCANCODE_LEFT)) {
cameraAngularVelocity[1] -= cameraAngularSpeed;
}
if(isKeyDown(SDL_SCANCODE_RIGHT)) {
cameraAngularVelocity[1] += cameraAngularSpeed;
}

cameraVelocity[0] = cameraVelocity[0] * cosf(cameraAngleY) - cameraVelocity[2] * sinf(cameraAngleY);
cameraVelocity[2] = cameraVelocity[2] * cosf(cameraAngleY) + cameraVelocity[0] * sinf(cameraAngleY);

cameraVelocity[1] = cameraVelocity[1] * cosf(cameraAngleX) - cameraVelocity[2] * sinf(cameraAngleX);
cameraVelocity[2] = cameraVelocity[2] * cosf(cameraAngleX) + cameraVelocity[1] * sinf(cameraAngleX);

cameraPosition.x += cameraVelocity[0] * deltaTime;
cameraPosition.y += cameraVelocity[1] * deltaTime;
cameraPosition.z += cameraVelocity[2] * deltaTime;

cameraAngleX += cameraAngularVelocity[0] * deltaTime;
cameraAngleY += cameraAngularVelocity[1] * deltaTime;

if(cameraAngleX > 90.0f) {
cameraAngleX = 90.0f;
}
if(cameraAngleX < -90.0f) {
cameraAngleX = -90.0f;
}

Point2D viewerAngle = {
cameraAngleX + cameraAngularVelocity[0] * deltaTime,
cameraAngleY + cameraAngularVelocity[1] * deltaTime
};

getRotationMatrix(viewerMatrix, viewerAngle.x, viewerAngle.y, 0, rotationMatrix);
cameraAngleX = viewerAngle.x;
cameraAngleY = viewerAngle.y;

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderClear(renderer);

SDL_SetRenderDrawColor(renderer, 192, 128, 96, 255);
drawCube(renderer, cameraPosition, viewerMatrix, cameraAngleY);

SDL_RenderPresent(renderer);

SDL_Delay(1);
}

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);

SDL_Quit();

return 0;
}


Erweitere den Code ohne Kommentare um eine Matrix Struktur und die standard 3D Transformations und Rotations Funktionen, und einer Kamera Struktur inklusive der SDL Funktionen um die Kamera mit Tastatur und Maus im Spektator Modus bewegen zu können.