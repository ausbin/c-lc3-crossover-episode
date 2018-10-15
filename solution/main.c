#include <stdio.h>

// This is a function pointer. You will learn about this later --- for
// now, don't worry about it. All you need to know is that points at
// your assembly code, which is at 0x8000
static int (*nice_asm)(void) = (int (*)(void))0x8000U;

int nice_c(void) {
    int i, n;

    n = 0;

    for (i = 0; i <= 69; i++)
        n += i;

    return n;
}

int main(void) {
    int a;

    a = nice_asm();
    printf("nice_asm() = %d = 0x%x\n", a, a);

    a = nice_c();
    printf("nice_c()   = %d = 0x%x\n", a, a);

    return 0;
}
