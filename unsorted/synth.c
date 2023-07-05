#include <GL/glew.h>
#include <GL/gl.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>

#define WIDTH 800
#define HEIGHT 600

// Function dispatcher to call glGetError after each OpenGL function
#define GL_CHECK(func) \
    func; \
    { \
        GLenum err = glGetError(); \
        if (err != GL_NO_ERROR) { \
            printf("OpenGL error: %d in " #func ":%i\n", err, __LINE__); \
        } \
    }

SDL_Window* window;
SDL_GLContext glContext;
GLuint textureID;
GLuint framebufferID;
GLuint triangleVBO;
GLuint quadVBO;

void generateTexture();

typedef struct {
    GLfloat position[2];
    GLfloat color[4];
} Vertex;

void initSDL()
{
    SDL_Init(SDL_INIT_VIDEO);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);

    window = SDL_CreateWindow("Texture Example", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                              WIDTH, HEIGHT, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);
    if (!window)
    {
        fprintf(stderr, "Failed to create SDL window\n");
        exit(1);
    }

    glContext = SDL_GL_CreateContext(window);
    if (!glContext)
    {
        fprintf(stderr, "Failed to create OpenGL context\n");
        exit(1);
    }

    glewExperimental = GL_TRUE;
    GLenum glewInitResult = glewInit();
    if (glewInitResult != GLEW_OK)
    {
        fprintf(stderr, "Failed to initialize GLEW: %s\n", glewGetErrorString(glewInitResult));
        exit(1);
    }

    // Enable texturing
    glEnable(GL_TEXTURE_2D);

    // Generate and bind the texture
    generateTexture();
    glBindTexture(GL_TEXTURE_2D, textureID);

    SDL_GL_SetSwapInterval(1);
}

void generateTexture()
{
    const int textureSize = 256;
    GLubyte pixels[textureSize * textureSize * 4]; // RGBA format

    // Fill texture with empty color (black with alpha 0)
    memset(pixels, 0, sizeof(pixels));

    GL_CHECK(glGenTextures(1, &textureID));
    GL_CHECK(glBindTexture(GL_TEXTURE_2D, textureID));

    GL_CHECK(glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, textureSize, textureSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, pixels));

    GL_CHECK(glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR));
    GL_CHECK(glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR));
}

void setupFramebuffer()
{
    GL_CHECK(glGenFramebuffers(1, &framebufferID));
    GL_CHECK(glBindFramebuffer(GL_FRAMEBUFFER, framebufferID));
    GL_CHECK(glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, textureID, 0));

    GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
    if (status != GL_FRAMEBUFFER_COMPLETE)
    {
        fprintf(stderr, "Failed to set up framebuffer\n");
        exit(1);
    }

    GL_CHECK(glBindFramebuffer(GL_FRAMEBUFFER, 0));
}

void setupTriangle()
{
    Vertex vertices[] = {
        {{-50.0f, -50.0f}, {1.0f, 0.0f, 0.0f, 1.0f}},   // Red vertex with alpha 1
        {{50.0f, -50.0f}, {0.0f, 1.0f, 0.0f, 1.0f}},    // Green vertex with alpha 1
        {{0.0f, 50.0f}, {0.0f, 0.0f, 1.0f, 1.0f}}       // Blue vertex with alpha 1
    };

    GL_CHECK(glGenBuffers(1, &triangleVBO));
    GL_CHECK(glBindBuffer(GL_ARRAY_BUFFER, triangleVBO));
    GL_CHECK(glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW));
}

void setupQuad()
{
    Vertex vertices[] = {
        {{-100.0f, -100.0f}, {1.0f, 1.0f, 1.0f, 1.0f}}, // White vertex with alpha 1
        {{100.0f, -100.0f}, {1.0f, 1.0f, 1.0f, 1.0f}},  // White vertex with alpha 1
        {{100.0f, 100.0f}, {1.0f, 1.0f, 1.0f, 1.0f}},   // White vertex with alpha 1
        {{-100.0f, 100.0f}, {1.0f, 1.0f, 1.0f, 1.0f}}   // White vertex with alpha 1
    };

    GL_CHECK(glGenBuffers(1, &quadVBO));
    GL_CHECK(glBindBuffer(GL_ARRAY_BUFFER, quadVBO));
    GL_CHECK(glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW));
}

