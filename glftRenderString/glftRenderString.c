#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include <GLFW/glfw3.h>
#include <ft2build.h>
#include FT_FREETYPE_H

#include "glftRenderString.h"

#define GLIDBASE glLoadIdentity(); \
glTranslated(0.375, 0.375, 0);

glftFont* glftDefaultFont = NULL;

bool glftSetCurrentFont(glftFont* font) {
    glftDefaultFont = font;
    return true;
}

glftFont* glftLoadFont(char* filename, int fontsize) {
    glftFont* pFont = malloc(sizeof(glftFont));
    
    if (!pFont) {
        printf("ERROR::Memory allocation failed\n");
        return NULL;
    }

    strcpy(pFont->filename, filename); 

    FT_Library ft;
    if (FT_Init_FreeType(&ft)) {
        printf("ERROR::FREETYPE: Could not initialize FreeType library\n");
        free(pFont);
        return NULL;
    }

    FT_Face face;
    if (FT_New_Face(ft, filename, 0, &face)) {
        printf("ERROR::FREETYPE: Could not load font\n");
        free(pFont);
        return NULL;
    } else {
        FT_Set_Pixel_Sizes(face, 0, fontsize);
        glPixelStorei(GL_UNPACK_ALIGNMENT, 1);

        // Schriftartname auslesen
        strcpy(pFont->font_name, FT_Get_Postscript_Name(face)); 

        for (unsigned char c = 0; c < 128; c++) {
            if (FT_Load_Char(face, c, FT_LOAD_RENDER)) {
                printf("ERROR::FREETYPE: Could not load glyph\n");
                continue;
            }

            unsigned int texture;
            glGenTextures(1, &texture);
            glBindTexture(GL_TEXTURE_2D, texture);

            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

            glTexImage2D(
                GL_TEXTURE_2D,
                0,
                GL_RGBA,
                face->glyph->bitmap.width,
                face->glyph->bitmap.rows,
                0,
                GL_LUMINANCE,
                GL_UNSIGNED_BYTE,
                face->glyph->bitmap.buffer
            );

            pFont->characters[c].textureID = texture;
            pFont->characters[c].size_x = (int)face->glyph->bitmap.width;
            pFont->characters[c].size_y = (int)face->glyph->bitmap.rows;
            pFont->characters[c].bearing_x = (int)face->glyph->bitmap_left;
            pFont->characters[c].bearing_y = (int)face->glyph->bitmap_top;
            pFont->characters[c].advance = (int)(face->glyph->advance.x);
            // Store character height (distance from top to baseline)
            pFont->characters[c].height = (int)face->glyph->metrics.horiBearingY;
        }
        glBindTexture(GL_TEXTURE_2D, 0);
    }

    FT_Done_Face(face);
    FT_Done_FreeType(ft);

    return pFont;
}

void glftRenderCharRotated(char c, float x, float y, float scale, float rotation) {
    glftCharacter ch = glftDefaultFont->characters[(unsigned char)c];

    glEnable(GL_TEXTURE_2D);

    // Calculate character dimensions with scaling applied
    float w = ch.size_x * scale;
    float h = ch.size_y * scale;

    // Calculate half width and half height for centering
    float half_w = w / 2.0f;
    float half_h = h / 2.0f;

    // Calculate bearing offset for horizontal centering
    float bearing_x = ch.bearing_x * scale;

    // Calculate x and y position
    float xpos = x + bearing_x;
    float ypos = y - (ch.size_y - ch.bearing_y + (ch.height/64)) * scale;
    ypos += ch.size_y - ch.bearing_y;
    ypos += 16;

    // Push the current modelview matrix onto the stack
    glPushMatrix();

    // Translate to the character's position
    glTranslatef(xpos, ypos, 0.0f);

    // Apply rotation around the center
    glRotatef(rotation, 0.0f, 0.0f, 1.0f);

    // Translate to the character's center (relative to its position)
    glTranslatef(-w, -h, 0.0f);


    // Save the current modelview matrix
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();

    // Restore the modelview matrix
    glPopMatrix();

    // Translate back to the character's original position
    glTranslatef(half_w, half_h, 0.0f);


    // Bind texture and render the quad
    glBindTexture(GL_TEXTURE_2D, ch.textureID);
    glBegin(GL_QUADS);
        glTexCoord2f(0, 0); glVertex2f(0, 0);
        glTexCoord2f(1, 0); glVertex2f(w, 0);
        glTexCoord2f(1, 1); glVertex2f(w, h);
        glTexCoord2f(0, 1); glVertex2f(0, h);
    glEnd();
    glBindTexture(GL_TEXTURE_2D, 0);

    // Pop the modelview matrix from the stack
    glPopMatrix();
}

