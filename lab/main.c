#include <stdio.h>

// This is a function pointer. You will learn about this later --- for
// now, don't worry about it. All you need to know is that points at
// your assembly code, which is at 0x8000
static int (*sumtorial_asm)(int) = (int (*)(int))0x8000U;

int sumtorial_c(int n) {
    //
    // YOUR CODE HERE
    //
}

int main(void) {
    //
    // YOUR CODE HERE
    // Hint: you need to call both sumtorial_c() and sumtorial_asm()
    //       from 0 to 32 inclusive
    //

    return 0;
}
