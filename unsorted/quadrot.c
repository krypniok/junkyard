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

typedef struct {
    float x, y, z;
} Vertex;

typedef struct {
    int v1, v2, v3;
} Triangle;

typedef struct {
    Vertex* vertices;
    Triangle* triangles;
    float* texCoords;
    int numVertices;
    int numTriangles;
} Object;

typedef struct {
    Vertex* vertices;
    Triangle* triangles;
    int numVertices;
    int numTriangles;
} Mesh;


Object sphere;

void createSphere(Object* sphere, float radius, int numSegments, int numRings) {
    // Calculate the total number of vertices and triangles
    sphere->numVertices = (numSegments + 1) * (numRings + 1);
    sphere->numTriangles = numSegments * numRings * 2;

    // Allocate memory for the vertices, triangles, and texture coordinates
    sphere->vertices = (Vertex*)malloc(sizeof(Vertex) * sphere->numVertices);
    sphere->triangles = (Triangle*)malloc(sizeof(Triangle) * sphere->numTriangles);
    sphere->texCoords = (float*)malloc(sizeof(float) * 2 * sphere->numVertices);

    // Generate the sphere geometry
    int vertexIndex = 0;
    int triangleIndex = 0;

    for (int ring = 0; ring <= numRings; ring++) {
        float theta = ring * M_PI / numRings;
        float sinTheta = sinf(theta);
        float cosTheta = cosf(theta);

        for (int segment = 0; segment <= numSegments; segment++) {
            float phi = segment * 2.0f * M_PI / numSegments;
            float sinPhi = sinf(phi);
            float cosPhi = cosf(phi);

            float x = cosPhi * sinTheta;
            float y = cosTheta;
            float z = sinPhi * sinTheta;

            sphere->vertices[vertexIndex].x = radius * x;
            sphere->vertices[vertexIndex].y = radius * y;
            sphere->vertices[vertexIndex].z = radius * z;

            sphere->texCoords[2 * vertexIndex] = (float)segment / numSegments;
            sphere->texCoords[2 * vertexIndex + 1] = (float)ring / numRings;

            if (ring < numRings && segment < numSegments) {
                sphere->triangles[triangleIndex].v1 = vertexIndex;
                sphere->triangles[triangleIndex].v2 = vertexIndex + numSegments + 1;
                sphere->triangles[triangleIndex].v3 = vertexIndex + numSegments;

                triangleIndex++;

                sphere->triangles[triangleIndex].v1 = vertexIndex + numSegments + 1;
                sphere->triangles[triangleIndex].v2 = vertexIndex;
                sphere->triangles[triangleIndex].v3 = vertexIndex + 1;

                triangleIndex++;
            }

            vertexIndex++;
        }
    }
}


Mesh* createSoccerBall(float radius, int stacks, int slices) {
    Mesh* sphere = (Mesh*)malloc(sizeof(Mesh));

    int numVertices = (stacks + 1) * (slices + 1);
    int numTriangles = stacks * slices * 2;

    sphere->numVertices = numVertices;
    sphere->vertices = (Vertex*)malloc(numVertices * sizeof(Vertex));

    sphere->numTriangles = numTriangles;
    sphere->triangles = (Triangle*)malloc(numTriangles * sizeof(Triangle));

    int index = 0;

    // Generate vertices and texture coordinates
    for (int stack = 0; stack <= stacks; stack++) {
        float phi = stack * M_PI / stacks;
        float y = radius * cos(phi);
        float sinPhi = radius * sin(phi);

        for (int slice = 0; slice <= slices; slice++) {
            float theta = slice * 2 * M_PI / slices;
            float x = sinPhi * cos(theta);
            float z = sinPhi * sin(theta);

            sphere->vertices[index].x = x;
            sphere->vertices[index].y = y;
            sphere->vertices[index].z = z;

            index++;
        }
    }

    // Generate triangles
    index = 0;
    for (int stack = 0; stack < stacks; stack++) {
        for (int slice = 0; slice < slices; slice++) {
            int v1 = stack * (slices + 1) + slice;
            int v2 = v1 + 1;
            int v3 = (stack + 1) * (slices + 1) + slice;
            int v4 = v3 + 1;

            sphere->triangles[index].v1 = v1;
            sphere->triangles[index].v2 = v2;
            sphere->triangles[index].v3 = v3;

            index++;

            sphere->triangles[index].v1 = v2;
            sphere->triangles[index].v2 = v4;
            sphere->triangles[index].v3 = v3;

            index++;
        }
    }

    return sphere;
}


