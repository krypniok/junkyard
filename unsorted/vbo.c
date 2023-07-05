#include <stdio.h>
#include <stdlib.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <stdbool.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600
#define TEXTURE_WIDTH 256
#define TEXTURE_HEIGHT 256
#define PERMUTATION_TABLE_SIZE 256


#define ET printf("! Error Trace (%s:%i) Escape espacE !\n", __FILE__, __LINE__); \

#define FLOG(var) printf(#var " = %f (%s:%i)\n", var, __FILE__, __LINE__); \

SDL_Window* window = NULL;
SDL_GLContext glContext = NULL;

char strTitle[80];


GLuint textures[4];
unsigned char waterTexture[TEXTURE_WIDTH * TEXTURE_HEIGHT * 3];
unsigned char sandTexture[TEXTURE_WIDTH * TEXTURE_HEIGHT * 3];
unsigned char grassTexture[TEXTURE_WIDTH * TEXTURE_HEIGHT * 3];
unsigned char stoneTexture[TEXTURE_WIDTH * TEXTURE_HEIGHT * 3];

unsigned char permutationTable[PERMUTATION_TABLE_SIZE];

typedef struct {
    float x;
    float y;
    float width;
    float height;
    float* value;
} Slider;

Slider sliders[1];


void generatePermutationTable(unsigned char* table, int size) {
    for (int i = 0; i < size; ++i) {
        table[i] = i;
    }

    for (int i = 0; i < size; ++i) {
        int j = rand() % (i + 1);
        unsigned char temp = table[i];
        table[i] = table[j];
        table[j] = temp;
    }

    // Duplicate the permutation table to avoid overflow when indexing
    for (int i = 0; i < size; ++i) {
        table[size + i] = table[i];
    }
}

float fade(float t) {
    return t * t * t * (t * (t * 6 - 15) + 10);
}

float lerp(float t, float a, float b) {
    return a + t * (b - a);
}

float grad(int hash, float x, float y) {
    int h = hash & 15;
    float u = h < 8 ? x : y;
    float v = h < 4 ? y : (h == 12 || h == 14) ? x : 0;
    return ((h & 1) == 0 ? u : -u) + ((h & 2) == 0 ? v : -v);
}

float noise(float x, float y) {
    int xi = (int)x & 255;
    int yi = (int)y & 255;

    float xf = x - (int)x;
    float yf = y - (int)y;

    float u = fade(xf);
    float v = fade(yf);

    int aa = permutationTable[permutationTable[xi] + yi];
    int ab = permutationTable[permutationTable[xi] + yi + 1];
    int ba = permutationTable[permutationTable[xi + 1] + yi];
    int bb = permutationTable[permutationTable[xi + 1] + yi + 1];

    float x1 = lerp(u, grad(aa, xf, yf), grad(ba, xf - 1, yf));
    float x2 = lerp(u, grad(ab, xf, yf - 1), grad(bb, xf - 1, yf - 1));

    return (lerp(v, x1, x2) + 1) / 2;
}

void generateTexture(unsigned char* textureData, int width, int height, float frequency, int octaves) {
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            float amplitude = 1.0f;
            float persistence = 0.75f;
            float total = 0.0f;

            for (int i = 0; i < octaves; ++i) {
                float freq = frequency * pow(2, i);
                float value = noise(x / freq, y / freq);
                total += value * amplitude;
                amplitude *= persistence;
            }

            unsigned char color = (unsigned char)(total * 255.0f);
            textureData[(y * width + x) * 3] = 0;//color;
            textureData[(y * width + x) * 3 + 1] = color;
            textureData[(y * width + x) * 3 + 2] = 0;//color;
        }
    }
}

