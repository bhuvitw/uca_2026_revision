#include <sys/types.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>
#include <sys/sysmacros.h>
#include <stdint.h>

int main(int argc, char** argv) {

    if(argc != 2){
        printf("Usage: ./fileText <file_name>\n");
        exit(1);
    }

    struct stat sb; 

    if(stat(argv[1], &sb) == -1) {
        perror("stat");
        exit(1);
    }

    printf("=== File Attributes for: %s ===\n", argv[1]);
    printf("File type:                ");
    switch(sb.st_mode & S_IFMT) {
        case S_IFBLK: printf("block device\n"); break; 
        case S_IFCHR: printf("character device\n"); break;
        case S_IFDIR: printf("directory\n"); break;
        case S_IFIFO: printf("FIFO/pipe\n"); break; 
        case S_IFLNK: printf("symlink\n"); break;
        case S_IFREG: printf("regular file\n"); break;
        case S_IFSOCK: printf("socket\n"); break;
        default: printf("unknown?\n"); break; 
    }

    printf("Permission:          %jo (octal\n", (uintmax_t) sb.st_mode);
    printf("Hard Links Count:     %ju\n", (uintmax_t) sb.st_nlink);
    printf("Owner (UID):          %ju\n", (uintmax_t) sb.st_uid);
    printf("Group (GID):          %ju\n", (uintmax_t) sb.st_gid);
    printf("Last Access Time:     %s", ctime(&sb.st_ctime)); 
    printf("Last Modification:    %s", ctime(&sb.st_atime));
    printf("Status Change Time:   %s", ctime(&sb.st_mtime));

    exit(0);
}