void destroyMesh(Mesh* mesh) {
    free(mesh->vertices);
    free(mesh->triangles);
}

GLuint loadTexture(const char* filename) {
    SDL_Surface* surface = SDL_LoadBMP(filename);
    if (!surface) {
        printf("Failed to load texture: %s\n", SDL_GetError());
        return 0;
    }

    // Convert the surface to a format compatible with OpenGL
    SDL_PixelFormat* pixelFormat = SDL_AllocFormat(SDL_PIXELFORMAT_RGBA8888);
    SDL_Surface* convertedSurface = SDL_ConvertSurface(surface, pixelFormat, 0);
    SDL_FreeFormat(pixelFormat);
    SDL_FreeSurface(surface);

    if (!convertedSurface) {
        printf("Failed to convert surface: %s\n", SDL_GetError());
        return 0;
    }

    GLuint textureID;
    glGenTextures(1, &textureID);
    glBindTexture(GL_TEXTURE_2D, textureID);

    // Set texture parameters
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

    // Upload the texture data
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, convertedSurface->w, convertedSurface->h, 0, GL_RGBA, GL_UNSIGNED_BYTE, convertedSurface->pixels);

    // Generate mipmaps
    // glGenerateMipmap(GL_TEXTURE_2D);

    // Clean up the converted surface
    SDL_FreeSurface(convertedSurface);

    return textureID;
}

GLuint texture;
GLuint txtSand;

Mesh* soccerBall;

void initialize()
{
    // Initialize SDL
    SDL_Init(SDL_INIT_VIDEO);

    // Create a window
    window = SDL_CreateWindow("SDL OpenGL", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);

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
    glEnable(GL_TEXTURE_2D);

    // Initialize camera
    camera.x = -5.0f;
    camera.y = 5.0f;  // Set a higher Y value for top-down view
    camera.z = -5.0f;
    camera.pitch = 0.0f;  // Set pitch to -90 degrees for top-down view
    camera.yaw = 0.0f;
    camera.lookAtX = 5.0f;
    camera.lookAtY = 0.0f;  // Set a negative Y value for top-down view
    camera.lookAtZ = 5.0f;

    frameDelay = 1000 / 60;

    SDL_SetRelativeMouseMode(SDL_TRUE);

    texture = loadTexture("shuttle.bmp");
    txtSand = loadTexture("natural-sand-texture.bmp");

    createSphere(&sphere, 1.0f, 16, 16);
    
    soccerBall = createSoccerBall(1.0f, 12, 20);

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

void renderSphere(Object* sphere) {
    // Render the sphere using the provided vertex, triangle, and texture coordinate data

    glBindTexture(GL_TEXTURE_2D, texture);
    // Iterate over the triangles
    for (int i = 0; i < sphere->numTriangles; i++) {
        Triangle triangle = sphere->triangles[i];

        // Retrieve the vertices for the current triangle
        Vertex v1 = sphere->vertices[triangle.v1];
        Vertex v2 = sphere->vertices[triangle.v2];
        Vertex v3 = sphere->vertices[triangle.v3];

        // Retrieve the texture coordinates for the current triangle
        float t1u = sphere->texCoords[2 * triangle.v1];
        float t1v = sphere->texCoords[2 * triangle.v1 + 1];
        float t2u = sphere->texCoords[2 * triangle.v2];
        float t2v = sphere->texCoords[2 * triangle.v2 + 1];
        float t3u = sphere->texCoords[2 * triangle.v3];
        float t3v = sphere->texCoords[2 * triangle.v3 + 1];

        // Render the triangle using the retrieved data
        glBegin(GL_TRIANGLES);
        glTexCoord2f(t1u, t1v);
        glVertex3f(v1.x, v1.y, v1.z);

        glTexCoord2f(t2u, t2v);
        glVertex3f(v2.x, v2.y, v2.z);

        glTexCoord2f(t3u, t3v);
        glVertex3f(v3.x, v3.y, v3.z);
        glEnd();
    }
}


void renderSoccerBall(Mesh* sphere) {
    // Render the sphere using the vertices and triangles

    glBegin(GL_TRIANGLES);
    // Iterate over the triangles and render them
    for (int i = 0; i < sphere->numTriangles; i++) {
        Triangle triangle = sphere->triangles[i];

        // Render the triangle using the vertices
        Vertex v1 = sphere->vertices[triangle.v1];
        Vertex v2 = sphere->vertices[triangle.v2];
        Vertex v3 = sphere->vertices[triangle.v3];

        // Apply black color to pentagons (triangles 0-11)
        if (i < 12)
            glColor3f(0.0f, 0.0f, 0.0f);
        // Apply light gray color to hexagons (triangles 12-59)
        else
            glColor3f(0.7f, 0.7f, 0.7f);

        glVertex3f(v1.x, v1.y, v1.z);
        glVertex3f(v2.x, v2.y, v2.z);
        glVertex3f(v3.x, v3.y, v3.z);
    }
    glEnd();
}

void renderGrid(float size, float cellSize)
{
    glPushMatrix();

    float halfSize = size / 2.0f;
    int numCells = (int)(size / cellSize);
    
    glBindTexture(GL_TEXTURE_2D, txtSand);
    
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
            glTexCoord2f(0.0f, 0.0f);
            glVertex3f(xOffset, 0, zOffset);
            glTexCoord2f(1.0f, 0.0f);
            glVertex3f(xOffset + cellSize, 0, zOffset);
            glTexCoord2f(1.0f, 1.0f);
            glVertex3f(xOffset + cellSize, 0, zOffset + cellSize);
            glTexCoord2f(0.0f, 1.0f);
            glVertex3f(xOffset, 0, zOffset + cellSize);
        }
    }
    glEnd();

    glPopMatrix();
}

