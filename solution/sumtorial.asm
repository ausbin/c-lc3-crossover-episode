.orig x8000
sumtorial
; setup
add r6, r6, -2
str r7, r6, 0
add r6, r6, -1
str r5, r6, 0
add r5, r6, -1
; n <- arg 0
ldr r0, r5, 4
and r1, r0, -1
brz return
add r0, r0, -1
brz return

add r6, r6, -1
str r0, r6, 0
jsr sumtorial
ldr r1, r6, 0
add r6, r6, 2
ldr r0, r5, 4
add r1, r0, r1

return
str r1, r5, 3
; teardown
add r6, r5, 1
ldr r5, r6, 0
add r6, r6, 1
ldr r7, r6, 0
add r6, r6, 1
ret
.end
