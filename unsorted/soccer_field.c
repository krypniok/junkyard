#include <GL/gl.h>
#include <GL/glut.h>
#include <math.h>
#include <stdio.h>

int lastMouseX = 0;
int lastMouseY = 0;
float cameraRotationX = 0.0;
float cameraRotationY = 0.0;
float cameraZoom = 20.0;
float cameraPositionZ = -20.0;

typedef struct {
    float rotationX;
    float rotationY;
    float zoom;
    float positionZ;
} CameraState;

CameraState savedCameraState;

void drawSoccerField() {
    // Draw the grass field
    glColor3f(0.0, 0.8, 0.0);
    glBegin(GL_QUADS);
    glVertex3f(-55.0, 0.0, -35.0);
    glVertex3f(-55.0, 0.0, 35.0);
    glVertex3f(55.0, 0.0, 35.0);
    glVertex3f(55.0, 0.0, -35.0);
    glEnd();

    // Draw the boundary lines
    glColor3f(1.0, 1.0, 1.0);
    glLineWidth(3.0);
    glBegin(GL_LINE_LOOP);
    glVertex3f(-50.0, 0.0, -30.0);
    glVertex3f(-50.0, 0.0, 30.0);
    glVertex3f(50.0, 0.0, 30.0);
    glVertex3f(50.0, 0.0, -30.0);
    glEnd();

    // Draw the center circle
    glBegin(GL_LINE_LOOP);
    for (int i = 0; i < 360; i++) {
        float angle = i * 3.14159 / 180;
        float x = 9.15 * cos(angle);
        float z = 9.15 * sin(angle);
        glVertex3f(x, 0.0, z);
    }
    glEnd();

    // Draw the penalty areas
    glLineWidth(2.0);
    glBegin(GL_LINE_LOOP);
    glVertex3f(-16.5, 0.0, -30.0);
    glVertex3f(-16.5, 0.0, 30.0);
    glVertex3f(16.5, 0.0, 30.0);
    glVertex3f(16.5, 0.0, -30.0);
    glEnd();

    glBegin(GL_LINE_LOOP);
    glVertex3f(-5.5, 0.0, -30.0);
    glVertex3f(-5.5, 0.0, 30.0);
    glVertex3f(5.5, 0.0, 30.0);
    glVertex3f(5.5, 0.0, -30.0);
    glEnd();

    // Draw the goals
    glLineWidth(4.0);
    glBegin(GL_LINE_LOOP);
    glVertex3f(-50.0, 0.0, -2.0);
    glVertex3f(-50.0, 0.0, 2.0);
    glVertex3f(-52.0, 0.0, 2.0);
    glVertex3f(-52.0, 0.0, -2.0);
    glEnd();

    glBegin(GL_LINE_LOOP);
    glVertex3f(50.0, 0.0, -2.0);
    glVertex3f(50.0, 0.0, 2.0);
    glVertex3f(52.0, 0.0, 2.0);
    glVertex3f(52.0, 0.0, -2.0);
    glEnd();
}

void saveCameraStateToFile(const char* filename) {
    FILE* file = fopen(filename, "wb");
    if (file != NULL) {
        fwrite(&savedCameraState, sizeof(CameraState), 1, file);
        fclose(file);
        printf("Camera state saved to file: %s\n", filename);
    } else {
        printf("Failed to save camera state to file: %s\n", filename);
    }
}

void loadCameraStateFromFile(const char* filename) {
    FILE* file = fopen(filename, "rb");
    if (file != NULL) {
        fread(&savedCameraState, sizeof(CameraState), 1, file);
        fclose(file);
        printf("Camera state loaded from file: %s\n", filename);
    } else {
        printf("Failed to load camera state from file: %s\n", filename);
    }
}

void display() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
    
    // Set camera position and orientation
    glTranslatef(0.0, 0.0, -cameraZoom);
    glRotatef(cameraRotationX, 1.0, 0.0, 0.0);
    glRotatef(cameraRotationY, 0.0, 1.0, 0.0);

    drawSoccerField();

    glutSwapBuffers();
}

void reshape(int width, int height) {
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0, (float)width / height, 1.0, 100.0);
    glMatrixMode(GL_MODELVIEW);
}

void mouse(int button, int state, int x, int y) {
    if (state == GLUT_DOWN && button == GLUT_LEFT_BUTTON) {
        lastMouseX = x;
        lastMouseY = y;
    }
}

void motion(int x, int y) {
    int deltaX = x - lastMouseX;
    int deltaY = y - lastMouseY;

    cameraRotationX += deltaY * 0.2;
    cameraRotationY += deltaX * 0.2;

    lastMouseX = x;
    lastMouseY = y;

    glutPostRedisplay();
}

void keyboard(unsigned char key, int x, int y) {
    if (key == 27) { // ESC key
        saveCameraStateToFile("camera_state.bin");
        exit(0);
    }
}

void specialKeyboard(int key, int x, int y) {
    if (key == GLUT_KEY_UP) {
        cameraPositionZ -= 1.0;
    } else if (key == GLUT_KEY_DOWN) {
        cameraPositionZ += 1.0;
    }

    glutPostRedisplay();
}

void cleanup() {
    saveCameraStateToFile("camera_state.bin");
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
    glutInitWindowSize(800, 600);
    glutCreateWindow("3D Soccer Field");

    glEnable(GL_DEPTH_TEST);

    glutDisplayFunc(display);
    glutReshapeFunc(reshape);
    glutMouseFunc(mouse);
    glutMotionFunc(motion);
    glutKeyboardFunc(keyboard);
    glutSpecialFunc(specialKeyboard);

    loadCameraStateFromFile("camera_state.bin");

    atexit(cleanup);

    glutMainLoop();

    return 0;
}
