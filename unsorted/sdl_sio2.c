#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>


// Konstanten für Fenster- und Zeichenflächen-Größe
const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

// Konstanten für die Kameraposition und -bewegung
float cameraDistance = 10.0f;
float cameraAngleX = M_PI / 4.0f;
float cameraAngleY = M_PI / 4.0f;
float cameraSpeed = 0.1f;

// Konstanten für Würfelgröße und -position
const float CUBE_SIZE = 2.0f;
const float CUBE_X = 0.0f;
const float CUBE_Y = 0.0f;
const float CUBE_Z = 0.0f;

// Initialisierung von SDL und des Fensters
SDL_Window* window = NULL;
SDL_Renderer* renderer = NULL;
SDL_Surface* surface = NULL;

int init() {
// Initialisierung von SDL
if (SDL_Init(SDL_INIT_VIDEO) < 0) {
printf("SDL konnte nicht initialisiert werden! SDL_Error: %s\n", SDL_GetError());
return -1;
}

// Erstellung des Fensters
window = SDL_CreateWindow("3D Objekte in 2D Zeichnen", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
if (window == NULL) {
printf("Fenster konnte nicht erstellt werden! SDL_Error: %s\n", SDL_GetError());
return -1;
}

// Erstellung des Renderers
renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
if (renderer == NULL) {
printf("Renderer konnte nicht erstellt werden! SDL_Error: %s\n", SDL_GetError());
return -1;
}

// Erstellung der Zeichenfläche
surface = SDL_GetWindowSurface(window);
if (surface == NULL) {
printf("Zeichenfläche konnte nicht erstellt werden! SDL_Error: %s\n", SDL_GetError());
return -1;
}

return 0;
}

// Struktur für 3D-Punkt
typedef struct {
float x;
float y;
float z;
} Point3D;

// Funktionen für Vektor- und Matrixberechnungen
float magnitude(Point3D p) {
return sqrt(p.x * p.x + p.y * p.y + p.z * p.z);
}

Point3D normalize(Point3D p) {
float mag = magnitude(p);
Point3D normalized = {
p.x / mag,
p.y / mag,
p.z / mag
};
return normalized;
}

Point3D cross(Point3D u, Point3D v) {
Point3D crossed = {
u.y * v.z - u.z * v.y,
u.z * v.x - u.x * v.z,
u.x * v.y - u.y * v.x
};
return crossed;
}

Point3D rotateX(Point3D p, float angle) {
Point3D rotated = {
p.x,
p.y * cos(angle) - p.z * sin(angle),
p.y * sin(angle) + p.z * cos(angle)
};
return rotated;
}

Point3D rotateY(Point3D p, float angle) {
Point3D rotated = {
p.x * cos(angle) + p.z * sin(angle),
p.y,
-p.x * sin(angle) + p.z * cos(angle)
};
return rotated;
}

Point3D transform(Point3D p, float* matrix) {
Point3D transformed = {
p.x * matrix[0] + p.y * matrix[4] + p.z * matrix[8] + matrix[12],
p.x * matrix[1] + p.y * matrix[5] + p.z * matrix[9] + matrix[13],
p.x * matrix[2] + p.y * matrix[6] + p.z * matrix[10] + matrix[14]
};
return transformed;
}

// Funktion zum Zeichnen von Linien
void drawLine(SDL_Renderer* renderer, float x1, float y1, float x2, float y2) {
SDL_RenderDrawLine(renderer, x1, y1, x2, y2);
}

// Funktion zum Zeichnen eines Würfels
void drawCube(SDL_Renderer* renderer, Point3D position, float* matrix, float angle) {
// Definiere die 8 Ecken des Würfels
Point3D vertices[] = {
{ -CUBE_SIZE, -CUBE_SIZE, -CUBE_SIZE },
{ -CUBE_SIZE, -CUBE_SIZE, CUBE_SIZE },
{ -CUBE_SIZE, CUBE_SIZE, -CUBE_SIZE },
{ -CUBE_SIZE, CUBE_SIZE, CUBE_SIZE },
{ CUBE_SIZE, -CUBE_SIZE, -CUBE_SIZE },
{ CUBE_SIZE, -CUBE_SIZE, CUBE_SIZE },
{ CUBE_SIZE, CUBE_SIZE, -CUBE_SIZE },
{ CUBE_SIZE, CUBE_SIZE, CUBE_SIZE }
};

// Verbinde die Ecken des Würfels durch Kanten
int edges[][2] = {
{ 0, 1 },
{ 0, 2 },
{ 0, 4 },
{ 1, 3 },
{ 1, 5 },
{ 2, 3 },
{ 2, 6 },
{ 3, 7 },
{ 4, 5 },
{ 4, 6 },
{ 5, 7 },
{ 6, 7 }
};

// Transformiere die Ecken des Würfels durch die Kameraposition und -ausrichtung
Point3D transformedVertices[8];
for (int i = 0; i < 8; i++) {
Point3D rotatedX = rotateX(vertices[i], angle);
Point3D rotatedY = rotateY(rotatedX, angle);
Point3D transformed = transform(rotatedY, matrix);
transformed.x += position.x;
transformed.y += position.y;
transformed.z += position.z;
transformedVertices[i] = transformed;
}

// Zeichne die Kanten des Würfels als Linien
for (int i = 0; i < 12; i++) {
Point3D p1 = transformedVertices[edges[i][0]];
Point3D p2 = transformedVertices[edges[i][1]];
drawLine(renderer, p1.x * 100 / p1.z + SCREEN_WIDTH / 2, p1.y * 100 / p1.z + SCREEN_HEIGHT / 2, p2.x * 100 / p2.z + SCREEN_WIDTH / 2, p2.y * 100 / p2.z + SCREEN_HEIGHT / 2);
}
}

void moveCamera(SDL_Event event) {
switch (event.key.keysym.sym) {
case SDLK_w:
cameraVelocity.z -= cameraSpeed;
break;
case SDLK_s:
cameraVelocity.z += cameraSpeed;
break;
case SDLK_a:
cameraVelocity.x -= cameraSpeed;
break;
case SDLK_d:
cameraVelocity.x += cameraSpeed;
break;
case SDLK_SPACE:
cameraVelocity.y += cameraSpeed;
break;
case SDLK_LSHIFT:
cameraVelocity.y -= cameraSpeed;
break;
}
}

// Funktion zum Bewegen der Kamera mit der Maus
void moveCameraMouse(SDL_Event event) {
switch (event.type) {
case SDL_MOUSEBUTTONDOWN:
SDL_SetRelativeMouseMode(SDL_TRUE);
break;
case SDL_MOUSEBUTTONUP:
SDL_SetRelativeMouseMode(SDL_FALSE);
cameraAngularVelocity.x = 0;
cameraAngularVelocity.y = 0;
break;
case SDL_MOUSEMOTION:
if (SDL_GetRelativeMouseMode()) {
cameraAngularVelocity.x = event.motion.xrel * cameraSpeed;
cameraAngularVelocity.y = event.motion.yrel * cameraSpeed;
}
break;
}
}

// Funktion zum Aktualisieren der Kameraposition und Ausrichtung basierend auf den Tastatur- und Mausbewegungen
void updateCamera(float deltaTime) {
// Interpoliere die Kameraposition basierend auf der aktuellen Geschwindigkeit und der Zeitdifferenz
Point3D viewerPosition = {
cameraPosition.x + cameraVelocity.x * deltaTime,
cameraPosition.y + cameraVelocity.y * deltaTime,
cameraPosition.z + cameraVelocity.z * deltaTime
};

// Interpoliere die Kamera-Ausrichtung basierend auf der aktuellen Winkelgeschwindigkeit und der Zeitdifferenz
Point2D viewerAngle = {
cameraAngleX + cameraAngularVelocity.x * deltaTime,
cameraAngleY + cameraAngularVelocity.y * deltaTime
};

// Ermittle die Kameradrehmatrix basierend auf den aktuellen Drehwinkeln
float rotationMatrix[9];
getRotationMatrix(viewerMatrix, viewerAngle.x, viewerAngle.y, 0, rotationMatrix);

// Aktualisiere die Kameraposition und -ausrichtung mit den neu berechneten Werten
cameraPosition = viewerPosition;
cameraAngleX = viewerAngle.x;
cameraAngleY = viewerAngle.y;
memcpy(viewerMatrix, rotationMatrix, sizeof(float) * 9);
}


int main(int argc, char* args[]) {
if (init() != 0) {
return -1;
}

// Matrix zur Transformation von 3D-Koordinaten in 2D-Koordinaten
float transformationMatrix[16] = {
1, 0, 0, 0,
0, 1, 0, 0,
0, 0, 1, 0,
0, 0, 1, 0
};

/*
// Hauptschleife des Programms
int running = 1;
SDL_Event e;
while (running) {
// Verarbeite Events
while (SDL_PollEvent(&e) != 0) {
if (e.type == SDL_QUIT) {
running = 0;
} else if (e.type == SDL_MOUSEMOTION) {
// Bewege die Kamera mit der Maus
cameraAngleX += e.motion.xrel * cameraSpeed;
cameraAngleY += e.motion.yrel * cameraSpeed;
}
}

// Lösche den Hintergrund
SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0x00, 0xFF);
SDL_RenderClear(renderer);

// Transformationsmatrix für die Kameraposition und -ausrichtung
float cameraMatrix[16] = {
cos(cameraAngleY), 0, sin(cameraAngleY), 0,
sin(cameraAngleX) * sin(cameraAngleY), cos(cameraAngleX), -sin(cameraAngleX) * cos(cameraAngleY), 0,
-cos(cameraAngleX) * sin(cameraAngleY), sin(cameraAngleX), cos(cameraAngleX) * cos(cameraAngleY), -cameraDistance,
0, 0, 0, 1
};

SDL_SetRenderDrawColor(renderer, 255, 255, 255, 0xFF);
// Zeichne den Würfel
drawCube(renderer, (Point3D) {CUBE_X, CUBE_Y, CUBE_Z}, cameraMatrix, M_PI / 4.0f);

// Zeige gezeichnetes Bild an
SDL_RenderPresent(renderer);
}
*/
// Hauptprogrammschleife
int running = 1;
SDL_Event e;
double lastUpdate; 
while (running) {
// Ermittle die aktuelle Zeit und die Zeitdifferenz zur letzten Schleifeniteration
double currentTime = SDL_GetTicks() / 1000.0;
double deltaTime = currentTime - lastUpdate;
lastUpdate = currentTime;

// Verarbeite alle ausstehenden Ereignisse
SDL_Event event;
while (SDL_PollEvent(&event)) {
switch (event.type) {
case SDL_QUIT:
running = 0;
break;
case SDL_KEYDOWN:
moveCamera(event);
break;
case SDL_MOUSEBUTTONDOWN:
case SDL_MOUSEBUTTONUP:
case SDL_MOUSEMOTION:
moveCameraMouse(event);
break;
}
}

// Aktualisiere die Kameraposition und -ausrichtung basierend auf den Tastatur- und Mausbewegungen
updateCamera(deltaTime);

// Zeichne den Würfel mit der aktualisierten Kameraposition und -ausrichtung
SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
SDL_RenderClear(renderer);
drawCube(renderer, cameraPosition, viewerMatrix);
SDL_RenderPresent(renderer);
}


// Aufräumarbeiten
SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}
