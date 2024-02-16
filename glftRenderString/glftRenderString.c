#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <GLFW/glfw3.h>
#include <ft2build.h>
#include FT_FREETYPE_H

typedef struct {
    unsigned int textureID;
    unsigned int size_x;
    unsigned int size_y;
    unsigned int bearing_x;
    unsigned int bearing_y;
    unsigned int advance;
} glftCharacter;

typedef struct {
    char font_name[256];
    char filename[256];
    glftCharacter characters[128];
} glftFont;

glftFont* glftDefaultFont = NULL;

bool glftSetCurrentFont(glftFont* font) {
    glftDefaultFont = font;
    return true;
}

glftFont* glftLoadFont(char* filename, int fontsize) {

    glftFont* pFont = malloc(sizeof(glftFont));
    strcpy(pFont->filename, filename); 

    glEnable(GL_TEXTURE_2D);

    FT_Library ft;
    if (FT_Init_FreeType(&ft)) {
        printf("ERROR::FREETYPE: Could not initialize FreeType library\n");
        return NULL;
    }

    FT_Face face;
    if (FT_New_Face(ft, filename, 0, &face)) {
        printf("ERROR::FREETYPE: Could not load font\n");
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
                GL_RGB,
                face->glyph->bitmap.width,
                face->glyph->bitmap.rows,
                0,
                GL_LUMINANCE, // ALPHA
                GL_UNSIGNED_BYTE,
                face->glyph->bitmap.buffer
            );

            pFont->characters[c].textureID = texture;
            pFont->characters[c].size_x = (int)face->glyph->bitmap.width;
            pFont->characters[c].size_y = (int)face->glyph->bitmap.rows;
            pFont->characters[c].bearing_x = face->glyph->bitmap_left;
            pFont->characters[c].bearing_y = face->glyph->bitmap_top;
            pFont->characters[c].advance = (unsigned int)(face->glyph->advance.x);
        }
        glBindTexture(GL_TEXTURE_2D, 0);
    }

    FT_Done_Face(face);
    FT_Done_FreeType(ft);

    return pFont;
}


void glftRenderText(const char* text, float x, float y, float scale, int r, int g, int b) {
    for (const char* c = text; *c; c++) {
        glftCharacter ch = glftDefaultFont->characters[(unsigned char)*c];

        float xpos = x + ch.bearing_x * scale;
        float ypos = y - (ch.size_y - ch.bearing_y) * scale;

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

        x += (ch.advance >> 6) * scale;
    }

    glBindTexture(GL_TEXTURE_2D, 0);
}

int glftMeasureString(const char* text, float scale) {
    int x=0;
    for (const char* c = text; *c; c++) {
        glftCharacter ch = glftDefaultFont->characters[(unsigned char)*c];

        float xpos = 0 + ch.bearing_x * scale;
        float ypos = 0 - (ch.size_y - ch.bearing_y) * scale;

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

        x += (ch.advance >> 6) * scale;
    }

    glBindTexture(GL_TEXTURE_2D, 0);

    return 0;
}
