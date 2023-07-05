#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>

SDL_Init(SDL_INIT_VIDEO);

// Erzeuge das Fenster
SDL_Window* window = SDL_CreateWindow("3D-Würfel",
SDL_WINDOWPOS_CENTERED,
SDL_WINDOWPOS_CENTERED,
640, 480,
SDL_WINDOW_SHOWN);

// Erstelle den Renderer
SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

// Hintergrundfarbe ist schwarz
SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);

// Zeichenfarbe ist weiß
SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);

// Erstelle Daten für den Würfel
Point3D cubeVertices[8] =
{
{ -1.0f, -1.0f, -1.0f },
{ -1.0f, 1.0f, -1.0f },
{ 1.0f, 1.0f, -1.0f },
{ 1.0f, -1.0f, -1.0f },
{ -1.0f, -1.0f, 1.0f },
{ -1.0f, 1.0f, 1.0f },
{ 1.0f, 1.0f, 1.0f },
{ 1.0f, -1.0f, 1.0f }
};
int cubeEdges[12][2] =
{
{ 0, 1 },
{ 1, 2 },
{ 2, 3 },
{ 3, 0 },
{ 0, 4 },
{ 1, 5 },
{ 2, 6 },
{ 3, 7 },
{ 4, 5 },
{ 5, 6 },
{ 6, 7 },
{ 7, 4 }
};

// Erstelle eine Kamera
Camera camera;
camera.position = (Point3D){0, -2, 2};
camera.target = (Point3D){0, 0, 0};
camera.aspectRatio = 4.0f/3.0f;
camera.nearPlane = 1.0f;
camera.farPlane = 100.0f;
camera.fov = 60.0f;

// Definiere eine Up-Richtung
Point3D cameraUp = {0, 0, -1};

// Erstelle die Transformationsmatrix für den Würfel
Point3D cameraDirection = {camera.target.x - camera.position.x, camera.target.y - camera.position.y, camera.target.z - camera.position.z};
Matrix cameraRotationMatrix = createRotationMatrix(cameraUp, -M_PI/4);
Matrix cameraTranslationMatrix = createTranslationMatrix(camera.position);
Matrix cubeTransformMatrix = multiplyMatrix(cameraRotationMatrix, cameraTranslationMatrix);
cubeTransformMatrix = multiplyMatrix(createProjectionMatrix(camera.fov, camera.aspectRatio, camera.nearPlane, camera.farPlane), cubeTransformMatrix);

// Zeichne den Würfel
int i, j;
for (i = 0; i < 12; i++)
{
Point3D cubeEdgeStart = transformPoint(cubeVertices[cubeEdges[i][0]], cubeTransformMatrix);
Point3D cubeEdgeEnd = transformPoint(cubeVertices[cubeEdges[i][1]], cubeTransformMatrix);
SDL_RenderDrawLine(renderer,
(int)round(cubeEdgeStart.x * 320 + 320),
(int)round(-cubeEdgeStart.y * 240 + 240),
(int)round(cubeEdgeEnd.x * 320 + 320),
(int)round(-cubeEdgeEnd.y * 240 + 240));
}

// Aktualisiere den Renderer
SDL_RenderPresent(renderer);

SDL_Delay(5000);

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();
