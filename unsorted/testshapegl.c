#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include <stdbool.h>

#include <SDL2/SDL_shape.h>

#define SHAPED_WINDOW_X 0
#define SHAPED_WINDOW_Y 0
#define SHAPED_WINDOW_DIMENSION 0

typedef struct LoadedPicture {
    SDL_Surface *surface;
    SDL_Texture *texture;
    SDL_WindowShapeMode mode;
    const char* name;
} LoadedPicture;


void render(SDL_Texture *texture, SDL_Rect texture_dimensions, float angle)
{
    glClear(GL_COLOR_BUFFER_BIT);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glTranslatef(texture_dimensions.w / 2, texture_dimensions.h / 2, 0.0);
    glRotatef(angle, 0.0, 0.0, 1.0);
    glTranslatef(-texture_dimensions.w / 2, -texture_dimensions.h / 2, 0.0);

    glBindTexture(GL_TEXTURE_2D, (GLuint)texture);

    glBegin(GL_QUADS);
    glTexCoord2f(0, 0); glVertex2f(0, 0);
    glTexCoord2f(1, 0); glVertex2f(texture_dimensions.w, 0);
    glTexCoord2f(1, 1); glVertex2f(texture_dimensions.w, texture_dimensions.h);
    glTexCoord2f(0, 1); glVertex2f(0, texture_dimensions.h);
    glEnd();

    glFlush();
}


