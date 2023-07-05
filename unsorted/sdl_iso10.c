#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>


void rotate_points(float matrix[][3], float *x, float *y, float *z);

#define PI 3.14159265

// Fenstergröße
const int WINDOW_WIDTH = 800;
const int WINDOW_HEIGHT = 600;

// Rotationseigenschaften
float cube_rotation_x = 0.f;
float cube_rotation_y = 0.f;
float cube_rotation_z = 0.f;

// Kameraeigenschaften
float camera_pos_x = 0.f;
float camera_pos_y = 0.f;
float camera_pos_z = -10.f;
float camera_rotation_x = 0.f;
float camera_rotation_y = 0.f;

// Einstellungen
int frames_per_second = 30;
int game_running = 1;

// FPS-Zähler
int frames = 0;
int last_time = 0;
float fps = 0.f;

// Würfel-Vertices
float cube_vertices[] = {
-1.f, -1.f, -1.f,
1.f, -1.f, -1.f,
1.f, -1.f, 1.f,
-1.f, -1.f, 1.f,
-1.f, 1.f, -1.f,
1.f, 1.f, -1.f,
1.f, 1.f, 1.f,
-1.f, 1.f, 1.f
};

// Würfel-Verbindungen
int cube_edges[] = {
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

// Tastatureingaben bearbeiten
void handle_key_press(SDL_KeyboardEvent *event) {
switch(event->keysym.sym) {
case SDLK_ESCAPE:
game_running = 0;
break;
case SDLK_w:
camera_pos_z += 1.f;
break;
case SDLK_a:
camera_pos_x -= 1.f;
break;
case SDLK_s:
camera_pos_z -= 1.f;
break;
case SDLK_d:
camera_pos_x += 1.f;
break;
case SDLK_q:
camera_pos_y += 1.f;
break;
case SDLK_e:
camera_pos_y -= 1.f;
break;
default:
break;
}
}

// Mausereignisse bearbeiten
void handle_mouse_motion(SDL_MouseMotionEvent *event) {
camera_rotation_x += event->yrel;
camera_rotation_y += event->xrel;
}

/* Matrix-Multiplikationen
* | a b c | | x | | x' |
* | d e f | x | y | = | y' |
* | g h i | | z | | z' |
*/
void transform_point(float a[][3], float b, float c, float d, float *x_out, float *y_out, float *z_out) {
*x_out = a[0][0]*b + a[0][1]*c + a[0][2]*d;
*y_out = a[1][0]*b + a[1][1]*c + a[1][2]*d;
*z_out = a[2][0]*b + a[2][1]*c + a[2][2]*d;
}

/*void multiply(float a, float b, float c, float d, float e, float f, float g, float h, float i, float x, float y, float z, float& x_out, float& y_out, float& z_out) {
x_out = a * x + b * y + c * z;
y_out = d * x + e * y + f * z;
z_out = g * x + h * y + i * z;
}
*/
// Rotationsmatrix erstellen
void create_rotation_matrix(float x, float y, float z, float matrix_out[][3]) {
float cx = cos(x * M_PI / 180.f);
float cy = cos(y * M_PI / 180.f);
float cz = cos(z * M_PI / 180.f);
float sx = sin(x * M_PI / 180.f);
float sy = sin(y * M_PI / 180.f);
float sz = sin(z * M_PI / 180.f);

matrix_out[0][0] = cy * cz;
matrix_out[0][1] = -cy * sz;
matrix_out[0][2] = sy;
matrix_out[1][0] = cz * sx * sy + cx * sz;
matrix_out[1][1] = cx * cz - sx * sy * sz;
matrix_out[1][2] = -cy * sx;
matrix_out[2][0] = -cx * cz * sy + sx * sz;
matrix_out[2][1] = cz * sx + cx * sy * sz;
matrix_out[2][2] = cx * cy;
}


// Punkte rotieren
void rotate_points(float matrix[][3], float *x, float *y, float *z) {
float x_out = matrix[0][0]*(*x) + matrix[0][1]*(*y) + matrix[0][2]*(*z);
float y_out = matrix[1][0]*(*x) + matrix[1][1]*(*y) + matrix[1][2]*(*z);
float z_out = matrix[2][0]*(*x) + matrix[2][1]*(*y) + matrix[2][2]*(*z);

*x = x_out;
*y = y_out;
*z = z_out;
}

// Kameraposition und -ausrichtung festlegen
void set_camera_view(SDL_Renderer *renderer) {
// Ausrichtung der Kamera berechnen
float rotation_x_radians = camera_rotation_x * (M_PI / 180.f);
float rotation_y_radians = camera_rotation_y * (M_PI / 180.f);
float camera_dir_x = sin(rotation_y_radians) * cos(rotation_x_radians);
float camera_dir_y = sin(rotation_x_radians);
float camera_dir_z = -cos(rotation_y_radians) * cos(rotation_x_radians);

// Ausrichtung und Position der Kamera festlegen
float up_dir[] = {0.f, 1.f, 0.f};
float camera_pos[] = {camera_pos_x, camera_pos_y, camera_pos_z};
float camera_matrix[3][3];
create_rotation_matrix(-camera_rotation_x, -camera_rotation_y, 0.f, camera_matrix);

float lookat_point[] = {camera_pos_x + camera_dir_x, camera_pos_y + camera_dir_y, camera_pos_z + camera_dir_z};
float lookat_point_rot[3];
for (int i = 0; i < 3; i++) {
lookat_point_rot[i] = lookat_point[i] - camera_pos[i];
rotate_points(camera_matrix, &lookat_point_rot[0], &lookat_point_rot[1], &lookat_point_rot[2]);
lookat_point_rot[i] += camera_pos[i];
}

Sint16 lookat_point_x = (Sint16)(lookat_point_rot[0] * (WINDOW_WIDTH / 2));
Sint16 lookat_point_y = (Sint16)(lookat_point_rot[1] * (WINDOW_HEIGHT / 2));

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderDrawLine(renderer, WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, lookat_point_x, lookat_point_y);
}

// Würfel zeichnen
void draw_cube(SDL_Renderer *renderer) {
SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);

for (int i = 0; i < 12; i++) {
int a = cube_edges[i * 2];
int b = cube_edges[i * 2 + 1];
float x1 = cube_vertices[a * 3];
float y1 = cube_vertices[a * 3 + 1];
float z1 = cube_vertices[a * 3 + 2];
float x2 = cube_vertices[b * 3];
float y2 = cube_vertices[b * 3 + 1];
float z2 = cube_vertices[b * 3 + 2];

// Punkte rotieren
float rot_matrix[3][3];
create_rotation_matrix(cube_rotation_x, cube_rotation_y, cube_rotation_z, rot_matrix);
rotate_points(rot_matrix, &x1, &y1, &z1);
rotate_points(rot_matrix, &x2, &y2, &z2);

// Koordinaten in Kameraraum positionieren
float x1_ = x1 - camera_pos_x;
float y1_ = y1 - camera_pos_y;
float z1_ = z1 - camera_pos_z;
float x2_ = x2 - camera_pos_x;
float y2_ = y2 - camera_pos_y;
float z2_ = z2 - camera_pos_z;

// Punkte in 2D-Screen-Koordinaten umrechnen
Sint16 x1_screen = (int)((WINDOW_WIDTH / 2) + ((x1_ * (WINDOW_WIDTH / 2)) / -z1_));
Sint16 y1_screen = (int)((WINDOW_HEIGHT / 2) - ((y1_ * (WINDOW_HEIGHT / 2)) / -z1_));
Sint16 x2_screen = (int)((WINDOW_WIDTH / 2) + ((x2_ * (WINDOW_WIDTH / 2)) / -z2_));
Sint16 y2_screen = (int)((WINDOW_HEIGHT / 2) - ((y2_ * (WINDOW_HEIGHT / 2)) / -z2_));

// Verbindungslinien zeichnen
SDL_RenderDrawLine(renderer, x1_screen, y1_screen, x2_screen, y2_screen);
}
}

