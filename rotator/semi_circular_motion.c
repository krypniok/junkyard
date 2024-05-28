#include <GL/glut.h>
#include <SDL2/SDL.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define WINDOW_TITLE "Semi-Circular Motion: Illustrating Fleeforce-Polarisation"

#define WINDOW_WIDTH 640
#define WINDOW_HEIGHT 480
#define M_PI_180 (M_PI / 180.0)

float mass_x = 0;
float mass_y = 0;
float mass_d = 1.0;

float null_x = -128;
float null_y = 0;
float null_a = 0;

bool clear = true;

void drawCircle(float cx, float cy, float r, int num_segments) {
    glBegin(GL_LINE_LOOP);
    for (int i = 0; i < num_segments; i++) {
        float theta = 2.0f * M_PI * (float)i / (float)num_segments;
        float x = r * cosf(theta);
        float y = r * sinf(theta);
        glVertex2f(x + cx, y + cy);
    }
    glEnd();
}

void drawFilledCircle(float cx, float cy, float r, int num_segments) {
    glBegin(GL_TRIANGLE_FAN);
    glVertex2f(cx, cy);
    for (int i = 0; i <= num_segments; i++) {
        float theta = 2.0f * M_PI * (float)i / (float)num_segments;
        float x = r * cosf(theta);
        float y = r * sinf(theta);
        glVertex2f(x + cx, y + cy);
    }
    glEnd();
}

void rotate_point(float cx, float cy, float angle, float *px, float *py) {
    float s = sin(angle * M_PI_180);
    float c = cos(angle * M_PI_180);

    float x = *px - cx;
    float y = *py - cy;

    *px = x * c - y * s + cx;
    *py = x * s + y * c + cy;
}

void fliehkraftvektor(float x, float y, float x0, float y0, float m, float v, float *Fx, float *Fy) {
    float r = sqrt((x - x0) * (x - x0) + (y - y0) * (y - y0));
    if (r < 1) r = 1;
    float w = v / r;
    *Fx = -m * w * w * (x - x0);
    *Fy = -m * w * w * (y - y0);
}

void movemass() {
    mass_x += mass_d;
    if (mass_x <= -112 || mass_x >= 112) {
        mass_d = -mass_d;
    }
}

void display() {
    if (clear) {
        glClearColor(1.0, 1.0, 1.0, 1.0);
        glClear(GL_COLOR_BUFFER_BIT);
    }

    glColor3f(0.0, 0.0, 0.0);
    drawCircle(320, 240, 128, 100);

    glColor3f(0.5, 0.5, 0.5);
   // drawFilledCircle(320 + mass_x, 240 + mass_y, 16, 100);

    float px = 320 + mass_x;
    float py = 240 + mass_y;

    float angle;
    if (mass_x < 0) {
        angle = (fabs(mass_x) / 224.0) * 180.0;
    } else {
        angle = (-fabs(mass_x) / 224.0) * 180.0;
    }

    if (mass_d < 0) {
        rotate_point(320, 240, angle, &px, &py);
    } else {
        rotate_point(320, 240, 180 - angle, &px, &py);
    }

    glColor3f(0.5, 0.5, 0.5);
    drawFilledCircle(px, py, 16, 100);

    float x = px - 320;
    float y = py - 240;
    float x0 = 0.0;
    float y0 = -32.0;
    float m = 60.0;
    float v = 1.0;
    float Fx = 0;
    float Fy = 0;
    fliehkraftvektor(x, y, x0, y0, m, v, &Fx, &Fy);
/*
    glColor3f(0.25, 0.25, 1.0);
    glBegin(GL_LINES);
    glVertex2f(px, py);
    glVertex2f(320 + mass_x, 240 + mass_y);
    glEnd();
*/
    // Draw the centrifugal force vector (added code)
    glColor3f(1.0, 0.0, 0.0);  // Set color to red
    glBegin(GL_LINES);
    glVertex2f(px, py);  // Start of the vector
    glVertex2f(px + (Fx * 100), py + (Fy * 100));  // End of the vector (scaled for visibility)
    //printf("%f:%f\n", Fx, Fy);    
glEnd();

    px = 320 + null_x;
    py = 240 + null_y;
    null_a = fabs((360.0 / 448.0) * fabs(mass_x));

    if (mass_x < 0) {
        if (mass_d < 0)
            rotate_point(320, 240, null_a, &px, &py);
        else
            rotate_point(320, 240, 90 + fabs(90 - null_a), &px, &py);
    } else {
        if (mass_d > 0)
            rotate_point(320, 240, 180 + fabs(null_a), &px, &py);
        else
            rotate_point(320, 240, 270 + 90 - fabs(null_a), &px, &py);
    }

    glColor3f(1.0, 0.25, 0.25);
    drawFilledCircle(px, py, 8, 100);

    px = -(px - 320) + 320;
    py = -(py - 240) + 240;

    glColor3f(0.25, 1.0, 0.25);
    drawFilledCircle(px, py, 8, 100);

    movemass();

    glutSwapBuffers();
}

void timer(int value) {
    glutPostRedisplay();
    glutTimerFunc(5, timer, 0);
}

void keyboard(unsigned char key, int x, int y) {
    switch (key) {
        case 27:  // ESC key
            exit(0);
            break;
        case ' ':
           // mass_d = 0;
            break;
        case '1':
            clear = !clear;
            break;
    }
}

int main(int argc, char **argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(WINDOW_WIDTH, WINDOW_HEIGHT);
    glutCreateWindow(WINDOW_TITLE);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, WINDOW_WIDTH, WINDOW_HEIGHT, 0);

    glutDisplayFunc(display);
    glutKeyboardFunc(keyboard);
    glutTimerFunc(5, timer, 0);

    glutMainLoop();
    return 0;
}

