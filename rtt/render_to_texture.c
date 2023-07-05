/*

    Done with OpenAI
    
*/

#include <GL/glew.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>

const int WINDOW_WIDTH = 800;
const int WINDOW_HEIGHT = 600;

GLuint frameBuffer;
GLuint texture;
GLuint depthBuffer;

float rotationAngle = 0.0f;
float colorOffset = 0.0f;


void createFramebuffer()
{
    // Create framebuffer
    glGenFramebuffers(1, &frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);

    // Create texture
    glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, WINDOW_WIDTH, WINDOW_HEIGHT, 0, GL_RGB, GL_UNSIGNED_BYTE, NULL);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    // Attach texture to framebuffer
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, 0);

    // Create depth buffer
    glGenRenderbuffers(1, &depthBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, depthBuffer);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT, WINDOW_WIDTH, WINDOW_HEIGHT);

    // Attach depth buffer to framebuffer
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depthBuffer);

    // Check framebuffer status
    GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
    if (status != GL_FRAMEBUFFER_COMPLETE) {
        printf("Framebuffer creation failed\n");
        // Handle error
    }

    // Unbind framebuffer
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}

void destroyFramebuffer()
{
    glDeleteFramebuffers(1, &frameBuffer);
    glDeleteTextures(1, &texture);
    glDeleteRenderbuffers(1, &depthBuffer);
}

void renderTriangleToTexture()
{
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
    glViewport(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);

    // Render the triangle to the texture
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0f, (GLfloat)WINDOW_WIDTH / (GLfloat)WINDOW_HEIGHT, 0.1f, 100.0f);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0f, 0.0f, -5.0f);
    glRotatef(rotationAngle, 0.0f, 1.0f, 0.0f);

    glBegin(GL_TRIANGLES);
    glColor3f((1.0f + sin(colorOffset)) / 2.0f, (1.0f + sin(colorOffset + 2.0f * 3.14159f / 3.0f)) / 2.0f, (1.0f + sin(colorOffset + 4.0f * 3.14159f / 3.0f)) / 2.0f);
    glVertex3f(-0.5f, -0.5f, 0.0f);
    glColor3f((1.0f + sin(colorOffset + 3.14159f / 3.0f)) / 2.0f, (1.0f + sin(colorOffset + 5.0f * 3.14159f / 3.0f)) / 2.0f, (1.0f + sin(colorOffset + 3.0f * 3.14159f / 3.0f)) / 2.0f);
    glVertex3f(0.5f, -0.5f, 0.0f);
    glColor3f((1.0f + sin(colorOffset + 5.0f * 3.14159f / 3.0f)) / 2.0f, (1.0f + sin(colorOffset + 3.14159f / 3.0f)) / 2.0f, (1.0f + sin(colorOffset + 5.0f * 3.14159f / 3.0f)) / 2.0f);
    glVertex3f(0.0f, 0.5f, 0.0f);
    glEnd();

    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glViewport(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
}

void renderTexturedQuad()
{
    // Render the textured quad to the screen
    glClearColor(0.2f, 0.2f, 0.2f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, texture);

    glBegin(GL_QUADS);
    glTexCoord2f(0.0f, 0.0f);
    glVertex2f(-0.5f, -0.5f);
    glTexCoord2f(1.0f, 0.0f);
    glVertex2f(0.5f, -0.5f);
    glTexCoord2f(1.0f, 1.0f);
    glVertex2f(0.5f, 0.5f);
    glTexCoord2f(0.0f, 1.0f);
    glVertex2f(-0.5f, 0.5f);
    glEnd();

    glDisable(GL_TEXTURE_2D);
}

int main(int argc, char* argv[])
{
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window* window = SDL_CreateWindow("OpenGL Program", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_OPENGL);
    SDL_GL_CreateContext(window);

    GLenum err = glewInit();
    if (err != GLEW_OK) {
        printf("GLEW initialization failed: %s\n", glewGetErrorString(err));
        return 1;
    }

    createFramebuffer();

    while (1) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT || (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_ESCAPE)) {
                goto cleanup;
            }
        }

        rotationAngle += 1.0f;
        colorOffset += 0.1f;

        renderTriangleToTexture();
        renderTexturedQuad();

        SDL_GL_SwapWindow(window);
    }

cleanup:
    destroyFramebuffer();
    SDL_GL_DeleteContext(window);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