void renderTexturedQuad(float x, float y, float width, float height, GLuint textureID) {
    glBindTexture(GL_TEXTURE_2D, textureID);

    glBegin(GL_QUADS);
    glTexCoord2f(0.0f, 0.0f);
    glVertex2f(x, y);
    glTexCoord2f(1.0f, 0.0f);
    glVertex2f(x + width, y);
    glTexCoord2f(1.0f, 1.0f);
    glVertex2f(x + width, y + height);
    glTexCoord2f(0.0f, 1.0f);
    glVertex2f(x, y + height);
    glEnd();
}

void renderSlider(Slider slider) {
    // Draw the slider as a wire rectangle
    glLoadIdentity();
    glColor3f(1.0f, 1.0f, 1.0f);
    glTranslatef(slider.x, slider.y, 0.0f);
    glBegin(GL_LINE_LOOP);
    glVertex2f(0.0f, 0.0f);
    glVertex2f(slider.width, 0.0f);
    glVertex2f(slider.width, slider.height);
    glVertex2f(0.0f, slider.height);
    glEnd();

    // Draw the filled portion of the slider based on the value
    glLoadIdentity();
    glColor3f(0.0f, *slider.value, 0.0f); // Assuming green color variation
    glTranslatef(slider.x, slider.y, 0.0f);
    glBegin(GL_QUADS);
    glVertex2f(0.0f, 0.0f);
    glVertex2f(*slider.value * slider.width, 0.0f);
    glVertex2f(*slider.value * slider.width, slider.height);
    glVertex2f(0.0f, slider.height);
    glEnd();
}

void renderScene(GLuint* textures) {
    glClear(GL_COLOR_BUFFER_BIT);

    // Enable texturing
    glEnable(GL_TEXTURE_2D);

    // Render textured quads
    renderTexturedQuad(-0.8f, -0.8f, 0.6f, 0.6f, textures[0]);
    renderTexturedQuad(0.2f, -0.8f, 0.6f, 0.6f, textures[1]);
    renderTexturedQuad(-0.8f, 0.2f, 0.6f, 0.6f, textures[2]);
    renderTexturedQuad(0.2f, 0.2f, 0.6f, 0.6f, textures[3]);

    // Set up OpenGL
    glViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-1.0, 1.0, -1.0, 1.0, 1.0, -1.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

   // Render sliders
    for (int i = 0; i < 1; i++) {
        Slider slider = sliders[i];

        // Draw wire rectangle
        glColor3f(1.0f, 1.0f, 1.0f);
        glBegin(GL_LINE_LOOP);
        glVertex2f(slider.x, slider.y);
        glVertex2f(slider.x + slider.width, slider.y);
        glVertex2f(slider.x + slider.width, slider.y + slider.height);
        glVertex2f(slider.x, slider.y + slider.height);
        glEnd();

        // Calculate solid rectangle width based on slider value
        float solidWidth = slider.width * (*slider.value);

        // Draw solid rectangle
        glColor3f(1.0f, 1.0f, 1.0f);
        glBegin(GL_QUADS);
        glVertex2f(slider.x, slider.y);
        glVertex2f(slider.x + solidWidth, slider.y);
        glVertex2f(slider.x + solidWidth, slider.y + slider.height);
        glVertex2f(slider.x, slider.y + slider.height);
        glEnd();
    }

    // Swap buffers
    SDL_GL_SwapWindow(window);
}

void reloadTextures() {
  // glDisable(GL_TEXTURE_2D);
    glDeleteTextures(4, textures);
    glGenTextures(4, textures);
    // Generate permutation table
    generatePermutationTable(permutationTable, PERMUTATION_TABLE_SIZE);

    // Generate textures
    generateTexture(waterTexture, TEXTURE_WIDTH, TEXTURE_HEIGHT, 0.02f, 4);
    generateTexture(sandTexture, TEXTURE_WIDTH, TEXTURE_HEIGHT, 0.05f, 4);
    generateTexture(grassTexture, TEXTURE_WIDTH, TEXTURE_HEIGHT, 0.05f, 4);
    generateTexture(stoneTexture, TEXTURE_WIDTH, TEXTURE_HEIGHT, 0.2f, 4);

    // Create OpenGL textures
    glBindTexture(GL_TEXTURE_2D, 0);

    // Set texture parameters and upload texture data
    for (int i = 0; i < 4; ++i) {
        glBindTexture(GL_TEXTURE_2D, textures[i]);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, TEXTURE_WIDTH, TEXTURE_HEIGHT, 0, GL_RGB, GL_UNSIGNED_BYTE,
                     i == 0 ? waterTexture : i == 1 ? sandTexture : i == 2 ? grassTexture : stoneTexture);
    }
    
}