void renderMouse()
{
    // Set 2D mode for cursor
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    // Render 2D crosshair cursor
    int mouseX, mouseY;


    glDisable(GL_DEPTH_TEST);
    glColor3f(1.0f, 1.0f, 1.0f);
    glLineWidth(1.0f);

    glBegin(GL_LINES);
    glVertex2i(mouseX - 10, mouseY);
    glVertex2i(mouseX + 10, mouseY);
    glVertex2i(mouseX, mouseY - 10);
    glVertex2i(mouseX, mouseY + 10);
    glEnd();

    glEnable(GL_DEPTH_TEST);
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

    // Render the sphere
   // renderSphere(&sphere);

    renderSoccerBall(soccerBall);

    // Render the grid
    renderGrid(10.0f, 1.0f);

    // Render the mouse cursor
    renderMouse();

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

    // Update the look-at vector
    float yawRad = camera.yaw * M_PI / 180.0f;
    float pitchRad = camera.pitch * M_PI / 180.0f;
    camera.lookAtX = cosf(yawRad) * cosf(pitchRad);
    camera.lookAtY = sinf(pitchRad);
    camera.lookAtZ = sinf(yawRad) * cosf(pitchRad);

    // Normalize the look-at vector
    float lookAtLength = sqrtf(camera.lookAtX * camera.lookAtX + camera.lookAtY * camera.lookAtY + camera.lookAtZ * camera.lookAtZ);
    camera.lookAtX /= lookAtLength;
    camera.lookAtY /= lookAtLength;
    camera.lookAtZ /= lookAtLength;
}

void updateWindowTitle(Uint32 deltaTime)
{
    char title[64];
    float fps = 1000.0f / deltaTime;
    snprintf(title, sizeof(title), "SDL OpenGL | FPS: %.2f", fps);
    SDL_SetWindowTitle(window, title);
}

void cleanup()
{
    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(window);
    SDL_Quit();

        // Clean up memory
    free(sphere.vertices);
    free(sphere.triangles);
    free(sphere.texCoords);

}

int main()
{
    initialize();

    SDL_Event event;
    int quit = 0;

    Uint32 frameStart, frameTime;

    while (!quit)
    {
        frameStart = SDL_GetTicks();

        while (SDL_PollEvent(&event))
        {
            if (event.type == SDL_QUIT)
                quit = 1;
            else if (event.type == SDL_MOUSEMOTION) {
               // handleMouseMotion(event.motion.xrel, event.motion.yrel);
            }
        }

        handleKeyboard();
        render();

        frameTime = SDL_GetTicks() - frameStart;

        // Delay if necessary to achieve the target FPS
        if (frameTime < frameDelay)
            SDL_Delay(frameDelay - frameTime);

        updateWindowTitle(frameTime);
    }

    cleanup();

    return 0;
}
