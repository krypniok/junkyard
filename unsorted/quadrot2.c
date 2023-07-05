#include <stdio.h>
#include <stdbool.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/glu.h>


#define _USE_MATH_DEFINES
#include <math.h>


#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480

SDL_Window* window = NULL;
SDL_GLContext context;

int targetFPS = 30;
int frameDelay;

struct Camera {
    float x, y, z;
    float pitch, yaw;
    float lookAtX, lookAtY, lookAtZ;
} camera;

void initialize()
{
    // Initialize SDL
    SDL_Init(SDL_INIT_VIDEO);

    // Create a window
    window = SDL_CreateWindow("SDL OpenGL", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN); // | SDL_WINDOW_FULLSCREEN);

    // Create OpenGL context
    context = SDL_GL_CreateContext(window);

    // Set up OpenGL
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0, (float)SCREEN_WIDTH / SCREEN_HEIGHT, 1.0, 100.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glClearColor(0, 0, 0, 1);

    // Enable depth testing
    glEnable(GL_DEPTH_TEST);

    // Initialize camera
    camera.x = 0.0f;
    camera.y = 0.0f;
    camera.z = 5.0f;
    camera.pitch = 0.0f;
    camera.yaw = 0.0f;
    camera.lookAtX = 0.0f;
    camera.lookAtY = 0.0f;
    camera.lookAtZ = -1.0f;

    SDL_SetRelativeMouseMode(SDL_TRUE);
}

void renderCube(float size)
{
    glPushMatrix();

    float halfSize = size / 2.0f;

    GLfloat colors[6][3] = {
        {1, 0, 0},   // Red
        {0, 1, 0},   // Green
        {0, 0, 1},   // Blue
        {1, 1, 0},   // Yellow
        {1, 0, 1},   // Magenta
        {0, 1, 1}    // Cyan
    };

    GLfloat vertices[6][4][3] = {
        {{-halfSize, -halfSize, halfSize}, {halfSize, -halfSize, halfSize}, {halfSize, halfSize, halfSize}, {-halfSize, halfSize, halfSize}},   // Front face
        {{halfSize, -halfSize, -halfSize}, {-halfSize, -halfSize, -halfSize}, {-halfSize, halfSize, -halfSize}, {halfSize, halfSize, -halfSize}},   // Back face
        {{-halfSize, -halfSize, -halfSize}, {-halfSize, -halfSize, halfSize}, {-halfSize, halfSize, halfSize}, {-halfSize, halfSize, -halfSize}},   // Left face
        {{halfSize, -halfSize, halfSize}, {halfSize, -halfSize, -halfSize}, {halfSize, halfSize, -halfSize}, {halfSize, halfSize, halfSize}},   // Right face
        {{-halfSize, halfSize, halfSize}, {halfSize, halfSize, halfSize}, {halfSize, halfSize, -halfSize}, {-halfSize, halfSize, -halfSize}},   // Top face
        {{-halfSize, -halfSize, -halfSize}, {halfSize, -halfSize, -halfSize}, {halfSize, -halfSize, halfSize}, {-halfSize, -halfSize, halfSize}}    // Bottom face
    };

    for (int i = 0; i < 6; i++) {
        glBegin(GL_QUADS);
        glColor3fv(colors[i]);
        for (int j = 0; j < 4; j++) {
            glVertex3fv(vertices[i][j]);
        }
        glEnd();
    }

    glPopMatrix();
}

void renderGrid(float size, float cellSize)
{
    glPushMatrix();

    float halfSize = size / 2.0f;
    int numCells = (int)(size / cellSize);

    glBegin(GL_QUADS);
    for (int x = -numCells / 2; x < numCells / 2; x++) {
        for (int z = -numCells / 2; z < numCells / 2; z++) {
            float xOffset = x * cellSize;
            float zOffset = z * cellSize;

            if ((x + z) % 2 == 0) {
                glColor3f(0.8f, 0.8f, 0.8f);   // Light gray
            }
            else {
                glColor3f(0.2f, 0.2f, 0.2f);   // Dark gray
            }

            glVertex3f(xOffset, 0, zOffset);
            glVertex3f(xOffset + cellSize, 0, zOffset);
            glVertex3f(xOffset + cellSize, 0, zOffset + cellSize);
            glVertex3f(xOffset, 0, zOffset + cellSize);
        }
    }
    glEnd();

    glPopMatrix();
}

