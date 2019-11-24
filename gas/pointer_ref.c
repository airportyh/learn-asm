#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

int main() {
    char c = 'a';
    write(1, &c, 1);
}