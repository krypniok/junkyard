#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600



void fun(int a)
{
    printf("Value of a is %d\n", a);
}

typedef struct {
    void (*construct)(int);
    void (*destruct)(int);


uint32_t g_WindowFlags;
int32_t g_Running;
int32_t g_Fullscreen;
SDL_Window *window;
SDL_GLContext context;
char g_WindowTitle[255];
} app_t;

app_t* g_pApp = NULL;
app_t* g_pApp2 = NULL;

#define CREATE_APP(p) \
    p = malloc(sizeof(app_t)); \
    p->g_WindowFlags = SDL_WINDOW_OPENGL | SDL_WINDOW_BORDERLESS; \
    p->g_Running = 1; \
    p->g_Fullscreen = 1; \
    sprintf(&g_pApp->g_WindowTitle[0], "Version #%i", 1); \
    p->window = SDL_CreateWindow(&g_pApp->g_WindowTitle[0], 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, g_pApp->g_WindowFlags); \
    assert(p->window); \
    p->context = SDL_GL_CreateContext(p->window); \
\

#define DESTROY_APP(p) \
    SDL_GL_DeleteContext(p->context); \
    SDL_DestroyWindow(p->window); \
    SDL_Quit(); \
    free(p); \
\

#define LOOP_APP(p) \
    \
\

void drawgrid() {
// Gittermuster zeichnen
glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
glClear(GL_COLOR_BUFFER_BIT);

glViewport(0, 0, 640, 480);

glMatrixMode(GL_PROJECTION);
glLoadIdentity();
glOrtho(0.0, 640.0, 480.0, 0.0, 1.0, -1.0);

glMatrixMode(GL_MODELVIEW);
glLoadIdentity();

glBegin(GL_LINES);

for (int i = 0; i < 640; i += 10) {
glVertex2i(i, 0);
glVertex2i(i, 480);
}

for (int j = 0; j < 480; j += 10) {
glVertex2i(0, j);
glVertex2i(640, j);
}

glEnd();
}


int main(int argc, char **argv)
{
    CREATE_APP(g_pApp);

   // CREATE_APP(g_pApp2);

    //ADD_APP_HANDLER()

    // handle event -> mouse | keyboard
    // loop -> logic | draw



    while (g_pApp->g_Running)
    {
        SDL_Event event;
        while (SDL_PollEvent(&event))
        {
            if (event.type == SDL_KEYDOWN)
            {
                switch (event.key.keysym.sym)
                {
                case SDLK_ESCAPE:
                    g_pApp->g_Running = 0;
                    break;
                case 'f':
                    g_pApp->g_Fullscreen = !g_pApp->g_Fullscreen;
                    if (g_pApp->g_Fullscreen)
                    {
                        SDL_SetWindowFullscreen(g_pApp->window, g_pApp->g_WindowFlags | SDL_WINDOW_FULLSCREEN_DESKTOP);
                    }
                    else
                    {
                        SDL_SetWindowFullscreen(g_pApp->window, g_pApp->g_WindowFlags);
                    }
                    break;
                default:
                    break;
                }
            }
            else if (event.type == SDL_QUIT)
            {
                g_pApp->g_Running = 0;
            }
        }


        drawgrid();
        SDL_GL_SwapWindow(g_pApp->window);
    }



return 0;
}
