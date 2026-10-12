#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv) {

    DIR *dir = opendir("/"); 

    struct dirent *entry; 

    while((entry = readdir(dir)) != NULL) {
        printf("(%X)%20s\t%lu\n", entry->d_type, entry->d_name, entry->d_ino);
    }

    closedir(dir);
    return EXIT_SUCCESS;
}