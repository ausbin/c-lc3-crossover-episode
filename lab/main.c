#include <stdio.h>

// This is a function pointer. You will learn about this later --- for
// now, don't worry about it
static int (*fib_asm)(int) = (int (*)(int))0x8000U;

int fib_c(int n) {
    if (n == 0 || n == 1) {
        return n;
    } else {
        return n + fib_c(n - 1);
    }
}

int main(void) {
    int i;

    for (i = 0; i <= 32; i++) {
        printf("fib_asm(%d) = %d\n", i, fib_asm(i));
        printf("fib_c(%d) = %d\n", i, fib_c(i));
    }

    return 0;
}
