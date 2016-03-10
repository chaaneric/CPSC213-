#include <stdio.h>

int c[10] = {0,0,0,0,0,0,0,0,0,0};
int *s = c;


void b(int a0, int a1) {
    s[a0] = s[a0] + a1;
}

void foo() {
    b(4,3);
    b(2,1);
}


int main() {
    foo();
    for (int i = 0; i < 10; i++)
        printf("%d\n", s[i]);
}

