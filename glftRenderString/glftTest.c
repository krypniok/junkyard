#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include <GLFW/glfw3.h>

#include "glftRenderString.h"

void processInput(GLFWwindow *window) {
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
}

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
}

void drawLine() {
    glLoadIdentity();
    glColor3f(1, 1, 1);
    glBegin(GL_LINES);
    glVertex2f(10.0f, 10.0f);
    glVertex2f(790.0f, 590.0f);
    glEnd();
}

void gluiRenderRect() {
    glLoadIdentity();
    glColor3f(1, 0, 0);
    glDisable(GL_TEXTURE_2D);
    glBegin(GL_QUADS);
    glVertex2f(10.0f, 10.0f);
    glVertex2f(790.0f, 10.0f);
    glVertex2f(790.0f, 590.0f);
    glVertex2f(10.0f, 590.0f);
    glEnd();
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

   // glEnable(GL_CULL_FACE);
   // glEnable(GL_BLEND);
   // glEnable(GL_TEXTURE_2D);
   // glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    glftFont* dejavu = glftLoadFont("Arial.ttf", 16);
    glftSetCurrentFont(dejavu);

     while (!glfwWindowShouldClose(window)) {
        processInput(window);

        glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        glClear(GL_COLOR_BUFFER_BIT);
       // glEnable(GL_TEXTURE_2D);
      //  glEnable(GL_BLEND);

        int win_width, win_height;
        glfwGetFramebufferSize(window, &win_width, &win_height);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        //glOrtho(0, 800, 0, 600, 0, 1);
        glOrtho(0, 800, 600, 0, 0, 1);

        glMatrixMode(GL_MODELVIEW);

        const char *asciiString = " !\"#$%&'()*+,-./0123456789:;<=>?@"
                              "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`"
                              "abcdefghijklmnopqrstuvwxyz{|}~\x7F";
 
        glftRenderText(asciiString, 0.0f, 0.0f, 1.0f, 255, 255, 255);
        glftRenderText(dejavu->font_name, 0.0f, 16.0f, 1.0f, 0, 255, 0);

       // gluiRenderRect();

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glftCleanup();
    glfwTerminate();
    return 0;
}
