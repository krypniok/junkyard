#include <stdio.h>
#include <stdlib.h>

void run(char* command, char* outputFile) {
    char commandStr[1000];
    sprintf(commandStr, "%s > %s 2>&1 & echo $!", command, outputFile);
    int processId = system(commandStr);
    printf("processID of process in background is: %i\n", processId);
}

int main() {
    char command[1000];
    char outputFile[] = "/dev/null";

    sprintf(command, "export DISPLAY=:2; cinnamon-session");
    run(command, outputFile);

    return 0;
}
