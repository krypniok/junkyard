#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>


#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480

typedef struct {
float x;
float y;
float z;
} Point3D;

typedef struct {
Point3D position;
Point3D target;
float fov;
float aspectRatio;
float nearPlane;
float farPlane;
} Camera;

typedef struct {
float matrix[4][4];
} Matrix;

Matrix createProjectionMatrix(float fov, float aspectRatio, float nearPlane, float farPlane) {
Matrix matrix;
float range = tanf(fov * 0.5f) * nearPlane;
float left = -range * aspectRatio;
float right = range * aspectRatio;
float bottom = -range;
float top = range;

matrix.matrix[0][0] = (2 * nearPlane) / (right - left);
matrix.matrix[1][1] = (2 * nearPlane) / (top - bottom);
matrix.matrix[2][2] = -(farPlane + nearPlane) / (farPlane - nearPlane);
matrix.matrix[3][2] = -1;
matrix.matrix[2][3] = -(2 * farPlane * nearPlane) / (farPlane - nearPlane);

return matrix;
}

Matrix createRotationMatrix(Point3D axis, float angle) {
Matrix matrix;
float c = cosf(angle);
float s = sinf(angle);
float t = 1 - c;

matrix.matrix[0][0] = c + axis.x * axis.x * t;
matrix.matrix[1][0] = axis.y * axis.x * t + axis.z * s;
matrix.matrix[2][0] = axis.z * axis.x * t - axis.y * s;
matrix.matrix[0][1] = axis.x * axis.y * t - axis.z * s;
matrix.matrix[1][1] = c + axis.y * axis.y * t;
matrix.matrix[2][1] = axis.z * axis.y * t + axis.x * s;
matrix.matrix[0][2] = axis.x * axis.z * t + axis.y * s;
matrix.matrix[1][2] = axis.y * axis.z * t - axis.x * s;
matrix.matrix[2][2] = c + axis.z * axis.z * t;
matrix.matrix[3][3] = 1;

return matrix;
}

Matrix createTranslationMatrix(Point3D position) {
Matrix matrix;
matrix.matrix[0][0] = 1;
matrix.matrix[1][1] = 1;
matrix.matrix[2][2] = 1;
matrix.matrix[3][0] = position.x;
matrix.matrix[3][1] = position.y;
matrix.matrix[3][2] = position.z;
matrix.matrix[3][3] = 1;

return matrix;
}

Point3D transformPoint(Matrix matrix, Point3D point) {
Point3D transformedPoint;

transformedPoint.x = matrix.matrix[0][0] * point.x + matrix.matrix[0][1] * point.y + matrix.matrix[0][2] * point.z + matrix.matrix[0][3];
transformedPoint.y = matrix.matrix[1][0] * point.x + matrix.matrix[1][1] * point.y + matrix.matrix[1][2] * point.z + matrix.matrix[1][3];
transformedPoint.z = matrix.matrix[2][0] * point.x + matrix.matrix[2][1] * point.y + matrix.matrix[2][2] * point.z + matrix.matrix[2][3];

return transformedPoint;
}

Matrix multiplyMatrix(Matrix a, Matrix b) {
Matrix result;

for(int i = 0; i < 4; i++) {
for(int j = 0; j < 4; j++) {
result.matrix[i][j] = 0;

for(int k = 0; k < 4; k++) {
result.matrix[i][j] += a.matrix[i][k] * b.matrix[k][j];
}
}
}

return result;
}

