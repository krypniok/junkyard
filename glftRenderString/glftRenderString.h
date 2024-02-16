
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



bool glftSetCurrentFont(glftFont* font);
glftFont* glftLoadFont(char* filename, int fontsize);
void glftRenderText(const char* text, float x, float y, float scale, int r, int g, int b);
int glftMeasureString(const char* text, float scale);