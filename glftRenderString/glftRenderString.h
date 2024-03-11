typedef struct {
    unsigned int textureID;
    int size_x;
    int size_y;
    int bearing_x;
    int bearing_y;
    int advance;
    int height;
} glftCharacter;

typedef struct {
    char font_name[256];
    char filename[256];
    glftCharacter characters[128];
} glftFont;

bool glftSetCurrentFont(glftFont* font);
glftFont* glftLoadFont(char* filename, int fontsize);

void glftRenderChar(char c, float x, float y, float scale);
void glftRenderCharRotated(char c, float x, float y, float scale, float rotation);


int glftRenderText(const char* text, float x, float y, float scale, unsigned char r, unsigned char g, unsigned char b);

int glftMeasureString(const char* text, float scale);
void glftCleanup();
