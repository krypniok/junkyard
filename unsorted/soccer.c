
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <GL/glu.h>
#include <GL/freeglut.h>

typedef struct {
    GLfloat x;
    GLfloat y;
    GLfloat z;
    GLfloat u;
    GLfloat v;
} Vertex;

typedef struct {
    GLuint vIndex1;
    GLuint tIndex1;
    GLuint vIndex2;
    GLuint tIndex2;
    GLuint vIndex3;
    GLuint tIndex3;
    GLuint vIndex4;
    GLuint tIndex4;
} Face;

// Function to load an RGBA bitmap file
GLuint loadTexture(const char* filename) {
    FILE* file;
    unsigned char header[54];
    unsigned int dataPos;
    unsigned int width, height;
    unsigned int imageSize;
    unsigned char* image;
    GLuint textureID;

    // Open the bitmap file
    file = fopen(filename, "rb");
    if (!file) {
        printf("Error: Could not open texture file\n");
        return 0;
    }

    // Read the header (54 bytes)
    fread(header, sizeof(unsigned char), 54, file);

    // Extract image dimensions
    width = *(unsigned int*)&header[18];
    height = *(unsigned int*)&header[22];
    imageSize = width * height * 4; // RGBA format

    // Check if the bitmap is stored with flipped rows
    if (*(int*)&header[30] < 0) {
        height = -height;
    }

    // Adjust image data position (offset by header size)
    dataPos = *(unsigned int*)&header[10];

    // Allocate memory for the image data
    image = (unsigned char*)malloc(imageSize);

    // Read the image data
    fseek(file, dataPos, SEEK_SET);
    fread(image, sizeof(unsigned char), imageSize, file);

    // Close the bitmap file
    fclose(file);

    // Generate a new texture ID
    glGenTextures(1, &textureID);

    // Bind the texture ID
    glBindTexture(GL_TEXTURE_2D, textureID);

    // Set texture parameters
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

    // Load the texture data
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, image);

    // Free the image data
    free(image);

    return textureID;
}


GLuint txtSoccer;

void renderSoccerBall(Vertex* vertices, Face* faces, GLuint numFaces) {
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, txtSoccer);

    // Render the soccer ball
    glBegin(GL_QUADS);
    for (GLuint i = 0; i < numFaces; i++) {
        Face face = faces[i];
        Vertex v1 = vertices[face.vIndex1];
        Vertex v2 = vertices[face.vIndex2];
        Vertex v3 = vertices[face.vIndex3];
        Vertex v4 = vertices[face.vIndex4];

        glTexCoord2f(v1.u, v1.v);
        glVertex3f(v1.x, v1.y, v1.z);
        glTexCoord2f(v2.u, v2.v);
        glVertex3f(v2.x, v2.y, v2.z);
        glTexCoord2f(v3.u, v3.v);
        glVertex3f(v3.x, v3.y, v3.z);
        glTexCoord2f(v4.u, v4.v);
        glVertex3f(v4.x, v4.y, v4.z);
    }
    glEnd();

    glDisable(GL_TEXTURE_2D);
}


