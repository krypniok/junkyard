#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <GL/gl.h>
#include <GL/glx.h>

#define WIDTH 800
#define HEIGHT 600

Display *display;
Window window;
GLXContext glContext;

void drawTriangle() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
    glTranslatef(0.0f, 0.0f, -5.0f);
    glRotatef(0.5f, 1.0f, 1.0f, 1.0f);
    
    glBegin(GL_TRIANGLES);
    glColor3f(1.0f, 0.0f, 0.0f);
    glVertex3f(0.0f, 1.0f, 0.0f);
    glColor3f(0.0f, 1.0f, 0.0f);
    glVertex3f(-1.0f, -1.0f, 0.0f);
    glColor3f(0.0f, 0.0f, 1.0f);
    glVertex3f(1.0f, -1.0f, 0.0f);
    glEnd();
    
    glXSwapBuffers(display, window);
}

int main() {
    display = XOpenDisplay(NULL);
    if (!display) {
        fprintf(stderr, "Error: Unable to open X display\n");
        return 1;
    }
    
    Window root = DefaultRootWindow(display);
    
    XVisualInfo *visualInfo;
    int attributes[] = {GLX_RGBA, GLX_DEPTH_SIZE, 24, GLX_DOUBLEBUFFER, None};
    visualInfo = glXChooseVisual(display, 0, attributes);
    if (!visualInfo) {
        fprintf(stderr, "Error: Unable to get visual\n");
        return 1;
    }
    
    XSetWindowAttributes windowAttributes;
    windowAttributes.colormap = XCreateColormap(display, root, visualInfo->visual, AllocNone);
    windowAttributes.event_mask = ExposureMask | KeyPressMask;
    
    window = XCreateWindow(display, root, 0, 0, WIDTH, HEIGHT, 0, visualInfo->depth, InputOutput,
                           visualInfo->visual, CWColormap | CWEventMask, &windowAttributes);
    
    XMapWindow(display, window);
    XStoreName(display, window, "Plain C X11 OpenGL Application");
    
    glContext = glXCreateContext(display, visualInfo, NULL, GL_TRUE);
    glXMakeCurrent(display, window, glContext);
    
    glEnable(GL_DEPTH_TEST);
    
    XEvent event;
    while (1) {
        XNextEvent(display, &event);
        if (event.type == Expose) {
            drawTriangle();
        } else if (event.type == KeyPress) {
            break;
        }
    }
    
    glXMakeCurrent(display, None, NULL);
    glXDestroyContext(display, glContext);
    XDestroyWindow(display, window);
    XCloseDisplay(display);
    
    return 0;
}
