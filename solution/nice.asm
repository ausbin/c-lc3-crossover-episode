.orig x8000
nice
; setup
add r6, r6, -1 ; allocate space for RV
add r6, r6, -1 ; allocate space for RA
str r7, r6, 0  ; backup R7 onto stack as RA
add r6, r6, -1 ; allocate space for OFP
str r5, r6, 0  ; backup R5 onto stack as OFP
add r5, r6, -1 ; set frame pointer

add r6, r6, -5 ; allocate space for saved registers
str r0, r5, 0  ; backup r0 to stack
str r1, r5, -1 ; backup r1 to stack
str r2, r5, -2 ; backup r2 to stack
str r3, r5, -3 ; backup r3 to stack
str r4, r5, -4 ; backup r4 to stack

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

and r0, r0, 0 ; r0 = 0
and r1, r1, 0 ; r1 = 0

loop
add r2, r1, -16
add r2, r2, -16
add r2, r2, -16
add r2, r2, -16
add r2, r2, -5
brp return
add r0, r0, r1
add r1, r1, 1
br loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


return
str r0, r5, 3 ; make r0 the return value

; reload registers
ldr r0, r5, 0  ; reload r0 from stack
ldr r1, r5, -1 ; reload r1 from stack
ldr r2, r5, -2 ; reload r2 from stack
ldr r3, r5, -3 ; reload r3 from stack
ldr r4, r5, -4 ; reload r4 from stack

; teardown
add r6, r5, 1 ; pop all locals off the stack
ldr r5, r6, 0 ; reload ofp
add r6, r6, 1 ; pop ofp
ldr r7, r6, 0 ; reload return address
add r6, r6, 1 ; pop ra
; r6 now points to return value
ret
.end
