/*
Hier ist ein Beispielcode basierend auf dem vorherigen Code, der ein Pixelfeld anzeigt, das mit zufälligen Farben (rot / grün / blau) gefüllt ist und einen roten Pixel darstellt, der in zufälligen Richtungen bewegt wird und Nahrung in Form von rot (fleisch), grün (Gras) oder blau (Wasser) konsumiert.
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600

typedef enum {
FLEISCH = 0,
GRAS,
WASSER,
BRAUN
} ZellTyp;

typedef struct {
ZellTyp typ;
int farbe[3];
} Zelle;

typedef struct {
int farbe[3];
int xpos;
int ypos;
int rot_counter;
int gruen_counter;
float blau_counter;
} Tamagotchi;

int random_zahl(int min, int max) {
return rand() % (max - min + 1) + min;
}

void initialisiere_spiel(Zelle spiel_feld[SCREEN_WIDTH][SCREEN_HEIGHT], Tamagotchi* tamagotchi) {
srand(time(NULL));
for (int i = 0; i < SCREEN_WIDTH; ++i) {
for (int j = 0; j < SCREEN_HEIGHT; ++j) {
spiel_feld[i][j].typ = random_zahl(0, 2);
spiel_feld[i][j].farbe[0] = spiel_feld[i][j].typ == FLEISCH ? 255 : 0;
spiel_feld[i][j].farbe[1] = spiel_feld[i][j].typ == GRAS ? 255 : 0;
spiel_feld[i][j].farbe[2] = spiel_feld[i][j].typ == WASSER ? 255 : 0;
}
}
tamagotchi->farbe[0] = 255;
tamagotchi->farbe[1] = 0;
tamagotchi->farbe[2] = 0;
tamagotchi->xpos = random_zahl(0, SCREEN_WIDTH - 1);
tamagotchi->ypos = random_zahl(0, SCREEN_HEIGHT - 1);
tamagotchi->rot_counter = 0;
tamagotchi->gruen_counter = 0;
tamagotchi->blau_counter = 100.0f;
}

void aktualisiere_tamagotchi(Tamagotchi* tamagotchi, Zelle spiel_feld[SCREEN_WIDTH][SCREEN_HEIGHT]) {

while(spiel_feld[tamagotchi->xpos][tamagotchi->ypos].typ == BRAUN) {

int richtung = random_zahl(0, 3);
switch (richtung) {
case 0:
tamagotchi->xpos--;
break;
case 1:
tamagotchi->xpos++;
break;
case 2:
tamagotchi->ypos--;
break;
case 3:
tamagotchi->ypos++;
break;
}

}

tamagotchi->farbe[0] += spiel_feld[tamagotchi->xpos][tamagotchi->ypos].typ == FLEISCH ? 1 : 0;
tamagotchi->farbe[1] += spiel_feld[tamagotchi->xpos][tamagotchi->ypos].typ == GRAS ? 1 : 0;
tamagotchi->farbe[2] += spiel_feld[tamagotchi->xpos][tamagotchi->ypos].typ == WASSER ? 1 : 0;

tamagotchi->rot_counter += spiel_feld[tamagotchi->xpos][tamagotchi->ypos].typ == FLEISCH ? 1 : 0;
tamagotchi->gruen_counter += spiel_feld[tamagotchi->xpos][tamagotchi->ypos].typ == GRAS ? 1 : 0;
tamagotchi->blau_counter -= 0.01f;

spiel_feld[tamagotchi->xpos][tamagotchi->ypos].typ = BRAUN;
spiel_feld[tamagotchi->xpos][tamagotchi->ypos].farbe[0] = 0;;
spiel_feld[tamagotchi->xpos][tamagotchi->ypos].farbe[1] = 0;;
spiel_feld[tamagotchi->xpos][tamagotchi->ypos].farbe[2] = 0;;


if (tamagotchi->blau_counter < 0) {
tamagotchi->blau_counter = 0;
}
}

void zeichne_spiel(SDL_Renderer* renderer, Zelle spiel_feld[SCREEN_WIDTH][SCREEN_HEIGHT], Tamagotchi* tamagotchi) {
for (int i = 0; i < SCREEN_WIDTH; ++i) {
for (int j = 0; j < SCREEN_HEIGHT; ++j) {
SDL_SetRenderDrawColor(renderer, spiel_feld[i][j].farbe[0], spiel_feld[i][j].farbe[1], spiel_feld[i][j].farbe[2], 255);
SDL_RenderDrawPoint(renderer, i, j);

}
}


//SDL_SetRenderDrawColor(renderer, tamagotchi->farbe[0], tamagotchi->farbe[1], tamagotchi->farbe[2], 255);
SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
SDL_RenderDrawPoint(renderer, tamagotchi->xpos, tamagotchi->ypos);
}

int main(int argc, char* args[]) {
SDL_Window* fenster = NULL;
SDL_Renderer* renderer = NULL;
Zelle spiel_feld[SCREEN_WIDTH][SCREEN_HEIGHT];
Tamagotchi tamagotchi;
int quit = 0;

if (SDL_Init(SDL_INIT_VIDEO) < 0) {
return 1;
}

fenster = SDL_CreateWindow("Tamagotchi", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN); //| SDL_WINDOW_FULLSCREEN);
if (fenster == NULL) {
return 1;
}

renderer = SDL_CreateRenderer(fenster, -1, 0);
if (renderer == NULL) {
SDL_DestroyWindow(fenster);
return 1;
}

initialisiere_spiel(spiel_feld, &tamagotchi);

while (!quit) {
SDL_Event e;
while (SDL_PollEvent(&e)) {
if (e.type == SDL_QUIT) {
quit = 1;
}
}

aktualisiere_tamagotchi(&tamagotchi, spiel_feld);

SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);

zeichne_spiel(renderer, spiel_feld, &tamagotchi);

SDL_RenderPresent(renderer);

SDL_Delay(0);
}

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(fenster);
SDL_Quit();
return 0;
}

/*

Dieser Code initialisiert das Spiel und füllt das Spielfeld im Fenster mit Farben. Der Tamagotchi wird mit zufälligen Farben und einer zufälligen Position initialisiert. Jedes Mal, wenn das Spiel aktualisiert wird, bewegt sich der Tamagotchi in eine zufällige Richtung und konsumiert Nahrung, basierend auf der Zelle, auf die er gestoßen ist. Die Zähler der Farben werden aktualisiert, und der Blauzähler wird jedes Mal um 0,01% verringert. Wenn der Blauzähler null erreicht, stirbt der Tamagotchi.

Die `initialisiere_spiel`-Funktion erstellt eine zufällige Farbkombination für jede Zelle im Feld, basierend auf ihrem Zelltyp (`typ`). Die Funktion initialisiert auch den Tamagotchi mit einer zufälligen Farbkombination und einer zufälligen Startposition

Die `aktualisiere_tamagotchi`-Funktion bewegt den Tamagotchi in eine zufällige Richtung und aktualisiert die Farbzähler entsprechend der Zelle, über die der Tamagotchi hinweggegangen ist. Die Funktion aktualisiert auch den Blauzähler, indem er jedes Mal um 0,01% reduziert wird.

Die `zeichne_spiel`-Funktion zeichnet das Spielfeld und den Tamagotchi auf dem Renderer.

Diese Beispielcode ist sehr einfach gehalten und kann erweitert werden, um mehr Funktionen hinzuzufügen, wie z.B. weitere Nahrungstypen, Fortpflanzung und Alterung des Tamagotchis. Aber hoffentlich hilft es dir, einen Einstieg in die Entwicklung deines Tamagotchi-Pixel-Simulationsspiels zu finden.
*/