void drawCube(SDL_Renderer* renderer, Camera camera, Point3D cubePosition, float angle) {
// Definiere die Ecken des Würfels
Point3D corners[8] = {
{-0.5f, -0.5f, -0.5f},
{0.5f, -0.5f, -0.5f},
{0.5f, 0.5f, -0.5f},
{-0.5f, 0.5f, -0.5f},
{-0.5f, -0.5f, 0.5f},
{0.5f, -0.5f, 0.5f},
{0.5f, 0.5f, 0.5f},
{-0.5f, 0.5f, 0.5f}
};

// Erstelle Matrizen zur Transformation des Würfels
Matrix projectionMatrix = createProjectionMatrix(camera.fov, camera.aspectRatio, camera.nearPlane, camera.farPlane);
Point3D cameraDirection = {camera.target.x - camera.position.x, camera.target.y - camera.position.y, camera.target.z - camera.position.z};
Point3D cameraRight = {cameraDirection.z, 0, -cameraDirection.x};
float cameraAngle = atan2f(cameraDirection.z, cameraDirection.x);
Matrix cameraRotationMatrix = createRotationMatrix(cameraRight, cameraAngle);
Matrix cameraTranslationMatrix = createTranslationMatrix(camera.position);
Matrix cubeTranslationMatrix = createTranslationMatrix(cubePosition);
Matrix cubeRotationMatrix = createRotationMatrix((Point3D){1, 1, 1}, angle);

// Kombiniere die Matrizen zur Transformation des Würfels
Matrix cubeTransformMatrix = cubeTranslationMatrix;
cubeTransformMatrix = multiplyMatrix(cubeTransformMatrix, cubeRotationMatrix);
cubeTransformMatrix = multiplyMatrix(cubeTransformMatrix, cameraRotationMatrix);
cubeTransformMatrix = multiplyMatrix(cubeTransformMatrix, cameraTranslationMatrix);
cubeTransformMatrix = multiplyMatrix(cubeTransformMatrix, projectionMatrix);

// Projiziere jede Ecke des Würfels und speichere die Ergebnisse in einem Array
Point3D projectedCorners[8];
for(int i = 0; i < 8; i++) {
projectedCorners[i] = transformPoint(cubeTransformMatrix, corners[i]);
}

// Zeichne Linien zwischen den Ecken des Würfels
SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderDrawLine(renderer, projectedCorners[0].x + SCREEN_WIDTH / 2, projectedCorners[0].y + SCREEN_HEIGHT / 2, projectedCorners[1].x + SCREEN_WIDTH / 2, projectedCorners[1].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[1].x + SCREEN_WIDTH / 2, projectedCorners[1].y + SCREEN_HEIGHT / 2, projectedCorners[2].x + SCREEN_WIDTH / 2, projectedCorners[2].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[2].x + SCREEN_WIDTH / 2, projectedCorners[2].y + SCREEN_HEIGHT / 2, projectedCorners[3].x + SCREEN_WIDTH / 2, projectedCorners[3].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[3].x + SCREEN_WIDTH / 2, projectedCorners[3].y + SCREEN_HEIGHT / 2, projectedCorners[0].x + SCREEN_WIDTH / 2, projectedCorners[0].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[0].x + SCREEN_WIDTH / 2, projectedCorners[0].y + SCREEN_HEIGHT / 2, projectedCorners[4].x + SCREEN_WIDTH / 2, projectedCorners[4].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[1].x + SCREEN_WIDTH / 2, projectedCorners[1].y + SCREEN_HEIGHT / 2, projectedCorners[5].x + SCREEN_WIDTH / 2, projectedCorners[5].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[2].x + SCREEN_WIDTH / 2, projectedCorners[2].y + SCREEN_HEIGHT / 2, projectedCorners[6].x + SCREEN_WIDTH / 2, projectedCorners[6].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[3].x + SCREEN_WIDTH / 2, projectedCorners[3].y + SCREEN_HEIGHT / 2, projectedCorners[7].x + SCREEN_WIDTH / 2, projectedCorners[7].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[4].x + SCREEN_WIDTH / 2, projectedCorners[4].y + SCREEN_HEIGHT / 2, projectedCorners[5].x + SCREEN_WIDTH / 2, projectedCorners[5].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[5].x + SCREEN_WIDTH / 2, projectedCorners[5].y + SCREEN_HEIGHT / 2, projectedCorners[6].x + SCREEN_WIDTH / 2, projectedCorners[6].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[6].x + SCREEN_WIDTH / 2, projectedCorners[6].y + SCREEN_HEIGHT / 2, projectedCorners[7].x + SCREEN_WIDTH / 2, projectedCorners[7].y + SCREEN_HEIGHT / 2);
SDL_RenderDrawLine(renderer, projectedCorners[7].x + SCREEN_WIDTH / 2, projectedCorners[7].y + SCREEN_HEIGHT / 2, projectedCorners[4].x + SCREEN_WIDTH / 2, projectedCorners[4].y + SCREEN_HEIGHT / 2);
}

int main(int argc, char* argv[]) {
SDL_Window* window;
SDL_Renderer* renderer;
SDL_Event event;
int quit = 0;
float angle = 0;

// Initialisiere SDL
SDL_Init(SDL_INIT_VIDEO);

// Erstelle ein Fenster und Renderer
SDL_CreateWindowAndRenderer(SCREEN_WIDTH, SCREEN_HEIGHT, 0, &window, &renderer);

// Erstelle eine Kamera
Camera camera;
camera.position = (Point3D){5, 5, 5};
camera.target = (Point3D){0, 0, 0};
camera.fov = 45.0f;
camera.aspectRatio = (float)SCREEN_WIDTH / (float)SCREEN_HEIGHT;
camera.nearPlane = 0.1f;
camera.farPlane = 1000.0f;

// Hauptschleife
while(!quit) {
SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
// Zeichne den Würfel
drawCube(renderer, camera, (Point3D){0, 0, 0}, angle);

// Zeige den gerenderten Frame an
SDL_RenderPresent(renderer);

// Warte auf eine Tasteneingabe oder den Schließen-Button
while(SDL_PollEvent(&event)) {
if(event.type == SDL_QUIT) {
quit = 1;
}
}

// Rotiere den Würfel
angle += 0.01f;
}

// Beende SDL
SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}