void loadSoccerBallMesh(const char* filename, Vertex** vertices, Face** faces, GLuint* numVertices, GLuint* numFaces) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file: %s\n", filename);
        exit(1);
    }

    // Count the number of vertices, texture coordinates, and faces
    char line[256];
    GLuint countVertices = 0;
    GLuint countTexCoords = 0;
    GLuint countFaces = 0;
    while (fgets(line, sizeof(line), file)) {
        if (strncmp(line, "v ", 2) == 0) {
            countVertices++;
        }
        else if (strncmp(line, "vt ", 3) == 0) {
            countTexCoords++;
        }
        else if (strncmp(line, "f ", 2) == 0) {
            countFaces++;
        }
    }

    *numVertices = countVertices;
    *numFaces = countFaces;

    // Allocate memory for vertices, texture coordinates, and faces
    *vertices = (Vertex*)malloc(countVertices * sizeof(Vertex));
    *faces = (Face*)malloc(countFaces * sizeof(Face));

    // Read the vertices, texture coordinates, and faces
    rewind(file);
    GLuint vertexIndex = 0;
    GLuint texCoordIndex = 0;
    GLuint faceIndex = 0;
    while (fgets(line, sizeof(line), file)) {
        if (strncmp(line, "v ", 2) == 0) {
            GLfloat x, y, z;
            sscanf(line, "v %f %f %f", &x, &y, &z);
            (*vertices)[vertexIndex].x = x;
            (*vertices)[vertexIndex].y = y;
            (*vertices)[vertexIndex].z = z;
            vertexIndex++;
        }
        else if (strncmp(line, "vt ", 3) == 0) {
            GLfloat u, v;
            sscanf(line, "vt %f %f", &u, &v);
            (*vertices)[texCoordIndex].u = u;
            (*vertices)[texCoordIndex].v = v;
            texCoordIndex++;
        }
        else if (strncmp(line, "f ", 2) == 0) {
            GLuint vIndex1, tIndex1, vIndex2, tIndex2, vIndex3, tIndex3, vIndex4, tIndex4;
            sscanf(line, "f %u/%u %u/%u %u/%u %u/%u", &vIndex1, &tIndex1, &vIndex2, &tIndex2, &vIndex3, &tIndex3, &vIndex4, &tIndex4);
            (*faces)[faceIndex].vIndex1 = vIndex1 - 1;
            (*faces)[faceIndex].tIndex1 = tIndex1 - 1;
            (*faces)[faceIndex].vIndex2 = vIndex2 - 1;
            (*faces)[faceIndex].tIndex2 = tIndex2 - 1;
            (*faces)[faceIndex].vIndex3 = vIndex3 - 1;
            (*faces)[faceIndex].tIndex3 = tIndex3 - 1;
            (*faces)[faceIndex].vIndex4 = vIndex4 - 1;
            (*faces)[faceIndex].tIndex4 = tIndex4 - 1;
            faceIndex++;
        }

    }

    fclose(file);
}

    Vertex* vertices;
    Face* faces;
    GLuint numVertices, numFaces;


void renderTexture() {
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, txtSoccer);

    // Render the soccer ball as a textured quad in orthographic mode
    glBegin(GL_QUADS);
    glTexCoord2f(0.0f, 0.0f);
    glVertex2f(-1.0f, -1.0f);
    glTexCoord2f(1.0f, 0.0f);
    glVertex2f(1.0f, -1.0f);
    glTexCoord2f(1.0f, 1.0f);
    glVertex2f(1.0f, 1.0f);
    glTexCoord2f(0.0f, 1.0f);
    glVertex2f(-1.0f, 1.0f);
    glEnd();

    glDisable(GL_TEXTURE_2D);
}


void display() {

    glClearColor(0, 192, 16, 0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);



    glLoadIdentity();

    gluLookAt(0.0, 50.0, 100.0,  // Camera position
              0.0, 0.0, 0.0,  // Look-at point
              0.0, -1.0, 0.0); // Up vector

    // Render the soccer ball
    glColor3f(1.0, 1.0, 1.0); // Set color to white

    renderSoccerBall(vertices, faces, numFaces);

    glFlush();
    glutSwapBuffers();
}

void reshape(int width, int height) {
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0, (GLfloat)width / (GLfloat)height, 0.1, 100.0);
    glMatrixMode(GL_MODELVIEW);
}

int main(int argc, char** argv) {
    // Initialize OpenGL and GLUT
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800, 600);
    glutCreateWindow("Soccer Ball");

    // Register callback functions
    glutDisplayFunc(display);
    glutReshapeFunc(reshape);

    // Load the soccer ball mesh

    loadSoccerBallMesh("soccer_ball.obj", &vertices, &faces, &numVertices, &numFaces);
    txtSoccer = loadTexture("soccer_ball.bmp");


    // Enable depth testing
    //glEnable(GL_DEPTH_TEST);

    // Enter the main loop
    glutMainLoop();

    // Clean up
    free(vertices);
    free(faces);

    return 0;
}

