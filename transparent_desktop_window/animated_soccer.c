/*

  ██████  ▒█████   ▄████▄   ▄████▄  ▓█████  ██▀███  
▒██    ▒ ▒██▒  ██▒▒██▀ ▀█  ▒██▀ ▀█  ▓█   ▀ ▓██ ▒ ██▒
░ ▓██▄   ▒██░  ██▒▒▓█    ▄ ▒▓█    ▄ ▒███   ▓██ ░▄█ ▒
  ▒   ██▒▒██   ██░▒▓▓▄ ▄██▒▒▓▓▄ ▄██▒▒▓█  ▄ ▒██▀▀█▄  
▒██████▒▒░ ████▓▒░▒ ▓███▀ ░▒ ▓███▀ ░░▒████▒░██▓ ▒██▒
▒ ▒▓▒ ▒ ░░ ▒░▒░▒░ ░ ░▒ ▒  ░░ ░▒ ▒  ░░░ ▒░ ░░ ▒▓ ░▒▓░
░ ░▒  ░ ░  ░ ▒ ▒░   ░  ▒     ░  ▒    ░ ░  ░  ░▒ ░ ▒░
░  ░  ░  ░ ░ ░ ▒  ░        ░           ░     ░░   ░ 
      ░      ░ ░  ░ ░      ░ ░         ░  ░   ░     
                  ░        ░                         

   Project Completed! You did it!         
                                        
                                          
   Your dedication and hard work have paid off.   
   Congratulations on completing the project!    
                                              
   Remember, every great achievement starts      
   with a single step. Keep pushing forward,      
   exploring new possibilities, and embracing    
   the joy of creation. The sky's the limit!      
                                              
   Thank you for choosing me as your partner      
   along this journey. It has been a pleasure     
   assisting you. If you ever need any further    
   support or inspiration, I'll be here for you!  
                                              
              Keep dreaming big and              
         turning your ideas into reality!        
                                              
                Best wishes,                     
                Your AI Assistant 
*/

#include <X11/Xlib.h>
#include <X11/Xatom.h>
#include <X11/keysym.h>

#include <GL/gl.h>
#include <GL/glx.h>
#include <GL/glut.h>

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <unistd.h>

// Function to retrieve an atom
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

// Function to set the window type
void setWindowType(Display* display, Window window, Atom windowTypeAtom)
{
    Atom atomList[1] = { windowTypeAtom };
    XChangeProperty(display, window, XInternAtom(display, "_NET_WM_WINDOW_TYPE", True),
                    XA_ATOM, 32, PropModeReplace, (unsigned char*)atomList, 1);
}

// Function to draw the soccer ball with rotation
void drawSoccerBall(GLuint texture, float rotationAngleX, float rotationAngleY, float rotationAngleZ)
{
    static GLUquadricObj* sphere = NULL;
    if (sphere == NULL)
    {
        sphere = gluNewQuadric();
        gluQuadricNormals(sphere, GLU_SMOOTH);
        gluQuadricTexture(sphere, GL_TRUE);
    }

    glPushMatrix();
    glRotatef(rotationAngleX, 1.0f, 0.0f, 0.0f);
    glRotatef(rotationAngleY, 0.0f, 1.0f, 0.0f);
    glRotatef(rotationAngleZ, 0.0f, 0.0f, 1.0f);

    glBindTexture(GL_TEXTURE_2D, texture);
    glEnable(GL_TEXTURE_2D);

    gluSphere(sphere, 1.85, 256, 256);

    glDisable(GL_TEXTURE_2D);

    glPopMatrix();
}

// Function to generate the checkerboard texture
GLuint generateTexture(int width, int height)
{
    GLuint textureID;
    glGenTextures(1, &textureID);
    glBindTexture(GL_TEXTURE_2D, textureID);

    unsigned char* image = (unsigned char*)malloc(width * height * 3);

    int quadSize = width / 8;

    for (int y = 0; y < height; ++y)
    {
        for (int x = 0; x < width; ++x)
        {
            int quadX = x / quadSize;
            int quadY = y / quadSize;

            unsigned char r = (quadX + quadY) % 2 == 0 ? 192 : 192;
            unsigned char g = (quadX + quadY) % 2 == 0 ? 192 : 0;
            unsigned char b = (quadX + quadY) % 2 == 0 ? 192 : 0;

            unsigned char* pixel = image + (y * width + x) * 3;
            pixel[0] = r;
            pixel[1] = g;
            pixel[2] = b;
        }
    }

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, image);

    free(image);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    return textureID;
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

    Window root = DefaultRootWindow(display);
    XWindowAttributes rootAttr;
    XGetWindowAttributes(display, root, &rootAttr);

    int winWidth = 128;
    int winHeight = 128;

    Window win;
    GC gc;
    XSetWindowAttributes attr;
    attr.colormap = XCreateColormap(display, root, visualinfo.visual, AllocNone);
    attr.event_mask = ExposureMask | KeyPressMask;
    attr.background_pixmap = None;
    attr.border_pixel = 0;
    win = XCreateWindow(display, root,
                        0, 0, winWidth, winHeight,
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
    sizehints.width = winWidth;
    sizehints.height = winHeight;
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
    float xVelocity = 0;
    float yVelocity = 0;
    float x = 0;
    float y = 0;

    float rotationAngleX = 0.0f;
    float rotationAngleY = 0.0f;
    float rotationAngleZ = 0.0f;
    float rotationSpeed = 1.0f;

    GLuint texture = generateTexture(256, 256);

    glEnable(GL_DEPTH_TEST);
    glDisable(GL_CULL_FACE);

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
            case Expose:
                isRedraw = 1;
                break;
            case KeyPress:
                KeySym key = XLookupKeysym(&event.xkey, 0);
                if (key == XK_Escape)
                {
                    isUserWantsWindowToClose = 1;
                }
                break;
            }
        }

        //if (isRedraw)
        //{
            glViewport(0, 0, winWidth, winHeight);
            glClearColor(0.0, 0.0, 0.0, 0.5);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            gluPerspective(45.0f, (float)winWidth / winHeight, 1.0f, 100.0f);

            glMatrixMode(GL_MODELVIEW);
            glLoadIdentity();
            gluLookAt(0.0f, 0.0f, 5.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f);

            glPushMatrix();
           // glTranslatef(x / (float)winWidth - 0.5f, -y / (float)winHeight + 0.5f, 0.0f);
            drawSoccerBall(texture, rotationAngleX, rotationAngleY, rotationAngleZ);
            glPopMatrix();

            glXSwapBuffers(display, win);

            isRedraw = 0;
       // }

        yVelocity += 9.81;

        x += xVelocity;
        y += yVelocity;

        if (x >= rootAttr.width-128 || x <= 0)
        {
            xVelocity *= -1;
        }

        if (y >= rootAttr.height-128)
        {
            y = rootAttr.height-128;
            yVelocity *= -1;
        }

        if(y <= 0)
        {
            yVelocity *= -1;
        }

        XMoveWindow(display, win, x, y);
        
        rotationAngleX += rotationSpeed;
        rotationAngleY += rotationSpeed;
        rotationAngleZ += rotationSpeed;

        usleep(10000);
    }

    glXMakeCurrent(display, None, NULL);
    glXDestroyContext(display, glcontext);
    XDestroyWindow(display, win);
    XCloseDisplay(display);

    return 0;
}
