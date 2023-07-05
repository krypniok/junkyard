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

// Kamera-Position
float camera_position_x = 0;
float camera_position_y = 0;
float camera_position_z = -5;

// Kamera-Blickrichtung
float camera_pitch = 0; // Neigung der Kamera (in Grad)
float camera_yaw = 0; // Drehung der Kamera um die vertikale Achse (in Grad)

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
camera_position_x += sinf(camera_yaw * M_PI / 180) * cosf(camera_pitch * M_PI / 180);
camera_position_y += sinf(camera_pitch * M_PI / 180);
camera_position_z += cosf(camera_yaw * M_PI / 180) * cosf(camera_pitch * M_PI / 180);
break;
case SDLK_s:
camera_position_x -= sinf(camera_yaw * M_PI / 180) * cosf(camera_pitch * M_PI / 180);
camera_position_y -= sinf(camera_pitch * M_PI / 180);
camera_position_z -= cosf(camera_yaw * M_PI / 180) * cosf(camera_pitch * M_PI / 180);
break;
case SDLK_a:
camera_position_x -= cosf(camera_yaw * M_PI / 180);
camera_position_z -= sinf(camera_yaw * M_PI / 180);
break;
case SDLK_d:
camera_position_x += cosf(camera_yaw * M_PI / 180);
camera_position_z += sinf(camera_yaw * M_PI / 180);
break;
case SDLK_q:
camera_yaw -= 5.0f;
break;
case SDLK_e:
camera_yaw += 5.0f;
break;
case SDLK_r:
camera_pitch += 5.0f;
break;
case SDLK_f:
camera_pitch -= 5.0f;
break;
case SDLK_UP:
cube_rotation_x -= 5.0f;
break;
case SDLK_DOWN:
cube_rotation_x += 5.0f;
break;
case SDLK_LEFT:
cube_rotation_y -= 5.0f;
break;
case SDLK_RIGHT:
cube_rotation_y += 5.0f;
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


