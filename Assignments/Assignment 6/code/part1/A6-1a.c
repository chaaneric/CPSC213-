#include <stdlib.h>
#include <stdio.h>
int i   = 10;
int a[] = {10,-30,-12,4,8};
int s   = 0;


int main() {
for (i = 0; i<5; i++) {
    if (a[i] > 0)
        s += a[i];
    }

    printf("%d\n", s);
    return 0;
}
