#include <GLFW/glfw3.h>
#include <math.h>
#include <stdio.h>

#define PI 3.14159265358979323846

void error_callback(int error, const char* description) {
    fprintf(stderr, "Error: %s\n", description);
}

void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
        glfwSetWindowShouldClose(window, GLFW_TRUE);
    }
}

void updateProjection(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
   // glOrtho(0.0, width, height, 0.0, 1.0, -1.0);  // Update der Orthografischen Projektionsmatrix
    glOrtho(0.0, 1, 1, 0.0, 1.0, -1.0);  // Update der Orthografischen Projektionsmatrix

    glMatrixMode(GL_MODELVIEW);
}

void drawRotatingTriangle() {
    static float angle = 0.0;

    glLoadIdentity();
    glRotatef(angle, 0.0f, 0.0f, 1.0f);

    glBegin(GL_TRIANGLES);
    glColor3f(1.0f, 0.0f, 0.0f);  // Red
    glVertex2f(0.0f, 0.6f);
    glVertex2f(-0.5f, -0.3f);
    glVertex2f(0.5f, -0.3f);
    glEnd();

    angle += 1.0;
    if (angle > 360.0) {
        angle -= 360.0;
    }
}

void drawLine() {
    glLoadIdentity();
    glColor3f(1, 1, 1);
    glBegin(GL_LINES);
    glVertex2f(0.0f, 0.0f);
    glVertex2f(1.0f, 1.0f);
    glEnd();
}

int main(void) {
    GLFWwindow* window;

    glfwSetErrorCallback(error_callback);

    if (!glfwInit()) {
        return -1;
    }

    window = glfwCreateWindow(800, 600, "Rotating Triangle", NULL, NULL);
    if (!window) {
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);
    glfwSetKeyCallback(window, key_callback);

    int width, height;
    glfwGetFramebufferSize(window, &width, &height);
    updateProjection(window, width, height);

    glEnable(GL_BLEND);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

    while (!glfwWindowShouldClose(window)) {
        glClear(GL_COLOR_BUFFER_BIT);

drawLine();
        drawRotatingTriangle();

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}

