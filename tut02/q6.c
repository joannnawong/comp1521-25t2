#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto else
    if (x >= 1000) goto else
    printf("medium\n");
    goto epilogue;

    else:
        printf("small/big\n");

    epilogue:

    // if (x > 100 && x < 1000) { // 100 < x < 1000
    //     printf("medium\n");
    // } else {
    //     printf("small/big\n");
    // }
}