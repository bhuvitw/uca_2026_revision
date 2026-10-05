#include <stdio.h>
#include <fcntl.h> //open
#include <unistd.h> // write, read, close
#include <string.h> //strcmp

int main(int argc, char* argv[]){
    (void)argc;
    if(strcmp(argv[1], "--add") == 0){
        int fd = open("audit.log", O_WRONLY | O_CREAT | O_APPEND , 0644);
        write(fd, "\n", 1); 
        write(fd, argv[2], strlen(argv[2]));
        close(fd); 
    }

    if(strcmp(argv[1], "--view") == 0){
        char s[1024];
        int linecount = 0; 
        int fd = open("audit.log", O_RDONLY, 0644);
        int byte_read = read(fd, s, sizeof s); 

        
        for(int i = 0; i<byte_read; i++){
            int k = i; 
            while(k<byte_read && s[k]!='\n'){
                k++; 
            }
            printf("%d: ", ++linecount); 
            for(int j = i; j<k; j++){
                printf("%c", s[j]);
            }
            printf("\n");
            i = k; 
        }
        close(fd); 
    }
}