void draw_cube1(SDL_Renderer *renderer) {
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

void update_camera() {
// Blickrichtung berechnen
float dir_x, dir_y, dir_z;
dir_x = sinf(camera_yaw * M_PI / 180.f) * cosf(camera_pitch * M_PI / 180.f);
dir_y = sinf(camera_pitch * M_PI / 180.f);
dir_z = cosf(camera_yaw * M_PI / 180.f) * cosf(camera_pitch * M_PI / 180.f);

// Kameramatrix erstellen
float camera_matrix[3][3];
camera_matrix[0][0] = cosf(camera_yaw * M_PI / 180.f);
camera_matrix[0][1] = 0;
camera_matrix[0][2] = sinf(camera_yaw * M_PI / 180.f);
camera_matrix[1][0] = sinf(camera_yaw * M_PI / 180.f) * sinf(camera_pitch * M_PI / 180.f);
camera_matrix[1][1] = cosf(camera_pitch * M_PI / 180.f);
camera_matrix[1][2] = -cosf(camera_yaw * M_PI / 180.f) * sinf(camera_pitch * M_PI / 180.f);
camera_matrix[2][0] = -sinf(camera_yaw * M_PI / 180.f) * cosf(camera_pitch * M_PI / 180.f);
camera_matrix[2][1] = sinf(camera_pitch * M_PI / 180.f);
camera_matrix[2][2] = cosf(camera_yaw * M_PI / 180.f) * cosf(camera_pitch * M_PI / 180.f);

// Kameraposition anpassen
float move_speed = 0.1f;
if(SDL_GetKeyboardState(NULL)[SDL_SCANCODE_LSHIFT]) {
move_speed *= 10.f;
}
if(SDL_GetKeyboardState(NULL)[SDL_SCANCODE_W]) {
camera_position_x += dir_x * move_speed;
camera_position_y += dir_y * move_speed;
camera_position_z += dir_z * move_speed;
}
if(SDL_GetKeyboardState(NULL)[SDL_SCANCODE_S]) {
camera_position_x -= dir_x * move_speed;
camera_position_y -= dir_y * move_speed;
camera_position_z -= dir_z * move_speed;
}
if(SDL_GetKeyboardState(NULL)[SDL_SCANCODE_A]) {
camera_position_x -= camera_matrix[0][0] * move_speed;
camera_position_y -= camera_matrix[1][0] * move_speed;
camera_position_z -= camera_matrix[2][0] * move_speed;
}
if(SDL_GetKeyboardState(NULL)[SDL_SCANCODE_D]) {
camera_position_x += camera_matrix[0][0] * move_speed;
camera_position_y += camera_matrix[1][0] * move_speed;
camera_position_z += camera_matrix[2][0] * move_speed;
}
}

// draw_cube-Funktion aktualisieren
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



// Kameramatrix erstellen
float camera_matrix[3][3];
create_rotation_matrix(camera_pitch, camera_yaw, 0, camera_matrix);
camera_matrix[0][2] = -camera_position_x;
camera_matrix[1][2] = -camera_position_y;
camera_matrix[2][2] = -camera_position_z;

// Eckpunkte des Würfels mit Kameramatrix transformieren
float transformed_vertices[8][3];
for(int i = 0; i < 8; i++) {
transformed_vertices[i][0] = rotated_vertices[i][0] * camera_matrix[0][0] + rotated_vertices[i][1] * camera_matrix[0][1] + rotated_vertices[i][2] * camera_matrix[0][2];
transformed_vertices[i][1] = rotated_vertices[i][0] * camera_matrix[1][0] + rotated_vertices[i][1] * camera_matrix[1][1] + rotated_vertices[i][2] * camera_matrix[1][2];
transformed_vertices[i][2] = rotated_vertices[i][0] * camera_matrix[2][0] + rotated_vertices[i][1] * camera_matrix[2][1] + rotated_vertices[i][2] * camera_matrix[2][2];
}

// Verbindungen zeichnen
for(int i = 0; i < 24; i += 2) {
SDL_RenderDrawLine(renderer,
transformed_vertices[cube_edges[i]][0]*100 + WINDOW_WIDTH/2, transformed_vertices[cube_edges[i]][1]*100 + WINDOW_HEIGHT/2,
transformed_vertices[cube_edges[i+1]][0]*100 + WINDOW_WIDTH/2, transformed_vertices[cube_edges[i+1]][1]*100 + WINDOW_HEIGHT/2);
}
}

// Event-Handling-Funktion
void handle_events(SDL_Event event) {
switch(event.type) {
case SDL_KEYDOWN:
switch(event.key.keysym.sym) {
case SDLK_w: camera_position_z += 0.1; break;
case SDLK_s: camera_position_z -= 0.1; break;
case SDLK_a: camera_position_x += 0.1; break;
case SDLK_d: camera_position_x -= 0.1; break;
case SDLK_q: camera_position_y += 0.1; break;
case SDLK_e: camera_position_y -= 0.1; break;
case SDLK_r: camera_pitch -= 0.1; break;
case SDLK_f: camera_pitch += 0.1; break;
}
break;

case SDL_MOUSEMOTION:
if (event.motion.state & SDL_BUTTON_LMASK) {
camera_yaw += event.motion.xrel * 0.1;
camera_pitch += event.motion.yrel * 0.1;
}
break;
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

game_running = 1;
// Events behandeln
SDL_Event event;
while(game_running) {
// Tastatur- und Mausereignisse behandeln
while(SDL_PollEvent(&event)) {
switch(event.type) {
case SDL_QUIT:
game_running = false;
break;
case SDL_KEYDOWN:
handle_key_press(&event.key.keysym);
handle_events(event);
break;
}

// Kamera aktualisieren
update_camera();

// Hintergrund löschen
SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderClear(renderer);

// Würfel zeichnen
SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
draw_cube(renderer);

// Bildschirm aktualisieren
SDL_RenderPresent(renderer);
}
}

// Ressourcen freigeben und SDL beenden
SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}

