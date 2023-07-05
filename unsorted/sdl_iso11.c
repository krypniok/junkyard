#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>


#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600

int frames_per_second = 60;
int game_running = 1;

// Würfel-Rotationswinkel
float cube_rotation_x = 0;
float cube_rotation_y = 0;
float cube_rotation_z = 0;

// Würfel-Koordinaten
float cube_vertices[] = {
-1.0f, -1.0f, -1.0f,
-1.0f, -1.0f, 1.0f,
-1.0f, 1.0f, -1.0f,
-1.0f, 1.0f, 1.0f,
1.0f, -1.0f, -1.0f,
1.0f, -1.0f, 1.0f,
1.0f, 1.0f, -1.0f,
1.0f, 1.0f, 1.0f
};

// Würfel-Kanten (definiert durch Verbindung der Eckpunkte)
int cube_edges[] = {
0, 1,
0, 2,
0, 4,
1, 3,
1, 5,
2, 3,
2, 6,
3, 7,
4, 5,
4, 6,
5, 7,
6, 7
};

// Funktionen
void handle_key_press(SDL_Keysym *key) {
switch(key->sym) {
case SDLK_ESCAPE:
game_running = 0;
break;
case SDLK_w:
cube_rotation_x -= 5.0f;
break;
case SDLK_s:
cube_rotation_x += 5.0f;
break;
case SDLK_a:
cube_rotation_y -= 5.0f;
break;
case SDLK_d:
cube_rotation_y += 5.0f;
break;
case SDLK_q:
cube_rotation_z -= 5.0f;
break;
case SDLK_e:
cube_rotation_z += 5.0f;
break;
default:
break;
}
}

void rotate_points(float matrix[3][3], float *x, float *y, float *z) {
float x_out, y_out, z_out;

// Matrixmultiplikation durchführen und Ergebnis speichern
x_out = matrix[0][0] * *x + matrix[0][1] * *y + matrix[0][2] * *z;
y_out = matrix[1][0] * *x + matrix[1][1] * *y + matrix[1][2] * *z;
z_out = matrix[2][0] * *x + matrix[2][1] * *y + matrix[2][2] * *z;

// Ergebnis zurückgeben
*x = x_out;
*y = y_out;
*z = z_out;
}

void create_rotation_matrix(float angle_x, float angle_y, float angle_z, float matrix[3][3]) {
float cos_x, sin_x, cos_y, sin_y, cos_z, sin_z;

// Cosinus und Sinus der Winkel berechnen
cos_x = cosf(angle_x * M_PI / 180.f);
sin_x = sinf(angle_x * M_PI / 180.f);
cos_y = cosf(angle_y * M_PI / 180.f);
sin_y = sinf(angle_y * M_PI / 180.f);
cos_z = cosf(angle_z * M_PI / 180.f);
sin_z = sinf(angle_z * M_PI / 180.f);

// Rotationsmatrix erstellen
matrix[0][0] = cos_y*cos_z;
matrix[0][1] = cos_x*sin_z + cos_z*sin_x*sin_y;
matrix[0][2] = sin_x*sin_z - cos_x*cos_z*sin_y;
matrix[1][0] = -cos_y*sin_z;
matrix[1][1] = cos_x*cos_z - sin_x*sin_y*sin_z;
matrix[1][2] = cos_z*sin_x + cos_x*sin_y*sin_z;
matrix[2][0] = sin_y;
matrix[2][1] = -cos_y*sin_x;
matrix[2][2] = cos_x*cos_y;
}

void draw_cube(SDL_Renderer *renderer) {
// Rotationsmatrix erstellen
float rotation_matrix[3][3];
create_rotation_matrix(cube_rotation_x, cube_rotation_y, cube_rotation_z, rotation_matrix);

// Punkte des Würfels rotieren und speichern
float rotated_vertices[8][3];
for(int i = 0; i < 8; i++) {
rotated_vertices[i][0] = cube_vertices[i*3];
rotated_vertices[i][1] = cube_vertices[i*3 + 1];
rotated_vertices[i][2] = cube_vertices[i*3 + 2];
rotate_points(rotation_matrix, &rotated_vertices[i][0], &rotated_vertices[i][1], &rotated_vertices[i][2]);
}

// Verbindungen zeichnen
for(int i = 0; i < 24; i += 2) {
SDL_RenderDrawLine(renderer,
rotated_vertices[cube_edges[i]][0]*100 + WINDOW_WIDTH/2, rotated_vertices[cube_edges[i]][1]*100 + WINDOW_HEIGHT/2,
rotated_vertices[cube_edges[i+1]][0]*100 + WINDOW_WIDTH/2, rotated_vertices[cube_edges[i+1]][1]*100 + WINDOW_HEIGHT/2);
}
}

int main(int argc, char *argv[]) {
// SDL initialisieren
if(SDL_Init(SDL_INIT_VIDEO) != 0) {
printf("SDL_Init Error: %s\n", SDL_GetError());
return 1;
}

// Fenster erstellen
SDL_Window *window = SDL_CreateWindow("SDL Cube", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
if(window == NULL) {
printf("SDL_CreateWindow Error: %s\n", SDL_GetError());
return 1;
}

// Renderer erstellen
SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
if(renderer == NULL) {
printf("SDL_CreateRenderer Error: %s\n", SDL_GetError());
return 1;
}

// Events behandeln
SDL_Event event;
while(game_running) {
// Tastatur- und Mausereignisse behandeln
while(SDL_PollEvent(&event)) {
switch(event.type) {
case SDL_QUIT:
game_running = 0;
break;
case SDL_KEYDOWN:
handle_key_press(&event.key.keysym);
break;
default:
break;
}
}

// Hintergrund löschen
SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);

// Würfel zeichnen
SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
draw_cube(renderer);

// FPS anzeigen
char fps_str[16];
sprintf(fps_str, "%.2f", SDL_GetTicks() / 1000.f);
SDL_SetWindowTitle(window, fps_str);

// Renderer anzeigen
SDL_RenderPresent(renderer);

// Zeitschleife einhalten
SDL_Delay(1000/frames_per_second);
}

// Aufräumen
SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}

