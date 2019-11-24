#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

int main() {
    char buffer[256];
    // int fd = open("file.txt", O_RDONLY);
    // printf("file decriptor %d", fd);
    // ssize_t read_count = read(fd, buffer, 256);
    write(1, "hello world", 11);
    // printf("read %ld", read_count);
    // printf("Got: %s", buffer);
}