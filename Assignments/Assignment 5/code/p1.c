#include <stdio.h>
#include <stdlib.h>

struct F {
    int e;
    int f;
};

struct D {
    struct F e;
    struct F f;
};


int main (int argc, char** argv) {
    struct D* d0 = (struct D*) malloc (sizeof(struct D));
    struct F d1;
    struct F d2;
    
    d0 -> e = d1;
    d0 -> f = d2;
    
    d1.e = 1;
    d1.f = 2;
    d2.e = 3;
    d2.f = 4;
    
    d2.e = d1.f;
    
    d1.e = d2.f;
    
    
    printf("%d \n", d1.e);
    printf("%d \n", d1.f);
    printf("%d \n", d2.e);
    printf("%d \n", d2.f);
    
}