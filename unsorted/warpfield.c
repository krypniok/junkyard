#include <SDL2/SDL.h>
#include <GL/glew.h>
#include <stdio.h>

// Screen dimensions
const int SCREEN_WIDTH = 800;
const int SCREEN_HEIGHT = 600;

// Starfield parameters
const int NUM_STARS = 1000;
const float STAR_SPEED = 0.01f;

// Star structure
typedef struct {
    float x, y, z;
} Star;

Star stars[1000];

// Shader program
GLuint shaderProgram;

SDL_Window* window;

// Vertex shader source code
const char* vertexShaderSource = "\
    attribute vec3 position; \
    void main() { \
        gl_Position = vec4(position, 1.0); \
    }";

// Fragment shader source code
const char* fragmentShaderSource = "\
    uniform vec2 iResolution; \
    uniform float iTime; \
    void mainImage(out vec4 fragColor, in vec2 fragCoord) { \
        // Normalized pixel coordinates (from 0 to 1) \
        vec2 uv = fragCoord / iResolution.xy; \
        // Time varying pixel color \
        vec3 col = 0.5 + 0.5 * cos(iTime + uv.xyx + vec3(0, 2, 4)); \
        // Output to screen \
        fragColor = vec4(col, 1.0); \
    } \
    void main() { \
        vec4 fragColor; \
        mainImage(fragColor, gl_FragCoord.xy); \
        gl_FragColor = fragColor; \
    }";


// Compile and link shaders
void compileShaders() {
    GLuint vertexShader, fragmentShader;
    GLint success;
    GLchar infoLog[512];
    
    // Create vertex shader
    vertexShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
    glCompileShader(vertexShader);
    
    // Check for vertex shader compile errors
    glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &success);
    if (!success) {
        glGetShaderInfoLog(vertexShader, 512, NULL, infoLog);
        printf("Vertex shader compilation failed: %s\n", infoLog);
    }
    
    // Create fragment shader
    fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
    glCompileShader(fragmentShader);
    
    // Check for fragment shader compile errors
    glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &success);
    if (!success) {
        glGetShaderInfoLog(fragmentShader, 512, NULL, infoLog);
        printf("Fragment shader compilation failed: %s\n", infoLog);
    }
    
    // Create shader program
    shaderProgram = glCreateProgram();
    glAttachShader(shaderProgram, vertexShader);
    glAttachShader(shaderProgram, fragmentShader);
    glLinkProgram(shaderProgram);
    
    // Check for shader program link errors
    glGetProgramiv(shaderProgram, GL_LINK_STATUS, &success);
    if (!success) {
        glGetProgramInfoLog(shaderProgram, 512, NULL, infoLog);
        printf("Shader program linking failed: %s\n", infoLog);
    }
    
    // Clean up shaders
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);
}

// Initialize the starfield
void initStarfield() {
    for (int i = 0; i < NUM_STARS; i++) {
        stars[i].x = 2.0f * ((float)rand() / RAND_MAX) - 1.0f;
        stars[i].y = 2.0f * ((float)rand() / RAND_MAX) - 1.0f;
        stars[i].z = ((float)rand() / RAND_MAX);
    }
}

// Update the starfield
void updateStarfield() {
    for (int i = 0; i < NUM_STARS; i++) {
        stars[i].z -= STAR_SPEED;
        if (stars[i].z <= 0.0f) {
            stars[i].x = 2.0f * ((float)rand() / RAND_MAX) - 1.0f;
            stars[i].y = 2.0f * ((float)rand() / RAND_MAX) - 1.0f;
            stars[i].z = 1.0f;
        }
    }
}

// Render the starfield
void renderStarfield() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glUseProgram(shaderProgram);
    
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, stars);
    
    glDrawArrays(GL_POINTS, 0, NUM_STARS);
    
    glDisableVertexAttribArray(0);
    
    SDL_GL_SwapWindow(window);
}

int main(int argc, char* argv[]) {
    // Initialize SDL
    SDL_Init(SDL_INIT_VIDEO);
    
    // Create SDL window
    window = SDL_CreateWindow("Warp Starfield", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL);
    
    // Create OpenGL context
    SDL_GLContext context = SDL_GL_CreateContext(window);
    
    // Initialize GLEW
    glewExperimental = GL_TRUE;
    glewInit();
    
    // Set viewport
    glViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    // Compile shaders
    compileShaders();
    
    // Initialize the starfield
    initStarfield();
    
    // Game loop
    SDL_Event event;
    int running = 1;
    while (running) {
        // Process events
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT)
                running = 0;
        }
        
        // Update and render the starfield
        updateStarfield();
        renderStarfield();
    }
    
    // Cleanup
    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(window);
    SDL_Quit();
    
    return 0;
}
