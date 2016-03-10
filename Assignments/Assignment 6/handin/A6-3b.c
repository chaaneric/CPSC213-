#include <stdio.h>
int x[8] = {1,2,3,0xffffffff,0xfffffffe,0,184,340057058};
int y[8] = {0,0,0,0,0,0,0,0};
int a = 8;


int f(int a0) {
    int i = 0;
    while (a0 != 0) {
        if ((a0 & 0x80000000) != 0) {
            i++;
        }
            a0 = a0 << 1;
    }
    return i;
}


int main() {
    while (a != 0) {
        a--;
        y[a] = f(x[a]);
    }
    for(int i = 0; i < 8; i++) {
        printf("%d\n", x[i]);
    }
    for(int i = 0; i < 8; i++) {
        printf("%d\n",y[i]);
    }
}