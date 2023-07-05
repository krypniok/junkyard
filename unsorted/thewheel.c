#include <GL/glew.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <math.h>

#define M_PI 3.14159268

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define CIRCLE_RADIUS 200
#define NUM_SEGMENTS 24
#define ROTATION_IMPULSE 500.0f
#define FRICTION 0.05f
#define MIN_ROTATION_SPEED 10.0f
#define MAX_ROTATION_SPEED 100.0f

float circleRotation = 0.0f;
float rotationSpeed = 0.0f;
int isSpacePressed = 0;
int stoppedSegment = -1;

typedef struct {
    float r, g, b;
} Color;

Color segmentColors[NUM_SEGMENTS];

SDL_Window* window;

void handleInput(SDL_Event event) {
    if (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_SPACE) {
        isSpacePressed = 1;
    }
}

void update(float deltaTime) {
    if (isSpacePressed && rotationSpeed < MAX_ROTATION_SPEED) {
        rotationSpeed += ROTATION_IMPULSE * deltaTime;
    }
    
    circleRotation += rotationSpeed * deltaTime;
    
    if (rotationSpeed > MIN_ROTATION_SPEED) {
        rotationSpeed -= FRICTION * deltaTime;
    }
    else {
        rotationSpeed = 0.0f;
        isSpacePressed = 0;
        
        float segmentAngle = 2 * M_PI / NUM_SEGMENTS;
        float segmentRotation = circleRotation + M_PI / NUM_SEGMENTS;
        stoppedSegment = (int)(segmentRotation / segmentAngle) % NUM_SEGMENTS;
    }
}

void drawCircle() {
    float segmentAngle = 2 * M_PI / NUM_SEGMENTS;
    
    for (int i = 0; i < NUM_SEGMENTS; i++) {
        glPushMatrix();
        glRotatef(i * 360.0f / NUM_SEGMENTS, 0.0f, 0.0f, 1.0f);
        
        glBegin(GL_TRIANGLES);
        glColor3f(segmentColors[i].r, segmentColors[i].g, segmentColors[i].b);
        glVertex2f(0.0f, 0.0f);
        glVertex2f(CIRCLE_RADIUS, 0.0f);
        glVertex2f(CIRCLE_RADIUS * cos(segmentAngle), CIRCLE_RADIUS * sin(segmentAngle));
        glEnd();
        
        glPopMatrix();
    }
}

int main(int argc, char* argv[]) {
    SDL_Init(SDL_INIT_VIDEO);
    
    window = SDL_CreateWindow("Glücksrad-Spiel",
                              SDL_WINDOWPOS_CENTERED,
                              SDL_WINDOWPOS_CENTERED,
                              WINDOW_WIDTH, WINDOW_HEIGHT,
                              SDL_WINDOW_OPENGL);
    
    SDL_GLContext glContext = SDL_GL_CreateContext(window);
    glewInit();
    
    for (int i = 0; i < NUM_SEGMENTS; i++) {
        segmentColors[i].r = (float)rand() / RAND_MAX;
        segmentColors[i].g = (float)rand() / RAND_MAX;
        segmentColors[i].b = (float)rand() / RAND_MAX;
    }
    
    glViewport(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-WINDOW_WIDTH / 2, WINDOW_WIDTH / 2, -WINDOW_HEIGHT / 2, WINDOW_HEIGHT / 2, -1, 1);
    
    SDL_Event event;
    int isRunning = 1;
    
    float startTime = SDL_GetTicks();
    
    while (isRunning) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                isRunning = 0;
            }
            else if (event.type == SDL_KEYDOWN) {
                if (event.key.keysym.sym == SDLK_SPACE) {
                    isSpacePressed = 1;
                }
            }
            else if (event.type == SDL_KEYUP) {
                if (event.key.keysym.sym == SDLK_SPACE) {
                    isSpacePressed = 0;
                }
            }
        }
        
        Uint32 currentTime = SDL_GetTicks();
        float deltaTime = (currentTime - startTime) / 1000.0f;
        startTime = currentTime;
        
        update(deltaTime);
        
        glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        drawCircle();
        
        SDL_GL_SwapWindow(window);
    }
    
    SDL_GL_DeleteContext(glContext);
    SDL_DestroyWindow(window);
    SDL_Quit();
    
    return 0;
}
