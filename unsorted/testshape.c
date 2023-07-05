
/*
  Copyright (C) 1997-2021 Sam Lantinga <slouken@libsdl.org>
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely.
*/


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


void render(SDL_Renderer *renderer,SDL_Texture *texture,SDL_Rect texture_dimensions, float angle)
{
    /* Clear render-target to blue. */
    SDL_SetRenderDrawColor(renderer,0x00,0x00,0xff,0xff);
    SDL_RenderClear(renderer);

    SDL_Point center = {64, 64};
    /* Render the texture. */
    SDL_RenderCopyEx(renderer,texture,&texture_dimensions,&texture_dimensions, angle, &center, false);

    SDL_RenderPresent(renderer);
}




int main(int argc,char** argv)
{
    Uint8 num_pictures;
    LoadedPicture* pictures;
    int i, j;
    SDL_PixelFormat* format = NULL;
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Color black = {0,0,0,0xff};
    SDL_Event event;
    int should_exit = 0;
    unsigned int current_picture;
    int button_down;
    Uint32 pixelFormat = 0;
    int access = 0;
    SDL_Rect texture_dimensions;
    float x=0, y=0, xv=0.61, yv=0.49, a=0, av=3, s=10;

    /* Enable standard application logging */
    //SDL_LogSetPriority(SDL_LOG_CATEGORY_APPLICATION, SDL_LOG_PRIORITY_INFO);

    if(argc < 2) {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "SDL_Shape requires at least one bitmap file as argument.");
        exit(-1);
    }

    if(SDL_VideoInit(NULL) == -1) {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not initialize SDL video.");
        exit(-2);
    }

    num_pictures = argc - 1;
    pictures = (LoadedPicture *)SDL_malloc(sizeof(LoadedPicture)*num_pictures);
    if (!pictures) {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not allocate memory.");
        exit(1);
    }
    for(i=0;i<num_pictures;i++)
        pictures[i].surface = NULL;
    for(i=0;i<num_pictures;i++) {
        pictures[i].surface = SDL_LoadBMP(argv[i+1]);
        pictures[i].name = argv[i+1];
        if(pictures[i].surface == NULL) {
            for(j=0;j<num_pictures;j++)
                SDL_FreeSurface(pictures[j].surface);
            SDL_free(pictures);
            SDL_VideoQuit();
            SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not load surface from named bitmap file: %s", argv[i+1]);
            exit(-3);
        }

        format = pictures[i].surface->format;
        if(SDL_ISPIXELFORMAT_ALPHA(format->format)) {
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
        SHAPED_WINDOW_DIMENSION,SHAPED_WINDOW_DIMENSION,
        0);
    

    if(window == NULL) {
        for(i=0;i<num_pictures;i++)
            SDL_FreeSurface(pictures[i].surface);
        SDL_free(pictures);
        SDL_VideoQuit();
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not create shaped window for SDL_Shape.");
        exit(-4);
    }
    renderer = SDL_CreateRenderer(window,-1,0);
    if (!renderer) {
        SDL_DestroyWindow(window);
        for(i=0;i<num_pictures;i++)
            SDL_FreeSurface(pictures[i].surface);
        SDL_free(pictures);
        SDL_VideoQuit();
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not create rendering context for SDL_Shape window.");
        exit(-5);
    }

    for(i=0;i<num_pictures;i++)
        pictures[i].texture = NULL;
    for(i=0;i<num_pictures;i++) {
        pictures[i].texture = SDL_CreateTextureFromSurface(renderer,pictures[i].surface);
        if(pictures[i].texture == NULL) {
            for(i=0;i<num_pictures;i++)
                if(pictures[i].texture != NULL)
                    SDL_DestroyTexture(pictures[i].texture);
            for(i=0;i<num_pictures;i++)
                SDL_FreeSurface(pictures[i].surface);
            SDL_free(pictures);
            SDL_DestroyRenderer(renderer);
            SDL_DestroyWindow(window);
            SDL_VideoQuit();
            SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Could not create texture for SDL_shape.");
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
  //  SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Changing to shaped bmp: %s", pictures[current_picture].name);
    SDL_QueryTexture(pictures[current_picture].texture,(Uint32 *)&pixelFormat,(int *)&access,&texture_dimensions.w,&texture_dimensions.h);
    SDL_SetWindowSize(window,texture_dimensions.w,texture_dimensions.h);
    SDL_SetWindowShape(window,pictures[current_picture].surface,&pictures[current_picture].mode);
    while(should_exit == 0) {
        while (SDL_PollEvent(&event)) {
            if(event.type == SDL_KEYDOWN) {
                button_down = 1;
                if(event.key.keysym.sym == SDLK_ESCAPE) {
                    should_exit = 1;
                    break;
                }
                if(event.key.keysym.sym == SDLK_SPACE) {
                    xv += 1/(1+rand() % 16);
                    yv += 1/(1+rand() % 16);
                    break;
                }
            }
            if(button_down && event.type == SDL_KEYUP) {
                button_down = 0;
                current_picture += 1;
                if(current_picture >= num_pictures)
                    current_picture = 0;
               // SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Changing to shaped bmp: %s", pictures[current_picture].name);
                SDL_QueryTexture(pictures[current_picture].texture,(Uint32 *)&pixelFormat,(int *)&access,&texture_dimensions.w,&texture_dimensions.h);
                SDL_HideWindow(window);
                SDL_SetWindowPosition(window, x, y);
                SDL_SetWindowSize(window,texture_dimensions.w,texture_dimensions.h);
                //SDL_SetWindowAlwaysOnTop()
                SDL_SetWindowShape(window,pictures[current_picture].surface,&pictures[current_picture].mode);
                SDL_ShowWindow(window);
                break;
            }
            if (event.type == SDL_QUIT) {
                should_exit = 1;
                break;
            }
        }

        x += xv * s; y += yv * s;
        a += av * s;
        if(x > 1920-128 || x < 0) { xv = -xv; av+=3; }
        if(y > 1080-128 || y < 0) { yv = -yv; av+=3; }
        av *= 0.975f;
        xv *= 0.975f;
        yv *= 0.975f;

        //if(y < 1080-128) y += yv;

        SDL_SetWindowPosition(window, x, y);

        render(renderer,pictures[current_picture].texture,texture_dimensions, a);
        SDL_Delay(20);
    }

    /* Free the textures. */
    for(i=0;i<num_pictures;i++)
        SDL_DestroyTexture(pictures[i].texture);
    SDL_DestroyRenderer(renderer);
    /* Destroy the window. */
    SDL_DestroyWindow(window);
    /* Free the original surfaces backing the textures. */
    for(i=0;i<num_pictures;i++)
        SDL_FreeSurface(pictures[i].surface);
    SDL_free(pictures);
    /* Call SDL_VideoQuit() before quitting. */
    SDL_VideoQuit();

    return 0;
}

