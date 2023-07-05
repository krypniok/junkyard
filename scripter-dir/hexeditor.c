#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>

#define BYTES_PER_LINE 16
#define MAX_ROWS 25

unsigned char *data;
size_t file_size;
int selected_index = 0;
int start_offset = 0;

void display_hex() {
    int row, col;
    getmaxyx(stdscr, row, col);

    clear();

    int max_rows = row - 2;  // Leave the last two rows for input and status bar

    int i, j;
    for (i = 0; i < max_rows; i++) {
        int index = start_offset + i * BYTES_PER_LINE;
        if (index >= file_size) {
            break;
        }

        move(i, 0);
        attron(A_BOLD);
        printw("%08lx  ", (unsigned long)index);

        for (j = 0; j < BYTES_PER_LINE; j++) {
            if (index + j >= file_size) {
                printw("   ");
            } else {
                if (index + j == selected_index) {
                    attron(A_REVERSE);
                }
                printw("%02x ", data[index + j]);
                attroff(A_REVERSE);
            }
        }

        printw(" | ");

        for (j = 0; j < BYTES_PER_LINE; j++) {
            if (index + j >= file_size) {
                break;
            }
            if (data[index + j] >= 32 && data[index + j] <= 126) {
                printw("%c", data[index + j]);
            } else {
                printw(".");
            }
        }
    }

    // Display status bar
    mvprintw(row - 1, 0, "File: <filename>  Offset: %08lx  Size: %lu bytes", (unsigned long)start_offset, file_size);

    refresh();
}

void save_changes(const char *filename) {
    FILE *file = fopen(filename, "wb");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }

    fwrite(data, 1, file_size, file);
    fclose(file);
}

void cleanup() {
    if (data != NULL) {
        free(data);
        data = NULL;
    }
}

void move_to_next_byte() {
    int max_offset = file_size - 1;
    if (selected_index < max_offset) {
        selected_index++;
        if (selected_index >= start_offset + MAX_ROWS * BYTES_PER_LINE) {
            start_offset += BYTES_PER_LINE;
            if (start_offset + MAX_ROWS * BYTES_PER_LINE > file_size) {
                start_offset = file_size - MAX_ROWS * BYTES_PER_LINE;
                if (start_offset < 0) {
                    start_offset = 0;
                }
            }
        }
        display_hex();
    }
}

void move_to_previous_byte() {
    if (selected_index > 0) {
        selected_index--;
        if (selected_index < start_offset) {
            start_offset -= BYTES_PER_LINE;
            if (start_offset < 0) {
                start_offset = 0;
            }
        }
        display_hex();
    }
}

void move_to_up_byte() {
    if (selected_index >= BYTES_PER_LINE) {
        selected_index -= BYTES_PER_LINE;
        if (selected_index < start_offset) {
            start_offset -= BYTES_PER_LINE;
            if (start_offset < 0) {
                start_offset = 0;
            }
        }
        display_hex();
    }
}

void move_to_down_byte() {
    int max_offset = file_size - 1;
    if (selected_index < max_offset - BYTES_PER_LINE) {
        selected_index += BYTES_PER_LINE;
        if (selected_index >= start_offset + MAX_ROWS * BYTES_PER_LINE) {
            start_offset += BYTES_PER_LINE;
            if (start_offset + MAX_ROWS * BYTES_PER_LINE > file_size) {
                start_offset = file_size - MAX_ROWS * BYTES_PER_LINE;
                if (start_offset < 0) {
                    start_offset = 0;
                }
            }
        }
        display_hex();
    }
}

void move_to_next_page() {
    int max_offset = file_size - 1;
    if (selected_index < max_offset) {
        int remaining_rows = max_offset / BYTES_PER_LINE - start_offset / BYTES_PER_LINE;
        int max_rows = MAX_ROWS;
        if (remaining_rows < MAX_ROWS) {
            max_rows = remaining_rows;
        }
        selected_index += BYTES_PER_LINE * max_rows;
        if (selected_index >= max_offset) {
            selected_index = max_offset;
        }
        start_offset += BYTES_PER_LINE * max_rows;
        if (start_offset + MAX_ROWS * BYTES_PER_LINE > file_size) {
            start_offset = file_size - MAX_ROWS * BYTES_PER_LINE;
            if (start_offset < 0) {
                start_offset = 0;
            }
        }
        display_hex();
    }
}