void render()
{
    static float angle = 0.0f;
    angle += 1.0f;

    // Render rotating triangle to texture
    GL_CHECK(glBindFramebuffer(GL_FRAMEBUFFER, framebufferID));
    GL_CHECK(glViewport(0, 0, 256, 256)); // Set the viewport to match the texture size

    GL_CHECK(glMatrixMode(GL_PROJECTION));
    GL_CHECK(glLoadIdentity());
    GL_CHECK(glOrtho(0, 256, 256, 0, -1, 1));

    GL_CHECK(glMatrixMode(GL_MODELVIEW));
    GL_CHECK(glLoadIdentity());

    GL_CHECK(glClearColor(0.0f, 0.0f, 0.0f, 1.0f));
    GL_CHECK(glClear(GL_COLOR_BUFFER_BIT));

    GL_CHECK(glTranslatef(128, 128, 0)); // Translate to the center of the texture
    GL_CHECK(glRotatef(angle, 0, 0, 1));

    GL_CHECK(glEnableVertexAttribArray(0));
    GL_CHECK(glEnableVertexAttribArray(1));
    GL_CHECK(glBindBuffer(GL_ARRAY_BUFFER, triangleVBO));
    GL_CHECK(glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)offsetof(Vertex, position)));
    GL_CHECK(glVertexAttribPointer(1, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)offsetof(Vertex, color)));

    GL_CHECK(glDrawArrays(GL_TRIANGLES, 0, 3));

    GL_CHECK(glDisableVertexAttribArray(0));
    GL_CHECK(glDisableVertexAttribArray(1));
    GL_CHECK(glBindFramebuffer(GL_FRAMEBUFFER, 0));

    // Render quad with the texture
    GL_CHECK(glViewport(0, 0, WIDTH, HEIGHT));

    GL_CHECK(glMatrixMode(GL_PROJECTION));
    GL_CHECK(glLoadIdentity());
    GL_CHECK(glOrtho(0, WIDTH, HEIGHT, 0, -1, 1));

    GL_CHECK(glMatrixMode(GL_MODELVIEW));
    GL_CHECK(glLoadIdentity());

    GL_CHECK(glClearColor(0.0f, 0.0f, 0.0f, 1.0f));
    GL_CHECK(glClear(GL_COLOR_BUFFER_BIT));

    GL_CHECK(glEnableVertexAttribArray(0));
    GL_CHECK(glEnableVertexAttribArray(1));
    GL_CHECK(glBindBuffer(GL_ARRAY_BUFFER, quadVBO));
    GL_CHECK(glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)offsetof(Vertex, position)));
    GL_CHECK(glVertexAttribPointer(1, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)offsetof(Vertex, color)));

    GL_CHECK(glDrawArrays(GL_QUADS, 0, 4));

    GL_CHECK(glDisableVertexAttribArray(0));
    GL_CHECK(glDisableVertexAttribArray(1));

    // Swap the buffers to display the rendered image
    SDL_GL_SwapWindow(window);
}

void cleanup()
{
    GL_CHECK(glDeleteTextures(1, &textureID));
    GL_CHECK(glDeleteFramebuffers(1, &framebufferID));
    GL_CHECK(glDeleteBuffers(1, &triangleVBO));
    GL_CHECK(glDeleteBuffers(1, &quadVBO));

    SDL_GL_DeleteContext(glContext);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

int main()
{
    initSDL();
    generateTexture();
    setupFramebuffer();
    setupTriangle();
    setupQuad();

    while (1)
    {
        SDL_Event event;
        while (SDL_PollEvent(&event))
        {
            if (event.type == SDL_QUIT)
                goto quit;
        }

        glBegin(GL_LINES);
            glColor3f(1, 1, 1);
            glVertex2f(0.0, 0.0);
            glColor3f(0.25, 0.5, 1);
            glVertex2f(100.0, 100.0);
        glEnd();

        // Enable texturing and bind the texture before rendering
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, textureID);

        render();
    }

quit:
    // Print SDL version
    SDL_version sdlVersion;
    SDL_GetVersion(&sdlVersion);
    printf("SDL version: %d.%d.%d\n", sdlVersion.major, sdlVersion.minor, sdlVersion.patch);

    // Print OpenGL version
    const GLubyte* glVersion = glGetString(GL_VERSION);
    printf("OpenGL version: %s\n", glVersion);

    // Print GLEW version
    printf("GLEW version: %s\n", glewGetString(GLEW_VERSION));

    cleanup();

    return 0;
}
