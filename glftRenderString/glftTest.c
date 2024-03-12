#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include <GLFW/glfw3.h>

#include "glftRenderString.h"

#define GLIDBASE glLoadIdentity(); \
glTranslated(0.375, 0.375, 0);

typedef struct {
    float x, y, width, height;
} gluiWindow;

typedef struct {
    char text[256];
    int cursor_pos;
    bool active;
} gluiInput;

gluiInput inputField;  // Deklariere eine globale Eingabestruktur

void gluiRenderQuad(float x, float y, float w, float h, int polygonMode);

void gluiDrawScissorBoxOutline(void) {
  // Aktuelle Scissorbox-Werte abrufen
  GLint scissorBox[4];
  glGetIntegerv(GL_SCISSOR_BOX, scissorBox);
  // Linienfarbe festlegen
  glColor3f(1.0f, 1.0f, 0.0f); // Gelb
  gluiRenderQuad((float)scissorBox[0], (float)scissorBox[1], (float)scissorBox[2]-1, (float)scissorBox[3]-16, GL_LINE);
}

void guiRenderInputWindow(gluiWindow window) {
    // Zeichne den Hintergrund des Eingabefelds

    glColor3f(0.8f, 0.8f, 0.8f);
    glBegin(GL_QUADS);
    glVertex2f(window.x, window.y);
    glVertex2f(window.x, window.y + window.height);
    glVertex2f(window.x + window.width, window.y + window.height);
    glVertex2f(window.x + window.width, window.y);
    glEnd();

    // Rendere den Text im Eingabefeld
    glColor3f(1.0f, 1.0f, 1.0f);
    glRasterPos2f(window.x + 5.0f, window.y + window.height - 5.0f);

    glEnable(GL_SCISSOR_TEST); // Enable scissor test
    glScissor(window.x, window.y, window.width, window.width);

    gluiDrawScissorBoxOutline();

    int width = glftRenderText(inputField.text, window.x-32, window.y, 1, 255, 255, 255);

    // Falls das Eingabefeld aktiv ist, zeichne den Cursor
    if (1) { // nputField.active) {
        glColor3f(1.0f, 1.0f, 1.0f);
        float cursor_x = window.x + 5.0f + width;
        glBegin(GL_LINES);
        glVertex2f(cursor_x, window.y + 5.0f);
        glVertex2f(cursor_x, window.y + window.height - 5.0f);
        glEnd();
    }
    glDisable(GL_SCISSOR_TEST); // Disable scissor test after drawing
}

// Beispiel für Tastaturereignisse (vereinfacht)
void handleKeyboardInput(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (action == GLFW_PRESS) {
        if (key == GLFW_KEY_ENTER) {
            // Hier könntest du Code hinzufügen, um mit dem eingegebenen Text zu arbeiten
            printf("Eingegebener Text: %s\n", inputField.text);
            // Zurücksetzen des Eingabefelds
            memset(inputField.text, 0, sizeof(inputField.text));
            inputField.cursor_pos = 0;
        }
        else if (key == GLFW_KEY_BACKSPACE) {
            // Lösche das letzte Zeichen
            if (inputField.cursor_pos > 0) {
                inputField.text[--inputField.cursor_pos] = '\0';
            }
        }
    }
}

// Beispiel für Zeichenerfassung (vereinfacht)
void handleCharInput(GLFWwindow* window, unsigned int codepoint) {
    if (inputField.cursor_pos < sizeof(inputField.text) - 1) {
        inputField.text[inputField.cursor_pos++] = (char)codepoint;
        inputField.text[inputField.cursor_pos] = '\0';
    }
}

void processInput(GLFWwindow *window) {
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
}

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
}

void gluiRenderQuad(float x, float y, float w, float h, int polygonMode) {
    // Setze den Zeichenmodus
    glPolygonMode(GL_FRONT_AND_BACK, polygonMode);

    GLIDBASE;

    // Beginne ein neues Quad
    glBegin(GL_QUADS);
        // Setze die Eckpunkte des Quads
        glVertex2f(x, y);
        glVertex2f(x + w, y);
        glVertex2f(x + w, y + h);
        glVertex2f(x, y + h);
        // Beende das Quad
    glEnd();
    
    // Setze den Zeichenmodus zurück
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    glLoadIdentity();
}

