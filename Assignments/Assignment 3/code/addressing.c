//
//  addressing.c
//  
//
//  Created by Eric Chan on 2016-01-26.
//
//

#include <stdio.h>

int a[10] = {0,1,2,3,4,5,6,7,8,9};

int main() {
    printf ("%i\n", &a[4] - a);
    printf ("%i\n", &a);
    printf ("%i\n", *(a+9));
    printf ("%i\n", &a[7]- &a[2]);
    printf ("%i\n", *(a + (&a[7]-a+2)));
}
