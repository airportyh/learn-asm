#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

int main() {
    char c[12];
    char temp;
    c[0] = 'H';
    c[1] = 'e';
    c[2] = 'l';
    c[3] = 'l';
    c[4] = 'o';
    c[5] = ' ';
    c[6] = 'w';
    c[7] = 'o';
    c[8] = 'r';
    c[9] = 'l';
    c[10] = 'd';
    c[11] = '!';
    temp = c[1];
    temp+= 20;
    c[1] = temp;
    write(1, &c, 12);
}