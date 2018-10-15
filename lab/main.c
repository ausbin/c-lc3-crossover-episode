#include <stdio.h>

// This is a function pointer. You will learn about this later --- for
// now, don't worry about it
static int (*fib_asm)(int) = (int (*)(int))0x8000;

int main(void) {
    int i;

    for (i = 0; i <= 32; i++) {
        printf("fib_asm(%d) = %d\n", i, fib_asm(i));
    }

    return 0;
}