void move_to_previous_page() {
    if (selected_index > 0) {
        int remaining_rows = start_offset / BYTES_PER_LINE;
        int max_rows = MAX_ROWS;
        if (remaining_rows < MAX_ROWS) {
            max_rows = remaining_rows;
        }
        selected_index -= BYTES_PER_LINE * max_rows;
        if (selected_index < 0) {
            selected_index = 0;
        }
        start_offset -= BYTES_PER_LINE * max_rows;
        if (start_offset < 0) {
            start_offset = 0;
        }
        display_hex();
    }
}

void insert_byte() {
    memmove(&data[selected_index + 1], &data[selected_index], file_size - selected_index);
    data[selected_index] = 0x00;
    file_size++;
    move_to_next_byte();
    display_hex();
}

void delete_byte() {
    if (selected_index < file_size) {
        memmove(&data[selected_index], &data[selected_index + 1], file_size - selected_index - 1);
        file_size--;
        display_hex();
    }
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];

    FILE *file = fopen(filename, "rb");
    if (file == NULL) {
        // Create an empty file if it does not exist
        file = fopen(filename, "wb");
        if (file == NULL) {
            printf("Error creating file: %s\n", filename);
            return 1;
        }
    }

    fseek(file, 0, SEEK_END);
    file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    data = (unsigned char *)malloc(file_size);
    if (data == NULL) {
        printf("Memory allocation failed.\n");
        fclose(file);
        return 1;
    }

    fread(data, 1, file_size, file);
    fclose(file);

    atexit(cleanup);

    initscr();
    start_color();
    use_default_colors();
    init_pair(1, COLOR_WHITE, -1);
    init_pair(2, COLOR_BLUE, -1);

    keypad(stdscr, TRUE);
    noecho();

    wbkgd(stdscr, COLOR_PAIR(1));
    attron(COLOR_PAIR(1));

    display_hex();

    int ch;

    while ((ch = getch()) != 27) {  // Exit on ESC key
        switch (ch) {
            case KEY_DOWN:
                move_to_down_byte();
                break;
            case KEY_UP:
                move_to_up_byte();
                break;
            case KEY_LEFT:
                move_to_previous_byte();
                break;
            case KEY_RIGHT:
                move_to_next_byte();
                break;
            case KEY_NPAGE:
                move_to_next_page();
                break;
            case KEY_PPAGE:
                move_to_previous_page();
                break;
            case KEY_IC:
                insert_byte();
                break;
            case KEY_DC:
                delete_byte();
                break;
            default:
                if (selected_index == file_size - 1) {
                    char input[3];
                    input[0] = ch;
                    input[1] = getch();
                    input[2] = '\0';

                    unsigned int value;
                    sscanf(input, "%x", &value);

                    // Expand the data array to accommodate the new byte
                    unsigned char *new_data = realloc(data, file_size + 1);
                    if (new_data == NULL) {
                        printf("Memory allocation failed.\n");
                        break;
                    }
                    data = new_data;

                    // Shift the bytes after the selected position to make space for the new byte
                    memmove(&data[selected_index + 2], &data[selected_index + 1], file_size - selected_index - 1);

                    data[selected_index] = (unsigned char)value;
                    file_size++;
                } else {
                    if ((ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F')) {
                        char input[3];
                        input[0] = ch;
                        input[1] = getch();
                        input[2] = '\0';

                        unsigned int value;
                        sscanf(input, "%x", &value);

                        data[selected_index] = (unsigned char)value;
                        move_to_next_byte();  // Move to the next byte after changing
                    }
                }
                display_hex();
                break;
        }
    }

    endwin();

    save_changes(filename);

    return 0;
}
