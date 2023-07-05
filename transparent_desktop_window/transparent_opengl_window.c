#include <X11/Xlib.h>
#include <X11/Xatom.h>
#include <X11/keysym.h>

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

void drawSoccerBall()
{
    static GLUquadricObj* sphere = NULL;
    if (sphere == NULL)
    {
        sphere = gluNewQuadric();
        gluQuadricNormals(sphere, GLU_SMOOTH);
    }

    glColor3f(1.0, 1.0, 1.0);
    gluSphere(sphere, 0.5, 32, 32);
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
                        0, 0, 256, 256,
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
    sizehints.width = 256;
    sizehints.height = 256;
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

    XMapWindow(display, win);

    int isUserWantsWindowToClose = 0;

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

        glClearColor(0.0, 0.0, 0.0, 0.5);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

        glEnable(GL_DEPTH_TEST);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluPerspective(45.0, 1.0, 0.1, 10.0);
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        glTranslatef(0.0, 0.0, -2.5);
        static float angle = 0.0;
        glRotatef(angle, 0.0, 1.0, 0.0);
        drawSoccerBall();
        angle += 1.0;

        if (isRedraw)
        {
            XDrawString(display, win, gc, 10, 20, "Hello!", 6);
        }

        glXSwapBuffers(display, win);
        glXWaitGL();
    }

    XDestroyWindow(display, win);
    win = 0;
    XCloseDisplay(display);
    display = 0;

    return 0;
}
