#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>

#define STATUS_BAR_HEIGHT 1

void display_file(const char* filename) {
    FILE* file = fopen(filename, "r+");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        return;
    }

    initscr(); // Initialize ncurses
    start_color(); // Enable color
    use_default_colors(); // Use terminal's default colors

    // Define color pairs
    init_pair(1, COLOR_WHITE, COLOR_BLUE); // Editor window
    init_pair(2, COLOR_WHITE, COLOR_RED); // Status bar

    // Get terminal dimensions
    int term_width, term_height;
    getmaxyx(stdscr, term_height, term_width);

    // Create windows for editor window and status bar
    WINDOW* editor_win = newwin(term_height - STATUS_BAR_HEIGHT, term_width, 0, 0);
    WINDOW* status_win = newwin(STATUS_BAR_HEIGHT, term_width, term_height - STATUS_BAR_HEIGHT, 0);

    // Set colors for editor window and status bar
    wbkgd(editor_win, COLOR_PAIR(1));
    wbkgd(status_win, COLOR_PAIR(2));

    // Enable scrolling for the editor window
    scrollok(editor_win, TRUE);

    // Read file contents into a buffer
    char* buffer = NULL;
    size_t buffer_size = 0;
    ssize_t read;
    while ((read = getline(&buffer, &buffer_size, file)) != -1) {
        wprintw(editor_win, "%s", buffer);
    }

    // Refresh and display the editor window and status bar
    refresh();
    wrefresh(editor_win);
    wrefresh(status_win);

    // Move cursor to the beginning of the editor window
    wmove(editor_win, 0, 0);
    keypad(editor_win, TRUE); // Enable special character detection

    int ch;
    int cur_y = 0, cur_x = 0; // Current cursor position

    // Enter the text editing loop
    while ((ch = wgetch(editor_win)) != KEY_F(10)) { // Exit on F10 key press
        switch (ch) {
            case KEY_UP:
                if (cur_y > 0) {
                    cur_y--;
                    wmove(editor_win, cur_y, cur_x);
                }
                break;
            case KEY_DOWN:
                if (cur_y < term_height - STATUS_BAR_HEIGHT - 1) {
                    cur_y++;
                    wmove(editor_win, cur_y, cur_x);
                }
                break;
            case KEY_LEFT:
                if (cur_x > 0) {
                    cur_x--;
                    wmove(editor_win, cur_y, cur_x);
                }
                break;
            case KEY_RIGHT:
                if (cur_x < term_width - 1) {
                    cur_x++;
                    wmove(editor_win, cur_y, cur_x);
                }
                break;
            case KEY_DC: // Delete character
            case KEY_BACKSPACE:
            case 127:
                // Shift all characters to the left starting from the current position
                for (int i = cur_x; i < term_width - 1; i++) {
                    mvwaddch(editor_win, cur_y, i, mvwinch(editor_win, cur_y, i + 1) & A_CHARTEXT);
                }
                mvwaddch(editor_win, cur_y, term_width - 1, ' '); // Clear the last character
                wmove(editor_win, cur_y, cur_x);
                break;
            default: // Insert character
                waddch(editor_win, ch);
                if (cur_x < term_width - 1) {
                    cur_x++;
                    wmove(editor_win, cur_y, cur_x);
                }
                break;
        }

        wrefresh(editor_win);
    }

    // Save changes back to the file
    rewind(file);
    werase(editor_win);
    wmove(editor_win, 0, 0);

    for (int y = 0; y < term_height - STATUS_BAR_HEIGHT; y++) {
        char line[term_width];
        mvwinstr(editor_win, y, 0, line);
        fprintf(file, "%s\n", line);
    }

    fclose(file);
    free(buffer);

    // Clean up ncurses
    endwin();
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char* filename = argv[1];
    display_file(filename);

    return 0;
}
