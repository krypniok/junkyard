#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>



/*
#define ROWS 5
#define COLS 5

// Spielfeld initialisieren
bool game[ROWS][COLS] = {
{ false, false, true, false, false},
{ false, true, false, true, false},
{ true, false, true, false, true},
{ false, true, false, true, false},
{ false, false, true, false, false}
};


// Funktion zum Überprüfen, ob das Spielfeld komplett ausgeschaltet ist
bool checkSolution() {
for (int row = 0; row < ROWS; row++) {
for (int col = 0; col < COLS; col++) {
if (game[row][col]) {
return false;
}
}
}
return true;
}

// Funktion zum Ausgeben des Spielfelds
void printGame() {
for (int row = 0; row < ROWS; row++) {
for (int col = 0; col < COLS; col++) {
printf(game[row][col] ? "X " : "O ");
}
printf("\n");
}
printf("\n");
}


bool calculateSolution(int row, int col) {
bool solved = false;
if (checkSolution()) {
return true;;
}
printf("#row = %i, #col = %i\n", row, col);

if(col > 4) { col -= 5; row++; }
if(row > 4) { row -= 5; }

game[row][col] = !game[row][col];
if (row > 0) {
game[row-1][col] = !game[row-1][col];
}
if (row < ROWS - 1) {
game[row+1][col] = !game[row+1][col];
}
if (col > 0) {
game[row][col-1] = !game[row][col-1];
}
if (col < COLS - 1) {
game[row][col+1] = !game[row][col+1];
}
solved = calculateSolution(row, col + 1);

game[row][col] = !game[row][col];
if (row > 0) {
game[row-1][col] = !game[row-1][col];
}
if (row < ROWS - 1) {
game[row+1][col] = !game[row+1][col];
}
if (col > 0) {
game[row][col-1] = !game[row][col-1];
}
if (col < COLS - 1) {
game[row][col+1] = !game[row][col+1];
}

if (!solved && (col >= COLS-1) && (row < ROWS - 1)) {
solved = calculateSolution(row + 1, 0);
} else if (!solved && col < COLS - 1) {
solved = calculateSolution(row, col + 1);
}

return solved;
}


int main() {
printf("Spielfeld zu Beginn: \n");
printGame();

if (calculateSolution(0,0)) {
printf("Lösung gefunden: \n");
printGame();
} else {
printf("Keine Lösung gefunden.\n");
}

return 0;
}
*/

/*
#define ROWS 5
#define COLS 5
#define MAX_SIZE ROWS*COLS

typedef struct node_t {
struct node_t* left;
struct node_t* right;
struct node_t* up;
struct node_t* down;
struct node_t* col;
int row;
} node;

node* root;
node* columns[COLS];
node* rows[MAX_SIZE];
int grid[ROWS][COLS] = {
{1, 0, 0, 0, 1},
{0, 1, 0, 1, 0},
{0, 0, 1, 0, 0},
{0, 1, 0, 1, 0},
{1, 0, 0, 0, 1}
};

void createDLX() {
int i, j, pos;
node* prev, * current;

root = (node*) malloc(sizeof(node));
root->left = root->right = root->up = root->down = root;
root->col = NULL;

for (j = 0; j < COLS; j++) {
columns[j] = (node*) malloc(sizeof(node));
columns[j]->left = root;
columns[j]->right = root->right;
columns[j]->up = columns[j]->down = columns[j];
columns[j]->col = columns[j];
root->right = columns[j];

current = columns[j];

for (i = 0; i < ROWS; i++) {
if (grid[i][j] == 1) {
rows[pos] = (node*) malloc(sizeof(node));
rows[pos]->row = i;
rows[pos]->col = current;
rows[pos]->up = current->up;
rows[pos]->down = current;
current->up->down = rows[pos];
current->up = rows[pos];

if (prev != NULL) {
rows[pos]->left = prev;
prev->right = rows[pos];
} else {
rows[pos]->left = rows[pos]->right = rows[pos];
}

prev = rows[pos];
pos++;
}
}

prev = NULL;
}
}

void cover(node* col) {
node *i, *j;
col->right->left = col->left;
col->left->right = col->right;

for (i = col->down; i != col; i = i->down) {
for (j = i->right; j != i; j = j->right) {
j->down->up = j->up;
j->up->down = j->down;
j->col->size--;
}
}
}

void uncover(node* col) {
node *i, *j;
for (i = col->up; i != col; i = i->up) {
for (j = i->left; j != i; j = j->left) {
j->col->size++;
j->down->up = j;
j->up->down = j;
}
}
col->right->left = col;
col->left->right = col;
}

bool solve(int k) {
int minSize = ROWS + 1;
node *col, *i, *j;

if (root->right == root) {
return true;
}

for (i = root->right; i != root; i = i->right) {
if (i->size < minSize) {
minSize = i->size;
col = i;
}
}

cover(col);

for (i = col->down; i != col; i = i->down) {
for (j = i->right; j != i; j = j->right) {
cover(j->col);
}

if (solve(k + 1)) {
printf("%d, %d\n", i->row, i->col - columns);
return true;
}

for (j = i->left; j != i; j = j->left) {
uncover(j->col);
}
}

uncover(col);
return false;
}

int main() {
createDLX();
solve(0);
return 0;
}
*/