int main(int argc, char** argv)
{
    Uint8 num_pictures;
    LoadedPicture* pictures;
    int i, j;
    SDL_PixelFormat* format = NULL;
    SDL_Window *window;
    SDL_GLContext glContext;
    SDL_Color black = {0,0,0,0xff};
    SDL_Event event;
    int should_exit = 0;
    unsigned int current_picture;
    int button_down;
    Uint32 pixelFormat = 0;
    int access = 0;
    SDL_Rect texture_dimensions;
    float x = 0, y = 0, xv = 0.61, yv = 0.49, a = 0, av = 3, s = 10;

    if (argc < 2) {
        printf("SDL_Shape requires at least one bitmap file as argument.\n");
        exit(-1);
    }

    if (SDL_VideoInit(NULL) == -1) {
        printf("Could not initialize SDL video.\n");
        exit(-2);
    }

    num_pictures = argc - 1;
    pictures = (LoadedPicture *)SDL_malloc(sizeof(LoadedPicture) * num_pictures);
    if (!pictures) {
        printf("Could not allocate memory.\n");
        exit(1);
    }
    for (i = 0; i < num_pictures; i++)
        pictures[i].surface = NULL;
    for (i = 0; i < num_pictures; i++) {
        pictures[i].surface = SDL_LoadBMP(argv[i + 1]);
        pictures[i].name = argv[i + 1];
        if (pictures[i].surface == NULL) {
            for (j = 0; j < num_pictures; j++)
                SDL_FreeSurface(pictures[j].surface);
            SDL_free(pictures);
            SDL_VideoQuit();
            printf("Could not load surface from named bitmap file: %s\n", argv[i + 1]);
            exit(-3);
        }

        format = pictures[i].surface->format;
        if (SDL_ISPIXELFORMAT_ALPHA(format->format)) {
            pictures[i].mode.mode = ShapeModeBinarizeAlpha;
            pictures[i].mode.parameters.binarizationCutoff = 255;
        }
        else {
            pictures[i].mode.mode = ShapeModeColorKey;
            pictures[i].mode.parameters.colorKey = black;
        }
    }

    window = SDL_CreateShapedWindow("SDL_Shape test",
        SHAPED_WINDOW_X, SHAPED_WINDOW_Y,
        SHAPED_WINDOW_DIMENSION, SHAPED_WINDOW_DIMENSION,
        SDL_WINDOW_OPENGL);

    if (window == NULL) {
        for (i = 0; i < num_pictures; i++)
            SDL_FreeSurface(pictures[i].surface);
        SDL_free(pictures);
        SDL_VideoQuit();
        printf("Could not create shaped window for SDL_Shape.\n");
        exit(-4);
    }

    glContext = SDL_GL_CreateContext(window);
    if (!glContext) {
        SDL_DestroyWindow(window);
        for (i = 0; i < num_pictures; i++)
            SDL_FreeSurface(pictures[i].surface);
        SDL_free(pictures);
        SDL_VideoQuit();
        printf("Could not create OpenGL context for SDL_Shape window.\n");
        exit(-5);
    }

    for (i = 0; i < num_pictures; i++)
        pictures[i].texture = NULL;
    for (i = 0; i < num_pictures; i++) {
        pictures[i].texture = (SDL_Texture*)SDL_CreateTextureFromSurface(NULL, pictures[i].surface);
        if (pictures[i].texture == NULL) {
            for (i = 0; i < num_pictures; i++)
                if (pictures[i].texture != NULL)
                    SDL_DestroyTexture((GLuint)pictures[i].texture);
            for (i = 0; i < num_pictures; i++)
                SDL_FreeSurface(pictures[i].surface);
            SDL_free(pictures);
            SDL_GL_DeleteContext(glContext);
            SDL_DestroyWindow(window);
            SDL_VideoQuit();
            printf("Could not create texture for SDL_shape.\n");
            exit(-6);
        }
    }

    should_exit = 0;
    current_picture = 0;
    button_down = 0;
    texture_dimensions.h = 0;
    texture_dimensions.w = 0;
    texture_dimensions.x = 0;
    texture_dimensions.y = 0;

    SDL_QueryTexture(pictures[current_picture].texture, &pixelFormat, &access, &texture_dimensions.w, &texture_dimensions.h);
    SDL_SetWindowSize(window, texture_dimensions.w, texture_dimensions.h);
    SDL_SetWindowShape(window, pictures[current_picture].surface, &pictures[current_picture].mode);

    while (should_exit == 0) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_KEYDOWN) {
                button_down = 1;
                if (event.key.keysym.sym == SDLK_ESCAPE) {
                    should_exit = 1;
                    break;
                }
                if (event.key.keysym.sym == SDLK_SPACE) {
                    xv += 1 / (1 + rand() % 16);
                    yv += 1 / (1 + rand() % 16);
                    break;
                }
            }
            if (button_down && event.type == SDL_KEYUP) {
                button_down = 0;
                current_picture += 1;
                if (current_picture >= num_pictures)
                    current_picture = 0;

                SDL_QueryTexture(pictures[current_picture].texture, &pixelFormat, &access, &texture_dimensions.w, &texture_dimensions.h);
                SDL_SetWindowSize(window, texture_dimensions.w, texture_dimensions.h);
                SDL_SetWindowShape(window, pictures[current_picture].surface, &pictures[current_picture].mode);

                break;
            }
            if (event.type == SDL_QUIT) {
                should_exit = 1;
                break;
            }
        }
        x += xv;
        y += yv;
        a += av;
        if (x < 0) {
            x = 0;
            xv = -xv;
        }
        if (y < 0) {
            y = 0;
            yv = -yv;
        }
        if (x > texture_dimensions.w - s) {
            x = texture_dimensions.w - s;
            xv = -xv;
        }
        if (y > texture_dimensions.h - s) {
            y = texture_dimensions.h - s;
            yv = -yv;
        }
        if (a < 0) {
            a = 0;
            av = -av;
        }
        if (a > 360) {
            a = 360;
            av = -av;
        }

        glViewport(0, 0, texture_dimensions.w, texture_dimensions.h);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, texture_dimensions.w, texture_dimensions.h, 0);
        glClearColor(0, 0, 0, 0);

        render(pictures[current_picture].texture, texture_dimensions, a);

        SDL_GL_SwapWindow(window);
    }

    for (i = 0; i < num_pictures; i++)
        if (pictures[i].texture != NULL)
            SDL_DestroyTexture((GLuint)pictures[i].texture);
    for (i = 0; i < num_pictures; i++)
        SDL_FreeSurface(pictures[i].surface);
    SDL_free(pictures);
    SDL_GL_DeleteContext(glContext);
    SDL_DestroyWindow(window);
    SDL_VideoQuit();

    return 0;
}