bool rayIntersectsPlane(const float rayOrigin[3], const float rayDirection[3], const float planeNormal[3], const float planePoint[3], float intersectionPoint[3])
{
    float dDotN = rayDirection[0] * planeNormal[0] + rayDirection[1] * planeNormal[1] + rayDirection[2] * planeNormal[2];
    if (fabs(dDotN) < 0.0001f) {
        // Ray is parallel to the plane
        return false;
    }

    float t = -((rayOrigin[0] - planePoint[0]) * planeNormal[0] +
                (rayOrigin[1] - planePoint[1]) * planeNormal[1] +
                (rayOrigin[2] - planePoint[2]) * planeNormal[2]) / dDotN;

    if (t < 0.0f) {
        // Intersection is behind the ray origin
        return false;
    }

    intersectionPoint[0] = rayOrigin[0] + rayDirection[0] * t;
    intersectionPoint[1] = rayOrigin[1] + rayDirection[1] * t;
    intersectionPoint[2] = rayOrigin[2] + rayDirection[2] * t;

    return true;
}

void render()
{
    // Set 3D mode
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0, (float)SCREEN_WIDTH / SCREEN_HEIGHT, 1.0, 100.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(
        camera.x, camera.y, camera.z,
        camera.x + camera.lookAtX, camera.y + camera.lookAtY, camera.z + camera.lookAtZ,
        0, 1, 0
    );

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    // Render the cube
    renderCube(1.0f);

    // Render the grid
    renderGrid(10.0f, 1.0f);

    // Set 2D mode for cursor
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    // Render 2D crosshair cursor
    int mouseX, mouseY;
    SDL_GetMouseState(&mouseX, &mouseY);

    glDisable(GL_DEPTH_TEST);
    glColor3f(1.0f, 1.0f, 1.0f);
    glLineWidth(1.0f);

    glBegin(GL_LINES);
    glVertex2i(mouseX - 10, mouseY);
    glVertex2i(mouseX + 10, mouseY);
    glVertex2i(mouseX, mouseY - 10);
    glVertex2i(mouseX, mouseY + 10);
    glEnd();

    // Restore 3D mode
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0, (float)SCREEN_WIDTH / SCREEN_HEIGHT, 1.0, 100.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(
        camera.x, camera.y, camera.z,
        camera.x + camera.lookAtX, camera.y + camera.lookAtY, camera.z + camera.lookAtZ,
        0, 1, 0
    );

    glEnable(GL_DEPTH_TEST);

    SDL_GL_SwapWindow(window);
}

void handleKeyboard()
{
    const Uint8* keyboardState = SDL_GetKeyboardState(NULL);

    float cameraSpeed = 0.05f;

    // Translate camera based on key input
    if (keyboardState[SDL_SCANCODE_W])
    {
        camera.x += camera.lookAtX * cameraSpeed;
        camera.y += camera.lookAtY * cameraSpeed;
        camera.z += camera.lookAtZ * cameraSpeed;
    }
    if (keyboardState[SDL_SCANCODE_S])
    {
        camera.x -= camera.lookAtX * cameraSpeed;
        camera.y -= camera.lookAtY * cameraSpeed;
        camera.z -= camera.lookAtZ * cameraSpeed;
    }
    if (keyboardState[SDL_SCANCODE_A])
    {
        camera.x -= sin(camera.yaw + M_PI / 2) * cameraSpeed;
        camera.z += cos(camera.yaw + M_PI / 2) * cameraSpeed;
    }
    if (keyboardState[SDL_SCANCODE_D])
    {
        camera.x += sin(camera.yaw + M_PI / 2) * cameraSpeed;
        camera.z -= cos(camera.yaw + M_PI / 2) * cameraSpeed;
    }
    if (keyboardState[SDL_SCANCODE_Y])
    {
        camera.y -= cameraSpeed;
    }
    if (keyboardState[SDL_SCANCODE_Z])
    {
        camera.y += cameraSpeed;
    }
}

