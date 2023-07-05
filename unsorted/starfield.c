#include <stdio.h>
#include <stdlib.h>
#include <GL/glew.h>
#include <GL/gl.h>
#include <SDL2/SDL.h>
#include <math.h>

#define MAX_POINTS 1000

typedef struct {
    int x;
    int y;
} Point;

Point points[MAX_POINTS];
int numPoints = 0;

void bresenhamLine(int x0, int y0, int x1, int y1) {
    // Bresenham's Line Algorithm
    int dx = abs(x1 - x0);
    int dy = abs(y1 - y0);
    int sx = (x0 < x1) ? 1 : -1;
    int sy = (y0 < y1) ? 1 : -1;
    int err = dx - dy;

    while (1) {
        // Save the point coordinates
        if (numPoints < MAX_POINTS) {
            points[numPoints].x = x0;
            points[numPoints].y = y0;
            numPoints++;
        }

        // Check if we reached the end point
        if (x0 == x1 && y0 == y1) break;

        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x0 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y0 += sy;
        }
    }
}

void drawPoints(SDL_Window* window) {
    // Set up OpenGL
    glViewport(0, 0, 800, 600);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, 800, 600, 0, 1, -1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    // Set clear color
    glClearColor(0.0, 0.0, 0.0, 1.0);

    // Clear the buffer
    glClear(GL_COLOR_BUFFER_BIT);

    // Enable programmable point size
    glEnable(GL_PROGRAM_POINT_SIZE);

    // Compile and link shaders
    const char* vertexShaderSource = "#version 330 core\n"
                                     "void main() { gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex; }";

    const char* fragmentShaderSource = "#version 330 core\n"
                                       "out vec4 fragColor; \n"
                                       "void main() { fragColor = vec4(1.0); }";

    GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);
    GLuint fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);

    glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
    glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);

    glCompileShader(vertexShader);
    glCompileShader(fragmentShader);

    GLuint shaderProgram = glCreateProgram();
    glAttachShader(shaderProgram, vertexShader);
    glAttachShader(shaderProgram, fragmentShader);

    glLinkProgram(shaderProgram);
    glUseProgram(shaderProgram);

    // Calculate the distance between endpoints
    int dx = points[numPoints - 1].x - points[0].x;
    int dy = points[numPoints - 1].y - points[0].y;
    float distance = sqrt(dx * dx + dy * dy);

    // Draw points as GL_POINTS with interpolated point size
    glBegin(GL_POINTS);
    for (int i = 0; i < numPoints; i++) {
        // Calculate the interpolation factor based on the point's distance from the start
        float interpolationFactor = sqrt((points[i].x - points[0].x) * (points[i].x - points[0].x) +
                                          (points[i].y - points[0].y) * (points[i].y - points[0].y)) /
                                    distance;
        // Interpolate the point size between 1.0 and 10.0 based on the interpolation factor
        float pointSize = 1.0 + interpolationFactor * 9.0;
        glPointSize(pointSize);
        glVertex2i(points[i].x, points[i].y);
    }
    glEnd();

    // Swap the buffers
    SDL_GL_SwapWindow(window);

    // Clean up
    glDeleteProgram(shaderProgram);
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);
}

int main() {
    // Initialize SDL
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window* window = SDL_CreateWindow("Bresenham Line", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 800, 600, SDL_WINDOW_OPENGL);
    SDL_GL_CreateContext(window);

    // Initialize GLEW
    glewExperimental = GL_TRUE;
    glewInit();

    // Main loop
    int running = 1;
    SDL_Event event;
    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
                break;
            }
        }

        // Bresenham's Line Algorithm
        numPoints = 0; // Reset the point count for each iteration
        bresenhamLine(100, 100, 700, 500);

        // Draw the points
        drawPoints(window);
    }

    // Clean up
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
