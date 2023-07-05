
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>

int main() {
SDL_Window* window;
SDL_Renderer* renderer;
SDL_Event event;
int quit = 0;

SDL_Init(SDL_INIT_VIDEO);
SDL_CreateWindowAndRenderer(640, 480, 0, &window, &renderer);

// set up some vertices for the cube
float vertices[] = {
-0.5f, -0.5f, -0.5f,
0.5f, -0.5f, -0.5f,
0.5f, 0.5f, -0.5f,
-0.5f, 0.5f, -0.5f,
-0.5f, -0.5f, 0.5f,
0.5f, -0.5f, 0.5f,
0.5f, 0.5f, 0.5f,
-0.5f, 0.5f, 0.5f
};

// set up some edge pairs that make up the cube
int edges[] = {
0, 1,
1, 2,
2, 3,
3, 0,
4, 5,
5, 6,
6, 7,
7, 4,
0, 4,
1, 5,
2, 6,
3, 7
};

// set up a camera position
float camera[] = { 0.0f, 0.0f, -2.0f };

while (!quit) {
while (SDL_PollEvent(&event)) {
if (event.type == SDL_QUIT) {
quit = 1;
}
}

// clear the screen
SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);

// rotate the cube gradually over time
static float angle = 0.0f;
angle += 0.1f;
float rotation[] = {
cosf(angle), 0.0f, sinf(angle), 0.0f,
0.0f, 1.0f, 0.0f, 0.0f,
-sinf(angle), 0.0f, cosf(angle), 0.0f,
0.0f, 0.0f, 0.0f, 1.0f
};

// multiply the vertices by the rotation matrix
float rotated_vertices[24];
for (int i = 0; i < 8; i++) {
float x = vertices[i * 3 + 0];
float y = vertices[i * 3 + 1];
float z = vertices[i * 3 + 2];
rotated_vertices[i * 3 + 0] = x * rotation[0] + y * rotation[4] + z * rotation[8] + rotation[12];
rotated_vertices[i * 3 + 1] = x * rotation[1] + y * rotation[5] + z * rotation[9] + rotation[13];
rotated_vertices[i * 3 + 2] = x * rotation[2] + y * rotation[6] + z * rotation[10] + rotation[14];
}

// project the vertices onto the screen
int projected_vertices[16];
for (int i = 0; i < 8; i++) {
float x = rotated_vertices[i * 3 + 0] - camera[0];
float y = rotated_vertices[i * 3 + 1] - camera[1];
float z = rotated_vertices[i * 3 + 2] - camera[2];
float projected_x = x / z;
float projected_y = y / z;
projected_vertices[i * 2 + 0] = (int)(projected_x * 200.0f + 320.0f);
projected_vertices[i * 2 + 1] = (int)(projected_y * 200.0f + 240.0f);
}

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);

// draw the edges
for (int i = 0; i < 24; i += 2) {
int v1 = edges[i];
int v2 = edges[i + 1];
SDL_RenderDrawLine(renderer, projected_vertices[v1 * 2 + 0], projected_vertices[v1 * 2 + 1], projected_vertices[v2 * 2 + 0], projected_vertices[v2 * 2 + 1]);
}

// present the frame
SDL_RenderPresent(renderer);
}

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}
