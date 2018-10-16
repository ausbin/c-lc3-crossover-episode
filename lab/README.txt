         _     ____     _____                   _    ____   
        | |   / ___|   |___ /    __ _ _ __   __| |  / ___|_ 
        | |  | |   _____ |_ \   / _` | '_ \ / _` | | |   (_)
        | |__| |__|_____|__) | | (_| | | | | (_| | | |___ _ 
        |_____\____|   |____/   \__,_|_| |_|\__,_|  \____(_)
                                                     _             _     
 __ _   __ _ _ ___ ______ _____ _____ _ _   ___ _ __(_)___ ___  __| |___ 
/ _` | / _| '_/ _ (_-<_-</ _ \ V / -_) '_| / -_) '_ \ (_-</ _ \/ _` / -_)
\__,_| \__|_| \___/__/__/\___/\_/\___|_|   \___| .__/_/__/\___/\__,_\___|
                                               |_|                       

                       a lab brought to you by
                     austin adams and cem gokmen
=========================================================================

In this lab, you will implement sumtorial(), a function I just made up
defined as:

                   /  n                     if n == 0 or n == 1
    sumtorial(n) = |
                   \  n + sumtorial(n - 1)  otherwise

Exercise 1. Implement the sumtorial subroutine in LC-3 assembly in
            `sumtorial.asm'. It's a long story, but please do NOT touch
            R4.

            Each time before you test it in complx, run the following
            command, which will run the Makefile:

                $ make runme_to_test_asm.asm

            This will create a new file, `runme_to_test_asm.asm', which
            you can load in Complx and use ``Debug'' > ``Simulate
            Subroutine Call.'' Before proceeding, use ``Simulate
            Subroutine Call'' to test the following three inputs:

            sumtorial(1) = 1
            sumtorial(2) = 3
            sumtorial(6) = 21

            After running your code, to view the result your puts on the
            stack, you can press Control-G and enter `xf000'. That will
            take you to the bottom of the stack, where (in the case of
            the second test case sumtorial(2) = 3, for example), you'll
            see something like this:

             addr | value
            -------------
            xEFFE | 3     <-- return value of your function
            xEFFF | 2     <-- argument pushed by complx
            xF000 | ???

            Make sure these three cases are right before continuing,
            since debugging will be more painful later on.


Exercise 2. Now implement sumtorial again in C in the sumtorial_c() function
            in `main.c'. Much easier, isn't it? This is why God made compilers.

            Now run `make' to compile your code and look inside the
            `main.asm' file it generated. Now answer these two questions
            about `main.asm':

            1. What do you see inside `main.asm'?

            2. Is this a binary yet?


Exercise 3. Finally, let's test our code.

            We've provided a hack that allows you to invoke your
            hand-written assembly sumtorial() solution from C by calling
            sumtorial_asm(). Do NOT write `sumtorial()' or weird things
            will happen and it will be your fault sorry buddy.

            Let's use this hack. Write a loop in main() in `main.c' that
            tests inputs 0 through 32 inclusive for both sumtorial_asm()
            and sumtorial_c(), and prints the results. (Hint: Google
            printf().) The output needs to look something like this:

                sumtorial_asm(0) = 0
                sumtorial_c(0)   = 0
                sumtorial_asm(1) = 1
                sumtorial_c(1)   = 1
                sumtorial_asm(2) = 3
                sumtorial_c(2)   = 3
                ...
                sumtorial_c(30)   = 465
                sumtorial_asm(31) = 496
                sumtorial_c(31)   = 496
                sumtorial_asm(32) = 528
                sumtorial_c(32)   = 528

            To build the final assembly file, run

                $ make

            And open `runme.asm' in Complx using ``File'' > ``Clean
            Load'' (since the compiler is crappy and expects memory to
            be zeroed). Do NOT load with ``File'' > ``Load'' since that
            randomizes memory and this compiler we randomly found on
            github chokes on that.

            When you click ``Run'', you should get the following output
            in the I/O window:

                sumtorial_asm(0) = 0
                sumtorial_c(0)   = 0
                sumtorial_asm(1) = 1
                sumtorial_c(1)   = 1
                sumtorial_asm(2) = 3
                sumtorial_c(2)   = 3
                sumtorial_asm(3) = 6
                sumtorial_c(3)   = 6
                sumtorial_asm(4) = 10
                sumtorial_c(4)   = 10
                sumtorial_asm(5) = 15
                sumtorial_c(5)   = 15
                sumtorial_asm(6) = 21
                sumtorial_c(6)   = 21
                sumtorial_asm(7) = 28
                sumtorial_c(7)   = 28
                sumtorial_asm(8) = 36
                sumtorial_c(8)   = 36
                sumtorial_asm(9) = 45
                sumtorial_c(9)   = 45
                sumtorial_asm(10) = 55
                sumtorial_c(10)   = 55
                sumtorial_asm(11) = 66
                sumtorial_c(11)   = 66
                sumtorial_asm(12) = 78
                sumtorial_c(12)   = 78
                sumtorial_asm(13) = 91
                sumtorial_c(13)   = 91
                sumtorial_asm(14) = 105
                sumtorial_c(14)   = 105
                sumtorial_asm(15) = 120
                sumtorial_c(15)   = 120
                sumtorial_asm(16) = 136
                sumtorial_c(16)   = 136
                sumtorial_asm(17) = 153
                sumtorial_c(17)   = 153
                sumtorial_asm(18) = 171
                sumtorial_c(18)   = 171
                sumtorial_asm(19) = 190
                sumtorial_c(19)   = 190
                sumtorial_asm(20) = 210
                sumtorial_c(20)   = 210
                sumtorial_asm(21) = 231
                sumtorial_c(21)   = 231
                sumtorial_asm(22) = 253
                sumtorial_c(22)   = 253
                sumtorial_asm(23) = 276
                sumtorial_c(23)   = 276
                sumtorial_asm(24) = 300
                sumtorial_c(24)   = 300
                sumtorial_asm(25) = 325
                sumtorial_c(25)   = 325
                sumtorial_asm(26) = 351
                sumtorial_c(26)   = 351
                sumtorial_asm(27) = 378
                sumtorial_c(27)   = 378
                sumtorial_asm(28) = 406
                sumtorial_c(28)   = 406
                sumtorial_asm(29) = 435
                sumtorial_c(29)   = 435
                sumtorial_asm(30) = 465
                sumtorial_c(30)   = 465
                sumtorial_asm(31) = 496
                sumtorial_c(31)   = 496
                sumtorial_asm(32) = 528
                sumtorial_c(32)   = 528

            Show this output and your answers from Exercise 2 to a TA.
            If the output matches, you're done! Good work bud
