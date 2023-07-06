#include <X11/Xlib.h>
#include <X11/Xatom.h>
#include <X11/keysym.h>

#include <GL/glew.h>
#include <GL/gl.h>
#include <GL/glx.h>
#include <GL/glut.h>

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

Atom getAtom(Display* display, const char* atomName)
{
    Atom atom = XInternAtom(display, atomName, False);
    if (atom == None)
    {
        fprintf(stderr, "Failed to retrieve atom: %s\n", atomName);
        exit(1);
    }
    return atom;
}

void setWindowType(Display* display, Window window, Atom windowTypeAtom)
{
    Atom atomList[1] = { windowTypeAtom };
    XChangeProperty(display, window, XInternAtom(display, "_NET_WM_WINDOW_TYPE", True),
                    XA_ATOM, 32, PropModeReplace, (unsigned char*)atomList, 1);
}

typedef struct {
    float x;
    float y;
    float size;
    float r;
    float g;
    float b;
} Point;


Point interpolate(const Point* p1, const Point* p2, float t) {
    Point interpolatedPoint;
    interpolatedPoint.x = p1->x + (p2->x - p1->x) * t;
    interpolatedPoint.y = p1->y + (p2->y - p1->y) * t;
    interpolatedPoint.size = p1->size + (p2->size - p1->size) * t;
    interpolatedPoint.r = p1->r + (p2->r - p1->r) * t;
    interpolatedPoint.g = p1->g + (p2->g - p1->g) * t;
    interpolatedPoint.b = p1->b + (p2->b - p1->b) * t;
    return interpolatedPoint;
}


GLuint createShaderProgram() {
const char* vertexShaderSource = "#version 330 core\n"
                                 "uniform float pointSize;\n"
                                 "layout(location = 0) in vec2 position;\n"
                                 "void main()\n"
                                 "{\n"
                                 "    gl_Position = vec4(position, 0.0, 1.0);\n"
                                 "    gl_PointSize = pointSize;\n"
                                 "}\n";

    const char* fragmentShaderSource = "#version 330 core\n"
                                       "uniform vec3 color;\n"
                                       "out vec4 FragColor;\n"
                                       "void main()\n"
                                       "{\n"
                                       "    FragColor = vec4(color, 1.0);\n"
                                       "}\n";

    GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
    glCompileShader(vertexShader);

    GLint success;
    glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &success);
    if (!success) {
        char infoLog[512];
        glGetShaderInfoLog(vertexShader, 512, NULL, infoLog);
        fprintf(stderr, "Vertex shader compilation failed:\n%s\n", infoLog);
        return 0;
    }

    GLuint fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
    glCompileShader(fragmentShader);

    glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &success);
    if (!success) {
        char infoLog[512];
        glGetShaderInfoLog(fragmentShader, 512, NULL, infoLog);
        fprintf(stderr, "Fragment shader compilation failed:\n%s\n", infoLog);
        return 0;
    }

    GLuint shaderProgram = glCreateProgram();
    glAttachShader(shaderProgram, vertexShader);
    glAttachShader(shaderProgram, fragmentShader);
    glLinkProgram(shaderProgram);

    glGetProgramiv(shaderProgram, GL_LINK_STATUS, &success);
    if (!success) {
        char infoLog[512];
        glGetProgramInfoLog(shaderProgram, 512, NULL, infoLog);
        fprintf(stderr, "Shader program linking failed:\n%s\n", infoLog);
        return 0;
    }

    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);

    return shaderProgram;
}

void drawLine(const Point* p1, const Point* p2, GLuint shaderProgram) {
    Point interpolatedPoint;
    float t = 0.0f;

    while (t <= 1.0f) {
        interpolatedPoint = interpolate(p1, p2, t);

        glUseProgram(shaderProgram);
        GLint colorLocation = glGetUniformLocation(shaderProgram, "color");
        glUniform3f(colorLocation, interpolatedPoint.r, interpolatedPoint.g, interpolatedPoint.b);

float desiredPointSize = interpolatedPoint.size; // Set the desired point size here
GLint pointSizeLocation = glGetUniformLocation(shaderProgram, "pointSize");
glUseProgram(shaderProgram);
glUniform1f(pointSizeLocation, desiredPointSize);

        glBegin(GL_POINTS);
        glColor3f(interpolatedPoint.r, interpolatedPoint.g, interpolatedPoint.b);
        glVertex2f(interpolatedPoint.x, interpolatedPoint.y);
        glEnd();

        t += 0.001f;
    }
}

