

#include <SDL2/SDL.h>

// Constants for window size
const int WINDOW_WIDTH = 800;
const int WINDOW_HEIGHT = 600;

// Function to load an image as an SDL_Surface
SDL_Surface* loadSurface(const char* imagePath) {
    SDL_Surface* surface = SDL_LoadBMP(imagePath);
    return surface;
}

int main() {
    // Initialize SDL
    SDL_Init(SDL_INIT_VIDEO);

    // Create a window
    SDL_Window* window = SDL_CreateWindow("Custom Shaped Window", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);

    // Load the sprite image as an SDL_Surface
    SDL_Surface* spriteSurface = loadSurface("shuttle.bmp");

    // Create an alpha mask from the sprite surface
    Uint32 colorKey = SDL_MapRGB(spriteSurface->format, 0, 0, 0); // Assuming black is the transparent color
    SDL_SetColorKey(spriteSurface, SDL_TRUE, colorKey);
    SDL_Surface* alphaMask = SDL_CreateRGBSurface(0, spriteSurface->w, spriteSurface->h, 32, 0, 0, 0, 0xFF);
    SDL_BlitSurface(spriteSurface, NULL, alphaMask, NULL);

    // Set the shape of the window based on the alpha mask
    SDL_SetWindowShape(window, alphaMask, NULL);

    // Create a renderer
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, 0);

    // Convert the sprite surface to a texture
    SDL_Texture* spriteTexture = SDL_CreateTextureFromSurface(renderer, spriteSurface);

    // Set the sprite initial position
    int spriteX = (WINDOW_WIDTH - spriteSurface->w) / 2;
    int spriteY = (WINDOW_HEIGHT - spriteSurface->h) / 2;

    // Create an SDL event
    SDL_Event event;

    // Animation loop
    int running = 1;
    while (running) {
        // Process events
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
        }

        // Clear the renderer
        SDL_RenderClear(renderer);

        // Draw the sprite
        SDL_Rect spriteRect = { spriteX, spriteY, spriteSurface->w, spriteSurface->h };
        SDL_RenderCopy(renderer, spriteTexture, NULL, &spriteRect);

        // Update the renderer
        SDL_RenderPresent(renderer);

        // Delay to control animation speed
        SDL_Delay(10);
    }

    // Clean up
    SDL_FreeSurface(spriteSurface);
    SDL_FreeSurface(alphaMask);
    SDL_DestroyTexture(spriteTexture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}