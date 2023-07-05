#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include <stdbool.h>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;
const double CAMERA_SPEED = 0.1;

SDL_Window* gWindow = NULL;
SDL_GLContext gContext;

void init()
{
SDL_Init(SDL_INIT_VIDEO);
SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);
gWindow = SDL_CreateWindow("Isometric Grid with Camera", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL);
gContext = SDL_GL_CreateContext(gWindow);
glMatrixMode(GL_PROJECTION);
glLoadIdentity();
glOrtho(0.0, SCREEN_WIDTH, SCREEN_HEIGHT, 0.0, 1.0, -1.0);
glMatrixMode(GL_MODELVIEW);
glLoadIdentity();
gluLookAt(10.0f, 10.0f, 10.0f, // Kameraposition (x, y, z)
0.0f, 0.0f, 0.0f, // Zielpunkt, auf den die Kamera gerichtet wird (x, y, z)
0.0f, 1.0f, 0.0f); // Vektor, der die Ausrichtung der Kamera definiert (x, y, z)
//glEnable(GL_DEPTH_TEST);
//glClearDepth(1.0);
}

void quit()
{
SDL_GL_DeleteContext(gContext);
SDL_DestroyWindow(gWindow);
SDL_Quit();
}

void drawGrid() {
glColor3f(0.5, 0.5, 0.5); // set color of grid lines

glBegin(GL_LINES);
// draw vertical lines of grid
for (int i = -50; i <= 50; i++) {
glVertex3f((float)i, -50.0f, 0.0f);
glVertex3f((float)i, 50.0f, 0.0f);
}
// draw horizontal lines of grid
for (int i = -50; i <= 50; i++) {
glVertex3f(-50.0f, (float)i, 0.0f);
glVertex3f(50.0f, (float)i, 0.0f);
}
glEnd();
}

void display() {
glClear(GL_COLOR_BUFFER_BIT);

glMatrixMode(GL_MODELVIEW);
glLoadIdentity();
gluLookAt(20, 20, 20, 0, 0, 0, 0, 0, 1); // set camera position and direction

drawGrid();

}

void reshape(int w, int h) {
glViewport(0, 0, w, h);

glMatrixMode(GL_PROJECTION);
glLoadIdentity();
glOrtho(-50, 50, -50, 50, -50, 50); // set the projection matrix to isometric

glMatrixMode(GL_MODELVIEW);
}


void handleInput()
{
const Uint8* keys = SDL_GetKeyboardState(NULL);
if (keys[SDL_SCANCODE_LEFT])
{
glTranslatef(-CAMERA_SPEED, 0.0, 0.0);
}
if (keys[SDL_SCANCODE_RIGHT])
{
glTranslatef(CAMERA_SPEED, 0.0, 0.0);
}
if (keys[SDL_SCANCODE_UP])
{
glTranslatef(0.0, -CAMERA_SPEED, 0.0);
}
if (keys[SDL_SCANCODE_DOWN])
{
glTranslatef(0.0, CAMERA_SPEED, 0.0);
}
}


int main(int argc, char* argv[])
{
init();

bool quitFlag = false;
while (!quitFlag)
{
SDL_Event e;
while (SDL_PollEvent(&e))
{
if (e.type == SDL_QUIT)
{
quitFlag = true;
}
}

handleInput();
display();
SDL_GL_SwapWindow(gWindow);
}

quit();

return 0;
}
