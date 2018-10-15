#include <stdio.h>

// This is a function pointer. You will learn about this later --- for
// now, don't worry about it
static int (*sumtorial_asm)(int) = (int (*)(int))0x8000U;

int sumtorial_c(int n) {
    if (n == 0 || n == 1) {
        return n;
    } else {
        return n + sumtorial_c(n - 1);
    }
}

int main(void) {
    int i;

    for (i = 0; i <= 32; i++) {
        printf("sumtorial_asm(%d) = %d\n", i, sumtorial_asm(i));
        printf("sumtorial_c(%d)   = %d\n", i, sumtorial_c(i));
    }

    return 0;
}
