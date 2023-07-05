/*****************************************************
 *                                                   *
 *                       /$$                         *
 *                      | $$                         *
 *   /$$$$$$$  /$$   /$$| $$  /$$$$$$  /$$   /$$     *
 *  | $$__  $$| $$  | $$| $$ /$$__  $$|  $$ /$$/     *
 *  | $$  \ $$| $$  | $$| $$| $$  \ $$ \  $$$$/      *
 *  | $$  | $$| $$  | $$| $$| $$  | $$  >$$  $$      *
 *  | $$  | $$|  $$$$$$/| $$| $$$$$$$/ /$$/\  $$     *
 *  |__/  |__/ \______/ |__/| $$____/ |__/  \__/     *
 *                          | $$                     *
 *                          | $$                     *
 *                          |__/                     *
 *                                                   *
 *****************************************************
 *                                                   *
 *       Welcome to "The Game of Elements"           *
 *                                                   *
 *      In this game, you'll explore a vibrant       *
 *     world of evolving elements and intricate      *
 *    interactions. Strategize and adapt to shape    *
 *   the destiny of your elemental civilization.     *
 *                                                   *
 *****************************************************
 *                                                   *
 *                By A.I. guided by Simon.           *
 *                                                   *
 *****************************************************
 *                                                   *
 *          Thank you for using ChatGPT!             *
 *    If you have any questions, feel free to ask.   *
 *                                                   *
 *****************************************************/

#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/glu.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define CELL_SIZE 10
#define WIDTH (WINDOW_WIDTH / CELL_SIZE)
#define HEIGHT (WINDOW_HEIGHT / CELL_SIZE)
#define FPS 10

SDL_Window* window;
SDL_GLContext context;

typedef enum {
    ORGANISM,
    FOOD,
    WASTE,
    FIELD,
    GRASS,
    WATER,
    DEAD_FOOD
} CellType;

typedef struct {
    CellType type;
    int food;
    float life;
    int age;
    bool canReproduce;
} Cell;

Cell grid[WIDTH][HEIGHT];
Cell nextGrid[WIDTH][HEIGHT];

#define DEFINE_CELL(x, y, cellType, cellFood, cellLife, cellAge, cellReproduce) \
    grid[x][y].type = cellType; \
    grid[x][y].food = cellFood; \
    grid[x][y].life = cellLife; \
    grid[x][y].age = cellAge; \
    grid[x][y].canReproduce = cellReproduce;

void initialize_grid() {
    for (int x = 0; x < WIDTH; x++) {
        for (int y = 0; y < HEIGHT; y++) {
            grid[x][y].type = WATER;
            grid[x][y].food = 0;
            grid[x][y].life = 2.0f;
            grid[x][y].age = 0;
            grid[x][y].canReproduce = false;
        }
    }

    // Randomly add different cell types
    for (int i = 0; i < WIDTH * HEIGHT * 0.2; i++) {
        int x = rand() % WIDTH;
        int y = rand() % HEIGHT;

        int random = rand() % 100;
        if (random < 30) {
            DEFINE_CELL(x, y, ORGANISM, 0, 3.0f, 0, true);
        } else if (random < 60) {
            DEFINE_CELL(x, y, FOOD, 0, 0.0f, 0, false);
        } else if (random < 80) {
            DEFINE_CELL(x, y, WASTE, 0, 0.0f, 0, false);
        } else if (random < 90) {
            DEFINE_CELL(x, y, FIELD, 0, 0.0f, 0, false);
        } else {
            DEFINE_CELL(x, y, GRASS, 0, 0.0f, 0, false);
        }
    }
}

void draw_grid() {
    glClear(GL_COLOR_BUFFER_BIT);
    for (int x = 0; x < WIDTH; x++) {
        for (int y = 0; y < HEIGHT; y++) {
            float color[3];
            Cell cell = grid[x][y];
            switch (cell.type) {
                case ORGANISM:
                    color[0] = 1.0f;  // Red component
                    color[1] = 0.8f;  // Green component (skincolor)
                    color[2] = 0.6f;  // Blue component
                    break;
                case FOOD:
                    color[0] = 1.0f;
                    color[1] = 0.0f;
                    color[2] = 0.0f;
                    break;
                case WASTE:
                    color[0] = 0.5f;
                    color[1] = 0.5f;
                    color[2] = 0.5f;
                    break;
                case FIELD:
                    color[0] = 0.6f;
                    color[1] = 0.4f;
                    color[2] = 0.2f;
                    break;
                case GRASS:
                    color[0] = 0.0f;
                    color[1] = 1.0f;
                    color[2] = 0.0f;
                    break;
                case WATER:
                    color[0] = 0.0f;
                    color[1] = 0.0f;
                    color[2] = 1.0f;
                    break;
                case DEAD_FOOD:
                    color[0] = 1.0f;
                    color[1] = 0.0f;
                    color[2] = 0.0f;
                    break;
                default:
                    break;
            }
            glColor3fv(color);
            glBegin(GL_QUADS);
            glVertex2i(x * CELL_SIZE, y * CELL_SIZE);
            glVertex2i(x * CELL_SIZE + CELL_SIZE, y * CELL_SIZE);
            glVertex2i(x * CELL_SIZE + CELL_SIZE, y * CELL_SIZE + CELL_SIZE);
            glVertex2i(x * CELL_SIZE, y * CELL_SIZE + CELL_SIZE);
            glEnd();
        }
    }
    SDL_GL_SwapWindow(window);
}

