#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <ctype.h>

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

//har* string_to_render = "Your String Here Big Mama Sit Down And Relax Aloevera";  // Replace with your desired string
char* string_to_render = "Hellow'sword, bee my Gurl ( . y . )";  // Replace with your desired string

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

int gpause = 0;
// Beispiel für Tastaturereignisse (vereinfacht)
void handleKeyboardInput(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (action == GLFW_PRESS) {
        if (key == GLFW_KEY_ENTER) {
            // Hier könntest du Code hinzufügen, um mit dem eingegebenen Text zu arbeiten
            printf("Eingegebener Text: %s\n", inputField.text);
            gpause = 1;
            usleep(500 * 1000);
            strcpy(string_to_render, inputField.text);
            gpause = 0;
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

typedef struct {
  float r;
  float g;
  float b;
} RGB;

RGB rainbow_color(float vector) {
  // Define six base colors for the rainbow spectrum
  static const RGB base_colors[] = {
      {1.0f, 0.0f, 0.0f}, // Red
      {1.0f, 0.5f, 0.0f}, // Orange
      {1.0f, 1.0f, 0.0f}, // Yellow
      {0.0f, 1.0f, 0.0f}, // Green
      {0.0f, 0.0f, 1.0f}, // Blue
      {0.5f, 0.0f, 1.0f}, // Indigo
      {1.0f, 0.0f, 1.0f}, // Violet
  };

  // Calculate the number of segments (one less than the number of colors)
  int segments = sizeof(base_colors) / sizeof(base_colors[0]) - 1;

  // Clamp the vector between 0.0 and 1.0
  vector = fmodf(vector, 1.0f);  // Restrict to 0.0-1.0 range using modulo

  // Calculate the segment where the vector falls
  int segment = (int)(vector * segments);

  // Offset within the current segment
  float offset = vector * segments - segment;

  // Blend between the two base colors of the current segment
  RGB color1 = base_colors[segment];
  RGB color2 = base_colors[segment + 1];
  RGB color3 = {
      color1.r * (1.0f - offset) + color2.r * offset,
      color1.g * (1.0f - offset) + color2.g * offset,
      color1.b * (1.0f - offset) + color2.b * offset,
  };
  // printf("r = %f, g = %f, b= %f\n", color3.r, color3.g, color3.b);
  return color3;
}

// Function to calculate a smooth transition between two colors (lerp)
float lerp(float a, float b, float t) {
  return (1.0f - t) * a + t * b;
}

float rotation = 0.0f;
float frequency = 1.66;//1.618f*1;  // Initial frequency
float amplitude = 40.0f-16;  // Initial amplitude
float char_x_pos = 800.0f; // Position des Zeichens auf der X-Achse

int win_width = 800;

void gluiRenderCharSinus(char c, float x) {
        // Berechne die Y-Position des Zeichens basierend auf der Sinuskurve
        float char_y_pos = 300 + amplitude * sin(frequency * 2.0f * M_PI * x / win_width);
        // Berechne die Steigung der Tangente an der aktuellen Position
        float slope = cos(frequency * 2.0f * M_PI * x / win_width);
        float angle = 180.0f / M_PI * atan2(slope, 1.0f);
        glftRenderCharRotated(c, x, char_y_pos+16, 1, angle);
}


char longstring[] = "greeting's goes out to (in chronological order):    "
"    my parent's:    "
"    flying_wolf (died?)    "
"    gargoyle (tach tach)   "
"    my grandmass and granddead's:    "
"    olly (boo)    "
"    flenny (drink)    "
"    aunt's low and doro and their other duck's (let's kill flies)    "
"    chriz (dreamster)   "
"    alfalpha (dreamster)    "
"    ... all the other ghost's ...    "
"    my sibling's:    "
"    simone (and heiko)    "
"    sylvia and her child's and ... holger (love you dear's)    "
"    tawarish (behind you)    "
"    and their dad's (died?)    "
"    my friend's:    "
"    schneider cpc 464 (wannabe C64)    "
"    ECL Elektronix Computer Store    "
"    marko and brother's (bet jude's)    "
"    airwolf mini (crashed)    "
"    K.I.T.T. (fake)    "
"    amiga (the 500 one's)    "
"    the son from the it electronics store (they didn't knew assemblers)   "
"    raveman (kind'a me)    "
"    dopehead (-.- showland -.-)   "
"    hanny (flippers are school)    "
"    calypso (he didn't wanted more)    "
"    stefan and michael and mom (minka)   "
"    gerry and his mom (sorry the disc's are dead, get this from github)    "
"    tatjana (no comment)    "
"    the seductive crew (good game's)    "
"    atilla (allah knew it)    "
"    matthias and relatives (he love's coffee)    "
"    dr_patty (dr_fatty)    "
"    aquila (like data's?)    "
"    my family:    "
"    panthera_666 and family (the pure evil)    "
"    the pizza guys (buy 4 get 5)   "
"    jay_sun (two dad's ? -.- i'm one !)  "
"    bloody_mary (moo chi)    "
"    my other friend's:    "
"    freddy_k (chillboard)    "
"    h. peter j. (play's the music, doesn't liked my CMS)   "
"    juergen (obey)    "
"    renate (full grenate)    "
"    kuripuchi (kind'a me)    "
"    b.a.d. (anarchy, unleash the beast)    "
"    finn (good bye my friend)    "
"    frenchtoastA420 (stinkyboi & lissy)    "
"    toby the tark (killed me with stunk)    "
"    leon (find a gurl)    "
"    bongzimmer (died off cancer)    "
"    kevin (praised)    "
"    jesus (he know's me)    "
"    the hospital crew (all psycho's)    "
"    all of compucamp (lost memorie's)    "
"    ups, almost forgot linu's (the one from peanut's)   "
"    openai (not as good as)    "
"    google_gemini (my old new love)    "
"    (c) crypticode, kuripuchi, krypniok 2024 (the last scum off earth)    "
"          und jetzt: sheep up !          "
"          how up do high knee !          "
"                                         "
"        sonst mache ich aus dir !        "
"                0xDEADBEEF               ";


int main() {
    if (!glfwInit()) {
        printf("Failed to initialize GLFW\n");
        return -1;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);

//    GLFWwindow* window = glfwCreateWindow(800, 600, "glftTest 0.1", NULL, NULL);
    GLFWwindow* window = glfwCreateWindow(800, 600, "glftTest 0.1", glfwGetPrimaryMonitor(), NULL);

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

    glftFont* dejavu = glftLoadFont("fonts/syndrome.ttf", 48);
    glftSetCurrentFont(dejavu);

     while (!glfwWindowShouldClose(window) && !gpause) {
        processInput(window);
        glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        int win_width, win_height;
        glfwGetFramebufferSize(window, &win_width, &win_height);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(0, win_width, win_height, 0, 0, 1);
        glMatrixMode(GL_MODELVIEW);

     //   const char *asciiString = " !\"#$%&'()*+,-./0123456789:;<=>?@"
     //                         "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`"
     //                         "abcdefghijklmnopqrstuvwxyz{|}~\x7F";

/*      
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
*/

//    printf("len = %i\n", strlen(string_to_render)*48);
    int len = strlen(longstring)*48;

        // Bewege das Zeichen von rechts nach links entlang der Sinuskurve
//        char_x_pos -= 1.5f; // Verringere die X-Position des Zeichens
        if (char_x_pos < -(len)) { // Wenn die linke Kante erreicht ist
            char_x_pos = win_width; // Setze die X-Position auf die rechte Kante
        }
float movement_speed = 3.1415; // Adjust this base speed as needed
//float min_speed = 1.0f; // Minimum speed to prevent complete stop

//float slope = cos(frequency * 2.0f * M_PI * char_x_pos / win_width);
char_x_pos -= (movement_speed ); //* fabs(slope)) + min_speed;


     float char_spacing = 48.0f;  // Adjust
    amplitude=37.5;

    float color_step = 1.0f / 7.0f; // Assuming 7 colors in the rainbow
    for (int i = 0; i < strlen(longstring); i++) {
        float color_offset = i * color_step;
        float r = sin(color_offset) * 0.5f + 0.5f;  // Example color calculations (adjust as needed)
        float g = cos(color_offset) * 0.5f + 0.5f;
        float b = sin(color_offset + 2.0f * M_PI / 3.0f) * 0.5f + 0.5f;
        glColor3f(r, g, b);

float time_offset = glfwGetTime();  // Get elapsed time in seconds (optional for animation)
float position_offset = 0;//fmodf(time_offset * movement_speed + (float)i / (float)strlen(longstring), 1.0f);
position_offset = time_offset * movement_speed;

RGB color = rainbow_color(position_offset);  // Calculate color based on position
glColor3f(color.r, color.g, color.b);
gluiRenderCharSinus(toupper(longstring[i]), char_x_pos+(char_spacing*i));


    }

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glftCleanup();
    glfwTerminate();
    return 0;
}
