#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/extensions/Xrender.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>

#define WIDTH 1920
#define HEIGHT 600

typedef struct {
    unsigned short r, g, b, a;
} Color;

Color palette[] = {
    {0, 0, 0, 65535},         // Black
    {65535, 0, 0, 65535},     // Red
    {0, 65535, 0, 65535},     // Green
    {0, 0, 65535, 65535},     // Blue
    {65535, 65535, 65535, 65535}  // White
};

Color* plasma = NULL;
Display* display;
Window rootWindow;
XRenderPictFormat* format;
XRenderPictureAttributes pa;
Picture picture;

void generatePlasma() {
    int x, y;
    double cx = WIDTH / 2.0;
    double cy = HEIGHT / 2.0;
    double scale = 0.04;

    for (y = 0; y < HEIGHT; ++y) {
        for (x = 0; x < WIDTH; ++x) {
            double nx = (double)x / WIDTH - 0.5;
            double ny = (double)y / HEIGHT - 0.5;
            double dist = sqrt(nx * nx + ny * ny);
            double angle = atan2(ny, nx) - scale * dist * 10.0;
            double value = sin(angle) * 32768.0 + 32768.0;
            int index = (int)value % 5;
            plasma[y * WIDTH + x] = palette[index];
        }
    }
}

void renderPlasma() {
    int x, y;
    for (y = 0; y < HEIGHT; ++y) {
        for (x = 0; x < WIDTH; ++x) {
            XRenderColor color = {
                .red = plasma[y * WIDTH + x].r,
                .green = plasma[y * WIDTH + x].g,
                .blue = plasma[y * WIDTH + x].b,
                .alpha = plasma[y * WIDTH + x].a
            };
            XRenderFillRectangle(display, PictOpSrc, picture, (XRenderColor*)&color, x, y, 1, 1);
        }
    }
}

int main() {
    display = XOpenDisplay(NULL);
    if (!display) {
        fprintf(stderr, "Unable to open display\n");
        return 1;
    }

    rootWindow = DefaultRootWindow(display);

    int screen = DefaultScreen(display);
    Visual* visual = DefaultVisual(display, screen);

    format = XRenderFindVisualFormat(display, visual);
    if (!format) {
        fprintf(stderr, "Unable to find XRender visual format\n");
        XCloseDisplay(display);
        return 1;
    }

    pa.subwindow_mode = IncludeInferiors;
    picture = XRenderCreatePicture(display, rootWindow, format, CPSubwindowMode, &pa);
    if (!picture) {
        fprintf(stderr, "Unable to create XRender picture\n");
        XCloseDisplay(display);
        return 1;
    }

    plasma = malloc(WIDTH * HEIGHT * sizeof(Color));
    if (!plasma) {
        fprintf(stderr, "Memory allocation failed\n");
        XRenderFreePicture(display, picture);
        XCloseDisplay(display);
        return 1;
    }

    generatePlasma();

    XEvent event;
    int quit = 0;

    XSelectInput(display, rootWindow, KeyPressMask);
    XMapWindow(display, rootWindow);

    while (!quit) {
        while (XPending(display) > 0) {
            XNextEvent(display, &event);
            if (event.type == KeyPress) {
                quit = 1;
                break;
            }
        }

        renderPlasma();
        XFlush(display);
        usleep(16666);  // Delay for approximately 60 frames per second
    }

    free(plasma);
    XRenderFreePicture(display, picture);
    XCloseDisplay(display);

    return 0;
}
