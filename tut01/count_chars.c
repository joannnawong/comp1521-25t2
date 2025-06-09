#include <stdio.h>

int main(void) {

    int c;
    int count = 0;

    while ((c = getchar()) != EOF) {
        count += 1;
    }
    printf("Characters entered = %d\n", count);
    
}