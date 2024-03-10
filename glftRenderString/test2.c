#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <GLFW/glfw3.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include <GL/glut.h> // Für die GLUT-Funktionen

typedef struct {
    float x, y, width, height;
} gluiWindow;

typedef struct {
    char text[256];
    int cursor_pos;
    bool active;
} gluiInput;

gluiInput inputField;  // Deklariere eine globale Eingabestruktur

void guiRenderInputWindow(gluiWindow window) {
    // Setze die Top-Down-Projektion
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, 800, 600, 0, -1, 1);  // Passe die Werte entsprechend deiner Fenstergröße an

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    // Zeichne den Hintergrund des Eingabefelds
    glColor3f(0.8f, 0.8f, 0.8f);
    glBegin(GL_QUADS);
    glVertex2f(window.x, window.y);
    glVertex2f(window.x, window.y + window.height);
    glVertex2f(window.x + window.width, window.y + window.height);
    glVertex2f(window.x + window.width, window.y);
    glEnd();

    // Rendere den Text im Eingabefeld
    glColor3f(0.0f, 0.0f, 0.0f);
    glRasterPos2f(window.x + 5.0f, window.y + window.height - 5.0f);
    for (int i = 0; inputField.text[i] != '\0'; i++) {
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_12, inputField.text[i]);
    }

    // Falls das Eingabefeld aktiv ist, zeichne den Cursor
    if (inputField.active) {
        glColor3f(0.0f, 0.0f, 0.0f);
        float cursor_x = window.x + 5.0f + glutBitmapLength(GLUT_BITMAP_HELVETICA_12, (const unsigned char *)inputField.text);
        glBegin(GL_LINES);
        glVertex2f(cursor_x, window.y + 5.0f);
        glVertex2f(cursor_x, window.y + window.height - 5.0f);
        glEnd();
    }
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

int main() {
    if (!glfwInit()) {
        fprintf(stderr, "Fehler beim Initialisieren von GLFW\n");
        return -1;
    }

    // GLFW-Fenster erstellen
    GLFWwindow* window = glfwCreateWindow(800, 600, "OpenGL GUI", NULL, NULL);
    if (!window) {
        fprintf(stderr, "Fehler beim Erstellen des GLFW-Fensters\n");
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);

    // Dein OpenGL-Initialisierungscode hier
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);

    // GLFW-Callback-Funktionen setzen
    glfwSetCharCallback(window, handleCharInput);
    glfwSetKeyCallback(window, handleKeyboardInput);

    while (!glfwWindowShouldClose(window)) {
        // Dein Rendercode hier
        glClear(GL_COLOR_BUFFER_BIT);

        // Aufruf deiner GUI-Funktion
        guiRenderInputWindow((gluiWindow){100.0f, 100.0f, 200.0f, 30.0f});

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
