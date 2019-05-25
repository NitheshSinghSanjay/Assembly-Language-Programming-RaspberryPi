.text

.globl main

main:
    mov r0, #5 @ change this num to get diff fib value
    bl _fib

    sub r1, r1
    sub r2, r2
    sub r3, r3

    mov r7, #1
    swi #0

_fib:
    str lr, [sp], #-4

    cmp r0, #2
    movle r0, #1
    ldrle pc, [sp, #4]!

    mov r3, r0
    mov r0, #0
    mov r1, #1
    mov r2, #1

    __loop__:
        cmp r3, #2

        movle r0, r2
        ldrle pc, [sp, #4]!

        add r0, r1
        add r0, r2
        add r1, r2
        add r2, r0
        sub r0, r0

        sub r3, #1
        b __loop__

.end