void handleMouseMotion(int deltaX, int deltaY)
{
    float sensitivity = 0.05f;

    camera.yaw -= deltaX * sensitivity;
    camera.pitch -= deltaY * sensitivity;

    // Clamp pitch to avoid flipping
    if (camera.pitch > 89.0f)
        camera.pitch = 89.0f;
    if (camera.pitch < -89.0f)
        camera.pitch = -89.0f;

    // Calculate new lookAt direction
    float pitchRad = (float)(camera.pitch * M_PI / 180.0f);
    float yawRad = (float)(camera.yaw * M_PI / 180.0f);

    camera.lookAtX = cos(pitchRad) * cos(yawRad);
    camera.lookAtY = sin(pitchRad);
    camera.lookAtZ = cos(pitchRad) * sin(yawRad);
}

void handleMouseClick(int button)
{
    if (button == SDL_BUTTON_LEFT) {
        // Get mouse position
        int mouseX, mouseY;
        SDL_GetMouseState(&mouseX, &mouseY);

        // Convert mouse position to OpenGL coordinates
        float normalizedX = (float)mouseX / SCREEN_WIDTH * 2 - 1;
        float normalizedY = 1 - (float)mouseY / SCREEN_HEIGHT * 2;

        // Calculate ray direction
        float rayClip[4] = {normalizedX, normalizedY, -1.0f, 1.0f};
        float rayEye[4];
        float rayWorld[4];

        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluPerspective(45.0, (float)SCREEN_WIDTH / SCREEN_HEIGHT, 1.0, 100.0);
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        gluLookAt(
            camera.x, camera.y, camera.z,
            camera.x + camera.lookAtX, camera.y + camera.lookAtY, camera.z + camera.lookAtZ,
            0, 1, 0
        );

        gluUnProject(
            rayClip[0], rayClip[1], rayClip[2],
            glModelviewMatrix, glProjectionMatrix, glViewport,
            &rayEye[0], &rayEye[1], &rayEye[2]
        );

        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, -1, 1);
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        gluLookAt(0, 0, 5, 0, 0, -1, 0, 1, 0);

        gluUnProject(
            rayClip[0], rayClip[1], rayClip[2],
            glModelviewMatrix, glProjectionMatrix, glViewport,
            &rayWorld[0], &rayWorld[1], &rayWorld[2]
        );

        // Check for intersection with grid plane
        float planeNormal[3] = {0, 1, 0};
        float planePoint[3] = {0, 0, 0};
        float intersectionPoint[3];

        if (rayIntersectsPlane(rayEye, rayWorld, planeNormal, planePoint, intersectionPoint)) {
            printf("Intersection point: (%f, %f, %f)\n", intersectionPoint[0], intersectionPoint[1], intersectionPoint[2]);
        }
    }
}

void handleEvents()
{
    SDL_Event event;

    while (SDL_PollEvent(&event)) {
        switch (event.type) {
        case SDL_QUIT:
            SDL_Quit();
            exit(0);
            break;
        case SDL_KEYDOWN:
            if (event.key.keysym.sym == SDLK_ESCAPE) {
                SDL_Quit();
                exit(0);
            }
            break;
        case SDL_MOUSEMOTION:
            handleMouseMotion(event.motion.xrel, event.motion.yrel);
            break;
        case SDL_MOUSEBUTTONDOWN:
            handleMouseClick(event.button.button);
            break;
        }
    }
}

void cleanup()
{
    SDL_GL_DeleteContext(glContext);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

int main(int argc, char** argv)
{
    if (!init()) {
        printf("Failed to initialize SDL.\n");
        return 1;
    }

    while (true) {
        handleEvents();
        handleKeyboard();
        render();
    }

    cleanup();
    return 0;
}