int main(int argc, char** argv) {
// SDL initialisieren
if (SDL_Init(SDL_INIT_VIDEO) < 0) {
printf("Fehler beim Initialisieren von SDL: %s\n", SDL_GetError());
return 1;
}

// SDL-Fenster erstellen
SDL_Window *window = SDL_CreateWindow("Würfelrotation mit SDL", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
if (!window) {
printf("Fehler beim Erstellen des Fensters: %s\n", SDL_GetError());
return 1;
}

// SDL-Renderer erstellen
SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
if (!renderer) {
printf("Fehler beim Erstellen des Renderers: %s\n", SDL_GetError());
return 1;
}

// FPS-Zähler initialisieren
last_time = SDL_GetTicks();

// Spiel-Loop starten
while (game_running) {
// Event-Loop
SDL_Event event;
while (SDL_PollEvent(&event)) {
switch(event.type) {
case SDL_QUIT:
game_running = 0;
break;
case SDL_KEYDOWN:
handle_key_press(&event.key);
break;
case SDL_MOUSEMOTION:
handle_mouse_motion(&event.motion);
break;
default:
break;
}
}

// Hintergrund löschen
SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);

// Würfel zeichnen
draw_cube(renderer);

// Kameraposition und -ausrichtung festlegen
set_camera_view(renderer);

// FPS-Zähler aktualisieren
frames++;
int current_time = SDL_GetTicks();
if (current_time > last_time + 1000) {
fps = (float)frames * 1000.f / (float)(current_time - last_time);
last_time = current_time;
frames = 0;
}

// FPS anzeigen
char fps_text[256];
sprintf(fps_text, "%.2f FPS", fps);
/*SDL_Color font_color = {255, 255, 255};
SDL_Surface *fps_surface = TTF_RenderText_Solid(font, fps_text, font_color);
SDL_Texture *fps_texture = SDL_CreateTextureFromSurface(renderer, fps_surface);
SDL_Rect fps_rect = {0, 0, fps_surface->w, fps_surface->h};
SDL_RenderCopy(renderer, fps_texture, NULL, &fps_rect);
*/

SDL_RenderPresent(renderer);

// Zeitverzögerung, um FPS zu begrenzen
SDL_Delay((1000 / frames_per_second) - (SDL_GetTicks() - current_time));
}

// SDL beenden
SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}