void handleEvent(SDL_Event* event) {
    switch (event->type) {
        case SDL_MOUSEMOTION: {
                int mouseX = event->motion.x;
                int mouseY = SCREEN_HEIGHT - event->motion.y;
                sprintf(strTitle, "MouseX: %04i, MouseY: %04i", mouseX, mouseY);
        } break;

        case SDL_MOUSEBUTTONDOWN:
            if (event->button.button == SDL_BUTTON_LEFT) {
                int mouseX = event->button.x;
                int mouseY = SCREEN_HEIGHT - event->button.y;
          
                // Check if the mouse is over any slider
                for (int i = 0; i < 1; i++) {
                    Slider slider = sliders[i];
                    /*
                    slider.x = slider.x + 1.0f * (SCREEN_WIDTH/2);
                    slider.y = slider.y + 1.0f * (SCREEN_HEIGHT/2);
                    slider.width = (slider.width * SCREEN_WIDTH/2) + 1.0f; 
                    slider.height = (slider.height * SCREEN_HEIGHT/2) + 1.0f; 
                    */
                    slider.x = (1.0f + slider.x) * SCREEN_WIDTH/2;
                    slider.y += 1.0f; slider.y *= SCREEN_HEIGHT/2;
                    slider.width *= SCREEN_WIDTH/2; slider.width += 1.0f; 
                    slider.height *= SCREEN_HEIGHT/2; slider.height += 1.0f; 

                    if (mouseX >= slider.x && mouseX <= slider.x + slider.width &&
                        mouseY >= slider.y && mouseY <= slider.y + slider.height) {
                        // Adjust the slider value based on mouse position
                        float newValue = (float)(mouseX - slider.x) / slider.width;
                        *slider.value = newValue;
                        //FLOG(newValue);
                        sprintf(strTitle, "MouseX: %04i, MouseY: %04i | %s = %f", mouseX, mouseY, "v", newValue);
                    }
                }
                
            } break;
    }
    SDL_SetWindowTitle(window, strTitle);
}


int main(int argc, char* argv[]) {

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL could not initialize! SDL Error: %s\n", SDL_GetError());
        return -1;
    }

    window = SDL_CreateWindow("Procedural Textures", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
                              SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);
    if (window == NULL) {
        printf("Window could not be created! SDL Error: %s\n", SDL_GetError());
        SDL_Quit();
        return -1;
    }

    glContext = SDL_GL_CreateContext(window);
    if (glContext == NULL) {
        printf("OpenGL context could not be created! SDL Error: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return -1;
    }

    // Set up OpenGL
    glViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-1.0, 1.0, -1.0, 1.0, 1.0, -1.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

    reloadTextures();

    float testf = 0.33f;
    // Initialize sliders
    sliders[0].x = -1.0f;
    sliders[0].y = 0.0f;
    sliders[0].width = 0.6f;
    sliders[0].height = 0.05f;
    sliders[0].value = &testf;

    // Main loop
    bool quit = false;
    SDL_Event event;
    while (!quit) {
        while (SDL_PollEvent(&event) != 0) {
            if (event.type == SDL_QUIT) {
                quit = true;
            }
            handleEvent(&event);
        }
                       //reloadTextures();
        renderScene(textures);
    }

    // Clean up
    glDeleteTextures(4, textures);
    SDL_GL_DeleteContext(glContext);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
