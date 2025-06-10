// Print every third number from 24 to 42.
#include <stdio.h>

int main(void) {
    // This 'for' loop is effectively equivalent to a while loop.    
    // i.e. it is a while loop with a counter built in.    
    for (int x = 24; x < 42; x += 3) {
        printf("%d\n", x);
    }

    // while loop equivalent
    int x = 24;

    while (x < 42) {
        printf("%d\n", x);
        x += 3
    }

    // goto

    loop_init:
    int x = 24;

    loop_cond:
    if (x >= 42) goto loop_term;

    loop_body:
    printf("%d\n", x);

    loop_step:
    x += 3
    goto loop_cond;

    loop_term:

}