int main(int argc, char* argv[])
{
    Display* display = XOpenDisplay(0);
    const char* xserver = getenv("DISPLAY");

    if (display == 0)
    {
        printf("Could not establish a connection to X-server '%s'\n", xserver);
        exit(1);
    }

    XVisualInfo visualinfo;
    XMatchVisualInfo(display, DefaultScreen(display), 32, TrueColor, &visualinfo);

    Window win;
    GC gc;
    XSetWindowAttributes attr;
    attr.colormap = XCreateColormap(display, DefaultRootWindow(display), visualinfo.visual, AllocNone);
    attr.event_mask = ExposureMask | KeyPressMask;
    attr.background_pixmap = None;
    attr.border_pixel = 0;
    win = XCreateWindow(display, DefaultRootWindow(display),
                        0, 0, 800, 600,
                        0,
                        visualinfo.depth,
                        InputOutput,
                        visualinfo.visual,
                        CWColormap | CWEventMask | CWBackPixmap | CWBorderPixel,
                        &attr);
    gc = XCreateGC(display, win, 0, 0);

    Atom windowTypeAtom = getAtom(display, "_NET_WM_WINDOW_TYPE_DOCK");
    setWindowType(display, win, windowTypeAtom);

    XSizeHints sizehints;
    sizehints.flags = PPosition | PSize;
    sizehints.x = 0;
    sizehints.y = 0;
    sizehints.width = 800;
    sizehints.height = 600;
    XSetWMNormalHints(display, win, &sizehints);
    Atom wm_delete_window = XInternAtom(display, "WM_DELETE_WINDOW", 0);
    XSetWMProtocols(display, win, &wm_delete_window, 1);

    GLXContext glcontext = glXCreateContext(display, &visualinfo, 0, True);
    if (!glcontext)
    {
        printf("X11 server '%s' does not support OpenGL\n", xserver);
        exit(1);
    }
    glXMakeCurrent(display, win, glcontext);

    // Initialize GLEW after creating the OpenGL context
    GLenum glewError = glewInit();
    if (glewError != GLEW_OK)
    {
        printf("GLEW initialization failed: %s\n", glewGetErrorString(glewError));
        exit(1);
    }

    XMapWindow(display, win);

    int isUserWantsWindowToClose = 0;

    GLuint shaderProgram = createShaderProgram();
    glEnable(GL_VERTEX_PROGRAM_POINT_SIZE);
    
    while (!isUserWantsWindowToClose)
    {
        int isRedraw = 0;

        while (XPending(display) > 0)
        {
            XEvent event;
            XNextEvent(display, &event);

            switch (event.type)
            {
                case ClientMessage:
                    if (event.xclient.message_type == XInternAtom(display, "WM_PROTOCOLS", 1) &&
                        event.xclient.data.l[0] == XInternAtom(display, "WM_DELETE_WINDOW", 1))
                    {
                        isUserWantsWindowToClose = 1;
                    }
                    break;
                case KeyPress:
                    if (XLookupKeysym(&event.xkey, 0) == XK_Escape)
                    {
                        isUserWantsWindowToClose = 1;
                    }
                    break;
                case Expose:
                    isRedraw = 1;
                    break;
                default:
                    break;
            }
        }

        if (isRedraw)
        {
            glViewport(0, 0, 800, 600);
            glClearColor(0.0, 0.0, 0.0, 0.5);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            gluPerspective(45.0f, (float)256 / 256, 1.0f, 100.0f);

            glMatrixMode(GL_MODELVIEW);
            glLoadIdentity();
            gluLookAt(0.0f, 0.0f, 5.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f);

            glPushMatrix();

            Point p1 = { -1.0f, -1.0f, .5f, 1.0f, 0.0f, 0.0f };
            Point p2 = { 1.0f, 1.0f, 3.0f, 0.0f, 0.0f, 1.0f };

            drawLine(&p1, &p2, shaderProgram);

            glPopMatrix();

            glXSwapBuffers(display, win);
            isRedraw = 0;
        }
    }

    glXMakeCurrent(display, None, NULL);
    glXDestroyContext(display, glcontext);
    XDestroyWindow(display, win);
    XCloseDisplay(display);

    return 0;
}