// Define RGB colors for the rainbow
float rainbow_colors[][3] = {
    {1.0f, 0.0f, 0.0f}, // Red
    {1.0f, 0.5f, 0.0f}, // Orange
    {1.0f, 1.0f, 0.0f}, // Yellow
    {0.0f, 1.0f, 0.0f}, // Green
    {0.0f, 0.0f, 1.0f}, // Blue
    {0.5f, 0.0f, 1.0f}, // Indigo
    {1.0f, 0.0f, 1.0f}, // Violet
};

// Function to calculate a smooth transition between two colors (lerp)
float lerp(float a, float b, float t) {
  return (1.0f - t) * a + t * b;
}

float rotation = 0.0f;
float frequency = 2.0f;  // Initial frequency
float amplitude = 80.0f-16;  // Initial amplitude
float char_x_pos = 0.0f; // Position des Zeichens auf der X-Achse

int win_width = 800;

void gluiRenderCharSinus(char c, float x) {
        // Berechne die Y-Position des Zeichens basierend auf der Sinuskurve
        float char_y_pos = 300 + amplitude * sin(frequency * 2.0f * M_PI * x / win_width);

        // Berechne die Steigung der Tangente an der aktuellen Position
        float slope = cos(frequency * 2.0f * M_PI * x / win_width);

        // Zeichne das rotierte Zeichen an der berechneten Position
//        glColor3f(1.0f, 1.0f, 1.0f);
        
        float angle = 180.0f / M_PI * atan2(slope, 1.0f);
        glftRenderCharRotated(c, x, char_y_pos, 2, angle);
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

    // GLFW-Callback-Funktionen setzen
    glfwSetCharCallback(window, handleCharInput);
    glfwSetKeyCallback(window, handleKeyboardInput);

    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    glftFont* dejavu = glftLoadFont("Arial.ttf", 16);
    glftSetCurrentFont(dejavu);

     while (!glfwWindowShouldClose(window)) {
        processInput(window);
        glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        int win_width, win_height;
        glfwGetFramebufferSize(window, &win_width, &win_height);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(0, win_width, win_height, 0, 0, 1);
        glMatrixMode(GL_MODELVIEW);

        const char *asciiString = " !\"#$%&'()*+,-./0123456789:;<=>?@"
                              "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`"
                              "abcdefghijklmnopqrstuvwxyz{|}~\x7F";

       
        glftRenderText(asciiString, 0.0f, 0.0f, 1.0f, 255, 255, 255);
        glftRenderText(dejavu->font_name, 0.0f, 16.0f, 1.0f, 0, 255, 0);

        glColor3f(0, 1, 1);
        glftRenderCharRotated('A', 400, 300-6, 1, rotation++);

        glColor3f(1, 1, 1);
        gluiRenderQuad(100.0f, 100.0f, 600.0f, 400.0f, GL_LINE);

        // Aufruf deiner GUI-Funktion
        guiRenderInputWindow((gluiWindow){200.0f, 200.0f, 200.0f, 30.0f});

        glColor3f(1, 1, 1);
        glBegin(GL_LINES);
        glVertex2f(0, 300);
        glVertex2f(800, 300);
        glEnd();

        // Draw the sine curve
        glColor3f(1.0f, 0.0f, 0.0f); // Red color for the sine curve
        glBegin(GL_LINE_STRIP);
        for (int x = 0; x <= win_width; x++) {
            float y = amplitude * sin(frequency * 2.0f * M_PI * (float)x / win_width);
            glVertex2f(x, 300 + y);
        }
        glEnd();


        // Bewege das Zeichen von rechts nach links entlang der Sinuskurve
        char_x_pos -= 1.5f; // Verringere die X-Position des Zeichens
        if (char_x_pos < -800.0f) { // Wenn die linke Kante erreicht ist
            char_x_pos = win_width; // Setze die X-Position auf die rechte Kante
        }


    const char* string_to_render = "Your String Here Big Mama Sit Down And Relax Aloevera";  // Replace with your desired string
    float char_spacing = 16.0f*2;  // Adjust
 
    float color_step = 1.0f / 7.0f; // Assuming 7 colors in the rainbow
    for (int i = 0; i < strlen(string_to_render); i++) {
        float color_offset = i * color_step;
        float r = sin(color_offset) * 0.5f + 0.5f;  // Example color calculations (adjust as needed)
        float g = cos(color_offset) * 0.5f + 0.5f;
        float b = sin(color_offset + 2.0f * M_PI / 3.0f) * 0.5f + 0.5f;
        glColor3f(r, g, b);
        gluiRenderCharSinus(string_to_render[i], char_x_pos+(char_spacing*i));
    }

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glftCleanup();
    glfwTerminate();
    return 0;
}
