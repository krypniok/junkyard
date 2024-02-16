#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <GLFW/glfw3.h>

#include "glftRenderString.h"

void processInput(GLFWwindow *window) {
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
}

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
}

int main() {
    if (!glfwInit()) {
        printf("Failed to initialize GLFW\n");
        return -1;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);

    GLFWwindow* window = glfwCreateWindow(800, 600, "glftTest 0.1", NULL, NULL);
    if (window == NULL) {
        printf("Failed to create GLFW window\n");
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glEnable(GL_TEXTURE_2D);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    glftFont* dejavu = glftLoadFont("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 12);
    glftSetCurrentFont(dejavu);

     while (!glfwWindowShouldClose(window)) {
        processInput(window);

        glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        glClear(GL_COLOR_BUFFER_BIT);
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);

        int win_width, win_height;
        glfwGetFramebufferSize(window, &win_width, &win_height);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(0, win_width, 0, win_height, -1, 1);
        glMatrixMode(GL_MODELVIEW);


        glLoadIdentity(); // Zurücksetzen der Modelview-Matrix

        glPushMatrix(); // Speichern der aktuellen Matrix
        glLoadIdentity(); // Zurücksetzen der Texturmatrix


        glColor3f(1.0f, 1.0f, 1.0f);
        glftRenderText("This is sample text", 25.0f, 575.0f, 1.0f, 1, 1, 1);
   
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