void glftRenderChar(char c, float x, float y, float scale) {
    glftCharacter ch = glftDefaultFont->characters[(unsigned char)c];

    float xpos = x + ch.bearing_x * scale;
    float ypos = y - (ch.size_y - ch.bearing_y + (ch.height >> 6 )) * scale;
    ypos += ch.size_y - ch.bearing_y;
    ypos += 16;

    float w = ch.size_x * scale;
    float h = ch.size_y * scale;

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, ch.textureID);

    // Enable blending for transparency
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE);

    glBegin(GL_QUADS);
        glTexCoord2f(0, 0); glVertex2f(xpos, ypos);
        glTexCoord2f(1, 0); glVertex2f(xpos + w, ypos);
        glTexCoord2f(1, 1); glVertex2f(xpos + w, ypos + h);
        glTexCoord2f(0, 1); glVertex2f(xpos, ypos + h);
    glEnd();

    // Disable blending after rendering
    glDisable(GL_BLEND);

    glBindTexture(GL_TEXTURE_2D, 0);
}

void glftRenderCharDownUp(char c, float x, float y, float scale, float rotation) {
    glftCharacter ch = glftDefaultFont->characters[(unsigned char)c];

    float xpos = x + ch.bearing_x * scale;
    float ypos = y - (ch.size_y - ch.bearing_y + ch.size_y) * scale;

    float w = ch.size_x * scale;
    float h = ch.size_y * scale;

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, ch.textureID);

    glBegin(GL_QUADS);
    glTexCoord2f(0.0f, 0.0f); glVertex2f(xpos, ypos + h);
    glTexCoord2f(0.0f, 1.0f); glVertex2f(xpos, ypos);
    glTexCoord2f(1.0f, 1.0f); glVertex2f(xpos + w, ypos);
    glTexCoord2f(1.0f, 0.0f); glVertex2f(xpos + w, ypos + h);
    glEnd();

    glBindTexture(GL_TEXTURE_2D, 0);
}

int glftRenderText(const char* text, float x, float y, float scale, unsigned char r, unsigned char g, unsigned char b) {
    glPushAttrib(GL_CURRENT_BIT);
    glColor3ub(r, g, b);
    int width = 0;
    for (const char* c = text; *c; c++) {
        glftRenderChar(*c, x, y, scale);
        x += (glftDefaultFont->characters[(unsigned char)*c].advance >> 6) * scale;
        width += (glftDefaultFont->characters[(unsigned char)*c].advance >> 6) * scale;
    }

    glPopAttrib();
    return width;
}

int glftMeasureString(const char* text, float scale) {
    int width = 0;
    for (const char* c = text; *c; c++) {
        glftCharacter ch = glftDefaultFont->characters[(unsigned char)*c];
        width += (ch.advance >> 6) * scale;
    }
    return width;
}

void glftCleanup() {
    if (glftDefaultFont) {
        for (unsigned char c = 0; c < 128; c++) {
            glDeleteTextures(1, &glftDefaultFont->characters[c].textureID);
        }
        free(glftDefaultFont);
    }
}


