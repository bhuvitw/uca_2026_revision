#include <sys/types.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char** argv) {
    char *filename = argv[1]; 

    struct stat sb; 

    if(stat(filename, &sb) != -1)
    {
        printf("%s is %ld bytes long.\n", filename, sb.st_size);
    }
}