/*
Die Lösung einer 5x5 Lights-Out Matrix mit der Gauss-Methode kann durch folgenden Code in C gefunden werden:

```
#include


int main() {
int lights[5][5] = {{0,1,1,0,1},
{1,1,0,1,0},
{0,1,0,0,1},
{1,0,1,1,0},
{0,0,1,0,0}}; // Ausgangslichtmuster

int row_offsets[5] = {0,1,2,3,4}; // Anfangszeilenoffsets
int col_offsets[5] = {0,1,2,3,4}; // Anfangsspaltenoffsets

// Gauss-Methode
for(int i = 0; i < 5; i++) {
for(int j = i+1; j < 5; j++) {
int factor = lights[row_offsets[j]][col_offsets[i]] / lights[row_offsets[i]][col_offsets[i]];
for(int k = i; k < 5; k++) {
lights[row_offsets[j]][col_offsets[k]] ^= lights[row_offsets[i]][col_offsets[k]] * factor;
}
}
}

// Rückwärtssubstitution
for (int i = 4; i >= 0; i--) {
for (int j = i-1; j >= 0; j--) {
int factor = lights[row_offsets[j]][col_offsets[i]] / lights[row_offsets[i]][col_offsets[i]];
for (int k = i; k < 5; k++) {
lights[row_offsets[j]][col_offsets[k]] ^= lights[row_offsets[i]][col_offsets[k]] * factor;
}
}
}

// Ausgabe der Lösung
printf("Die Lösung ist:\n");
for (int i = 0; i < 5; i++) {
for (int j = 0; j < 5; j++) {
printf("%d ", lights[row_offsets[i]][col_offsets[j]]);
}
printf("\n");
}

return 0;
}
*/

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


int null[5][5] = {
{0,0,0,0,0},
{0,0,0,0,0},
{0,0,0,0,0},
{0,0,0,0,0},
{0,0,0,0,0}
}; // Ausgangslichtmuster

int level[5][5] = {
{0,0,0,0,0},
{0,0,0,0,0},
{1,0,1,0,1},
{0,0,0,0,0},
{0,0,0,0,0}
}; // Ausgangslichtmuster

int solution[5][5] = {
{0,0,0,0,0},
{0,0,0,0,0},
{0,0,0,0,0},
{0,0,0,0,0},
{0,0,0,0,0}
}; // Ausgangslichtmuster


bool checkPatternClear(int *pattern) {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int offset = (j*5)+i;
            if( pattern[offset] == 1 ) return false;
        }
    }
    return true;
}

bool resetPattern(int *pattern) {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int offset = (i*5)+j;
            pattern[offset] = *shadows[offset];
        }
    }
    return true;
}

void printPattern(int *pattern) {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int offset = (i*5)+j;
            printf("%i ", pattern[offset]);
        }
        printf("\n");
    }
    printf("\n");
}

void print3Patterns(int *pattern1, int *pattern2, int *pattern3) {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int offset = (i*5)+j;
            printf("%i ", pattern1[offset]); 
        }
        printf("\t");
        for (int j = 0; j < 5; j++) {
            int offset = (i*5)+j;
            printf("%i ", pattern2[offset]); 
        }
        printf("\t");
        for (int j = 0; j < 5; j++) {
            int offset = (i*5)+j;
            printf("%i ", pattern3[offset]); 
        }
        printf("\n");
    }
    printf("\n");
}

int translatePatternToInt(int *pattern) {
    int level = 0;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int offset = (j*5)+i;
            int bitpow = ((*(int*)pattern + offset));
            if(pattern[offset] == 1) { 
                level += (int)pow(2, bitpow);
            }
        }
    }
    return level;
}

int* translateIntToPattern(int level) {
    int* pattern = malloc(sizeof(int) * 5 * 5);
    memset(pattern, 0, 5 * 5 * 4);
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int offset = (j*5)+i;
            int bitpow = (j*5)+i+0;
//            int bitpow = ((*(int*)pattern + offset));
            if((level) & (1<<(bitpow))) {
                 pattern[offset] = 1; 
            }
        }
    }
    return pattern;
}

void togglePattern(int *pattern, int x, int y) {
    if(x >= 0 && x <= 4 && y >= 0 && y <= 4) {
    int offset = (y*5)+x;
    pattern[offset] = !pattern[offset]; 
    }
    return;
}


void applyPatternToPattern(int *pattern, int *pattern2) {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int offset = (j*5)+i;
           // printf("%i\n",pattern2[offset]);
            if(pattern2[offset] == 1) { 
                togglePattern(pattern, i, j);
                togglePattern(pattern, i-1, j);
                togglePattern(pattern, i+1, j);
                togglePattern(pattern, i, j-1);
                togglePattern(pattern, i, j+1);
            }
        }
    }
    return;
}



int main() {

 //   printPattern((int*)lights);
   // printPattern((int*)shadows);
   // printf("%i\n", translatePatternToInt((int*)lights));
//    printPattern(translateIntToPattern(21504));

    //applyPatternToPattern((int*)lights, (int*)shadows);

    //printPattern((int*)lights);

   
    int i;
    for(i=0; i<pow(2, 25); i++) {
        int *pattern = translateIntToPattern(i);

        resetPattern((int*)lights);
        applyPatternToPattern((int*)lights, (int*)pattern);

        if( checkPatternClear((int*)lights)) {
        }

        print3Patterns((int*)lights, (int*)shadows, (int*)pattern);

        free(pattern);
    }

   // printf("%i\n", i);
    printf("Done.\n");

    return 0;
}
