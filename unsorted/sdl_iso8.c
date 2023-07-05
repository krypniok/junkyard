#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

float angle = 0.0f;
float rotationSpeed = 0.5f;
float zoomSpeed = 5.0f;
float zoom = 10.0f;
float gridSize = 5.0f;
float lineWidth = 1.0f;
int maxLineSegments = 200;

SDL_Renderer* renderer;
SDL_Window* window;

typedef struct {
float x;
float y;
float z;
} Vector3;

typedef struct {
float m[16];
} Matrix4;

void InitMatrix(Matrix4 *matrix)
{
for (int i = 0; i < 16; i++)
{
matrix->m[i] = 0.0f;
}
}

void SetMatrixIdentity(Matrix4 *matrix)
{
InitMatrix(matrix);
matrix->m[0] = 1.0f;
matrix->m[5] = 1.0f;
matrix->m[10] = 1.0f;
matrix->m[15] = 1.0f;
}

void CopyMatrix(Matrix4 *source, Matrix4 *destination)
{
for (int i = 0; i < 16; i++)
{
destination->m[i] = source->m[i];
}
}

void MultiplyMatrix(Matrix4 *matrix1, Matrix4 *matrix2, Matrix4 *result)
{
Matrix4 tempMatrix;
InitMatrix(&tempMatrix);

for (int i = 0; i < 4; i++)
{
for (int j = 0; j < 4; j++)
{
float value = 0.0f;
for (int k = 0; k < 4; k++)
{
value += matrix1->m[k * 4 + j] * matrix2->m[i * 4 + k];
}
tempMatrix.m[i * 4 + j] = value;
}
}

CopyMatrix(&tempMatrix, result);
}

void SetRotationMatrixY(float angle, Matrix4 *matrix)
{
SetMatrixIdentity(matrix);

float radians = angle * M_PI / 180.0f;
float cosine = cos(radians);
float sine = sin(radians);

matrix->m[0] = cosine;
matrix->m[8] = -sine;
matrix->m[2] = sine;
matrix->m[10] = cosine;
}

void SetTranslationMatrix(Vector3 translation, Matrix4 *matrix)
{
SetMatrixIdentity(matrix);

matrix->m[12] = translation.x;
matrix->m[13] = translation.y;
matrix->m[14] = translation.z;
}

void SetPerspectiveMatrix(float fovy, float aspect, float zNear, float zFar, Matrix4 *matrix)
{
SetMatrixIdentity(matrix);

float radians = fovy * M_PI / 180.0f;
float cotangent = 1.0f / tan(radians / 2.0f);

matrix->m[0] = cotangent / aspect;
matrix->m[5] = cotangent;
matrix->m[10] = (zFar + zNear) / (zNear - zFar);
matrix->m[11] = -1.0f;
matrix->m[14] = (2.0f * zFar * zNear) / (zNear - zFar);
matrix->m[15] = 0.0f;
}

void CalculateRotationMatrix(Matrix4 *matrix)
{
Matrix4 rotationMatrixY;
SetRotationMatrixY(angle, &rotationMatrixY);

Matrix4 translationMatrix;
Vector3 translation = { 0.0f, 0.0f, -zoom };
SetTranslationMatrix(translation, &translationMatrix);

MultiplyMatrix(&rotationMatrixY, &translationMatrix, matrix);
}

void DrawGrid(Matrix4 *viewMatrix)
{
Vector3 vertices[maxLineSegments * 2];
int vertexCount = 0;

float halfGridSize = gridSize / 2.0f;

for (float i = -halfGridSize; i <= halfGridSize; i += gridSize / maxLineSegments)
{
Vector3 startVertex = { i, 0.0f, -halfGridSize };
Vector3 endVertex = { i, 0.0f, halfGridSize };

vertices[vertexCount++] = startVertex;
vertices[vertexCount++] = endVertex;

startVertex = (Vector3) { -halfGridSize, 0.0f, i };
endVertex = (Vector3) { halfGridSize, 0.0f, i };

vertices[vertexCount++] = startVertex;
vertices[vertexCount++] = endVertex;
}

Matrix4 modelViewMatrix;
MultiplyMatrix(viewMatrix, &modelViewMatrix, &modelViewMatrix);

//glMatrixMode(GL_MODELVIEW);
//glLoadIdentity();

for (int i = 0; i < vertexCount; i += 2)
{
Vector3 startVertex = vertices[i];
Vector3 endVertex = vertices[i + 1];

Vector3 transformedStartVertex;
MultiplyMatrix((Matrix4 *)&startVertex, &modelViewMatrix, (Matrix4 *)&transformedStartVertex);

Vector3 transformedEndVertex;
MultiplyMatrix((Matrix4 *)&endVertex, &modelViewMatrix, (Matrix4 *)&transformedEndVertex);

SDL_RenderDrawLine(renderer, (int)transformedStartVertex.x + SCREEN_WIDTH / 2, (int)transformedStartVertex.y + SCREEN_HEIGHT / 2, (int)transformedEndVertex.x + SCREEN_WIDTH / 2, (int)transformedEndVertex.y + SCREEN_HEIGHT / 2);
}
}

int main(int argc, char* argv[])
{
SDL_Init(SDL_INIT_VIDEO);

window = SDL_CreateWindow("3D-Gitter", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);

if (!window)
{
printf("Fehler beim Erstellen des Fensters: %s\n", SDL_GetError());
return -1;
}

renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

Matrix4 projectionMatrix;
SetPerspectiveMatrix(45.0f, (float)SCREEN_WIDTH / (float)SCREEN_HEIGHT, 1.0f, 100.0f, &projectionMatrix);

SDL_Event event;
bool running = true;

while (running)
{
while (SDL_PollEvent(&event))
{
if (event.type == SDL_QUIT)
{
running = false;
}
else if (event.type == SDL_KEYDOWN)
{
if (event.key.keysym.sym == SDLK_LEFT)
{
angle += rotationSpeed;
}
else if (event.key.keysym.sym == SDLK_RIGHT)
{
angle -= rotationSpeed;
}
else if (event.key.keysym.sym == SDLK_UP)
{
zoom -= zoomSpeed;
}
else if (event.key.keysym.sym == SDLK_DOWN)
{
zoom += zoomSpeed;
}
}
}

SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);

Matrix4 viewMatrix;
CalculateRotationMatrix(&viewMatrix);

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
//SDL_SetRenderDrawBlendMode(renderer, SDL_BLENDMODE_BLEND);
//SDL_SetRenderDrawLineWidth(renderer, lineWidth);

DrawGrid(&viewMatrix);

SDL_RenderPresent(renderer);
}

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);

SDL_Quit();

return 0;
}
