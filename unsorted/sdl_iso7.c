#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>

void drawClippedTriangle(SDL_Renderer* renderer, SDL_Point* points, int clipX, int clipY, int clipW, int clipH)
{
    // Create an array to store the clipped points
    SDL_Point clippedPoints[3];

    // Loop through all edges of the triangle
    for (int i = 0; i < 3; i++)
    {
        // Get the start and end point of the current edge
        SDL_Point startPoint = points[i];
        SDL_Point endPoint = points[(i+1)%3];

        // Clip the edge against the specified clipping rectangle
        bool clipped = SDL_IntersectRectAndLine(&clipX, &clipY, &clipW, &clipH, &startPoint.x, &startPoint.y, &endPoint.x, &endPoint.y);

        // If the edge was not completely clipped away, add the clipped start point to the array of clipped points
        if (clipped)
        {
            clippedPoints[i] = startPoint;
        }
    }

    // Draw the clipped triangle
    SDL_RenderDrawLines(renderer, clippedPoints, 3);
}

void main() {
SDL_Init(SDL_INIT_VIDEO);
SDL_Window* win = SDL_CreateWindow("3D-Würfel",SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,640,480,SDL_WINDOW_SHOWN);
SDL_Renderer* ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED);
SDL_SetRenderDrawColor(ren, 0, 0, 0, 255);
SDL_RenderClear(ren);
SDL_SetRenderDrawColor(ren, 255, 255, 255, 255);
Point3D cube[8] = {{ -1.0f, -1.0f, -1.0f },{ -1.0f, 1.0f, -1.0f },{ 1.0f, 1.0f, -1.0f },{ 1.0f, -1.0f, -1.0f },{ -1.0f, -1.0f, 1.0f },{ -1.0f, 1.0f, 1.0f },{ 1.0f, 1.0f, 1.0f },{ 1.0f, -1.0f, 1.0f }};
int edge[12][2] = {{ 0, 1 },{ 1, 2 },{ 2, 3 },{ 3, 0 },{ 0, 4 },{ 1, 5 },{ 2, 6 },{ 3, 7 },{ 4, 5 },{ 5, 6 },{ 6, 7 },{ 7, 4 }};
Camera cam;
cam.position = (Point3D){0, -2, 2};
cam.target = (Point3D){0, 0, 0};
cam.aspectRatio = 4.0f/3.0f;
cam.nearPlane = 1.0f;
cam.farPlane = 100.0f;
cam.fov = 60.0f;
Point3D up = {0, 0, -1};
Point3D dir = {cam.target.x - cam.position.x, cam.target.y - cam.position.y, cam.target.z - cam.position.z};
Matrix rotMat = createRotMat(up, -M_PI/4);
Matrix transMat = createTransMat(cam.position);
Matrix cubeMat = multiplyMat(rotMat, transMat);
cubeMat = multiplyMat(createProjectionMat(cam.fov, cam.aspectRatio, cam.nearPlane, cam.farPlane), cubeMat);
int i, j;
for (i = 0; i < 12; i++){
Point3D start = transformPoint(cube[edge[i][0]], cubeMat);
Point3D end = transformPoint(cube[edge[i][1]], cubeMat);
SDL_RenderDrawLine(ren,(int)round(start.x * 320 + 320),(int)round(-start.y * 240 + 240),(int)round(end.x * 320 + 320),(int)round(-end.y * 240 + 240));
}
SDL_RenderPresent(ren);
SDL_Delay(5000);
SDL_DestroyRenderer(ren);
SDL_DestroyWindow(win);
SDL_Quit();
}

