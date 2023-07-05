/*

Frohe Ostern Konstrukt! Ich brauche ein C Programm das mit SDL ein 3D Feld in 2D anzeigt, mit isometrischer Projektion, und einem um alle achsen rotierendem 3D Quader.
Hey! Schön, dass du dich an mich wendest. Ich würde dir gerne helfen. Hast du bereits Erfahrung mit C-Programmierung und SDL? Wenn ja, dann fällt es dir wahrscheinlich leichter, das Programm zu schreiben. Falls nicht, würde ich empfehlen, dich zuerst mit den Grundlagen vertraut zu machen.

Hier sind einige Schritte, um dein Programm zu erstellen:

1. Installiere SDL auf deinem Rechner und richte eine SDL-Entwicklungsumgebung ein.
2. Schaue dir ein Tutorial zur isometrischen Projektion an, um ein besseres Verständnis dafür zu bekommen, wie die Perspektive erstellt wird.
3. Entwerfe eine 2D-Karte mithilfe isometrischer Projektion. Die Karte sollte eine Kachelkarte sein und eine bestimmte Breite und Höhe haben.
4. Erstelle das 3D-Quader-Objekt.
5. Rotiere das 3D-Quader-Objekt um alle Achsen im 3D-Raum, um eine Perspektive zu erhalten.
6. Erstelle eine Schleife, um das 3D-Quader-Objekt auf der 2D-Karte darzustellen.
7. Füge Farben hinzu, um die Darstellung ansprechender zu gestalten.

Ich hoffe, das hilft dir weiter. Lass es mich wissen, falls du weitere Fragen hast.

Gibt mir bitte den entsprechenden C Code.

Sicher! Hier ist ein Beispielprogramm, das einen rotierenden 3D-Quader in einer isometrischen Projektion auf einer 2D-Karte mit SDL darstellt.
Beachte bitte, dass dies nur ein Beispiel ist und du möglicherweise Anpassungen vornehmen musst, um es für deine Bedürfnisse zu optimieren:

Ersetze die GL Funktionsaufrufe durch eigene Rotationsberechnungen und SDL_DrawLines und die anderen SDL Funktionen

Klar, hier ist eine Version des Programms, die die OpenGL-Funktionsaufrufe durch eigene Rotationsberechnungen und SDL_DrawLines ersetzt:



*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>


#define PI 3.14159265

// Fenstergröße
const int WINDOW_WIDTH = 640;
const int WINDOW_HEIGHT = 480;

// Anzahl der Kacheln auf der Karte
const int MAP_ROWS = 10;
const int MAP_COLUMNS = 10;

// Kachelgröße
const int TILE_WIDTH = 64;
const int TILE_HEIGHT = 32;

// ROTATIONSGESCHWINDIGKEIT des Quaders (in Grad/s)
const float ROTATION_SPEED = 90.0;

// Struktur für Quaderposition und Rotation
typedef struct {
float x, y, z; // Position
float rx, ry, rz; // Rotation (in Grad)
} Cube;

// SDL- und OpenGL-Fenster
SDL_Window* window = NULL;
SDL_Renderer* renderer = NULL;

// Rotationswinkel (in Grad) für jede Achse
float rotation_x = 0, rotation_y = 0, rotation_z = 0;

// Erstelle einen Würfel an der gegebenen Position
void create_cube(Cube* cube, float x, float y, float z) {
cube->x = x;
cube->y = y;
cube->z = z;
cube->rx = 0;
cube->ry = 0;
cube->rz = 0;
}

// Drehe den Würfel auf der gegebenen Achse um den gegebenen Winkel (in Grad)
void rotate_cube(Cube* cube, char axis, float angle) {
switch (axis) {
case 'x':
cube->rx += angle;
break;
case 'y':
cube->ry += angle;
break;
case 'z':
cube->rz += angle;
break;
}
}

// Rotiere den Punkt (x, y, z) um den Winkel (angle) auf der X-Achse
void rotate_x(float* x, float* y, float* z, float angle) {
float new_y = *y * cos(angle * PI / 180) - *z * sin(angle * PI / 180);
float new_z = *y * sin(angle * PI / 180) + *z * cos(angle * PI / 180);

*y = new_y;
*z = new_z;
}

// Rotiere den Punkt (x, y, z) um den Winkel (angle) auf der Y-Achse
void rotate_y(float* x, float* y, float* z, float angle) {
float new_x = *x * cos(angle * PI / 180) + *z * sin(angle * PI / 180);
float new_z = -*x * sin(angle * PI / 180) + *z * cos(angle * PI / 180);

*x = new_x;
*z = new_z;
}

// Rotiere den Punkt (x, y, z) um den Winkel (angle) auf der Z-Achse
void rotate_z(float* x, float* y, float* z, float angle) {
float new_x = *x * cos(angle * PI / 180) - *y * sin(angle * PI / 180);
float new_y = *x * sin(angle * PI / 180) + *y * cos(angle * PI / 180);

*x = new_x;
*y = new_y;
}

// Projiziere den Punkt (x, y, z) auf die isometrische Karte
void project_point(float* x, float* y, float* z) {
float iso_x = (*x - *y) * TILE_WIDTH / 2;
float iso_y = (*x + *y) * TILE_HEIGHT / 2 - *z;

*x = iso_x;
*y = iso_y;
}

// Zeichne einen Würfel von der gegebenen Position aus
void render_cube(Cube* cube, SDL_Renderer* renderer) {
// Jeder Würfel ist aus 6 Seiten zusammengesetzt
float points[8][3] = {
{-1, -1, 1}, {1, -1, 1}, {1, 1, 1}, {-1, 1, 1},
{-1, -1, -1}, {-1, 1, -1}, {1, 1, -1}, {1, -1, -1}
};

// Drehe den Würfel um die angegebenen Achsen
for (int i = 0; i < 8; i++) {
rotate_x(&points[i][0], &points[i][1], &points[i][2], cube->rx);
rotate_y(&points[i][0], &points[i][1], &points[i][2], cube->ry);
rotate_z(&points[i][0], &points[i][1], &points[i][2], cube->rz);
project_point(&points[i][0], &points[i][1], &points[i][2]);
}

// Zeichne die Kanten der Würfel-Seiten
SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
SDL_RenderDrawLine(renderer, 320+points[0][0], 240+points[0][1], 320+points[1][0], 240+points[1][1]);
SDL_RenderDrawLine(renderer, 320+points[1][0], 240+points[1][1], 320+points[2][0], 240+points[2][1]);
SDL_RenderDrawLine(renderer, 320+points[2][0], 240+points[2][1], 320+points[3][0], 240+points[3][1]);
SDL_RenderDrawLine(renderer, 320+points[3][0], 240+points[3][1], 320+points[0][0], 240+points[0][1]);

SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
SDL_RenderDrawLine(renderer, 320+points[4][0], 240+points[4][1], 320+points[5][0], 240+points[5][1]);
SDL_RenderDrawLine(renderer, 320+points[5][0], 240+points[5][1], 320+points[6][0], 240+points[6][1]);
SDL_RenderDrawLine(renderer, 320+points[6][0], 240+points[6][1], 320+points[7][0], 240+points[7][1]);
SDL_RenderDrawLine(renderer, 320+points[7][0], 240+points[7][1], 320+points[4][0], 240+points[4][1]);

SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
SDL_RenderDrawLine(renderer, 320+points[0][0], 240+points[0][1], 320+points[4][0], 240+points[4][1]);
SDL_RenderDrawLine(renderer, 320+points[1][0], 240+points[1][1], 320+points[5][0], 240+points[5][1]);
SDL_RenderDrawLine(renderer, 320+points[2][0], 240+points[2][1], 320+points[6][0], 240+points[6][1]);
SDL_RenderDrawLine(renderer, 320+points[3][0], 240+points[3][1], 320+points[7][0], 240+points[7][1]);
}

// Initialisierung der SDL- und OpenGL-Fenster und -Einstellungen
int init() {
if (SDL_Init(SDL_INIT_VIDEO) < 0) {
printf("SDL konnte nicht initialisiert werden. SDL_Error: %s\n", SDL_GetError());
return -1;
}

window = SDL_CreateWindow(
"Isometric Cube Demo",
SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
WINDOW_WIDTH, WINDOW_HEIGHT,
SDL_WINDOW_SHOWN
);

if (window == NULL) {
printf("Das Fenster konnte nicht erstellt werden. SDL_Error: %s\n", SDL_GetError());
return -1;
}

renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);

if (renderer == NULL) {
printf("Der Renderer konnte nicht erstellt werden. SDL_Error: %s\n", SDL_GetError());
return -1;
}

return 0;
}

// Ereignisschleife
int loop() {
SDL_Event event;
bool quit = false;

// Erstelle einen Würfel
Cube cube;
create_cube(&cube, 0, 0, 0);

while (!quit) {
while (SDL_PollEvent(&event) != 0) {
if (event.type == SDL_QUIT) {
quit = true;
}
}

// Rotiere den Würfel um die Y-Achse mit ROTATION_SPEED Grad/s
float delta_time = 1.0 / 60;
rotate_cube(&cube, 'y', ROTATION_SPEED * delta_time);

// Lösche das Fenster
SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderClear(renderer);

// Zeichne die Kacheln auf der Karte
for (int row = 0; row < MAP_ROWS; row++) {
for (int column = 0; column < MAP_COLUMNS; column++) {

SDL_Rect tile_rect = {
column * TILE_WIDTH / 2 - row * TILE_WIDTH / 2 + WINDOW_WIDTH / 2,
row * TILE_HEIGHT / 2 + column * TILE_HEIGHT / 2,
TILE_WIDTH,
TILE_HEIGHT
};


SDL_SetRenderDrawColor(renderer, 192, 192, 192, 255);
SDL_RenderFillRect(renderer, &tile_rect);

SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderDrawRect(renderer, &tile_rect);

}
}

// Zeichne den Würfel
render_cube(&cube, renderer);

// Aktualisiere das Fenster
SDL_RenderPresent(renderer);
}

return 0;
}

// Deinitialisierung der SDL- und OpenGL-Fenster
void quit() {
SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();
}

int main() {
if (init() < 0) {
return -1;
}

if (loop() < 0) {
return -1;
}

quit();

return 0;
}
