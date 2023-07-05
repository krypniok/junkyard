/*
gcc -o shaped_sprite shaped_sprite.c -lSDL2 -lSDL2_gfx
*/


#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include <stdbool.h>
#include <SDL2/SDL_gfxPrimitives.h>

#define SHAPED_WINDOW_X 150
#define SHAPED_WINDOW_Y 150
#define SHAPED_WINDOW_DIMENSION 640

typedef struct LoadedPicture {
    SDL_Surface* surface;
    SDL_Texture* texture;
    SDL_Window* window;
    const char* name;
    float angle;
} LoadedPicture;

void render(SDL_Renderer* renderer, SDL_Texture* texture, SDL_Rect texture_dimensions)
{
    /* Clear render-target to blue. */
    SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0xff, 0xff);
    SDL_RenderClear(renderer);

    /* Render the texture. */
    SDL_RenderCopy(renderer, texture, &texture_dimensions, &texture_dimensions);

    SDL_RenderPresent(renderer);
}

int main(int argc, char** argv)
{
    Uint8 num_pictures;
    LoadedPicture* pictures;
    int i, j;
    SDL_Renderer* renderer;
    SDL_Event event;
    int should_exit = 0;
    unsigned int current_picture;
    int button_down;
    SDL_Rect texture_dimensions;

    /* Enable standard application logging */
    SDL_LogSetPriority(SDL_LOG_CATEGORY_APPLICATION, SDL_LOG_PRIORITY_INFO);

    if (argc < 2) {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "SDL_Shape requires at least one bitmap file as an argument.");
        exit(-1);
    }

    if (SDL_VideoInit(NULL) == -1) {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not initialize SDL video.");
        exit(-2);
    }

    num_pictures = argc - 1;
    pictures = (LoadedPicture*)SDL_malloc(sizeof(LoadedPicture) * num_pictures);
    if (!pictures) {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not allocate memory.");
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
            SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not load surface from the named bitmap file: %s", argv[i + 1]);
            exit(-3);
        }

        pictures[i].window = SDL_CreateShapedWindow(pictures[i].name,
            SHAPED_WINDOW_X, SHAPED_WINDOW_Y,
            pictures[i].surface->w, pictures[i].surface->h,
            SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
        SDL_SetWindowPosition(pictures[i].window, SHAPED_WINDOW_X, SHAPED_WINDOW_Y);

        SDL_RendererInfo renderer_info;
        SDL_GetRendererInfo(SDL_CreateRenderer(pictures[i].window, -1, SDL_RENDERER_ACCELERATED), &renderer_info);
        if (renderer_info.flags & SDL_RENDERER_ACCELERATED)
            renderer = SDL_CreateRenderer(pictures[i].window, -1, SDL_RENDERER_ACCELERATED);
        else
            renderer = SDL_CreateRenderer(pictures[i].window, -1, SDL_RENDERER_SOFTWARE);

        if (!renderer) {
            SDL_DestroyWindow(pictures[i].window);
            for (j = 0; j < num_pictures; j++)
                SDL_FreeSurface(pictures[j].surface);
            SDL_free(pictures);
            SDL_VideoQuit();
            SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not create a rendering context for the SDL_Shape window.");
            exit(-4);
        }

        pictures[i].texture = SDL_CreateTextureFromSurface(renderer, pictures[i].surface);
        if (pictures[i].texture == NULL) {
            SDL_DestroyTexture(pictures[i].texture);
            SDL_DestroyRenderer(renderer);
            SDL_DestroyWindow(pictures[i].window);
            for (j = 0; j < num_pictures; j++)
                SDL_FreeSurface(pictures[j].surface);
            SDL_free(pictures);
            SDL_VideoQuit();
            SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not create a texture for SDL_shape.");
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
    SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Changing to shaped bmp: %s", pictures[current_picture].name);
    SDL_QueryTexture(pictures[current_picture].texture, NULL, NULL, &texture_dimensions.w, &texture_dimensions.h);
    SDL_SetWindowSize(pictures[current_picture].window, texture_dimensions.w, texture_dimensions.h);

    while (should_exit == 0) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_KEYDOWN) {
                button_down = 1;
                if (event.key.keysym.sym == SDLK_ESCAPE) {
                    should_exit = 1;
                    break;
                }
            }
            if (button_down && event.type == SDL_KEYUP) {
                button_down = 0;
                current_picture += 1;
                if (current_picture >= num_pictures)
                    current_picture = 0;
                SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Changing to shaped bmp: %s", pictures[current_picture].name);
                SDL_QueryTexture(pictures[current_picture].texture, NULL, NULL, &texture_dimensions.w, &texture_dimensions.h);
                SDL_SetWindowSize(pictures[current_picture].window, texture_dimensions.w, texture_dimensions.h);
            }
            if (event.type == SDL_QUIT) {
                should_exit = 1;
                break;
            }
        }

        SDL_RenderClear(renderer);
        SDL_RenderCopyEx(renderer, pictures[current_picture].texture, NULL, NULL, pictures[current_picture].angle, NULL, SDL_FLIP_NONE);
        SDL_RenderPresent(renderer);

        SDL_Delay(10);
    }

    /* Free the textures. */
    for (i = 0; i < num_pictures; i++)
        SDL_DestroyTexture(pictures[i].texture);
    /* Destroy the windows. */
    for (i = 0; i < num_pictures; i++)
        SDL_DestroyWindow(pictures[i].window);
    /* Free the original surfaces backing the textures. */
    for (i = 0; i < num_pictures; i++)
        SDL_FreeSurface(pictures[i].surface);
    SDL_free(pictures);
    /* Call SDL_VideoQuit() before quitting. */
    SDL_VideoQuit();

    return 0;
}