int count_neighbors(int x, int y) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
            int neighborX = (x + i + WIDTH) % WIDTH;
            int neighborY = (y + j + HEIGHT) % HEIGHT;
            if (grid[neighborX][neighborY].type == ORGANISM ||
                grid[neighborX][neighborY].type == FOOD) {
                count++;
            }
        }
    }
    return count;
}

void update_grid() {
    for (int x = 0; x < WIDTH; x++) {
        for (int y = 0; y < HEIGHT; y++) {
            CellType newType = grid[x][y].type;
            int newFood = grid[x][y].food;
            float newLife = grid[x][y].life;
            int newAge = grid[x][y].age;
            bool newCanReproduce = grid[x][y].canReproduce;
            int neighbors = count_neighbors(x, y);
            switch (grid[x][y].type) {
                case ORGANISM:
                    newAge++;
                    if (newLife <= 0.0f || newAge >= 10) {
                        newType = DEAD_FOOD;
                        newFood = 0;
                        newLife = 0.0f;
                        newAge = 0;
                        newCanReproduce = false;
                    } else {
                        newLife -= (1000.0f / FPS) / 1000.0f;
                        newCanReproduce = false;
                        if (newLife <= 0.0f && neighbors < 9) {
                            newType = FOOD;
                            newFood = 3;
                        }
                    }
                    break;
                case FOOD:
                    if (newFood <= 0) {
                        newType = WASTE;
                        newFood = 0;
                    } else {
                        newFood--;
                    }
                    break;
                case WASTE:
                    if (newLife >= 3.0f) {
                        newType = FIELD;
                        newLife = 0.0f;
                    } else {
                        newLife += (1000.0f / FPS) / 1000.0f;
                    }
                    break;
                case FIELD:
                    if (newLife >= 5.0f) {
                        newType = GRASS;
                        newLife = 0.0f;
                    } else {
                        newLife += (1000.0f / FPS) / 1000.0f;
                    }
                    break;
                case GRASS:
                    if (newLife >= 0.0f) {
                        newType = FIELD;
                        newLife = 0.0f;
                    } else {
                        newLife += (1000.0f / FPS) / 1000.0f;
                    }
                    break;
                case WATER:
                    if (newLife >= 2.0f) {
                        newType = FIELD;
                        newLife = 0.0f;
                    } else {
                        newLife += (1000.0f / FPS) / 1000.0f;
                    }
                    break;
                case DEAD_FOOD:
                    if (newLife >= 10.0f) {
                        newType = FIELD;
                        newLife = 0.0f;
                    } else {
                        newLife += (1000.0f / FPS) / 1000.0f;
                    }
                    break;
                default:
                    break;
            }
            nextGrid[x][y].type = newType;
            nextGrid[x][y].food = newFood;
            nextGrid[x][y].life = newLife;
            nextGrid[x][y].age = newAge;
            nextGrid[x][y].canReproduce = newCanReproduce;
        }
    }
    // Copy nextGrid to grid
    for (int x = 0; x < WIDTH; x++) {
        for (int y = 0; y < HEIGHT; y++) {
            grid[x][y] = nextGrid[x][y];
        }
    }
}

int main() {
    srand(time(NULL));
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }
    window = SDL_CreateWindow("Simon's Game of Hive", SDL_WINDOWPOS_UNDEFINED,
                              SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT,
                              SDL_WINDOW_OPENGL);
    if (window == NULL) {
        printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }
    context = SDL_GL_CreateContext(window);
    SDL_GL_SetSwapInterval(1);
    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0, WINDOW_WIDTH, WINDOW_HEIGHT, 0);
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    initialize_grid();
    SDL_Event event;
    bool running = true;
    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = false;
            }
        }
        update_grid();
        draw_grid();
        SDL_Delay(1000 / FPS);
    }
    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}
